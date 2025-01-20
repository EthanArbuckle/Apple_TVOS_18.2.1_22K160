@interface NWStatsProtocolSnapshot
+ (double)_intervalWithContinuousTime:(unint64_t)a3;
+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3;
+ (id)_snapshotWithDictionary:(id)a3;
+ (id)snapshotWithDictionary:(id)a3;
+ (void)_initializeQUICDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4;
+ (void)_initializeTCPDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4;
+ (void)_initializeUDPDescriptor:(nstat_udp_descriptor *)a3 fromDictionary:(id)a4;
+ (void)initialize;
+ (void)logFlowAnomaly:(id)a3 anomaly:(id)a4;
- (BOOL)attributedEntityIsBundleName;
- (BOOL)attributedEntityIsProcessName;
- (BOOL)changedAddress;
- (BOOL)changedEUUID;
- (BOOL)changedEUUIDFromUUID;
- (BOOL)changedEpid;
- (BOOL)changedLocalAddress;
- (BOOL)changedLocalPort;
- (BOOL)changedMetadata;
- (BOOL)changedOwnership;
- (BOOL)changedPid;
- (BOOL)changedProcname;
- (BOOL)changedRemoteAddress;
- (BOOL)changedRemotePort;
- (BOOL)changedUUID;
- (BOOL)failedConsistencyChecks;
- (BOOL)failedFlowswitchValuesLookup;
- (BOOL)failedNegativeDeltaCheck;
- (BOOL)failedRouteValuesLookup;
- (BOOL)failedRxCountCheck;
- (BOOL)failedSkywalkAction;
- (BOOL)failedTCPMultipleInterfaceCheck;
- (BOOL)flowUsesChannels;
- (BOOL)hasCellTraffic;
- (BOOL)hasCellTrafficDelta;
- (BOOL)hasLocalDestination;
- (BOOL)hasNonLocalDestination;
- (BOOL)hasTraffic;
- (BOOL)hasTrafficDelta;
- (BOOL)hasWiFiTraffic;
- (BOOL)hasWiFiTrafficDelta;
- (BOOL)hasWiredTraffic;
- (BOOL)hasWiredTrafficDelta;
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
- (BOOL)isIPv4;
- (BOOL)isIPv6;
- (BOOL)isKnownInbound;
- (BOOL)isKnownListener;
- (BOOL)isKnownOutbound;
- (BOOL)isKnownVPNClient;
- (BOOL)isKnownVPNFromKernel;
- (BOOL)isKnownVPNProvider;
- (BOOL)isSimpleInterface:(unsigned int)a3;
- (BOOL)uiBackgroundAudioCapable;
- (NSData)localAddress;
- (NSData)remoteAddress;
- (NSDate)flowSnapshotTimestamp;
- (NSDate)flowStartTimestamp;
- (NSString)countsDescription;
- (NSString)descriptorDescription;
- (NSString)flowType;
- (NSString)flowTypeLowerCase;
- (NSString)interfaceCellularViaFallbackString;
- (NSString)localAddressString;
- (NSString)remoteAddressString;
- (NSString)savedAccumulatorCountsDescription;
- (NSString)savedCountsDescription;
- (NSString)verboseDescription;
- (NSUUID)flowuuid;
- (NSUUID)vuuid;
- (NWStatsProtocolSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8;
- (accumulator_bytes)_update_adjustment_bytes;
- (const)_update_delta_ptr;
- (const)_update_ptr;
- (double)_rttAverage;
- (double)_rttMinimum;
- (double)_rttVariation;
- (double)flowDuration;
- (double)flowSnapshotTimeIntervalSince1970;
- (double)flowSnapshotTimeIntervalSinceReferenceDate;
- (double)flowStartTimeIntervalSince1970;
- (double)flowStartTimeIntervalSinceReferenceDate;
- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16];
- (id)_interfaceCellularViaFallbackConciseString;
- (id)_nstatCountsDictionaryForm:(nstat_counts *)a3;
- (id)_quicDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3;
- (id)_tcpDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3;
- (id)_udpDescriptorDictionaryForm:(nstat_udp_descriptor *)a3;
- (id)attributionReasonString;
- (id)briefDescription;
- (id)description;
- (id)dictionaryForm;
- (id)snapshotReasonString;
- (unint64_t)_adjustedByteCount:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5;
- (unint64_t)_byteOverheadForPacketCount:(unint64_t)a3;
- (unint64_t)_deltaForCurrentBytes:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5 prevBytes:(unint64_t)a6 prevOtherBytes:(unint64_t)a7 prevPackets:(unint64_t)a8;
- (unint64_t)deltaAccountingRxCellularBytes;
- (unint64_t)deltaAccountingRxCompanionLinkBluetoothBytes;
- (unint64_t)deltaAccountingRxWiFiBytes;
- (unint64_t)deltaAccountingRxWiredBytes;
- (unint64_t)deltaAccountingTxCellularBytes;
- (unint64_t)deltaAccountingTxCompanionLinkBluetoothBytes;
- (unint64_t)deltaAccountingTxWiFiBytes;
- (unint64_t)deltaAccountingTxWiredBytes;
- (unint64_t)deltaRxBytes;
- (unint64_t)deltaRxCellularBytes;
- (unint64_t)deltaRxCompanionLinkBluetoothBytes;
- (unint64_t)deltaRxPackets;
- (unint64_t)deltaRxWiFiBytes;
- (unint64_t)deltaRxWiredBytes;
- (unint64_t)deltaTxBytes;
- (unint64_t)deltaTxCellularBytes;
- (unint64_t)deltaTxCompanionLinkBluetoothBytes;
- (unint64_t)deltaTxPackets;
- (unint64_t)deltaTxWiFiBytes;
- (unint64_t)deltaTxWiredBytes;
- (unint64_t)eventFlags;
- (unint64_t)flowStartContinuousTime;
- (unint64_t)networkActivityMapPart1;
- (unint64_t)networkActivityMapPart2;
- (unint64_t)networkActivityMapStartTime;
- (unint64_t)rawDeltaRxCellularBytes;
- (unint64_t)rawDeltaRxCompanionLinkBluetoothBytes;
- (unint64_t)rawDeltaRxWiFiBytes;
- (unint64_t)rawDeltaRxWiredBytes;
- (unint64_t)rawDeltaTxCellularBytes;
- (unint64_t)rawDeltaTxCompanionLinkBluetoothBytes;
- (unint64_t)rawDeltaTxWiFiBytes;
- (unint64_t)rawDeltaTxWiredBytes;
- (unint64_t)rawRxCellularBytes;
- (unint64_t)rawRxCompanionLinkBluetoothBytes;
- (unint64_t)rawRxWiFiBytes;
- (unint64_t)rawRxWiredBytes;
- (unint64_t)rawTxCellularBytes;
- (unint64_t)rawTxCompanionLinkBluetoothBytes;
- (unint64_t)rawTxWiFiBytes;
- (unint64_t)rawTxWiredBytes;
- (unint64_t)rxBytes;
- (unint64_t)rxCellularBytes;
- (unint64_t)rxCompanionLinkBluetoothBytes;
- (unint64_t)rxPackets;
- (unint64_t)rxWiFiBytes;
- (unint64_t)rxWiredBytes;
- (unint64_t)sourceIdentifier;
- (unint64_t)txBytes;
- (unint64_t)txCellularBytes;
- (unint64_t)txCompanionLinkBluetoothBytes;
- (unint64_t)txPackets;
- (unint64_t)txWiFiBytes;
- (unint64_t)txWiredBytes;
- (unsigned)_deltaRxDuplicateBytes;
- (unsigned)_deltaRxOutOfOrderBytes;
- (unsigned)_deltaTxRetransmittedBytes;
- (unsigned)_rxDuplicateBytes;
- (unsigned)_rxOutOfOrderBytes;
- (unsigned)_txRetransmittedBytes;
- (unsigned)ifnet_properties;
- (unsigned)interfaceIndex;
- (unsigned)localPort;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)remotePort;
- (unsigned)trafficClass;
- (void)applyTrafficAdjustmentFactor:(double)a3;
- (void)donateBytesToAccumulator;
- (void)removeBytesFromAccumulator;
- (void)runConsistencyChecks;
- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6;
- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3;
- (void)setIsKnownVPNClient:(BOOL)a3;
- (void)setIsKnownVPNProvider:(BOOL)a3;
- (void)setUiBackgroundAudioCapable:(BOOL)a3;
@end

@implementation NWStatsProtocolSnapshot

- (id)snapshotReasonString
{
  int v2 = -[NWStatsSnapshot snapshotReason](self, "snapshotReason") - 1;
  else {
    return *(&off_18A1B6940 + v2);
  }
}

- (NSString)interfaceCellularViaFallbackString
{
  if (-[NWStatsProtocolSnapshot interfaceCellularViaFastFallback](self, "interfaceCellularViaFastFallback"))
  {
    v3 = @"fastFallback";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaSlowFallback](self, "interfaceCellularViaSlowFallback"))
  {
    v3 = @"slowFallback";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaPreferredFallback]( self,  "interfaceCellularViaPreferredFallback"))
  {
    v3 = @"preferredFallback";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaIndependentFallback]( self,  "interfaceCellularViaIndependentFallback"))
  {
    v3 = @"independentFallback";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaAnyFallback](self, "interfaceCellularViaAnyFallback"))
  {
    v3 = @"unqualifiedFallback";
  }

  else
  {
    v3 = &stru_18A1B7BD8;
  }

  return (NSString *)v3;
}

- (id)_interfaceCellularViaFallbackConciseString
{
  if (-[NWStatsProtocolSnapshot interfaceCellularViaFastFallback](self, "interfaceCellularViaFastFallback"))
  {
    v3 = @"fastRNF ";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaSlowFallback](self, "interfaceCellularViaSlowFallback"))
  {
    v3 = @"slowRNF ";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaPreferredFallback]( self,  "interfaceCellularViaPreferredFallback"))
  {
    v3 = @"prefRNF ";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaIndependentFallback]( self,  "interfaceCellularViaIndependentFallback"))
  {
    v3 = @"indRNF ";
  }

  else if (-[NWStatsProtocolSnapshot interfaceCellularViaAnyFallback](self, "interfaceCellularViaAnyFallback"))
  {
    v3 = @"unqualifiedRNF ";
  }

  else
  {
    v3 = &stru_18A1B7BD8;
  }

  return v3;
}

