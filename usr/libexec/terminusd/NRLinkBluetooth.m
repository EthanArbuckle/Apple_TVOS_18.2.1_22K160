@interface NRLinkBluetooth
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)sendPacketData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (id)copyDescriptionInner;
- (id)copyShortDescriptionInner;
- (id)copyStatusString;
- (unsigned)metric;
- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5;
- (void)checkProxyAgentWithForceUpdate:(BOOL)a3;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshCompanionProxyAgent;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)setPacketReceiver:(id)a3;
@end

@implementation NRLinkBluetooth

- (id)copyStatusString
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = -[NSMutableString initWithString:](v3, "initWithString:", v4);

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "nrUUID", self->super._nrUUID);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "bluetoothUUID",  *(void *)((char *)&self->_handledUrgentLinkReadBufferBytes + 3));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "pipe",  *(NSUUID **)((char *)&self->_bluetoothUUID + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "urgentPipe",  *(unint64_t *)((char *)&self->_lastReadDatagramLinkOutputActivityCounter + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "datagramPipe",  *(unint64_t *)((char *)&self->_lastReadLinkOutputActivityCounter + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "linkChannel",  *(unint64_t *)((char *)&self->_writeCounter + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "linkInputRing",  *(channel **)((char *)&self->_linkChannel + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "linkOutputRing",  *(channel_ring_desc **)((char *)&self->_linkInputRing + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "dLinkInputSource",  *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "dLinkOutputSource",  *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "datagramLinkChannel",  *(CBScalablePipe **)((char *)&self->_datagramPipe + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "datagramLinkInputRing",  *(channel **)((char *)&self->_datagramLinkChannel + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "datagramLinkOutputRing",  *(channel_ring_desc **)((char *)&self->_datagramLinkInputRing + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "dDatagramLinkInputSource",  *(channel_ring_desc **)((char *)&self->_datagramLinkOutputRing + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %p",  "dDatagramLinkOutputSource",  *(OS_dispatch_source **)((char *)&self->_dDatagramLinkInputSource + 7));
  if (self->_datagramPipeNeeded) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "datagramPipeNeeded", v6);
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v8 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "virtualInterfaceName", v8);
  }

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassD",  *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassC",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassA",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7));
  IPv6AddrString = (void *)createIPv6AddrString((char *)&self->_ntlULogTokenList + 7, v9);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "localAddrClassD", IPv6AddrString);

  v12 = (void *)createIPv6AddrString((char *)&self->_localAddrClassD.__u6_addr32[3] + 3, v11);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "remoteAddrClassD", v12);

  v14 = (void *)createIPv6AddrString((char *)&self->_remoteAddrClassD.__u6_addr32[3] + 3, v13);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "localAddrClassC", v14);

  v16 = (void *)createIPv6AddrString((char *)&self->_localAddrClassC.__u6_addr32[3] + 3, v15);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "remoteAddrClassC", v16);

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "packetsFromNexus",  *(unint64_t *)((char *)&self->_syncNexusOutput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "packetsToNexus",  *(unint64_t *)((char *)&self->_packetsFromNexus + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromNexus",  *(unint64_t *)((char *)&self->_packetsToNexus + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesToNexus",  *(unint64_t *)((char *)&self->_bytesFromNexus + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromNexusVO",  *(unint64_t *)((char *)&self->_packetsToNexusVO + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesToNexusVO",  *(unint64_t *)((char *)&self->_bytesFromNexusVO + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromNexusVI",  *(unint64_t *)((char *)&self->_packetsToNexusVI + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesToNexusVI",  *(unint64_t *)((char *)&self->_bytesFromNexusVI + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromNexusBK",  *(unint64_t *)((char *)&self->_packetsToNexusBK + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesToNexusBK",  *(unint64_t *)((char *)&self->_bytesFromNexusBK + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesFromLink",  *(NSString **)((char *)&self->_jointUUIDHash + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "bytesToLink",  *(unint64_t *)((char *)&self->_bytesFromLink + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "datagramBytesFromLink",  *(unint64_t *)((char *)&self->_bytesToLink + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "datagramBytesToLink",  *(unint64_t *)((char *)&self->_datagramBytesFromLink + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "urgentBytesFromLink",  *(unint64_t *)((char *)&self->_datagramBytesToLink + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "urgentBytesToLink",  *(unint64_t *)((char *)&self->_urgentBytesFromLink + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusInput",  *(unint64_t *)((char *)&self->_nexusOutputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusOutput",  *(unint64_t *)((char *)&self->_syncNexusInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusVOInput",  *(unint64_t *)((char *)&self->_nexusVOOutputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusVOOutput",  *(unint64_t *)((char *)&self->_syncNexusVOInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusVIInput",  *(unint64_t *)((char *)&self->_nexusVIOutputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusVIOutput",  *(unint64_t *)((char *)&self->_syncNexusVIInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusBKInput",  *(unint64_t *)((char *)&self->_nexusBKOutputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncNexusBKOutput",  *(unint64_t *)((char *)&self->_syncNexusBKInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncLinkInput",  *(unint64_t *)((char *)&self->_urgentBytesToLink + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncLinkOutput",  *(unint64_t *)((char *)&self->_syncLinkInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncDatagramLinkInput",  *(unint64_t *)((char *)&self->_syncLinkOutput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncDatagramLinkOutput",  *(unint64_t *)((char *)&self->_syncDatagramLinkInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncUrgentLinkInput",  *(unint64_t *)((char *)&self->_syncDatagramLinkOutput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "syncUrgentLinkOutput",  *(unint64_t *)((char *)&self->_syncUrgentLinkInput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %u",  "filledInLinkWriteBufferBytes",  *(unsigned int *)((char *)&self->_urgentLinkWriteBufferLength + 3));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %u",  "handledLinkWriteBufferBytes",  *(unsigned int *)((char *)&self->_filledInLinkWriteBufferBytes + 3));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %u",  "filledInUrgentLinkWriteBufferBytes",  *(unsigned int *)((char *)&self->_controlPacketCounter + 3));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %u",  "handledUrgentLinkWriteBufferBytes",  *(unsigned int *)((char *)&self->_filledInUrgentLinkWriteBufferBytes + 3));
  if (self->_hasUrgentPrelude) {
    v17 = "YES";
  }
  else {
    v17 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "hasUrgentPrelude", v17);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "linkInputAvailWake",  *(unint64_t *)((char *)&self->_syncUrgentLinkOutput + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "linkOutputAvailWake",  *(unint64_t *)((char *)&self->_linkInputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "datagramLinkInputAvailWake",  *(unint64_t *)((char *)&self->_linkOutputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "datagramLinkOutputAvailWake",  *(unint64_t *)((char *)&self->_datagramLinkInputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusInputAvailWake",  *(char **)((char *)&self->_linkWriteBuffer + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusOutputAvailWake",  *(unint64_t *)((char *)&self->_nexusInputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusVOInputAvailWake",  *(unint64_t *)((char *)&self->_lastReadNexusVOOutputActivityCounter + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusVOOutputAvailWake",  *(unint64_t *)((char *)&self->_nexusVOInputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusVIInputAvailWake",  *(unint64_t *)((char *)&self->_lastReadNexusVIOutputActivityCounter + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusVIOutputAvailWake",  *(unint64_t *)((char *)&self->_nexusVIInputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusBKInputAvailWake",  *(unint64_t *)((char *)&self->_lastReadNexusBKOutputActivityCounter + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "nexusBKOutputAvailWake",  *(unint64_t *)((char *)&self->_nexusBKInputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "pendingBytesToLink",  [*(id *)((char *)&self->_urgentLinkReadBuffer + 7) length]);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %lld (%u - %u)",  "pendingBytesFromLink",  *(unsigned int *)((char *)&self->_controlDataSendQueueLen + 3)
  - (unint64_t)*(unsigned int *)((char *)&self->_filledInLinkReadBufferBytes + 3),
    *(unsigned int *)((char *)&self->_controlDataSendQueueLen + 3),
    *(unsigned int *)((char *)&self->_filledInLinkReadBufferBytes + 3));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentUncompressedIP",  *(unint64_t *)((char *)&self->_urgentLinkOutputAvailWake + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentEncapsulated6LoWPAN",  *(unint64_t *)((char *)&self->_sentUncompressedIP + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP",  *(unint64_t *)((char *)&self->_sentEncapsulated6LoWPAN + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP_ECT0",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP_ClassC",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ECT0 + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_ESP_ClassC_ECT0",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_TCP",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentKnownIPv6Hdr_TCP_ECT0",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "sentIKEv2PointToPoint",  *(unint64_t *)((char *)&self->_sentKnownIPv6Hdr_TCP_ECT0 + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvUncompressedIP",  *(unint64_t *)((char *)&self->_sentIKEv2PointToPoint + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvEncapsulated6LoWPAN",  *(unint64_t *)((char *)&self->_recvUncompressedIP + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP",  *(unint64_t *)((char *)&self->_recvEncapsulated6LoWPAN + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP_ECT0",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP_ClassC",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ECT0 + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_ESP_ClassC_ECT0",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_TCP",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_ESP_ClassC_ECT0 + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvKnownIPv6Hdr_TCP_ECT0",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %llu",  "recvIKEv2PointToPoint",  *(unint64_t *)((char *)&self->_recvKnownIPv6Hdr_TCP_ECT0 + 7));
  v18 = (void *)_NRCopyTimeStringForDate(*(unint64_t *)((char *)&self->_recvIKEv2PointToPoint + 7));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "lastReadNexus", v18);

  v19 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastReadNexus + 7));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "lastWrittenNexus", v19);

  v20 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastWrittenNexus + 7));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "lastReadLink", v20);

  v21 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastReadLink + 7));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "lastWrittenLink", v21);

  v22 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastWrittenDatagramLink + 7));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "lastReadUrgentLink", v22);

  v23 = (void *)_NRCopyTimeStringForDate(*(NSDate **)((char *)&self->_lastReadUrgentLink + 7));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "lastWrittenUrgentLink", v23);

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %u",  "nexusRecvWindow",  [*(id *)((char *)&self->_dummyPacketNexus + 7) receiveWindowPacketCount]);
  if (self->_dLinkInputSourceSuspended) {
    v24 = "YES";
  }
  else {
    v24 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dLinkInputSourceSuspended", v24);
  if (self->_dLinkOutputSourceSuspended) {
    v25 = "YES";
  }
  else {
    v25 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dLinkOutputSourceSuspended", v25);
  if (self->_dUrgentLinkInputSourceSuspended) {
    v26 = "YES";
  }
  else {
    v26 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dUrgentLinkInputSourceSuspended", v26);
  if (self->_dUrgentLinkOutputSourceSuspended) {
    v27 = "YES";
  }
  else {
    v27 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dUrgentLinkOutputSourceSuspended", v27);
  if (self->_dDatagramLinkInputSourceSuspended) {
    v28 = "YES";
  }
  else {
    v28 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dDatagramLinkInputSourceSuspended", v28);
  if (self->_dDatagramLinkOutputSourceSuspended) {
    v29 = "YES";
  }
  else {
    v29 = "NO";
  }
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %s",  "dDatagramLinkOutputSourceSuspended",  v29);
  if (self->_dNexusInputSourceSuspended) {
    v30 = "YES";
  }
  else {
    v30 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusInputSourceSuspended", v30);
  if (self->_dNexusOutputSourceSuspended) {
    v31 = "YES";
  }
  else {
    v31 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusOutputSourceSuspended", v31);
  if (self->_dNexusVOInputSourceSuspended) {
    v32 = "YES";
  }
  else {
    v32 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusVOInputSourceSuspended", v32);
  if (self->_dNexusVOOutputSourceSuspended) {
    v33 = "YES";
  }
  else {
    v33 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusVOOutputSourceSuspended", v33);
  if (self->_dNexusVIInputSourceSuspended) {
    v34 = "YES";
  }
  else {
    v34 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusVIInputSourceSuspended", v34);
  if (self->_dNexusVIOutputSourceSuspended) {
    v35 = "YES";
  }
  else {
    v35 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusVIOutputSourceSuspended", v35);
  if (self->_dNexusBKInputSourceSuspended) {
    v36 = "YES";
  }
  else {
    v36 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusBKInputSourceSuspended", v36);
  if (self->_dNexusBKOutputSourceSuspended) {
    v37 = "YES";
  }
  else {
    v37 = "NO";
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %s", "dNexusBKOutputSourceSuspended", v37);
  return v5;
}

- (id)copyDescriptionInner
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
  id v4 = -[NRLink copyDescriptionInner](&v10, "copyDescriptionInner");
  v5 = -[NSMutableString initWithString:](v3, "initWithString:", v4);

  StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRLink type](self, "type"));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @", %@", StringFromNRLinkType);

  if (self) {
    uint64_t v7 = *(uint64_t *)((char *)&self->_pipe + 7);
  }
  else {
    uint64_t v7 = 0LL;
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @", %@", v7);
  if ([*(id *)((char *)&self->_randomUUID + 7) length])
  {
    if (self->_isResponder) {
      v8 = " R";
    }
    else {
      v8 = " I";
    }
  }

  else
  {
    v8 = "";
  }

  -[NSMutableString appendFormat:](v5, "appendFormat:", @", %s", v8);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @", %@", *(NSUUID **)((char *)&self->_randomUUID + 7));
  return v5;
}

- (id)copyShortDescriptionInner
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
  id v4 = -[NRLink copyShortDescriptionInner](&v9, "copyShortDescriptionInner");
  uint64_t v5 = *(uint64_t *)((char *)&self->_pipe + 7);
  if ([*(id *)((char *)&self->_randomUUID + 7) length])
  {
    if (self->_isResponder) {
      v6 = " R";
    }
    else {
      v6 = " I";
    }
  }

  else
  {
    v6 = "";
  }

  uint64_t v7 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ %@%s%@",  v4,  v5,  v6,  *(NSUUID **)((char *)&self->_randomUUID + 7));

  return v7;
}

- (BOOL)start
{
  v6 = self;
  if (self->super._state == 8)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v7 linkIsReady:v6];

    LOBYTE(v6) = 1;
    return (char)v6;
  }

  if (-[NRLink state](self, "state") != 9)
  {
    if (v6->super._state >= 2u)
    {
      if (qword_1001DC840 != -1) {
        dispatch_once(&qword_1001DC840, &stru_1001AEE08);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC838, 17LL))
      {
        if (qword_1001DC840 != -1) {
          dispatch_once(&qword_1001DC840, &stru_1001AEE08);
        }
        _NRLogWithArgs(qword_1001DC838, 17LL, "Cannot start link: %@", v6);
        LOBYTE(v6) = 0;
      }

      else
      {
        LOBYTE(v6) = 0;
      }

      return (char)v6;
    }

    -[NRLink reportEvent:](v6, "reportEvent:", 3001LL);
    -[NRLink updateIKEv2Role:](v6, "updateIKEv2Role:", 0LL);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](v6, "queue"));

    if (v9)
    {
      sentPreludeState = &OBJC_IVAR___NRPreferWiFiAgent_networkProvider;
      if (*(NSUUID **)((char *)&v6->_bluetoothUUID + 7))
      {
        if (*(void *)((char *)&v6->_handledUrgentLinkReadBufferBytes + 3))
        {
          if (*(CBScalablePipe **)((char *)&v6->_pipe + 7))
          {
            if (-[NRLink ikev2Role](v6, "ikev2Role") == 2 || -[NRLink ikev2Role](v6, "ikev2Role") == 1)
            {
              unsigned int v11 = -[NRLink ikev2Role](v6, "ikev2Role");
              uint64_t v12 = 255LL;
              if (v11 != 1) {
                uint64_t v12 = 0LL;
              }
              __memptr[0] = (void *)(0x101010101010101LL * v12);
              arc4random_buf(&__memptr[1], 8uLL);
              uint64_t v13 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", __memptr);
            }

            else
            {
              uint64_t v13 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
            }

            v14 = *(NWRemotePacketProxy **)((char *)&v6->_remotePacketProxy + 7);
            *(NWRemotePacketProxy **)((char *)&v6->_remotePacketProxy + 7) = (NWRemotePacketProxy *)v13;

            uint64_t v15 = *(NSUUID **)((char *)&v6->_randomUUID + 7);
            *(NSUUID **)((char *)&v6->_randomUUID + 7) = (NSUUID *)&stru_1001B1528;

            uint64_t v16 = *(unsigned int *)((char *)&v6->_remoteInnerLinkVersionHBO + 3);
            if ((_DWORD)v16)
            {
              v17 = (NSData *)malloc(*(unsigned int *)((char *)&v6->_remoteInnerLinkVersionHBO + 3));
              if (!v17) {
                goto LABEL_85;
              }
              *(NSData **)((char *)&v6->_localPublicClassAKeysEncryptedWithIDS + 7) = v17;
              *(int *)((char *)&v6->_controlDataSendQueueLen + 3) = 0;
              *(unsigned int *)((char *)&v6->_filledInLinkReadBufferBytes + 3) = 0;
              uint64_t v2 = (uint64_t)&gNRPacketLoggingEnabled;
              if (gNRPacketLoggingEnabled)
              {
                v149 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v18);
                int IsLevelEnabled = _NRLogIsLevelEnabled(v149, 1LL);

                if (IsLevelEnabled)
                {
                  v152 = (void *)_NRCopyLogObjectForNRUUID(v6->super._nrUUID, v151);
                  id v153 = -[NRLink copyDescription](v6, "copyDescription");
                  _NRLogWithArgs( v152,  1LL,  "%s%.30s:%-4d %@: Initialized linkReadBuffer with size %u",  ",  "-[NRLinkBluetooth start]"",  1150LL,  v153,  *(unsigned int *)((char *)&v6->_remoteInnerLinkVersionHBO + 3));
                }
              }

              uint64_t v19 = 279LL;
              uint64_t v16 = *(unsigned int *)((char *)&v6->_urgentLinkReadBufferMoveThreshold + 3);
              if ((_DWORD)v16)
              {
                v20 = malloc(*(unsigned int *)((char *)&v6->_urgentLinkReadBufferMoveThreshold + 3));
                if (v20)
                {
                  uint64_t v3 = 447LL;
                  *(unint64_t *)((char *)&v6->_lastReadNexusOutputActivityCounter + 7) = (unint64_t)v20;
                  uint64_t v4 = 287LL;
                  *(unsigned int *)((char *)&v6->_urgentLinkWriteBufferLength + 3) = 0;
                  uint64_t v5 = 291LL;
                  *(unsigned int *)((char *)&v6->_filledInLinkWriteBufferBytes + 3) = 0;
                  if (gNRPacketLoggingEnabled)
                  {
                    uint64_t v2 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v21);
                    int v154 = _NRLogIsLevelEnabled(v2, 1LL);

                    if (v154)
                    {
                      uint64_t v2 = _NRCopyLogObjectForNRUUID(v6->super._nrUUID, v155);
                      id v156 = -[NRLink copyDescription](v6, "copyDescription");
                      _NRLogWithArgs( v2,  1LL,  "%s%.30s:%-4d %@: Initialized linkWriteBuffer with size %u",  ",  "-[NRLinkBluetooth start]"",  1154LL,  v156,  *(unsigned int *)((char *)&v6->_urgentLinkReadBufferMoveThreshold + 3));
                    }
                  }

                  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  v23 = *(char **)((char *)&v6->_urgentLinkWriteBuffer + 7);
                  *(char **)((char *)&v6->_urgentLinkWriteBuffer + 7) = (char *)v22;

                  v6->_linkLogTokenListCount = 10;
                  __memptr[0] = 0LL;
                  if (posix_memalign(__memptr, 8uLL, 0x50uLL) || !__memptr[0])
                  {
                    id v157 = sub_100070554();
                    int v158 = _NRLogIsLevelEnabled(v157, 16LL);

                    if (v158)
                    {
                      id v159 = sub_100070554();
                      _NRLogWithArgs( v159,  16LL,  "%s%.30s:%-4d ABORTING: posix_memalign(..., %zu, %zu) failed",  ",  "strict_memalign"",  183,  8uLL,  0x50uLL);
                    }
                  }

                  else
                  {
                    *(void **)((char *)&v6->_linkLogToken + 7) = __memptr[0];
                    v6->_ntlLogTokenListCount = 10;
                    __memptr[0] = 0LL;
                    if (!posix_memalign(__memptr, 8uLL, 0x50uLL) && __memptr[0])
                    {
                      *(void **)((char *)&v6->_ntlLogToken + 7) = __memptr[0];
                      id v24 = *(id *)((char *)&v6->_bluetoothUUID + 7);
                      uint64_t v16 = (uint64_t)v24;
                      uint64_t v25 = 246LL;
                      if (v6->_enableBluetoothPacketParser)
                      {
                        while (1)
                        {
                          uint64_t v379 = v5;
                          uint64_t v5 = v4;
                          uint64_t v381 = v25;
                          uint64_t v380 = v16;
                          uint64_t v4 = (uint64_t)&v375;
                          sentPreludeState = (int *)v6->_sentPreludeState;
                          v26 = v6;
                          v27 = (char *)malloc(0x21uLL);
                          if (v27)
                          {
                            uint64_t v2 = (uint64_t)v27;
                            *(void *)v27 = 0x53554E494D524554LL;
                            v27[8] = 1;
                            v27[9] = (char)sentPreludeState;
                            *((_WORD *)v27 + 5) = 4864;
                            v27[12] = 4;
                            *(_WORD *)(v27 + 13) = 4096;
                            [*(id *)((char *)&v6->_remotePacketProxy + 7) getUUIDBytes:__memptr];
                            *(_OWORD *)(v2 + 15) = *(_OWORD *)__memptr;
                            *(_WORD *)(v2 + 31) = ~(unsigned __int16)os_inet_checksum(v2, 31LL, 0LL);

                            if (*(_DWORD *)((char *)&v6->super.super.isa + v19) > 0x20u)
                            {
                              if (*(NSString **)((char *)&v26->_remoteDeviceName + 7))
                              {
                                v29 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v28);
                                int v30 = _NRLogIsLevelEnabled(v29, 17LL);

                                if (v30)
                                {
                                  v32 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v31);
                                  id v33 = -[NRLink copyDescription](v26, "copyDescription");
                                  _NRLogWithArgs( v32,  17LL,  "%@: Sending prelude but sentPrelude is %@",  v33,  *(NSString **)((char *)&v26->_remoteDeviceName + 7));
                                }
                              }

                              v34 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v2,  33LL);
                              v35 = *(NSString **)((char *)&v26->_remoteDeviceName + 7);
                              *(NSString **)((char *)&v26->_remoteDeviceName + 7) = (NSString *)&v34->super.isa;

                              uint64_t v36 = *(uint64_t *)((char *)&v6->super.super.isa + v3);
                              __int128 v37 = *(_OWORD *)v2;
                              __int128 v38 = *(_OWORD *)(v2 + 16);
                              *(_BYTE *)(v36 + 32) = *(_BYTE *)(v2 + 32);
                              *(_OWORD *)uint64_t v36 = v37;
                              *(_OWORD *)(v36 + 16) = v38;
                              free((void *)v2);
                              *(_DWORD *)((char *)&v6->super.super.isa + v5) += 33;
                              v40 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v39);
                              int v41 = _NRLogIsLevelEnabled(v40, 1LL);

                              if (v41)
                              {
                                v43 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v42);
                                id v44 = -[NRLink copyDescription](v26, "copyDescription");
                                uint64_t v45 = *(unsigned int *)((char *)&v6->super.super.isa + v5);
                                uint64_t v46 = *(unsigned int *)((char *)&v6->super.super.isa + v379);
                                v47 = (void *)_NRCreateDataString(*(NSString **)((char *)&v26->_remoteDeviceName + 7));
                                _NRLogWithArgs( v43,  1LL,  "%s%.30s:%-4d %@: Sending prelude %u bytes filledIn=%u handled=%u %@",  ",  "-[NRLinkBluetooth start]"",  1380LL,  v44,  33LL,  v45,  v46,  v47);
                              }

                              -[NRLink changeStateTo:](v26, "changeStateTo:", 2LL);
                              v49 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v48);
                              int v50 = _NRLogIsLevelEnabled(v49, 1LL);

                              if (v50)
                              {
                                v52 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v51);
                                id v53 = -[NRLink copyDescription](v26, "copyDescription");
                                _NRLogWithArgs( v52,  1LL,  "%s%.30s:%-4d %@: Created new link",  ",  "-[NRLinkBluetooth start]"",  1383LL,  v53);
                              }

                              if (*((_BYTE *)&v6->super.super.isa + v381)) {
                                sub_100070C18( (uint64_t)v26,  *(void **)((char *)&v26->_remoteDeviceName + 7),  &off_1001BC628);
                              }
                              v54 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v51);
                              int v55 = _NRLogIsLevelEnabled(v54, 1LL);

                              if (v55)
                              {
                                v57 = (void *)_NRCopyLogObjectForNRUUID(v26->super._nrUUID, v56);
                                id v58 = -[NRLink copyDescription](v26, "copyDescription");
                                _NRLogWithArgs( v57,  1LL,  "%s%.30s:%-4d %@: NtL LOOP async start before async",  ",  "-[NRLinkBluetooth start]"",  1390LL,  v58);
                              }

                              queue = (dispatch_queue_s *)v26->super._queue;
                              block[0] = _NSConcreteStackBlock;
                              block[1] = 3221225472LL;
                              block[2] = sub_10009E3B4;
                              block[3] = &unk_1001B0A88;
                              block[4] = v26;
                              dispatch_async(queue, block);
                              if (!v26->_addedHostStateObserver)
                              {
                                id v60 = *(id *)((char *)&v26->_bluetoothUUID + 7);
                                v61 = (void *)objc_claimAutoreleasedReturnValue([v60 peer]);
                                [v61 addObserver:v26 forKeyPath:@"hostState" options:5 context:0];

                                v26->_addedHostStateObserver = 1;
                              }

                              LOBYTE(v6) = 1;
                              uint64_t v16 = v380;
                              goto LABEL_201;
                            }

                            id v241 = sub_100070554();
                            int v242 = _NRLogIsLevelEnabled(v241, 16LL);

                            if (v242)
                            {
                              id v243 = sub_100070554();
                              _NRLogWithArgs( v243,  16LL,  "%s%.30s:%-4d ABORTING: well this is absurd %u",  ",  "-[NRLinkBluetooth start]"",  1369,  33);
                            }

                            uint64_t v16 = _os_log_pack_size(18LL);
                            v6 = (NRLinkBluetooth *)((char *)&v375 - ((__chkstk_darwin(v16) + 15) & 0xFFFFFFFFFFFFFFF0LL));
                            v244 = __error();
                            uint64_t v245 = _os_log_pack_fill( v6,  v16,  *v244,  &_mh_execute_header,  "%{public}s well this is absurd %u");
                            *(_DWORD *)uint64_t v245 = 136446466;
                            *(void *)(v245 + 4) = "-[NRLinkBluetooth start]";
                            *(_WORD *)(v245 + 12) = 1024;
                            *(_DWORD *)(v245 + 14) = 33;
                          }

                          else
                          {
                            id v165 = sub_100070554();
                            int v166 = _NRLogIsLevelEnabled(v165, 16LL);

                            if (v166)
                            {
                              id v167 = sub_100070554();
                              _NRLogWithArgs( v167,  16LL,  "%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed",  ",  "strict_malloc"",  79,  0x21uLL);
                            }

                            uint64_t v16 = _os_log_pack_size(22LL);
                            v6 = (NRLinkBluetooth *)((char *)&v375 - ((__chkstk_darwin(v16) + 15) & 0xFFFFFFFFFFFFFFF0LL));
                            v168 = __error();
                            uint64_t v169 = _os_log_pack_fill( v6,  v16,  *v168,  &_mh_execute_header,  "%{public}s strict_malloc(%zu) failed");
                            *(_DWORD *)uint64_t v169 = 136446466;
                            *(void *)(v169 + 4) = "strict_malloc";
                            *(_WORD *)(v169 + 12) = 2048;
                            *(void *)(v169 + 14) = 33LL;
                          }

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", sub_1000776BC((uint64_t)self, v3));
}

- (void)invalidateLink
{
  int v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    id v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v6, 0LL, "%s%.30s:%-4d %@: Invalidating", ", "-[NRLinkBluetooth invalidateLink]"", 1566LL, v7);
  }

  v105.receiver = self;
  v105.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
  -[NRLink invalidateLink](&v105, "invalidateLink");
  objc_super v9 = *(NSData **)((char *)&self->_localPublicClassAKeysEncryptedWithIDS + 7);
  if (v9)
  {
    free(v9);
    *(NSData **)((char *)&self->_localPublicClassAKeysEncryptedWithIDS + 7) = 0LL;
  }

  objc_super v10 = *(void **)((char *)&self->_lastReadNexusOutputActivityCounter + 7);
  if (v10)
  {
    free(v10);
    *(unint64_t *)((char *)&self->_lastReadNexusOutputActivityCounter + 7) = 0LL;
  }

  if (self->_addedHostStateObserver)
  {
    id v11 = *(id *)((char *)&self->_bluetoothUUID + 7);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peer]);
    [v12 removeObserver:self forKeyPath:@"hostState" context:0];

    self->_addedHostStateObserver = 0;
  }

  uint64_t v13 = *(dispatch_source_s **)((char *)&self->_nexusOutputRing + 7);
  if (v13)
  {
    if (self->_dNexusInputSourceSuspended)
    {
      self->_dNexusInputSourceSuspended = 0;
      ++*(OS_dispatch_group **)((char *)&self->_nexusGroup + 7);
      if (gNRPacketLoggingEnabled)
      {
        int v55 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v56 = _NRLogIsLevelEnabled(v55, 1LL);

        if (v56)
        {
          id v58 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v57);
          id v59 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v58,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusInput",  ",  "NRLinkResumeNexusInputSource"",  842LL,  v59);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusOutputRing + 7));
      uint64_t v13 = *(dispatch_source_s **)((char *)&self->_nexusOutputRing + 7);
    }

    dispatch_source_cancel(v13);
    v14 = *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusOutputRing + 7) = 0LL;
  }

  uint64_t v15 = *(dispatch_source_s **)((char *)&self->_dNexusInputSource + 7);
  if (v15)
  {
    if (self->_dNexusOutputSourceSuspended)
    {
      self->_dNexusOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        id v60 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v61 = _NRLogIsLevelEnabled(v60, 1LL);

        if (v61)
        {
          uint64_t v63 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v62);
          id v64 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v63,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusOutput",  ",  "NRLinkResumeNexusOutputSource"",  843LL,  v64);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusInputSource + 7));
      uint64_t v15 = *(dispatch_source_s **)((char *)&self->_dNexusInputSource + 7);
    }

    dispatch_source_cancel(v15);
    uint64_t v16 = *(OS_dispatch_source **)((char *)&self->_dNexusInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusInputSource + 7) = 0LL;
  }

  uint64_t v17 = *(uint64_t *)((char *)&self->_receivedPrelude + 7);
  if (v17)
  {
    *(NSData **)((char *)&self->_receivedPrelude + 7) = 0LL;
  }

  *(channel **)((char *)&self->_nexusChannel + 7) = 0LL;
  *(channel_ring_desc **)((char *)&self->_nexusInputRing + 7) = 0LL;
  uint64_t v18 = *(dispatch_source_s **)((char *)&self->_nexusVIOutputRing + 7);
  if (v18)
  {
    if (self->_dNexusVIInputSourceSuspended)
    {
      self->_dNexusVIInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusVIOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        uint64_t v65 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v66 = _NRLogIsLevelEnabled(v65, 1LL);

        if (v66)
        {
          uint64_t v68 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v67);
          id v69 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v68,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusVIInput",  ",  "NRLinkResumeNexusVIInputSource"",  846LL,  v69);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusVIOutputRing + 7));
      uint64_t v18 = *(dispatch_source_s **)((char *)&self->_nexusVIOutputRing + 7);
    }

    dispatch_source_cancel(v18);
    uint64_t v19 = *(channel_ring_desc **)((char *)&self->_nexusVIOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusVIOutputRing + 7) = 0LL;
  }

  v20 = *(dispatch_source_s **)((char *)&self->_dNexusVIInputSource + 7);
  if (v20)
  {
    if (self->_dNexusVIOutputSourceSuspended)
    {
      self->_dNexusVIOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusVIInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        v70 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v71 = _NRLogIsLevelEnabled(v70, 1LL);

        if (v71)
        {
          uint64_t v73 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v72);
          id v74 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v73,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusVIOutput",  ",  "NRLinkResumeNexusVIOutputSource"",  847LL,  v74);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusVIInputSource + 7));
      v20 = *(dispatch_source_s **)((char *)&self->_dNexusVIInputSource + 7);
    }

    dispatch_source_cancel(v20);
    uint64_t v21 = *(OS_dispatch_source **)((char *)&self->_dNexusVIInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusVIInputSource + 7) = 0LL;
  }

  uint64_t v22 = *(uint64_t *)((char *)&self->_nexusVIGroup + 7);
  if (v22)
  {
    *(OS_dispatch_group **)((char *)&self->_nexusVIGroup + 7) = 0LL;
  }

  *(channel **)((char *)&self->_nexusVIChannel + 7) = 0LL;
  *(channel_ring_desc **)((char *)&self->_nexusVIInputRing + 7) = 0LL;
  v23 = *(dispatch_source_s **)((char *)&self->_nexusVOOutputRing + 7);
  if (v23)
  {
    if (self->_dNexusVOInputSourceSuspended)
    {
      self->_dNexusVOInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusVOOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v75 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v76 = _NRLogIsLevelEnabled(v75, 1LL);

        if (v76)
        {
          v78 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v77);
          id v79 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v78,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusVOInput",  ",  "NRLinkResumeNexusVOInputSource"",  844LL,  v79);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusVOOutputRing + 7));
      v23 = *(dispatch_source_s **)((char *)&self->_nexusVOOutputRing + 7);
    }

    dispatch_source_cancel(v23);
    id v24 = *(channel_ring_desc **)((char *)&self->_nexusVOOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusVOOutputRing + 7) = 0LL;
  }

  uint64_t v25 = *(dispatch_source_s **)((char *)&self->_dNexusVOInputSource + 7);
  if (v25)
  {
    if (self->_dNexusVOOutputSourceSuspended)
    {
      self->_dNexusVOOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusVOInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        uint64_t v80 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v81 = _NRLogIsLevelEnabled(v80, 1LL);

        if (v81)
        {
          v83 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v82);
          id v84 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v83,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusVOOutput",  ",  "NRLinkResumeNexusVOOutputSource"",  845LL,  v84);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusVOInputSource + 7));
      uint64_t v25 = *(dispatch_source_s **)((char *)&self->_dNexusVOInputSource + 7);
    }

    dispatch_source_cancel(v25);
    v26 = *(OS_dispatch_source **)((char *)&self->_dNexusVOInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusVOInputSource + 7) = 0LL;
  }

  uint64_t v27 = *(uint64_t *)((char *)&self->_nexusVOGroup + 7);
  if (v27)
  {
    *(OS_dispatch_group **)((char *)&self->_nexusVOGroup + 7) = 0LL;
  }

  *(channel **)((char *)&self->_nexusVOChannel + 7) = 0LL;
  *(channel_ring_desc **)((char *)&self->_nexusVOInputRing + 7) = 0LL;
  uint64_t v28 = *(dispatch_source_s **)((char *)&self->_nexusBKOutputRing + 7);
  if (v28)
  {
    if (self->_dNexusBKInputSourceSuspended)
    {
      self->_dNexusBKInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dNexusBKOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        uint64_t v85 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v86 = _NRLogIsLevelEnabled(v85, 1LL);

        if (v86)
        {
          uint64_t v88 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v87);
          id v89 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v88,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusBKInput",  ",  "NRLinkResumeNexusBKInputSource"",  848LL,  v89);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_nexusBKOutputRing + 7));
      uint64_t v28 = *(dispatch_source_s **)((char *)&self->_nexusBKOutputRing + 7);
    }

    dispatch_source_cancel(v28);
    v29 = *(channel_ring_desc **)((char *)&self->_nexusBKOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_nexusBKOutputRing + 7) = 0LL;
  }

  int v30 = *(dispatch_source_s **)((char *)&self->_dNexusBKInputSource + 7);
  if (v30)
  {
    if (self->_dNexusBKOutputSourceSuspended)
    {
      self->_dNexusBKOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dNexusBKInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        int v90 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v91 = _NRLogIsLevelEnabled(v90, 1LL);

        if (v91)
        {
          int v93 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v92);
          id v94 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v93,  1LL,  "%s%.30s:%-4d %@: source-resume: NexusBKOutput",  ",  "NRLinkResumeNexusBKOutputSource"",  849LL,  v94);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dNexusBKInputSource + 7));
      int v30 = *(dispatch_source_s **)((char *)&self->_dNexusBKInputSource + 7);
    }

    dispatch_source_cancel(v30);
    uint64_t v31 = *(OS_dispatch_source **)((char *)&self->_dNexusBKInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dNexusBKInputSource + 7) = 0LL;
  }

  uint64_t v32 = *(uint64_t *)((char *)&self->_nexusBKGroup + 7);
  if (v32)
  {
    *(OS_dispatch_group **)((char *)&self->_nexusBKGroup + 7) = 0LL;
  }

  *(channel **)((char *)&self->_nexusBKChannel + 7) = 0LL;
  *(channel_ring_desc **)((char *)&self->_nexusBKInputRing + 7) = 0LL;
  id v33 = *(dispatch_source_s **)((char *)&self->_linkOutputRing + 7);
  if (v33)
  {
    if (self->_dLinkInputSourceSuspended)
    {
      self->_dLinkInputSourceSuspended = 0;
      ++*(OS_dispatch_source **)((char *)&self->_dLinkOutputSource + 7);
      if (gNRPacketLoggingEnabled)
      {
        v95 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v96 = _NRLogIsLevelEnabled(v95, 1LL);

        if (v96)
        {
          uint64_t v98 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v97);
          id v99 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v98,  1LL,  "%s%.30s:%-4d %@: source-resume: LinkInput",  ",  "NRLinkResumeLinkInputSource"",  822LL,  v99);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_linkOutputRing + 7));
      id v33 = *(dispatch_source_s **)((char *)&self->_linkOutputRing + 7);
    }

    dispatch_source_cancel(v33);
    v34 = *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7);
    *(channel_ring_desc **)((char *)&self->_linkOutputRing + 7) = 0LL;
  }

  v35 = *(dispatch_source_s **)((char *)&self->_dLinkInputSource + 7);
  if (v35)
  {
    if (self->_dLinkOutputSourceSuspended)
    {
      self->_dLinkOutputSourceSuspended = 0;
      ++*(unint64_t *)((char *)&self->_dLinkInputSourceActivityCounter + 7);
      if (gNRPacketLoggingEnabled)
      {
        uint64_t v100 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
        int v101 = _NRLogIsLevelEnabled(v100, 1LL);

        if (v101)
        {
          uint64_t v103 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v102);
          id v104 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v103,  1LL,  "%s%.30s:%-4d %@: source-resume: LinkOutput",  ",  "NRLinkResumeLinkOutputSource"",  823LL,  v104);
        }
      }

      dispatch_resume(*(dispatch_object_t *)((char *)&self->_dLinkInputSource + 7));
      v35 = *(dispatch_source_s **)((char *)&self->_dLinkInputSource + 7);
    }

    dispatch_source_cancel(v35);
    uint64_t v36 = *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7);
    *(OS_dispatch_source **)((char *)&self->_dLinkInputSource + 7) = 0LL;
  }

  __int128 v37 = *(dispatch_source_s **)((char *)&self->_lastWrittenUrgentLink + 7);
  if (v37)
  {
    dispatch_source_cancel(v37);
    __int128 v38 = *(NSDate **)((char *)&self->_lastWrittenUrgentLink + 7);
    *(NSDate **)((char *)&self->_lastWrittenUrgentLink + 7) = 0LL;
  }

  *(unint64_t *)((char *)&self->_writeCounter + 7) = 0LL;
  *(channel **)((char *)&self->_linkChannel + 7) = 0LL;
  *(channel_ring_desc **)((char *)&self->_linkInputRing + 7) = 0LL;
  uint64_t v39 = *(void **)((char *)&self->_linkLogToken + 7);
  if (v39)
  {
    free(v39);
    *(unint64_t *)((char *)&self->_linkLogToken + 7) = 0LL;
  }

  v40 = *(void **)((char *)&self->_ntlLogToken + 7);
  if (v40)
  {
    free(v40);
    *(unint64_t *)((char *)&self->_ntlLogToken + 7) = 0LL;
  }

  -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0LL);
  int v41 = *(NSMutableData **)((char *)&self->_linkOutgoingData + 7);
  if (v41)
  {
    [v41 setAvailability:0];
    [*(id *)((char *)&self->_linkOutgoingData + 7) cancel];
    uint64_t v42 = *(NSMutableData **)((char *)&self->_linkOutgoingData + 7);
    *(NSMutableData **)((char *)&self->_linkOutgoingData + 7) = 0LL;
  }

  v43 = *(NEIPsecNexus **)((char *)&self->_dummyPacketNexus + 7);
  *(NEIPsecNexus **)((char *)&self->_dummyPacketNexus + 7) = 0LL;

  id v44 = *(NSUUID **)((char *)&self->_bluetoothUUID + 7);
  *(NSUUID **)((char *)&self->_bluetoothUUID + 7) = 0LL;

  sub_10007FCF8((uint64_t)self, 0LL);
  sub_100080D40((char *)self, 0LL);
  -[NRLinkBluetooth invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL);
  -[NRLinkBluetooth invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3LL);
  -[NRLinkBluetooth invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 1LL);
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", (char *)&self->_ikeSessionClassA + 7);
  uint64_t v46 = *(NSMutableArray **)((char *)&self->_latencyContexts + 7);
  if (v46)
  {
    [v46 cancel];
    v47 = *(NSMutableArray **)((char *)&self->_latencyContexts + 7);
    *(NSMutableArray **)((char *)&self->_latencyContexts + 7) = 0LL;
  }

  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_10005DE28((uint64_t)companionProxyAgent, v45);
    v49 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0LL;
  }

  int v50 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v45);
  int v51 = _NRLogIsLevelEnabled(v50, 0LL);

  if (v51)
  {
    id v53 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v52);
    id v54 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v53, 0LL, "%s%.30s:%-4d %@: Invalidated", ", "-[NRLinkBluetooth invalidateLink]"", 1634LL, v54);
  }

