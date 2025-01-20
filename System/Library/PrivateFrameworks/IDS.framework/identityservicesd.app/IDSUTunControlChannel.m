@interface IDSUTunControlChannel
- (BOOL)avoidMainQueueOverrideToNO;
- (BOOL)checksumEnabled;
- (BOOL)connected;
- (BOOL)connecting;
- (BOOL)didReceiveReestablishmentRequest;
- (BOOL)disableEncryption;
- (BOOL)isDefaultPairedDevicePairedLocally;
- (BOOL)isDefaultPairedDevicePairedRemotely;
- (BOOL)isDefaultPairedDeviceStartingToEncrypt;
- (BOOL)isReadyForEncrypting;
- (BOOL)processFairplayDeviceInfo:(id)a3;
- (BOOL)processFairplayDeviceSessionInfo:(id)a3;
- (BOOL)processFairplayHostSessionInfo:(id)a3;
- (BOOL)processOTRNegotiationMessage:(id)a3;
- (BOOL)processSuspendOTRNegotiationMessage:(id)a3;
- (IDSStallDetector)outgoingStallDetector;
- (IDSUTunControlChannel)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 receiveHandler:(id)a5;
- (IDSUTunControlChannelIdentityPair)identityPair;
- (NSDictionary)remoteDeviceEncryptionInfo;
- (NSString)deviceUniqueID;
- (double)reestablishmentRequestReceiveTime;
- (id)_utunControlMessageFairplayDeviceInfo;
- (id)_utunControlMessageFairplayDeviceSessionInfo:(char *)a3 grappaDeviceSessionInfoSize:(unsigned int)a4;
- (id)_utunControlMessageFairplayHostSessionInfo:(unsigned __int8)a3 deviceType:(unsigned __int8)a4 protocolVersion:(unsigned int)a5;
- (id)description;
- (void)_callHandlerWithMessage:(id)a3 resetDataConnections:(BOOL)a4 shouldObliterate:(BOOL)a5 decryptionFailed:(BOOL)a6 shouldTriggerCorruptionRecovery:(BOOL)a7;
- (void)_cancelConnectionAndResetDataConnections:(BOOL)a3 shouldObliterate:(BOOL)a4 encryptionFailure:(BOOL)a5 shouldTriggerCorruptionRecovery:(BOOL)a6;
- (void)_checkSendNewMessage;
- (void)_cleanupConnection;
- (void)_clearChannel;
- (void)_destroyFairplayHostSession;
- (void)_handleFairplayAuthenticationFailure;
- (void)cancelConnection;
- (void)dealloc;
- (void)encryptControlChannelForStoredIdentities;
- (void)invalidate;
- (void)readFromConnection;
- (void)resumeOTRNegotiation;
- (void)sendMessage:(id)a3;
- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5;
- (void)sendPriorityMessage:(id)a3;
- (void)sendSuspendOTRNegotiationMessage:(id)a3;
- (void)setAvoidMainQueueOverrideToNO:(BOOL)a3;
- (void)setChecksumEnabled:(BOOL)a3;
- (void)setConnecting:(BOOL)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setDidReceiveReestablishmentRequest:(BOOL)a3;
- (void)setDisableEncryption:(BOOL)a3;
- (void)setIdentityPair:(id)a3;
- (void)setIsDefaultPairedDevicePairedLocally:(BOOL)a3;
- (void)setIsDefaultPairedDevicePairedRemotely:(BOOL)a3;
- (void)setIsReadyForEncrypting:(BOOL)a3;
- (void)setOutgoingStallDetector:(id)a3;
- (void)setReestablishmentRequestReceiveTime:(double)a3;
- (void)setRemoteDeviceEncryptionInfo:(id)a3;
- (void)simulateDecryptionFailure;
- (void)suspendOTRNegotiation:(id)a3;
- (void)useConnection:(id)a3 withFirstMessage:(id)a4;
- (void)writeToConnection;
@end

@implementation IDSUTunControlChannel

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p <Control channel: uniqueID[%@] pendingReceive[%d] pendingSend[%d] outgoingMessages[%d] outgoingPriorityMessages[%d] encrypting[%u (pl:%u pr:%u)>",  self,  self->_deviceUniqueID,  -[NSMutableData length](self->_pendingDataReceive, "length"),  -[NSMutableData length](self->_pendingDataSend, "length"),  -[NSMutableArray count](self->_outgoingMessages, "count"),  -[NSMutableArray count](self->_outgoingPriorityMessages, "count"),  self->_isReadyForEncrypting,  self->_isDefaultPairedDevicePairedLocally,  self->_isDefaultPairedDevicePairedRemotely);
}

- (IDSUTunControlChannel)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 receiveHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___IDSUTunControlChannel;
  v11 = -[IDSUTunControlChannel init](&v33, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    deviceUniqueID = v11->_deviceUniqueID;
    v11->_deviceUniqueID = v12;

    v14 = (NSString *)[v9 copy];
    cbuuid = v11->_cbuuid;
    v11->_cbuuid = v14;

    id v16 = [v10 copy];
    id receiveHandler = v11->_receiveHandler;
    v11->_id receiveHandler = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    pendingDataReceive = v11->_pendingDataReceive;
    v11->_pendingDataReceive = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    pendingDataSend = v11->_pendingDataSend;
    v11->_pendingDataSend = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    outgoingMessages = v11->_outgoingMessages;
    v11->_outgoingMessages = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    outgoingPriorityMessages = v11->_outgoingPriorityMessages;
    v11->_outgoingPriorityMessages = v24;

    v11->_sd = -1;
    v11->_fairplayAuthState = 0;
    v11->_receiveHandlerBeingCalled = 0;
    id v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"control channel %@", v11->_deviceUniqueID));
    v27 = (const char *)[v26 UTF8String];
    dispatch_queue_attr_t v28 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v29 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v28);
    dispatch_queue_t v30 = dispatch_queue_create(v27, v29);
    connectionQueue = v11->_connectionQueue;
    v11->_connectionQueue = (OS_dispatch_queue *)v30;
  }

  return v11;
}

- (void)_cleanupConnection
{
  uint64_t sd = self->_sd;
  if ((_DWORD)sd != -1)
  {
    IDSTransportThreadRemoveSocket(sd);
    shutdown(self->_sd, 2);
    self->_uint64_t sd = -1;
  }

  v4 = self->_connection;
  if (v4)
  {
    self->_nw_connection_t connection = 0LL;
    nw_connection_t connection = v4;

    nw_connection_cancel(connection);
  }

- (void)simulateDecryptionFailure
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "control channel simulating decryption failure ############### - close socket / call receive handler",  v4,  2u);
  }

  -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  1LL,  0LL,  1LL,  0LL);
}

- (void)encryptControlChannelForStoredIdentities
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));

  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localFullIdentity]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remotePublicIdentity]);
      int v14 = 138478083;
      v15 = v7;
      __int16 v16 = 2113;
      v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel asked to encrypt {local: %{private}@, remote: %{private}@}",  (uint8_t *)&v14,  0x16u);
    }

    self->_isReadyForEncrypting = 1;
    if (self->_connection) {
      -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  0LL,  0LL,  0LL,  0LL);
    }
  }

  else
  {
    if (v5)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localFullIdentity]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 remotePublicIdentity]);
      int v14 = 134218240;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel asked to encrypt without keys (local %p remote %p)",  (uint8_t *)&v14,  0x16u);
    }
  }