- (id)description
{
  id v15 = objc_alloc(NSString);
  v14 = -[NWStatsSnapshot processName](self, "processName");
  v13 = -[NWStatsProtocolSnapshot flowType](self, "flowType");
  unint64_t v12 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
  v11 = -[NWStatsProtocolSnapshot snapshotReasonString](self, "snapshotReasonString");
  BOOL v3 = -[NWStatsProtocolSnapshot failedConsistencyChecks](self, "failedConsistencyChecks");
  v4 = &stru_18A1B7BD8;
  if (v3) {
    v4 = @"-inconsistent";
  }
  v10 = v4;
  v9 = -[NWStatsProtocolSnapshot _interfaceCellularViaFallbackConciseString]( self,  "_interfaceCellularViaFallbackConciseString");
  BOOL v5 = -[NWStatsProtocolSnapshot flowUsesChannels](self, "flowUsesChannels");
  v6 = @"so";
  if (v5) {
    v6 = @"ch";
  }
  v7 = (void *)[v15 initWithFormat:@"%@ %@ flow id %lld (%@%@) %@%@ i/f %d props 0x%x first %d pkts rx %lld tx %lld, bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld comp_bt %lld %lld deltas %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld acct_deltas %lld %lld %lld %lld %lld %lld", v14, v13, v12, v11, v10, v9, v6, -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"), -[NWStatsProtocolSnapshot ifnet_properties](self, "ifnet_properties"), -[NWStatsSnapshot firstOccurrence](self, "firstOccurrence"), -[NWStatsProtocolSnapshot rxPackets](self, "rxPackets"), -[NWStatsProtocolSnapshot txPackets](self, "txPackets"), -[NWStatsProtocolSnapshot rxBytes](self, "rxBytes"), -[NWStatsProtocolSnapshot txBytes](self, "txBytes"), -[NWStatsProtocolSnapshot rxCellularBytes](self, "rxCellularBytes"), -[NWStatsProtocolSnapshot txCellularBytes](self, "txCellularBytes"), -[NWStatsProtocolSnapshot rxWiFiBytes](self, "rxWiFiBytes"), -[NWStatsProtocolSnapshot txWiFiBytes](self, "txWiFiBytes"), -[NWStatsProtocolSnapshot rxWiredBytes](self, "rxWiredBytes"), -[NWStatsProtocolSnapshot txWiredBytes](self, "txWiredBytes"), -[NWStatsProtocolSnapshot rxCompanionLinkBluetoothBytes](self, "rxCompanionLinkBluetoothBytes"), -[NWStatsProtocolSnapshot txCompanionLinkBluetoothBytes](self, "txCompanionLinkBluetoothBytes"), -[NWStatsProtocolSnapshot deltaRxBytes](self, "deltaRxBytes"), -[NWStatsProtocolSnapshot deltaTxBytes](self, "deltaTxBytes"), -[NWStatsProtocolSnapshot deltaRxCellularBytes](self, "deltaRxCellularBytes"), -[NWStatsProtocolSnapshot deltaTxCellularBytes](self, "deltaTxCellularBytes"), -[NWStatsProtocolSnapshot deltaRxWiFiBytes](self, "deltaRxWiFiBytes"), -[NWStatsProtocolSnapshot deltaTxWiFiBytes](self, "deltaTxWiFiBytes"), -[NWStatsProtocolSnapshot deltaRxWiredBytes](self, "deltaRxWiredBytes"), -[NWStatsProtocolSnapshot deltaTxWiredBytes](self, "deltaTxWiredBytes"), -[NWStatsProtocolSnapshot deltaRxCompanionLinkBluetoothBytes]( self, "deltaRxCompanionLinkBluetoothBytes"), -[NWStatsProtocolSnapshot deltaTxCompanionLinkBluetoothBytes]( self, "deltaTxCompanionLinkBluetoothBytes"), -[NWStatsProtocolSnapshot deltaAccountingRxCellularBytes](self, "deltaAccountingRxCellularBytes"), -[NWStatsProtocolSnapshot deltaAccountingTxCellularBytes](self, "deltaAccountingTxCellularBytes"), -[NWStatsProtocolSnapshot deltaAccountingRxWiFiBytes](self, "deltaAccountingRxWiFiBytes"), -[NWStatsProtocolSnapshot deltaAccountingTxWiFiBytes](self, "deltaAccountingTxWiFiBytes"), -[NWStatsProtocolSnapshot deltaAccountingRxWiredBytes](self, "deltaAccountingRxWiredBytes"), -[NWStatsProtocolSnapshot deltaAccountingTxWiredBytes](self, "deltaAccountingTxWiredBytes")];

  return v7;
}

- (id)briefDescription
{
  id v12 = objc_alloc(NSString);
  -[NWStatsSnapshot processName](self, "processName");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NWStatsProtocolSnapshot flowType](self, "flowType");
  unint64_t v11 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
  -[NWStatsProtocolSnapshot snapshotReasonString](self, "snapshotReasonString");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NWStatsProtocolSnapshot failedConsistencyChecks](self, "failedConsistencyChecks")) {
    v6 = @"-inconsistent";
  }
  else {
    v6 = &stru_18A1B7BD8;
  }
  v7 = -[NWStatsProtocolSnapshot _interfaceCellularViaFallbackConciseString]( self,  "_interfaceCellularViaFallbackConciseString");
  if (-[NWStatsProtocolSnapshot flowUsesChannels](self, "flowUsesChannels")) {
    v8 = @"ch";
  }
  else {
    v8 = @"so";
  }
  v9 = (void *)[v12 initWithFormat:@"%@ %@ flow id %lld (%@%@) %@%@ pkts rx %lld tx %lld, bytes %lld %lld", v3, v4, v11, v5, v6, v7, v8, -[NWStatsProtocolSnapshot rxPackets](self, "rxPackets"), -[NWStatsProtocolSnapshot txPackets](self, "txPackets"), -[NWStatsProtocolSnapshot rxBytes](self, "rxBytes"), -[NWStatsProtocolSnapshot txBytes](self, "txBytes")];

  return v9;
}

- (NSString)countsDescription
{
  int v2 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  return (NSString *)(id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"count rx/tx pkts %lld %lld bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld dup %d ooo %d retx %d",  v2->hdr.counts.nstat_rxpackets,  v2->hdr.counts.nstat_txpackets,  v2->hdr.counts.nstat_rxbytes,  v2->hdr.counts.nstat_txbytes,  v2->hdr.counts.nstat_cell_rxbytes,  v2->hdr.counts.nstat_cell_txbytes,  v2->hdr.counts.nstat_wifi_rxbytes,  v2->hdr.counts.nstat_wifi_txbytes,  v2->hdr.counts.nstat_wired_rxbytes,  v2->hdr.counts.nstat_wired_txbytes,  v2->hdr.counts.nstat_rxduplicatebytes,  v2->hdr.counts.nstat_rxoutoforderbytes,  v2->hdr.counts.nstat_txretransmit);
}

- (NSString)savedCountsDescription
{
  int v2 = -[NWStatsProtocolSnapshot _update_delta_ptr](self, "_update_delta_ptr");
  return (NSString *)(id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"saved rx/tx pkts %lld %lld bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld dup %d ooo %d retx %d",  v2->savedRxPackets,  v2->savedTxPackets,  v2->savedRxBytes,  v2->savedTxBytes,  v2->savedRxCellularBytes,  v2->savedTxCellularBytes,  v2->savedRxWiFiBytes,  v2->savedTxWiFiBytes,  v2->savedRxWiredBytes,  v2->savedTxWiredBytes,  v2->savedRxDuplicateBytes,  v2->savedRxOutOfOrderBytes,  v2->savedTxRetransmittedBytes);
}

- (NSString)savedAccumulatorCountsDescription
{
  int v2 = -[NWStatsProtocolSnapshot _update_adjustment_bytes](self, "_update_adjustment_bytes");
  return (NSString *)(id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"saved rx/tx cell %lld %lld wifi %lld %lld wired %lld %lld",  v2->rxCellularBytes,  v2->txCellularBytes,  v2->rxWiFiBytes,  v2->txWiFiBytes,  v2->rxWiredBytes,  v2->txWiredBytes);
}

- (NSString)verboseDescription
{
  id v3 = objc_alloc(NSString);
  v4 = -[NWStatsProtocolSnapshot briefDescription](self, "briefDescription");
  -[NWStatsProtocolSnapshot countsDescription](self, "countsDescription");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NWStatsProtocolSnapshot savedCountsDescription](self, "savedCountsDescription");
  v7 = -[NWStatsProtocolSnapshot savedAccumulatorCountsDescription](self, "savedAccumulatorCountsDescription");
  v8 = -[NWStatsProtocolSnapshot descriptorDescription](self, "descriptorDescription");
  v9 = (void *)[v3 initWithFormat:@"%@\n    %@\n    %@\n    %@\n    %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)descriptorDescription
{
  return 0LL;
}

- (NSString)flowType
{
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0)
  {
    if ((flags & 4) != 0)
    {
      return (NSString *)@"TCP4";
    }

    else if ((flags & 8) != 0)
    {
      return (NSString *)@"TCP6";
    }

    else
    {
      return (NSString *)@"TCP??";
    }
  }

  else
  {
    if ((flags & 0x20) == 0) {
      return (NSString *)@"???";
    }
    unsigned int v4 = self->_flags & 0xCC;
    if (v4 > 0x47)
    {
      switch(v4)
      {
        case 0x48u:
          return (NSString *)@"QUIC6";
        case 0x84u:
          return (NSString *)@"UDPSUBFLOW4";
        case 0x88u:
          return (NSString *)@"UDPSUBFLOW6";
      }
    }

    else
    {
      switch(v4)
      {
        case 4u:
          return (NSString *)@"UDP4";
        case 8u:
          return (NSString *)@"UDP6";
        case 0x44u:
          return (NSString *)@"QUIC4";
      }
    }

    return (NSString *)@"UDP??";
  }

- (NSString)flowTypeLowerCase
{
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0)
  {
    if ((flags & 4) != 0)
    {
      return (NSString *)@"tcp4";
    }

    else if ((flags & 8) != 0)
    {
      return (NSString *)@"tcp6";
    }

    else
    {
      return (NSString *)@"tcp??";
    }
  }

  else
  {
    if ((flags & 0x20) == 0) {
      return (NSString *)@"???";
    }
    unsigned int v4 = self->_flags & 0xCC;
    if (v4 > 0x47)
    {
      switch(v4)
      {
        case 0x48u:
          return (NSString *)@"quic6";
        case 0x84u:
          return (NSString *)@"udp-sflow4";
        case 0x88u:
          return (NSString *)@"udp-sflow6";
      }
    }

    else
    {
      switch(v4)
      {
        case 4u:
          return (NSString *)@"udp4";
        case 8u:
          return (NSString *)@"udp6";
        case 0x44u:
          return (NSString *)@"quic4";
      }
    }

    return (NSString *)@"udp??";
  }

- (BOOL)isIPv4
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isIPv6
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)changedMetadata
{
  return (self->_flags & 0x3FF000) != 0;
}

- (BOOL)changedAddress
{
  return (self->_flags & 0x1E0000) != 0;
}

- (BOOL)changedLocalAddress
{
  return (BYTE2(self->_flags) >> 1) & 1;
}

- (BOOL)changedLocalPort
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)changedRemoteAddress
{
  return (BYTE2(self->_flags) >> 2) & 1;
}

- (BOOL)changedRemotePort
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)changedOwnership
{
  return (self->_flags & 0x21F000) != 0;
}

- (BOOL)changedUUID
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)changedEUUID
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)changedEUUIDFromUUID
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)changedEpid
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)changedPid
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)changedProcname
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (unint64_t)_byteOverheadForPacketCount:(unint64_t)a3
{
  unsigned int flags = self->_flags;
  LODWORD(v4) = (flags >> 2) & 8;
  if ((flags & 0x10) != 0) {
    uint64_t v4 = 20LL;
  }
  else {
    uint64_t v4 = v4;
  }
  uint64_t v5 = v4 + 40;
  if ((flags & 8) == 0) {
    uint64_t v5 = v4;
  }
  uint64_t v6 = v4 + 20;
  if ((flags & 4) != 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  return v7 * a3;
}

- (unint64_t)_adjustedByteCount:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a3 || (self->_flags & 0x10) == 0 && -[NWStatsSnapshot snapshotReason](self, "snapshotReason") != 2) {
    goto LABEL_19;
  }
  unint64_t v9 = -[NWStatsProtocolSnapshot _byteOverheadForPacketCount:](self, "_byteOverheadForPacketCount:", a5);
  if (a4)
  {
    if ((self->_flags & 0x10) == 0)
    {
      unint64_t v9 = (unint64_t)((double)a3 / (double)(a4 + a3) * (double)v9);
      goto LABEL_7;
    }

    NStatGetLog();
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
      _os_log_impl( &dword_187FF5000,  v11,  OS_LOG_TYPE_ERROR,  "Unexpected multiple interface usage for TCP flow %lld",  buf,  0xCu);
    }

    NStatGetLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = -[NWStatsProtocolSnapshot verboseDescription](self, "verboseDescription");
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = (unint64_t)v13;
      _os_log_impl(&dword_187FF5000, v12, OS_LOG_TYPE_ERROR, "Flow details %@", buf, 0xCu);
    }

LABEL_19:
    unint64_t v9 = 0LL;
    return v9 + a3;
  }

- (unint64_t)_deltaForCurrentBytes:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5 prevBytes:(unint64_t)a6 prevOtherBytes:(unint64_t)a7 prevPackets:(unint64_t)a8
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (a3 < a6)
  {
    uint64_t v11 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Flow anomaly: flow %lld has negative bytecount delta, old count %lld new count %lld",  -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"),  a6,  a3);
