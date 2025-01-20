@interface NWStatsUDPSnapshot
- (BOOL)failedFlowswitchValuesLookup;
- (BOOL)failedRouteValuesLookup;
- (BOOL)failedSkywalkAction;
- (BOOL)flowUsesChannels;
- (BOOL)hasLocalDestination;
- (BOOL)hasNonLocalDestination;
- (BOOL)interfaceAWDL;
- (BOOL)interfaceCellular;
- (BOOL)interfaceCellularViaAnyFallback;
- (BOOL)interfaceCellularViaFallback;
- (BOOL)interfaceCellularViaFastFallback;
- (BOOL)interfaceCellularViaIndependentFallback;
- (BOOL)interfaceCellularViaPreferredFallback;
- (BOOL)interfaceCellularViaSlowFallback;
- (BOOL)interfaceCompanionLink;
- (BOOL)interfaceCompanionLinkBluetooth;
- (BOOL)interfaceConstrained;
- (BOOL)interfaceExpensive;
- (BOOL)interfaceLLW;
- (BOOL)interfaceLoopback;
- (BOOL)interfaceUnknown;
- (BOOL)interfaceWiFi;
- (BOOL)interfaceWired;
- (BOOL)isKnownInbound;
- (BOOL)isKnownListener;
- (BOOL)isKnownOutbound;
- (BOOL)isKnownVPNFromKernel;
- (BOOL)isSubFlow;
- (NWStatsUDPSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8;
- (double)flowDuration;
- (double)flowSnapshotTimeIntervalSince1970;
- (double)flowSnapshotTimeIntervalSinceReferenceDate;
- (double)flowStartTimeIntervalSince1970;
- (double)flowStartTimeIntervalSinceReferenceDate;
- (id)descriptorDescription;
- (id)euuid;
- (id)flowSnapshotTimestamp;
- (id)flowStartTimestamp;
- (id)flowuuid;
- (id)localAddress;
- (id)localAddressString;
- (id)processName;
- (id)provider;
- (id)remoteAddress;
- (id)remoteAddressString;
- (id)uuid;
- (id)vuuid;
- (int)epid;
- (int)processID;
- (unint64_t)eupid;
- (unint64_t)flowStartContinuousTime;
- (unint64_t)networkActivityMapPart1;
- (unint64_t)networkActivityMapPart2;
- (unint64_t)networkActivityMapStartTime;
- (unint64_t)uniqueProcessID;
- (unsigned)ifnet_properties;
- (unsigned)interfaceIndex;
- (unsigned)localPort;
- (unsigned)personaID;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)remotePort;
- (unsigned)trafficClass;
- (unsigned)uid;
- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3;
@end

@implementation NWStatsUDPSnapshot

- (id)descriptorDescription
{
  v3 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  id v4 = objc_alloc(NSString);
  uint64_t traffic_mgt_flags = v3->var0.tcp.traffic_mgt_flags;
  uint64_t ifnet_properties = v3->var0.udp.ifnet_properties;
  uint64_t s_addr = v3->var0.tcp.local.v4.sin_addr.s_addr;
  uint64_t epid = v3->var0.udp.epid;
  v9 = -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", &v3->var0.conn + 1);
  v10 = -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", (char *)&v3->var0.conn + 216);
  v11 = (void *)[v4 initWithFormat:@"desc  ifidx %d flags 0x%x pid %d epid %d uuid %@ euuid %@ pname %s", traffic_mgt_flags, ifnet_properties, s_addr, epid, v9, v10, &v3->var0.conn.euuid[8]];

  return v11;
}

- (id)provider
{
  return @"UDP";
}

- (BOOL)isSubFlow
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 10;
}

- (BOOL)flowUsesChannels
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 5;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor->ifindex;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor->rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor->rcvbufused;
}

- (unsigned)trafficClass
{
  return self->_descriptor->traffic_class;
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
    id v4 = (NSString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%.64s",  self->_descriptor->pname);
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
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->uuid);
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
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
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->euuid);
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_euuid;
    self->_euuid = v4;

    euuid = self->_euuid;
  }

  return euuid;
}

- (id)vuuid
{
  vuuid = self->_vuuid;
  if (!vuuid)
  {
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->vuuid);
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_vuuid;
    self->_vuuid = v4;

    vuuid = self->_vuuid;
  }

  return vuuid;
}

- (id)flowuuid
{
  flowuuid = self->_flowuuid;
  if (!flowuuid)
  {
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->fuuid);
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_flowuuid;
    self->_flowuuid = v4;

    flowuuid = self->_flowuuid;
  }

  return flowuuid;
}

- (id)localAddress
{
  if (!self->_localAddress)
  {
    if (self->_descriptor->local.v4.sin_len) {
      objc_super v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor->local length:self->_descriptor->local.v4.sin_len];
    }
    else {
      objc_super v3 = 0LL;
    }
    localAddress = self->_localAddress;
    self->_localAddress = v3;
  }

  return self->_localAddress;
}

- (unsigned)localPort
{
  descriptor = self->_descriptor;
  int sin_family = descriptor->local.v4.sin_family;
  if (sin_family == 30 || sin_family == 2) {
    return bswap32(descriptor->local.v4.sin_port) >> 16;
  }
  else {
    LOWORD(v5) = 0;
  }
  return v5;
}