- (BOOL)isDefaultPairedDeviceStartingToEncrypt
{
  if (!self->_isDefaultPairedDevice || self->_isReadyForEncrypting) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
  BOOL v2 = v3 != 0LL;

  return v2;
}

- (void)readFromConnection
{
  if (self->_newSocket)
  {
    self->_newSocket = 0;
    *(_DWORD *)__errnum = -1431655766;
    v103[0] = 4;
    int v3 = getsockopt(self->_sd, 0xFFFF, 4103, __errnum, v103);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      deviceUniqueID = self->_deviceUniqueID;
      int sd = self->_sd;
      int v7 = *(_DWORD *)__errnum;
      id v8 = strerror(*(int *)__errnum);
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = deviceUniqueID;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = sd;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v3;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v7;
      *(_WORD *)&buf[30] = 2080;
      *(void *)&buf[32] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for [%@] connected for {socket:%d} read (getsockopt=%d error=%d: %s)",  buf,  0x28u);
    }

    if (!v3)
    {
      if (*(_DWORD *)__errnum)
      {
        -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  0LL,  0LL,  0LL,  0LL);
        return;
      }
    }
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = self->_sd;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "control channel receiving control message on {socket:%d} ...",  buf,  8u);
  }

  memset(buf, 170, 0x800uLL);
  ssize_t v11 = recv(self->_sd, buf, 0x800uLL, 0);
  if (v11 < 0)
  {
    unsigned int v13 = *__error();
    if (v13 > 0x37 || ((1LL << v13) & 0x80000800000010LL) == 0)
    {
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_deviceUniqueID;
        int v16 = self->_sd;
        v17 = strerror(v13);
        *(_DWORD *)__errnum = 138413058;
        *(void *)&__errnum[4] = v15;
        *(_WORD *)&__errnum[12] = 1024;
        *(_DWORD *)&__errnum[14] = v16;
        *(_WORD *)&__errnum[18] = 1024;
        *(_DWORD *)&__errnum[20] = v13;
        *(_WORD *)v109 = 2080;
        *(void *)&v109[2] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for [%@] disconnected on {socket:%d} recv: errno=%d: %s",  __errnum,  0x22u);
      }

      -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  -[IDSUTunControlChannel isDefaultPairedDeviceStartingToEncrypt]( self,  "isDefaultPairedDeviceStartingToEncrypt") ^ 1,  0LL,  0LL,  0LL);
    }
  }

  else
  {
    if (v11)
    {
      -[NSMutableData appendBytes:length:](self->_pendingDataReceive, "appendBytes:length:", buf, v11);
      ++self->_dataReceivedWithoutMessageCount;
      if (-[NSMutableData length](self->_pendingDataReceive, "length") < 2)
      {
LABEL_12:
        if (!self->_checksumEnabled && self->_dataReceivedWithoutMessageCount >= 2)
        {
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__errnum = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "control channel corruption detection heuristic hit - resetting",  __errnum,  2u);
          }

          -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  0LL,  0LL,  0LL,  1LL);
        }

        return;
      }

      uint64_t v93 = IDSUTunControlChannelRemoteDeviceEncryptionInfo_UNENCRYPTED_Key;
      uint64_t v92 = IDSUTunControlChannelRemoteDeviceEncryptionInfoRemoteTokenURIKey;
      uint64_t v91 = IDSUTunControlChannelRemoteDeviceEncryptionInfoServiceKey;
      uint64_t v89 = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyIdentityKey;
      uint64_t v90 = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyURIKey;
      while (1)
      {
        v22 = (unsigned __int16 *)-[NSMutableData bytes](self->_pendingDataReceive, "bytes");
        v23 = (char *)__rev16(*v22);
        self->_dataReceivedWithoutMessageCount = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v22 + 1, v23));
        -[NSMutableData replaceBytesInRange:withBytes:length:]( self->_pendingDataReceive,  "replaceBytesInRange:withBytes:length:",  0LL,  v23 + 2,  0LL,  0LL);
        v25 = "disabled";
        if (self->_disableEncryption)
        {
LABEL_29:
          id v26 = v24;
          goto LABEL_30;
        }

        if (self->_isReadyForEncrypting) {
          break;
        }
        v25 = "default paired none";
        if (self->_isDefaultPairedDevice) {
          goto LABEL_29;
        }
        remoteDeviceEncryptionInfo = self->_remoteDeviceEncryptionInfo;
        if (remoteDeviceEncryptionInfo)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  v93));
          unsigned __int8 v48 = [v47 BOOLValue];

          v25 = "remote UNENCRYPTED";
          if ((v48 & 1) != 0) {
            goto LABEL_29;
          }
          id v49 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  v92));
          v87 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  v91));
          v88 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  v90));
          v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  v89));
          id v107 = 0LL;
          v51 = (void *)objc_claimAutoreleasedReturnValue([v49 _stripPotentialTokenURIWithToken:&v107]);
          id v52 = v107;
          dispatch_semaphore_t v53 = dispatch_semaphore_create(0LL);
          *(void *)v103 = 0LL;
          v104 = v103;
          uint64_t v105 = 0x2020000000LL;
          uint64_t v106 = 0LL;
          v102[0] = 0LL;
          v102[1] = v102;
          v102[2] = 0x2020000000LL;
          v102[3] = 1LL;
          *(void *)__errnum = 0LL;
          *(void *)&__errnum[8] = __errnum;
          *(void *)&__errnum[16] = 0x3032000000LL;
          *(void *)v109 = sub_10012A4F0;
          *(void *)&v109[8] = sub_10012A500;
          *(void *)&v109[16] = 0LL;
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v51));
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v88));
          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472LL;
          v97[2] = sub_10012A508;
          v97[3] = &unk_1008FB158;
          v99 = v103;
          v100 = v102;
          v101 = __errnum;
          v57 = v53;
          v98 = v57;
          LOBYTE(v86) = !self->_avoidMainQueueOverrideToNO;
          LOBYTE(v85) = 0;
          [v54 legacyPublicKeyDecryptData:v24 fromURI:v55 identity:v50 toURI:v56 pushToken:v52 service:v87 priority:300 isRetry:v85 replayKey:0 completionBlo ck:v97 avoidMainQueue:v86];

          dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v58 = *((void *)v104 + 3);
          id v26 = (NSData *)*(id *)(*(void *)&__errnum[8] + 40LL);

          _Block_object_dispose(__errnum, 8);
          _Block_object_dispose(v102, 8);
          _Block_object_dispose(v103, 8);

          v25 = "remote PK";
        }

        else
        {
          if (!self->_deviceUniqueID)
          {
            if (self->_receiveHandlerBeingCalled)
            {
              v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "receiveHandler is being called, so ignore this one",  __errnum,  2u);
              }
            }

            else
            {
              self->_receiveHandlerBeingCalled = 1;
              v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Dispatch receiveHandler",  __errnum,  2u);
              }

              uint64_t v82 = im_primary_queue(v80, v81);
              v83 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v82);
              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472LL;
              v95[2] = sub_10012A5A4;
              v95[3] = &unk_1008F6010;
              v95[4] = self;
              dispatch_async(v83, v95);
            }

            return;
          }

          v73 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
          v74 = self->_deviceUniqueID;
          id v96 = 0LL;
          id v26 = (NSData *)objc_claimAutoreleasedReturnValue( [v73 legacyPublicKeyDecryptData:v24 toDeviceID:v74 priority:300 error:&v96]);
          id v49 = v96;

          uint64_t v58 = sub_1002B1E4C(v49);
          v25 = "cloud paired PK";
        }

        if (v58) {
          goto LABEL_66;
        }