LABEL_5:
    v14 = (void *)v11;
    +[NWStatsProtocolSnapshot logFlowAnomaly:anomaly:]( &OBJC_CLASS___NWStatsProtocolSnapshot,  "logFlowAnomaly:anomaly:",  self,  v11);

    return 0LL;
  }

  if (a5 < a8)
  {
    uint64_t v11 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Flow anomaly: flow %lld has negative packet count delta, old count %lld new count %lld",  -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"),  a8,  a5);
    goto LABEL_5;
  }

  unint64_t v18 = -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  a3,  a4,  a5);
  unint64_t v19 = -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  a6,  a7,  a8);
  BOOL v20 = v18 >= v19;
  unint64_t result = v18 - v19;
  if (!v20)
  {
    NStatGetLog();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219520;
      unint64_t v23 = -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier");
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      unint64_t v29 = a5;
      __int16 v30 = 2048;
      unint64_t v31 = a6;
      __int16 v32 = 2048;
      unint64_t v33 = a7;
      __int16 v34 = 2048;
      unint64_t v35 = a8;
      _os_log_impl( &dword_187FF5000,  v21,  OS_LOG_TYPE_ERROR,  "Inverted numbers in delta calculations for flow %lld, current bytes %lld other bytes %lld pkts %lld when previou s bytes %lld other %lld pkts %lld",  buf,  0x48u);
    }

    return 0LL;
  }

  return result;
}

- (unint64_t)sourceIdentifier
{
  return self->_nstat_update.hdr.srcref;
}

- (unint64_t)eventFlags
{
  return self->_nstat_update.hdr.event_flags;
}

- (unint64_t)rxPackets
{
  return self->_nstat_update.hdr.counts.nstat_rxpackets;
}

- (unint64_t)rxBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxbytes;
}

- (unint64_t)rxCellularBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_nstat_update.hdr.counts.nstat_cell_rxbytes,  self->_nstat_update.hdr.counts.nstat_wired_rxbytes + self->_nstat_update.hdr.counts.nstat_wifi_rxbytes + self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)rxWiFiBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_nstat_update.hdr.counts.nstat_wifi_rxbytes,  self->_nstat_update.hdr.counts.nstat_wired_rxbytes + self->_nstat_update.hdr.counts.nstat_cell_rxbytes + self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)rxWiredBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_nstat_update.hdr.counts.nstat_wired_rxbytes,  self->_nstat_update.hdr.counts.nstat_wifi_rxbytes + self->_nstat_update.hdr.counts.nstat_cell_rxbytes + self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)rxCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_wifi_rxbytes + self->_nstat_update.hdr.counts.nstat_cell_rxbytes + self->_nstat_update.hdr.counts.nstat_wired_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets);
}

- (unint64_t)rawRxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes;
}

- (unint64_t)rawRxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes;
}

- (unint64_t)rawRxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes;
}

- (unint64_t)rawRxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_rxbytes;
}

- (unsigned)_rxDuplicateBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxduplicatebytes;
}

- (unsigned)_rxOutOfOrderBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxoutoforderbytes;
}

- (unint64_t)txPackets
{
  return self->_nstat_update.hdr.counts.nstat_txpackets;
}

- (unint64_t)txBytes
{
  return self->_nstat_update.hdr.counts.nstat_txbytes;
}

- (unint64_t)txCellularBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_nstat_update.hdr.counts.nstat_cell_txbytes,  self->_nstat_update.hdr.counts.nstat_wired_txbytes + self->_nstat_update.hdr.counts.nstat_wifi_txbytes + self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)txWiFiBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_nstat_update.hdr.counts.nstat_wifi_txbytes,  self->_nstat_update.hdr.counts.nstat_wired_txbytes + self->_nstat_update.hdr.counts.nstat_cell_txbytes + self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)txWiredBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_nstat_update.hdr.counts.nstat_wired_txbytes,  self->_nstat_update.hdr.counts.nstat_wifi_txbytes + self->_nstat_update.hdr.counts.nstat_cell_txbytes + self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)txCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _adjustedByteCount:otherBytes:packets:]( self,  "_adjustedByteCount:otherBytes:packets:",  self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_wifi_txbytes + self->_nstat_update.hdr.counts.nstat_cell_txbytes + self->_nstat_update.hdr.counts.nstat_wired_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets);
}

- (unint64_t)rawTxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_txbytes;
}

- (unint64_t)rawTxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_txbytes;
}

- (unint64_t)rawTxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_txbytes;
}

- (unint64_t)rawTxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_txbytes;
}

- (unsigned)_txRetransmittedBytes
{
  return self->_nstat_update.hdr.counts.nstat_txretransmit;
}

- (double)_rttMinimum
{
  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_min_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttAverage
{
  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_avg_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttVariation
{
  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_var_rtt;
  return (double)v2 / 32000.0;
}

- (unint64_t)deltaRxPackets
{
  return self->_nstat_update.hdr.counts.nstat_rxpackets - self->_prev_items.savedRxPackets;
}

- (unint64_t)deltaRxBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxbytes - self->_prev_items.savedRxBytes;
}

- (unint64_t)deltaTxPackets
{
  return self->_nstat_update.hdr.counts.nstat_txpackets - self->_prev_items.savedTxPackets;
}

- (unint64_t)deltaTxBytes
{
  return self->_nstat_update.hdr.counts.nstat_txbytes - self->_prev_items.savedTxBytes;
}

- (unint64_t)deltaRxCellularBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_nstat_update.hdr.counts.nstat_cell_rxbytes,  self->_nstat_update.hdr.counts.nstat_wired_rxbytes + self->_nstat_update.hdr.counts.nstat_wifi_rxbytes + self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets,  self->_prev_items.savedRxCellularBytes,  self->_prev_items.savedRxWiredBytes + self->_prev_items.savedRxWiFiBytes + self->_prev_items.savedRxCompanionLinkBluetoothBytes,  self->_prev_items.savedRxPackets);
}

- (unint64_t)deltaRxWiFiBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_nstat_update.hdr.counts.nstat_wifi_rxbytes,  self->_nstat_update.hdr.counts.nstat_wired_rxbytes + self->_nstat_update.hdr.counts.nstat_cell_rxbytes + self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets,  self->_prev_items.savedRxWiFiBytes,  self->_prev_items.savedRxWiredBytes + self->_prev_items.savedRxCellularBytes + self->_prev_items.savedRxCompanionLinkBluetoothBytes,  self->_prev_items.savedRxPackets);
}

- (unint64_t)deltaRxWiredBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_nstat_update.hdr.counts.nstat_wired_rxbytes,  self->_nstat_update.hdr.counts.nstat_wifi_rxbytes + self->_nstat_update.hdr.counts.nstat_cell_rxbytes + self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets,  self->_prev_items.savedRxWiredBytes,  self->_prev_items.savedRxWiFiBytes + self->_prev_items.savedRxCellularBytes + self->_prev_items.savedRxCompanionLinkBluetoothBytes,  self->_prev_items.savedRxPackets);
}

- (unint64_t)deltaRxCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_bluetooth_counts.nstat_rxbytes,  self->_nstat_update.hdr.counts.nstat_wifi_rxbytes + self->_nstat_update.hdr.counts.nstat_cell_rxbytes + self->_nstat_update.hdr.counts.nstat_wired_rxbytes,  self->_nstat_update.hdr.counts.nstat_rxpackets,  self->_prev_items.savedRxCompanionLinkBluetoothBytes,  self->_prev_items.savedRxWiFiBytes + self->_prev_items.savedRxCellularBytes + self->_prev_items.savedRxWiredBytes,  self->_prev_items.savedRxPackets);
}

- (unint64_t)deltaTxCellularBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_nstat_update.hdr.counts.nstat_cell_txbytes,  self->_nstat_update.hdr.counts.nstat_wired_txbytes + self->_nstat_update.hdr.counts.nstat_wifi_txbytes + self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets,  self->_prev_items.savedTxCellularBytes,  self->_prev_items.savedTxWiredBytes + self->_prev_items.savedTxWiFiBytes + self->_prev_items.savedTxCompanionLinkBluetoothBytes,  self->_prev_items.savedTxPackets);
}

- (unint64_t)deltaTxWiFiBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_nstat_update.hdr.counts.nstat_wifi_txbytes,  self->_nstat_update.hdr.counts.nstat_wired_txbytes + self->_nstat_update.hdr.counts.nstat_cell_txbytes + self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets,  self->_prev_items.savedTxWiFiBytes,  self->_prev_items.savedTxWiredBytes + self->_prev_items.savedTxCellularBytes + self->_prev_items.savedTxCompanionLinkBluetoothBytes,  self->_prev_items.savedTxPackets);
}

- (unint64_t)deltaTxWiredBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_nstat_update.hdr.counts.nstat_wired_txbytes,  self->_nstat_update.hdr.counts.nstat_wifi_txbytes + self->_nstat_update.hdr.counts.nstat_cell_txbytes + self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets,  self->_prev_items.savedTxWiredBytes,  self->_prev_items.savedTxWiFiBytes + self->_prev_items.savedTxCellularBytes + self->_prev_items.savedTxCompanionLinkBluetoothBytes,  self->_prev_items.savedTxPackets);
}

- (unint64_t)deltaTxCompanionLinkBluetoothBytes
{
  return -[NWStatsProtocolSnapshot _deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:]( self,  "_deltaForCurrentBytes:otherBytes:packets:prevBytes:prevOtherBytes:prevPackets:",  self->_bluetooth_counts.nstat_txbytes,  self->_nstat_update.hdr.counts.nstat_wifi_txbytes + self->_nstat_update.hdr.counts.nstat_cell_txbytes + self->_nstat_update.hdr.counts.nstat_wired_txbytes,  self->_nstat_update.hdr.counts.nstat_txpackets,  self->_prev_items.savedTxCompanionLinkBluetoothBytes,  self->_prev_items.savedTxWiFiBytes + self->_prev_items.savedTxCellularBytes + self->_prev_items.savedTxWiredBytes,  self->_prev_items.savedTxPackets);
}

- (unint64_t)rawDeltaRxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes - self->_prev_items.savedRxCellularBytes;
}

- (unint64_t)rawDeltaRxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes - self->_prev_items.savedRxWiFiBytes;
}

- (unint64_t)rawDeltaRxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes - self->_prev_items.savedRxWiredBytes;
}

- (unint64_t)rawDeltaRxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_rxbytes - self->_prev_items.savedRxCompanionLinkBluetoothBytes;
}

- (unint64_t)rawDeltaTxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_txbytes - self->_prev_items.savedTxCellularBytes;
}

- (unint64_t)rawDeltaTxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_txbytes - self->_prev_items.savedTxWiFiBytes;
}

- (unint64_t)rawDeltaTxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_txbytes - self->_prev_items.savedTxWiredBytes;
}

- (unint64_t)rawDeltaTxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_txbytes - self->_prev_items.savedTxCompanionLinkBluetoothBytes;
}

- (unint64_t)deltaAccountingRxCellularBytes
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot deltaRxCellularBytes](self, "deltaRxCellularBytes");
  unint64_t rxCellularBytes = self->_adjustment_bytes.rxCellularBytes;
  BOOL v5 = v3 >= rxCellularBytes;
  unint64_t result = v3 - rxCellularBytes;
  if (!v5)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = -[NWStatsProtocolSnapshot deltaRxCellularBytes](self, "deltaRxCellularBytes");
      unint64_t v9 = self->_adjustment_bytes.rxCellularBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxCellularBytes = %llu, adjustmentRxCellularBytes = %llu",  (uint8_t *)&v10,  0x16u);
    }

    return 0LL;
  }

  return result;
}

- (unint64_t)deltaAccountingRxWiFiBytes
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot deltaRxWiFiBytes](self, "deltaRxWiFiBytes");
  unint64_t rxWiFiBytes = self->_adjustment_bytes.rxWiFiBytes;
  BOOL v5 = v3 >= rxWiFiBytes;
  unint64_t result = v3 - rxWiFiBytes;
  if (!v5)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = -[NWStatsProtocolSnapshot deltaRxWiFiBytes](self, "deltaRxWiFiBytes");
      unint64_t v9 = self->_adjustment_bytes.rxWiFiBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxWiFiBytes = %llu, adjustmentRxWiFiBytes = %llu",  (uint8_t *)&v10,  0x16u);
    }

    return 0LL;
  }

  return result;
}

