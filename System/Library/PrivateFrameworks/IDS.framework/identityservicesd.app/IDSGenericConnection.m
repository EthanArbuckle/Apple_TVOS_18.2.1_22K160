@interface IDSGenericConnection
- ($F18A97B9DD67A12B1A73262525205838)encryptionState;
- (BOOL)checksumFailed;
- (BOOL)didInvalidate;
- (BOOL)encryptionEnabled;
- (BOOL)hasMoreData;
- (BOOL)isCloudEnabled;
- (BOOL)isControlChannel;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isDirectMsgChannel;
- (BOOL)isRealTime;
- (BOOL)shouldSetAllowlistUUIDForStreamingSocket;
- (BOOL)shouldStopBTDatagramLink;
- (BOOL)suspended;
- (IDSConnectionContext)connectionContext;
- (IDSGenericConnection)initWithAddressPair:(id)a3 protocol:(int)a4;
- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 isCloudEnabled:(BOOL)a5;
- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 keyMaterialLength:(int)a5 isCloudEnabled:(BOOL)a6;
- (IDSGenericConnectionID)connectionID;
- (IDSHCInfo)compressionInfo;
- (IDSSockAddrWrapperPair)addressPair;
- (IDSStallDetector)outgoingStallDetector;
- (NSError)connectError;
- (NSString)clientID;
- (NSString)idsDeviceConnectionUUID;
- (NSString)localConnectionGUID;
- (NSString)outgoingStallDetectorName;
- (NSString)remoteConnectionGUID;
- (OS_dispatch_queue)completionQueue;
- (OS_nw_connection)serviceConnection;
- (OS_nw_endpoint)defaultPairedDeviceEndpoint;
- (OS_nw_service_connector)serviceConnector;
- (char)localKeyMaterial;
- (double)connectionInitTime;
- (double)connectionSetupStartTime;
- (double)creationTime;
- (double)firstDataPacketReceiveTime;
- (double)firstPacketReceiveTime;
- (double)lastSuccessfulSentTime;
- (id)description;
- (id)flagsString;
- (id)openSocketCompletionHandler;
- (id)readHandler;
- (int)keyMaterialLength;
- (int)protocol;
- (int)sd;
- (int)sdCopy;
- (int)sdNumberNoClose;
- (int)sdOriginal;
- (int)srtpProtocolVersion;
- (int)stateFlags;
- (int64_t)compressionState;
- (int64_t)priority;
- (int64_t)socketTrafficClass;
- (unint64_t)bytesReceived;
- (unint64_t)bytesSent;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (unsigned)SSRCRecv;
- (unsigned)SSRCSend;
- (unsigned)dataProtectionClass;
- (unsigned)expectedNextIncomingSequenceNumber;
- (unsigned)expectedNextOutgoingSequenceNumber;
- (unsigned)firstIncomingSYNSequenceNumber;
- (unsigned)seqRecvStart;
- (unsigned)seqSend;
- (unsigned)seqSendStart;
- (unsigned)uint32Key;
- (void)_closeSockets;
- (void)_createStallDetectorWithName:(id)a3;
- (void)_triggerStallDetectionLogsForDetector:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)reportToAWD:(unint64_t)a3 connectionType:(int)a4 error:(int)a5;
- (void)setAddressPair:(id)a3;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setChecksumFailed:(BOOL)a3;
- (void)setClientID:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setCompressionInfo:(id)a3;
- (void)setCompressionState:(int64_t)a3;
- (void)setConnectError:(id)a3;
- (void)setConnectionContext:(id)a3;
- (void)setConnectionID:(id)a3;
- (void)setConnectionInitTime:(double)a3;
- (void)setConnectionSetupStartTime:(double)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDefaultPairedDeviceEndpoint:(id)a3;
- (void)setDidInvalidate:(BOOL)a3;
- (void)setEncryptionEnabled:(BOOL)a3;
- (void)setExpectedNextIncomingSequenceNumber:(unsigned int)a3;
- (void)setExpectedNextOutgoingSequenceNumber:(unsigned int)a3;
- (void)setFirstDataPacketReceiveTime:(double)a3;
- (void)setFirstIncomingSYNSequenceNumber:(unsigned int)a3;
- (void)setFirstPacketReceiveTime:(double)a3;
- (void)setHasMoreData:(BOOL)a3;
- (void)setIdsDeviceConnectionUUID:(id)a3;
- (void)setIsCloudEnabled:(BOOL)a3;
- (void)setIsControlChannel:(BOOL)a3;
- (void)setIsDefaultPairedDevice:(BOOL)a3;
- (void)setIsDirectMsgChannel:(BOOL)a3;
- (void)setIsRealTime:(BOOL)a3;
- (void)setKeyMaterialLength:(int)a3;
- (void)setLastSuccessfulSentTime:(double)a3;
- (void)setLocalKeyMaterial:(char *)a3;
- (void)setOpenSocketCompletionHandler:(id)a3;
- (void)setOutgoingStallDetector:(id)a3;
- (void)setOutgoingStallDetectorName:(id)a3;
- (void)setPacketsReceived:(unint64_t)a3;
- (void)setPacketsSent:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setReadHandler:(id)a3;
- (void)setRemoteConnectionGUID:(id)a3;
- (void)setSSRCRecv:(unsigned int)a3;
- (void)setSSRCSend:(unsigned int)a3;
- (void)setSd:(int)a3;
- (void)setSdCopy:(int)a3;
- (void)setSdNumberNoClose:(int)a3;
- (void)setSdOriginal:(int)a3;
- (void)setSeqRecvStart:(unsigned __int16)a3;
- (void)setSeqSend:(unsigned __int16)a3;
- (void)setSeqSendStart:(unsigned __int16)a3;
- (void)setServiceConnection:(id)a3;
- (void)setServiceConnector:(id)a3;
- (void)setShouldSetAllowlistUUIDForStreamingSocket:(BOOL)a3;
- (void)setShouldStopBTDatagramLink:(BOOL)a3;
- (void)setSocketTrafficClass:(int64_t)a3;
- (void)setSrtpProtocolVersion:(int)a3;
- (void)setStateFlags:(int)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setUint32Key:(unsigned int)a3;
@end