- (void)refreshCompanionProxyAgent
{
  if (self->super._state == 255)
  {
    int v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1LL);

    if (IsLevelEnabled)
    {
      id v7 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      id v6 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v7,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'refreshCompanionProxyAgent'",  ",  "-[NRLinkBluetooth refreshCompanionProxyAgent]"",  1640LL,  v6);
    }
  }

  else
  {
    sub_10005F3F0((uint64_t)self->super._companionProxyAgent, (uint64_t)a2);
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"hostState"])
  {
    id v10 = v9;
    if (qword_1001DC840 != -1) {
      dispatch_once(&qword_1001DC840, &stru_1001AEE08);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC838, 2LL))
    {
      if (qword_1001DC840 != -1) {
        dispatch_once(&qword_1001DC840, &stru_1001AEE08);
      }
      id v11 = (id)qword_1001DC838;
      id v12 = [v10 hostState];
      if ((unint64_t)v12 >= 3) {
        uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%lld)",  v12);
      }
      else {
        uint64_t v13 = (NSString *)*((void *)&off_1001AEE28 + (void)v12);
      }
      _NRLogWithArgs( v11,  2LL,  "%s%.30s:%-4d Got notification for keyPath: %@, %@ (%@)",  ",  "-[NRLinkBluetooth observeValueForKeyPath:ofObject:change:context:]"",  1659LL,  v8,  v10,  v13);
    }

    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007FBE0;
    block[3] = &unk_1001B0720;
    block[4] = self;
    id v17 = v10;
    id v15 = v10;
    dispatch_async(v14, block);
  }

  else
  {
    if (qword_1001DC840 != -1) {
      dispatch_once(&qword_1001DC840, &stru_1001AEE08);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC838, 17LL))
    {
      if (qword_1001DC840 != -1) {
        dispatch_once(&qword_1001DC840, &stru_1001AEE08);
      }
      _NRLogWithArgs(qword_1001DC838, 17LL, "Unexpected KVO notification for keyPath: %@", v8);
    }
  }
}