- (unint64_t)deltaAccountingRxWiredBytes
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot deltaRxWiredBytes](self, "deltaRxWiredBytes");
  unint64_t rxWiredBytes = self->_adjustment_bytes.rxWiredBytes;
  BOOL v5 = v3 >= rxWiredBytes;
  unint64_t result = v3 - rxWiredBytes;
  if (!v5)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = -[NWStatsProtocolSnapshot deltaRxWiredBytes](self, "deltaRxWiredBytes");
      unint64_t v9 = self->_adjustment_bytes.rxWiredBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxWiredBytes = %llu, adjustmentRxWiredBytes = %llu",  (uint8_t *)&v10,  0x16u);
    }

    return 0LL;
  }

  return result;
}

- (unint64_t)deltaAccountingTxCellularBytes
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot deltaTxCellularBytes](self, "deltaTxCellularBytes");
  unint64_t txCellularBytes = self->_adjustment_bytes.txCellularBytes;
  BOOL v5 = v3 >= txCellularBytes;
  unint64_t result = v3 - txCellularBytes;
  if (!v5)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = -[NWStatsProtocolSnapshot deltaTxCellularBytes](self, "deltaTxCellularBytes");
      unint64_t v9 = self->_adjustment_bytes.txCellularBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxCellularBytes = %llu, adjustmentTxCellularBytes = %llu",  (uint8_t *)&v10,  0x16u);
    }

    return 0LL;
  }

  return result;
}

- (unint64_t)deltaAccountingTxWiFiBytes
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot deltaTxWiFiBytes](self, "deltaTxWiFiBytes");
  unint64_t txWiFiBytes = self->_adjustment_bytes.txWiFiBytes;
  BOOL v5 = v3 >= txWiFiBytes;
  unint64_t result = v3 - txWiFiBytes;
  if (!v5)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = -[NWStatsProtocolSnapshot deltaTxWiFiBytes](self, "deltaTxWiFiBytes");
      unint64_t v9 = self->_adjustment_bytes.txWiFiBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxWiFiBytes = %llu, adjustmentTxWiFiBytes = %llu",  (uint8_t *)&v10,  0x16u);
    }

    return 0LL;
  }

  return result;
}

- (unint64_t)deltaAccountingTxWiredBytes
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot deltaTxWiredBytes](self, "deltaTxWiredBytes");
  unint64_t txWiredBytes = self->_adjustment_bytes.txWiredBytes;
  BOOL v5 = v3 >= txWiredBytes;
  unint64_t result = v3 - txWiredBytes;
  if (!v5)
  {
    NStatGetLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = -[NWStatsProtocolSnapshot deltaTxWiredBytes](self, "deltaTxWiredBytes");
      unint64_t v9 = self->_adjustment_bytes.txWiredBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl( &dword_187FF5000,  v7,  OS_LOG_TYPE_ERROR,  "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxWiredBytes = %llu, adjustmentTxWiredBytes = %llu",  (uint8_t *)&v10,  0x16u);
    }

    return 0LL;
  }

  return result;
}

- (unsigned)_deltaRxDuplicateBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxduplicatebytes - self->_prev_items.savedRxDuplicateBytes;
}

- (unsigned)_deltaRxOutOfOrderBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxoutoforderbytes - self->_prev_items.savedRxOutOfOrderBytes;
}

- (unsigned)_deltaTxRetransmittedBytes
{
  return self->_nstat_update.hdr.counts.nstat_txretransmit - self->_prev_items.savedTxRetransmittedBytes;
}

- (BOOL)hasTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes
      || self->_nstat_update.hdr.counts.nstat_wifi_txbytes
      || self->_nstat_update.hdr.counts.nstat_cell_rxbytes
      || self->_nstat_update.hdr.counts.nstat_cell_txbytes
      || self->_nstat_update.hdr.counts.nstat_wired_rxbytes
      || self->_nstat_update.hdr.counts.nstat_wired_txbytes != 0;
}

- (BOOL)hasTrafficDelta
{
  return -[NWStatsProtocolSnapshot hasCellTrafficDelta](self, "hasCellTrafficDelta")
      || -[NWStatsProtocolSnapshot hasWiFiTrafficDelta](self, "hasWiFiTrafficDelta")
      || -[NWStatsProtocolSnapshot hasWiredTrafficDelta](self, "hasWiredTrafficDelta");
}

- (BOOL)hasCellTraffic
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes || self->_nstat_update.hdr.counts.nstat_cell_txbytes != 0;
}

- (BOOL)hasCellTrafficDelta
{
  return -[NWStatsProtocolSnapshot rawDeltaRxCellularBytes](self, "rawDeltaRxCellularBytes")
      || -[NWStatsProtocolSnapshot rawDeltaTxCellularBytes](self, "rawDeltaTxCellularBytes") != 0;
}

- (BOOL)hasWiFiTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes || self->_nstat_update.hdr.counts.nstat_wifi_txbytes != 0;
}

- (BOOL)hasWiFiTrafficDelta
{
  return -[NWStatsProtocolSnapshot rawDeltaRxWiFiBytes](self, "rawDeltaRxWiFiBytes")
      || -[NWStatsProtocolSnapshot rawDeltaTxWiFiBytes](self, "rawDeltaTxWiFiBytes") != 0;
}

- (BOOL)hasWiredTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes || self->_nstat_update.hdr.counts.nstat_wired_txbytes != 0;
}

- (BOOL)hasWiredTrafficDelta
{
  return -[NWStatsProtocolSnapshot rawDeltaRxWiredBytes](self, "rawDeltaRxWiredBytes")
      || -[NWStatsProtocolSnapshot rawDeltaTxWiredBytes](self, "rawDeltaTxWiredBytes") != 0;
}

- (const)_update_delta_ptr
{
  return &self->_prev_items;
}

- (accumulator_bytes)_update_adjustment_bytes
{
  return &self->_adjustment_bytes;
}

- (const)_update_ptr
{
  return &self->_nstat_update;
}

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  if (uuid_is_null(a3)) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3];
  }
  return v4;
}

- (BOOL)failedConsistencyChecks
{
  return (self->_flags & 0xF00) != 0;
}

- (BOOL)failedNegativeDeltaCheck
{
  return BYTE1(self->_flags) & 1;
}

- (BOOL)failedTCPMultipleInterfaceCheck
{
  return (BYTE1(self->_flags) >> 2) & 1;
}

- (BOOL)failedRxCountCheck
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)isSimpleInterface:(unsigned int)a3
{
  if (getifaddrs(&v9) < 0) {
    return 0;
  }
  uint64_t v4 = v9;
  if (!v9)
  {
LABEL_11:
    MEMORY[0x1895BB018](v4);
    return 0;
  }

  BOOL v5 = v9;
  while (1)
  {
    ifa_addr = v5->ifa_addr;
    if (ifa_addr)
    {
      ifa_name = v5->ifa_name;
      if (ifa_name)
      {
        if (ifa_addr->sa_family == 18
          && *(unsigned __int16 *)ifa_addr->sa_data == a3
          && (!strncmp(v5->ifa_name, "en", 2uLL) || !strncmp(ifa_name, "pdp", 3uLL)))
        {
          break;
        }
      }
    }

    BOOL v5 = v5->ifa_next;
    if (!v5) {
      goto LABEL_11;
    }
  }

  MEMORY[0x1895BB018](v4);
  return 1;
}

- (BOOL)isKnownVPNFromKernel
{
  return LOBYTE(self->_flags) >> 7;
}