@implementation IDSGenericConnection

- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 isCloudEnabled:(BOOL)a5
{
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSGenericConnection;
  v9 = -[IDSGenericConnection init](&v23, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    id v12 = [v8 copy];
    v13 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v12;

    *((_DWORD *)v9 + 12) = a4;
    *(void *)(v9 + 52) = -1LL;
    *((_DWORD *)v9 + 15) = -1;
    if (qword_1009C0BE0 != -1) {
      dispatch_once(&qword_1009C0BE0, &stru_100901B20);
    }
    *((double *)v9 + 13) = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    v14 = objc_alloc_init(&OBJC_CLASS___IDSHCInfo);
    v15 = (void *)*((void *)v9 + 18);
    *((void *)v9 + 18) = v14;

    *((void *)v9 + 19) = 0LL;
    v9[180] = a5;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009C0BE8);
    v16 = (void *)qword_1009C0B58;
    v17 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v9 + 4) service]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v17]);

    if (v18)
    {
      *((void *)v9 + 604) = [v18 packetsSent];
      *((void *)v9 + 603) = [v18 packetsReceived];
      *((void *)v9 + 606) = [v18 bytesSent];
      *((void *)v9 + 605) = [v18 bytesReceived];
      v19 = (void *)qword_1009C0B58;
      v20 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v9 + 4) service]);
      [v19 removeObjectForKey:v20];

      if (![(id)qword_1009C0B58 count])
      {
        v21 = (void *)qword_1009C0B58;
        qword_1009C0B58 = 0LL;
      }
    }

    if (qword_1009C0BE0 != -1) {
      dispatch_once(&qword_1009C0BE0, &stru_100901B20);
    }
    *((double *)v9 + 607) = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009C0BE8);
    v9[4956] = 0;
  }

  return (IDSGenericConnection *)v9;
}

- (IDSGenericConnection)initWithConnectionID:(id)a3 protocol:(int)a4 keyMaterialLength:(int)a5 isCloudEnabled:(BOOL)a6
{
  id v10 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSGenericConnection;
  v11 = -[IDSGenericConnection init](&v28, "init");
  id v12 = v11;
  if (v11)
  {
    *(void *)(v11 + 52) = -1LL;
    *((_DWORD *)v11 + 15) = -1;
    v13 = malloc(a5);
    *((void *)v12 + 599) = v13;
    *((_DWORD *)v12 + 1197) = a5;
    if (!v13)
    {
      v26 = 0LL;
      goto LABEL_14;
    }

    if (SecRandomCopyBytes(kSecRandomDefault, a5, v13)) {
      sub_1006A85EC();
    }
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    v15 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v14;

    id v16 = [v10 copy];
    v17 = (void *)*((void *)v12 + 4);
    *((void *)v12 + 4) = v16;

    *((_DWORD *)v12 + 12) = a4;
    if (qword_1009C0BE0 != -1) {
      dispatch_once(&qword_1009C0BE0, &stru_100901B20);
    }
    *((double *)v12 + 13) = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    v18 = objc_alloc_init(&OBJC_CLASS___IDSHCInfo);
    v19 = (void *)*((void *)v12 + 18);
    *((void *)v12 + 18) = v18;

    *((void *)v12 + 19) = 0LL;
    *((_BYTE *)v12 + 180) = a6;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009C0BE8);
    v20 = (void *)qword_1009C0B58;
    v21 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v12 + 4) service]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v21]);

    if (v22)
    {
      *((void *)v12 + 604) = [v22 packetsSent];
      *((void *)v12 + 603) = [v22 packetsReceived];
      *((void *)v12 + 606) = [v22 bytesSent];
      *((void *)v12 + 605) = [v22 bytesReceived];
      objc_super v23 = (void *)qword_1009C0B58;
      v24 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v12 + 4) service]);
      [v23 removeObjectForKey:v24];

      if (![(id)qword_1009C0B58 count])
      {
        v25 = (void *)qword_1009C0B58;
        qword_1009C0B58 = 0LL;
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009C0BE8);
    if (qword_1009C0BE0 != -1) {
      dispatch_once(&qword_1009C0BE0, &stru_100901B20);
    }
    *((double *)v12 + 607) = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    *((_BYTE *)v12 + 4956) = 0;
  }

  v26 = (IDSGenericConnection *)v12;
