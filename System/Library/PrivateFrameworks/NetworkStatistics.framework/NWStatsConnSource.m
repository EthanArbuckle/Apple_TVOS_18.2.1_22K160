@interface NWStatsConnSource
- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4;
- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (NSUUID)euuid;
- (NWStatsConnSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4;
- (id)description;
- (int)epid;
- (void)deriveAttribution:(id)a3;
- (void)populateConnProperties:(id)a3 fromDomainInfo:(nstat_domain_info *)a4;
- (void)setEpid:(int)a3;
- (void)setEuuid:(id)a3;
- (void)significantMetadataChange:(nstat_connection_descriptor *)a3 monitor:(id)a4;
@end

@implementation NWStatsConnSource

- (id)description
{
  p_nstatConnUpdate = &self->_nstatConnUpdate;
  id v4 = objc_alloc(NSString);
  pname = p_nstatConnUpdate->conn_desc.pname;
  v6 = -[NWStatsSource attributedEntity](self, "attributedEntity");
  uint64_t pid = p_nstatConnUpdate->conn_desc.pid;
  euint64_t pid = p_nstatConnUpdate->conn_desc.epid;
  v9 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatConnUpdate->conn_desc.uuid);
  v10 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatConnUpdate->conn_desc.euuid);
  v11 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatConnUpdate->conn_desc.fuuid);
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  dateStringMillisecondsFromReferenceInterval(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)[v4 initWithFormat:@"NWStatsConnSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@", pname, v6, pid, epid, v9, v10, v11, v13];

  return v14;
}

- (void)populateConnProperties:(id)a3 fromDomainInfo:(nstat_domain_info *)a4
{
  id v10 = a3;
  [v10 setIsSilent:a4->var7];
  [v10 setIsTracker:a4->var5];
  [v10 setIsNonAppInitiated:a4->var6];
  if (([v10 isSilent] & 1) == 0)
  {
    if (a4->var0[0])
    {
      v5 = (void *)[objc_alloc(NSString) initWithUTF8String:a4];
      [v10 setDomainName:v5];
    }

    else
    {
      [v10 setDomainName:0];
    }

    if (a4->var1[0])
    {
      v6 = (void *)[objc_alloc(NSString) initWithUTF8String:a4->var1];
      [v10 setDomainOwner:v6];
    }

    else
    {
      [v10 setDomainOwner:0];
    }

    if (a4->var2[0])
    {
      v7 = (void *)[objc_alloc(NSString) initWithUTF8String:a4->var2];
      [v10 setDomainTrackerContext:v7];
    }

    else
    {
      [v10 setDomainTrackerContext:0];
    }

    if (a4->var3[0])
    {
      v8 = (void *)[objc_alloc(NSString) initWithUTF8String:a4->var3];
      [v10 setDomainAttributedBundleId:v8];
    }

    else
    {
      [v10 setDomainAttributedBundleId:0];
    }

    if (a4->var4.var0.sin_len)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&a4->var4 length:a4->var4.var0.sin_len];
      [v10 setRemoteAddress:v9];
    }

    else
    {
      [v10 setRemoteAddress:0];
    }
  }
}

- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  LOBYTE(v5) = 1;
  if ((unint64_t)a4 >= 8 && a3)
  {
    *(void *)&__int128 v4 = 67109634LL;
    __int128 v15 = v4;
    do
    {
      uint64_t var0 = a3->var0;
      int64_t v8 = a4 - 8;
      else {
        int64_t var1 = a4 - 8;
      }
      id v10 = a3 + 1;
      objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", &a3[1], var1, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NStatGetLog();
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v15;
        int v17 = var0;
        __int16 v18 = 2048;
        int64_t v19 = var1;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl( &dword_187FF5000,  v12,  OS_LOG_TYPE_ERROR,  "NWStatsConn Unexpected extended item type: %d, length: %zd contents %@",  buf,  0x1Cu);
      }

      BOOL v5 = -[NWStatsSource handleUnknownExtension:data:](self, "handleUnknownExtension:data:", var0, v11);
      if (!v5) {
        break;
      }
      uint64_t v13 = (var1 + 7) & 0x1FFFFFFF8LL;
      a4 = v8 - v13;
      a3 = (nstat_msg_src_extended_item_hdr *)((char *)v10 + v13);
    }

    while ((unint64_t)(v8 - v13) > 7);
  }

  return v5;
}