- (unsigned)metric
{
  return 10;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v48 = &v50;
    uint64_t v5 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v4,  &v50);
    if (-[NRLink changeStateTo:details:](self, "changeStateTo:details:", 255LL, v5))
    {
      if (self)
      {
        uint64_t v7 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v7)
        {
          uint64_t v7 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        }

        if (v7)
        {
          *(void *)(v7 + 80) = *(unint64_t *)((char *)&self->_packetsToNexusBK + 7)
                               + *(unint64_t *)((char *)&self->_packetsToNexus + 7)
          uint64_t v8 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
          if (v8) {
            *(void *)(v8 + 88) = *(unint64_t *)((char *)&self->_bytesFromNexusBK + 7)
          }
                                 + *(unint64_t *)((char *)&self->_bytesFromNexus + 7)
        }

        -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
        uint64_t v10 = *(unint64_t *)((char *)&self->_counterForDataStallRemediation + 7);
        if (v10) {
          *(void *)(v10 + 16) = v9;
        }
      }

      else
      {
        [0 linkTotalReadyTimeInSec];
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v11 linkIsUnavailable:self];

      uint64_t v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 16LL);

      if (IsLevelEnabled)
      {
        uint64_t v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
        id v17 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v16,  16LL,  "%s%.30s:%-4d %@: Cancelling due to %@, dumping last status:",  ",  "-[NRLinkBluetooth cancelWithReason:]"",  1714LL,  v17,  v5);
      }

      v43 = v5;
      id v42 = -[NRLinkBluetooth copyStatusString](self, "copyStatusString");
      id v18 = (id)objc_claimAutoreleasedReturnValue([v42 componentsSeparatedByString:@"\n"]);
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v19 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v19)
      {
        id v21 = v19;
        uint64_t v22 = *(void *)v45;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(v18);
            }
            uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
            uint64_t v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
            int v26 = _NRLogIsLevelEnabled(v25, 16LL);

            if (v26)
            {
              uint64_t v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
              id v28 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs( v27,  16LL,  "%s%.30s:%-4d %@: %@",  ",  "-[NRLinkBluetooth cancelWithReason:]"",  1718LL,  v28,  v24);
            }
          }

          id v21 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }

        while (v21);
      }

      -[NRLinkBluetooth invalidateLink](self, "invalidateLink");
      [*(id *)((char *)&self->_counterForDataStallRemediation + 7) submit];
      v34 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v33);
      int v35 = _NRLogIsLevelEnabled(v34, 1LL);

      if (v35)
      {
        __int128 v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
        id v38 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v37,  1LL,  "%s%.30s:%-4d %@: Done cancelling",  ",  "-[NRLinkBluetooth cancelWithReason:]"",  1724LL,  v38);
      }

      uint64_t v5 = v43;
      uint64_t v32 = v42;
      goto LABEL_27;
    }

    v29 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    int v30 = _NRLogIsLevelEnabled(v29, 0LL);

    if (v30)
    {
      uint64_t v32 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
      id v18 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v32,  0LL,  "%s%.30s:%-4d %@: link already cancelled",  ",  "-[NRLinkBluetooth cancelWithReason:]"",  1700LL,  v18);
