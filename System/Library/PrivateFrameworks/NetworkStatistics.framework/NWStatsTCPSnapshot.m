@interface NWStatsTCPSnapshot
- (BOOL)connProbeFailed;
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
- (BOOL)probeActivated;
- (BOOL)readProbeFailed;
- (BOOL)writeProbeFailed;
- (NSString)TCPState;
- (NSString)congestionAlgorithm;
- (NWStatsTCPSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8;
- (double)flowDuration;
- (double)flowSnapshotTimeIntervalSince1970;
- (double)flowSnapshotTimeIntervalSinceReferenceDate;
- (double)flowStartTimeIntervalSince1970;
- (double)flowStartTimeIntervalSinceReferenceDate;
- (double)rttAverage;
- (double)rttMinimum;
- (double)rttVariation;
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
- (unsigned)TCPStateNumber;
- (unsigned)deltaRxDuplicateBytes;
- (unsigned)deltaRxOutOfOrderBytes;
- (unsigned)deltaTxRetransmittedBytes;
- (unsigned)ifnet_properties;
- (unsigned)interfaceIndex;
- (unsigned)localPort;
- (unsigned)personaID;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)remotePort;
- (unsigned)rxDuplicateBytes;
- (unsigned)rxOutOfOrderBytes;
- (unsigned)sendBufferSize;
- (unsigned)sendBufferUsed;
- (unsigned)trafficClass;
- (unsigned)trafficManagementFlags;
- (unsigned)txCongestionWindow;
- (unsigned)txRetransmittedBytes;
- (unsigned)txUnacked;
- (unsigned)txWindow;
- (unsigned)uid;
- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3;
@end

@implementation NWStatsTCPSnapshot

- (id)descriptorDescription
{
  v3 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  id v4 = objc_alloc(NSString);
  uint64_t ifindex = v3->var0.tcp.ifindex;
  uint64_t ifnet_properties = v3->var0.tcp.ifnet_properties;
  uint64_t pid = v3->var0.tcp.pid;
  euint64_t pid = v3->var0.tcp.epid;
  v9 = -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", (char *)&v3->var0.conn + 260);
  v10 = -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", (char *)&v3->var0.conn + 276);
  v11 = (void *)[v4 initWithFormat:@"desc  ifidx %d flags 0x%x pid %d epid %d uuid %@ euuid %@ pname %s", ifindex, ifnet_properties, pid, epid, v9, v10, v3->var0.conn.reserved];

  return v11;
}

- (unsigned)rxDuplicateBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return -[NWStatsProtocolSnapshot _rxDuplicateBytes](&v3, sel__rxDuplicateBytes);
}

- (unsigned)rxOutOfOrderBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return -[NWStatsProtocolSnapshot _rxOutOfOrderBytes](&v3, sel__rxOutOfOrderBytes);
}

- (unsigned)txRetransmittedBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return -[NWStatsProtocolSnapshot _txRetransmittedBytes](&v3, sel__txRetransmittedBytes);
}

- (unsigned)deltaRxDuplicateBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return -[NWStatsProtocolSnapshot _deltaRxDuplicateBytes](&v3, sel__deltaRxDuplicateBytes);
}

- (unsigned)deltaRxOutOfOrderBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return -[NWStatsProtocolSnapshot _deltaRxOutOfOrderBytes](&v3, sel__deltaRxOutOfOrderBytes);
}

- (unsigned)deltaTxRetransmittedBytes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return -[NWStatsProtocolSnapshot _deltaTxRetransmittedBytes](&v3, sel__deltaTxRetransmittedBytes);
}

- (double)rttMinimum
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  -[NWStatsProtocolSnapshot _rttMinimum](&v3, sel__rttMinimum);
  return result;
}

- (double)rttAverage
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  -[NWStatsProtocolSnapshot _rttAverage](&v3, sel__rttAverage);
  return result;
}

- (double)rttVariation
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  -[NWStatsProtocolSnapshot _rttVariation](&v3, sel__rttVariation);
  return result;
}

- (id)provider
{
  return @"TCP";
}

- (BOOL)flowUsesChannels
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 3;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor->ifindex;
}

- (unsigned)sendBufferSize
{
  return self->_descriptor->sndbufsize;
}