LABEL_30:
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", v84));
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [v24 length];
          NSUInteger v29 = -[NSMutableData length](self->_pendingDataReceive, "length");
          *(_DWORD *)__errnum = 136316162;
          *(void *)&__errnum[4] = v25;
          *(_WORD *)&__errnum[12] = 2112;
          *(void *)&__errnum[14] = v24;
          *(_WORD *)&__errnum[22] = 2048;
          *(void *)v109 = v28;
          *(_WORD *)&v109[8] = 2112;
          *(void *)&v109[10] = v26;
          *(_WORD *)&v109[18] = 2048;
          *(void *)&v109[20] = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "control channel decrypted (%s) new message (%@, size=%lu  data: %@) (from %lu)",  __errnum,  0x34u);
        }

        -[IDSUTunControlChannel _callHandlerWithMessage:resetDataConnections:shouldObliterate:decryptionFailed:shouldTriggerCorruptionRecovery:]( self,  "_callHandlerWithMessage:resetDataConnections:shouldObliterate:decryptionFailed:shouldTriggerCorruptionRecovery:",  v26,  0LL,  0LL,  0LL,  0LL);
LABEL_33:

        if (-[NSMutableData length](self->_pendingDataReceive, "length") <= 1) {
          goto LABEL_12;
        }
      }

      id v30 = (id)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
      id v31 = v24;
      if (![v31 length])
      {
        v42 = objc_alloc_init(&OBJC_CLASS___NSData);
        BOOL v44 = 1;
        goto LABEL_64;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSMessageHashStore sharedInstance](&OBJC_CLASS___IDSMessageHashStore, "sharedInstance"));
      id v33 = v31;
      if (qword_1009BEB38 != -1) {
        dispatch_once(&qword_1009BEB38, &stru_1008FB230);
      }
      if (off_1009BEB30)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
        id v35 = [v34 latestCopyMessageProtectionIdentityForDataProtectionClass:2];

        *(void *)__errnum = 0LL;
        v36 = (void *)off_1009BEB30(v33, v35, __errnum);
        if (v35) {
          CFRelease(v35);
        }

        if (v36 && ![v32 containsMessageHash:v36])
        {
          [v32 addMessageHash:v36];
          IMTimingStartTimingForKey( @"Decryption",  0LL,  @"UTunControlChannel",  @"IDSAgent",  @"Started decryption");
          uint64_t v37 = OSLogHandleForIDSCategory("Encryption");
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__errnum = 138477827;
            *(void *)&__errnum[4] = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "   UTUNControlChannel Decrypting {identityPair: %{private}@}",  __errnum,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v39)
            && _IDSShouldLog(0LL, @"Encryption"))
          {
            id v84 = v30;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   UTUNControlChannel Decrypting {identityPair: %{private}@}");
          }

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localFullIdentity", v84));
          v41 = (void *)objc_claimAutoreleasedReturnValue([v30 remotePublicIdentity]);
          *(void *)v103 = 0LL;
          v42 = (NSData *)objc_claimAutoreleasedReturnValue([v40 verifyAndExposeData:v33 withSigner:v41 error:v103]);
          id v43 = *(id *)v103;

          BOOL v44 = v42 != 0LL;
          if (v42)
          {
            v45 = v42;
          }

          else
          {
            uint64_t v75 = OSLogHandleForIDSCategory("Encryption");
            v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__errnum = 138412290;
              *(void *)&__errnum[4] = v43;
              _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "   Public/Private decryption failed with error: %@",  __errnum,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v77)
              && _IDSShouldLog(0LL, @"Encryption"))
            {
              id v84 = v43;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   Public/Private decryption failed with error: %@");
            }
          }

          IMTimingStopTimingForKey( @"Decryption",  0LL,  @"UTunControlChannel",  @"IDSAgent",  @"Done decryption");

LABEL_63:
LABEL_64:

          id v26 = v42;
          v25 = "default paired PK";
          if (!v44)
          {
            uint64_t v58 = 200LL;
LABEL_66:
            v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog utunController]( &OBJC_CLASS___IDSFoundationLog,  "utunController",  v84));
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              BOOL isDefaultPairedDevice = self->_isDefaultPairedDevice;
              BOOL isReadyForEncrypting = self->_isReadyForEncrypting;
              BOOL isDefaultPairedDevicePairedLocally = self->_isDefaultPairedDevicePairedLocally;
              BOOL isDefaultPairedDevicePairedRemotely = self->_isDefaultPairedDevicePairedRemotely;
              *(_DWORD *)__errnum = 136316418;
              *(void *)&__errnum[4] = v25;
              *(_WORD *)&__errnum[12] = 2048;
              *(void *)&__errnum[14] = v58;
              *(_WORD *)&__errnum[22] = 1024;
              *(_DWORD *)v109 = isDefaultPairedDevice;
              *(_WORD *)&v109[4] = 1024;
              *(_DWORD *)&v109[6] = isReadyForEncrypting;
              *(_WORD *)&v109[10] = 1024;
              *(_DWORD *)&v109[12] = isDefaultPairedDevicePairedLocally;
              *(_WORD *)&v109[16] = 1024;
              *(_DWORD *)&v109[18] = isDefaultPairedDevicePairedRemotely;
              _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "control channel failed to decrypt (%s) of control channel data: %ld (magnet %u encrypting %u, pairedLoca lly %u pairedRemotely %u)",  __errnum,  0x2Eu);
            }

            if (self->_receiveHandlerBeingCalled)
            {
              v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "receiveHandler is being called, so ignore this one",  __errnum,  2u);
              }
            }

            else
            {
              self->_receiveHandlerBeingCalled = 1;
              v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__errnum = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "Dispatch receiveHandler",  __errnum,  2u);
              }

              uint64_t v71 = im_primary_queue(v69, v70);
              v72 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v71);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10012A638;
              block[3] = &unk_1008F6010;
              block[4] = self;
              dispatch_async(v72, block);
            }

            goto LABEL_33;
          }

          goto LABEL_30;
        }
      }

      else
      {

        v36 = 0LL;
      }

      uint64_t v59 = OSLogHandleForIDSCategory("IDSMessageHashStore");
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__errnum = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "IDS message hash found, returning early",  __errnum,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v61)
        && _IDSShouldLog(0LL, @"IDSMessageHashStore"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSMessageHashStore",  @"IDS message hash found, returning early");
      }

      [v32 updateCreationDateForHash:v36];
      v42 = objc_alloc_init(&OBJC_CLASS___NSData);
      BOOL v44 = 1;
      goto LABEL_63;
    }

    unsigned int v18 = -[IDSUTunControlChannel isDefaultPairedDeviceStartingToEncrypt]( self,  "isDefaultPairedDeviceStartingToEncrypt");
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_deviceUniqueID;
      int v21 = self->_sd;
      *(_DWORD *)__errnum = 138412546;
      *(void *)&__errnum[4] = v20;
      *(_WORD *)&__errnum[12] = 1024;
      *(_DWORD *)&__errnum[14] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for [%@] disconnected on {socket:%d} recv: connection closed",  __errnum,  0x12u);
    }

    -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  v18 ^ 1,  0LL,  0LL,  0LL);
  }

