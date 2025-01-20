@interface NWStatsConnSnapshot
- (BOOL)hasNetAccess;
- (BOOL)isNonAppInitiated;
- (BOOL)isSilent;
- (BOOL)isTracker;
- (NSData)ancestralParametersTLV;
- (NSData)parametersTLV;
- (NSData)remoteAddress;
- (NSDate)connSnapshotTimestamp;
- (NSDate)connStartTimestamp;
- (NSUUID)cuuid;
- (NSUUID)flowuuid;
- (NSUUID)puuid;
- (NWStatsConnProperties)ancestralProperties;
- (NWStatsConnProperties)currentProperties;
- (NWStatsConnSnapshot)initWithConnUpdate:(const nstat_msg_src_update_conn *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5;
- (double)connDuration;
- (double)connSnapshotTimeIntervalSince1970;
- (double)connSnapshotTimeIntervalSinceReferenceDate;
- (double)connStartTimeIntervalSince1970;
- (double)connStartTimeIntervalSinceReferenceDate;
- (id)_connDescriptorDictionaryForm:(nstat_connection_descriptor *)a3;
- (id)description;
- (id)dictionaryForm;
- (id)domainAttributedBundleId;
- (id)domainName;
- (id)domainOwner;
- (id)domainTrackerContext;
- (id)euuid;
- (id)processName;
- (id)provider;
- (id)snapshotType;
- (id)snapshotTypeLowerCase;
- (id)uuid;
- (int)epid;
- (int)processID;
- (unint64_t)connStartContinuousTime;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)sourceIdentifier;
- (unint64_t)uniqueProcessID;
- (unsigned)personaID;
- (unsigned)remotePort;
- (unsigned)uid;
- (void)setAncestralProperties:(id)a3;
- (void)setCurrentProperties:(id)a3;
- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3;
@end

@implementation NWStatsConnSnapshot

- (id)description
{
  if (-[NWStatsSnapshot snapshotReason](self, "snapshotReason") == 4)
  {
    if ((-[NWStatsConnSnapshot eventFlags](self, "eventFlags") & 0x4000) != 0)
    {
      v4 = @"(flowUUID-assigned)";
    }

    else
    {
      __int16 v3 = -[NWStatsConnSnapshot eventFlags](self, "eventFlags");
      v4 = @"(flowUUID-changed)";
      if ((v3 & 0x8000) == 0) {
        v4 = @"?";
      }
    }
  }

  else
  {
    v4 = &stru_18A1B7BD8;
  }

  v5 = (objc_class *)NSString;
  v21 = v4;
  id v22 = objc_alloc(v5);
  v20 = -[NWStatsConnSnapshot processName](self, "processName");
  unint64_t v19 = -[NWStatsConnSnapshot sourceIdentifier](self, "sourceIdentifier");
  v18 = -[NWStatsSnapshot snapshotReasonString](self, "snapshotReasonString");
  BOOL v17 = -[NWStatsConnSnapshot hasNetAccess](self, "hasNetAccess");
  v26 = -[NWStatsConnSnapshot uuid](self, "uuid");
  v16 = -[NWStatsConnSnapshot euuid](self, "euuid");
  v25 = -[NWStatsConnSnapshot cuuid](self, "cuuid");
  v24 = -[NWStatsConnSnapshot puuid](self, "puuid");
  v15 = -[NWStatsConnSnapshot flowuuid](self, "flowuuid");
  v6 = -[NWStatsConnSnapshot domainName](self, "domainName");
  v7 = -[NWStatsConnSnapshot domainOwner](self, "domainOwner");
  v14 = -[NWStatsConnSnapshot domainTrackerContext](self, "domainTrackerContext");
  v8 = -[NWStatsConnSnapshot domainAttributedBundleId](self, "domainAttributedBundleId");
  BOOL v9 = -[NWStatsConnSnapshot isSilent](self, "isSilent");
  v10 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  v11 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v12 = -[NWStatsSnapshot extensions](self, "extensions");
  v23 = (void *)[v22 initWithFormat:@"%@ conn id %lld (%@) %@ net-access %d uuid %@ euuid %@ cuuid %@ puuid %@ fuuid %@ domain name %@ owner %@ context %@ attributed %@ silent %d current %@ ancestral %@ extensions %@", v20, v19, v18, v21, v17, v26, v16, v25, v24, v15, v6, v7, v14, v8, v9, v10, v11, v12];

  return v23;
}