LABEL_27:
    }
  }

  else
  {
    id v40 = sub_100070554();
    int v41 = _NRLogIsLevelEnabled(v40, 17LL);

    if (!v41) {
      goto LABEL_29;
    }
    uint64_t v5 = (NSString *)sub_100070554();
    _NRLogWithArgs(v5, 17LL, "%s called with null reasonFormat", "-[NRLinkBluetooth cancelWithReason:]");
  }

LABEL_29:
  return v4 != 0LL;
}

- (BOOL)suspend
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
  -[NRLink suspend](&v20, "suspend");
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DE28((uint64_t)companionProxyAgent, v3) & 1) == 0)
      {
        uint64_t v5 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
        int IsLevelEnabled = _NRLogIsLevelEnabled(v5, 16LL);

        if (IsLevelEnabled)
        {
          uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
          id v8 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v7,  16LL,  "%s%.30s:%-4d %@: failed to unregister companion agent",  ",  "-[NRLinkBluetooth suspend]"",  1759LL,  v8);
        }
      }
    }

    if (*(unsigned int *)((char *)&self->_handledUrgentLinkWriteBufferBytes + 3))
    {
      uint64_t v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
      int v10 = _NRLogIsLevelEnabled(v9, 1LL);

      if (v10)
      {
        uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v11);
        id v13 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v12,  1LL,  "%s%.30s:%-4d %@: Will suspend the link once all the control data is sent",  ",  "-[NRLinkBluetooth suspend]"",  1767LL,  v13);
      }

      self->_shouldSuspend = 1;
    }

    else
    {
      sub_10007F760((uint64_t)self, 1LL);
    }

    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9LL, @"(suspend)");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v17 linkIsSuspended:self];
    goto LABEL_14;
  }

  v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  int v15 = _NRLogIsLevelEnabled(v14, 1LL);

  if (v15)
  {
    id v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
    id v18 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v17,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'",  ",  "-[NRLinkBluetooth suspend]"",  1753LL,  v18);

LABEL_14:
  }

  return 1;
}