LABEL_14:

  return v26;
}

- (id)description
{
  if (self->_protocol == 6)
  {
    unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v63 = v3;
    __int128 v64 = v3;
    __int128 v61 = v3;
    __int128 v62 = v3;
    __int128 v59 = v3;
    __int128 v60 = v3;
    __int128 v57 = v3;
    __int128 v58 = v3;
    __int128 v55 = v3;
    __int128 v56 = v3;
    __int128 v53 = v3;
    __int128 v54 = v3;
    __int128 v51 = v3;
    __int128 v52 = v3;
    __int128 v49 = v3;
    __int128 v50 = v3;
    __int128 v48 = v3;
    __int128 v46 = v3;
    __int128 v47 = v3;
    __int128 v44 = v3;
    __int128 v45 = v3;
    v42[2] = v3;
    __int128 v43 = v3;
    v42[0] = v3;
    v42[1] = v3;
    socklen_t v41 = 408;
    int sdCopy = self->_sdCopy;
    if (sdCopy == -1 && (int sdCopy = self->_sd, sdCopy == -1) || getsockopt(sdCopy, 6, 512, v42, &v41)) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TCP info (%u) tcpi_snd_nxt:%08x tcpi_rcv_nxt:%08x (connection: in:%08x out:%08x)",  LOBYTE(v42[0]),  DWORD1(v43),  DWORD2(v43),  self->_expectedNextIncomingSequenceNumber,  self->_expectedNextOutgoingSequenceNumber));
    }
    objc_super v23 = (void *)v5;
  }

  else
  {
    objc_super v23 = 0LL;
  }

  connectionID = self->_connectionID;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSockAddrWrapperPair shortDescription](self->_addressPair, "shortDescription"));
  __int128 v38 = *(_OWORD *)&self->_localConnectionGUID;
  int64_t compressionState = self->_compressionState;
  connectError = self->_connectError;
  uint64_t protocol = self->_protocol;
  clientID = self->_clientID;
  uint64_t sd = self->_sd;
  uint64_t v32 = self->_sdCopy;
  uint64_t sdOriginal = self->_sdOriginal;
  unsigned int v30 = -[IDSHCInfo localCID](self->_compressionInfo, "localCID");
  v29 = -[IDSHCInfo localContext](self->_compressionInfo, "localContext");
  unsigned int v28 = -[IDSHCInfo remoteCID](self->_compressionInfo, "remoteCID");
  v6 = -[IDSHCInfo remoteContext](self->_compressionInfo, "remoteContext");
  v7 = "opened ";
  int stateFlags = self->_stateFlags;
  if ((stateFlags & 1) == 0) {
    v7 = "";
  }
  v26 = v7;
  v27 = v6;
  v9 = "handler-called ";
  if ((stateFlags & 2) == 0) {
    v9 = "";
  }
  v25 = v9;
  id v10 = "control-sent ";
  if ((stateFlags & 4) == 0) {
    id v10 = "";
  }
  v24 = v10;
  if ((stateFlags & 8) != 0) {
    v11 = "control-received ";
  }
  else {
    v11 = "";
  }
  if ((stateFlags & 0x10) != 0) {
    id v12 = "reset-sent ";
  }
  else {
    id v12 = "";
  }
  if ((stateFlags & 0x20) != 0) {
    v13 = "reset-received ";
  }
  else {
    v13 = "";
  }
  if ((stateFlags & 0x40) != 0) {
    uint64_t v14 = "sent-pkt ";
  }
  else {
    uint64_t v14 = "";
  }
  if ((stateFlags & 0x80) != 0) {
    v15 = "received-pkt ";
  }
  else {
    v15 = "";
  }
  if ((stateFlags & 0x100) != 0) {
    id v16 = "received-data ";
  }
  else {
    id v16 = "";
  }
  if ((stateFlags & 0x200) != 0) {
    v17 = "canceled ";
  }
  else {
    v17 = "";
  }
  if (self->_encryptionEnabled) {
    v18 = "encryption-enabled ";
  }
  else {
    v18 = "";
  }
  double creationTime = self->_creationTime;
  id v20 = objc_retainBlock(self->_readHandler);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<IDSGenericConnection: id[%@] ports[%@] localGUID[%@] remoteGUID[%@] clientID[%@] proto[%d] sd[%d,%d,%d] error[%@] comp_state[%d] localContext[%d,%p] remoteContext[%d,%p](%s%s%s%s%s%s%s%s%s%s%s) (CT:%0.6lf) tcp[%@], readHandler: %p>",  connectionID,  v39,  v38,  clientID,  protocol,  sd,  v32,  sdOriginal,  connectError,  compressionState,  v30,  v29,  v28,  v27,  v26,  v25,  v24,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  *(void *)&creationTime,  v23,  v20));

  return v21;
}