- (void)runConsistencyChecks
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  uint64_t v4 = -[NWStatsProtocolSnapshot _update_delta_ptr](self, "_update_delta_ptr");
  unint64_t nstat_rxbytes = v3->hdr.counts.nstat_rxbytes;
  if (v3->hdr.counts.nstat_rxpackets < v4->savedRxPackets
    || nstat_rxbytes < v4->savedRxBytes
    || v3->hdr.counts.nstat_txpackets < v4->savedTxPackets
    || v3->hdr.counts.nstat_txbytes < v4->savedTxBytes
    || (unint64_t nstat_cell_rxbytes = v3->hdr.counts.nstat_cell_rxbytes, nstat_cell_rxbytes < v4->savedRxCellularBytes)
    || v3->hdr.counts.nstat_cell_txbytes < v4->savedTxCellularBytes
    || (unint64_t nstat_wifi_rxbytes = v3->hdr.counts.nstat_wifi_rxbytes, nstat_wifi_rxbytes < v4->savedRxWiFiBytes)
    || v3->hdr.counts.nstat_wifi_txbytes < v4->savedTxWiFiBytes
    || (unint64_t nstat_wired_rxbytes = v3->hdr.counts.nstat_wired_rxbytes, nstat_wired_rxbytes < v4->savedRxWiredBytes)
    || v3->hdr.counts.nstat_wired_txbytes < v4->savedTxWiredBytes
    || v3->hdr.counts.nstat_rxduplicatebytes < v4->savedRxDuplicateBytes
    || v3->hdr.counts.nstat_rxoutoforderbytes < v4->savedRxOutOfOrderBytes
    || v3->hdr.counts.nstat_txretransmit < v4->savedTxRetransmittedBytes)
  {
    self->_flags |= 0x100u;
    unint64_t nstat_cell_rxbytes = v3->hdr.counts.nstat_cell_rxbytes;
    unint64_t nstat_wifi_rxbytes = v3->hdr.counts.nstat_wifi_rxbytes;
    unint64_t nstat_wired_rxbytes = v3->hdr.counts.nstat_wired_rxbytes;
  }

  if (nstat_wifi_rxbytes + nstat_cell_rxbytes + nstat_wired_rxbytes < nstat_rxbytes
    && !-[NWStatsProtocolSnapshot interfaceUnknown](self, "interfaceUnknown")
    && !-[NWStatsProtocolSnapshot interfaceLoopback](self, "interfaceLoopback")
    && !-[NWStatsProtocolSnapshot interfaceCompanionLink](self, "interfaceCompanionLink")
    && (self->_flags & 0x10) != 0
    && -[NWStatsProtocolSnapshot noBluetoothUseExpected:]( self,  "noBluetoothUseExpected:",  -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"))
    && v3->hdr.counts.nstat_cell_rxbytes + v3->hdr.counts.nstat_wifi_rxbytes + v3->hdr.counts.nstat_wired_rxbytes + 100 < v3->hdr.counts.nstat_rxbytes)
  {
    self->_flags |= 0x200u;
  }

  if ((self->_flags & 0x10) != 0)
  {
    if (v3->hdr.counts.nstat_cell_rxbytes || (unint64_t nstat_cell_txbytes = v3->hdr.counts.nstat_cell_txbytes) != 0) {
      LODWORD(nstat_cell_txbytes) = 1;
    }
    if (v3->hdr.counts.nstat_wifi_rxbytes || v3->hdr.counts.nstat_wifi_txbytes) {
      LODWORD(nstat_cell_txbytes) = nstat_cell_txbytes + 1;
    }
    if (v3->hdr.counts.nstat_wired_rxbytes || v3->hdr.counts.nstat_wired_txbytes) {
      LODWORD(nstat_cell_txbytes) = nstat_cell_txbytes + 1;
    }
    if (nstat_cell_txbytes >= 2
      && -[NWStatsProtocolSnapshot fixedInterfaceUseExpected:]( self,  "fixedInterfaceUseExpected:",  -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex")))
    {
      self->_flags |= 0x400u;
    }
  }

  BOOL v10 = -[NWStatsProtocolSnapshot failedSkywalkAction](self, "failedSkywalkAction");
  unsigned int flags = self->_flags;
  if (v10)
  {
    flags |= 0x800u;
    self->_unsigned int flags = flags;
  }

  if ((flags & 0xF00) != 0)
  {
    NStatGetLog();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = self->_flags;
      uint64_t v14 = &stru_18A1B7BD8;
      if ((v13 & 0x100) != 0) {
        id v15 = @"(negative delta) ";
      }
      else {
        id v15 = &stru_18A1B7BD8;
      }
      if ((v13 & 0x200) != 0) {
        unint64_t v16 = @"(inconsistent rx counts) ";
      }
      else {
        unint64_t v16 = &stru_18A1B7BD8;
      }
      if ((v13 & 0x400) != 0) {
        uint64_t v17 = @"(multiple TCP interfaces) ";
      }
      else {
        uint64_t v17 = &stru_18A1B7BD8;
      }
      if (-[NWStatsProtocolSnapshot failedRouteValuesLookup](self, "failedRouteValuesLookup")) {
        unint64_t v18 = @"(no route lookup) ";
      }
      else {
        unint64_t v18 = &stru_18A1B7BD8;
      }
      if (-[NWStatsProtocolSnapshot failedFlowswitchValuesLookup](self, "failedFlowswitchValuesLookup")) {
        uint64_t v14 = @"(no flowswitch lookup) ";
      }
      -[NWStatsProtocolSnapshot verboseDescription](self, "verboseDescription");
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = 138413570;
      v21 = v15;
      __int16 v22 = 2112;
      unint64_t v23 = v16;
      __int16 v24 = 2112;
      unint64_t v25 = v17;
      __int16 v26 = 2112;
      unint64_t v27 = v18;
      __int16 v28 = 2112;
      unint64_t v29 = v14;
      __int16 v30 = 2112;
      unint64_t v31 = v19;
      _os_log_impl( &dword_187FF5000,  v12,  OS_LOG_TYPE_ERROR,  "failed consistency checks %@%@%@%@%@ %@",  (uint8_t *)&v20,  0x3Eu);
    }
  }

- (NWStatsProtocolSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NWStatsProtocolSnapshot;
  __int16 v12 = -[NWStatsProtocolSnapshot init](&v27, sel_init, a3, *(void *)&a5, a6, a7, a8, a4);
  unsigned int v13 = (NWStatsProtocolSnapshot *)v12;
  if (v12)
  {
    *((_DWORD *)v12 + 44) = a5;
    __int128 v15 = *(_OWORD *)&a6->savedTxPackets;
    __int128 v14 = *(_OWORD *)&a6->savedRxCellularBytes;
    *(_OWORD *)(v12 + 184) = *(_OWORD *)&a6->savedRxPackets;
    *(_OWORD *)(v12 + 200) = v15;
    *(_OWORD *)(v12 + 216) = v14;
    __int128 v16 = *(_OWORD *)&a6->savedRxDuplicateBytes;
    __int128 v18 = *(_OWORD *)&a6->savedRxWiredBytes;
    __int128 v17 = *(_OWORD *)&a6->savedTxCellularBytes;
    *(_OWORD *)(v12 + 264) = *(_OWORD *)&a6->savedTxWiredBytes;
    *(_OWORD *)(v12 + 280) = v16;
    *(_OWORD *)(v12 + 232) = v18;
    *(_OWORD *)(v12 + 248) = v17;
    v12[900] = 0;
    if (a7)
    {
      __int128 v19 = *(_OWORD *)&a7->nstat_txpackets;
      *(_OWORD *)(v12 + 840) = *(_OWORD *)&a7->nstat_rxpackets;
      *(_OWORD *)(v12 + 856) = v19;
    }

    unsigned int provider = a3->hdr.provider;
    if (provider <= 0xA)
    {
      if (((1 << provider) & 0x430) != 0)
      {
        v21 = v12 + 344;
        __int16 v22 = a3;
        size_t v23 = 432LL;
        goto LABEL_10;
      }

      if (((1 << provider) & 0xC) != 0 || provider == 8)
      {
        v21 = v12 + 344;
        __int16 v22 = a3;
        size_t v23 = 496LL;
LABEL_10:
        memcpy(v21, v22, v23);
        return v13;
      }
    }

    NStatGetLog();
    unint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = a3->hdr.provider;
      *(_DWORD *)buf = 67109120;
      unsigned int v29 = v26;
      _os_log_impl(&dword_187FF5000, v25, OS_LOG_TYPE_ERROR, "unknown provider %d type for snapshot", buf, 8u);
    }

    return 0LL;
  }

  return v13;
}

- (id)_tcpDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->upid];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->eupid];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"eupid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->start_timestamp];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"start_timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->timestamp];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->ifindex];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:@"ifindex"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->state];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"state"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->sndbufsize];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"sndbufsize"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->sndbufused];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"sndbufused"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->rcvbufsize];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"rcvbufsize"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->rcvbufused];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"rcvbufused"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->txunacked];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"txunacked"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->txwindow];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v16 forKeyedSubscript:@"txwindow"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->txcwindow];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:@"txcwindow"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->traffic_class];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v18 forKeyedSubscript:@"traffic_class"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->traffic_mgt_flags];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v19 forKeyedSubscript:@"traffic_mgt_flags"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->pid];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v20 forKeyedSubscript:@"pid"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->epid];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v21 forKeyedSubscript:@"epid"];

  [v4 setObject:@"tbd" forKeyedSubscript:@"local"];
  [v4 setObject:@"tbd" forKeyedSubscript:@"remote"];
  [NSString stringWithUTF8String:a3->cc_algo];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v22 forKeyedSubscript:@"cc_algo"];

  [NSString stringWithUTF8String:a3->pname];
  size_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v23 forKeyedSubscript:@"pname"];

  __int16 v24 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->uuid];
  [v24 UUIDString];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v25 forKeyedSubscript:@"uuid"];

  unsigned int v26 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->euuid];
  [v26 UUIDString];
  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v27 forKeyedSubscript:@"euuid"];

  __int16 v28 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->vuuid];
  [v28 UUIDString];
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v29 forKeyedSubscript:@"vuuid"];

  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->fuuid];
  [v30 UUIDString];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v31 forKeyedSubscript:@"fuuid"];

  [MEMORY[0x189607968] numberWithUnsignedShort:LOWORD(a3->ifnet_properties)];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v32 forKeyedSubscript:@"ifnet_properties"];

  [MEMORY[0x189607968] numberWithBool:a3->var0.__pad_connstatus[0] & 1];
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v33 forKeyedSubscript:@"probe_activated"];

  [MEMORY[0x189607968] numberWithBool:(a3->var0.__pad_connstatus[0] >> 1) & 1];
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v34 forKeyedSubscript:@"write_probe_failed"];

  [MEMORY[0x189607968] numberWithBool:(a3->var0.__pad_connstatus[0] >> 2) & 1];
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v35 forKeyedSubscript:@"read_probe_failed"];

  [MEMORY[0x189607968] numberWithBool:(a3->var0.__pad_connstatus[0] >> 3) & 1];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v36 forKeyedSubscript:@"conn_probe_failed"];

  return v4;
}

- (id)_udpDescriptorDictionaryForm:(nstat_udp_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->upid];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->eupid];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"eupid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->start_timestamp];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"start_timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->timestamp];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->ifindex];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:@"ifindex"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->rcvbufsize];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"rcvbufsize"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->rcvbufused];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"rcvbufused"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->traffic_class];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"traffic_class"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->pid];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"pid"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->epid];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"epid"];

  [v4 setObject:@"tbd" forKeyedSubscript:@"local"];
  [v4 setObject:@"tbd" forKeyedSubscript:@"remote"];
  [NSString stringWithUTF8String:a3->pname];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"pname"];

  __int128 v16 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->uuid];
  [v16 UUIDString];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:@"uuid"];

  __int128 v18 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->euuid];
  [v18 UUIDString];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v19 forKeyedSubscript:@"euuid"];

  int v20 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->vuuid];
  [v20 UUIDString];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v21 forKeyedSubscript:@"vuuid"];

  __int16 v22 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->fuuid];
  [v22 UUIDString];
  size_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v23 forKeyedSubscript:@"fuuid"];

  [MEMORY[0x189607968] numberWithUnsignedShort:LOWORD(a3->ifnet_properties)];
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v24 forKeyedSubscript:@"ifnet_properties"];

  return v4;
}

- (id)_quicDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->upid];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->eupid];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"eupid"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->start_timestamp];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"start_timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->timestamp];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"timestamp"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->ifindex];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:@"ifindex"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->state];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"state"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->sndbufsize];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"sndbufsize"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->sndbufused];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"sndbufused"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->rcvbufsize];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"rcvbufsize"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->rcvbufused];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"rcvbufused"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->txunacked];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"txunacked"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->txwindow];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v16 forKeyedSubscript:@"txwindow"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->txcwindow];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:@"txcwindow"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->traffic_class];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v18 forKeyedSubscript:@"traffic_class"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->traffic_mgt_flags];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v19 forKeyedSubscript:@"traffic_mgt_flags"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->pid];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v20 forKeyedSubscript:@"pid"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->epid];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v21 forKeyedSubscript:@"epid"];

  [v4 setObject:@"tbd" forKeyedSubscript:@"local"];
  [v4 setObject:@"tbd" forKeyedSubscript:@"remote"];
  [NSString stringWithUTF8String:a3->cc_algo];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v22 forKeyedSubscript:@"cc_algo"];

  [NSString stringWithUTF8String:a3->pname];
  size_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v23 forKeyedSubscript:@"pname"];

  __int16 v24 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->uuid];
  [v24 UUIDString];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v25 forKeyedSubscript:@"uuid"];

  unsigned int v26 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->euuid];
  [v26 UUIDString];
  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v27 forKeyedSubscript:@"euuid"];

  __int16 v28 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->vuuid];
  [v28 UUIDString];
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v29 forKeyedSubscript:@"vuuid"];

  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3->fuuid];
  [v30 UUIDString];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v31 forKeyedSubscript:@"fuuid"];

  [MEMORY[0x189607968] numberWithUnsignedShort:LOWORD(a3->ifnet_properties)];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v32 forKeyedSubscript:@"ifnet_properties"];

  [MEMORY[0x189607968] numberWithBool:a3->var0.__pad_connstatus[0] & 1];
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v33 forKeyedSubscript:@"probe_activated"];

  [MEMORY[0x189607968] numberWithBool:(a3->var0.__pad_connstatus[0] >> 1) & 1];
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v34 forKeyedSubscript:@"write_probe_failed"];

  [MEMORY[0x189607968] numberWithBool:(a3->var0.__pad_connstatus[0] >> 2) & 1];
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v35 forKeyedSubscript:@"read_probe_failed"];

  [MEMORY[0x189607968] numberWithBool:(a3->var0.__pad_connstatus[0] >> 3) & 1];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v36 forKeyedSubscript:@"conn_probe_failed"];

  return v4;
}

- (id)_nstatCountsDictionaryForm:(nstat_counts *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_rxpackets];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:@"nstat_rxpackets"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_txpackets];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"nstat_txpackets"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_rxbytes];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:@"nstat_rxbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_txbytes];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKeyedSubscript:@"nstat_txbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_cell_rxbytes];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v9 forKeyedSubscript:@"nstat_cell_rxbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_cell_txbytes];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v10 forKeyedSubscript:@"nstat_cell_txbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_wifi_rxbytes];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v11 forKeyedSubscript:@"nstat_wifi_rxbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_wifi_txbytes];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v12 forKeyedSubscript:@"nstat_wifi_txbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_wired_rxbytes];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKeyedSubscript:@"nstat_wired_rxbytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3->nstat_wired_txbytes];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v14 forKeyedSubscript:@"nstat_wired_txbytes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_rxduplicatebytes];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v15 forKeyedSubscript:@"nstat_rxduplicatebytes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_rxoutoforderbytes];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v16 forKeyedSubscript:@"nstat_rxoutoforderbytes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_txretransmit];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v17 forKeyedSubscript:@"nstat_txretransmit"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_connectattempts];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v18 forKeyedSubscript:@"nstat_connectattempts"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_connectsuccesses];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v19 forKeyedSubscript:@"nstat_connectsuccesses"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_min_rtt];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v20 forKeyedSubscript:@"nstat_min_rtt"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_avg_rtt];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v21 forKeyedSubscript:@"nstat_avg_rtt"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a3->nstat_var_rtt];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v22 forKeyedSubscript:@"nstat_var_rtt"];

  return v4;
}