- (NWStatsConnProperties)currentProperties
{
  return self->_currentProperties;
}

- (void)setCurrentProperties:(id)a3
{
}

- (NWStatsConnProperties)ancestralProperties
{
  return self->_ancestralProperties;
}

- (void)setAncestralProperties:(id)a3
{
}

- (unint64_t)sourceIdentifier
{
  return self->_nstat_update.srcref;
}

- (id)snapshotType
{
  return @"Conn";
}

- (id)snapshotTypeLowerCase
{
  return @"conn";
}

- (id)provider
{
  return @"Conn";
}

- (unint64_t)eventFlags
{
  return self->_nstat_update.event_flags;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor->upid;
}

- (int)processID
{
  return self->_descriptor->pid;
}

- (unsigned)personaID
{
  return self->_descriptor->persona_id;
}

- (unsigned)uid
{
  return self->_descriptor->uid;
}

- (unint64_t)eupid
{
  return self->_descriptor->eupid;
}

- (int)epid
{
  return self->_descriptor->epid;
}

- (id)processName
{
  processName = self->_processName;
  if (!processName)
  {
    v4 = (NSString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%.64s",  self->_descriptor->pname);
    v5 = self->_processName;
    self->_processName = v4;

    processName = self->_processName;
  }

  return processName;
}

- (id)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->uuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }

  return uuid;
}

- (id)euuid
{
  euuid = self->_euuid;
  if (!euuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->euuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_euuid;
    self->_euuid = v4;

    euuid = self->_euuid;
  }

  return euuid;
}

- (NSUUID)puuid
{
  puuid = self->_puuid;
  if (!puuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->puuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_puuid;
    self->_puuid = v4;

    puuid = self->_puuid;
  }

  return puuid;
}

- (NSUUID)cuuid
{
  cuuid = self->_cuuid;
  if (!cuuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->cuuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cuuid;
    self->_cuuid = v4;

    cuuid = self->_cuuid;
  }

  return cuuid;
}

- (NSUUID)flowuuid
{
  flowuuid = self->_flowuuid;
  if (!flowuuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->fuuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_flowuuid;
    self->_flowuuid = v4;

    flowuuid = self->_flowuuid;
  }

  return flowuuid;
}

- (id)domainName
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    [v4 domainName];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    if (v4)
    {
      v6 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      [v6 domainName];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = 0LL;
    }
  }

  return v5;
}

- (id)domainOwner
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    [v4 domainOwner];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    if (v4)
    {
      v6 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      [v6 domainOwner];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = 0LL;
    }
  }

  return v5;
}

- (id)domainTrackerContext
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    [v4 domainTrackerContext];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    if (v4)
    {
      v6 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      [v6 domainTrackerContext];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = 0LL;
    }
  }

  return v5;
}

- (id)domainAttributedBundleId
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    [v4 domainAttributedBundleId];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    if (v4)
    {
      v6 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      [v6 domainAttributedBundleId];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = 0LL;
    }
  }

  return v5;
}

- (BOOL)isTracker
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[NWStatsConnSnapshot currentProperties](self, "currentProperties"),
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    if ([v6 isTracker])
    {
      char v7 = 1;
    }

    else
    {
      v11 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      char v7 = [v11 isTracker];
    }
  }

  else
  {
    uint64_t v8 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    if (v8)
    {
      v5 = (void *)v8;
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v10 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      if (!v10)
      {
        char v7 = 0;
        goto LABEL_12;
      }

      v5 = (void *)v10;
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v6 = v9;
    char v7 = [v9 isTracker];
  }

LABEL_12:
  return v7;
}