- ($F18A97B9DD67A12B1A73262525205838)encryptionState
{
  return ($F18A97B9DD67A12B1A73262525205838 *)&self->_encryptionState;
}

- (id)flagsString
{
  int stateFlags = self->_stateFlags;
  __int128 v3 = "opened ";
  if ((stateFlags & 1) == 0) {
    __int128 v3 = "";
  }
  v4 = "handler-called ";
  if ((stateFlags & 2) == 0) {
    v4 = "";
  }
  uint64_t v5 = "control-sent ";
  if ((stateFlags & 4) == 0) {
    uint64_t v5 = "";
  }
  v6 = "control-received ";
  if ((stateFlags & 8) == 0) {
    v6 = "";
  }
  v7 = "reset-sent ";
  if ((stateFlags & 0x10) == 0) {
    v7 = "";
  }
  if ((stateFlags & 0x20) != 0) {
    id v8 = "reset-received ";
  }
  else {
    id v8 = "";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"( %s%s%s%s%s%s)",  v3,  v4,  v5,  v6,  v7,  v8);
}

- (IDSGenericConnection)initWithAddressPair:(id)a3 protocol:(int)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSGenericConnection;
  v7 = -[IDSGenericConnection init](&v15, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    v9 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v8;

    id v10 = [v6 copy];
    v11 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v10;

    *((_DWORD *)v7 + 12) = a4;
    *(void *)(v7 + 52) = -1LL;
    *((_DWORD *)v7 + 15) = -1;
    if (qword_1009C0BE0 != -1) {
      dispatch_once(&qword_1009C0BE0, &stru_100901B20);
    }
    *((double *)v7 + 13) = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    id v12 = objc_alloc_init(&OBJC_CLASS___IDSHCInfo);
    v13 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v12;

    *((void *)v7 + 19) = 0LL;
    *((_WORD *)v7 + 90) = 257;
    v7[4956] = 0;
  }

  return (IDSGenericConnection *)v7;
}

- (void)setCompletionQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  if (!v4) {
    sub_1006A8614();
  }
  completionQueue = self->_completionQueue;
  self->_completionQueue = v4;
}

- (OS_dispatch_queue)completionQueue
{
  completionQueue = self->_completionQueue;
  if (completionQueue) {
    return completionQueue;
  }
  uint64_t v5 = OSLogHandleForTransportCategory("IDSUTunController");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "problem: %@ is going to use the main queue.",  buf,  0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    uint64_t v8 = _IDSShouldLogTransport(v8);
    if ((_DWORD)v8)
    {
      _IDSLogTransport(@"IDSUTunController", @"IDS", @"problem: %@ is going to use the main queue.");
      uint64_t v8 = _IDSShouldLog(0LL, @"IDSUTunController");
      if ((_DWORD)v8) {
        uint64_t v8 = _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunController",  @"problem: %@ is going to use the main queue.");
      }
    }
  }

  uint64_t v10 = im_primary_queue(v8, v9);
  return (OS_dispatch_queue *)(id)objc_claimAutoreleasedReturnValue(v10);
}

- (void)_closeSockets
{
  if (self->_serviceConnection)
  {
    __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection connectionID](self, "connectionID"));
    v4 = v3;
    if (v3) {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceConnectorServiceForAccount]);
    }
    else {
      uint64_t v5 = 0LL;
    }
    serviceConnector = self->_serviceConnector;
    if (serviceConnector && (uint64_t v7 = self->_defaultPairedDeviceEndpoint) != 0LL && v5)
    {
      id v8 = [v5 UTF8String];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10032267C;
      v19[3] = &unk_1008F6010;
      id v20 = v4;
      nw_service_connector_cancel_active_connection(serviceConnector, v7, v8, v19);
    }

    else
    {
      uint64_t v9 = OSLogHandleForTransportCategory("IDSUTunController");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_serviceConnector;
        defaultPairedDeviceEndpoint = self->_defaultPairedDeviceEndpoint;
        *(_DWORD *)buf = 138413058;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v11;
        __int16 v25 = 2112;
        v26 = defaultPairedDeviceEndpoint;
        __int16 v27 = 2112;
        unsigned int v28 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ cannot cancel service connector for connection._serviceConnector=%@;_defaultPairedDeviceEndpoint=%@;service"
          "ConnectionServiceString=%@",
          buf,
          0x2Au);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          _IDSLogTransport( @"IDSUTunController",  @"IDS",  @"%@ cannot cancel service connector for connection._serviceConnector=%@;_defaultPairedDeviceEndpoint=%@;serviceConnectionServiceString=%@");
          if (_IDSShouldLog(0LL, @"IDSUTunController")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunController",  @"%@ cannot cancel service connector for connection._serviceConnector=%@;_defaultPairedDeviceEndpoint=%@;serviceConnectionServiceString=%@");
          }
        }
      }
    }

    nw_connection_cancel(self->_serviceConnection);
    serviceConnection = self->_serviceConnection;
    self->_serviceConnection = 0LL;
  }

  int sd = self->_sd;
  if (sd != -1)
  {
    close(sd);
    self->_int sd = -1;
  }

  int sdCopy = self->_sdCopy;
  if (sdCopy != -1)
  {
    close(sdCopy);
    self->_int sdCopy = -1;
  }

  int sdOriginal = self->_sdOriginal;
  if (sdOriginal != -1)
  {
    close(sdOriginal);
    self->_int sdOriginal = -1;
  }

