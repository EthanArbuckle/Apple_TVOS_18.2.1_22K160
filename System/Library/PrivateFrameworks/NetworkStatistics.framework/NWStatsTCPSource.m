@interface NWStatsTCPSource
- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (NWStatsTCPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5;
- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4;
- (id)description;
- (void)deriveAttribution:(id)a3;
- (void)significantMetadataChange:(nstat_tcp_descriptor *)a3 monitor:(id)a4;
@end

@implementation NWStatsTCPSource

- (id)description
{
  p_nstatTCPUpdate = &self->_nstatTCPUpdate;
  id v4 = objc_alloc(NSString);
  pname = p_nstatTCPUpdate->tcp_desc.pname;
  v6 = -[NWStatsSource attributedEntity](self, "attributedEntity");
  uint64_t pid = p_nstatTCPUpdate->tcp_desc.pid;
  euint64_t pid = p_nstatTCPUpdate->tcp_desc.epid;
  v9 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatTCPUpdate->tcp_desc.uuid);
  v10 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatTCPUpdate->tcp_desc.euuid);
  v11 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatTCPUpdate->tcp_desc.fuuid);
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  dateStringMillisecondsFromReferenceInterval(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)[v4 initWithFormat:@"NWStatsTCPSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@", pname, v6, pid, epid, v9, v10, v11, v13];

  return v14;
}

- (void)deriveAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  v5 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatTCPUpdate.tcp_desc.uuid);
  v6 = -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatTCPUpdate.tcp_desc.euuid);
  [v4 bestIdentifierForUUID:v5 EUUID:v6 pid:self->_nstatTCPUpdate.tcp_desc.pid epid:self->_nstatTCPUpdate.tcp_desc.epid procname:self->_nstatTCPUpdate.tcp_desc.pname derivation:(char *)&v14 + 4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource setAttributedEntity:](self, "setAttributedEntity:", v7);
  -[NWStatsSource setAttributionReason:](self, "setAttributionReason:", HIDWORD(v14));
  if (HIDWORD(v14) == 2)
  {
    [v4 extensionNameForUUID:v6];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setAttributedExtension:](self, "setAttributedExtension:", v8);
  }

  if (*(void *)self->_nstatTCPUpdate.tcp_desc.uuid == *(void *)self->_nstatTCPUpdate.tcp_desc.euuid
    && *(void *)&self->_nstatTCPUpdate.tcp_desc.uuid[8] == *(void *)&self->_nstatTCPUpdate.tcp_desc.euuid[8])
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    [v4 bestIdentifierForUUID:v5 EUUID:0 pid:self->_nstatTCPUpdate.tcp_desc.pid epid:0 procname:self->_nstatTCPUpdate.tcp_desc.pname derivation:&v14];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setDelegateName:](self, "setDelegateName:", v10);

    uint64_t v11 = v14;
  }

  -[NWStatsSource setDelegateAttributionReason:](self, "setDelegateAttributionReason:", v11);
  if ([v4 debugMode])
  {
    [v4 allIdentifiersForUUID:v5 EUUID:v6 pid:self->_nstatTCPUpdate.tcp_desc.pid epid:self->_nstatTCPUpdate.tcp_desc.epid procname:self->_nstatTCPUpdate.tcp_desc.pname];
    double v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    lookupResults = self->_lookupResults;
    self->_lookupResults = v12;
  }
}

- (NWStatsTCPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NWStatsTCPSource;
  v9 = -[NWStatsTCPSource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatTCPUpdate, a3, sizeof(v9->_nstatTCPUpdate));
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "_referenceIntervalWithContinuousTime:",  v10->_nstatTCPUpdate.tcp_desc.start_timestamp);
    -[NWStatsSource setCreationTimestamp:](v10, "setCreationTimestamp:");
    -[NWStatsSource setFlowFlags:]( v10,  "setFlowFlags:",  -[NWStatsSource flagsForProvider:sockaddr:]( v10,  "flagsForProvider:sockaddr:",  v10->_nstatTCPUpdate.provider,  &v10->_nstatTCPUpdate.tcp_desc.remote));
    -[NWStatsTCPSource deriveAttribution:](v10, "deriveAttribution:", v8);
    uint64_t v11 = [v8 currentForegroundStateForProcessWithPid:v10->_nstatTCPUpdate.tcp_desc.epid];
    -[NWStatsSource setStartAppStateIsForeground:](v10, "setStartAppStateIsForeground:", v11);
    -[NWStatsSource setUpdateAppStateIsForeground:](v10, "setUpdateAppStateIsForeground:", v11);
    if (a3->hdr.hdr.type == 10007) {
      -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]( v10,  "processExtendedUpdate:length:bluetoothCounts:",  &a3[1],  a4 - 496,  &v10->_nstatBluetoothCounts);
    }
  }

  return v10;
}