- (BOOL)resume
{
  if (self->super._state == 255)
  {
    id v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    BOOL v12 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 1LL);

    if (IsLevelEnabled)
    {
      uint64_t v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
      id v17 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v16,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'",  ",  "-[NRLinkBluetooth resume]"",  1781LL,  v17);
    }
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
    if (-[NRLink resume](&v19, "resume"))
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if ((sub_10005E944((uint64_t)companionProxyAgent, v3) & 1) == 0)
        {
          uint64_t v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          int v7 = _NRLogIsLevelEnabled(v6, 16LL);

          if (v7)
          {
            uint64_t v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
            id v10 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v9,  16LL,  "%s%.30s:%-4d %@: failed to register companion agent",  ",  "-[NRLinkBluetooth resume]"",  1792LL,  v10);
          }
        }
      }

      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8LL, @"(resume)");
      sub_10007F760((uint64_t)self, 0LL);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v11 linkIsReady:self];

      return 1;
    }

    else
    {
      return 0;
    }
  }

  return v12;
}

- (void)checkProxyAgentWithForceUpdate:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NRLinkBluetooth;
  -[NRLink checkProxyAgentWithForceUpdate:](&v18, "checkProxyAgentWithForceUpdate:", a3);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NRLink proxyAgentRegistration](self, "proxyAgentRegistration"));
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    unsigned int v7 = -[NRLink state](self, "state");

    if (v7 == 8)
    {
      if (-[NRLink shouldCreateCompanionProxyAgent](self, "shouldCreateCompanionProxyAgent"))
      {
        companionProxyAgent = self->super._companionProxyAgent;
        if (!companionProxyAgent)
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_linkOutgoingData + 7) interfaceName]);
          if (v9 && *(CBScalablePipe **)((char *)&self->_pipe + 7))
          {
            id v10 = objc_alloc(&OBJC_CLASS___NRCompanionProxyAgent);
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
            BOOL v12 = (NRCompanionProxyAgent *)sub_10005E638( (id *)&v10->super.isa,  v11,  v9,  *(void **)((char *)&self->_pipe + 7),  self->super._nrUUID);
            id v13 = self->super._companionProxyAgent;
            self->super._companionProxyAgent = v12;

            -[NRLink reportEvent:](self, "reportEvent:", 12001LL);
          }

          companionProxyAgent = self->super._companionProxyAgent;
        }

        if ((sub_10005E944((uint64_t)companionProxyAgent, v5) & 1) == 0)
        {
          v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 16LL);

          if (IsLevelEnabled)
          {
            uint64_t v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
            id v17 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v16,  16LL,  "%s%.30s:%-4d %@: failed to register companion agent",  ",  "-[NRLinkBluetooth checkProxyAgentWithForceUpdate:]"",  5827LL,  v17);
          }
        }
      }
    }
  }

  sub_10007F85C((uint64_t)self, v5);
}