- (void)writeToConnection
{
  if (self->_newSocket)
  {
    self->_newSocket = 0;
    socklen_t v35 = 4;
    int __errnum = -1431655766;
    int v3 = getsockopt(self->_sd, 0xFFFF, 4103, &__errnum, &v35);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      deviceUniqueID = self->_deviceUniqueID;
      int sd = self->_sd;
      int v7 = __errnum;
      id v8 = strerror(__errnum);
      *(_DWORD *)buf = 138544386;
      *(void *)v38 = deviceUniqueID;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = sd;
      *(_WORD *)&v38[14] = 1024;
      *(_DWORD *)&v38[16] = v3;
      *(_WORD *)&v38[20] = 1024;
      *(_DWORD *)&v38[22] = v7;
      *(_WORD *)&v38[26] = 2080;
      *(void *)&v38[28] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for [%{public}@] connected for write {socket:%d} (getsockopt=%d error=%d: %s)",  buf,  0x28u);
    }

    if (!v3)
    {
      if (__errnum)
      {
        id v9 = self;
        uint64_t v10 = 0LL;
LABEL_22:
        -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( v9,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  v10,  0LL,  0LL,  0LL);
        return;
      }
    }
  }

  if (!-[NSMutableData length](self->_pendingDataSend, "length"))
  {
    IDSTransportThreadSuspendSocket(self->_sd, 2LL);
    self->_sendSuspended = 1;
    return;
  }

  ssize_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = self->_sd;
    NSUInteger v13 = -[NSMutableData length](self->_pendingDataSend, "length");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v38 = v12;
    *(_WORD *)&v38[4] = 2048;
    *(void *)&v38[6] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "control channel sending control message on {socket:%d} ... (have %lu)",  buf,  0x12u);
  }

  unint64_t v14 = send( self->_sd,  -[NSMutableData bytes](self->_pendingDataSend, "bytes"),  -[NSMutableData length](self->_pendingDataSend, "length"),  0);
  if ((v14 & 0x8000000000000000LL) != 0)
  {
    unsigned int v19 = *__error();
    if (v19 > 0x37 || ((1LL << v19) & 0x80000800000010LL) == 0)
    {
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = self->_deviceUniqueID;
        int v22 = self->_sd;
        v23 = strerror(v19);
        *(_DWORD *)buf = 138413058;
        *(void *)v38 = v21;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v22;
        *(_WORD *)&v38[14] = 1024;
        *(_DWORD *)&v38[16] = v19;
        *(_WORD *)&v38[20] = 2080;
        *(void *)&v38[22] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "UTunController control channel for [%@] disconnected on send {socket:%d}: errno=%d: %s",  buf,  0x22u);
      }

      goto LABEL_21;
    }
  }

  else
  {
    unint64_t v15 = v14;
    if (v14 > -[NSMutableData length](self->_pendingDataSend, "length"))
    {
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        NSUInteger v17 = -[NSMutableData length](self->_pendingDataSend, "length");
        int v18 = self->_sd;
        *(_DWORD *)buf = 134218496;
        *(void *)v38 = v15;
        *(_WORD *)&v38[8] = 2048;
        *(void *)&v38[10] = v17;
        *(_WORD *)&v38[18] = 1024;
        *(_DWORD *)&v38[20] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "control channel unexpected length {bytesSent:%zu} {pendingDataSendLength:%zu} for socket {socket:%d}",  buf,  0x1Cu);
      }

LABEL_21:
      uint64_t v10 = -[IDSUTunControlChannel isDefaultPairedDeviceStartingToEncrypt]( self,  "isDefaultPairedDeviceStartingToEncrypt") ^ 1;
      id v9 = self;
      goto LABEL_22;
    }

    if (v15)
    {
      outgoingStallDetector = self->_outgoingStallDetector;
      if (outgoingStallDetector) {
        -[IDSStallDetector produceBytes:](outgoingStallDetector, "produceBytes:", v15);
      }
      -[NSMutableData replaceBytesInRange:withBytes:length:]( self->_pendingDataSend,  "replaceBytesInRange:withBytes:length:",  0LL,  v15,  0LL,  0LL);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = self->_sd;
        NSUInteger v27 = -[NSMutableData length](self->_pendingDataSend, "length");
        int v28 = self->_sd;
        *(_DWORD *)buf = 134218752;
        *(void *)v38 = v15;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = v26;
        *(_WORD *)&v38[14] = 2048;
        *(void *)&v38[16] = v27;
        *(_WORD *)&v38[24] = 1024;
        *(_DWORD *)&v38[26] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "control channel sent %ld bytes on {socket:%d} (%lu left) (s:%d)",  buf,  0x22u);
      }

      if (!-[NSMutableData length](self->_pendingDataSend, "length"))
      {
        if (self->_sendingPriorityMessage)
        {
          self->_sendingPriorityMessage = 0;
        }

        else if (-[NSMutableArray count](self->_outgoingMessages, "count"))
        {
          -[NSMutableArray removeObjectAtIndex:](self->_outgoingMessages, "removeObjectAtIndex:", 0LL);
        }

        else
        {
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "control channel finished sending bytes but no message to remove",  buf,  2u);
          }
        }

        id v33 = -[NSMutableArray count](self->_outgoingMessages, "count");
        if ((char *)-[NSMutableArray count](self->_outgoingPriorityMessages, "count") + (void)v33)
        {
          -[IDSUTunControlChannel _checkSendNewMessage](self, "_checkSendNewMessage");
        }

        else
        {
          IDSTransportThreadSuspendSocket(self->_sd, 2LL);
          self->_sendSuspended = 1;
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "control channel finished sending bytes no more message send pending",  buf,  2u);
          }
        }
      }
    }

    else
    {
      int v29 = *__error();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = self->_sd;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v38 = v31;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "control channel sent 0 bytes on {socket:%d} - try again later (%d)",  buf,  0xEu);
      }
    }
  }

- (void)useConnection:(id)a3 withFirstMessage:(id)a4
{
  int v7 = (nw_connection *)a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = self->_connection;
    if (v9)
    {
      canceledConnection = self->_canceledConnection;
      self->_canceledConnection = 0LL;

      self->_shouldCallbackOnCancel = 0;
      -[IDSUTunControlChannel _cleanupConnection](self, "_cleanupConnection");
    }

    objc_storeStrong((id *)&self->_connection, a3);
    -[NSMutableData setLength:](self->_pendingDataReceive, "setLength:", 0LL);
    -[NSMutableData setLength:](self->_pendingDataSend, "setLength:", 0LL);
    self->_newSocket = 1;
    if (-[IDSUTunControlChannel isDefaultPairedDeviceStartingToEncrypt](self, "isDefaultPairedDeviceStartingToEncrypt")) {
      self->_BOOL isReadyForEncrypting = 1;
    }
    self->_sendSuspended = 0;
    nw_connection_set_queue(v7, (dispatch_queue_t)self->_connectionQueue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10012ADE0;
    handler[3] = &unk_1008FB1A8;
    ssize_t v11 = v7;
    NSUInteger v13 = v11;
    unint64_t v14 = self;
    id v15 = v8;
    nw_connection_set_state_changed_handler(v11, handler);
    nw_connection_start(v11);
  }

  else
  {
    id v9 = (OS_nw_connection *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "control channel cannot use nil connection",  buf,  2u);
    }
  }
}