- (void)deriveAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "_referenceIntervalWithContinuousTime:",  self->_nstatConnUpdate.conn_desc.start_timestamp);
  -[NWStatsSource setCreationTimestamp:](self, "setCreationTimestamp:");
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatConnUpdate.conn_desc.uuid);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatConnUpdate.conn_desc.euuid);
  [v4 bestIdentifierForUUID:v5 EUUID:v6 pid:self->_nstatConnUpdate.conn_desc.pid epid:self->_nstatConnUpdate.conn_desc.epid procname:self->_nstatConnUpdate.conn_desc.pname derivation:(char *)&v13 + 4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource setAttributedEntity:](self, "setAttributedEntity:", v7);
  -[NWStatsSource setAttributionReason:](self, "setAttributionReason:", HIDWORD(v13));
  if (HIDWORD(v13) == 2)
  {
    [v4 extensionNameForUUID:v6];
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setAttributedExtension:](self, "setAttributedExtension:", v8);
  }

  if (*(void *)self->_nstatConnUpdate.conn_desc.uuid != *(void *)self->_nstatConnUpdate.conn_desc.euuid
    || *(void *)&self->_nstatConnUpdate.conn_desc.uuid[8] != *(void *)&self->_nstatConnUpdate.conn_desc.euuid[8])
  {
    [v4 bestIdentifierForUUID:v5 EUUID:0 pid:self->_nstatConnUpdate.conn_desc.pid epid:0 procname:self->_nstatConnUpdate.conn_desc.pname derivation:&v13];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setDelegateName:](self, "setDelegateName:", v10);
  }

  -[NWStatsSource setDelegateAttributionReason:](self, "setDelegateAttributionReason:", HIDWORD(v13));
  if ([v4 debugMode])
  {
    [v4 allIdentifiersForUUID:v5 EUUID:v6 pid:self->_nstatConnUpdate.conn_desc.pid epid:self->_nstatConnUpdate.conn_desc.epid procname:self->_nstatConnUpdate.conn_desc.pname];
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    lookupResults = self->_lookupResults;
    self->_lookupResults = v11;
  }
}

- (NWStatsConnSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NWStatsConnSource;
  v9 = -[NWStatsConnSource init](&v13, sel_init);
  id v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatConnUpdate, a3, sizeof(v9->_nstatConnUpdate));
    -[NWStatsSource setFlowFlags:]( v10,  "setFlowFlags:",  -[NWStatsSource flagsForProvider:](v10, "flagsForProvider:", v10->_nstatConnUpdate.provider));
    -[NWStatsConnSource deriveAttribution:](v10, "deriveAttribution:", v8);
    uint64_t v11 = [v8 currentForegroundStateForProcessWithPid:v10->_nstatConnUpdate.conn_desc.epid];
    -[NWStatsSource setStartAppStateIsForeground:](v10, "setStartAppStateIsForeground:", v11);
    -[NWStatsSource setUpdateAppStateIsForeground:](v10, "setUpdateAppStateIsForeground:", v11);
    if (a3->hdr.hdr.type == 10007) {
      -[NWStatsConnSource processExtendedUpdate:length:]( v10,  "processExtendedUpdate:length:",  &a3->var0.conn + 1,  a4 - 352);
    }
  }

  return v10;
}