- (void)acceptNewFlow:(id)a3 fromNexus:(id)a4 completionHandler:(id)a5
{
  BOOL v12 = (void (**)(id, void))a5;
  unsigned int v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1LL);

  if (IsLevelEnabled)
  {
    id v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    id v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: oh boy got a flow",  ",  "-[NRLinkBluetooth acceptNewFlow:fromNexus:completionHandler:]"",  7171LL,  v11);
  }

  v12[2](v12, 0LL);
}

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:50702 notifyData:v4];
    BOOL v6 = v5 != 0LL;
    if (v5)
    {
      if (self) {
        ++*(unsigned int *)((char *)&self->_handledUrgentLinkWriteBufferBytes + 3);
      }
      objc_initWeak(&location, self);
      unsigned int v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      id v20 = v5;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10007F578;
      v17[3] = &unk_1001AF950;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:10000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    else
    {
      id v14 = sub_100070554();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17LL);

      if (IsLevelEnabled)
      {
        id v16 = sub_100070554();
        _NRLogWithArgs(v16, 17LL, "NEIKEv2PrivateNotify init %u %@ failed", 50702LL, v4);
      }
    }
  }

  else
  {
    id v11 = sub_100070554();
    int v12 = _NRLogIsLevelEnabled(v11, 17LL);

    if (v12)
    {
      id v13 = sub_100070554();
      _NRLogWithArgs(v13, 17LL, "%s called with null data", "-[NRLinkBluetooth sendControlData:]");
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v21 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v140 = sub_100070554();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v140, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_36;
    }
    id v142 = sub_100070554();
    _NRLogWithArgs(v142, 17LL, "%s called with null listener");
LABEL_109:

    goto LABEL_36;
  }

  if (!v15)
  {
    id v143 = sub_100070554();
    int v144 = _NRLogIsLevelEnabled(v143, 17LL);

    if (!v144) {
      goto LABEL_36;
    }
    id v142 = sub_100070554();
    _NRLogWithArgs(v142, 17LL, "%s called with null session");
    goto LABEL_109;
  }

  if (!v16)
  {
    id v145 = sub_100070554();
    int v146 = _NRLogIsLevelEnabled(v145, 17LL);

    if (!v146) {
      goto LABEL_36;
    }
    id v142 = sub_100070554();
    _NRLogWithArgs(v142, 17LL, "%s called with null sessionConfig");
    goto LABEL_109;
  }

  if (!v18)
  {
    id v147 = sub_100070554();
    int v148 = _NRLogIsLevelEnabled(v147, 17LL);

    if (!v148) {
      goto LABEL_36;
    }
    id v142 = sub_100070554();
    _NRLogWithArgs(v142, 17LL, "%s called with null validateAuthBlock");
    goto LABEL_109;
  }

  if (!v19)
  {
    id v149 = sub_100070554();
    int v150 = _NRLogIsLevelEnabled(v149, 17LL);

    if (!v150) {
      goto LABEL_36;
    }
    id v142 = sub_100070554();
    _NRLogWithArgs(v142, 17LL, "%s called with null responseBlock");
    goto LABEL_109;
  }

  uint64_t v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
  int v23 = _NRLogIsLevelEnabled(v22, 0LL);

  if (v23)
  {
    uint64_t v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
    id v26 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v25,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@",  ",  "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  9232LL,  v26,  v14,  v15,  v16,  v17);
  }

  if (self->super._state == 255) {
    goto LABEL_33;
  }
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
  id v28 = [v27 identifierType];

  if (v28 != (id)11)
  {
    uint64_t v52 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v29);
    int v53 = _NRLogIsLevelEnabled(v52, 16LL);

    if (v53)
    {
      int v55 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v54);
      id v56 = -[NRLink copyDescription](self, "copyDescription");
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
      _NRLogWithArgs( v55,  16,  "%s%.30s:%-4d %@: Local identifier has wrong type %zu",  ",  "-[NRLinkBluetooth requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]",  9246,  v56,  [v57 identifierType]);
LABEL_32:
    }