- (void)_callHandlerWithMessage:(id)a3 resetDataConnections:(BOOL)a4 shouldObliterate:(BOOL)a5 decryptionFailed:(BOOL)a6 shouldTriggerCorruptionRecovery:(BOOL)a7
{
  id receiveHandler = (void (**)(id, id, BOOL, BOOL, BOOL, BOOL))self->_receiveHandler;
  if (receiveHandler) {
    receiveHandler[2](receiveHandler, a3, a4, a5, a6, a7);
  }
}

- (void)_cancelConnectionAndResetDataConnections:(BOOL)a3 shouldObliterate:(BOOL)a4 encryptionFailure:(BOOL)a5 shouldTriggerCorruptionRecovery:(BOOL)a6
{
  ssize_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    nw_connection_t connection = self->_connection;
    canceledConnection = self->_canceledConnection;
    int v16 = 138412546;
    NSUInteger v17 = connection;
    __int16 v18 = 2112;
    unsigned int v19 = canceledConnection;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "control channel _cancelConnectionAndResetDataConnections _connection %@, _canceledConnection %@",  (uint8_t *)&v16,  0x16u);
  }

  unint64_t v14 = self->_connection;
  if (v14)
  {
    self->_shouldCallbackOnCancel = 1;
    objc_storeStrong((id *)&self->_canceledConnection, v14);
    self->_callbackResetDataConnections = a3;
    self->_callbackShouldObliterate = a4;
    self->_callbackEncryptionFailed = a5;
    self->_callbackShouldTriggerCorruptionRecovery = a6;
    -[IDSUTunControlChannel _clearChannel](self, "_clearChannel");
    -[IDSUTunControlChannel _cleanupConnection](self, "_cleanupConnection");
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10069C998(v15);
    }
  }

- (void)cancelConnection
{
}

- (BOOL)connected
{
  return self->_sd != -1;
}

- (void)_clearChannel
{
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing %@", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableData setLength:](self->_pendingDataReceive, "setLength:", 0LL);
  -[NSMutableData setLength:](self->_pendingDataSend, "setLength:", 0LL);
  -[NSMutableArray removeAllObjects](self->_outgoingMessages, "removeAllObjects");
  if (self->_isDefaultPairedDevice)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v5 = [v4 isInternalInstall];

    if (v5)
    {
      outgoingStallDetector = self->_outgoingStallDetector;
      if (outgoingStallDetector) {
        -[IDSStallDetector reset](outgoingStallDetector, "reset");
      }
    }
  }

- (void)_checkSendNewMessage
{
  if (self->_sd != -1 && !-[NSMutableData length](self->_pendingDataSend, "length"))
  {
    int v3 = (char *)-[NSMutableArray count](self->_outgoingPriorityMessages, "count");
    if (&v3[(void)-[NSMutableArray count](self->_outgoingMessages, "count")])
    {
      if (v3)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_outgoingPriorityMessages, "objectAtIndex:", 0LL));
        -[NSMutableArray removeObjectAtIndex:](self->_outgoingPriorityMessages, "removeObjectAtIndex:", 0LL);
        self->_BOOL sendingPriorityMessage = 1;
        goto LABEL_9;
      }

      if (!self->_isDefaultPairedDevice
        || self->_isReadyForEncrypting
        || !self->_isDefaultPairedDevicePairedLocally && !self->_isDefaultPairedDevicePairedRemotely)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_outgoingMessages, "objectAtIndex:", 0LL));
LABEL_9:
        unsigned __int16 v5 = (unsigned __int16)[v4 length];
        if (self->_disableEncryption)
        {
          v6 = "disabled";
LABEL_11:
          id v7 = v4;
LABEL_12:
          id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", v71));
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = (uint64_t (*)(uint64_t, uint64_t))[v7 length];
            BOOL sendingPriorityMessage = self->_sendingPriorityMessage;
            *(_DWORD *)buf = 136316418;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v7;
            *(_WORD *)&buf[22] = 2048;
            uint64_t v93 = v9;
            LOWORD(v94) = 1024;
            *(_DWORD *)((char *)&v94 + 2) = v5;
            HIWORD(v94) = 2112;
            *(void *)v95 = v7;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)id v96 = sendingPriorityMessage;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "control channel encrypted (%s) new message (%p, size=%lu original size=%u  data: %@) (_sendingPriorityMessage: %d)",  buf,  0x36u);
          }

          *(_WORD *)buf = -21846;
          unsigned __int16 v11 = (unsigned __int16)[v7 length];
          buf[0] = HIBYTE(v11);
          buf[1] = v11;
          -[NSMutableData appendBytes:length:](self->_pendingDataSend, "appendBytes:length:", buf, 2LL);
          -[NSMutableData appendData:](self->_pendingDataSend, "appendData:", v7);
          if (self->_sendSuspended)
          {
            self->_BOOL sendSuspended = 0;
            IDSTransportThreadResumeSocket(self->_sd, 2LL);
          }