- (unsigned)sendBufferUsed
{
  return self->_descriptor->sndbufused;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor->rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor->rcvbufused;
}

- (unsigned)txUnacked
{
  return self->_descriptor->txunacked;
}

- (unsigned)txWindow
{
  return self->_descriptor->txwindow;
}

- (unsigned)txCongestionWindow
{
  return self->_descriptor->txcwindow;
}

- (unsigned)trafficClass
{
  return self->_descriptor->traffic_class;
}

- (unsigned)trafficManagementFlags
{
  return self->_descriptor->traffic_mgt_flags;
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

- (unsigned)ifnet_properties
{
  return self->_descriptor->ifnet_properties;
}

- (BOOL)interfaceUnknown
{
  return self->_descriptor->ifnet_properties & 1 | ((self->_descriptor->ifnet_properties & 0x4021E) == 0);
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 2) & 1;
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
  v4.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v4, sel__update_ptr) + 36) == 2;
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
  v3.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 2;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 4;
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

- (BOOL)interfaceCompanionLinkBluetooth
{
  return (BYTE2(self->_descriptor->ifnet_properties) >> 2) & 1;
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

- (NSString)TCPState
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t state = self->_descriptor->state;
  v6[2] = xmmword_18A1B6A00;
  v6[3] = *(_OWORD *)&off_18A1B6A10;
  v6[4] = xmmword_18A1B6A20;
  v7 = @"TimeWait";
  v6[0] = xmmword_18A1B69E0;
  v6[1] = *(_OWORD *)&off_18A1B69F0;
  else {
    id v3 = *((id *)v6 + state);
  }
  for (uint64_t i = 80LL; i != -8; i -= 8LL)

  return (NSString *)v3;
}

- (id)processName
{
  processName = self->_processName;
  if (!processName)
  {
    objc_super v4 = (NSString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%.64s",  self->_descriptor->pname);
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
    objc_super v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
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
    objc_super v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
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
    objc_super v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
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
    objc_super v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
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
      id v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor->local length:self->_descriptor->local.v4.sin_len];
    }
    else {
      id v3 = 0LL;
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
      id v3 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self->_descriptor->remote length:self->_descriptor->remote.v4.sin_len];
    }
    else {
      id v3 = 0LL;
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

- (NSString)congestionAlgorithm
{
  congestionAlgorithm = self->_congestionAlgorithm;
  if (!congestionAlgorithm)
  {
    objc_super v4 = (NSString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%.16s",  self->_descriptor->cc_algo);
    int v5 = self->_congestionAlgorithm;
    self->_congestionAlgorithm = v4;

    congestionAlgorithm = self->_congestionAlgorithm;
  }

  return congestionAlgorithm;
}

- (BOOL)probeActivated
{
  return self->_descriptor->var0.__pad_connstatus[0] & 1;
}

- (BOOL)connProbeFailed
{
  return (self->_descriptor->var0.__pad_connstatus[0] >> 3) & 1;
}

- (BOOL)readProbeFailed
{
  return (self->_descriptor->var0.__pad_connstatus[0] >> 2) & 1;
}

- (BOOL)writeProbeFailed
{
  return (self->_descriptor->var0.__pad_connstatus[0] >> 1) & 1;
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
    -[NWStatsTCPSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
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
    -[NWStatsTCPSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
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

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_snapshotTimeInterval = a3;
}

- (double)flowStartTimeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  return v2 + 978307200.0;
}

- (NWStatsTCPSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NWStatsTCPSnapshot;
  v9 = -[NWStatsProtocolSnapshot initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:]( &v12,  sel_initWithUpdate_startTime_flowFlags_previously_bluetoothCounts_peerEgressCellularCounts_,  a3,  *(void *)&a5,  a6,  a7,  a8);
  v10 = v9;
  if (v9)
  {
    v9->_descriptor = (const nstat_tcp_descriptor *)(-[NWStatsProtocolSnapshot _update_ptr](v9, "_update_ptr") + 152);
    v10->_startTimeInterval = a4;
  }

  return v10;
}

- (unsigned)TCPStateNumber
{
  return self->_TCPStateNumber;
}

- (void).cxx_destruct
{
}

@end