- (void)dealloc
{
  if (!-[IDSGenericConnection didInvalidate](self, "didInvalidate"))
  {
    __int128 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1006A8628(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSGenericConnection;
  -[IDSGenericConnection dealloc](&v11, "dealloc");
}

- (void)invalidate
{
  if (!-[IDSGenericConnection didInvalidate](self, "didInvalidate"))
  {
    -[IDSGenericConnection setDidInvalidate:](self, "setDidInvalidate:", 1LL);
    uint64_t v3 = OSLogHandleForTransportCategory("IDSUTunController");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidating IDSGenericConnection %@",  buf,  0xCu);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6)
    {
      if (_IDSShouldLogTransport(v6))
      {
        unsigned int v28 = self;
        _IDSLogTransport(@"IDSUTunController", @"IDS", @"Invalidating IDSGenericConnection %@");
        if (_IDSShouldLog(0LL, @"IDSUTunController"))
        {
          unsigned int v28 = self;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunController",  @"Invalidating IDSGenericConnection %@");
        }
      }
    }

    if (self->_shouldStopBTDatagramLink)
    {
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (IDSGenericConnection *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnectionID service](self->_connectionID, "service"));
        *(_DWORD *)buf = 138412290;
        v33 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "genericConnection for %@ using BT datagram link - stop",  buf,  0xCu);
      }

      IDSTransportThreadAddBlock(&stru_1009014F0, v9);
    }

    if (self->_connectionID)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1009C0BE8);
      uint64_t v10 = (void *)qword_1009C0B58;
      if (!qword_1009C0B58)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        id v12 = (void *)qword_1009C0B58;
        qword_1009C0B58 = (uint64_t)Mutable;

        uint64_t v10 = (void *)qword_1009C0B58;
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnectionID service](self->_connectionID, "service", v28));
      uint64_t v14 = (IDSServiceStatistics *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v13]);

      if (!v14)
      {
        uint64_t v14 = objc_alloc_init(&OBJC_CLASS___IDSServiceStatistics);
        objc_super v15 = (void *)qword_1009C0B58;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnectionID service](self->_connectionID, "service"));
        [v15 setObject:v14 forKey:v16];
      }

      -[IDSServiceStatistics setPacketsSent:]( v14,  "setPacketsSent:",  (char *)-[IDSServiceStatistics packetsSent](v14, "packetsSent") + self->_packetsSent);
      -[IDSServiceStatistics setPacketsReceived:]( v14,  "setPacketsReceived:",  (char *)-[IDSServiceStatistics packetsReceived](v14, "packetsReceived") + self->_packetsReceived);
      -[IDSServiceStatistics setBytesSent:]( v14,  "setBytesSent:",  (char *)-[IDSServiceStatistics bytesSent](v14, "bytesSent") + self->_bytesSent);
      -[IDSServiceStatistics setBytesReceived:]( v14,  "setBytesReceived:",  (char *)-[IDSServiceStatistics bytesReceived](v14, "bytesReceived") + self->_bytesReceived);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009C0BE8);
    }

    rsize_t keyMaterialLength = self->_keyMaterialLength;
    if ((_DWORD)keyMaterialLength)
    {
      memset_s(self->_localKeyMaterial, keyMaterialLength, 0, self->_keyMaterialLength);
      free(self->_localKeyMaterial);
      sub_1001FD114((uint64_t)&self->_encryptionState);
      self->_localKeyMaterial = 0LL;
      self->_rsize_t keyMaterialLength = 0;
    }

    if (self->_openSocketCompletionHandler)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection description](self, "description"));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cleanup: %@",  v18));

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v19,  NSLocalizedDescriptionKey));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSUTun",  5101LL,  v20));

      id v22 = objc_retainBlock(self->_openSocketCompletionHandler);
      id openSocketCompletionHandler = self->_openSocketCompletionHandler;
      self->_id openSocketCompletionHandler = 0LL;

      v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSGenericConnection completionQueue](self, "completionQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100322CF8;
      block[3] = &unk_1008F6358;
      id v30 = v21;
      id v31 = v22;
      id v25 = v21;
      id v26 = v22;
      dispatch_async(v24, block);
    }

    -[IDSGenericConnection _closeSockets](self, "_closeSockets", v28);
    -[IDSHCInfo invalidate](self->_compressionInfo, "invalidate");
    completionQueue = self->_completionQueue;
    self->_completionQueue = 0LL;
  }