LABEL_17:
          return;
        }

        if (!self->_isReadyForEncrypting)
        {
          if (self->_isDefaultPairedDevice)
          {
            v6 = "default paired none";
            goto LABEL_11;
          }

          remoteDeviceEncryptionInfo = self->_remoteDeviceEncryptionInfo;
          if (remoteDeviceEncryptionInfo)
          {
            unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  IDSUTunControlChannelRemoteDeviceEncryptionInfo_UNENCRYPTED_Key));
            unsigned __int8 v49 = [v48 BOOLValue];

            if ((v49 & 1) != 0)
            {
              v6 = "remote UNENCRYPTED";
              goto LABEL_11;
            }

            id v52 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  IDSUTunControlChannelRemoteDeviceEncryptionInfoRemoteTokenURIKey));
            uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  IDSUTunControlChannelRemoteDeviceEncryptionInfoServiceKey));
            v76 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  IDSUTunControlChannelRemoteDeviceEncryptionInfoMyURIKey));
            v74 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_remoteDeviceEncryptionInfo,  "objectForKeyedSubscript:",  IDSUTunControlChannelRemoteDeviceEncryptionInfoMyIdentityKey));
            id v91 = 0LL;
            uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v52 _stripPotentialTokenURIWithToken:&v91]);
            id v73 = v91;
            dispatch_semaphore_t v53 = dispatch_semaphore_create(0LL);
            id v87 = 0LL;
            v88 = &v87;
            uint64_t v89 = 0x2020000000LL;
            uint64_t v90 = 0LL;
            v86[0] = 0LL;
            v86[1] = v86;
            v86[2] = 0x2020000000LL;
            v86[3] = 1LL;
            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000LL;
            uint64_t v93 = sub_10012A4F0;
            v94 = sub_10012A500;
            *(void *)v95 = 0LL;
            v54 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v76));
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v77));
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472LL;
            v81[2] = sub_10012C47C;
            v81[3] = &unk_1008FB1D0;
            v83 = v86;
            id v84 = &v87;
            uint64_t v85 = buf;
            v57 = v53;
            uint64_t v82 = v57;
            LOBYTE(v72) = !self->_avoidMainQueueOverrideToNO;
            [v54 legacyPublicKeyEncryptData:v4 withEncryptedAttributes:0 fromURI:v55 identity:v74 toURI:v56 pushToken:v73 service:v75 priority:300 compl etionBlock:v81 avoidMainQueue:v72];

            dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
            uint64_t v27 = (uint64_t)v88[3];
            id v7 = *(id *)(*(void *)&buf[8] + 40LL);

            _Block_object_dispose(buf, 8);
            _Block_object_dispose(v86, 8);
            _Block_object_dispose(&v87, 8);

            v6 = "remote PK";
          }

          else
          {
            if (!self->_deviceUniqueID)
            {
              uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                BOOL isDefaultPairedDevice = self->_isDefaultPairedDevice;
                BOOL isReadyForEncrypting = self->_isReadyForEncrypting;
                BOOL isDefaultPairedDevicePairedLocally = self->_isDefaultPairedDevicePairedLocally;
                BOOL isDefaultPairedDevicePairedRemotely = self->_isDefaultPairedDevicePairedRemotely;
                *(_DWORD *)buf = 136316674;
                *(void *)&uint8_t buf[4] = "none";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v4;
                *(_WORD *)&buf[22] = 2048;
                uint64_t v93 = 0LL;
                LOWORD(v94) = 1024;
                *(_DWORD *)((char *)&v94 + 2) = isDefaultPairedDevice;
                HIWORD(v94) = 1024;
                *(_DWORD *)v95 = isReadyForEncrypting;
                *(_WORD *)&v95[4] = 1024;
                *(_DWORD *)&v95[6] = isDefaultPairedDevicePairedLocally;
                *(_WORD *)id v96 = 1024;
                *(_DWORD *)&v96[2] = isDefaultPairedDevicePairedRemotely;
                _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "control channel failed to encrypt (%s) message [%@] error: %ld (magnet %u encrypting %u, pairedLocally %u pairedRemotely %u)",  buf,  0x38u);
              }

              uint64_t v65 = im_primary_queue(v63, v64);
              v66 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v65);
              dispatch_async(v66, &stru_1008FB1F0);

              uint64_t v69 = im_primary_queue(v67, v68);
              uint64_t v70 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v69);
              v79[0] = _NSConcreteStackBlock;
              v79[1] = 3221225472LL;
              v79[2] = sub_10012C550;
              v79[3] = &unk_1008F6010;
              v79[4] = self;
              dispatch_async(v70, v79);

              goto LABEL_17;
            }

            v50 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
            deviceUniqueID = self->_deviceUniqueID;
            id v80 = 0LL;
            id v7 = (id)objc_claimAutoreleasedReturnValue( [v50 legacyPublicKeyEncryptData:v4 withEncryptedAttributes:0 toDeviceID:deviceUniqueID priority:300 error:&v80]);
            id v52 = v80;

            uint64_t v27 = sub_1002B1D88(v52);
            v6 = "cloud paired PK";
          }

          if (!v27) {
            goto LABEL_12;
          }
LABEL_43:
          int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController", v71));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v29 = self->_isDefaultPairedDevice;
            BOOL v30 = self->_isReadyForEncrypting;
            BOOL v31 = self->_isDefaultPairedDevicePairedLocally;
            BOOL v32 = self->_isDefaultPairedDevicePairedRemotely;
            *(_DWORD *)buf = 136316674;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v4;
            *(_WORD *)&buf[22] = 2048;
            uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t))v27;
            LOWORD(v94) = 1024;
            *(_DWORD *)((char *)&v94 + 2) = v29;
            HIWORD(v94) = 1024;
            *(_DWORD *)v95 = v30;
            *(_WORD *)&v95[4] = 1024;
            *(_DWORD *)&v95[6] = v31;
            *(_WORD *)id v96 = 1024;
            *(_DWORD *)&v96[2] = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "control channel failed to encrypt (%s) message [%@] error: %ld (magnet %u encrypting %u, pairedLocally %u pairedRemotely %u)",  buf,  0x38u);
          }

          self->_BOOL sendingPriorityMessage = 0;
          uint64_t v35 = im_primary_queue(v33, v34);
          v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v35);
          dispatch_async(v36, &stru_1008FB210);

          uint64_t v39 = im_primary_queue(v37, v38);
          v40 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v39);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10012C5FC;
          block[3] = &unk_1008F6010;
          block[4] = self;
          dispatch_async(v40, block);

          goto LABEL_17;
        }

        id v12 = (id)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannel identityPair](self, "identityPair"));
        id v13 = v4;
        if (![v13 length])
        {
          int v23 = 0;
          unsigned int v19 = 0LL;
          BOOL v21 = 0;
LABEL_39:

          id v7 = v19;
          if (v23) {
            uint64_t v27 = 250LL;
          }
          else {
            uint64_t v27 = 201LL;
          }
          v6 = "default paired PK";
          if (v21) {
            goto LABEL_12;
          }
          goto LABEL_43;
        }

        IMTimingStartTimingForKey( @"Encryption",  0LL,  @"UTunControlChannel",  @"IDSAgent",  @"Started encryption");
        uint64_t v14 = OSLogHandleForIDSCategory("Encryption");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "   UTUNControlChannel Encrypting {identityPair: %{private}@}",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v16)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          id v71 = v12;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   UTUNControlChannel Encrypting {identityPair: %{private}@}");
        }

        NSUInteger v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remotePublicIdentity", v71));
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localFullIdentity]);
        id v87 = 0LL;
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 signAndProtectData:v13 withSigner:v18 error:&v87]);
        id v20 = v87;

        BOOL v21 = v19 != 0LL;
        if (v19)
        {
          id v22 = v19;
        }

        else
        {
          uint64_t v41 = OSLogHandleForIDSCategory("Encryption");
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "   Public/Private encryption failed with error: %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v43)
            && _IDSShouldLog(0LL, @"Encryption"))
          {
            id v71 = v20;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   Public/Private encryption failed with error: %@");
          }

          if (v20 && [v20 code] == (id)-25304)
          {
            uint64_t v44 = OSLogHandleForIDSCategory("Warning");
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar",  buf,  2u);
            }

            if (os_log_shim_legacy_logging_enabled(v46))
            {
              _IDSWarnV( @"IDSFoundation",  @"   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar");
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar");
              _IDSLogTransport( @"Warning",  @"IDS",  @"   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar");
            }

            IMLogBacktrace(0LL);
            int v23 = 1;
            goto LABEL_29;
          }
        }

        int v23 = 0;
LABEL_29:
        IMTimingStopTimingForKey( @"Encryption",  0LL,  @"UTunControlChannel",  @"IDSAgent",  @"Done encryption");

        goto LABEL_39;
      }

      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int sd = self->_sd;
        BOOL sendSuspended = self->_sendSuspended;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = sd;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = sendSuspended;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "control channel suspending {socket:%d} (%d) awaiting default paired encryption negotiation",  buf,  0xEu);
      }

      if (!self->_sendSuspended)
      {
        self->_BOOL sendSuspended = 1;
        IDSTransportThreadSuspendSocket(self->_sd, 2LL);
      }
    }
  }