- (void)significantMetadataChange:(nstat_tcp_descriptor *)a3 monitor:(id)a4
{
  id v26 = a4;
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  v25 = v6;
  if (a3->pid == self->_nstatTCPUpdate.tcp_desc.pid)
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

  if (a3->epid == self->_nstatTCPUpdate.tcp_desc.epid) {
    int v10 = v7;
  }
  else {
    int v10 = v7 | 0x10000;
  }
  if (uuid_compare(a3->uuid, self->_nstatTCPUpdate.tcp_desc.uuid)) {
    v10 |= 0x1000u;
  }
  if (uuid_compare(a3->euuid, self->_nstatTCPUpdate.tcp_desc.euuid))
  {
    if (uuid_compare(self->_nstatTCPUpdate.tcp_desc.uuid, self->_nstatTCPUpdate.tcp_desc.euuid)) {
      v10 |= 0x2000u;
    }
    else {
      v10 |= 0x4000u;
    }
  }

  if (!memcmp(a3->pname, self->_nstatTCPUpdate.tcp_desc.pname, 0x40uLL)) {
    int v11 = v10;
  }
  else {
    int v11 = v10 | 0x200000;
  }
  if (*(void *)&a3->local.v4.sin_len != *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v4.sin_len
    || *(void *)a3->local.v6.sin6_addr.__u6_addr8 != *(void *)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr8
    || *(void *)&a3->local.v6.sin6_addr.__u6_addr32[2] != *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr32[2]
    || a3->local.v6.sin6_scope_id != (unint64_t)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_scope_id)
  {
    BOOL HavePortDiffOnly = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatTCPUpdate.tcp_desc.local, (uint64_t)&a3->local);
    if (HavePortDiffOnly) {
      int v16 = 0x80000;
    }
    else {
      int v16 = 0x20000;
    }
    if (HavePortDiffOnly) {
      v17 = @"TCP local port";
    }
    else {
      v17 = @"TCP local address";
    }
    v11 |= v16;
    -[NWStatsSource logAddressChangeOn:procName:variant:oldAddress:newAddress:]( self,  "logAddressChangeOn:procName:variant:oldAddress:newAddress:",  self->_nstatTCPUpdate.srcref,  a3->pname,  v17,  &self->_nstatTCPUpdate.tcp_desc.local,  &a3->local);
  }

  if (*(void *)&a3->remote.v4.sin_len != *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v4.sin_len
    || *(void *)a3->remote.v6.sin6_addr.__u6_addr8 != *(void *)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr8
    || *(void *)&a3->remote.v6.sin6_addr.__u6_addr32[2] != *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr32[2]
    || a3->remote.v6.sin6_scope_id != (unint64_t)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_scope_id)
  {
    BOOL v21 = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatTCPUpdate.tcp_desc.remote, (uint64_t)&a3->remote);
    if (v21) {
      int v22 = 0x100000;
    }
    else {
      int v22 = 0x40000;
    }
    if (v21) {
      v23 = @"TCP remote port";
    }
    else {
      v23 = @"TCP remote address";
    }
    v11 |= v22;
    -[NWStatsSource logAddressChangeOn:procName:variant:oldAddress:newAddress:]( self,  "logAddressChangeOn:procName:variant:oldAddress:newAddress:",  self->_nstatTCPUpdate.srcref,  a3->pname,  v23,  &self->_nstatTCPUpdate.tcp_desc.remote,  &a3->remote);
  }

  if ((v11 & 0x21F000) != 0)
  {
    LODWORD(v24) = a3->epid;
    -[NWStatsSource logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:]( self,  "logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:",  self->_nstatTCPUpdate.srcref,  self->_nstatTCPUpdate.tcp_desc.pname,  a3->pname,  self->_nstatTCPUpdate.tcp_desc.pid,  a3->pid,  self->_nstatTCPUpdate.tcp_desc.epid,  v24,  self->_nstatTCPUpdate.tcp_desc.uuid,  a3->uuid,  self->_nstatTCPUpdate.tcp_desc.euuid,  a3->euuid,  v26);
    -[NWStatsTCPSource deriveAttribution:](self, "deriveAttribution:", v26);
  }

  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") | v11);
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8 = a5;
  unsigned int type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatTCPUpdate, 0x158uLL))
  {
    BOOL v16 = 0;
  }

  else
  {
    if (a3->var0.tcp.pid != self->_nstatTCPUpdate.tcp_desc.pid
      || a3->var0.tcp.epid != self->_nstatTCPUpdate.tcp_desc.epid
      || uuid_compare(a3->var0.tcp.uuid, self->_nstatTCPUpdate.tcp_desc.uuid)
      || uuid_compare(a3->var0.tcp.euuid, self->_nstatTCPUpdate.tcp_desc.euuid)
      || (*(void *)a3->var0.conn.euuid == *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v4.sin_len
        ? (BOOL v10 = *(void *)&a3->var0.conn.euuid[8] == *(void *)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr8)
        : (BOOL v10 = 0),
          v10
        ? (BOOL v11 = *(void *)a3->var0.conn.cuuid == *(void *)&self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr32[2])
        : (BOOL v11 = 0),
          v11
        ? (BOOL v12 = a3->var0.tcp.local.v6.sin6_scope_id == (unint64_t)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_scope_id)
        : (BOOL v12 = 0),
          !v12
       || (*(void *)&a3->var0.conn.cuuid[12] == *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v4.sin_len
         ? (BOOL v13 = *(void *)&a3->var0.conn.puuid[4] == *(void *)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr8)
         : (BOOL v13 = 0),
           v13
         ? (BOOL v14 = *(void *)&a3->var0.conn.puuid[12] == *(void *)&self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr32[2])
         : (BOOL v14 = 0),
           v14
         ? (BOOL v15 = a3->var0.tcp.remote.v6.sin6_scope_id == (unint64_t)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_scope_id)
         : (BOOL v15 = 0),
           !v15)))
    {
      -[NWStatsTCPSource significantMetadataChange:monitor:](self, "significantMetadataChange:monitor:", &a3->var0, v8);
    }

    -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatTCPUpdate.counts);
    memcpy(&self->_nstatTCPUpdate, a3, sizeof(self->_nstatTCPUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:]( self,  "setUpdateAppStateIsForeground:",  [v8 currentForegroundStateForProcessWithPid:a3->var0.tcp.epid]);
    if (type == 10007)
    {
      -[NWStatsSource saveOldBTCounts:](self, "saveOldBTCounts:", &self->_nstatBluetoothCounts);
      BOOL v16 = -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]( self,  "processExtendedUpdate:length:bluetoothCounts:",  &a3[1],  a4 - 496,  &self->_nstatBluetoothCounts);
    }

    else
    {
      BOOL v16 = 1;
    }
  }

  return v16;
}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int v7 = objc_alloc(&OBJC_CLASS___NWStatsTCPSnapshot);
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  v9 = -[NWStatsTCPSnapshot initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:]( v7,  "initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:",  &self->_nstatTCPUpdate,  -[NWStatsSource flowFlags](self, "flowFlags"),  -[NWStatsSource prevItemsPtr](self, "prevItemsPtr"),  &self->_nstatBluetoothCounts,  0LL,  v8);
  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") & 0xFFC00FFFLL);
  -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatTCPUpdate.counts);
  -[NWStatsSource saveOldBTCounts:](self, "saveOldBTCounts:", &self->_nstatBluetoothCounts);
  -[NWStatsSnapshot setSnapshotReason:](v9, "setSnapshotReason:", v5);
  -[NWStatsSnapshot setFirstOccurrence:](v9, "setFirstOccurrence:", v4);
  -[NWStatsSource attributedEntity](self, "attributedEntity");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = -[NWStatsSource attributionReason](self, "attributionReason");
  -[NWStatsSource delegateName](self, "delegateName");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = -[NWStatsSource delegateAttributionReason](self, "delegateAttributionReason");
  -[NWStatsSource attributedExtension](self, "attributedExtension");
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot setAttribution:derivation:delegateName:delegateDerivation:extensionName:]( v9,  "setAttribution:derivation:delegateName:delegateDerivation:extensionName:",  v10,  v11,  v12,  v13,  v14);

  -[NWStatsProtocolSnapshot setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:]( v9,  "setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:",  -[NWStatsSource updateAppStateIsForeground](self, "updateAppStateIsForeground"),  -[NWStatsSource updateScreenStateOn](self, "updateScreenStateOn"),  -[NWStatsSource startAppStateIsForeground](self, "startAppStateIsForeground"),  -[NWStatsSource startScreenStateOn](self, "startScreenStateOn"));
  if (self->_lookupResults)
  {
    BOOL v15 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:self->_lookupResults];
    -[NWStatsSnapshot setLookupResults:](v9, "setLookupResults:", v15);
  }

  -[NWStatsSource extensions](self, "extensions");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x189603F68]);
    v18 = -[NWStatsSource extensions](self, "extensions");
    v19 = (void *)[v17 initWithDictionary:v18];
    -[NWStatsSnapshot setExtensions:](v9, "setExtensions:", v19);
  }

  -[NWStatsProtocolSnapshot runConsistencyChecks](v9, "runConsistencyChecks");
  return v9;
}

- (void).cxx_destruct
{
}

@end