- (void)reportToAWD:(unint64_t)a3 connectionType:(int)a4 error:(int)a5
{
  if (!self->_sentAWDReport)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    if ((_DWORD)v5)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
      [v9 IDSGenericConnectionForLink:a3 connectionSetupStartTime:&off_1009479F8 firstPacketReceiveTime:&off_1009479F8 connectionType:v10 success:0 errorCode:v11];
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_connectionSetupStartTime));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_firstPacketReceiveTime));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
      [v9 IDSGenericConnectionForLink:a3 connectionSetupStartTime:v10 firstPacketReceiveTime:v11 connectionType:v12 success:1 errorCode:&off_1009479F8];
    }

    self->_sentAWDReport = 1;
  }

- (void)_triggerStallDetectionLogsForDetector:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1009C0BE0 != -1) {
    dispatch_once(&qword_1009C0BE0, &stru_100901B20);
  }
  uint64_t v8 = mach_continuous_time();
  double v9 = *(double *)&qword_1009C0B68;
  id v10 = v6;
  id v11 = [v10 UTF8String];
  if (IMGetDomainBoolForKey(@"com.apple.ids", @"collectAllUTunSocketStall"))
  {
    IDSNetworkingLogDump(v11, 10LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p %@ Stall detected [%@].",  self,  v10,  v7));
    uint64_t v13 = OSLogHandleForTransportCategory("IDSGenericConnection");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        __int16 v27 = v12;
        _IDSLogTransport(@"IDSGenericConnection", @"IDS", @"%@");
        if (_IDSShouldLog(0LL, @"IDSGenericConnection"))
        {
          __int16 v27 = v12;
          _IDSLogV(0LL, @"IDSFoundation", @"IDSGenericConnection", @"%@");
        }
      }
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDS detected the single UTun socket stall. Please file a bug Transport|all, and attach a sysdiagnose and the contents of /Library/Logs/CrashReporter from both devices.",  v27));
    IDSInternalAlertSimple(@"2020-01-01", @"UTun Socket Stall", @"UTun Socket stall", v17);

    goto LABEL_27;
  }

  double v18 = v9 * (double)v8;
  double v19 = *(double *)&qword_1009C0B60;
  if (arc4random() <= 0x33333333)
  {
    double v19 = *(double *)&qword_1009C0B60;
LABEL_15:
    id v20 = @"%p %@ Stall detected [%@] - netdiagnose & simulate crash";
    uint64_t v21 = 10LL;
    if (v19 != 0.0 && v18 - v19 <= 172800.0)
    {
      id v12 = 0LL;
      goto LABEL_27;
    }

    goto LABEL_18;
  }

  id v20 = @"%p %@ Stall detected [%@] - only netdiagnose";
  uint64_t v21 = 8LL;
LABEL_18:
  qword_1009C0B60 = *(void *)&v18;
  IDSNetworkingLogDump(v11, v21);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, self, v10, v7));
  if (v12)
  {
    double lastStallDetectLogTime = self->_lastStallDetectLogTime;
    if (lastStallDetectLogTime == 0.0 || v18 - lastStallDetectLogTime > 4.0)
    {
      self->_double lastStallDetectLogTime = v18;
      uint64_t v23 = OSLogHandleForTransportCategory("IDSGenericConnection");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
      if ((_DWORD)v26)
      {
        if (_IDSShouldLogTransport(v26))
        {
          _IDSLogTransport(@"IDSGenericConnection", @"IDS", @"%@");
        }
      }
    }
  }

- (void)_createStallDetectorWithName:(id)a3
{
  id v4 = a3;
  outgoingStallDetector = self->_outgoingStallDetector;
  if (outgoingStallDetector)
  {
    -[IDSStallDetector reset](outgoingStallDetector, "reset");
    self->_double lastStallDetectLogTime = 0.0;
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100323474;
    v17[3] = &unk_100901518;
    v17[4] = self;
    id v6 = v4;
    id v18 = v6;
    id v7 = objc_retainBlock(v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100323518;
    v15[3] = &unk_100901518;
    v15[4] = self;
    id v8 = v6;
    id v16 = v8;
    double v9 = objc_retainBlock(v15);
    id v10 = +[IDSStallDetector newDetectorWithName:stallDetectedBlock:stallWarningBlock:]( &OBJC_CLASS___IDSStallDetector,  "newDetectorWithName:stallDetectedBlock:stallWarningBlock:",  v8,  v7,  v9);
    [v10 setByteMovementDelayThreshold:30.0];
    [v10 setVerboseLogging:1];
    objc_storeStrong((id *)&self->_outgoingStallDetector, v10);
    uint64_t v11 = OSLogHandleForTransportCategory("IDSGenericConnection");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%p Created the stall detector %@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        _IDSLogTransport(@"IDSGenericConnection", @"IDS", @"%p Created the stall detector %@");
        if (_IDSShouldLog(0LL, @"IDSGenericConnection")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSGenericConnection",  @"%p Created the stall detector %@");
        }
      }
    }
  }
}