- (void)sendMessage:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    -[NSMutableArray addObject:](self->_outgoingMessages, "addObject:", v4);
    -[IDSUTunControlChannel _checkSendNewMessage](self, "_checkSendNewMessage");
  }

- (void)sendPriorityMessage:(id)a3
{
  if (a3)
  {
    id v4 = [a3 copy];
    -[NSMutableArray addObject:](self->_outgoingPriorityMessages, "addObject:", v4);
    -[IDSUTunControlChannel _checkSendNewMessage](self, "_checkSendNewMessage");
  }

- (void)invalidate
{
  id receiveHandler = self->_receiveHandler;
  if (receiveHandler)
  {
    self->_id receiveHandler = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSUTunControlChannel;
  -[IDSUTunControlChannel dealloc](&v3, "dealloc");
}

- (id)_utunControlMessageFairplayDeviceInfo
{
  return 0LL;
}

- (id)_utunControlMessageFairplayHostSessionInfo:(unsigned __int8)a3 deviceType:(unsigned __int8)a4 protocolVersion:(unsigned int)a5
{
  unsigned int v15 = 0;
  uint64_t v14 = 0LL;
  unsigned int v13 = 0;
  v16[0] = a3;
  v16[1] = a4;
  v16[2] = a5;
  -[IDSUTunControlChannel _destroyFairplayHostSession](self, "_destroyFairplayHostSession");
  sub_10054FE84((uint64_t)v16, (uint64_t)&v15, &v14, (uint64_t)&v13);
  if (v6)
  {
    unsigned int v7 = v6;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "GrappaHostInit failed with error %d.",  buf,  8u);
    }

    if (v14) {
      sub_10052D9E0(v14);
    }
    -[IDSUTunControlChannel _handleFairplayAuthenticationFailure](self, "_handleFairplayAuthenticationFailure");
    return 0LL;
  }

  else
  {
    self->_grappaHostSessionID = v15;
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v18 = v15;
      __int16 v19 = 1024;
      unsigned int v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "GrappaHostInit succeeded with hostSessionID %08x, hostSessionInfoRequest (%uB)",  buf,  0xEu);
    }

    char v12 = 7;
    *(_DWORD *)buf = bswap32(v13);
    unsigned __int16 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[NSMutableData appendBytes:length:](v11, "appendBytes:length:", &v12, 1LL);
    -[NSMutableData appendBytes:length:](v11, "appendBytes:length:", buf, 4LL);
    -[NSMutableData appendBytes:length:](v11, "appendBytes:length:", v14, v13);
    if (v14) {
      sub_10052D9E0(v14);
    }
    return v11;
  }

- (id)_utunControlMessageFairplayDeviceSessionInfo:(char *)a3 grappaDeviceSessionInfoSize:(unsigned int)a4
{
  return 0LL;
}

- (BOOL)processFairplayHostSessionInfo:(id)a3
{
  return 1;
}

- (BOOL)processFairplayDeviceInfo:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    *(void *)unsigned int v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "got control message: FairplayDeviceInfo %@",  (uint8_t *)&v19,  0xCu);
  }

  id v6 = [v4 length];
  id v7 = v4;
  id v8 = (unsigned __int8 *)[v7 bytes];
  if (v6 == (id)7)
  {
    uint64_t v9 = v8[1];
    uint64_t v10 = v8[2];
    unsigned int v11 = bswap32(*(_DWORD *)(v8 + 3));
    char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109632;
      *(_DWORD *)unsigned int v20 = v9;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v11;
      LOWORD(v21) = 1024;
      *(_DWORD *)((char *)&v21 + 2) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "recv FairplayDeviceInfo:(version=%u, deviceType=%u, protocolVersion=%u)",  (uint8_t *)&v19,  0x14u);
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePolicyController sharedInstance]( &OBJC_CLASS___IDSDevicePolicyController,  "sharedInstance"));
    [v13 startFairplayAuthenticationForDeviceWithCbuuid:self->_cbuuid];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunControlChannel _utunControlMessageFairplayHostSessionInfo:deviceType:protocolVersion:]( self,  "_utunControlMessageFairplayHostSessionInfo:deviceType:protocolVersion:",  v9,  v11,  v10));
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 length];
      int v19 = 134218242;
      *(void *)unsigned int v20 = v16;
      *(_WORD *)&v20[8] = 2112;
      BOOL v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "send FairplayHostSessionInfo (%luB):%@",  (uint8_t *)&v19,  0x16u);
    }

    -[IDSUTunControlChannel sendMessage:](self, "sendMessage:", v14);
  }

  else
  {
    NSUInteger v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134217984;
      *(void *)unsigned int v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "UTCMType_FairplayDeviceInfo has invalid data length (%lu)",  (uint8_t *)&v19,  0xCu);
    }

    -[IDSUTunControlChannel _handleFairplayAuthenticationFailure](self, "_handleFairplayAuthenticationFailure");
  }

  return v6 == (id)7;
}

- (BOOL)processFairplayDeviceSessionInfo:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    v26[0] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "got control message: FairplayDeviceSessionInfo %@",  (uint8_t *)&v25,  0xCu);
  }

  id v6 = [v4 length];
  id v7 = v4;
  id v8 = (char *)[v7 bytes];
  if ((unint64_t)v6 <= 4)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 134217984;
      v26[0] = v6;
      uint64_t v10 = "UTCMType_FairplayHostInfo has invalid data length (%lu)";
      unsigned int v11 = v9;
      uint32_t v12 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v25, v12);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  uint64_t v13 = bswap32(*(_DWORD *)(v8 + 1));
  unsigned __int16 v14 = v13 + 5;
  if (v6 != (id)(unsigned __int16)(v13 + 5))
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 67109376;
      LODWORD(v26[0]) = (_DWORD)v6;
      WORD2(v26[0]) = 1024;
      *(_DWORD *)((char *)v26 + 6) = v14;
      uint64_t v10 = "invalid message size for UTCMType_FairplayDeviceSessionInfo (%u != %u)";
      unsigned int v11 = v9;
      uint32_t v12 = 14;
      goto LABEL_15;
    }

- (void)_handleFairplayAuthenticationFailure
{
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Handle Fairplay authentication failure...",  v4,  2u);
  }

  -[IDSUTunControlChannel _cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:]( self,  "_cancelConnectionAndResetDataConnections:shouldObliterate:encryptionFailure:shouldTriggerCorruptionRecovery:",  1LL,  1LL,  0LL,  0LL);
}

- (void)_destroyFairplayHostSession
{
  if (self->_grappaHostSessionID)
  {
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int grappaHostSessionID = self->_grappaHostSessionID;
      v5[0] = 67109120;
      v5[1] = grappaHostSessionID;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "_destroyFairplayHostSession %08x",  (uint8_t *)v5,  8u);
    }

    sub_10052C1BC(self->_grappaHostSessionID);
    self->_unsigned int grappaHostSessionID = 0;
  }