- (BOOL)isNonAppInitiated
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 isNonAppInitiated];
  }

  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      char v5 = [v6 isNonAppInitiated];
    }

    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isSilent
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 isSilent];
  }

  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      char v5 = [v6 isSilent];
    }

    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSData)remoteAddress
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    uint64_t v5 = [v2 remoteAddress];
    if (v5)
    {
      v6 = (void *)v5;
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      char v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 remoteAddress];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_9;
    }
  }

  -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 remoteAddress];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return (NSData *)v8;
}

- (unsigned)remotePort
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    uint64_t v5 = [v2 remoteAddress];
    if (v5)
    {
      v6 = (void *)v5;
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      char v7 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned __int16 v8 = [v7 remotePort];

LABEL_8:
      goto LABEL_9;
    }
  }

  -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int16 v8 = [v10 remotePort];
  }

  else
  {
    unsigned __int16 v8 = 0;
  }

  if (v4) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (BOOL)hasNetAccess
{
  return HIBYTE(self->_descriptor->ifnet_properties) & 1;
}

- (unint64_t)connStartContinuousTime
{
  return self->_descriptor->start_timestamp;
}

- (double)connDuration
{
  return result;
}

- (NSDate)connStartTimestamp
{
  startTimestamp = self->_startTimestamp;
  if (!startTimestamp)
  {
    uint64_t v4 = (void *)MEMORY[0x189603F50];
    -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_startTimestamp;
    self->_startTimestamp = v5;

    startTimestamp = self->_startTimestamp;
  }

  return startTimestamp;
}

- (NSDate)connSnapshotTimestamp
{
  snapshotTimestamp = self->_snapshotTimestamp;
  if (!snapshotTimestamp)
  {
    uint64_t v4 = (void *)MEMORY[0x189603F50];
    -[NWStatsConnSnapshot connSnapshotTimeIntervalSinceReferenceDate]( self,  "connSnapshotTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_snapshotTimestamp;
    self->_snapshotTimestamp = v5;

    snapshotTimestamp = self->_snapshotTimestamp;
  }

  return snapshotTimestamp;
}

- (double)connStartTimeIntervalSinceReferenceDate
{
  double result = self->_startTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "_referenceIntervalWithContinuousTime:",  self->_descriptor->start_timestamp);
    self->_startTimeInterval = result;
  }

  return result;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_snapshotTimeInterval = a3;
}

- (double)connSnapshotTimeIntervalSinceReferenceDate
{
  double result = self->_snapshotTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "_referenceIntervalWithContinuousTime:",  self->_descriptor->timestamp);
    self->_snapshotTimeInterval = result;
  }

  return result;
}

- (double)connStartTimeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (double)connSnapshotTimeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (NSData)parametersTLV
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:2];
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSData)ancestralParametersTLV
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:3];
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NWStatsConnSnapshot)initWithConnUpdate:(const nstat_msg_src_update_conn *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NWStatsConnSnapshot;
  unsigned __int16 v8 = -[NWStatsConnSnapshot init](&v11, sel_init);
  BOOL v9 = v8;
  if (v8)
  {
    v8->_flags = a5;
    memcpy(&v8->_nstat_update, a3, sizeof(v8->_nstat_update));
    v9->_descriptor = &v9->_nstat_update.conn_desc;
    v9->_startTimeInterval = a4;
  }

  return v9;
}

- (id)_connDescriptorDictionaryForm:(nstat_connection_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->upid];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->start_timestamp];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"start_timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->timestamp];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->pid];
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"pid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->eupid];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:@"eupid"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->epid];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"epid"];

  [NSString stringWithUTF8String:a3->pname];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"pname"];

  v12 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->cuuid];
  [v12 UUIDString];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"cuuid"];

  v14 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->fuuid];
  [v14 UUIDString];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"fuuid"];

  v16 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->uuid];
  [v16 UUIDString];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:@"uuid"];

  v18 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->euuid];
  [v18 UUIDString];
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v19 forKeyedSubscript:@"euuid"];

  v20 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->puuid];
  [v20 UUIDString];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v21 forKeyedSubscript:@"puuid"];

  return v4;
}