- (BOOL)sendPacketData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v19 = sub_100070554();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v19, 17LL);

    if (IsLevelEnabled)
    {
      id v21 = sub_100070554();
      _NRLogWithArgs(v21, 17LL, "%s called with null data", "-[NRLinkBluetooth sendPacketData:]");
    }

    goto LABEL_8;
  }

  int state = self->super._state;
  uint64_t v7 = _NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
  uint64_t v8 = (void *)v7;
  if (state == 255)
  {
    int v14 = _NRLogIsLevelEnabled(v7, 16LL);

    if (v14)
    {
      id v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
      id v17 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v16,  16LL,  "%s%.30s:%-4d %@: Asked to send IKEv2 data but cancelled",  ",  "-[NRLinkBluetooth sendPacketData:]"",  9489LL,  v17);
    }

- (void)setPacketReceiver:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0LL);

    if (IsLevelEnabled)
    {
      uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v10,  0LL,  "%s%.30s:%-4d %@: Setting IKEv2 packet receiver",  ",  "-[NRLinkBluetooth setPacketReceiver:]"",  9500LL,  v11);
    }

    objc_storeStrong((id *)((char *)&self->_ikeSessionPairing + 7), a3);
    if ([*(id *)((char *)&self->_urgentLinkWriteBuffer + 7) count])
    {
      char v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
      int v14 = _NRLogIsLevelEnabled(v13, 1LL);

      if (v14)
      {
        id v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
        id v17 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v16,  1,  "%s%.30s:%-4d %@: processing %llu previously received IKE packets",  ",  "-[NRLinkBluetooth setPacketReceiver:]",  9504,  v17,  [*(id *)((char *)&self->_urgentLinkWriteBuffer + 7) count]);
      }
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v18 = *(id *)((char *)&self->_urgentLinkWriteBuffer + 7);
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)((char *)&self->_ikeSessionPairing + 7) receivePacketData:*(void *)(*((void *)&v26 + 1) + 8 * (void)i)];
        }

        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v20);
    }

    [*(id *)((char *)&self->_urgentLinkWriteBuffer + 7) removeAllObjects];
  }

  else
  {
    id v23 = sub_100070554();
    int v24 = _NRLogIsLevelEnabled(v23, 17LL);

    if (v24)
    {
      id v25 = sub_100070554();
      _NRLogWithArgs(v25, 17LL, "%s called with null receiver", "-[NRLinkBluetooth setPacketReceiver:]");
    }
  }
}

- (void).cxx_destruct
{
}

@end