- (void)sendOTRNegotiationMessage:(id)a3 negotiationCount:(unsigned int)a4 negotiationData:(id)a5
{
  id v8 = a3;
  if (v8 && a5)
  {
    id v9 = a5;
    uint64_t v10 = _IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunControlChannel.m",  1125LL);
    *(_WORD *)(v10 + 1297) = 266;
    id v11 = v8;
    uint32_t v12 = (const char *)[v11 UTF8String];
    if (v12)
    {
      uint64_t v13 = v12;
      unsigned int v14 = strlen(v12);
      *(_WORD *)(v10 + 1299) = bswap32(v14) >> 16;
      uint64_t v15 = (unsigned __int16)v14;
      if ((_WORD)v14) {
        memcpy((void *)(v10 + 1301), v13, (unsigned __int16)v14);
      }
    }

    else
    {
      uint64_t v15 = 0LL;
      *(_WORD *)(v10 + 1299) = 0;
    }

    id v16 = (char *)(v10 + v15);
    uint64_t v17 = v10 + v15 + 1301;
    *(_DWORD *)uint64_t v17 = bswap32(a4);
    unsigned int v18 = [v9 length];
    unsigned __int16 v19 = v18;
    *(_WORD *)(v17 + 4) = bswap32(v18) >> 16;
    v16 += 1307;
    id v20 = v9;
    id v21 = [v20 bytes];

    memcpy(v16, v21, v19);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v10 + 1297,  &v16[v19 - 1297 - v10]));
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunControlChannel.m",  1144LL,  v10);
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134218498;
      id v25 = [v22 length];
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 1024;
      unsigned int v29 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "send control message: OTRNegotiationData (%luB) for %@, count:%08x",  (uint8_t *)&v24,  0x1Cu);
    }

    -[IDSUTunControlChannel sendMessage:](self, "sendMessage:", v22);
  }
}

- (BOOL)processOTRNegotiationMessage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_34;
  }
  id v5 = v3;
  id v6 = (unsigned __int8 *)[v5 bytes];
  unsigned __int16 v7 = (unsigned __int16)[v5 length];
  int v8 = v7;
  if (v7 <= 3u)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 67109120;
      int v31 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "processOTRNegotiationMessage: totalLength: %u, less than 4",  (uint8_t *)&v30,  8u);
    }

- (void)sendSuspendOTRNegotiationMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunControlChannel.m",  1208LL);
    *(_WORD *)(v5 + 1297) = 268;
    id v6 = v4;
    unsigned __int16 v7 = (const char *)[v6 UTF8String];
    if (v7)
    {
      int v8 = v7;
      unsigned int v9 = strlen(v7);
      *(_WORD *)(v5 + 1299) = bswap32(v9) >> 16;
      uint64_t v10 = (unsigned __int16)v9;
      if ((_WORD)v9) {
        memcpy((void *)(v5 + 1301), v8, (unsigned __int16)v9);
      }
    }

    else
    {
      uint64_t v10 = 0LL;
      *(_WORD *)(v5 + 1299) = 0;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5 + 1297, v10 + 4));
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunControlChannel.m",  1216LL,  v5);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      id v14 = [v11 length];
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "send control message: SuspendOTRNegotiationData (%luB) for %@",  (uint8_t *)&v13,  0x16u);
    }

    -[IDSUTunControlChannel sendMessage:](self, "sendMessage:", v11);
  }
}

- (BOOL)processSuspendOTRNegotiationMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  id v6 = v4;
  unsigned __int16 v7 = (unsigned __int8 *)[v6 bytes];
  unsigned __int16 v8 = (unsigned __int16)[v6 length];
  int v9 = v7[1];
  if (v9 != 1)
  {
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109120;
      int v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "got control message: SuspendOTRNegotiationData, invalid OTR version number: %d.",  (uint8_t *)&v21,  8u);
    }

    goto LABEL_13;
  }

  int v10 = v8;
  if ((v8 & 0xFFFE) != 2)
  {
    uint64_t v11 = __rev16(*((unsigned __int16 *)v7 + 1));
    if ((_DWORD)v11)
    {
      if (v8 - 4 >= (int)v11)
      {
        uint64_t v12 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v7 + 4,  v11,  4LL);
        if (v12) {
          goto LABEL_7;
        }
        uint64_t v17 = OSLogHandleForTransportCategory("IDSNetworking");
        unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "control message: OTRNegotiation cannot decode token",  (uint8_t *)&v21,  2u);
        }

        uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
        if ((_DWORD)v20)
        {
          if (_IDSShouldLogTransport(v20))
          {
            _IDSLogTransport( @"IDSNetworking",  @"IDS",  @"control message: OTRNegotiation cannot decode token");
            if (_IDSShouldLog(0LL, @"IDSNetworking")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNetworking",  @"control message: OTRNegotiation cannot decode token");
            }
          }
        }

- (void)suspendOTRNegotiation:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v4 suspendSessionNegotiation:v3 askedByPairedDevice:1];
}

- (void)resumeOTRNegotiation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v2 resumeSessionNegotiation];
}

- (BOOL)isReadyForEncrypting
{
  return self->_isReadyForEncrypting;
}

- (void)setIsReadyForEncrypting:(BOOL)a3
{
  self->_BOOL isReadyForEncrypting = a3;
}

- (BOOL)isDefaultPairedDevicePairedLocally
{
  return self->_isDefaultPairedDevicePairedLocally;
}

- (void)setIsDefaultPairedDevicePairedLocally:(BOOL)a3
{
  self->_BOOL isDefaultPairedDevicePairedLocally = a3;
}

- (BOOL)isDefaultPairedDevicePairedRemotely
{
  return self->_isDefaultPairedDevicePairedRemotely;
}

- (void)setIsDefaultPairedDevicePairedRemotely:(BOOL)a3
{
  self->_BOOL isDefaultPairedDevicePairedRemotely = a3;
}

- (BOOL)disableEncryption
{
  return self->_disableEncryption;
}

- (void)setDisableEncryption:(BOOL)a3
{
  self->_disableEncryption = a3;
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (NSDictionary)remoteDeviceEncryptionInfo
{
  return self->_remoteDeviceEncryptionInfo;
}

- (void)setRemoteDeviceEncryptionInfo:(id)a3
{
}

- (BOOL)didReceiveReestablishmentRequest
{
  return self->_didReceiveReestablishmentRequest;
}

- (void)setDidReceiveReestablishmentRequest:(BOOL)a3
{
  self->_didReceiveReestablishmentRequest = a3;
}

- (double)reestablishmentRequestReceiveTime
{
  return self->_reestablishmentRequestReceiveTime;
}

- (void)setReestablishmentRequestReceiveTime:(double)a3
{
  self->_reestablishmentRequestReceiveTime = a3;
}

- (BOOL)checksumEnabled
{
  return self->_checksumEnabled;
}

- (void)setChecksumEnabled:(BOOL)a3
{
  self->_checksumEnabled = a3;
}

- (BOOL)avoidMainQueueOverrideToNO
{
  return self->_avoidMainQueueOverrideToNO;
}

- (void)setAvoidMainQueueOverrideToNO:(BOOL)a3
{
  self->_avoidMainQueueOverrideToNO = a3;
}

- (IDSUTunControlChannelIdentityPair)identityPair
{
  return self->_identityPair;
}

- (void)setIdentityPair:(id)a3
{
}

- (IDSStallDetector)outgoingStallDetector
{
  return self->_outgoingStallDetector;
}

- (void)setOutgoingStallDetector:(id)a3
{
}

- (BOOL)connecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (void).cxx_destruct
{
}

@end