- (id)dictionaryForm
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = (void *)MEMORY[0x189607968];
  -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
  *(float *)&double v5 = v5;
  [v4 numberWithFloat:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:@"_startStamp"];

  char v7 = (void *)MEMORY[0x189607968];
  -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
  [v7 numberWithUnsignedLongLong:(unint64_t)(v8 * 1000000.0)];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKeyedSubscript:@"_startStampUsecs"];

  uint64_t v10 = (void *)MEMORY[0x189607968];
  -[NWStatsConnSnapshot connSnapshotTimeIntervalSinceReferenceDate](self, "connSnapshotTimeIntervalSinceReferenceDate");
  [v10 numberWithUnsignedLongLong:(unint64_t)(v11 * 1000000.0)];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKeyedSubscript:@"_snapStampUsecs"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_flags];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKeyedSubscript:@"_flags"];
  v14 = -[NWStatsSnapshot attributedEntity](self, "attributedEntity");
  if (v14)
  {
    [v3 setObject:v14 forKeyedSubscript:@"attributedEntity"];
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v15 forKeyedSubscript:@"attributedEntity"];
  }
  v16 = -[NWStatsSnapshot delegateName](self, "delegateName");
  if (v16)
  {
    [v3 setObject:v16 forKeyedSubscript:@"delegateName"];
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v17 forKeyedSubscript:@"delegateName"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[NWStatsSnapshot attributionReason](self, "attributionReason"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v18 forKeyedSubscript:@"attributionReason"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[NWStatsSnapshot snapshotReason](self, "snapshotReason"));
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v19 forKeyedSubscript:@"snapshotReason"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWStatsSnapshot startAppStateIsForeground](self, "startAppStateIsForeground"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v20 forKeyedSubscript:@"startAppStateIsForeground"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWStatsSnapshot snapshotAppStateIsForeground](self, "snapshotAppStateIsForeground"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v21 forKeyedSubscript:@"snapshotAppStateIsForeground"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsSnapshot startScreenStateOn](self, "startScreenStateOn"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v22 forKeyedSubscript:@"startScreenStateOn"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsSnapshot snapshotScreenStateOn](self, "snapshotScreenStateOn"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v23 forKeyedSubscript:@"snapshotScreenStateOn"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v24 forKeyedSubscript:@"delegateAttributionReason"];

  id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_nstat_update.srcref];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setObject:v26 forKeyedSubscript:@"srcref"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_nstat_update.event_flags];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setObject:v27 forKeyedSubscript:@"event_flags"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nstat_update.provider];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setObject:v28 forKeyedSubscript:@"provider"];

  id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_nstat_update.hdr.context];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setObject:v30 forKeyedSubscript:@"context"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nstat_update.hdr.type];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setObject:v31 forKeyedSubscript:@"type"];

  [MEMORY[0x189607968] numberWithUnsignedShort:self->_nstat_update.hdr.length];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setObject:v32 forKeyedSubscript:@"length"];

  [MEMORY[0x189607968] numberWithUnsignedShort:self->_nstat_update.hdr.flags];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setObject:v33 forKeyedSubscript:@"flags"];

  [v25 setObject:v29 forKeyedSubscript:@"hdr"];
  v34 = -[NWStatsConnSnapshot _connDescriptorDictionaryForm:](self, "_connDescriptorDictionaryForm:", self->_descriptor);
  [v25 setObject:v34 forKeyedSubscript:@"conn_descriptor"];

  [v3 setObject:v25 forKeyedSubscript:@"update"];
  return v3;
}

- (void).cxx_destruct
{
}

@end