- (NSString)localConnectionGUID
{
  return self->_localConnectionGUID;
}

- (NSString)remoteConnectionGUID
{
  return self->_remoteConnectionGUID;
}

- (void)setRemoteConnectionGUID:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (IDSGenericConnectionID)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
}

- (IDSSockAddrWrapperPair)addressPair
{
  return self->_addressPair;
}

- (void)setAddressPair:(id)a3
{
}

- (int)protocol
{
  return self->_protocol;
}

- (int)sd
{
  return self->_sd;
}

- (void)setSd:(int)a3
{
  self->_int sd = a3;
}

- (int)sdCopy
{
  return self->_sdCopy;
}

- (void)setSdCopy:(int)a3
{
  self->_int sdCopy = a3;
}

- (int)sdOriginal
{
  return self->_sdOriginal;
}

- (void)setSdOriginal:(int)a3
{
  self->_int sdOriginal = a3;
}

- (int)sdNumberNoClose
{
  return self->_sdNumberNoClose;
}

- (void)setSdNumberNoClose:(int)a3
{
  self->_sdNumberNoClose = a3;
}

- (NSError)connectError
{
  return self->_connectError;
}

- (void)setConnectError:(id)a3
{
}

- (id)openSocketCompletionHandler
{
  return self->_openSocketCompletionHandler;
}

- (void)setOpenSocketCompletionHandler:(id)a3
{
}

- (unsigned)firstIncomingSYNSequenceNumber
{
  return self->_firstIncomingSYNSequenceNumber;
}

- (void)setFirstIncomingSYNSequenceNumber:(unsigned int)a3
{
  self->_firstIncomingSYNSequenceNumber = a3;
}

- (unsigned)expectedNextOutgoingSequenceNumber
{
  return self->_expectedNextOutgoingSequenceNumber;
}

- (void)setExpectedNextOutgoingSequenceNumber:(unsigned int)a3
{
  self->_expectedNextOutgoingSequenceNumber = a3;
}

- (unsigned)expectedNextIncomingSequenceNumber
{
  return self->_expectedNextIncomingSequenceNumber;
}

- (void)setExpectedNextIncomingSequenceNumber:(unsigned int)a3
{
  self->_expectedNextIncomingSequenceNumber = a3;
}

- (int)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(int)a3
{
  self->_int stateFlags = a3;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)socketTrafficClass
{
  return self->_socketTrafficClass;
}

- (void)setSocketTrafficClass:(int64_t)a3
{
  self->_socketTrafficClass = a3;
}

- (BOOL)hasMoreData
{
  return self->_hasMoreData;
}

- (void)setHasMoreData:(BOOL)a3
{
  self->_hasMoreData = a3;
}

- (double)lastSuccessfulSentTime
{
  return self->_lastSuccessfulSentTime;
}

- (void)setLastSuccessfulSentTime:(double)a3
{
  self->_lastSuccessfulSentTime = a3;
}

- (IDSHCInfo)compressionInfo
{
  return self->_compressionInfo;
}

- (void)setCompressionInfo:(id)a3
{
}

- (int64_t)compressionState
{
  return self->_compressionState;
}

