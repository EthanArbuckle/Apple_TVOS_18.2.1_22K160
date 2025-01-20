@interface NWSQUICSnapshot
- (BOOL)countsIncludeHeaderOverhead;
- (BOOL)interfaceAWDL;
- (BOOL)interfaceCellular;
- (BOOL)interfaceCellularViaFallback;
- (BOOL)interfaceCellularViaPreferredFallback;
- (BOOL)interfaceCompanionLink;
- (BOOL)interfaceExpensive;
- (BOOL)interfaceLoopback;
- (BOOL)interfaceUnknown;
- (BOOL)interfaceWifi;
- (BOOL)interfaceWired;
- (NWSQUICSnapshot)initWithCounts:(const nstat_counts *)a3 QUICDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8;
- (double)flowDuration;
- (double)rttAverage;
- (double)rttMinimum;
- (double)rttVariation;
- (id)description;
- (id)euuid;
- (id)flowStartTimestamp;
- (id)fuuid;
- (id)localAddress;
- (id)processName;
- (id)provider;
- (id)remoteAddress;
- (id)traditionalDictionary;
- (id)uuid;
- (id)vuuid;
- (int)epid;
- (int)processID;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)flowStartContinuousTime;
- (unint64_t)networkActivityMapPart1;
- (unint64_t)networkActivityMapPart2;
- (unint64_t)networkActivityMapStartTime;
- (unint64_t)uniqueProcessID;
- (unsigned)interfaceIndex;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)trafficClass;
@end

@implementation NWSQUICSnapshot

- (id)provider
{
  return @"QUIC";
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor.rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor.rcvbufused;
}

- (unsigned)trafficClass
{
  return self->_descriptor.traffic_class;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor.upid;
}

- (int)processID
{
  return self->_descriptor.pid;
}

- (unint64_t)eupid
{
  return self->_descriptor.eupid;
}

- (int)epid
{
  return self->_descriptor.epid;
}

- (id)processName
{
  processName = self->_processName;
  if (!processName)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.64s", self->_descriptor.pname);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
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
    v4 = -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.uuid);
    [v4 UUIDString];
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }

  return uuid;
}

- (id)euuid
{
  euuid = self->_euuid;
  if (!euuid)
  {
    v4 = -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.euuid);
    [v4 UUIDString];
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_euuid;
    self->_euuid = v5;

    euuid = self->_euuid;
  }

  return euuid;
}

- (id)fuuid
{
  fuuid = self->_fuuid;
  if (!fuuid)
  {
    v4 = -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.fuuid);
    [v4 UUIDString];
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_fuuid;
    self->_fuuid = v5;

    fuuid = self->_fuuid;
  }

  return fuuid;
}

- (id)vuuid
{
  vuuid = self->_vuuid;
  if (!vuuid)
  {
    v4 = -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.vuuid);
    [v4 UUIDString];
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_vuuid;
    self->_vuuid = v5;

    vuuid = self->_vuuid;
  }

  return vuuid;
}

- (id)localAddress
{
  if (!self->_localAddress)
  {
    if (self->_descriptor.local.v4.sin_len) {
      v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor.local length:self->_descriptor.local.v4.sin_len];
    }
    else {
      v3 = 0LL;
    }
    localAddress = self->_localAddress;
    self->_localAddress = v3;
  }

  return self->_localAddress;
}

- (id)remoteAddress
{
  if (!self->_remoteAddress)
  {
    if (self->_descriptor.remote.v4.sin_len) {
      v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor.remote length:self->_descriptor.remote.v4.sin_len];
    }
    else {
      v3 = 0LL;
    }
    remoteAddress = self->_remoteAddress;
    self->_remoteAddress = v3;
  }

  return self->_remoteAddress;
}

- (id)flowStartTimestamp
{
  return -[NWSProtocolSnapshot _dateWithContinuousTime:]( self,  "_dateWithContinuousTime:",  self->_descriptor.start_timestamp);
}

- (unint64_t)flowStartContinuousTime
{
  return self->_descriptor.start_timestamp;
}

- (double)flowDuration
{
  return result;
}

- (BOOL)interfaceUnknown
{
  return self->_descriptor.ifnet_properties & 1 | ((self->_descriptor.ifnet_properties & 0x21E) == 0);
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceCellularViaFallback
{
  return (~self->_descriptor.ifnet_properties & 0x104) == 0 && (self->_descriptor.fallback_mode & 0xFE) == 2;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return (~self->_descriptor.ifnet_properties & 0x104) == 0 && self->_descriptor.fallback_mode == 4;
}

- (BOOL)interfaceWifi
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 3) & 1;
}

- (BOOL)interfaceWired
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 4) & 1;
}

- (BOOL)interfaceAWDL
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 5) & 1;
}

- (BOOL)interfaceExpensive
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 6) & 1;
}

- (BOOL)interfaceCompanionLink
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 1) & 1;
}

- (BOOL)countsIncludeHeaderOverhead
{
  return self->_provider == 8;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_descriptor.activity_bitmap.start;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_descriptor.activity_bitmap.bitmap[0];
}