- (id)localAddressString
{
  return sockaddrForLogging((const sockaddr *)&self->_descriptor->local);
}

- (id)remoteAddress
{
  if (!self->_remoteAddress)
  {
    if (self->_descriptor->remote.v4.sin_len) {
      objc_super v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor->remote length:self->_descriptor->remote.v4.sin_len];
    }
    else {
      objc_super v3 = 0LL;
    }
    remoteAddress = self->_remoteAddress;
    self->_remoteAddress = v3;
  }

  return self->_remoteAddress;
}

- (unsigned)remotePort
{
  descriptor = self->_descriptor;
  int sin_family = descriptor->remote.v4.sin_family;
  if (sin_family == 30 || sin_family == 2) {
    return bswap32(descriptor->remote.v4.sin_port) >> 16;
  }
  else {
    LOWORD(v5) = 0;
  }
  return v5;
}

- (id)remoteAddressString
{
  return sockaddrForLogging((const sockaddr *)&self->_descriptor->remote);
}

- (unsigned)ifnet_properties
{
  return self->_descriptor->ifnet_properties;
}

- (BOOL)interfaceUnknown
{
  return self->_descriptor->ifnet_properties & 1 | ((self->_descriptor->ifnet_properties & 0x21E) == 0);
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceWiFi
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (BOOL)interfaceWired
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 4) & 1;
}

- (BOOL)interfaceAWDL
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 5) & 1;
}

- (BOOL)interfaceCompanionLinkBluetooth
{
  return (BYTE2(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)isKnownVPNFromKernel
{
  return LOBYTE(self->_descriptor->ifnet_properties) >> 7;
}

- (BOOL)interfaceLLW
{
  return BYTE1(self->_descriptor->ifnet_properties) >> 7;
}

- (BOOL)interfaceExpensive
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 6) & 1;
}

- (BOOL)interfaceConstrained
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceCompanionLink
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellularViaFallback
{
  descriptor = self->_descriptor;
  if ((~descriptor->ifnet_properties & 0x104) != 0) {
    return 0;
  }
  if ((descriptor->fallback_mode & 0xFE) == 2) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v4, sel__update_ptr) + 36) == 4;
}

- (BOOL)interfaceCellularViaAnyFallback
{
  return (~self->_descriptor->ifnet_properties & 0x104) == 0;
}

- (BOOL)interfaceCellularViaFastFallback
{
  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 3;
}

- (BOOL)interfaceCellularViaSlowFallback
{
  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 2;
}

- (BOOL)interfaceCellularViaIndependentFallback
{
  if ((~self->_descriptor->ifnet_properties & 0x104) != 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 4;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 4;
}

- (BOOL)failedRouteValuesLookup
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 5) & 1;
}

- (BOOL)failedFlowswitchValuesLookup
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 6) & 1;
}

- (BOOL)failedSkywalkAction
{
  return (self->_descriptor->ifnet_properties & 0x6000) != 0;
}

- (BOOL)hasLocalDestination
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (BOOL)hasNonLocalDestination
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 4) & 1;
}

- (BOOL)isKnownListener
{
  return (HIBYTE(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (BOOL)isKnownInbound
{
  return (HIBYTE(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)isKnownOutbound
{
  return (HIBYTE(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_descriptor->activity_bitmap.start;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_descriptor->activity_bitmap.bitmap[0];
}

- (unint64_t)networkActivityMapPart2
{
  return self->_descriptor->activity_bitmap.bitmap[1];
}

- (unint64_t)flowStartContinuousTime
{
  return self->_descriptor->start_timestamp;
}

- (double)flowDuration
{
  return result;
}

- (id)flowStartTimestamp
{
  startTimestamp = self->_startTimestamp;
  if (!startTimestamp)
  {
    objc_super v4 = (void *)MEMORY[0x189603F50];
    -[NWStatsUDPSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    int v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_startTimestamp;
    self->_startTimestamp = v5;

    startTimestamp = self->_startTimestamp;
  }

  return startTimestamp;
}

- (id)flowSnapshotTimestamp
{
  snapshotTimestamp = self->_snapshotTimestamp;
  if (!snapshotTimestamp)
  {
    objc_super v4 = (void *)MEMORY[0x189603F50];
    -[NWStatsUDPSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    int v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_snapshotTimestamp;
    self->_snapshotTimestamp = v5;

    snapshotTimestamp = self->_snapshotTimestamp;
  }

  return snapshotTimestamp;
}

- (double)flowStartTimeIntervalSinceReferenceDate
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

- (double)flowSnapshotTimeIntervalSinceReferenceDate
{
  double result = self->_snapshotTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "_referenceIntervalWithContinuousTime:",  self->_descriptor->timestamp);
    self->_snapshotTimeInterval = result;
  }

  return result;
}

- (double)flowStartTimeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (NWStatsUDPSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NWStatsUDPSnapshot;
  v9 = -[NWStatsProtocolSnapshot initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:]( &v12,  sel_initWithUpdate_startTime_flowFlags_previously_bluetoothCounts_peerEgressCellularCounts_,  a3,  *(void *)&a5,  a6,  a7,  a8);
  v10 = v9;
  if (v9)
  {
    v9->_descriptor = (nstat_udp_descriptor *)(-[NWStatsProtocolSnapshot _update_ptr](v9, "_update_ptr") + 152);
    v10->_startTimeInterval = a4;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end