- (void)setCompressionState:(int64_t)a3
{
  self->_int64_t compressionState = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (unsigned)uint32Key
{
  return self->_uint32Key;
}

- (void)setUint32Key:(unsigned int)a3
{
  self->_uint32Key = a3;
}

- (BOOL)isCloudEnabled
{
  return self->_isCloudEnabled;
}

- (void)setIsCloudEnabled:(BOOL)a3
{
  self->_isCloudEnabled = a3;
}

- (BOOL)isControlChannel
{
  return self->_isControlChannel;
}

- (void)setIsControlChannel:(BOOL)a3
{
  self->_isControlChannel = a3;
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isDefaultPairedDevice;
}

- (void)setIsDefaultPairedDevice:(BOOL)a3
{
  self->_isDefaultPairedDevice = a3;
}

- (BOOL)isRealTime
{
  return self->_isRealTime;
}

- (void)setIsRealTime:(BOOL)a3
{
  self->_isRealTime = a3;
}

- (BOOL)shouldStopBTDatagramLink
{
  return self->_shouldStopBTDatagramLink;
}

- (void)setShouldStopBTDatagramLink:(BOOL)a3
{
  self->_shouldStopBTDatagramLink = a3;
}

- (BOOL)encryptionEnabled
{
  return self->_encryptionEnabled;
}

- (void)setEncryptionEnabled:(BOOL)a3
{
  self->_encryptionEnabled = a3;
}

- (int)keyMaterialLength
{
  return self->_keyMaterialLength;
}

- (void)setKeyMaterialLength:(int)a3
{
  self->_rsize_t keyMaterialLength = a3;
}

- (char)localKeyMaterial
{
  return self->_localKeyMaterial;
}

- (void)setLocalKeyMaterial:(char *)a3
{
  self->_localKeyMaterial = a3;
}

- (unsigned)SSRCSend
{
  return self->_SSRCSend;
}

- (void)setSSRCSend:(unsigned int)a3
{
  self->_SSRCSend = a3;
}

- (unsigned)SSRCRecv
{
  return self->_SSRCRecv;
}

- (void)setSSRCRecv:(unsigned int)a3
{
  self->_SSRCRecv = a3;
}

- (unsigned)seqSendStart
{
  return self->_seqSendStart;
}

- (void)setSeqSendStart:(unsigned __int16)a3
{
  self->_seqSendStart = a3;
}

- (unsigned)seqRecvStart
{
  return self->_seqRecvStart;
}

- (void)setSeqRecvStart:(unsigned __int16)a3
{
  self->_seqRecvStart = a3;
}

- (unsigned)seqSend
{
  return self->_seqSend;
}

- (void)setSeqSend:(unsigned __int16)a3
{
  self->_seqSend = a3;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  self->_packetsReceived = a3;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (void)setPacketsSent:(unint64_t)a3
{
  self->_packetsSent = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(unint64_t)a3
{
  self->_bytesReceived = a3;
}

- (int)srtpProtocolVersion
{
  return self->_srtpProtocolVersion;
}

- (void)setSrtpProtocolVersion:(int)a3
{
  self->_srtpProtocolVersion = a3;
}

- (BOOL)checksumFailed
{
  return self->_checksumFailed;
}

- (void)setChecksumFailed:(BOOL)a3
{
  self->_checksumFailed = a3;
}

- (double)connectionInitTime
{
  return self->_connectionInitTime;
}

- (void)setConnectionInitTime:(double)a3
{
  self->_connectionInitTime = a3;
}

- (double)firstDataPacketReceiveTime
{
  return self->_firstDataPacketReceiveTime;
}

- (void)setFirstDataPacketReceiveTime:(double)a3
{
  self->_firstDataPacketReceiveTime = a3;
}

- (NSString)idsDeviceConnectionUUID
{
  return self->_idsDeviceConnectionUUID;
}

- (void)setIdsDeviceConnectionUUID:(id)a3
{
}

- (double)connectionSetupStartTime
{
  return self->_connectionSetupStartTime;
}

- (void)setConnectionSetupStartTime:(double)a3
{
  self->_connectionSetupStartTime = a3;
}

- (double)firstPacketReceiveTime
{
  return self->_firstPacketReceiveTime;
}

- (void)setFirstPacketReceiveTime:(double)a3
{
  self->_firstPacketReceiveTime = a3;
}

- (IDSConnectionContext)connectionContext
{
  return self->_connectionContext;
}

- (void)setConnectionContext:(id)a3
{
}

- (id)readHandler
{
  return self->_readHandler;
}

- (void)setReadHandler:(id)a3
{
}

- (BOOL)shouldSetAllowlistUUIDForStreamingSocket
{
  return self->_shouldSetAllowlistUUIDForStreamingSocket;
}

- (void)setShouldSetAllowlistUUIDForStreamingSocket:(BOOL)a3
{
  self->_shouldSetAllowlistUUIDForStreamingSocket = a3;
}

- (OS_nw_connection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (OS_nw_service_connector)serviceConnector
{
  return self->_serviceConnector;
}

- (void)setServiceConnector:(id)a3
{
}

- (OS_nw_endpoint)defaultPairedDeviceEndpoint
{
  return self->_defaultPairedDeviceEndpoint;
}

- (void)setDefaultPairedDeviceEndpoint:(id)a3
{
}

- (NSString)outgoingStallDetectorName
{
  return self->_outgoingStallDetectorName;
}

- (void)setOutgoingStallDetectorName:(id)a3
{
}

- (IDSStallDetector)outgoingStallDetector
{
  return self->_outgoingStallDetector;
}

- (void)setOutgoingStallDetector:(id)a3
{
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (BOOL)isDirectMsgChannel
{
  return self->_isDirectMsgChannel;
}

- (void)setIsDirectMsgChannel:(BOOL)a3
{
  self->_isDirectMsgChannel = a3;
}

- (BOOL)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(BOOL)a3
{
  self->_didInvalidate = a3;
}

- (void).cxx_destruct
{
}

@end