- (id)dictionaryForm
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = (void *)MEMORY[0x189607968];
  -[NWStatsProtocolSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
  *(float *)&double v5 = v5;
  [v4 numberWithFloat:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:@"_startStamp"];

  uint64_t v7 = (void *)MEMORY[0x189607968];
  -[NWStatsProtocolSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
  [v7 numberWithUnsignedLongLong:(unint64_t)(v8 * 1000000.0)];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKeyedSubscript:@"_startStampUsecs"];

  BOOL v10 = (void *)MEMORY[0x189607968];
  -[NWStatsProtocolSnapshot flowSnapshotTimeIntervalSinceReferenceDate]( self,  "flowSnapshotTimeIntervalSinceReferenceDate");
  [v10 numberWithUnsignedLongLong:(unint64_t)(v11 * 1000000.0)];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKeyedSubscript:@"_snapStampUsecs"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_flags];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKeyedSubscript:@"_flags"];

  -[NWStatsSnapshot attributedEntity](self, "attributedEntity");
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    [v3 setObject:v14 forKeyedSubscript:@"attributedEntity"];
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v15 forKeyedSubscript:@"attributedEntity"];
  }

  -[NWStatsSnapshot delegateName](self, "delegateName");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    [v3 setObject:v16 forKeyedSubscript:@"delegateName"];
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v17 forKeyedSubscript:@"delegateName"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[NWStatsSnapshot attributionReason](self, "attributionReason"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v18 forKeyedSubscript:@"attributionReason"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[NWStatsSnapshot snapshotReason](self, "snapshotReason"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v19 forKeyedSubscript:@"snapshotReason"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsSnapshot startAppStateIsForeground](self, "startAppStateIsForeground"));
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v20 forKeyedSubscript:@"startAppStateIsForeground"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsSnapshot snapshotAppStateIsForeground](self, "snapshotAppStateIsForeground"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v21 forKeyedSubscript:@"snapshotAppStateIsForeground"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsSnapshot startScreenStateOn](self, "startScreenStateOn"));
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v22 forKeyedSubscript:@"startScreenStateOn"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsSnapshot snapshotScreenStateOn](self, "snapshotScreenStateOn"));
  size_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v23 forKeyedSubscript:@"snapshotScreenStateOn"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v24 forKeyedSubscript:@"delegateAttributionReason"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NWStatsProtocolSnapshot uiBackgroundAudioCapable](self, "uiBackgroundAudioCapable"));
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v25 forKeyedSubscript:@"uiBackgroundAudioCapable"];

  id v26 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedRxPackets];
  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v27 forKeyedSubscript:@"savedRxPackets"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedTxPackets];
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v28 forKeyedSubscript:@"savedTxPackets"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedRxBytes];
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v29 forKeyedSubscript:@"savedRxBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedTxBytes];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v30 forKeyedSubscript:@"savedTxBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedRxCellularBytes];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v31 forKeyedSubscript:@"savedRxCellularBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedTxCellularBytes];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v32 forKeyedSubscript:@"savedTxCellularBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedRxWiFiBytes];
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v33 forKeyedSubscript:@"savedRxWiFiBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedTxWiFiBytes];
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v34 forKeyedSubscript:@"savedTxWiFiBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedRxWiredBytes];
  unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v35 forKeyedSubscript:@"savedRxWiredBytes"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_prev_items.savedTxWiredBytes];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v36 forKeyedSubscript:@"savedTxWiredBytes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_prev_items.savedRxDuplicateBytes];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v37 forKeyedSubscript:@"savedRxDuplicateBytes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_prev_items.savedRxOutOfOrderBytes];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v38 forKeyedSubscript:@"savedRxOutOfOrderBytes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_prev_items.savedTxRetransmittedBytes];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setObject:v39 forKeyedSubscript:@"savedTxRetransmittedBytes"];

  [v3 setObject:v26 forKeyedSubscript:@"_prev_items"];
  id v40 = objc_alloc_init(MEMORY[0x189603FC8]);
  p_nstat_update = &self->_nstat_update;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_nstat_update.hdr.srcref];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 setObject:v42 forKeyedSubscript:@"srcref"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_nstat_update.hdr.event_flags];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 setObject:v43 forKeyedSubscript:@"event_flags"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nstat_update.hdr.provider];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 setObject:v44 forKeyedSubscript:@"provider"];

  id v45 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_nstat_update.hdr.hdr.context];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 setObject:v46 forKeyedSubscript:@"context"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nstat_update.hdr.hdr.type];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 setObject:v47 forKeyedSubscript:@"type"];

  [MEMORY[0x189607968] numberWithUnsignedShort:self->_nstat_update.hdr.hdr.length];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 setObject:v48 forKeyedSubscript:@"length"];

  [MEMORY[0x189607968] numberWithUnsignedShort:self->_nstat_update.hdr.hdr.flags];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 setObject:v49 forKeyedSubscript:@"flags"];

  [v40 setObject:v45 forKeyedSubscript:@"hdr"];
  v50 = -[NWStatsProtocolSnapshot _nstatCountsDictionaryForm:]( self,  "_nstatCountsDictionaryForm:",  &self->_nstat_update.hdr.counts);
  [v40 setObject:v50 forKeyedSubscript:@"counts"];

  unsigned int provider = self->_nstat_update.hdr.provider;
  if (provider <= 0xA)
  {
    if (((1 << provider) & 0x430) != 0)
    {
      -[NWStatsProtocolSnapshot _udpDescriptorDictionaryForm:]( self,  "_udpDescriptorDictionaryForm:",  &self->_nstat_update.var0);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v53 = @"udp_descriptor";
      goto LABEL_14;
    }

    if (((1 << provider) & 0xC) != 0)
    {
      -[NWStatsProtocolSnapshot _tcpDescriptorDictionaryForm:]( self,  "_tcpDescriptorDictionaryForm:",  &self->_nstat_update.var0);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v53 = @"tcp_descriptor";
LABEL_14:
      [v40 setObject:v52 forKeyedSubscript:v53];
      goto LABEL_15;
    }

    if (provider == 8)
    {
      -[NWStatsProtocolSnapshot _quicDescriptorDictionaryForm:]( self,  "_quicDescriptorDictionaryForm:",  &self->_nstat_update.var0);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v53 = @"quic_descriptor";
      goto LABEL_14;
    }
  }

  NStatGetLog();
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    unsigned int v55 = p_nstat_update->hdr.provider;
    v56[0] = 67109120;
    v56[1] = v55;
    _os_log_impl( &dword_187FF5000,  v52,  OS_LOG_TYPE_ERROR,  "Unexpected provider %d when converting to dictionary form",  (uint8_t *)v56,  8u);
  }

+ (void)logFlowAnomaly:(id)a3 anomaly:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&flowsWithAnomalousCountsLock);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v5, "sourceIdentifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 snapshotReason] == 2)
  {
    [(id)flowsWithAnomalousCounts removeObject:v7];
  }

  else
  {
    if ((unint64_t)[(id)flowsWithAnomalousCounts count] > 0x64
      || ([(id)flowsWithAnomalousCounts containsObject:v7] & 1) != 0)
    {
      goto LABEL_11;
    }

    [(id)flowsWithAnomalousCounts addObject:v7];
  }

  NStatGetLog();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_187FF5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
  }

  NStatGetLog();
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v5 verboseDescription];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl( &dword_187FF5000,  v9,  OS_LOG_TYPE_DEFAULT,  "Flow details for anomalous flow condition: %{pubic}@",  (uint8_t *)&v11,  0xCu);
  }

LABEL_11:
  os_unfair_lock_unlock((os_unfair_lock_t)&flowsWithAnomalousCountsLock);
}