- (void)significantMetadataChange:(nstat_connection_descriptor *)a3 monitor:(id)a4
{
  id v13 = a4;
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  double v12 = v6;
  if (a3->pid == self->_nstatConnUpdate.conn_desc.pid)
  {
    int v7 = 0;
  }

  else
  {
    id v8 = v6;
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v9 forKeyedSubscript:@"newPid"];

    int v7 = 0x8000;
  }

  if (a3->epid == self->_nstatConnUpdate.conn_desc.epid) {
    int v10 = v7;
  }
  else {
    int v10 = v7 | 0x10000;
  }
  if (uuid_compare(a3->uuid, self->_nstatConnUpdate.conn_desc.uuid)) {
    v10 |= 0x1000u;
  }
  if (uuid_compare(a3->euuid, self->_nstatConnUpdate.conn_desc.euuid))
  {
    if (uuid_compare(self->_nstatConnUpdate.conn_desc.uuid, self->_nstatConnUpdate.conn_desc.euuid)) {
      v10 |= 0x2000u;
    }
    else {
      v10 |= 0x4000u;
    }
  }

  if (memcmp(a3->pname, self->_nstatConnUpdate.conn_desc.pname, 0x40uLL)) {
    v10 |= 0x200000u;
  }
  if ((v10 & 0xFFFFF000) != 0)
  {
    LODWORD(v11) = a3->epid;
    -[NWStatsSource logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:]( self,  "logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:",  self->_nstatConnUpdate.srcref,  self->_nstatConnUpdate.conn_desc.pname,  a3->pname,  self->_nstatConnUpdate.conn_desc.pid,  a3->pid,  self->_nstatConnUpdate.conn_desc.epid,  v11,  self->_nstatConnUpdate.conn_desc.uuid,  a3->uuid,  self->_nstatConnUpdate.conn_desc.euuid,  a3->euuid,  v13,  v12);
    -[NWStatsConnSource deriveAttribution:](self, "deriveAttribution:", v13);
  }

  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") | v10);
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  unsigned int type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatConnUpdate, 0xC8uLL))
  {
    BOOL v10 = 0;
  }

  else
  {
    if (a3->var0.route.dst.v6.sin6_addr.__u6_addr32[0] != self->_nstatConnUpdate.conn_desc.pid
      || a3->var0.route.dst.v6.sin6_addr.__u6_addr32[1] != self->_nstatConnUpdate.conn_desc.epid
      || uuid_compare(a3->var0.conn.uuid, self->_nstatConnUpdate.conn_desc.uuid)
      || uuid_compare(&a3->var0.tcp.local.v4.sin_len, self->_nstatConnUpdate.conn_desc.euuid))
    {
      -[NWStatsConnSource significantMetadataChange:monitor:](self, "significantMetadataChange:monitor:", &a3->var0, v8);
    }

    -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatConnUpdate.counts);
    memcpy(&self->_nstatConnUpdate, a3, sizeof(self->_nstatConnUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:]( self,  "setUpdateAppStateIsForeground:",  [v8 currentForegroundStateForProcessWithPid:a3->var0.route.dst.v6.sin6_addr.__u6_addr32[1]]);
    BOOL v10 = type != 10007
       || -[NWStatsConnSource processExtendedUpdate:length:]( self,  "processExtendedUpdate:length:",  &a3->var0.conn + 1,  a4 - 352);
  }

  return v10;
}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int v7 = objc_alloc(&OBJC_CLASS___NWStatsConnSnapshot);
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  v9 = -[NWStatsConnSnapshot initWithConnUpdate:startTime:flowFlags:]( v7,  "initWithConnUpdate:startTime:flowFlags:",  &self->_nstatConnUpdate,  -[NWStatsSource flowFlags](self, "flowFlags"),  v8);
  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") & 0xFFC00FFFLL);
  -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatConnUpdate.counts);
  -[NWStatsSnapshot setSnapshotReason:](v9, "setSnapshotReason:", v5);
  -[NWStatsSnapshot setFirstOccurrence:](v9, "setFirstOccurrence:", v4);
  -[NWStatsSource attributedEntity](self, "attributedEntity");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = -[NWStatsSource attributionReason](self, "attributionReason");
  -[NWStatsSource delegateName](self, "delegateName");
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = -[NWStatsSource delegateAttributionReason](self, "delegateAttributionReason");
  v14 = -[NWStatsSource attributedExtension](self, "attributedExtension");
  -[NWStatsSnapshot setAttribution:derivation:delegateName:delegateDerivation:extensionName:]( v9,  "setAttribution:derivation:delegateName:delegateDerivation:extensionName:",  v10,  v11,  v12,  v13,  v14);

  -[NWStatsSnapshot setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:]( v9,  "setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:",  -[NWStatsSource updateAppStateIsForeground](self, "updateAppStateIsForeground"),  -[NWStatsSource updateScreenStateOn](self, "updateScreenStateOn"),  -[NWStatsSource startAppStateIsForeground](self, "startAppStateIsForeground"),  -[NWStatsSource startScreenStateOn](self, "startScreenStateOn"));
  if (self->_lookupResults)
  {
    __int128 v15 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:self->_lookupResults];
    -[NWStatsSnapshot setLookupResults:](v9, "setLookupResults:", v15);
  }
  v16 = -[NWStatsSource extensions](self, "extensions");
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x189603F68]);
    -[NWStatsSource extensions](self, "extensions");
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v19 = (void *)[v17 initWithDictionary:v18];
    -[NWStatsSnapshot setExtensions:](v9, "setExtensions:", v19);
  }

  -[NWStatsConnSnapshot setCurrentProperties:](v9, "setCurrentProperties:", self->_currentProperties);
  -[NWStatsConnSnapshot setAncestralProperties:](v9, "setAncestralProperties:", self->_ancestralProperties);
  currentProperties = self->_currentProperties;
  self->_currentProperties = 0LL;

  ancestralProperties = self->_ancestralProperties;
  self->_ancestralProperties = 0LL;

  return v9;
}

- (int)epid
{
  return self->_epid;
}

- (void)setEpid:(int)a3
{
  self->_euint64_t pid = a3;
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (void)setEuuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end