- (unint64_t)networkActivityMapPart2
{
  return self->_descriptor.activity_bitmap.bitmap[1];
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (id)traditionalDictionary
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___NWSQUICSnapshot;
  v3 = -[NWSSnapshot _createCountsForProvider:](&v52, sel__createCountsForProvider_, 8LL);
  v4 = v3;
  if (!v3) {
    goto LABEL_34;
  }
  [v3 setObject:kNStatProviderUDP forKeyedSubscript:kNStatSrcKeyProvider];
  v5 = -[NWSQUICSnapshot localAddress](self, "localAddress");
  if (v5)
  {
    v6 = (void *)MEMORY[0x189603F48];
    v7 = -[NWSQUICSnapshot localAddress](self, "localAddress");
    [v6 dataWithData:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKeyedSubscript:kNStatSrcKeyLocal];
  }
  v9 = -[NWSQUICSnapshot remoteAddress](self, "remoteAddress");
  if (v9)
  {
    v10 = (void *)MEMORY[0x189603F48];
    v11 = -[NWSQUICSnapshot remoteAddress](self, "remoteAddress");
    [v10 dataWithData:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v12 forKeyedSubscript:kNStatSrcKeyRemote];
  }

  p_descriptor = &self->_descriptor;
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.ifindex];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:kNStatSrcKeyInterface];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.pid];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:kNStatSrcKeyPID];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_descriptor.upid];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v16 forKeyedSubscript:kNStatSrcKeyUPID];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.epid];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:kNStatSrcKeyEPID];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_descriptor.eupid];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v18 forKeyedSubscript:kNStatSrcKeyEUPID];
  v19 = -[NWSQUICSnapshot uuid](self, "uuid");
  if (v19)
  {
    v20 = (void *)NSString;
    v21 = -[NWSQUICSnapshot uuid](self, "uuid");
    [v20 stringWithString:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:kNStatSrcKeyUUID];
  }
  v23 = -[NWSQUICSnapshot euuid](self, "euuid");
  if (v23)
  {
    v24 = (void *)NSString;
    v25 = -[NWSQUICSnapshot euuid](self, "euuid");
    [v24 stringWithString:v25];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v26 forKeyedSubscript:kNStatSrcKeyEUUID];
  }
  v27 = -[NWSQUICSnapshot fuuid](self, "fuuid");
  if (v27)
  {
    v28 = (void *)NSString;
    v29 = -[NWSQUICSnapshot fuuid](self, "fuuid");
    [v28 stringWithString:v29];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v30 forKeyedSubscript:kNStatSrcKeyFUUID];
  }
  v31 = -[NWSQUICSnapshot vuuid](self, "vuuid");
  if (v31)
  {
    v32 = (void *)NSString;
    v33 = -[NWSQUICSnapshot vuuid](self, "vuuid");
    [v32 stringWithString:v33];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v34 forKeyedSubscript:kNStatSrcKeyVUUID];
  }
  v35 = -[NWSQUICSnapshot processName](self, "processName");
  if (v35)
  {
    v36 = (void *)NSString;
    v37 = -[NWSQUICSnapshot processName](self, "processName");
    [v36 stringWithString:v37];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v38 forKeyedSubscript:kNStatSrcKeyProcessName];
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.rcvbufsize];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v39 forKeyedSubscript:kNStatSrcKeyRcvBufSize];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.rcvbufused];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v40 forKeyedSubscript:kNStatSrcKeyRcvBufUsed];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.traffic_class];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v41 forKeyedSubscript:kNStatSrcKeyTrafficClass];

  unsigned int ifnet_properties = self->_descriptor.ifnet_properties;
  if ((ifnet_properties & 8) != 0)
  {
    v44 = &kNStatSrcKeyInterfaceTypeWiFi;
LABEL_24:
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:*v44];
    goto LABEL_25;
  }

  if ((ifnet_properties & 4) == 0)
  {
    v43 = &kNStatSrcKeyInterfaceTypeLoopback;
    if ((ifnet_properties & 2) == 0) {
      v43 = &kNStatSrcKeyInterfaceTypeUnknown;
    }
    if ((ifnet_properties & 0x10) != 0) {
      v44 = &kNStatSrcKeyInterfaceTypeWired;
    }
    else {
      v44 = v43;
    }
    goto LABEL_24;
  }

  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:kNStatSrcKeyInterfaceTypeCellular];
  if ((self->_descriptor.ifnet_properties & 0x100) != 0)
  {
    unsigned int v51 = self->_descriptor.fallback_mode - 2;
    if (v51 < 3)
    {
      v44 = off_18A1B6AC0[(char)v51];
      goto LABEL_24;
    }
  }

- (id)description
{
  __ret = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NWSQUICSnapshot;
  v3 = -[NWSSnapshot description](&v7, sel_description);
  v4 = (_printf_domain *)printf_domain();
  asxprintf( &__ret,  v4,  0LL,  "NWQUICSnapshot %N<->%N@%I %@",  &self->_descriptor.local,  &self->_descriptor.remote,  self->_descriptor.ifindex,  v3);
  if (__ret)
  {
    [NSString stringWithCString:__ret encoding:4];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(__ret);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (NWSQUICSnapshot)initWithCounts:(const nstat_counts *)a3 QUICDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NWSQUICSnapshot;
  v11 = -[NWSSnapshot _initWithCounts:sourceIdent:seqno:](&v14, sel__initWithCounts_sourceIdent_seqno_, a3, a5, a7);
  v12 = v11;
  if (v11)
  {
    memcpy(&v11->_descriptor, a4, sizeof(v11->_descriptor));
    v12->_provider = a8;
    v12->_eventFlags = a6;
  }

  return v12;
}

- (double)rttMinimum
{
  return self->_rttMinimum;
}

- (double)rttAverage
{
  return self->_rttAverage;
}

- (double)rttVariation
{
  return self->_rttVariation;
}

- (void).cxx_destruct
{
}

@end