+ (void)_initializeTCPDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4
{
  id v76 = a4;
  [v76 objectForKeyedSubscript:@"upid"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->upid = [v5 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"eupid"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->eupid = [v6 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"start_timestamp"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  a3->start_timestamp = [v7 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"timestamp"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3->timestamp = [v8 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"ifindex"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifindex = [v9 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"state"];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->state = [v10 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"sndbufsize"];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufsize = [v11 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"sndbufused"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufused = [v12 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"rcvbufsize"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufsize = [v13 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"rcvbufused"];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufused = [v14 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"txunacked"];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txunacked = [v15 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"txwindow"];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txwindow = [v16 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"txcwindow"];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txcwindow = [v17 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"traffic_class"];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_class = [v18 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"traffic_mgt_flags"];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_mgt_unsigned int flags = [v19 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"pid"];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  a3->pid = [v20 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"epid"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  a3->epid = [v21 unsignedIntValue];

  uint64_t v22 = [v76 objectForKeyedSubscript:@"cc_algo"];
  if (v22)
  {
    size_t v23 = (void *)v22;
    [v76 objectForKeyedSubscript:@"cc_algo"];
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      id v26 = [v76 objectForKeyedSubscript:@"cc_algo"];
      objc_super v27 = (unsigned __int8 *)[v26 UTF8String];
      if (!v27) {
        goto LABEL_47;
      }
      cc_algo = a3->cc_algo;
      uint64_t v29 = 16LL;
      while (1)
      {
        int v30 = *v27;
        char *cc_algo = v30;
        if (!v30) {
          break;
        }
        ++cc_algo;
        ++v27;
        if ((unint64_t)--v29 <= 1)
        {
          char *cc_algo = 0;
          break;
        }
      }
    }
  }

  uint64_t v31 = [v76 objectForKeyedSubscript:@"pname"];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    [v76 objectForKeyedSubscript:@"pname"];
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
      id v35 = [v76 objectForKeyedSubscript:@"pname"];
      uint64_t v36 = (unsigned __int8 *)[v35 UTF8String];
      if (v36)
      {
        pname = a3->pname;
        uint64_t v38 = 64LL;
        while (1)
        {
          int v39 = *v36;
          char *pname = v39;
          if (!v39) {
            break;
          }
          ++pname;
          ++v36;
          if ((unint64_t)--v38 <= 1)
          {
            char *pname = 0;
            break;
          }
        }

        goto LABEL_17;
      }

+ (void)_initializeUDPDescriptor:(nstat_udp_descriptor *)a3 fromDictionary:(id)a4
{
  id v53 = a4;
  [v53 objectForKeyedSubscript:@"upid"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->upid = [v5 unsignedLongLongValue];

  [v53 objectForKeyedSubscript:@"eupid"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->eupid = [v6 unsignedLongLongValue];

  [v53 objectForKeyedSubscript:@"start_timestamp"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  a3->start_timestamp = [v7 unsignedLongLongValue];

  [v53 objectForKeyedSubscript:@"timestamp"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3->timestamp = [v8 unsignedLongLongValue];

  [v53 objectForKeyedSubscript:@"ifindex"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifindex = [v9 unsignedIntValue];

  [v53 objectForKeyedSubscript:@"rcvbufsize"];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufsize = [v10 unsignedIntValue];

  [v53 objectForKeyedSubscript:@"rcvbufused"];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufused = [v11 unsignedIntValue];

  [v53 objectForKeyedSubscript:@"traffic_class"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_class = [v12 unsignedIntValue];

  [v53 objectForKeyedSubscript:@"pid"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  a3->pid = [v13 unsignedIntValue];

  [v53 objectForKeyedSubscript:@"epid"];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  a3->epid = [v14 unsignedIntValue];

  uint64_t v15 = [v53 objectForKeyedSubscript:@"pname"];
  if (v15)
  {
    __int128 v16 = (void *)v15;
    [v53 objectForKeyedSubscript:@"pname"];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      id v19 = [v53 objectForKeyedSubscript:@"pname"];
      int v20 = (unsigned __int8 *)[v19 UTF8String];
      if (!v20)
      {
        __break(1u);
        return;
      }

      pname = a3->pname;
      uint64_t v22 = 64LL;
      while (1)
      {
        int v23 = *v20;
        char *pname = v23;
        if (!v23) {
          break;
        }
        ++pname;
        ++v20;
        if ((unint64_t)--v22 <= 1)
        {
          char *pname = 0;
          break;
        }
      }
    }
  }

  uint64_t v24 = [v53 objectForKeyedSubscript:@"uuid"];
  if (v24)
  {
    unint64_t v25 = (void *)v24;
    [v53 objectForKeyedSubscript:@"uuid"];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v27 = objc_opt_isKindOfClass();

    if ((v27 & 1) != 0)
    {
      id v28 = objc_alloc(MEMORY[0x189607AB8]);
      [v53 objectForKeyedSubscript:@"uuid"];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = (void *)[v28 initWithUUIDString:v29];

      if (v30) {
        [v30 getUUIDBytes:a3->uuid];
      }
    }
  }

  uint64_t v31 = [v53 objectForKeyedSubscript:@"euuid"];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    [v53 objectForKeyedSubscript:@"euuid"];
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
      id v35 = objc_alloc(MEMORY[0x189607AB8]);
      [v53 objectForKeyedSubscript:@"euuid"];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)[v35 initWithUUIDString:v36];

      if (v37) {
        [v37 getUUIDBytes:a3->euuid];
      }
    }
  }

  uint64_t v38 = [v53 objectForKeyedSubscript:@"vuuid"];
  if (v38)
  {
    int v39 = (void *)v38;
    [v53 objectForKeyedSubscript:@"vuuid"];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v41 = objc_opt_isKindOfClass();

    if ((v41 & 1) != 0)
    {
      id v42 = objc_alloc(MEMORY[0x189607AB8]);
      [v53 objectForKeyedSubscript:@"vuuid"];
      char v43 = (void *)objc_claimAutoreleasedReturnValue();
      id v44 = (void *)[v42 initWithUUIDString:v43];

      if (v44) {
        [v44 getUUIDBytes:a3->vuuid];
      }
    }
  }

  uint64_t v45 = [v53 objectForKeyedSubscript:@"fuuid"];
  if (v45)
  {
    v46 = (void *)v45;
    [v53 objectForKeyedSubscript:@"fuuid"];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    if ((v48 & 1) != 0)
    {
      id v49 = objc_alloc(MEMORY[0x189607AB8]);
      [v53 objectForKeyedSubscript:@"fuuid"];
      char v50 = (void *)objc_claimAutoreleasedReturnValue();
      id v51 = (void *)[v49 initWithUUIDString:v50];

      if (v51) {
        [v51 getUUIDBytes:a3->fuuid];
      }
    }
  }

  [v53 objectForKeyedSubscript:@"ifnet_properties"];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifnet_properties = [v52 unsignedShortValue];
}

+ (void)_initializeQUICDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4
{
  id v76 = a4;
  [v76 objectForKeyedSubscript:@"upid"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->upid = [v5 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"eupid"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->eupid = [v6 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"start_timestamp"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  a3->start_timestamp = [v7 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"timestamp"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  a3->timestamp = [v8 unsignedLongLongValue];

  [v76 objectForKeyedSubscript:@"ifindex"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  a3->ifindex = [v9 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"state"];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  a3->state = [v10 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"sndbufsize"];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufsize = [v11 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"sndbufused"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  a3->sndbufused = [v12 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"rcvbufsize"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufsize = [v13 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"rcvbufused"];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  a3->rcvbufused = [v14 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"txunacked"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txunacked = [v15 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"txwindow"];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txwindow = [v16 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"txcwindow"];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  a3->txcwindow = [v17 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"traffic_class"];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_class = [v18 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"traffic_mgt_flags"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  a3->traffic_mgt_unsigned int flags = [v19 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"pid"];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  a3->pid = [v20 unsignedIntValue];

  [v76 objectForKeyedSubscript:@"epid"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  a3->epid = [v21 unsignedIntValue];

  uint64_t v22 = [v76 objectForKeyedSubscript:@"cc_algo"];
  if (v22)
  {
    int v23 = (void *)v22;
    [v76 objectForKeyedSubscript:@"cc_algo"];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      id v26 = [v76 objectForKeyedSubscript:@"cc_algo"];
      char v27 = (unsigned __int8 *)[v26 UTF8String];
      if (!v27) {
        goto LABEL_47;
      }
      cc_algo = a3->cc_algo;
      uint64_t v29 = 16LL;
      while (1)
      {
        int v30 = *v27;
        char *cc_algo = v30;
        if (!v30) {
          break;
        }
        ++cc_algo;
        ++v27;
        if ((unint64_t)--v29 <= 1)
        {
          char *cc_algo = 0;
          break;
        }
      }
    }
  }

  uint64_t v31 = [v76 objectForKeyedSubscript:@"pname"];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    [v76 objectForKeyedSubscript:@"pname"];
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
      id v35 = [v76 objectForKeyedSubscript:@"pname"];
      uint64_t v36 = (unsigned __int8 *)[v35 UTF8String];
      if (v36)
      {
        pname = a3->pname;
        uint64_t v38 = 64LL;
        while (1)
        {
          int v39 = *v36;
          char *pname = v39;
          if (!v39) {
            break;
          }
          ++pname;
          ++v36;
          if ((unint64_t)--v38 <= 1)
          {
            char *pname = 0;
            break;
          }
        }

        goto LABEL_17;
      }

+ (id)_snapshotWithDictionary:(id)a3
{
  uint64_t v124 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v121 = 0u;
  memset(v122, 0, sizeof(v122));
  uint64_t v123 = 0LL;
  v93[11] = 0LL;
  v93[7] = 0LL;
  [v4 objectForKeyedSubscript:@"update"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"_prev_items"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"hdr"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"counts"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"savedRxPackets"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = [v9 longLongValue];

  [v6 objectForKeyedSubscript:@"savedTxPackets"];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = [v10 longLongValue];

  [v6 objectForKeyedSubscript:@"savedRxBytes"];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = [v11 longLongValue];

  [v6 objectForKeyedSubscript:@"savedTxBytes"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = [v12 longLongValue];

  [v6 objectForKeyedSubscript:@"savedRxCellularBytes"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = [v13 longLongValue];

  [v6 objectForKeyedSubscript:@"savedTxCellularBytes"];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93[8] = [v14 longLongValue];

  [v6 objectForKeyedSubscript:@"savedRxWiFiBytes"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = [v15 longLongValue];

  [v6 objectForKeyedSubscript:@"savedTxWiFiBytes"];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  v93[9] = [v16 longLongValue];

  [v6 objectForKeyedSubscript:@"savedRxWiredBytes"];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = [v17 longLongValue];

  [v6 objectForKeyedSubscript:@"savedTxWiredBytes"];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  v93[10] = [v18 longLongValue];

  [v6 objectForKeyedSubscript:@"savedRxDuplicateBytes"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v94 = [v19 unsignedIntValue];

  [v6 objectForKeyedSubscript:@"savedRxOutOfOrderBytes"];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v95 = [v20 unsignedIntValue];

  [v6 objectForKeyedSubscript:@"savedTxRetransmittedBytes"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v96 = [v21 unsignedIntValue];

  [v7 objectForKeyedSubscript:@"context"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v99 = [v22 longLongValue];

  [v7 objectForKeyedSubscript:@"type"];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v100 = [v23 unsignedIntValue];

  [v7 objectForKeyedSubscript:@"length"];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v101 = [v24 unsignedShortValue];

  [v7 objectForKeyedSubscript:@"flags"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v102 = [v25 unsignedShortValue];

  [v5 objectForKeyedSubscript:@"srcref"];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v103 = [v26 longLongValue];

  [v5 objectForKeyedSubscript:@"event_flags"];
  char v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v104 = [v27 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_rxpackets"];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v105 = [v28 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_txpackets"];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v107 = [v29 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_rxbytes"];
  int v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v106 = [v30 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_txbytes"];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v108 = [v31 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_cell_rxbytes"];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v109 = [v32 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_cell_txbytes"];
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v110 = [v33 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_wifi_rxbytes"];
  char v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v111 = [v34 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_wifi_txbytes"];
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v112 = [v35 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_wired_rxbytes"];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v113 = [v36 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_wired_txbytes"];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v114 = [v37 longLongValue];

  [v8 objectForKeyedSubscript:@"nstat_rxduplicatebytes"];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  int v115 = [v38 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_rxoutoforderbytes"];
  int v39 = (void *)objc_claimAutoreleasedReturnValue();
  int v116 = [v39 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_txretransmit"];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  int v117 = [v40 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_connectattempts"];
  char v41 = (void *)objc_claimAutoreleasedReturnValue();
  int v118 = [v41 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_connectsuccesses"];
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  int v119 = [v42 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_min_rtt"];
  char v43 = (void *)objc_claimAutoreleasedReturnValue();
  int v120 = [v43 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_avg_rtt"];
  id v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v121) = [v44 unsignedIntValue];

  [v8 objectForKeyedSubscript:@"nstat_var_rtt"];
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD1(v121) = [v45 unsignedIntValue];

  [v5 objectForKeyedSubscript:@"provider"];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v47 = [v46 unsignedIntValue];
  DWORD2(v121) = v47;

  [v4 objectForKeyedSubscript:@"_startStamp"];
  char v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    [v4 objectForKeyedSubscript:@"_startStamp"];
    id v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 floatValue];
    double v51 = v50;
  }

  else
  {
    double v51 = 0.0;
  }

  [v4 objectForKeyedSubscript:@"_startStampUsecs"];
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    [v4 objectForKeyedSubscript:@"_startStampUsecs"];
    id v53 = (void *)objc_claimAutoreleasedReturnValue();
    double v51 = (double)(unint64_t)[v53 unsignedLongLongValue] / 1000000.0;
  }

  if (v47 > 0xA) {
    goto LABEL_26;
  }
  if (((1 << v47) & 0x430) != 0)
  {
    [v5 objectForKeyedSubscript:@"udp_descriptor"];
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _initializeUDPDescriptor:v122 fromDictionary:v54];
    unsigned int v55 = &off_18A1B5D30;
    goto LABEL_13;
  }

  if (((1 << v47) & 0xC) != 0)
  {
    [v5 objectForKeyedSubscript:@"tcp_descriptor"];
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _initializeTCPDescriptor:v122 fromDictionary:v54];
    unsigned int v55 = off_18A1B5D28;
    goto LABEL_13;
  }

  if (v47 != 8)
  {
LABEL_26:
    NStatGetLog();
    v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v98 = v47;
      _os_log_impl(&dword_187FF5000, v86, OS_LOG_TYPE_ERROR, "unknown provider %d type for snapshot", buf, 8u);
    }

    id v58 = 0LL;
    goto LABEL_29;
  }

  [v5 objectForKeyedSubscript:@"quic_descriptor"];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _initializeQUICDescriptor:v122 fromDictionary:v54];
  unsigned int v55 = off_18A1B5D20;
LABEL_13:

  id v56 = objc_alloc(*v55);
  [v4 objectForKeyedSubscript:@"_flags"];
  char v57 = (void *)objc_claimAutoreleasedReturnValue();
  id v58 = (void *)objc_msgSend( v56,  "initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:",  &v99,  objc_msgSend(v57, "unsignedIntValue"),  v93,  0,  0,  v51);

  if (v58)
  {
    [v4 objectForKeyedSubscript:@"snapshotReason"];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setSnapshotReason:", objc_msgSend(v59, "intValue"));

    [v4 objectForKeyedSubscript:@"attributedEntity"];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      [v4 objectForKeyedSubscript:@"attributedEntity"];
      v62 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v62 = @"<unknown>";
    }

    [v4 objectForKeyedSubscript:@"delegateName"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v64 = objc_opt_isKindOfClass();

    v89 = v6;
    v90 = v5;
    v88 = v7;
    if ((v64 & 1) != 0)
    {
      uint64_t v65 = [v4 objectForKeyedSubscript:@"delegateName"];
    }

    else
    {
      uint64_t v65 = 0LL;
    }

    [v4 objectForKeyedSubscript:@"attributionReason"];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v67 = [v66 intValue];
    [v4 objectForKeyedSubscript:@"delegateAttributionReason"];
    v68 = v4;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)v65;
    v92 = (os_log_s *)v62;
    objc_msgSend( v58,  "setAttribution:derivation:delegateName:delegateDerivation:extensionName:",  v62,  v67,  v65,  objc_msgSend(v69, "intValue"),  0);

    [v68 objectForKeyedSubscript:@"uiBackgroundAudioCapable"];
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setIsUIBackgroundAudioCapable:", objc_msgSend(v70, "BOOLValue"));

    [v68 objectForKeyedSubscript:@"snapshotAppStateIsForeground"];
    char v71 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v72 = [v71 BOOLValue];
    [v68 objectForKeyedSubscript:@"snapshotScreenStateOn"];
    char v73 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v74 = [v73 BOOLValue];
    [v68 objectForKeyedSubscript:@"startAppStateIsForeground"];
    char v75 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = [v75 BOOLValue];
    [v68 objectForKeyedSubscript:@"startScreenStateOn"];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = [v77 BOOLValue];
    uint64_t v79 = v72;
    id v4 = v68;
    [v58 setAppStateIsForeground:v79 screenStateOn:v74 startAppStateIsForeground:v76 startScreenStateOn:v78];

    uint64_t v80 = [v68 objectForKeyedSubscript:@"_snapStampUsecs"];
    if (v80
      && (v81 = (void *)v80,
          [v68 objectForKeyedSubscript:@"_snapStampUsecs"],
          v82 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v83 = objc_opt_isKindOfClass(),
          v82,
          v81,
          (v83 & 1) != 0))
    {
      [v68 objectForKeyedSubscript:@"_snapStampUsecs"];
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      double v85 = (double)(unint64_t)[v84 unsignedLongLongValue] / 1000000.0;

      [v58 setFlowSnapshotTimeIntervalSinceReferenceDate:v85];
      id v6 = v89;
      id v5 = v90;
      uint64_t v7 = v88;
    }

    else
    {
      id v6 = v89;
      id v5 = v90;
      uint64_t v7 = v88;
      if ((reportSnapshotWithDictionaryIssues & 1) == 0) {
        reportSnapshotWithDictionaryIssues = 1;
      }
    }

    [v58 runConsistencyChecks];

    v86 = v92;
LABEL_29:
  }

  return v58;
}

+ (id)snapshotWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v10 = 0LL;
      double v8 = 0LL;
      uint64_t v7 = 0LL;
      id v6 = 0LL;
      goto LABEL_22;
    }

    [v5 objectForKeyedSubscript:@"update"];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v10 = 0LL;
        double v8 = 0LL;
        uint64_t v7 = 0LL;
        goto LABEL_22;
      }

      [v6 objectForKeyedSubscript:@"tcp_descriptor"];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 objectForKeyedSubscript:@"udp_descriptor"];
      double v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v6 objectForKeyedSubscript:@"quic_descriptor"];
      BOOL v10 = (void *)v9;
      int v11 = v7 != 0LL;
      if (v7) {
        int v12 = 2;
      }
      else {
        int v12 = 1;
      }
      if (v8) {
        int v11 = v12;
      }
      if (v9) {
        ++v11;
      }
      if (v11 != 1) {
        goto LABEL_22;
      }
      [v6 objectForKeyedSubscript:@"provider"];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v14 = [v13 unsignedIntValue];

      id v4 = 0LL;
      if (v14 <= 0xA)
      {
        if (((1 << v14) & 0x430) != 0)
        {
          if (v8) {
            goto LABEL_28;
          }
        }

        else
        {
          if (((1 << v14) & 0xC) == 0)
          {
            if (v14 != 8) {
              goto LABEL_23;
            }
            if (!v10) {
              goto LABEL_22;
            }
            goto LABEL_28;
          }

          if (v7)
          {
LABEL_28:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [a1 _snapshotWithDictionary:v5];
              id v4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
          }
        }

- (id)attributionReasonString
{
  return (id)attributionReasonString(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (BOOL)attributedEntityIsBundleName
{
  return attributionReasonImpliesBundleName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (BOOL)attributedEntityIsProcessName
{
  return attributionReasonImpliesProcessName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  -[NWStatsSnapshot setSnapshotAppStateIsForeground:](self, "setSnapshotAppStateIsForeground:", a3);
  -[NWStatsSnapshot setSnapshotScreenStateOn:](self, "setSnapshotScreenStateOn:", v8);
  -[NWStatsSnapshot setStartAppStateIsForeground:](self, "setStartAppStateIsForeground:", v7);
  -[NWStatsSnapshot setStartScreenStateOn:](self, "setStartScreenStateOn:", v6);
}

+ (double)_intervalWithContinuousTime:(unint64_t)a3
{
  LODWORD(v3) = timebase_info_0;
  LODWORD(v4) = *(_DWORD *)algn_18C4D7E24;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5 = 9;
  do
  {
    uint64_t v6 = mach_continuous_time();
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v8 = v7;
    uint64_t v9 = mach_continuous_time() - v6;
    [a1 _intervalWithContinuousTime:v9];
  }

  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  uint64_t v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    [a1 _intervalWithContinuousTime:a3 - v12];
    return v8 + v15;
  }

  else
  {
    [a1 _intervalWithContinuousTime:v12 - a3];
    return v8 - v13;
  }

- (void)applyTrafficAdjustmentFactor:(double)a3
{
  if (a3 > 0.0 && v5 > a3)
  {
    double v7 = (v5 - a3) / v5;
    self->_adjustment_bytes.unint64_t rxCellularBytes = (unint64_t)(v7
                                                               * (double)-[NWStatsProtocolSnapshot deltaAccountingRxCellularBytes]( self,  "deltaAccountingRxCellularBytes"));
    self->_adjustment_bytes.unint64_t txCellularBytes = (unint64_t)(v7
                                                               * (double)-[NWStatsProtocolSnapshot deltaAccountingTxCellularBytes]( self,  "deltaAccountingTxCellularBytes"));
    self->_adjustment_bytes.unint64_t rxWiFiBytes = (unint64_t)(v7
                                                           * (double)-[NWStatsProtocolSnapshot deltaAccountingRxWiFiBytes]( self,  "deltaAccountingRxWiFiBytes"));
    self->_adjustment_bytes.unint64_t txWiFiBytes = (unint64_t)(v7
                                                           * (double)-[NWStatsProtocolSnapshot deltaAccountingTxWiFiBytes]( self,  "deltaAccountingTxWiFiBytes"));
    self->_adjustment_bytes.unint64_t rxWiredBytes = (unint64_t)(v7
                                                            * (double)-[NWStatsProtocolSnapshot deltaAccountingRxWiredBytes]( self,  "deltaAccountingRxWiredBytes"));
    self->_adjustment_bytes.unint64_t txWiredBytes = (unint64_t)(v7
                                                            * (double)-[NWStatsProtocolSnapshot deltaAccountingTxWiredBytes]( self,  "deltaAccountingTxWiredBytes"));
  }

- (void)donateBytesToAccumulator
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v3,  "addVPNBytesForInterfaceIndex:fromSnapshot:",  -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"),  self);
  self->_isKnownVPNClient = 1;
}

- (void)removeBytesFromAccumulator
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot euuid](self, "euuid");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 subtractVPNBytesForVPNProviderAppUUID:v3 fromSnapshot:self];

  self->_isKnownVPNProvider = 1;
}

+ (void)initialize
{
  kern_return_t v2;
  kern_return_t v3;
  os_log_s *v4;
  id v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;
  double v8 = *MEMORY[0x1895F89C0];
  unint64_t v2 = mach_timebase_info((mach_timebase_info_t)&timebase_info_0);
  if (v2)
  {
    id v3 = v2;
    NStatGetLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_187FF5000, v4, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v7, 8u);
    }
  }

  double v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v6 = (void *)flowsWithAnomalousCounts;
  flowsWithAnomalousCounts = (uint64_t)v5;

  flowsWithAnomalousCountsLock = 0;
}

- (unint64_t)flowStartContinuousTime
{
  return self->_flowStartContinuousTime;
}

- (NSDate)flowStartTimestamp
{
  return self->_flowStartTimestamp;
}

- (NSDate)flowSnapshotTimestamp
{
  return self->_flowSnapshotTimestamp;
}

- (double)flowStartTimeIntervalSinceReferenceDate
{
  return self->_flowStartTimeIntervalSinceReferenceDate;
}

- (double)flowSnapshotTimeIntervalSinceReferenceDate
{
  return self->_flowSnapshotTimeIntervalSinceReferenceDate;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_flowSnapshotTimeIntervalSinceReferenceDate = a3;
}

- (double)flowStartTimeIntervalSince1970
{
  return self->_flowStartTimeIntervalSince1970;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  return self->_flowSnapshotTimeIntervalSince1970;
}

- (double)flowDuration
{
  return self->_flowDuration;
}

- (unint64_t)deltaAccountingRxCompanionLinkBluetoothBytes
{
  return self->_deltaAccountingRxCompanionLinkBluetoothBytes;
}

- (unint64_t)deltaAccountingTxCompanionLinkBluetoothBytes
{
  return self->_deltaAccountingTxCompanionLinkBluetoothBytes;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (unsigned)receiveBufferSize
{
  return self->_receiveBufferSize;
}

- (unsigned)receiveBufferUsed
{
  return self->_receiveBufferUsed;
}

- (unsigned)trafficClass
{
  return self->_trafficClass;
}

- (NSUUID)vuuid
{
  return self->_vuuid;
}

- (NSUUID)flowuuid
{
  return self->_flowuuid;
}

- (BOOL)uiBackgroundAudioCapable
{
  return self->_uiBackgroundAudioCapable;
}

- (void)setUiBackgroundAudioCapable:(BOOL)a3
{
  self->_uiBackgroundAudioCapable = a3;
}

- (BOOL)failedRouteValuesLookup
{
  return self->_failedRouteValuesLookup;
}

- (BOOL)failedFlowswitchValuesLookup
{
  return self->_failedFlowswitchValuesLookup;
}

- (BOOL)failedSkywalkAction
{
  return self->_failedSkywalkAction;
}

- (NSData)localAddress
{
  return self->_localAddress;
}

- (NSData)remoteAddress
{
  return self->_remoteAddress;
}

- (unsigned)localPort
{
  return self->_localPort;
}

- (unsigned)remotePort
{
  return self->_remotePort;
}

- (NSString)localAddressString
{
  return self->_localAddressString;
}

- (NSString)remoteAddressString
{
  return self->_remoteAddressString;
}

- (BOOL)isKnownListener
{
  return self->_isKnownListener;
}

- (BOOL)isKnownInbound
{
  return self->_isKnownInbound;
}

- (BOOL)isKnownOutbound
{
  return self->_isKnownOutbound;
}

- (BOOL)interfaceUnknown
{
  return self->_interfaceUnknown;
}

- (BOOL)interfaceLoopback
{
  return self->_interfaceLoopback;
}

- (BOOL)interfaceCellular
{
  return self->_interfaceCellular;
}

- (BOOL)interfaceCellularViaFallback
{
  return self->_interfaceCellularViaFallback;
}

- (BOOL)interfaceCellularViaSlowFallback
{
  return self->_interfaceCellularViaSlowFallback;
}

- (BOOL)interfaceCellularViaFastFallback
{
  return self->_interfaceCellularViaFastFallback;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return self->_interfaceCellularViaPreferredFallback;
}

- (BOOL)interfaceCellularViaIndependentFallback
{
  return self->_interfaceCellularViaIndependentFallback;
}

- (BOOL)interfaceCellularViaAnyFallback
{
  return self->_interfaceCellularViaAnyFallback;
}

- (BOOL)interfaceWiFi
{
  return self->_interfaceWiFi;
}

- (BOOL)interfaceWired
{
  return self->_interfaceWired;
}

- (BOOL)interfaceAWDL
{
  return self->_interfaceAWDL;
}

- (BOOL)interfaceLLW
{
  return self->_interfaceLLW;
}

- (BOOL)interfaceExpensive
{
  return self->_interfaceExpensive;
}

- (BOOL)interfaceConstrained
{
  return self->_interfaceConstrained;
}

- (BOOL)interfaceCompanionLink
{
  return self->_interfaceCompanionLink;
}

- (BOOL)interfaceCompanionLinkBluetooth
{
  return self->_interfaceCompanionLinkBluetooth;
}

- (BOOL)isKnownVPNClient
{
  return self->_isKnownVPNClient;
}

- (void)setIsKnownVPNClient:(BOOL)a3
{
  self->_isKnownVPNClient = a3;
}

- (BOOL)flowUsesChannels
{
  return self->_flowUsesChannels;
}

- (BOOL)hasLocalDestination
{
  return self->_hasLocalDestination;
}

- (BOOL)hasNonLocalDestination
{
  return self->_hasNonLocalDestination;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_networkActivityMapStartTime;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_networkActivityMapPart1;
}

- (unint64_t)networkActivityMapPart2
{
  return self->_networkActivityMapPart2;
}

- (BOOL)isKnownVPNProvider
{
  return self->_isKnownVPNProvider;
}

- (void)setIsKnownVPNProvider:(BOOL)a3
{
  self->_isKnownVPNProvider = a3;
}

- (unsigned)ifnet_properties
{
  return self->_ifnet_properties;
}

- (void).cxx_destruct
{
}

@end