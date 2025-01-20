@interface IDSUTunConnection
- (BOOL)_isMagnetConnection;
- (BOOL)_isWiProxPeer;
- (BOOL)_messageHasValidEncryptionStatus:(id)a3;
- (BOOL)_messageIsAllowedToSendMessageOnTopic:(id)a3;
- (BOOL)_nonBTAllowedForClientID:(id)a3;
- (BOOL)_nonThreadSafeIsConnected;
- (BOOL)_performFallbackIfNecessary:(id)a3;
- (BOOL)_resourceTransferUUIDAlreaadyReceived:(id)a3;
- (BOOL)_shouldAWDLogMessage:(id)a3;
- (BOOL)_storeIncomingClassADataMesageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5;
- (BOOL)_storeIncomingClassCDataMessageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5;
- (BOOL)checkServiceCompability:(id)a3 localMessage:(id)a4;
- (BOOL)enableOTR;
- (BOOL)hasSpaceForMessagesWithDataProtectionClass:(unsigned int)a3;
- (BOOL)isAlwaysConnected;
- (BOOL)isCloudEnabled;
- (BOOL)isConnected;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdle;
- (BOOL)isMagnetIndicatingPeerIsAwake;
- (BOOL)supportsLegacyOTRSessionToken;
- (BOOL)supportsMessageOfType:(int64_t)a3;
- (IDSUTunConnection)cloudConnection;
- (IDSUTunConnection)initWithIdentifier:(id)a3 socketPriority:(int64_t)a4 btUUID:(id)a5 uniqueID:(id)a6 incomingServiceMap:(id)a7 outgoingServiceMap:(id)a8 isCloudEnabled:(BOOL)a9 shouldUseIPsecLink:(BOOL)a10;
- (IDSUTunConnectionDelegate)delegate;
- (NSArray)supportedMessageTypes;
- (NSDictionary)cumulativeIncomingStatistics;
- (NSDictionary)cumulativeOutgoingStatistics;
- (NSDictionary)queueStatistics;
- (NSDictionary)sendingMessageStatistics;
- (NSString)cbuuid;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (double)_dequeueMessagesTimerInterval;
- (double)_fallbackTimeoutForService:(id)a3;
- (double)_nanoConnectedFallbackTimeoutForService:(id)a3;
- (double)_nanoDisconnectedFallbackTimeoutForService:(id)a3;
- (double)rtt;
- (id)_UTunDeliveryController;
- (id)_decryptOTREncrtypedMessage:(id)a3;
- (id)_encryptDataWithOTR:(id)a3 token:(id)a4;
- (id)_encryptionController;
- (id)_nonThreadSafeSocketOptions;
- (id)_now;
- (id)_sendingMessageStatisticsForClass:(unsigned int)a3;
- (id)serviceController;
- (int64_t)_socketToNiceCommand:(unsigned __int8)a3;
- (int64_t)idsPriority;
- (int64_t)priority;
- (unint64_t)_currentLink;
- (unint64_t)_inflightMessageCount;
- (unint64_t)_inflightMessageCountForClass:(unsigned int)a3;
- (unint64_t)_inflightMessageCountForType:(int64_t)a3;
- (unint64_t)_pendingOutgoingBytesForClass:(unsigned int)a3;
- (unint64_t)_sendingMessageCountForClass:(unsigned int)a3;
- (unint64_t)_sendingMessageCountForType:(int64_t)a3;
- (unint64_t)maxQueueSize;
- (unsigned)_calculateRandomDelayForCloudMessagingRequest;
- (unsigned)dataProtectionClass;
- (void)_addIncomingMessageSize:(unint64_t)a3 forTopic:(id)a4;
- (void)_addMessageSize:(unint64_t)a3 forTopic:(id)a4 direction:(unsigned __int8)a5 dataProtectionClass:(unsigned int)a6 isResource:(BOOL)a7;
- (void)_addOutgoingMessageSize:(unint64_t)a3 forTopic:(id)a4 dataProtectionClass:(unsigned int)a5 isResource:(BOOL)a6;
- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4;
- (void)_assertQuickRelayForCloudMessaging;
- (void)_checkAndStartConnection;
- (void)_clearLastFallbackWithReason:(id)a3;
- (void)_clearSendingPowerAssertionWithReason:(id)a3;
- (void)_connectivityChanged;
- (void)_decryptPublicKeyEncryptedMessage:(id)a3 completionBlock:(id)a4;
- (void)_dequeueMessages;
- (void)_dequeueMessagesTimerDidFire:(id)a3;
- (void)_dequeueTimerFiredOnMain:(id)a3;
- (void)_dumpLogs;
- (void)_fallbackTimerFired;
- (void)_fallbackTimerFiredOnMain;
- (void)_flushMessagesAll:(BOOL)a3 response:(int64_t)a4;
- (void)_handleBecomingEmpty;
- (void)_handleBecomingEmptyForDataProtectionClass:(unsigned int)a3;
- (void)_handleBecomingEmptyOfCloudMessages;
- (void)_handleOTRDecryptionError:(id)a3;
- (void)_handleOTRDecryptionSuccess:(id)a3;
- (void)_invalidateMessagesDequeueTimer;
- (void)_messageTimedOut:(id)a3 localMessage:(id)a4;
- (void)_nonThreadSafeStopConnection;
- (void)_noteReceivedResourceTransferUUID:(id)a3;
- (void)_optionallyDecryptMessage:(id)a3 completionBlock:(id)a4;
- (void)_processDecryptedMessage:(id)a3;
- (void)_processIncomingDataMessage:(id)a3;
- (void)_processIncomingResourceTransferMessage:(id)a3 messageUUID:(id)a4 streamID:(unsigned __int16)a5 topic:(id)a6 wantsAppAck:(BOOL)a7 expectsPeerResponse:(BOOL)a8 peerResponseIdentifier:(id)a9 isDefaultPairedDevice:(BOOL)a10 didWakeHint:(BOOL)a11;
- (void)_processMessage:(id)a3 withSequenceNumberBlock:(id)a4;
- (void)_removeMessageFromStatistics:(id)a3;
- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 detailedError:(id)a6 responseCode:(int64_t)a7;
- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 responseCode:(int64_t)a6;
- (void)_requeueMessages:(id)a3;
- (void)_requeueSendingMessage:(id)a3;
- (void)_resetFallbackTimeout:(double)a3 useNextFallback:(BOOL)a4;
- (void)_resetTimeout:(id)a3;
- (void)_sendAckForMessage:(id)a3;
- (void)_sendEncryptedMessage:(id)a3;
- (void)_sendExpiredAckForMessage:(id)a3;
- (void)_sendOTREncryptedMessage:(id)a3 useEncryption:(BOOL)a4 streamID:(unsigned __int16)a5 forPriority:(int64_t)a6 flag:(int)a7 token:(id)a8;
- (void)_sendOTREncryptionQueue:(id)a3 streamID:(unsigned __int16)a4;
- (void)_sendPublicKeyEncryptedMessage:(id)a3;
- (void)_sendSocketMessage:(id)a3;
- (void)_sendSocketMessage:(id)a3 ignoreSequenceNumber:(BOOL)a4;
- (void)_startAndSetupSocketPairConnection:(IDSUTunConnection *)self capabilityFlags:(SEL)a2 instanceID:(id)a3 serviceMinCompatibilityVersion:(unint64_t)a4 socketDescriptor:(unsigned __int8 *)(a5;
- (void)_startConnection;
- (void)_startConnectionForContinuityPeer;
- (void)_startMessagesDequeueMessagesTimer;
- (void)_startNWConnectinForIPsecCase:(int)a3 controlChannelVersion:(id)a4 capabilityFlags:(unint64_t)a5 instanceID:(unsigned __int8 *)(a6 serviceMinCompatibilityVersion:;
- (void)_timeoutTimerFired;
- (void)_timeoutTimerFiredOnMain;
- (void)_updateDictionary:(id)a3 addMessageSize:(int64_t)a4 addMessageCount:(int64_t)a5;
- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4;
- (void)cancelMessageID:(id)a3;
- (void)classStorageBecameAvailable:(id)a3;
- (void)clearStats;
- (void)connection:(id)a3 didReceiveDataMessage:(id)a4;
- (void)connectionBecameEmpty;
- (void)connectionBecameEmpty:(id)a3;
- (void)connectionDidClose;
- (void)connectionDidClose:(id)a3;
- (void)connectionDidReachInFlightMessageLowWaterMark:(id)a3;
- (void)connectionDidReceiveBytes:(id)a3;
- (void)dealloc;
- (void)didReceiveDataMessage:(id)a3;
- (void)dropDisallowedMessages;
- (void)flushAllMessagesForReason:(int64_t)a3;
- (void)forceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5;
- (void)handleOTRNegotiationComplete:(id)a3;
- (void)handleOTRNegotiationTimeout:(id)a3;
- (void)invalidateTimeoutTimer;
- (void)kickProgressBlockForMessageID:(id)a3;
- (void)resumeConnectivity;
- (void)retryWaitingMessages;
- (void)sendAckForMessageWithSequenceNumber:(unsigned int)a3;
- (void)sendMessage:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setCloudConnection:(id)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceBTUUID:(id)a3;
- (void)setEnableOTR:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 withReason:(id)a4;
- (void)setIdsPriority:(int64_t)a3;
- (void)setIsAlwaysConnected:(BOOL)a3;
- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3;
- (void)setMaxQueueSize:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setSupportedMessageTypes:(id)a3;
- (void)setSupportsLegacyOTRSessionToken:(BOOL)a3;
- (void)trafficClassesChanged;
@end

@implementation IDSUTunConnection

- (IDSUTunConnection)initWithIdentifier:(id)a3 socketPriority:(int64_t)a4 btUUID:(id)a5 uniqueID:(id)a6 incomingServiceMap:(id)a7 outgoingServiceMap:(id)a8 isCloudEnabled:(BOOL)a9 shouldUseIPsecLink:(BOOL)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___IDSUTunConnection;
  v21 = -[IDSUTunConnection init](&v43, "init");
  if (v21)
  {
    v22 = (NSString *)[v16 copy];
    identifier = v21->_identifier;
    v21->_identifier = v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:]( v21->_identifier,  "stringByReplacingOccurrencesOfString:withString:",  @"-",  @"_"));
    otrTokenIdentifier = v21->_otrTokenIdentifier;
    v21->_otrTokenIdentifier = (NSString *)v24;

    v26 = (NSString *)[v17 copy];
    cbuuid = v21->_cbuuid;
    v21->_cbuuid = v26;

    v28 = (NSString *)[v18 copy];
    uniqueID = v21->_uniqueID;
    v21->_uniqueID = v28;

    v30 = -[IDSLocalDeliveryQueue initWithIdentifier:]( objc_alloc(&OBJC_CLASS___IDSLocalDeliveryQueue),  "initWithIdentifier:",  v16);
    deliveryQueue = v21->_deliveryQueue;
    v21->_deliveryQueue = v30;

    v21->_priority = a4;
    v21->_isMagnetIndicatingPeerIsAwake = 1;
    *(_WORD *)&v21->_useSharedOTRSession = 257;
    v21->_isCloudEnabled = a9;
    v21->_shouldUseIPsecLink = a10;
    objc_storeStrong((id *)&v21->_incomingServiceMap, a7);
    objc_storeStrong((id *)&v21->_outgoingServiceMap, a8);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v32 addObserver:v21 selector:"classStorageBecameAvailable:" name:@"__kIDSOTRKeyStorageClassStorageIsAvailableNotification" object:0];

    uint64_t v33 = OSLogHandleForIDSCategory("UTunConnection");
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (const __CFString *)v21->_identifier;
      *(_DWORD *)buf = 138412546;
      v45 = v35;
      __int16 v46 = 2048;
      v47 = v21;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Initing UTunConnection %@ %p", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v36)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Initing UTunConnection %@ %p");
    }

    if (v21->_shouldUseIPsecLink)
    {
      v21->_shouldUseNWFraming = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"NWFraming", 1LL);
      uint64_t v37 = OSLogHandleForTransportCategory("UTunConnection");
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        if (v21->_shouldUseNWFraming) {
          v39 = @"YES";
        }
        else {
          v39 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v45 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "shouldUseNWFramingOverIPsecString: %@",  buf,  0xCu);
      }

      uint64_t v41 = os_log_shim_legacy_logging_enabled(v40);
      if ((_DWORD)v41)
      {
        if (_IDSShouldLogTransport(v41))
        {
          _IDSLogTransport(@"UTunConnection", @"IDS", @"shouldUseNWFramingOverIPsecString: %@");
          if (_IDSShouldLog(0LL, @"UTunConnection")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"shouldUseNWFramingOverIPsecString: %@");
          }
        }
      }
    }
  }

  return v21;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForIDSCategory("UTunConnection");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412546;
    v15 = identifier;
    __int16 v16 = 2048;
    id v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocing UTunConnection %@ %p", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v6) && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    v11 = self->_identifier;
    v12 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Deallocing UTunConnection %@ %p");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", v11, v12));
  [v7 removeObserver:self];

  -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection");
  -[IMTimer invalidate](self->_fallbackTimer, "invalidate");
  fallbackTimer = self->_fallbackTimer;
  self->_fallbackTimer = 0LL;

  -[IMTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0LL;

  -[IMTimer invalidate](self->_dequeueTimer, "invalidate");
  dequeueTimer = self->_dequeueTimer;
  self->_dequeueTimer = 0LL;

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSUTunConnection;
  -[IDSUTunConnection dealloc](&v13, "dealloc");
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, name: %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (BOOL)_isWiProxPeer
{
  if (self->_isCloudEnabled) {
    return 0;
  }
  else {
    return !-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection");
  }
}

- (BOOL)isIdle
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  if (-[IDSUTunConnection _inflightMessageCount](self, "_inflightMessageCount")) {
    return 0;
  }
  if (!self->_isCloudEnabled) {
    return 1;
  }
  double v5 = ids_monotonic_time(0LL);
  -[IDSSocketPairConnectionProtocol lastSocketActivityTime](self->_socketConnection, "lastSocketActivityTime");
  return v5 - v6 >= 10.0;
}

- (unint64_t)_sendingMessageCountForClass:(unsigned int)a3
{
  sendingMessages = self->_sendingMessages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10024396C;
  v7[3] = &unk_1008FEB50;
  unsigned int v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](sendingMessages, "indexesOfObjectsPassingTest:", v7));
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)_sendingMessageCountForType:(int64_t)a3
{
  sendingMessages = self->_sendingMessages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100243A24;
  v7[3] = &unk_1008FEB70;
  void v7[4] = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](sendingMessages, "indexesOfObjectsPassingTest:", v7));
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)_inflightMessageCountForClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = -[IDSLocalDeliveryQueue countForDataProtectionClass:](self->_deliveryQueue, "countForDataProtectionClass:");
  return -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", v3) + v5;
}

- (unint64_t)_inflightMessageCountForType:(int64_t)a3
{
  unint64_t v5 = -[IDSLocalDeliveryQueue countForDataMessageType:](self->_deliveryQueue, "countForDataMessageType:");
  return -[IDSUTunConnection _sendingMessageCountForType:](self, "_sendingMessageCountForType:", a3) + v5;
}

- (unint64_t)_inflightMessageCount
{
  unint64_t v3 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
  return (unint64_t)-[NSMutableArray count](self->_sendingMessages, "count") + v3;
}

- (BOOL)hasSpaceForMessagesWithDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (self->_maxQueueSize
    && !-[IDSUTunConnection isIdle](self, "isIdle")
    && (unint64_t v6 = -[IDSUTunConnection _pendingOutgoingBytesForClass:](self, "_pendingOutgoingBytesForClass:", v3),
        v6 >= self->_maxQueueSize))
  {
    unint64_t v8 = v6;
    uint64_t v9 = OSLogHandleForIDSCategory("IDSUTunConnection");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t maxQueueSize = self->_maxQueueSize;
      unint64_t v12 = -[IDSUTunConnection _inflightMessageCountForClass:](self, "_inflightMessageCountForClass:", v3);
      objc_super v13 = @"Class D";
      if ((_DWORD)v3 == 1) {
        objc_super v13 = @"Class A";
      }
      *(_DWORD *)buf = 138413058;
      if (!(_DWORD)v3) {
        objc_super v13 = @"Class C";
      }
      id v17 = v13;
      __int16 v18 = 2048;
      unint64_t v19 = v8;
      __int16 v20 = 2048;
      unint64_t v21 = maxQueueSize;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Insufficient space for {dataProtectionClass: %@}, {pendingOutgoingBytes:%lu}, {maxQueueSize:%lu}, {inflightMessageCount:%lu}",  buf,  0x2Au);
    }

    int v7 = os_log_shim_legacy_logging_enabled(v14);
    if (v7)
    {
      int v7 = _IDSShouldLog(0LL, @"IDSUTunConnection");
      if (v7)
      {
        -[IDSUTunConnection _inflightMessageCountForClass:](self, "_inflightMessageCountForClass:", v3);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunConnection",  @"Insufficient space for {dataProtectionClass: %@}, {pendingOutgoingBytes:%lu}, {maxQueueSize:%lu}, {inflightMessageCount:%lu}");
        LOBYTE(v7) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)_sendingMessageStatisticsForClass:(unsigned int)a3
{
  statistics = self->_statistics;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(void *)&a3));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statistics, "objectForKey:", v4));
  id v6 = [v5 copy];

  return v6;
}

- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = [&off_1009488E0 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(&off_1009488E0);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
        objc_super v13 = (char *)[v12 unsignedLongLongValue];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
        v15 = &v13[(void)[v14 unsignedLongLongValue]];

        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v15));
        [v6 setObject:v16 forKey:v11];
      }

      id v8 = [&off_1009488E0 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v8);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"]);
  [v17 doubleValue];
  double v19 = v18;

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"]);
  [v20 doubleValue];
  double v22 = v21;

  if (v19 > v22)
  {
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19));
    [v6 setObject:v23 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  }
}

- (NSDictionary)sendingMessageStatistics
{
  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_statistics, "allValues"));
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)v8) allKeys]);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
        -[NSMutableSet unionSet:](v4, "unionSet:", v10);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v6);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  unint64_t v23 = v4;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v24 = *(void *)v32;
    do
    {
      objc_super v13 = 0LL;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v23);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v13);
        v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v16 = obj;
        id v17 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            __int16 v20 = 0LL;
            do
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              -[IDSUTunConnection _addStatsFromDict:toAggregate:](self, "_addStatsFromDict:toAggregate:", v21, v15);

              __int16 v20 = (char *)v20 + 1;
            }

            while (v18 != v20);
            id v18 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }

          while (v18);
        }

        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v15, v14);
        objc_super v13 = (char *)v13 + 1;
      }

      while (v13 != v12);
      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
    }

    while (v12);
  }

  return (NSDictionary *)v25;
}

- (NSDictionary)queueStatistics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  return -[IDSLocalDeliveryQueue statistics](self->_deliveryQueue, "statistics");
}

- (void)setDeviceBTUUID:(id)a3
{
  v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (v4 && self->_cbuuid && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    uint64_t v10 = OSLogHandleForIDSCategory("UTunConnection");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      cbuuid = self->_cbuuid;
      *(_DWORD *)buf = 138412802;
      __int16 v20 = self;
      __int16 v21 = 2112;
      double v22 = cbuuid;
      __int16 v23 = 2112;
      uint64_t v24 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ changing cbuuid from %@ to %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      id v17 = self->_cbuuid;
      id v18 = v4;
      id v16 = self;
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ changing cbuuid from %@ to %@");
    }

    if (self->_cbuuid != v4)
    {
      uint64_t v14 = (NSString *)-[NSString copy](v4, "copy");
      v15 = self->_cbuuid;
      self->_cbuuid = v14;
    }

    if (-[IDSUTunConnection _isWiProxPeer](self, "_isWiProxPeer", v16, v17, v18))
    {
      -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection");
      if (self->_enabled) {
        -[IDSUTunConnection _startConnection](self, "_startConnection");
      }
    }
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_cbuuid;
      *(_DWORD *)buf = 138412802;
      __int16 v20 = self;
      __int16 v21 = 2112;
      double v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ ignoring cbuuid update from %@ to %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ ignoring cbuuid update from %@ to %@");
    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  id v43 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v6 assertRunningWithPriority:self->_priority];

  uint64_t v7 = OSLogHandleForIDSCategory("UTunConnection");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = @"YES";
    if (self->_enabled) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    v55 = self;
    if (!v4) {
      uint64_t v9 = @"NO";
    }
    __int16 v56 = 2112;
    v57 = v10;
    __int16 v58 = 2112;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ enabled state changed: %@ -> %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v11)
    && _IDSShouldLog(2LL, @"UTunConnection"))
  {
    id v12 = @"YES";
    if (self->_enabled) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    if (!v4) {
      id v12 = @"NO";
    }
    uint64_t v41 = v13;
    v42 = v12;
    uint64_t v40 = self;
    _IDSLogV(2LL, @"IDSFoundation", @"UTunConnection", @"%@ enabled state changed: %@ -> %@");
  }

  if (self->_enabled != v4)
  {
    self->_enabled = v4;
    if (v4)
    {
      -[IDSUTunConnection _startConnection](self, "_startConnection");
    }

    else
    {
      if (self->_socketConnection && -[IDSUTunConnection _isWiProxPeer](self, "_isWiProxPeer"))
      {
        unsigned int v14 = -[IDSUTunConnection _nonThreadSafeIsConnected](self, "_nonThreadSafeIsConnected");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _nonThreadSafeSocketOptions](self, "_nonThreadSafeSocketOptions"));
        [v15 suspendSocketWithOptions:v16];

        self->_connectionSuspended = 1;
        if (v14) {
          -[IDSUTunConnection _connectivityChanged](self, "_connectivityChanged");
        }
      }

      else
      {
        -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection", v40, v41, v42);
      }

      if (v43)
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        id v17 = -[NSMutableArray copy](self->_sendingMessages, "copy");
        id v18 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v49;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v49 != v19) {
                objc_enumerationMutation(v17);
              }
              __int16 v21 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
              double v22 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "context", v40));
              __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection topic](v22, "topic"));
              unsigned int v24 = [v23 hasPrefix:@"com.apple.private.alloy.continuity"];

              if (v24)
              {
                uint64_t v25 = OSLogHandleForIDSCategory("UTunConnection");
                __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v55 = v22;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Removing continuity message %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v27)
                  && _IDSShouldLog(0LL, @"UTunConnection"))
                {
                  uint64_t v40 = v22;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Removing continuity message %@");
                }

                -[IDSUTunConnection _removeSocketPairMessage:localMessage:reason:detailedError:responseCode:]( self,  "_removeSocketPairMessage:localMessage:reason:detailedError:responseCode:",  v21,  v22,  @"WPConnection failed",  v43,  29LL,  v40);
              }
            }

            id v18 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
          }

          while (v18);
        }

        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages"));
        id v29 = [v28 copy];

        id v30 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v45;
          do
          {
            for (j = 0LL; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v29);
              }
              __int128 v33 = *(IDSUTunConnection **)(*((void *)&v44 + 1) + 8LL * (void)j);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection topic](v33, "topic", v40));
              unsigned int v35 = [v34 hasPrefix:@"com.apple.private.alloy.continuity"];

              if (v35)
              {
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection underlyingSocketPairMessage](v33, "underlyingSocketPairMessage"));
                uint64_t v37 = OSLogHandleForIDSCategory("UTunConnection");
                __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v55 = v33;
                  _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Removing continuity message %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v39)
                  && _IDSShouldLog(0LL, @"UTunConnection"))
                {
                  uint64_t v40 = v33;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Removing continuity message %@");
                }

                -[IDSUTunConnection _removeSocketPairMessage:localMessage:reason:detailedError:responseCode:]( self,  "_removeSocketPairMessage:localMessage:reason:detailedError:responseCode:",  v36,  v33,  @"WPConnection failed",  v43,  29LL,  v40);
              }
            }

            id v30 = [v29 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }

          while (v30);
        }
      }
    }
  }
}

- (BOOL)isMagnetIndicatingPeerIsAwake
{
  return self->_isMagnetIndicatingPeerIsAwake;
}

- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (self->_isMagnetIndicatingPeerIsAwake != v3)
  {
    self->_isMagnetIndicatingPeerIsAwake = v3;
    if (v3)
    {
      if (-[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count"))
      {
        uint64_t v6 = OSLogHandleForTransportCategory("UTunConnection");
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v8 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
          id v9 = -[NSMutableArray count](self->_sendingMessages, "count");
          *(_DWORD *)buf = 138412802;
          id v16 = self;
          __int16 v17 = 2048;
          unint64_t v18 = v8;
          __int16 v19 = 2048;
          id v20 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ Peer awake state changed to YES with %lu pending messages (%lu sending). Kicking queue to service non-waking messages.",  buf,  0x20u);
        }

        uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
        if ((_DWORD)v11 && _IDSShouldLogTransport(v11))
        {
          unint64_t v13 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
          id v14 = -[NSMutableArray count](self->_sendingMessages, "count");
          id v12 = self;
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"%@ Peer awake state changed to YES with %lu pending messages (%lu sending). Kicking queue to service non-waking messages.");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            unint64_t v13 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count", self, v13, v14);
            id v14 = -[NSMutableArray count](self->_sendingMessages, "count");
            id v12 = self;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ Peer awake state changed to YES with %lu pending messages (%lu sending). Kicking queue to service non-waking messages.");
          }
        }

        -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages", v12, v13, v14);
      }
    }
  }

- (id)_encryptionController
{
  return +[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance");
}

- (id)_UTunDeliveryController
{
  return +[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance");
}

- (void)_nonThreadSafeStopConnection
{
  uint64_t v3 = OSLogHandleForIDSCategory("UTunConnection");
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v18 = self;
    __int16 v19 = 2080;
    id v20 = "-[IDSUTunConnection _nonThreadSafeStopConnection]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%p: %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v5) && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    v15 = self;
    id v16 = "-[IDSUTunConnection _nonThreadSafeStopConnection]";
    _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%p: %s");
  }

  uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    unint64_t v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    v15 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@");
  }

  unsigned int v10 = -[IDSUTunConnection _nonThreadSafeIsConnected](self, "_nonThreadSafeIsConnected", v15, v16);
  socketConnection = self->_socketConnection;
  if (socketConnection)
  {
    -[IDSSocketPairConnectionProtocol endSession](socketConnection, "endSession");
    id v12 = self->_socketConnection;
    self->_socketConnection = 0LL;
  }

  if (v10) {
    -[IDSUTunConnection _connectivityChanged](self, "_connectivityChanged");
  }
  if (self->_openSocketCalled)
  {
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _nonThreadSafeSocketOptions](self, "_nonThreadSafeSocketOptions"));
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      [v14 closeSocketWithOptions:v13];

      self->_openSocketCalled = 0;
    }
  }

  self->_connectionSuspended = 0;
}

- (BOOL)_isMagnetConnection
{
  return -[NSString isEqualToString:](self->_uniqueID, "isEqualToString:", IDSDeviceDefaultPairedDeviceUniqueID);
}

- (id)_nonThreadSafeSocketOptions
{
  uint64_t v3 = self->_cbuuid;
  if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
  {
    p_uniqueID = (NSString **)&kIDSDefaultPairedDeviceID;
  }

  else
  {
    if (-[IDSUTunConnection _isWiProxPeer](self, "_isWiProxPeer")) {
      goto LABEL_6;
    }
    p_uniqueID = &self->_uniqueID;
  }

  uint64_t v5 = *p_uniqueID;

  uint64_t v3 = v5;
LABEL_6:
  v20[0] = @"account";
  v20[1] = @"service";
  v21[0] = @"idstest";
  v21[1] = @"localdelivery";
  v21[2] = self->_identifier;
  v20[2] = IDSOpenSocketOptionStreamNameKey;
  v20[3] = IDSOpenSocketOptionPriorityKey;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_priority));
  v21[3] = v6;
  v20[4] = IDSOpenSocketOptionCloudEnabledKey;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isCloudEnabled));
  v21[4] = v7;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));
  uint64_t v9 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));

  if (!-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
  {
LABEL_10:
    id v12 = &off_100947608;
    goto LABEL_11;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
  if ([v10 enableOTR])
  {

    goto LABEL_10;
  }

  BOOL v11 = !self->_shouldUseIPsecLink;

  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v15 = OSLogHandleForTransportCategory("UTunConnection");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v19 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "OTR is disabled on magnet connection, enable stream encryption.",  v19,  2u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      _IDSLogTransport( @"UTunConnection",  @"IDS",  @"OTR is disabled on magnet connection, enable stream encryption.");
      if (_IDSShouldLog(0LL, @"UTunConnection")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"OTR is disabled on magnet connection, enable stream encryption.");
      }
    }
  }

  id v12 = &off_1009475F0;
LABEL_11:
  CFDictionarySetValue(v9, IDSOpenSocketOptionEncryptionMethodKey, v12);
  if (v3) {
    CFDictionarySetValue(v9, IDSOpenSocketOptionCBUUIDKey, v3);
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    CFDictionarySetValue(v9, IDSOpenSocketOptionDeviceUniqueIDKey, uniqueID);
  }

  return v9;
}

- (void)_startConnectionForContinuityPeer
{
  if (self->_enabled)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingContinuityPeerID:self->_cbuuid]);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lockedContinuityPeerID:self->_cbuuid]);

    if (v4 && ![v4 isEqualToString:self->_uniqueID]
      || v6 && ([v6 isEqualToString:self->_uniqueID] & 1) == 0)
    {
      -[IDSUTunConnection setEnabled:](self, "setEnabled:", 0LL);
      uint64_t v7 = OSLogHandleForIDSCategory("UTunConnection");
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (v4) {
          uint64_t v9 = v4;
        }
        else {
          uint64_t v9 = v6;
        }
        uniqueID = self->_uniqueID;
        *(_DWORD *)buf = 138412546;
        unint64_t v13 = v9;
        __int16 v14 = 2112;
        uint64_t v15 = uniqueID;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found pending or locked continuity peer %@, disable connection for %@.",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v11))
      {
        if (_IDSShouldLog(0LL, @"UTunConnection")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Found pending or locked continuity peer %@, disable connection for %@.");
        }
      }
    }

    else
    {
      -[IDSUTunConnection _startConnection](self, "_startConnection");
    }
  }

- (void)_checkAndStartConnection
{
  if (self->_enabled)
  {
    if (-[IDSUTunConnection _isWiProxPeer](self, "_isWiProxPeer")) {
      -[IDSUTunConnection _startConnectionForContinuityPeer](self, "_startConnectionForContinuityPeer");
    }
    else {
      -[IDSUTunConnection _startConnection](self, "_startConnection");
    }
  }

- (void)resumeConnectivity
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _nonThreadSafeSocketOptions](self, "_nonThreadSafeSocketOptions"));
  [v5 resumeSocketWithOptions:v4 shouldLogCall:0];
}

- (void)_startConnection
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  uint64_t v4 = OSLogHandleForIDSCategory("UTunConnection");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ _startConnection", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6) && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    uint64_t v17 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ _startConnection");
  }

  if (!self->_isAlwaysConnected && -[IDSUTunConnection _isWiProxPeer](self, "_isWiProxPeer"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWPLinkManager sharedInstance](&OBJC_CLASS___IDSWPLinkManager, "sharedInstance"));
    [v7 connectToPeer:self->_cbuuid];
  }

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance", v17));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _nonThreadSafeSocketOptions](self, "_nonThreadSafeSocketOptions"));
  [v8 resumeSocketWithOptions:v9 shouldLogCall:1];

  if (self->_connectionSuspended)
  {
    self->_connectionSuspended = 0;
  }

  else if (!self->_openSocketCalled)
  {
    -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection");
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _nonThreadSafeSocketOptions](self, "_nonThreadSafeSocketOptions"));
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("UTunConnection");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "IDS internally calling UTUN's openSocketWithOptions",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v13))
      {
        if (_IDSShouldLog(0LL, @"UTunConnection")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"IDS internally calling UTUN's openSocketWithOptions");
        }
      }

      self->_openSocketCalled = 1;
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 queueForPriority:self->_priority]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1002457FC;
      v18[3] = &unk_1008F8B58;
      v18[4] = self;
      [v14 openSocketWithOptions:v10 queue:v16 completionHandler:v18];
    }
  }

- (void)_startNWConnectinForIPsecCase:(int)a3 controlChannelVersion:(id)a4 capabilityFlags:(unint64_t)a5 instanceID:(unsigned __int8 *)(a6 serviceMinCompatibilityVersion:
{
  uint64_t v10 = *(void *)&a3;
  id v12 = (IDSUTunConnection *)a4;
  uint64_t v13 = objc_alloc(&OBJC_CLASS___IDSNWSocketPairConnection);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 queueForPriority:self->_priority]);
  id v16 = -[IDSNWSocketPairConnection initWithSocket:queue:delegate:priority:identifier:]( v13,  "initWithSocket:queue:delegate:priority:identifier:",  v10,  v15,  self,  self->_priority,  self->_identifier);

  if (((a5 >> 2) & 1) != self->_resumeResourceTransfers) {
    self->_resumeResourceTransfers = (a5 & 4) != 0;
  }
  if ((a5 & 1) != self->_newServiceSupported) {
    self->_newServiceSupported = a5 & 1;
  }
  self->_int serviceMinCompatibilityVersion = a7;
  if (((a5 >> 3) & 1) != self->_supportDynamicServices) {
    self->_supportDynamicServices = (a5 & 8) != 0;
  }
  if (((a5 >> 4) & 1) != self->_supportDynamicServicesOptimization) {
    self->_supportDynamicServicesOptimization = (a5 & 0x10) != 0;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v17;
  *(_OWORD *)&out[16] = v17;
  uuid_unparse_upper((const unsigned __int8 *)a6, out);
  uint64_t v18 = OSLogHandleForTransportCategory("UTunConnection");
  __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = @"YES";
    if (self->_useSharedOTRSession) {
      __int16 v21 = @"YES";
    }
    else {
      __int16 v21 = @"NO";
    }
    if (self->_useNamedOTRSessionToken) {
      double v22 = @"YES";
    }
    else {
      double v22 = @"NO";
    }
    if (self->_resumeResourceTransfers) {
      __int16 v23 = @"YES";
    }
    else {
      __int16 v23 = @"NO";
    }
    if (self->_newServiceSupported) {
      unsigned int v24 = @"YES";
    }
    else {
      unsigned int v24 = @"NO";
    }
    int serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion;
    if (!self->_supportDynamicServices) {
      id v20 = @"NO";
    }
    *(_DWORD *)buf = 138414338;
    uint64_t v37 = v12;
    __int16 v38 = 2080;
    uint64_t v39 = out;
    __int16 v40 = 2048;
    unint64_t v41 = a5;
    __int16 v42 = 2112;
    id v43 = v21;
    __int16 v44 = 2112;
    __int128 v45 = v22;
    __int16 v46 = 2112;
    __int128 v47 = v23;
    __int16 v48 = 2112;
    __int128 v49 = v24;
    __int16 v50 = 2112;
    __int128 v51 = v20;
    __int16 v52 = 1024;
    int v53 = serviceMinCompatibilityVersion;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ servi ce minimum compatibility version %u",  buf,  0x58u);
  }

  uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
  if ((_DWORD)v27)
  {
    if (_IDSShouldLogTransport(v27))
    {
      _IDSLogTransport( @"UTunConnection",  @"IDS",  @"UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ service minimum compatibility version %u");
      if (_IDSShouldLog(0LL, @"UTunConnection")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ service minimum compatibility version %u");
      }
    }
  }

  uuid_copy(self->_remoteInstanceID, (const unsigned __int8 *)a6);
  if (-[IDSUTunPeerServiceMap setRemoteInstanceID:](self->_incomingServiceMap, "setRemoteInstanceID:", a6))
  {
    unsigned __int8 v28 = -[IDSUTunPeerServiceMap setRemoteInstanceID:](self->_outgoingServiceMap, "setRemoteInstanceID:", a6);
    -[NSMutableDictionary removeAllObjects](self->_incomingServiceMapUpdateCounter, "removeAllObjects");
    if ((v28 & 1) != 0)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10024644C;
      v35[3] = &unk_1008FEBC0;
      v35[4] = self;
      id v29 = objc_retainBlock(v35);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10024645C;
      v34[3] = &unk_1008FEBE8;
      v34[4] = self;
      id v30 = objc_retainBlock(v34);
      -[IDSNWSocketPairConnection setOTREncryptionBlock:decryptionBlock:]( v16,  "setOTREncryptionBlock:decryptionBlock:",  v29,  v30);
      -[IDSNWSocketPairConnection start](v16, "start");
      objc_storeStrong((id *)&self->_socketConnection, v16);

      goto LABEL_39;
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](self->_incomingServiceMapUpdateCounter, "removeAllObjects");
  }

  uint64_t v31 = OSLogHandleForIDSCategory("UTunConnection");
  __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ openSocket returned with connection to old instance - stop and reconnect",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v33)
    && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ openSocket returned with connection to old instance - stop and reconnect");
  }

  objc_storeStrong((id *)&self->_socketConnection, v16);
  -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection");
  -[IDSUTunConnection _checkAndStartConnection](self, "_checkAndStartConnection");
LABEL_39:
}

- (void)_startAndSetupSocketPairConnection:(IDSUTunConnection *)self capabilityFlags:(SEL)a2 instanceID:(id)a3 serviceMinCompatibilityVersion:(unint64_t)a4 socketDescriptor:(unsigned __int8 *)(a5
{
  uint64_t v7 = *(void *)&a7;
  id v12 = (IDSUTunConnection *)a3;
  uint64_t v13 = objc_alloc(&OBJC_CLASS___IDSSocketPairConnection);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 queueForPriority:self->_priority]);
  if (self->_useNamedOTRSessionToken) {
    otrTokenIdentifier = self->_otrTokenIdentifier;
  }
  else {
    otrTokenIdentifier = 0LL;
  }
  __int128 v17 = -[IDSSocketPairConnection initWithSocket:queue:delegate:priority:connectionID:linkType:]( v13,  "initWithSocket:queue:delegate:priority:connectionID:linkType:",  v7,  v15,  self,  self->_priority,  otrTokenIdentifier,  -[IDSUTunConnection _currentLink](self, "_currentLink"));

  -[IDSSocketPairConnection setFragmentationSize:](v17, "setFragmentationSize:", 8000LL);
  -[IDSSocketPairConnection setInFlightMessageCountLowWaterMark:](v17, "setInFlightMessageCountLowWaterMark:", 3LL);
  if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection")) {
    uint64_t v18 = 16000LL;
  }
  else {
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  -[IDSSocketPairConnection setMaxAllowedMessageSize:](v17, "setMaxAllowedMessageSize:", v18);
  if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
  {
    if (((a4 >> 1) & 1) != self->_useSharedOTRSession) {
      self->_useSharedOTRSession = (a4 & 2) != 0;
    }
    if (((a4 >> 6) & 1) != self->_useNamedOTRSessionToken) {
      self->_useNamedOTRSessionToken = (a4 & 0x40) != 0;
    }
  }

  if (((a4 >> 2) & 1) != self->_resumeResourceTransfers) {
    self->_resumeResourceTransfers = (a4 & 4) != 0;
  }
  if ((a4 & 1) != self->_newServiceSupported) {
    self->_newServiceSupported = a4 & 1;
  }
  self->_int serviceMinCompatibilityVersion = a6;
  if (((a4 >> 3) & 1) != self->_supportDynamicServices) {
    self->_supportDynamicServices = (a4 & 8) != 0;
  }
  if (((a4 >> 4) & 1) != self->_supportDynamicServicesOptimization) {
    self->_supportDynamicServicesOptimization = (a4 & 0x10) != 0;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v19;
  *(_OWORD *)&out[16] = v19;
  uuid_unparse_upper((const unsigned __int8 *)a5, out);
  uint64_t v20 = OSLogHandleForTransportCategory("UTunConnection");
  __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    double v22 = @"YES";
    if (self->_useSharedOTRSession) {
      __int16 v23 = @"YES";
    }
    else {
      __int16 v23 = @"NO";
    }
    if (self->_useNamedOTRSessionToken) {
      unsigned int v24 = @"YES";
    }
    else {
      unsigned int v24 = @"NO";
    }
    if (self->_resumeResourceTransfers) {
      uint64_t v25 = @"YES";
    }
    else {
      uint64_t v25 = @"NO";
    }
    if (self->_newServiceSupported) {
      uint64_t v26 = @"YES";
    }
    else {
      uint64_t v26 = @"NO";
    }
    int serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion;
    if (!self->_supportDynamicServices) {
      double v22 = @"NO";
    }
    *(_DWORD *)buf = 138414338;
    v64 = v12;
    __int16 v65 = 2080;
    v66 = out;
    __int16 v67 = 2048;
    unint64_t v68 = a4;
    __int16 v69 = 2112;
    v70 = v23;
    __int16 v71 = 2112;
    v72 = v24;
    __int16 v73 = 2112;
    v74 = v25;
    __int16 v75 = 2112;
    v76 = v26;
    __int16 v77 = 2112;
    v78 = v22;
    __int16 v79 = 1024;
    int v80 = serviceMinCompatibilityVersion;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ servi ce minimum compatibility version %u",  buf,  0x58u);
  }

  uint64_t v29 = os_log_shim_legacy_logging_enabled(v28);
  if ((_DWORD)v29 && _IDSShouldLogTransport(v29))
  {
    id v30 = self->_useSharedOTRSession ? @"YES" : @"NO";
    uint64_t v31 = self->_useNamedOTRSessionToken ? @"YES" : @"NO";
    __int128 v32 = self->_resumeResourceTransfers ? @"YES" : @"NO";
    uint64_t v33 = self->_newServiceSupported ? @"YES" : @"NO";
    __int128 v34 = self->_supportDynamicServices ? @"YES" : @"NO";
    v59 = v34;
    uint64_t v60 = self->_serviceMinCompatibilityVersion;
    v57 = v32;
    __int16 v58 = v33;
    v55 = v30;
    __int16 v56 = v31;
    int v53 = out;
    unint64_t v54 = a4;
    __int16 v52 = v12;
    _IDSLogTransport( @"UTunConnection",  @"IDS",  @"UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ service minimum compatibility version %u");
    if (_IDSShouldLog(0LL, @"UTunConnection"))
    {
      if (self->_useSharedOTRSession) {
        unsigned int v35 = @"YES";
      }
      else {
        unsigned int v35 = @"NO";
      }
      if (self->_useNamedOTRSessionToken) {
        __int128 v36 = @"YES";
      }
      else {
        __int128 v36 = @"NO";
      }
      if (self->_resumeResourceTransfers) {
        uint64_t v37 = @"YES";
      }
      else {
        uint64_t v37 = @"NO";
      }
      if (self->_newServiceSupported) {
        __int16 v38 = @"YES";
      }
      else {
        __int16 v38 = @"NO";
      }
      if (self->_supportDynamicServices) {
        uint64_t v39 = @"YES";
      }
      else {
        uint64_t v39 = @"NO";
      }
      v59 = (__CFString *)v39;
      uint64_t v60 = self->_serviceMinCompatibilityVersion;
      v57 = (__CFString *)v37;
      __int16 v58 = (__CFString *)v38;
      v55 = (__CFString *)v35;
      __int16 v56 = (__CFString *)v36;
      int v53 = out;
      unint64_t v54 = a4;
      __int16 v52 = v12;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"UTunConnection receives remote controlChannelVersion %@ instance ID [%s] flags %016llX, use shared OTR session %@, use named OTR session token %@, resume resource transfers %@, new service supported %@, dynamic services %@ service minimum compatibility version %u");
    }
  }

  uuid_copy(self->_remoteInstanceID, (const unsigned __int8 *)a5);
  if (-[IDSUTunPeerServiceMap setRemoteInstanceID:](self->_incomingServiceMap, "setRemoteInstanceID:", a5))
  {
    unsigned __int8 v40 = -[IDSUTunPeerServiceMap setRemoteInstanceID:](self->_outgoingServiceMap, "setRemoteInstanceID:", a5);
    -[NSMutableDictionary removeAllObjects](self->_incomingServiceMapUpdateCounter, "removeAllObjects");
    if ((v40 & 1) != 0)
    {
      if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
      {
        if ([@"5" isEqualToString:@"5"])
        {
          id v41 = -[IDSUTunConnection integerValue](v12, "integerValue");
          if ((uint64_t)v41 < (uint64_t)[@"5" integerValue])
          {
            self->_shouldAbortOnMissingTopic = 1;
            uint64_t v42 = OSLogHandleForTransportCategory("UTunConnection");
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "This is for phone/watch (_isMagnetConnection == YES), self version is 5 for Tigris, and remote watch is %@ - this is a case where a missing topic should result in an abort() call",  buf,  0xCu);
            }

            uint64_t v45 = os_log_shim_legacy_logging_enabled(v44);
            if ((_DWORD)v45)
            {
              if (_IDSShouldLogTransport(v45))
              {
                __int16 v52 = v12;
                _IDSLogTransport( @"UTunConnection",  @"IDS",  @"This is for phone/watch (_isMagnetConnection == YES), self version is 5 for Tigris, and remote watch is %@ - this is a case where a missing topic should result in an abort() call");
                if (_IDSShouldLog(0LL, @"UTunConnection"))
                {
                  __int16 v52 = v12;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"This is for phone/watch (_isMagnetConnection == YES), self version is 5 for Tigris, and remote watch is %@ - this is a case where a missing topic should result in an abort() call");
                }
              }
            }
          }
        }
      }

      -[NSMutableDictionary removeAllObjects]( self->_tokenToOTRError,  "removeAllObjects",  v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  v60);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_100246B94;
      v62[3] = &unk_1008FEBC0;
      v62[4] = self;
      __int16 v46 = objc_retainBlock(v62);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_100246BA4;
      v61[3] = &unk_1008FEBE8;
      v61[4] = self;
      __int128 v47 = objc_retainBlock(v61);
      -[IDSSocketPairConnection setOTREncryptionBlock:decryptionBlock:]( v17,  "setOTREncryptionBlock:decryptionBlock:",  v46,  v47);
      if (self->_useNamedOTRSessionToken) {
        __int16 v48 = self->_otrTokenIdentifier;
      }
      else {
        __int16 v48 = 0LL;
      }
      -[IDSSocketPairConnection setConnectionID:](v17, "setConnectionID:", v48);
      -[IDSSocketPairConnection start](v17, "start");
      objc_storeStrong((id *)&self->_socketConnection, v17);

      goto LABEL_92;
    }
  }

  else
  {
    -[NSMutableDictionary removeAllObjects](self->_incomingServiceMapUpdateCounter, "removeAllObjects");
  }

  uint64_t v49 = OSLogHandleForIDSCategory("UTunConnection");
  __int16 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%@ openSocket returned with connection to old instance - stop and reconnect",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v51)
    && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ openSocket returned with connection to old instance - stop and reconnect");
  }

  objc_storeStrong((id *)&self->_socketConnection, v17);
  -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection");
  -[IDSUTunConnection _checkAndStartConnection](self, "_checkAndStartConnection");
LABEL_92:
}

- (void)sendMessage:(id)a3
{
  id v73 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v84 = _os_activity_create( (void *)&_mh_execute_header,  "UTUNConnection sendMessage",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v84, &state);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  uint64_t v4 = OSLogHandleForIDSCategory("UTunConnection");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    else {
      uint64_t v6 = @"(is waking)";
    }
    unint64_t v7 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
    qos_class_t v8 = qos_class_self();
    *(_DWORD *)buf = 138413314;
    v88 = self;
    __int16 v89 = 2112;
    v90 = v6;
    __int16 v91 = 2112;
    id v92 = v73;
    __int16 v93 = 2048;
    unint64_t v94 = v7;
    __int16 v95 = 1024;
    qos_class_t v96 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%@ enqueuing %@ message %@ messageCount %lu - QoS=0x%x",  buf,  0x30u);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(2LL, @"UTunConnection"))
  {
    else {
      uint64_t v10 = @"(is waking)";
    }
    unint64_t v70 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
    uint64_t v71 = qos_class_self();
    __int16 v67 = v10;
    id v69 = v73;
    __int16 v65 = self;
    _IDSLogV( 2LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ enqueuing %@ message %@ messageCount %lu - QoS=0x%x");
  }

  v74 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "topic", v65, v67, v69, v70, v71));
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v73 queueOneIdentifier]);
  if (v11 && v74)
  {
    uint64_t v12 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v88 = v74;
      __int16 v89 = 2112;
      v90 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Message with topic %@ has queueOneIdentifier %@, flushing older messages that match.",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      v66 = v74;
      unint64_t v68 = v11;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Message with topic %@ has queueOneIdentifier %@, flushing older messages that match.");
    }

    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v15 = -[NSMutableArray copy](self->_sendingMessages, "copy", v66, v68);
    id v16 = [v15 countByEnumeratingWithState:&v79 objects:v86 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v80;
LABEL_21:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v80 != v17) {
          objc_enumerationMutation(v15);
        }
        __int128 v19 = *(void **)(*((void *)&v79 + 1) + 8 * v18);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 context]);
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 queueOneIdentifier]);
        if ([v21 isEqualToString:v11])
        {
          double v22 = (void *)objc_claimAutoreleasedReturnValue([v20 topic]);
          unsigned __int8 v23 = [v22 isEqualToString:v74];

          if ((v23 & 1) != 0)
          {
            id v24 = v19;

            if (v24) {
              goto LABEL_44;
            }
            goto LABEL_32;
          }
        }

        else
        {
        }

        if (v16 == (id)++v18)
        {
          id v16 = [v15 countByEnumeratingWithState:&v79 objects:v86 count:16];
          if (v16) {
            goto LABEL_21;
          }
          break;
        }
      }
    }

    uint64_t v20 = 0LL;
LABEL_32:
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages"));
    id v26 = [v25 countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v76;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v76 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 queueOneIdentifier]);
          if ([v30 isEqualToString:v11])
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 topic]);
            unsigned int v32 = [v31 isEqualToString:v74];

            if (v32)
            {
              id v33 = v29;

              uint64_t v20 = v33;
              goto LABEL_43;
            }
          }

          else
          {
          }
        }

        id v26 = [v25 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }

      while (v26);
    }

- (void)cancelMessageID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if ([v4 length])
  {
    unint64_t v26 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 1LL);
    unint64_t v25 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 0LL);
    unint64_t v24 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 2LL);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages"));
    unint64_t v7 = 0LL;
    id v8 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 messageUUID]);
          unsigned int v13 = [v12 isEqualToIgnoringCase:v4];

          if (v13)
          {
            if (!v7) {
              unint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            -[NSMutableArray addObject:](v7, "addObject:", v11);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }

      while (v8);
    }

    if (-[NSMutableArray count](v7, "count"))
    {
      uint64_t v14 = OSLogHandleForIDSCategory("UTunConnection");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancelling messages %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v16)
        && _IDSShouldLog(0LL, @"UTunConnection"))
      {
        unsigned __int8 v23 = v7;
        _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Cancelling messages %@");
      }

      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v17 = v7;
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
      if (v18)
      {
        uint64_t v19 = *(void *)v28;
        do
        {
          for (j = 0LL; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v17);
            }
            __int16 v21 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
            double v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "underlyingSocketPairMessage", v23));
            [v21 setCompletionBlock:0];
            -[IDSUTunConnection _removeSocketPairMessage:localMessage:reason:responseCode:]( self,  "_removeSocketPairMessage:localMessage:reason:responseCode:",  v22,  v21,  @"Client Canceled",  2LL);
          }

          id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
        }

        while (v18);
      }
    }

    if (v26 && !-[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 1LL)) {
      -[IDSUTunConnection _handleBecomingEmptyForDataProtectionClass:]( self,  "_handleBecomingEmptyForDataProtectionClass:",  1LL);
    }
    if (v25 && !-[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 0LL)) {
      -[IDSUTunConnection _handleBecomingEmptyForDataProtectionClass:]( self,  "_handleBecomingEmptyForDataProtectionClass:",  0LL);
    }
    if (v24 && !-[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 2LL)) {
      -[IDSUTunConnection _handleBecomingEmptyForDataProtectionClass:]( self,  "_handleBecomingEmptyForDataProtectionClass:",  2LL);
    }
  }
}

- (void)kickProgressBlockForMessageID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 messageUUID]);
        unsigned int v13 = [v12 isEqualToIgnoringCase:v4];

        if (v13) {
          [v11 kickProgressBlock];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (BOOL)isConnected
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  return -[IDSUTunConnection _nonThreadSafeIsConnected](self, "_nonThreadSafeIsConnected");
}

- (BOOL)_nonThreadSafeIsConnected
{
  return self->_socketConnection && !self->_connectionSuspended;
}

- (void)_handleBecomingEmptyForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (!-[IDSUTunConnection _inflightMessageCount](self, "_inflightMessageCount"))
  {
    -[IDSUTunConnection _handleBecomingEmpty](self, "_handleBecomingEmpty");
    -[IDSUTunConnection _handleBecomingEmptyOfCloudMessages](self, "_handleBecomingEmptyOfCloudMessages");
  }

  if (-[IDSUTunConnection hasSpaceForMessagesWithDataProtectionClass:]( self,  "hasSpaceForMessagesWithDataProtectionClass:",  v3))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100247CCC;
    v7[3] = &unk_1008F78D8;
    void v7[4] = self;
    int v8 = v3;
    [v6 performBlockMainQueue:v7];
  }

- (void)_handleBecomingEmpty
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  -[IDSUTunConnection _clearSendingPowerAssertionWithReason:]( self,  "_clearSendingPowerAssertionWithReason:",  @"All queues are empty");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100247DB8;
  v5[3] = &unk_1008F6010;
  v5[4] = self;
  [v4 performBlockMainQueue:v5];
}

- (void)_handleBecomingEmptyOfCloudMessages
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100247E6C;
  v4[3] = &unk_1008F6010;
  v4[4] = self;
  [v3 performBlockMainQueue:v4];
}

- (void)_connectivityChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend( WeakRetained,  "connection:connectivityChanged:",  self,  -[IDSUTunConnection _nonThreadSafeIsConnected](self, "_nonThreadSafeIsConnected"));

  -[IMTimer invalidate](self->_fallbackTimer, "invalidate");
  fallbackTimer = self->_fallbackTimer;
  self->_fallbackTimer = 0LL;

  -[IDSUTunConnection _resetFallbackTimeout:useNextFallback:](self, "_resetFallbackTimeout:useNextFallback:", 0LL, 0.0);
}

- (void)_clearLastFallbackWithReason:(id)a3
{
  id v4 = a3;
  if (self->_lastFallback)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Clearing fallback stickiness due to: %@",  buf,  0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      if (_IDSShouldLogTransport(v8))
      {
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Clearing fallback stickiness due to: %@");
        if (_IDSShouldLog(0LL, @"UTunConnection")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Clearing fallback stickiness due to: %@");
        }
      }
    }

    lastFallback = self->_lastFallback;
    self->_lastFallback = 0LL;
  }
}

- (double)_nanoConnectedFallbackTimeoutForService:(id)a3
{
  id v3 = a3;
  else {
    double v4 = 60.0;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([@"utun-push-fallback-connected-timeout-" stringByAppendingString:v3]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      [v7 doubleValue];
      double v4 = v10;
      uint64_t v11 = OSLogHandleForTransportCategory("UTunConnection");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Server Bag provided us with a fallback timeout of %f",  buf,  0xCu);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Server Bag provided us with a fallback timeout of %f");
          if (_IDSShouldLog(0LL, @"UTunConnection")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Server Bag provided us with a fallback timeout of %f");
          }
        }
      }
    }
  }

  return v4;
}

- (double)_nanoDisconnectedFallbackTimeoutForService:(id)a3
{
  id v3 = a3;
  else {
    double v4 = 20.0;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([@"utun-push-fallback-disconnected-timeout-" stringByAppendingString:v3]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      [v7 doubleValue];
      double v4 = v10;
      uint64_t v11 = OSLogHandleForTransportCategory("UTunConnection");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Server Bag provided us with a fallback timeout of %f",  buf,  0xCu);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Server Bag provided us with a fallback timeout of %f");
          if (_IDSShouldLog(0LL, @"UTunConnection")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Server Bag provided us with a fallback timeout of %f");
          }
        }
      }
    }
  }

  return v4;
}

- (double)_fallbackTimeoutForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  lastFallback = self->_lastFallback;
  if (lastFallback)
  {
    -[NSDate timeIntervalSinceNow](lastFallback, "timeIntervalSinceNow");
    double v8 = fabs(v7);
    if (v8 < 0.5)
    {
      double v9 = 0.1;
      goto LABEL_24;
    }

    double v9 = 0.0;
    if (v8 < 1800.0) {
      goto LABEL_24;
    }
    -[IDSUTunConnection _clearLastFallbackWithReason:](self, "_clearLastFallbackWithReason:", @"expiration");
  }

  if (IMGetDomainBoolForKey(@"com.apple.ids", @"DisableCloudFallback"))
  {
    uint64_t v10 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "   **** cloud fallback disabled ****",  v19,  2u);
    }

    double v9 = 1000000000.0;
    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport(@"UTunConnection", @"IDS", @"   **** cloud fallback disabled ****");
      }
    }
  }

  else if (-[IDSUTunConnection _isWiProxPeer](self, "_isWiProxPeer"))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"ids-local-cloud-fallback-delay"]);

    if (v15)
    {
      [v15 doubleValue];
      if (v16 >= 0.0) {
        double v9 = v16;
      }
      else {
        double v9 = 1000000000.0;
      }
    }

    else
    {
      -[IDSUTunConnection isConnected](self, "isConnected");
      double v9 = 0.0;
    }
  }

  else
  {
    if (-[IDSUTunConnection isConnected](self, "isConnected")) {
      -[IDSUTunConnection _nanoConnectedFallbackTimeoutForService:]( self,  "_nanoConnectedFallbackTimeoutForService:",  v4);
    }
    else {
      -[IDSUTunConnection _nanoDisconnectedFallbackTimeoutForService:]( self,  "_nanoDisconnectedFallbackTimeoutForService:",  v4);
    }
    double v9 = v17;
  }

- (BOOL)_performFallbackIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v7 = v6;
  [v4 timeEnqueued];
  double v9 = v8;
  if (([v4 didFallback] & 1) != 0
    || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 topic]),
        double v11 = v7 - v9,
        -[IDSUTunConnection _fallbackTimeoutForService:](self, "_fallbackTimeoutForService:", v10),
        double v13 = v12,
        v10,
        v11 <= v13))
  {
    BOOL v21 = 0;
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 fallbackBlock]);
    if (v14)
    {
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSDate);
      lastFallback = self->_lastFallback;
      self->_lastFallback = v15;

      socketConnection = self->_socketConnection;
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___IDSSocketPairConnection, v18);
      if ((objc_opt_isKindOfClass(socketConnection, v19) & 1) != 0) {
        uint64_t v20 = self->_socketConnection;
      }
      else {
        uint64_t v20 = 0LL;
      }
      -[IDSSocketPairConnectionProtocol setNotifyWhenConnectionReceivesBytes:]( v20,  "setNotifyWhenConnectionReceivesBytes:",  1LL);
      uint64_t v22 = OSLogHandleForTransportCategory("UTunConnection");
      unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = [v4 messageID];
        id v25 = (id)objc_claimAutoreleasedReturnValue([v4 messageUUID]);
        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
        *(_DWORD *)buf = 138413058;
        uint64_t v46 = self;
        __int16 v47 = 1024;
        unsigned int v48 = v24;
        __int16 v49 = 2112;
        id v50 = v25;
        __int16 v51 = 2112;
        uint64_t v52 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ performing cloud fallback for message[%u] %@ which is scheduled to expire %@",  buf,  0x26u);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          id v29 = [v4 messageID];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v4 messageUUID]);
          unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
          uint64_t v37 = self;
          id v38 = v29;
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"%@ performing cloud fallback for message[%u] %@ which is scheduled to expire %@");

          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            id v30 = objc_msgSend(v4, "messageID", self, v29, v39, v40);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v4 messageUUID]);
            unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
            uint64_t v37 = self;
            id v38 = v30;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ performing cloud fallback for message[%u] %@ which is scheduled to expire %@");
          }
        }
      }

      objc_msgSend(v4, "setDidFallback:", 1, v37, v38, v39, v40);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v4 toURI]);
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v4 toDeviceID]);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100248A28;
      v41[3] = &unk_1008F92D8;
      id v43 = v32;
      id v44 = v14;
      id v42 = v31;
      id v34 = v32;
      id v35 = v31;
      [v33 performBlockMainQueue:v41];
    }

    BOOL v21 = 1;
  }

  return v21;
}

- (void)_resetFallbackTimeout:(double)a3 useNextFallback:(BOOL)a4
{
  if (!self->_fallbackTimer)
  {
    if (!a4)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_fallbackMessages, "firstObject"));
      double v7 = v6;
      if (!v6) {
        return;
      }
      [v6 timeEnqueued];
      double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      [v8 timeIntervalSinceNow];
      double v10 = v9;
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
      -[IDSUTunConnection _fallbackTimeoutForService:](self, "_fallbackTimeoutForService:", v11);
      a3 = v10 + v12;
    }

    uint64_t v13 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned int v24 = self;
      __int16 v25 = 2048;
      double v26 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ - messages in queue in need of fallback, setting timer for: %f",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ - messages in queue in need of fallback, setting timer for: %f");
    }

    double v16 = objc_alloc(&OBJC_CLASS___IMTimer);
    uint64_t v18 = v16;
    if (a3 < 0.005) {
      a3 = 0.005;
    }
    uint64_t v19 = im_primary_queue(v16, v17);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v18,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  0LL,  0LL,  self,  "_fallbackTimerFired",  0LL,  v20,  a3);
    fallbackTimer = self->_fallbackTimer;
    self->_fallbackTimer = v21;
  }

- (void)_fallbackTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100248CA4;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_fallbackTimerFired
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100248D28;
  v4[3] = &unk_1008F6010;
  v4[4] = self;
  [v3 performBlockWithPriority:v4 priority:self->_priority];
}

- (void)invalidateTimeoutTimer
{
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0LL;
}

- (void)_resetTimeout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (!v4)
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    double v6 = self->_sendingMessages;
    id v4 = 0LL;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v41,  v50,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v42;
      do
      {
        double v9 = 0LL;
        do
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v41 + 1) + 8 * (void)v9) context]);
          double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 expirationDate]);
          double v12 = v11;
          if (!v4 || [v11 compare:v4] == (id)-1)
          {
            id v13 = v12;

            id v4 = v13;
          }

          double v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v41,  v50,  16LL);
      }

      while (v7);
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages"));
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v38;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v37 + 1) + 8 * (void)v17) expirationDate]);
          uint64_t v19 = v18;
          if (!v4 || [v18 compare:v4] == (id)-1)
          {
            id v20 = v19;

            id v4 = v20;
          }

          uint64_t v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }

      while (v15);
    }
  }

  -[IMTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0LL;

  if (v4)
  {
    [v4 timeIntervalSinceNow];
    double v23 = v22 + 0.5;
    if (v23 >= 1.0) {
      double v24 = v23;
    }
    else {
      double v24 = 1.0;
    }
    uint64_t v25 = OSLogHandleForIDSCategory("UTunConnection");
    double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v46 = self;
      __int16 v47 = 2048;
      double v48 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@ - messages in queue, setting timer for: %f",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v27)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ - messages in queue, setting timer for: %f");
    }

    uint64_t v28 = objc_alloc(&OBJC_CLASS___IMTimer);
    uint64_t v30 = im_primary_queue(v28, v29);
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    __int128 v32 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v28,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  0LL,  0LL,  self,  "_timeoutTimerFired",  0LL,  v31,  v24);
    __int128 v33 = self->_timeoutTimer;
    self->_timeoutTimer = v32;
  }

  else
  {
    uint64_t v34 = OSLogHandleForIDSCategory("UTunConnection");
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@ - no messages in queue, clearing timer",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v36)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ - no messages in queue, clearing timer");
    }
  }
}

- (void)_timeoutTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002497CC;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_timeoutTimerFired
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100249850;
  v4[3] = &unk_1008F6010;
  v4[4] = self;
  [v3 performBlockWithPriority:v4 priority:self->_priority];
}

- (BOOL)_shouldAWDLogMessage:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  BOOL v4 = [v3 integerValue] != (id)244;

  return v4;
}

- (void)_messageTimedOut:(id)a3 localMessage:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:self->_priority];

  id v8 = [v6 dataProtectionClass];
  unint64_t v9 = -[IDSUTunConnection _inflightMessageCountForClass:](self, "_inflightMessageCountForClass:", v8);
  if (-[IDSUTunConnection _shouldAWDLogMessage:](self, "_shouldAWDLogMessage:", v6))
  {
    id v10 = objc_alloc(&OBJC_CLASS___IDSLocalMessageTimedOutMetric);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 awdTopic]);
    id v12 = objc_msgSend( v10,  "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:",  v11,  -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"),  objc_msgSend(v6, "sentMessageDataSize"),  -[IDSUTunConnection _currentLink](self, "_currentLink"),  101,  0,  objc_msgSend(v6, "priority"));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v13 logMetric:v12];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 awdTopic]);
    objc_msgSend( v14,  "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:",  v15,  -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"),  objc_msgSend(v6, "sentMessageDataSize"),  -[IDSUTunConnection _currentLink](self, "_currentLink"),  101,  0,  objc_msgSend(v6, "priority"));
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
  unsigned int v17 = [v16 isConnected];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
  unsigned __int8 v19 = [v18 isCloudConnected];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
  unsigned __int8 v21 = [v20 isClassCConnected];

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
  unsigned int v23 = [v22 isTerminusRegistered];

  unsigned int v24 = 0;
  if (v17 && (v21 & 1) == 0)
  {
    else {
      unsigned int v24 = 0;
    }
  }

  if ((v17 & 1) != 0)
  {
    if ([v6 nonWaking])
    {
      uint64_t v25 = @"This message was a non-waking message and the destination device for this message did not wake before the timeout fired";
      double v26 = self;
      id v27 = v32;
      id v28 = v6;
      uint64_t v29 = 34LL;
      goto LABEL_21;
    }
  }

  else
  {
    if (self->_isCloudEnabled) {
      unsigned __int8 v30 = v19;
    }
    else {
      unsigned __int8 v30 = 0;
    }
    if ((v30 & 1) == 0)
    {
      uint64_t v25 = @"The destination device for this message did not connected before the timeout fired.";
      double v26 = self;
      id v27 = v32;
      id v28 = v6;
      uint64_t v29 = 33LL;
      goto LABEL_21;
    }
  }

  if ([v32 wasWrittenToConnection])
  {
    uint64_t v25 = @"This message was written into the connection, but did not receive an ack. Check Bluetooth conditions and that your process is not hung on the receiver.";
    double v26 = self;
    id v27 = v32;
    id v28 = v6;
    uint64_t v29 = 35LL;
  }

  else
  {
    id v27 = v32;
    if (v24)
    {
      uint64_t v25 = @"This message requires class C connection, but the devices are not ClassC connected, because the remote device is locked.";
      double v26 = self;
      id v28 = v6;
      uint64_t v29 = 36LL;
    }

    else
    {
      uint64_t v25 = @"timed out";
      double v26 = self;
      id v28 = v6;
      uint64_t v29 = 12LL;
    }
  }

- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 responseCode:(int64_t)a6
{
}

- (void)_removeSocketPairMessage:(id)a3 localMessage:(id)a4 reason:(id)a5 detailedError:(id)a6 responseCode:(int64_t)a7
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  id v54 = a5;
  id v53 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v14 assertRunningWithPriority:self->_priority];

  if ((unint64_t)v12 | v13)
  {
    if (v12)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSSocketPairResourceTransferSender, v15);
      char isKindOfClass = objc_opt_isKindOfClass(v12, v16);
      if (a7 && (isKindOfClass & 1) != 0)
      {
        id v18 = v12;
        id v19 = [v18 sequenceNumber];
        id v20 = [v18 streamID];
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 messageUUID]);
        double v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSocketPairResourceTransferMessage cancelMessageWithSequenceNumber:streamID:messageUUID:cancelReason:]( &OBJC_CLASS___IDSSocketPairResourceTransferMessage,  "cancelMessageWithSequenceNumber:streamID:messageUUID:cancelReason:",  v19,  v20,  v21,  5LL));

        uint64_t v23 = OSLogHandleForIDSCategory("UTunConnection");
        unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v64 = self;
          __int16 v65 = 2112;
          unint64_t v66 = (unint64_t)v22;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ sending resource transfer cancel message %@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v25)
          && _IDSShouldLog(0LL, @"UTunConnection"))
        {
          double v48 = self;
          __int16 v49 = v22;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ sending resource transfer cancel message %@");
        }

        -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v22,  1LL,  v48,  v49);
      }

      -[IDSUTunConnection _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v13);
      -[NSMutableArray removeObject:](self->_sendingMessages, "removeObject:", v12);
      if (!-[NSMutableArray count](self->_sendingMessages, "count"))
      {
        sendingMessages = self->_sendingMessages;
        self->_sendingMessages = 0LL;
      }

      if (!self->_sendingMessages) {
        -[IDSUTunConnection _clearSendingPowerAssertionWithReason:]( self,  "_clearSendingPowerAssertionWithReason:",  @"No in flight messages remaining");
      }
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v13 progressBlock]);

    if (v27)
    {
      id v28 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( [(id)v13 progressBlock]);
      v28[2](v28, 0LL, 0LL, 0LL, 0LL, 1LL);

      [(id)v13 setProgressBlock:0];
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v13 completionBlock]);
    if (v29)
    {
      unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v13 toDeviceID]);
      id v31 = -[NSString copy](self->_cbuuid, "copy");
      double rtt = self->_rtt;
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_10024A650;
      v55[3] = &unk_1008FEC10;
      int64_t v61 = a7;
      id v56 = v31;
      id v57 = v30;
      double v62 = rtt;
      id v58 = (id)v13;
      id v59 = v53;
      id v60 = v29;
      id v34 = v30;
      id v35 = v31;
      [v33 performBlockMainQueue:v55];
    }

    -[IDSLocalDeliveryQueue dequeueMessage:](self->_deliveryQueue, "dequeueMessage:", v13);
    self->_cachedBytes[[(id)v13 dataProtectionClass]] = -1;
    -[NSMutableArray removeObject:](self->_fallbackMessages, "removeObject:", v13);
    if (!-[NSMutableArray count](self->_fallbackMessages, "count"))
    {
      fallbackMessages = self->_fallbackMessages;
      self->_fallbackMessages = 0LL;
    }

    uint64_t v37 = OSLogHandleForTransportCategory("UTunConnection");
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = (id)objc_claimAutoreleasedReturnValue([(id)v13 messageUUID]);
      unsigned int v40 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
      unsigned int v41 = -[NSMutableArray count](self->_sendingMessages, "count");
      *(_DWORD *)buf = 138413314;
      v64 = (IDSUTunConnection *)v12;
      __int16 v65 = 2112;
      unint64_t v66 = v13;
      __int16 v67 = 2112;
      id v68 = v39;
      __int16 v69 = 1024;
      unsigned int v70 = v41 + v40;
      __int16 v71 = 2112;
      id v72 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Message %@ %@ %@ removed, total message count %d - %@",  buf,  0x30u);
    }

    uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
    if ((_DWORD)v43)
    {
      if (_IDSShouldLogTransport(v43))
      {
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([(id)v13 messageUUID]);
        unint64_t v45 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
        __int16 v51 = (char *)-[NSMutableArray count](self->_sendingMessages, "count") + v45;
        id v52 = v54;
        __int16 v49 = (void *)v13;
        id v50 = v44;
        double v48 = (IDSUTunConnection *)v12;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Message %@ %@ %@ removed, total message count %d - %@");

        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v13, "messageUUID", v12, v13, v44, v51, v54));
          unint64_t v47 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
          __int16 v51 = (char *)-[NSMutableArray count](self->_sendingMessages, "count") + v47;
          id v52 = v54;
          __int16 v49 = (void *)v13;
          id v50 = v46;
          double v48 = (IDSUTunConnection *)v12;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Message %@ %@ %@ removed, total message count %d - %@");
        }
      }
    }

    if (!v12) {
      [(id)v13 setUnderlyingSocketPairMessage:0];
    }
    objc_msgSend(v12, "setContext:", 0, v48, v49, v50, v51, v52);
    [v12 setCancelled:1];
  }
}

- (BOOL)_messageIsAllowedToSendMessageOnTopic:(id)a3
{
  id v4 = a3;
  if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceWithPushTopic:v4]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allowedTrafficClasses]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allowedTrafficClasses]);

    if ((_IDSIsTrafficAllowed(v9, v7) & 1) == 0)
    {
      uint64_t v11 = OSLogHandleForTransportCategory("UTunConnection");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v4;
        __int16 v25 = 2112;
        double v26 = v7;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Message on service %@ not allowed! Attempted to send on traffic classes: %@ Permitted traffic classes: %@",  buf,  0x20u);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          unsigned __int8 v21 = v7;
          double v22 = v9;
          id v20 = v4;
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Message on service %@ not allowed! Attempted to send on traffic classes: %@ Permitted traffic classes: %@");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            unsigned __int8 v21 = v7;
            double v22 = v9;
            id v20 = v4;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Message on service %@ not allowed! Attempted to send on traffic classes: %@ Permitted traffic classes: %@");
          }
        }
      }

      if (objc_msgSend(v9, "count", v20, v21, v22))
      {
        BOOL v10 = 0;
        goto LABEL_13;
      }

      uint64_t v16 = OSLogHandleForTransportCategory("UTunConnection");
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Overriding previous decision on message for topic %@ due to feature flag that allows messages will empty traffic classes",  buf,  0xCu);
      }

      uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
      if ((_DWORD)v19)
      {
        if (_IDSShouldLogTransport(v19))
        {
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Overriding previous decision on message for topic %@ due to feature flag that allows messages will empty traffic classes");
          if (_IDSShouldLog(0LL, @"UTunConnection")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Overriding previous decision on message for topic %@ due to feature flag that allows messages will empty traffic classes");
          }
        }
      }
    }

    BOOL v10 = 1;
LABEL_13:

    goto LABEL_14;
  }

  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (NSArray)supportedMessageTypes
{
  return self->_supportedMessageTypes;
}

- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 length])
  {
    -[NSMutableSet removeAllObjects](self->_admissionDeniedTopics, "removeAllObjects");
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    unint64_t v9 = v8;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10024AC9C;
    v25[3] = &unk_1008F6010;
    v25[4] = self;
    int64_t priority = self->_priority;
    uint64_t v11 = v25;
    goto LABEL_6;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:self->_priority];

  if (v4)
  {
    if (-[NSMutableSet containsObject:](self->_admissionDeniedTopics, "containsObject:", v6))
    {
      -[NSMutableSet removeObject:](self->_admissionDeniedTopics, "removeObject:", v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
      unint64_t v9 = v8;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10024ACA4;
      v24[3] = &unk_1008F6010;
      v24[4] = self;
      int64_t priority = self->_priority;
      uint64_t v11 = v24;
LABEL_6:
      [v8 performBlockWithPriority:v11 priority:priority];
    }
  }

  else
  {
    uint64_t v20 = 0LL;
    unsigned __int8 v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    char v23 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages"));
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = sub_10024ACAC;
    unsigned int v17 = &unk_1008FEC38;
    id v13 = v6;
    id v18 = v13;
    uint64_t v19 = &v20;
    [v12 enumerateObjectsWithOptions:2 usingBlock:&v14];

    if (*((_BYTE *)v21 + 24)) {
      -[NSMutableSet addObject:](self->_admissionDeniedTopics, "addObject:", v13, v14, v15, v16, v17);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (BOOL)checkServiceCompability:(id)a3 localMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 minCompatibilityVersion]
    || self->_newServiceSupported
    && ([v7 minCompatibilityVersion] == (id)1
     || self->_newServiceSupported
     && (unint64_t serviceMinCompatibilityVersion = self->_serviceMinCompatibilityVersion,
         (unint64_t)[v7 minCompatibilityVersion] <= serviceMinCompatibilityVersion)))
  {
    BOOL v18 = 1;
  }

  else
  {
    id v9 = objc_alloc(&OBJC_CLASS___IDSLocalMessageDeliveryServiceNotCompatibleMetric);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 awdTopic]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 toDeviceID]);
    uint64_t v12 = IDSDeviceDefaultPairedDeviceUniqueID;
    id v13 = objc_msgSend( v9,  "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:",  v10,  objc_msgSend(v11, "isEqualToString:", IDSDeviceDefaultPairedDeviceUniqueID),  0,  0,  3,  0,  objc_msgSend(v7, "priority"));

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v14 logMetric:v13];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 awdTopic]);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 toDeviceID]);
    objc_msgSend( v15,  "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:",  v16,  objc_msgSend(v17, "isEqualToString:", v12),  0,  0,  3,  0,  objc_msgSend(v7, "priority"));

    -[IDSUTunConnection _removeSocketPairMessage:localMessage:reason:responseCode:]( self,  "_removeSocketPairMessage:localMessage:reason:responseCode:",  v6,  v7,  @"remote does not support new service",  23LL);
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)supportsMessageOfType:(int64_t)a3
{
  supportedMessageTypes = self->_supportedMessageTypes;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  LOBYTE(supportedMessageTypes) = -[NSArray containsObject:](supportedMessageTypes, "containsObject:", v4);

  return (char)supportedMessageTypes;
}

- (BOOL)_nonBTAllowedForClientID:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v5 = [v4 nonBluetoothAvailableForBundleId:v3];

  return v5;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance");
}

- (id)_now
{
  return +[NSDate date](&OBJC_CLASS___NSDate, "date");
}

- (unsigned)_calculateRandomDelayForCloudMessagingRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"cloud-messaging-on-the-hour-max-delay-in-ms"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    id v7 = [v4 intValue];
    uint64_t v8 = OSLogHandleForTransportCategory("UTunConnection");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = @"cloud-messaging-on-the-hour-max-delay-in-ms";
      __int16 v33 = 1024;
      int v34 = (int)v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Server Bag {%@:%d}", buf, 0x12u);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        __int16 v27 = @"cloud-messaging-on-the-hour-max-delay-in-ms";
        id v29 = v7;
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Server Bag {%@:%d}");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          __int16 v27 = @"cloud-messaging-on-the-hour-max-delay-in-ms";
          id v29 = v7;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Server Bag {%@:%d}");
        }
      }
    }
  }

  else
  {
    LODWORD(v7) = 2000;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance", v27, v29));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"cloud-messaging-top-of-the-hour-definition-in-seconds"]);

  if (v13 && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
  {
    id v16 = [v13 intValue];
    uint64_t v17 = OSLogHandleForTransportCategory("UTunConnection");
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = @"cloud-messaging-top-of-the-hour-definition-in-seconds";
      __int16 v33 = 1024;
      int v34 = (int)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Server Bag {%@:%d}", buf, 0x12u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        id v28 = @"cloud-messaging-top-of-the-hour-definition-in-seconds";
        id v30 = v16;
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Server Bag {%@:%d}");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v28 = @"cloud-messaging-top-of-the-hour-definition-in-seconds";
          id v30 = v16;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Server Bag {%@:%d}");
        }
      }
    }
  }

  else
  {
    LODWORD(v16) = 5;
  }

  unsigned __int8 v21 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _now](self, "_now"));
  if (v22) {
    char v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v21, "components:fromDate:", 192LL, v22));
  }
  else {
    char v23 = 0LL;
  }
  id v24 = objc_msgSend(v23, "minute", v28, v30);
  else {
    uint32_t v25 = 0;
  }

  return v25;
}

- (void)_assertQuickRelayForCloudMessaging
{
  if (self->_shouldUseIPsecLink)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
    unsigned __int8 v4 = [v3 isTerminusConnected];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = -[IDSUTunConnection _calculateRandomDelayForCloudMessagingRequest]( self,  "_calculateRandomDelayForCloudMessagingRequest");
      uint64_t v6 = OSLogHandleForTransportCategory("UTunConnection");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        BOOL v18 = self;
        __int16 v19 = 1024;
        int v20 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ Assert QuickRelay after %d ms",  buf,  0x12u);
      }

      uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
      if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
      {
        id v13 = self;
        uint64_t v14 = v5;
        _IDSLogTransport(@"UTunConnection", @"IDS", @"%@ Assert QuickRelay after %d ms");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v13 = self;
          uint64_t v14 = v5;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ Assert QuickRelay after %d ms");
        }
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance",  v13,  v14));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10024B5A4;
      v16[3] = &unk_1008F6010;
      v16[4] = self;
      [v10 performBlockMainQueue:v16 afterTimeMSec:v5];
    }
  }

  else
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    unsigned int v11 = -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection");
    p_uniqueID = &self->_uniqueID;
    if (v11) {
      p_uniqueID = (NSString **)&kIDSDefaultPairedDeviceID;
    }
    [v15 startGlobalLinkForDevice:*p_uniqueID];
  }

- (void)_dequeueMessages
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  unint64_t v174 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 1LL);
  unint64_t v175 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 0LL);
  unint64_t v173 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 2LL);
  -[IDSUTunConnection _invalidateMessagesDequeueTimer](self, "_invalidateMessagesDequeueTimer");
  if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection")
    && !self->_isCloudEnabled
    && -[IDSUTunConnection supportsMessageOfType:](self, "supportsMessageOfType:", 6LL)
    && !-[IDSUTunConnection _inflightMessageCountForType:](self, "_inflightMessageCountForType:", 6LL))
  {
    -[IDSUTunConnection _handleBecomingEmptyOfCloudMessages](self, "_handleBecomingEmptyOfCloudMessages");
  }

  if (self->_isCloudEnabled && !-[IDSUTunConnection _inflightMessageCount](self, "_inflightMessageCount")) {
    -[IDSUTunConnection _handleBecomingEmptyOfCloudMessages](self, "_handleBecomingEmptyOfCloudMessages");
  }
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSocketPairConnectionProtocol inFlightMessages](self->_socketConnection, "inFlightMessages"));
  id v5 = [v4 count];
  if ((unint64_t)v5 >= 7)
  {
    uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v187 = self;
      __int16 v188 = 2048;
      *(void *)v189 = v5;
      *(_WORD *)&v189[8] = 1024;
      *(_DWORD *)v190 = 6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ utun socket pair connection inFlightMessageCount %lu (max %u) - do not dequeue",  buf,  0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ utun socket pair connection inFlightMessageCount %lu (max %u) - do not dequeue");
    }

    goto LABEL_200;
  }

  admissionDeniedTopics = self->_admissionDeniedTopics;
  if (!admissionDeniedTopics)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    unsigned int v11 = self->_admissionDeniedTopics;
    self->_admissionDeniedTopics = v10;

    admissionDeniedTopics = self->_admissionDeniedTopics;
  }

  v184[0] = _NSConcreteStackBlock;
  v184[1] = 3221225472LL;
  v184[2] = sub_10024D370;
  v184[3] = &unk_1008FEC60;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", admissionDeniedTopics));
  id v185 = v12;
  [v4 enumerateObjectsUsingBlock:v184];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_tokenToOTREncryptionQueue, "allValues"));
  v182[0] = _NSConcreteStackBlock;
  v182[1] = 3221225472LL;
  v182[2] = sub_10024D3BC;
  v182[3] = &unk_1008FEC88;
  id v14 = v12;
  id v183 = v14;
  [v13 enumerateObjectsUsingBlock:v182];
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog UTunConnection](&OBJC_CLASS___IDSFoundationLog, "UTunConnection"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    unint64_t v17 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
    *(_DWORD *)buf = 138412802;
    v187 = self;
    __int16 v188 = 2112;
    *(void *)v189 = identifier;
    *(_WORD *)&v189[8] = 2048;
    *(void *)v190 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%@ _dequeueMessage - %@ messageCount %lu",  buf,  0x20u);
  }

  if (qword_1009C0790 != -1) {
    dispatch_once(&qword_1009C0790, &stru_1008FECA8);
  }
  if (byte_1009C0788)
  {
    uint64_t v18 = OSLogHandleForIDSCategory("Warning");
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "**** Local IDS connectivity is disabled, only using cloud ****",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v20))
    {
      _IDSWarnV(@"IDSFoundation", @"**** Local IDS connectivity is disabled, only using cloud ****");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"**** Local IDS connectivity is disabled, only using cloud ****");
      _IDSLogTransport( @"Warning",  @"IDS",  @"**** Local IDS connectivity is disabled, only using cloud ****");
    }

    goto LABEL_199;
  }

  if (self->_isCloudEnabled)
  {
    uint64_t v21 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isCloudEnabled = self->_isCloudEnabled;
      unsigned int v24 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
      uint32_t v25 = @"YES";
      *(_DWORD *)buf = 138412802;
      v187 = self;
      if (!isCloudEnabled) {
        uint32_t v25 = @"NO";
      }
      __int16 v188 = 2112;
      *(void *)v189 = v25;
      *(_WORD *)&v189[8] = 1024;
      *(_DWORD *)v190 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "UTunConnection _isCloudEnabled:%@ (%@, messageCount:%d)",  buf,  0x1Cu);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27 && _IDSShouldLogTransport(v27))
    {
      id v28 = @"YES";
      id v29 = self->_isCloudEnabled ? @"YES" : @"NO";
      v137 = (IMPowerAssertion *)v29;
      unint64_t v138 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count");
      v135 = self;
      _IDSLogTransport( @"UTunConnection",  @"IDS",  @"UTunConnection _isCloudEnabled:%@ (%@, messageCount:%d)");
      if (_IDSShouldLog(0LL, @"UTunConnection"))
      {
        if (!self->_isCloudEnabled) {
          id v28 = @"NO";
        }
        unint64_t v30 = -[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count", self, v29, v138);
        v137 = (IMPowerAssertion *)v28;
        unint64_t v138 = v30;
        v135 = self;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"UTunConnection _isCloudEnabled:%@ (%@, messageCount:%d)");
      }
    }

    if (-[IDSLocalDeliveryQueue count](self->_deliveryQueue, "count", v135, v137, v138)) {
      -[IDSUTunConnection _assertQuickRelayForCloudMessaging](self, "_assertQuickRelayForCloudMessaging");
    }
  }

  if (self->_shouldUseIPsecLink)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
    unsigned __int8 v32 = [v31 isTerminusConnected];
  }

  else
  {
    unsigned __int8 v32 = 1;
  }

  if (!-[IDSUTunConnection isConnected](self, "isConnected")
    || (self->_isCloudEnabled ? (char v33 = 1) : (char v33 = v32), (v33 & 1) == 0))
  {
    uint64_t v128 = OSLogHandleForIDSCategory("UTunConnection");
    v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v130 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v187 = (IDSUTunConnection *)v130;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "%@ is not available, waiting.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v131)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ is not available, waiting.");
    }

    goto LABEL_199;
  }

  if (v5 == (id)6) {
    goto LABEL_190;
  }
  uint64_t v34 = 0LL;
  uint64_t v168 = 6LL - (void)v5;
  remoteInstanceID = self->_remoteInstanceID;
  while (2)
  {
    uint64_t v171 = v34;
    context = objc_autoreleasePoolPush();
    id v35 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSLocalDeliveryQueue nextSocketPairMessageNotOnServices:]( self->_deliveryQueue,  "nextSocketPairMessageNotOnServices:",  v14));
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection context](v35, "context"));
    if (!v35)
    {
      if (!-[NSMutableArray count](self->_sendingMessages, "count")) {
        -[IDSUTunConnection _clearSendingPowerAssertionWithReason:]( self,  "_clearSendingPowerAssertionWithReason:",  @"No messages waiting for acks");
      }
      goto LABEL_189;
    }

    uint64_t v37 = 0LL;
    while (1)
    {
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v36 topic]);

      if (!-[IDSUTunConnection _messageIsAllowedToSendMessageOnTopic:]( self,  "_messageIsAllowedToSendMessageOnTopic:",  v38))
      {
        [v36 setDeniedToSend:1];
        uint64_t v39 = OSLogHandleForTransportCategory("UTunConnection");
        unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v41 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue([v36 messageUUID]);
          *(_DWORD *)buf = 138412290;
          v187 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Message with guid %@ not allowed due to its traffic class",  buf,  0xCu);
        }

        uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
        if ((_DWORD)v43)
        {
          if (_IDSShouldLogTransport(v43))
          {
            v135 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue([v36 messageUUID]);
            _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Message with guid %@ not allowed due to its traffic class");

            if (_IDSShouldLog(0LL, @"UTunConnection"))
            {
              v135 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "messageUUID", v135));
              _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Message with guid %@ not allowed due to its traffic class");
            }
          }
        }

        goto LABEL_63;
      }

      if (-[IDSUTunConnection checkServiceCompability:localMessage:]( self,  "checkServiceCompability:localMessage:",  v35,  v36))
      {
        break;
      }

- (void)trafficClassesChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  unsigned __int8 v4 = self->_sendingMessages;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v28 + 1) + 8 * (void)v8) context]);
        [v9 setDeniedToSend:0];

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
    }

    while (v6);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v10 = self->_fallbackMessages;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v24,  v33,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) setDeniedToSend:0];
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v24,  v33,  16LL);
    }

    while (v12);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages", 0LL));
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      __int16 v19 = 0LL;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) setDeniedToSend:0];
        __int16 v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }

    while (v17);
  }

  -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages");
}

- (void)clearStats
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  -[IDSLocalDeliveryQueue clearStats](self->_deliveryQueue, "clearStats");
}

- (void)_clearSendingPowerAssertionWithReason:(id)a3
{
  id v4 = a3;
  if (self->_sendingPowerAssertion)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("UTunConnection");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing power assertion: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v7)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Clearing power assertion: %@");
    }

    sendingPowerAssertion = self->_sendingPowerAssertion;
    self->_sendingPowerAssertion = 0LL;
  }
}

- (void)_sendSocketMessage:(id)a3
{
}

- (void)_sendSocketMessage:(id)a3 ignoreSequenceNumber:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:self->_priority];

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 context]);
  uint64_t v9 = (void *)v8;
  if (!a4)
  {
    if ((objc_opt_respondsToSelector(v6, "sequenceNumber") & 1) != 0)
    {
      uint64_t v8 = (uint64_t)[v6 sequenceNumber];
      id v10 = (id)v8;
LABEL_4:
      int v11 = 1;
      goto LABEL_13;
    }

    uint64_t v8 = objc_opt_respondsToSelector(v6, "setSequenceNumber:");
    if ((v8 & 1) != 0)
    {
      id v10 = [v9 messageID];
      [v6 setSequenceNumber:v10];
      uint64_t v12 = OSLogHandleForTransportCategory("UTunConnection");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = (_DWORD)v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "* Sending message with sequence number %u",  buf,  8u);
      }

      uint64_t v8 = os_log_shim_legacy_logging_enabled(v14);
      if ((_DWORD)v8)
      {
        uint64_t v8 = _IDSShouldLogTransport(v8);
        if ((_DWORD)v8)
        {
          _IDSLogTransport(@"UTunConnection", @"IDS", @"* Sending message with sequence number %u");
          uint64_t v8 = _IDSShouldLog(0LL, @"UTunConnection");
          if ((_DWORD)v8) {
            uint64_t v8 = _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"* Sending message with sequence number %u");
          }
        }
      }

      goto LABEL_4;
    }
  }

  id v10 = 0LL;
  int v11 = 0;
LABEL_13:
  IMTimeOfDay(v8);
  objc_msgSend(v9, "setTimeSent:");
  if (!a4)
  {
    uint64_t v15 = OSLogHandleForIDSCategory("UTunConnection");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      unsigned int v18 = [v9 messageID];
      __int16 v19 = v11
          ? (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"with sequenceNumber %u",  v10))
          : &stru_100912B50;
      *(_DWORD *)buf = 138413058;
      __int128 v23 = identifier;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      __int128 v27 = v19;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Sending message[%lu] %@ %@.", buf, 0x2Au);
      if (v11) {
    }
      }

    if (os_log_shim_legacy_logging_enabled(v20)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      [v9 messageID];
      if ((v11 & 1) != 0)
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"with sequenceNumber %u",  v10));
        _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ Sending message[%lu] %@ %@.");
      }

      else
      {
        _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"%@ Sending message[%lu] %@ %@.");
      }
    }
  }

  kdebug_trace(722010244LL, v10, 0LL, 0LL, 0LL);
  if (-[IDSUTunConnection _messageHasValidEncryptionStatus:](self, "_messageHasValidEncryptionStatus:", v6)) {
    -[IDSSocketPairConnectionProtocol sendDataMessage:canFragment:]( self->_socketConnection,  "sendDataMessage:canFragment:",  v6,  -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"));
  }
  else {
    -[IDSUTunConnection _sendEncryptedMessage:](self, "_sendEncryptedMessage:", v6);
  }
}

- (void)_updateDictionary:(id)a3 addMessageSize:(int64_t)a4 addMessageCount:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v9 assertRunningWithPriority:self->_priority];

  id v17 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"localDeliveryQueueStatMessageCount"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"localDeliveryQueueStatBytes"]);
  int v11 = (char *)[v17 unsignedLongLongValue];
  uint64_t v12 = (char *)[v10 unsignedLongLongValue];
  uint64_t v13 = &v11[a5];
  uint64_t v14 = &v12[a4];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v13));
  [v8 setObject:v15 forKey:@"localDeliveryQueueStatMessageCount"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14));
  [v8 setObject:v16 forKey:@"localDeliveryQueueStatBytes"];
}

- (void)_addMessageSize:(unint64_t)a3 forTopic:(id)a4 direction:(unsigned __int8)a5 dataProtectionClass:(unsigned int)a6 isResource:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  int v9 = a5;
  id v12 = a4;
  if (!v12) {
    goto LABEL_30;
  }
  if (v9 == 1)
  {
    uint64_t v21 = 6LL;
LABEL_16:
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(-[objc_class objectForKey:]((&self->super.isa)[v21], "objectForKey:", v12));
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    -[IDSUTunConnection _updateDictionary:addMessageSize:addMessageCount:]( self,  "_updateDictionary:addMessageSize:addMessageCount:",  Mutable,  a3,  !v7);
    Class v23 = (&self->super.isa)[v21];
    if (!v23)
    {
      __int16 v24 = (objc_class *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      Class v25 = (&self->super.isa)[v21];
      (&self->super.isa)[v21] = v24;

      Class v23 = (&self->super.isa)[v21];
    }

    -[objc_class setObject:forKey:](v23, "setObject:forKey:", Mutable, v12);
    uint64_t v26 = OSLogHandleForIDSCategory("IDSUTunConnection");
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      int64_t priority = self->_priority;
      Class v29 = (&self->super.isa)[v21];
      *(_DWORD *)buf = 136315906;
      id v35 = "-[IDSUTunConnection _addMessageSize:forTopic:direction:dataProtectionClass:isResource:]";
      __int16 v36 = 1024;
      int v37 = priority;
      __int16 v38 = 1024;
      int v39 = v9;
      __int16 v40 = 2112;
      Class v41 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%s: priority %d updated direction %d stats %@",  buf,  0x22u);
    }

    if (os_log_shim_legacy_logging_enabled(v30)
      && _IDSShouldLog(1LL, @"IDSUTunConnection"))
    {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSUTunConnection",  @"%s: priority %d updated direction %d stats %@");
    }

    goto LABEL_30;
  }

  if (!v9)
  {
    if (!v7)
    {
      statistics = self->_statistics;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
      uint64_t v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statistics, "objectForKey:", v14));

      if (!self->_statistics)
      {
        id v16 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        id v17 = self->_statistics;
        self->_statistics = v16;
      }

      if (!v15)
      {
        uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unsigned int v18 = self->_statistics;
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
        -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v15, v19);
      }

      CFMutableDictionaryRef v20 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v15, "objectForKey:", v12));
      if (!v20) {
        CFMutableDictionaryRef v20 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      -[IDSUTunConnection _updateDictionary:addMessageSize:addMessageCount:]( self,  "_updateDictionary:addMessageSize:addMessageCount:",  v20,  a3,  1LL);
      if (!v15) {
        uint64_t v15 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      }
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v20, v12);
    }

    uint64_t v21 = 5LL;
    goto LABEL_16;
  }

  uint64_t v31 = OSLogHandleForIDSCategory("Warning");
  unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v35 = "-[IDSUTunConnection _addMessageSize:forTopic:direction:dataProtectionClass:isResource:]";
    __int16 v36 = 1024;
    int v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s: statsDictionary is nil for direction %d",  buf,  0x12u);
  }

  if (os_log_shim_legacy_logging_enabled(v33))
  {
    _IDSWarnV(@"IDSFoundation", @"%s: statsDictionary is nil for direction %d");
    _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"%s: statsDictionary is nil for direction %d");
    _IDSLogTransport(@"Warning", @"IDS", @"%s: statsDictionary is nil for direction %d");
  }

- (void)_addIncomingMessageSize:(unint64_t)a3 forTopic:(id)a4
{
}

- (void)_addOutgoingMessageSize:(unint64_t)a3 forTopic:(id)a4 dataProtectionClass:(unsigned int)a5 isResource:(BOOL)a6
{
  self->_cachedBytes[a5] = -1LL;
}

- (void)_removeMessageFromStatistics:(id)a3
{
  id v17 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v17 topic]);
  id v5 = [v17 dataProtectionClass];
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = v5;
  statistics = self->_statistics;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  int v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statistics, "objectForKey:", v8));

  if (!self->_statistics)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v14 = self->_statistics;
    self->_statistics = Mutable;

    if (v9) {
      goto LABEL_4;
    }
LABEL_8:
    int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v15 = self->_statistics;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v9, v16);

    goto LABEL_4;
  }

  if (!v9) {
    goto LABEL_8;
  }
LABEL_4:
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v4));
  if (v10)
  {
    -[IDSUTunConnection _updateDictionary:addMessageSize:addMessageCount:]( self,  "_updateDictionary:addMessageSize:addMessageCount:",  v10,  -(uint64_t)[v17 sentMessageDataSize],  -1);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"localDeliveryQueueStatMessageCount"]);
    id v12 = [v11 unsignedLongLongValue];

    if (v12) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v4);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v4);
    }
    self->_cachedBytes[v6] = -1LL;
  }

LABEL_12:
}

- (unint64_t)_pendingOutgoingBytesForClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  unint64_t result = self->_cachedBytes[v3];
  if ((result & 0x8000000000000000LL) != 0)
  {
    cachedBytes = self->_cachedBytes;
    uint64_t v30 = v3;
    __int16 v28 = self;
    unsigned int v29 = v3;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[IDSLocalDeliveryQueue statisticsForDataProtectionClass:]( self->_deliveryQueue,  "statisticsForDataProtectionClass:",  v3));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v34 allKeys]);
    id v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v7)
    {
      id v8 = v7;
      int64_t v9 = 0LL;
      uint64_t v10 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * (void)i)]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"localDeliveryQueueStatBytes"]);
          uint64_t v14 = (uint64_t)[v13 unsignedLongLongValue];

          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"localDeliveryQueueStatMessageCount"]);
          id v16 = [v15 unsignedLongLongValue];

          v9 += (v14 & ~(v14 >> 63)) + 12288LL * (void)v16;
        }

        id v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }

      while (v8);
    }

    else
    {
      int64_t v9 = 0LL;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunConnection _sendingMessageStatisticsForClass:]( v28,  "_sendingMessageStatisticsForClass:",  v29));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id obja = v18;
    id v19 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(obja);
          }
          Class v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)]);
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"localDeliveryQueueStatBytes"]);
          Class v25 = (char *)[v24 unsignedLongLongValue];

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"localDeliveryQueueStatMessageCount"]);
          id v27 = [v26 unsignedLongLongValue];

          v9 += (int64_t)&v25[12288 * (void)v27];
        }

        id v20 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
      }

      while (v20);
    }

    cachedBytes[v30] = v9;
    return cachedBytes[v30];
  }

  return result;
}

- (double)_dequeueMessagesTimerInterval
{
  return 600.0;
}

- (void)_startMessagesDequeueMessagesTimer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  if (self->_dequeueTimer)
  {
    uint64_t v4 = OSLogHandleForTransportCategory("UTunConnection");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Request to start messageDequeueTimer ignored -- timer already running",  v21,  2u);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7 && _IDSShouldLogTransport(v7))
    {
      _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Request to start messageDequeueTimer ignored -- timer already running");
      if (_IDSShouldLog(0LL, @"UTunConnection")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Request to start messageDequeueTimer ignored -- timer already running");
      }
    }
  }

  else
  {
    uint64_t v8 = OSLogHandleForTransportCategory("UTunConnection");
    int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting messageDequeueTimer", buf, 2u);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Starting messageDequeueTimer");
      }
    }

    id v12 = objc_alloc(&OBJC_CLASS___IMTimer);
    id v13 = -[IDSUTunConnection _dequeueMessagesTimerInterval](self, "_dequeueMessagesTimerInterval");
    double v15 = v14;
    uint64_t v17 = im_primary_queue(v13, v16);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v12,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  @"com.apple.identityservices.IDSUTunConnection-dequeueMessages",  1LL,  self,  "_dequeueMessagesTimerDidFire:",  0LL,  v18,  v15);
    dequeueTimer = self->_dequeueTimer;
    self->_dequeueTimer = v19;
  }

- (void)_dequeueTimerFiredOnMain:(id)a3
{
  id v4 = a3;
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10024E960;
  v9[3] = &unk_1008F5F80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)_invalidateMessagesDequeueTimer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  dequeueTimer = self->_dequeueTimer;
  if (dequeueTimer)
  {
    -[IMTimer invalidate](dequeueTimer, "invalidate");
    uint64_t v5 = self->_dequeueTimer;
    self->_dequeueTimer = 0LL;
  }

- (void)_dequeueMessagesTimerDidFire:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10024EA44;
  v5[3] = &unk_1008F6010;
  v5[4] = self;
  [v4 performBlockWithPriority:v5 priority:self->_priority];
}

- (void)_requeueSendingMessage:(id)a3
{
  id v7 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSSocketPairResourceTransferSender, v4);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0) {
    [v7 reset];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
  if (v6)
  {
    -[IDSLocalDeliveryQueue pushMessage:](self->_deliveryQueue, "pushMessage:", v6);
    -[IDSUTunConnection _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v6);
  }
}

- (void)_requeueMessages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"-"]);
  if ((unint64_t)[v5 count] > 2)
  {
    id v9 = v5;
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("Warning");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "_otrTokenToArray: invalid OTR token %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      _IDSWarnV(@"IDSFoundation", @"_otrTokenToArray: invalid OTR token %@");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"_otrTokenToArray: invalid OTR token %@");
      id v25 = v4;
      _IDSLogTransport(@"Warning", @"IDS", @"_otrTokenToArray: invalid OTR token %@");
    }

    id v9 = 0LL;
  }

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    unsigned int v12 = [v10 isEqualToString:@"idsotr"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:2]);
    double v14 = v13;
    if (v12)
    {
      unsigned int v15 = [v13 intValue];

      sendingMessages = self->_sendingMessages;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10024EFDC;
      v33[3] = &unk_1008FECD0;
      unsigned int v35 = v15;
      v33[4] = self;
      uint64_t v34 = v11;
      -[NSMutableArray enumerateObjectsWithOptions:usingBlock:]( sendingMessages,  "enumerateObjectsWithOptions:usingBlock:",  2LL,  v33);
    }

    else
    {
      int v17 = [v13 BOOLValue];

      unsigned int v18 = self->_sendingMessages;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10024F0A0;
      v28[3] = &unk_1008FECF8;
      char v32 = v17;
      id v29 = v10;
      uint64_t v30 = self;
      uint64_t v31 = v11;
      -[NSMutableArray enumerateObjectsWithOptions:usingBlock:]( v18,  "enumerateObjectsWithOptions:usingBlock:",  2LL,  v28);
    }

    if (-[NSMutableIndexSet count](v11, "count", v25))
    {
      -[NSMutableArray removeObjectsAtIndexes:](self->_sendingMessages, "removeObjectsAtIndexes:", v11);
      uint64_t v19 = OSLogHandleForTransportCategory("UTunConnection");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = -[NSMutableIndexSet count](v11, "count");
        *(_DWORD *)buf = 134218242;
        id v37 = v21;
        __int16 v38 = 2112;
        id v39 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Requeued %lu sending messages for %@.",  buf,  0x16u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          id v26 = -[NSMutableIndexSet count](v11, "count");
          id v27 = v4;
          _IDSLogTransport(@"UTunConnection", @"IDS", @"Requeued %lu sending messages for %@.");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            id v26 = -[NSMutableIndexSet count](v11, "count", v26, v4);
            id v27 = v4;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Requeued %lu sending messages for %@.");
          }
        }
      }
    }

    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_tokenToOTREncryptionQueue,  "objectForKey:",  v4,  v26,  v27));
    [v24 removeAllObjects];

    -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages");
  }
}

- (void)handleOTRNegotiationComplete:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v4 assertRunningWithPriority:self->_priority];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v5 setSessionReady:v6];

  -[IDSUTunConnection _requeueMessages:](self, "_requeueMessages:", v6);
}

- (void)handleOTRNegotiationTimeout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"-"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);

  if ([v7 isEqualToString:@"idsotr"] && !self->_useSharedOTRSession)
  {
    uint64_t v21 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "OTR negotiation timed out for %@ but remote device doesn't support shared session.",  buf,  0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        id v28 = v4;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"OTR negotiation timed out for %@ but remote device doesn't support shared session.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v28 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"OTR negotiation timed out for %@ but remote device doesn't support shared session.");
        }
      }
    }

    tokenToOTRError = self->_tokenToOTRError;
    if (!tokenToOTRError)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      id v27 = self->_tokenToOTRError;
      self->_tokenToOTRError = Mutable;

      tokenToOTRError = self->_tokenToOTRError;
    }

    -[NSMutableDictionary setObject:forKey:](tokenToOTRError, "setObject:forKey:", &__kCFBooleanFalse, v4, v28);
    -[IDSUTunConnection _requeueMessages:](self, "_requeueMessages:", v4);
  }

  else if (-[IDSUTunConnection isConnected](self, "isConnected"))
  {
    uint64_t v8 = OSLogHandleForTransportCategory("UTunConnection");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "OTR negotiation timed out for %@, retry.",  buf,  0xCu);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        id v28 = v4;
        _IDSLogTransport(@"UTunConnection", @"IDS", @"OTR negotiation timed out for %@, retry.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v28 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"OTR negotiation timed out for %@, retry.");
        }
      }
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance", v28));
    [v12 startOTRNegotiationWithDeviceIfNeeded:IDSDeviceDefaultPairedDeviceUniqueID token:v4 reset:1 errorHandler:0];
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("UTunConnection");
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "OTR negotiation timed out for %@, clear error state and requeue all messages.",  buf,  0xCu);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        id v28 = v4;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"OTR negotiation timed out for %@, clear error state and requeue all messages.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v28 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"OTR negotiation timed out for %@, clear error state and requeue all messages.");
        }
      }
    }

    int v17 = self->_tokenToOTRError;
    if (!v17)
    {
      unsigned int v18 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v19 = self->_tokenToOTRError;
      self->_tokenToOTRError = v18;

      int v17 = self->_tokenToOTRError;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL, v28));
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v20, v4);

    -[IDSUTunConnection _requeueMessages:](self, "_requeueMessages:", v4);
  }
}

- (void)setEnableOTR:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (self->_enableOTR != v3)
  {
    self->_enableOTR = v3;
    if (v3)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10024F990;
      v22[3] = &unk_1008FED20;
      v22[4] = self;
      [v6 addOTRSessionBlock:1 sessionBlock:v22 key:self->_otrTokenIdentifier];

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10024F99C;
      v21[3] = &unk_1008FED20;
      v21[4] = self;
      [v7 addOTRSessionBlock:2 sessionBlock:v21 key:self->_otrTokenIdentifier];

      if (self->_supportsLegacyOTRSessionToken)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10024F9A8;
        v20[3] = &unk_1008FED20;
        v20[4] = self;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_priority));
        [v8 addOTRSessionBlock:1 sessionBlock:v20 key:v9];

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10024F9B4;
        v19[3] = &unk_1008FED20;
        v19[4] = self;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_priority));
        [v10 addOTRSessionBlock:2 sessionBlock:v19 key:v11];
      }
    }

    -[NSMutableDictionary removeAllObjects](self->_tokenToOTRError, "removeAllObjects");
    uint64_t v12 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = @"Enable";
      BOOL v15 = !self->_enableOTR;
      int64_t priority = self->_priority;
      *(_DWORD *)buf = 138412802;
      if (v15) {
        double v14 = @"Disable";
      }
      uint64_t v24 = v14;
      __int16 v25 = 2048;
      id v26 = self;
      __int16 v27 = 2048;
      int64_t v28 = priority;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ OTR for UTunConnection %p, priority %ld",  buf,  0x20u);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18 && _IDSShouldLogTransport(v18))
    {
      _IDSLogTransport(@"UTunConnection", @"IDS", @"%@ OTR for UTunConnection %p, priority %ld");
      if (_IDSShouldLog(0LL, @"UTunConnection")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ OTR for UTunConnection %p, priority %ld");
      }
    }
  }

- (void)classStorageBecameAvailable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 queueForPriority:self->_priority]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10024FA70;
  v8[3] = &unk_1008F5F80;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)_encryptDataWithOTR:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0LL;
  double v8 = ids_monotonic_time(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _encryptionController](self, "_encryptionController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 OTREncryptData:v6 OTRToken:v7 priority:self->_priority error:&v23]);

  double v12 = ids_monotonic_time(v11);
  if (v23)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("Warning");
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to encrypt UTunConnection message! Error %ld",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15))
    {
      _IDSWarnV(@"IDSFoundation", @"Failed to encrypt UTunConnection message! Error %ld");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to encrypt UTunConnection message! Error %ld");
      _IDSLogTransport(@"Warning", @"IDS", @"Failed to encrypt UTunConnection message! Error %ld");
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    double v16 = v12 - v8;
    uint64_t v17 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v6 length];
      id v20 = [v10 length];
      *(_DWORD *)buf = 138413058;
      id v25 = v7;
      __int16 v26 = 2048;
      id v27 = v19;
      __int16 v28 = 2048;
      id v29 = v20;
      __int16 v30 = 2048;
      double v31 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Encrypted message for token %@  original size: %lu  encrypted size: %lu  elapsed: %.6f",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v21)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      [v6 length];
      [v10 length];
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Encrypted message for token %@  original size: %lu  encrypted size: %lu  elapsed: %.6f");
    }
  }

  return v10;
}

- (void)_sendOTREncryptedMessage:(id)a3 useEncryption:(BOOL)a4 streamID:(unsigned __int16)a5 forPriority:(int64_t)a6 flag:(int)a7 token:(id)a8
{
  unsigned __int16 v10 = a6;
  uint64_t v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a8;
  if (([v14 cancelled] & 1) == 0)
  {
    if (self->_shouldUseNWFraming)
    {
      -[IDSSocketPairConnectionProtocol sendDataMessage:canFragment:]( self->_socketConnection,  "sendDataMessage:canFragment:",  v14,  1LL);
      goto LABEL_18;
    }

    BOOL v16 = !self->_useSharedOTRSession;
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 underlyingData]);
    uint64_t v18 = (void *)v17;
    if (!v16)
    {
      if (!v17) {
        goto LABEL_18;
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 context]);
      unsigned int v20 = [v19 messageID];

      LODWORD(v34) = v20;
      id v21 = [[IDSSocketPairOTRMessage alloc] initWithVersion:1 encrypted:0 shouldEncrypt:v12 protectionClass:a7 streamID:v11 priority:v10 sequenceNumber:v34 data:v18];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 topic]);
      [v21 setTopic:v22];

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 context]);
      [v21 setContext:v23];

      -[IDSSocketPairConnectionProtocol sendDataMessage:canFragment:]( self->_socketConnection,  "sendDataMessage:canFragment:",  v21,  1LL);
LABEL_17:

      goto LABEL_18;
    }

    if (v12)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _encryptDataWithOTR:token:](self, "_encryptDataWithOTR:token:", v17, v15));

      uint64_t v18 = (void *)v24;
    }

    if (v18)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 context]);
      id v26 = [v25 messageID];

      uint64_t v27 = OSLogHandleForTransportCategory("UTunConnection");
      __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v38 = v15;
        __int16 v39 = 1024;
        BOOL v40 = v12;
        __int16 v41 = 1024;
        int v42 = (int)v26;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Send OTR message for %{public}@ E:%u SN:%u.",  buf,  0x18u);
      }

      uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
      if ((_DWORD)v30)
      {
        if (_IDSShouldLogTransport(v30))
        {
          BOOL v35 = v12;
          id v36 = v26;
          _IDSLogTransport(@"UTunConnection", @"IDS", @"Send OTR message for %{public}@ E:%u SN:%u.");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            BOOL v35 = v12;
            id v36 = v26;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Send OTR message for %{public}@ E:%u SN:%u.");
          }
        }
      }

      id v31 = objc_msgSend( [IDSSocketPairOTREncryptedMessage alloc],  "initWithVersion:encrypted:streamID:priority:sequenceNumber:fileXfer:data:",  1,  v12,  v11,  v10,  v26,  a7 != 0,  v18,  v35,  v36);
      char v32 = (void *)objc_claimAutoreleasedReturnValue([v14 topic]);
      [v31 setTopic:v32];

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v14 context]);
      [v31 setContext:v33];

      -[IDSSocketPairConnectionProtocol sendDataMessage:canFragment:]( self->_socketConnection,  "sendDataMessage:canFragment:",  v31,  1LL);
      goto LABEL_17;
    }
  }

- (void)_sendOTREncryptionQueue:(id)a3 streamID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:self->_priority];

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"-"]);
  if ((unint64_t)[v20 count] > 2)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:1]);
    signed int v12 = [v11 intValue];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:2]);
    id v14 = [v13 intValue];

    BOOL v15 = (_DWORD)v4 != 43258 && self->_enableOTR;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenToOTREncryptionQueue, "objectForKey:", v6));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v16);
          }
          -[IDSUTunConnection _sendOTREncryptedMessage:useEncryption:streamID:forPriority:flag:token:]( self,  "_sendOTREncryptedMessage:useEncryption:streamID:forPriority:flag:token:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i),  v15,  v4,  v12,  v14,  v6);
        }

        id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v17);
    }

    [v16 removeAllObjects];
  }

  else
  {
    uint64_t v8 = OSLogHandleForIDSCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "_sendOTREncryptionQueue: invalid OTR token %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v10))
    {
      _IDSWarnV(@"IDSFoundation", @"_sendOTREncryptionQueue: invalid OTR token %@");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"_sendOTREncryptionQueue: invalid OTR token %@");
      _IDSLogTransport(@"Warning", @"IDS", @"_sendOTREncryptionQueue: invalid OTR token %@");
    }
  }
}

- (void)_sendPublicKeyEncryptedMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_shouldUseNWFraming)
  {
    -[IDSSocketPairConnectionProtocol sendDataMessage:canFragment:]( self->_socketConnection,  "sendDataMessage:canFragment:",  v4,  1LL);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 underlyingData]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _encryptionController](self, "_encryptionController"));
    uniqueID = self->_uniqueID;
    int64_t priority = self->_priority;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100250868;
    v11[3] = &unk_1008FED48;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    id v10 = v6;
    [v7 legacyPublicKeyEncryptData:v10 withEncryptedAttributes:0 toDeviceID:uniqueID priority:priority completionBlock:v11];
  }
}

- (void)_sendEncryptedMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (v4)
  {
    if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 topic]);

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
      int64_t priority = (int64_t)[v8 priority];

      uint64_t v11 = objc_opt_class(&OBJC_CLASS___IDSSocketPairResourceTransferMessage, v10);
      char isKindOfClass = objc_opt_isKindOfClass(v4, v11);
      BOOL v13 = ((unint64_t)v7 | priority) != 0;
      if (!((unint64_t)v7 | priority))
      {
        int64_t priority = self->_priority;
        id v7 = @"com.apple.private.alloy.utunconnection";
      }

      if (self->_useSharedOTRSession)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceWithPushTopic:v7]);
        id v16 = [v15 dataProtectionClass];

        if (self->_useNamedOTRSessionToken)
        {
          id v17 = self->_otrTokenIdentifier;
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u-%1u-%@",  @"idsotr",  priority,  v16,  v17));

          goto LABEL_12;
        }

        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u-%1u",  @"idsotr",  priority,  v16));
      }

      else
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u-%1u",  v7,  priority,  isKindOfClass & 1));
      }

      uint64_t v18 = (void *)v19;
LABEL_12:
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 hashForString:v7]);
      unsigned __int16 v22 = (unsigned __int16)[v21 unsignedIntValue];

      if (!v13)
      {
        -[IDSUTunConnection _sendOTREncryptedMessage:useEncryption:streamID:forPriority:flag:token:]( self,  "_sendOTREncryptedMessage:useEncryption:streamID:forPriority:flag:token:",  v4,  0LL,  v22,  priority,  0LL,  v18);
LABEL_33:

        goto LABEL_34;
      }

      tokenToOTREncryptionQueue = self->_tokenToOTREncryptionQueue;
      if (!tokenToOTREncryptionQueue)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        id v25 = self->_tokenToOTREncryptionQueue;
        self->_tokenToOTREncryptionQueue = Mutable;

        tokenToOTREncryptionQueue = self->_tokenToOTREncryptionQueue;
      }

      id v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](tokenToOTREncryptionQueue, "objectForKey:", v18));
      id v27 = v26;
      if (v26)
      {
        -[NSMutableArray addObject:](v26, "addObject:", v4);
      }

      else
      {
        id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableArray addObject:](v27, "addObject:", v4);
        -[NSMutableDictionary setObject:forKey:](self->_tokenToOTREncryptionQueue, "setObject:forKey:", v27, v18);
      }

      if (self->_enableOTR)
      {
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
        unsigned __int8 v29 = [v28 isSessionReady:v18];

        if ((v29 & 1) == 0 && v22 != 43258)
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenToOTRError, "objectForKey:", v18));
          unsigned __int8 v31 = [v30 BOOLValue];

          if ((v31 & 1) != 0)
          {
            uint64_t v32 = OSLogHandleForTransportCategory("UTunConnection");
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v51[0] = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "OTR session negotiation for %@ is in progress",  buf,  0xCu);
            }

            uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
            if ((_DWORD)v35)
            {
              if (_IDSShouldLogTransport(v35))
              {
                _IDSLogTransport( @"UTunConnection",  @"IDS",  @"OTR session negotiation for %@ is in progress");
                if (_IDSShouldLog(0LL, @"UTunConnection")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"OTR session negotiation for %@ is in progress");
                }
              }
            }
          }

          else
          {
            tokenToOTRError = self->_tokenToOTRError;
            BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
            -[NSMutableDictionary setObject:forKey:](tokenToOTRError, "setObject:forKey:", v40, v18);

            uint64_t v41 = OSLogHandleForIDSCategory("UTunConnection");
            int v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              LODWORD(v51[0]) = v22;
              WORD2(v51[0]) = 2112;
              *(void *)((char *)v51 + 6) = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Waiting OTR session for %04x(%@) ...",  buf,  0x12u);
            }

            if (os_log_shim_legacy_logging_enabled(v43)
              && _IDSShouldLog(0LL, @"UTunConnection"))
            {
              uint64_t v46 = v22;
              unint64_t v47 = v18;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Waiting OTR session for %04x(%@) ...");
            }

            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[IDSOTRController sharedInstance]( &OBJC_CLASS___IDSOTRController,  "sharedInstance",  v46,  v47));
            uint64_t v45 = IDSDeviceDefaultPairedDeviceUniqueID;
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472LL;
            v48[2] = sub_1002512C0;
            v48[3] = &unk_1008FED70;
            v48[4] = self;
            id v49 = v4;
            [v44 startOTRNegotiationWithDeviceIfNeeded:v45 token:v18 reset:0 errorHandler:v48];
          }

          goto LABEL_32;
        }

        id v37 = self;
        id v38 = v18;
        uint64_t v36 = v22;
      }

      else
      {
        uint64_t v36 = v22;
        id v37 = self;
        id v38 = v18;
      }

      -[IDSUTunConnection _sendOTREncryptionQueue:streamID:](v37, "_sendOTREncryptionQueue:streamID:", v38, v36);
LABEL_32:

      goto LABEL_33;
    }

    -[IDSUTunConnection _sendPublicKeyEncryptedMessage:](self, "_sendPublicKeyEncryptedMessage:", v4);
  }

- (BOOL)_storeIncomingClassCDataMessageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  [v10 lock];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  unsigned __int8 v12 = [v11 isSessionStoreAvailableForDataProtectionClass:0];

  uint64_t v13 = IDSDataProtectionClassStringFromDataProtectionClass(0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_dataProtectedIncomingMessages,  "objectForKey:",  v14));
  id v16 = v15;
  if (v15) {
    unsigned __int8 v17 = 0;
  }
  else {
    unsigned __int8 v17 = v12;
  }
  if ((v17 & 1) != 0)
  {
    id v16 = 0LL;
  }

  else if (-[NSMutableArray containsObject:](v15, "containsObject:", v8))
  {
    uint64_t v20 = OSLogHandleForTransportCategory("UTunConnection");
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v9;
      __int16 v38 = 1024;
      int v39 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Session key store is not available for class C, but %@ message (%u) is already stored.",  buf,  0x12u);
    }

    uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
    if ((_DWORD)v23)
    {
      if (_IDSShouldLogTransport(v23))
      {
        uint64_t v34 = v9;
        uint64_t v35 = v5;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Session key store is not available for class C, but %@ message (%u) is already stored.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          uint64_t v34 = v9;
          uint64_t v35 = v5;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Session key store is not available for class C, but %@ message (%u) is already stored.");
        }
      }
    }
  }

  else
  {
    uint64_t v24 = OSLogHandleForTransportCategory("UTunConnection");
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v9;
      __int16 v38 = 1024;
      int v39 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Session key store is not available for class C, holding on to %@ message (%u)",  buf,  0x12u);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        uint64_t v34 = v9;
        uint64_t v35 = v5;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Session key store is not available for class C, holding on to %@ message (%u)");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          uint64_t v34 = v9;
          uint64_t v35 = v5;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Session key store is not available for class C, holding on to %@ message (%u)");
        }
      }
    }

    if (!self->_dataProtectedIncomingMessages)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      dataProtectedIncomingMessages = self->_dataProtectedIncomingMessages;
      self->_dataProtectedIncomingMessages = Mutable;
    }

    if (!v16) {
      id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    -[NSMutableArray addObject:](v16, "addObject:", v8, v34, v35);
    -[NSMutableDictionary setObject:forKey:](self->_dataProtectedIncomingMessages, "setObject:forKey:", v16, v14);
    uint64_t v30 = OSLogHandleForIDSCategory("UTunConnection");
    unsigned __int8 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = self->_dataProtectedIncomingMessages;
      *(_DWORD *)buf = 138412290;
      id v37 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Current pending messages %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v33)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      uint64_t v34 = self->_dataProtectedIncomingMessages;
      _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Current pending messages %@");
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance", v34, v35));
  [v18 unlock];

  return v17 ^ 1;
}

- (BOOL)_storeIncomingClassADataMesageIfNeeded:(id)a3 topic:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  [v10 lock];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  unsigned int v12 = [v11 isUnderLock];

  uint64_t v13 = IDSDataProtectionClassStringFromDataProtectionClass(1LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_dataProtectedIncomingMessages,  "objectForKey:",  v14));
  id v16 = v15;
  if (v15) {
    unsigned int v12 = 1;
  }
  if (v12 == 1)
  {
    if (-[NSMutableArray containsObject:](v15, "containsObject:", v8))
    {
      uint64_t v17 = OSLogHandleForTransportCategory("UTunConnection");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v9;
        __int16 v37 = 1024;
        int v38 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Session key store is not available for class A, but %@ message (%u) is already stored.",  buf,  0x12u);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          uint64_t v33 = v9;
          uint64_t v34 = v5;
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Session key store is not available for class A, but %@ message (%u) is already stored.");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            uint64_t v33 = v9;
            uint64_t v34 = v5;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Session key store is not available for class A, but %@ message (%u) is already stored.");
          }
        }
      }
    }

    else
    {
      uint64_t v23 = OSLogHandleForTransportCategory("UTunConnection");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v9;
        __int16 v37 = 1024;
        int v38 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Session key store is not available for class A, holding on to %@ message (%u)",  buf,  0x12u);
      }

      uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
      if ((_DWORD)v26)
      {
        if (_IDSShouldLogTransport(v26))
        {
          uint64_t v33 = v9;
          uint64_t v34 = v5;
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Session key store is not available for class A, holding on to %@ message (%u)");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            uint64_t v33 = v9;
            uint64_t v34 = v5;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Session key store is not available for class A, holding on to %@ message (%u)");
          }
        }
      }

      if (!self->_dataProtectedIncomingMessages)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        dataProtectedIncomingMessages = self->_dataProtectedIncomingMessages;
        self->_dataProtectedIncomingMessages = Mutable;
      }

      if (!v16) {
        id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      }
      -[NSMutableArray addObject:](v16, "addObject:", v8, v33, v34);
      -[NSMutableDictionary setObject:forKey:](self->_dataProtectedIncomingMessages, "setObject:forKey:", v16, v14);
      uint64_t v29 = OSLogHandleForIDSCategory("UTunConnection");
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v31 = self->_dataProtectedIncomingMessages;
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Current pending messages %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v32)
        && _IDSShouldLog(0LL, @"UTunConnection"))
      {
        uint64_t v33 = self->_dataProtectedIncomingMessages;
        _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Current pending messages %@");
      }
    }
  }

  else
  {
    id v16 = 0LL;
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance", v33, v34));
  [v21 unlock];

  return v12;
}

- (void)_handleOTRDecryptionSuccess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  tokenToOTRError = self->_tokenToOTRError;
  if (!tokenToOTRError)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_tokenToOTRError;
    self->_tokenToOTRError = Mutable;

    tokenToOTRError = self->_tokenToOTRError;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](tokenToOTRError, "objectForKey:", v4));
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    uint64_t v11 = OSLogHandleForTransportCategory("UTunConnection");
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Clear OTR error map for %@.", buf, 0xCu);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        id v17 = v4;
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Clear OTR error map for %@.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v17 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Clear OTR error map for %@.");
        }
      }
    }

    BOOL v15 = self->_tokenToOTRError;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL, v17));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v4);
  }
}

- (void)_handleOTRDecryptionError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  tokenToOTRError = self->_tokenToOTRError;
  if (!tokenToOTRError)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_tokenToOTRError;
    self->_tokenToOTRError = Mutable;

    tokenToOTRError = self->_tokenToOTRError;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](tokenToOTRError, "objectForKey:", v4));
  unsigned __int8 v10 = [v9 BOOLValue];

  if ((v10 & 1) != 0)
  {
    uint64_t v11 = OSLogHandleForTransportCategory("UTunConnection");
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "OTR session for %@ is in error state, skip negotiation.",  buf,  0xCu);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        id v33 = v4;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"OTR session for %@ is in error state, skip negotiation.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v33 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"OTR session for %@ is in error state, skip negotiation.");
        }
      }
    }
  }

  else
  {
    BOOL v15 = self->_tokenToOTRError;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v4);

    uint64_t v17 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Set OTR error map for %@.", buf, 0xCu);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        id v33 = v4;
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Set OTR error map for %@.");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v33 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Set OTR error map for %@.");
        }
      }
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance", v33));
    [v21 startOTRNegotiationWithDeviceIfNeeded:IDSDeviceDefaultPairedDeviceUniqueID token:v4 reset:1 errorHandler:0];
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", @"-", v33));
  if ((unint64_t)[v22 count] > 2)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:0]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:2]);
    id v28 = [v27 intValue];

    socketConnection = self->_socketConnection;
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___IDSSocketPairConnection, v30);
    if ((objc_opt_isKindOfClass(socketConnection, v31) & 1) != 0) {
      uint64_t v32 = self->_socketConnection;
    }
    else {
      uint64_t v32 = 0LL;
    }
    if ([v26 isEqualToString:@"idsotr"]) {
      -[IDSSocketPairConnectionProtocol removePendingMessagesForProtectionClass:]( v32,  "removePendingMessagesForProtectionClass:",  v28);
    }
  }

  else
  {
    uint64_t v23 = OSLogHandleForIDSCategory("Warning");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "_handleOTRDecryptionError: invalid OTR token %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v25))
    {
      _IDSWarnV(@"IDSFoundation", @"_handleOTRDecryptionError: invalid OTR token %@");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"_handleOTRDecryptionError: invalid OTR token %@");
      _IDSLogTransport(@"Warning", @"IDS", @"_handleOTRDecryptionError: invalid OTR token %@");
    }
  }
}

- (id)_decryptOTREncrtypedMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 command];
  unsigned int v6 = v5;
  if (v5 - 25 > 0xFFFFFFFD)
  {
    if (v5 == 23 && self->_useSharedOTRSession)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("Warning");
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)unsigned int v79 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "*** Recv old OTREncryptedMessage but remote device asserts useSharedOTRSession message %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v13))
      {
        _IDSWarnV( @"IDSFoundation",  @"*** Recv old OTREncryptedMessage but remote device asserts useSharedOTRSession message %@");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"*** Recv old OTREncryptedMessage but remote device asserts useSharedOTRSession message %@");
        id v65 = v4;
        _IDSLogTransport( @"Warning",  @"IDS",  @"*** Recv old OTREncryptedMessage but remote device asserts useSharedOTRSession message %@");
      }
    }

    else if (v5 != 23)
    {
      id v14 = [v4 encrypted];
      unsigned int v15 = [v4 versionNumber];
      id v16 = [v4 streamID];
      unsigned int v17 = [v4 priority];
      id v72 = [v4 sequenceNumber];
      id v18 = [v4 protectionClass];
LABEL_16:
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
      uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 topicForStreamID:v16]);

      if (self->_supportDynamicServices || self->_useSharedOTRSession)
      {
LABEL_18:
        if (v6 == 23)
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceWithPushTopic:v20]);
          LODWORD(v18) = [v24 dataProtectionClass];

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@-%u-%1u",  v20,  v17,  [v4 fileXfer]));
          uint64_t v25 = OSLogHandleForTransportCategory("UTunConnection");
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)unsigned int v79 = v22;
            *(_WORD *)&v79[8] = 1024;
            *(_DWORD *)__int128 v80 = (_DWORD)v14;
            *(_WORD *)&v80[4] = 1024;
            *(_DWORD *)&v80[6] = (_DWORD)v72;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Recv OTR message for %{public}@ E:%u SN:%u.",  buf,  0x18u);
          }

          uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
          if ((_DWORD)v28)
          {
            if (_IDSShouldLogTransport(v28))
            {
              id v69 = v72;
              id v65 = v22;
              unint64_t v67 = v14;
              _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Recv OTR message for %{public}@ E:%u SN:%u.");
              if (_IDSShouldLog(0LL, @"UTunConnection"))
              {
                unint64_t v67 = (unint64_t)v14;
                id v69 = v72;
                id v65 = v22;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Recv OTR message for %{public}@ E:%u SN:%u.");
              }
            }
          }
        }

        else if (self->_useSharedOTRSession)
        {
          if (!self->_useNamedOTRSessionToken)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u-%1u",  @"idsotr",  v17,  v18));
            if ((_DWORD)v14)
            {
LABEL_30:
              if (!(_DWORD)v18
                && -[IDSUTunConnection _storeIncomingClassCDataMessageIfNeeded:topic:sequenceNumber:]( self,  "_storeIncomingClassCDataMessageIfNeeded:topic:sequenceNumber:",  v4,  v20,  v72))
              {
                uint64_t v29 = OSLogHandleForTransportCategory("UTunConnection");
                uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)unsigned int v79 = v22;
                  *(_WORD *)&v79[8] = 1024;
                  *(_DWORD *)__int128 v80 = (_DWORD)v72;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Stored class C OTR message for %@, sequneceNumber:%u.",  buf,  0x12u);
                }

                uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
                if ((_DWORD)v32)
                {
                  if (_IDSShouldLogTransport(v32))
                  {
                    _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Stored class C OTR message for %@, sequneceNumber:%u.");
                    if (_IDSShouldLog(0LL, @"UTunConnection")) {
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Stored class C OTR message for %@, sequneceNumber:%u.");
                    }
                  }
                }

- (void)_decryptPublicKeyEncryptedMessage:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 data]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _encryptionController](self, "_encryptionController"));
  uniqueID = self->_uniqueID;
  int64_t priority = self->_priority;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100252FD4;
  v13[3] = &unk_1008FED98;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 legacyPublicKeyDecryptData:v12 toDeviceID:uniqueID priority:priority completionBlock:v13];
}

- (void)_optionallyDecryptMessage:(id)a3 completionBlock:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v7 assertRunningWithPriority:self->_priority];

  unsigned int v8 = [v12 command];
  unsigned int v9 = v8;
  if (v8 == 23 || v8 == 5)
  {
    if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
    {
      if (v9 == 5) {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v12 data]);
      }
      else {
        uint64_t v10 = objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _decryptOTREncrtypedMessage:](self, "_decryptOTREncrtypedMessage:", v12));
      }
      id v11 = (void *)v10;
      v6[2](v6, v10);
    }

    else
    {
      -[IDSUTunConnection _decryptPublicKeyEncryptedMessage:completionBlock:]( self,  "_decryptPublicKeyEncryptedMessage:completionBlock:",  v12,  v6);
    }
  }

  else
  {
    v6[2](v6, 0LL);
  }
}

- (BOOL)_messageHasValidEncryptionStatus:(id)a3
{
  unsigned int v3 = [a3 command];
  return v3 == 23 || (v3 & 0xFE) == 4;
}

- (void)dropDisallowedMessages
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  -[IDSUTunConnection _flushMessagesAll:response:](self, "_flushMessagesAll:response:", 0LL, 20LL);
}

- (void)flushAllMessagesForReason:(int64_t)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (a3) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = 14LL;
  }
  -[IDSUTunConnection _flushMessagesAll:response:](self, "_flushMessagesAll:response:", 1LL, v6);
}

- (void)_flushMessagesAll:(BOOL)a3 response:(int64_t)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v81 = kIDSDefaultPairedDeviceID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Flush all messages for peer %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8) && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    uint64_t v47 = kIDSDefaultPairedDeviceID;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunConnection", @"Flush all messages for peer %@");
  }

  id v9 = -[NSMutableArray _copyForEnumerating](self->_sendingMessages, "_copyForEnumerating", v47);
  uint64_t v49 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id obj = v9;
  id v51 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v51)
  {
    uint64_t v54 = 0LL;
    uint64_t v50 = *(void *)v75;
    do
    {
      for (i = 0LL; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v75 != v50) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 context]);
        uint64_t v13 = v12;
        if (a3
          || (id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 topic]),
              unsigned __int8 v15 = -[IDSUTunConnection _messageIsAllowedToSendMessageOnTopic:]( self,  "_messageIsAllowedToSendMessageOnTopic:",  v14),  v14,  (v15 & 1) == 0))
        {
          if (-[IDSUTunConnection _shouldAWDLogMessage:](self, "_shouldAWDLogMessage:", v13))
          {
            id v16 = objc_alloc(&OBJC_CLASS___IDSLocalMessageDeliveryConnectionResetMetric);
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v13 awdTopic]);
            id v18 = objc_msgSend( v16,  "initWithService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:",  v17,  -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"),  objc_msgSend(v13, "sentMessageDataSize"),  -[IDSUTunConnection _currentLink](self, "_currentLink"),  102,  0,  objc_msgSend(v13, "priority"));

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCoreAnalyticsLogger defaultLogger]( &OBJC_CLASS___IDSCoreAnalyticsLogger,  "defaultLogger"));
            [v19 logMetric:v18];

            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 awdTopic]);
            objc_msgSend( v20,  "messageDeliveredForService:isToDefaultPairedDevice:messageSize:linkType:deliveryError:RTT:priority:",  v21,  -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"),  objc_msgSend(v13, "sentMessageDataSize"),  -[IDSUTunConnection _currentLink](self, "_currentLink"),  102,  0,  objc_msgSend(v13, "priority"));
          }

          -[IDSUTunConnection _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v13);
          if (a4 == 31
            || (uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 completionBlock])) == 0)
          {
            id v27 = 0LL;
          }

          else
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 toDeviceID]);
            id v24 = -[NSString copy](self->_cbuuid, "copy");
            double rtt = self->_rtt;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472LL;
            v67[2] = sub_100253D5C;
            v67[3] = &unk_1008FEDC0;
            int64_t v72 = a4;
            id v68 = v24;
            id v69 = v23;
            double v73 = rtt;
            id v70 = v13;
            id v27 = v22;
            id v71 = v27;
            id v28 = v23;
            id v29 = v24;
            [v26 performBlockMainQueue:v67];
          }

          -[IDSLocalDeliveryQueue dequeueMessage:](self->_deliveryQueue, "dequeueMessage:", v13);
          [v11 setContext:0];
          [v11 setCancelled:1];
          -[NSMutableIndexSet addIndex:](v49, "addIndex:", v54);

          ++v54;
        }
      }

      id v51 = [obj countByEnumeratingWithState:&v74 objects:v79 count:16];
    }

    while (v51);
  }

  -[NSMutableArray removeObjectsAtIndexes:](self->_sendingMessages, "removeObjectsAtIndexes:", v49);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSLocalDeliveryQueue messages](self->_deliveryQueue, "messages"));
  id v31 = [v30 _copyForEnumerating];

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v55 = v31;
  id v32 = [v55 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v64;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v64 != v33) {
          objc_enumerationMutation(v55);
        }
        char v35 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)j);
        if (!a3)
        {
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v63 + 1) + 8 * (void)j) topic]);
          unsigned __int8 v37 = -[IDSUTunConnection _messageIsAllowedToSendMessageOnTopic:]( self,  "_messageIsAllowedToSendMessageOnTopic:",  v36);

          if ((v37 & 1) != 0) {
            continue;
          }
        }

        -[IDSUTunConnection _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v35);
        if (a4 == 31)
        {
          id v38 = 0LL;
        }

        else
        {
          id v38 = (id)objc_claimAutoreleasedReturnValue([v35 completionBlock]);
          if (v38)
          {
            double v39 = (void *)objc_claimAutoreleasedReturnValue([v35 toDeviceID]);
            id v40 = -[NSString copy](self->_cbuuid, "copy");
            double v41 = self->_rtt;
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472LL;
            v56[2] = sub_100253E60;
            v56[3] = &unk_1008FEDC0;
            double v62 = v41;
            id v57 = v39;
            id v58 = v40;
            int64_t v61 = a4;
            uint64_t v59 = v35;
            id v38 = v38;
            id v60 = v38;
            id v43 = v40;
            id v44 = v39;
            [v42 performBlockMainQueue:v56];
          }
        }

        [v35 setUnderlyingSocketPairMessage:0];
        -[IDSLocalDeliveryQueue dequeueMessage:](self->_deliveryQueue, "dequeueMessage:", v35);
      }

      id v32 = [v55 countByEnumeratingWithState:&v63 objects:v78 count:16];
    }

    while (v32);
  }

  fallbackMessages = self->_fallbackMessages;
  self->_fallbackMessages = 0LL;

  tokenToOTREncryptionQueue = self->_tokenToOTREncryptionQueue;
  self->_tokenToOTREncryptionQueue = 0LL;
}

- (int64_t)_socketToNiceCommand:(unsigned __int8)a3
{
  if (a3 > 0x34u) {
    return -1LL;
  }
  else {
    return qword_100717CA8[(char)a3];
  }
}

- (void)sendAckForMessageWithSequenceNumber:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [[IDSSocketPairAckMessage alloc] initWithSequenceNumber:*(void *)&a3];
  -[IDSUTunConnection setEnabled:](self, "setEnabled:", 1LL);
  uint64_t v6 = OSLogHandleForTransportCategory("UTunConnection");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 1024;
    int v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Broadcast: Sending ack %@ for received sequence number %d",  buf,  0x12u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
  {
    id v11 = v5;
    uint64_t v12 = v3;
    *(void *)&double v10 = _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Broadcast: Sending ack %@ for received sequence number %d").n128_u64[0];
  }

  -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v5,  1LL,  v10,  v11,  v12);
}

- (void)_sendAckForMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100254164;
  v6[3] = &unk_1008FAB58;
  v6[4] = self;
  -[IDSUTunConnection _processMessage:withSequenceNumberBlock:]( self,  "_processMessage:withSequenceNumberBlock:",  v4,  v6);
}

- (void)_sendExpiredAckForMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10025420C;
  v6[3] = &unk_1008FAB58;
  v6[4] = self;
  -[IDSUTunConnection _processMessage:withSequenceNumberBlock:]( self,  "_processMessage:withSequenceNumberBlock:",  v4,  v6);
}

- (void)_processMessage:(id)a3 withSequenceNumberBlock:(id)a4
{
  id v6 = a3;
  id v5 = (void (**)(id, id))a4;
  if (v5 && (objc_opt_respondsToSelector(v6, "sequenceNumber") & 1) != 0) {
    v5[2](v5, [v6 sequenceNumber]);
  }
}

- (unint64_t)_currentLink
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  if (!-[IDSUTunConnection isConnected](self, "isConnected")) {
    return 0LL;
  }
  if (-[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 linkManager]);
    id v6 = (char *)[v5 currentDefaultDeviceLinkType];

    return 0LL;
  }

  return 3LL;
}

- (void)_noteReceivedResourceTransferUUID:(id)a3
{
  id v4 = a3;
  receivedResourceTransferUUIDs = self->_receivedResourceTransferUUIDs;
  if (!receivedResourceTransferUUIDs)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v8 = (IMPair *)objc_claimAutoreleasedReturnValue(+[IMPair pairWithFirst:second:](&OBJC_CLASS___IMPair, "pairWithFirst:second:", v6, v7));
    uint64_t v9 = self->_receivedResourceTransferUUIDs;
    self->_receivedResourceTransferUUIDs = v8;

    receivedResourceTransferUUIDs = self->_receivedResourceTransferUUIDs;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMPair first](receivedResourceTransferUUIDs, "first"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMPair second](self->_receivedResourceTransferUUIDs, "second"));
  if (([v10 containsObject:v4] & 1) != 0
    || ([v11 containsObject:v4] & 1) != 0)
  {
    goto LABEL_12;
  }

  id v12 = [v10 count];
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog UTunConnection](&OBJC_CLASS___IDSFoundationLog, "UTunConnection"));
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v12 < 0x64)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received UUID list adding message UUID %@",  buf,  0xCu);
    }

    [v10 addObject:v4];
LABEL_12:
    __int16 v15 = v10;
    double v10 = v11;
    goto LABEL_13;
  }

  if (v14)
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v4;
    __int16 v20 = 2112;
    __int128 v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received UUID list adding message UUID %@, purging old UUIDs %@",  buf,  0x16u);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](&OBJC_CLASS___NSMutableSet, "setWithObjects:", v4, 0LL));
  int v16 = (IMPair *)objc_claimAutoreleasedReturnValue(+[IMPair pairWithFirst:second:](&OBJC_CLASS___IMPair, "pairWithFirst:second:", v15, v10));
  unsigned int v17 = self->_receivedResourceTransferUUIDs;
  self->_receivedResourceTransferUUIDs = v16;

LABEL_13:
}

- (BOOL)_resourceTransferUUIDAlreaadyReceived:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMPair first](self->_receivedResourceTransferUUIDs, "first"));
  if ([v5 containsObject:v4])
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMPair second](self->_receivedResourceTransferUUIDs, "second"));
    unsigned __int8 v6 = [v7 containsObject:v4];
  }

  return v6;
}

- (void)_processIncomingResourceTransferMessage:(id)a3 messageUUID:(id)a4 streamID:(unsigned __int16)a5 topic:(id)a6 wantsAppAck:(BOOL)a7 expectsPeerResponse:(BOOL)a8 peerResponseIdentifier:(id)a9 isDefaultPairedDevice:(BOOL)a10 didWakeHint:(BOOL)a11
{
  uint64_t v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v184 = a6;
  v182 = v17;
  id v183 = a9;
  if (v18)
  {
    BOOL v179 = a7;
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___IDSSocketPairResourceTransferMessage, v19);
    if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
    {
      id v21 = v17;
      char v181 = v21;
      if (self->_resumeResourceTransfers)
      {
        uint64_t v22 = v21;
        switch([v21 type])
        {
          case 0u:
            BOOL v178 = a8;
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_incomingResourceTransfers, "objectForKey:", v18));
            id v24 = v23;
            if (!v23)
            {
              if ((-[NSMutableSet containsObject:]( self->_resettingIncomingResourceTransfers,  "containsObject:",  v18) & 1) == 0)
              {
                id v60 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSocketPairResourceTransferMessage resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:]( &OBJC_CLASS___IDSSocketPairResourceTransferMessage,  "resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:",  0LL,  v14,  v18,  0LL));
                int64_t v61 = v60;
                if (self->_supportDynamicServices)
                {
                  if (self->_supportDynamicServicesOptimization) {
                    [v60 setStreamID:1];
                  }
                  else {
                    [v60 setTopic:v184];
                  }
                }

                -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v61,  1LL);
                resettingIncomingResourceTransfers = self->_resettingIncomingResourceTransfers;
                if (!resettingIncomingResourceTransfers)
                {
                  uint64_t v131 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                  uint64_t v132 = self->_resettingIncomingResourceTransfers;
                  self->_resettingIncomingResourceTransfers = v131;

                  resettingIncomingResourceTransfers = self->_resettingIncomingResourceTransfers;
                }

                -[NSMutableSet addObject:](resettingIncomingResourceTransfers, "addObject:", v18);
                uint64_t v133 = OSLogHandleForTransportCategory("UTunConnection");
                uint64_t v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v134,  OS_LOG_TYPE_DEFAULT,  "IDSSocketPairCommandResourceTransferMessage cannot find receiver for message %@ - asking sender to reset",  buf,  0xCu);
                }

                uint64_t v136 = os_log_shim_legacy_logging_enabled(v135);
                if ((_DWORD)v136)
                {
                  if (_IDSShouldLogTransport(v136))
                  {
                    _IDSLogTransport( @"UTunConnection",  @"IDS",  @"IDSSocketPairCommandResourceTransferMessage cannot find receiver for message %@ - asking sender to reset");
                    if (_IDSShouldLog(0LL, @"UTunConnection")) {
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"IDSSocketPairCommandResourceTransferMessage cannot find receiver for message %@ - asking sender to reset");
                    }
                  }
                }
              }

              goto LABEL_161;
            }

            unsigned int v25 = [v23 appendMessage:v181 receiverError:0];
            resumingIncomingResourceTransfers = self->_resumingIncomingResourceTransfers;
            if (v25)
            {
              -[NSMutableSet removeObject:](resumingIncomingResourceTransfers, "removeObject:", v18);
              if (!-[NSMutableSet count](self->_resumingIncomingResourceTransfers, "count"))
              {
                id v27 = self->_resumingIncomingResourceTransfers;
                self->_resumingIncomingResourceTransfers = 0LL;
              }

              goto LABEL_172;
            }

            if ((-[NSMutableSet containsObject:]( resumingIncomingResourceTransfers,  "containsObject:",  v18) & 1) == 0)
            {
              __int128 v78 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSocketPairResourceTransferMessage resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:]( IDSSocketPairResourceTransferMessage,  "resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:",  0,  v14,  v18,  [v24 totalBytesReceived]));
              unsigned int v79 = v78;
              if (self->_supportDynamicServices)
              {
                if (self->_supportDynamicServicesOptimization) {
                  [v78 setStreamID:1];
                }
                else {
                  [v78 setTopic:v184];
                }
              }

              -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v79,  1LL);
              id v162 = self->_resumingIncomingResourceTransfers;
              if (!v162)
              {
                id v163 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                v164 = self->_resumingIncomingResourceTransfers;
                self->_resumingIncomingResourceTransfers = v163;

                id v162 = self->_resumingIncomingResourceTransfers;
              }

              -[NSMutableSet addObject:](v162, "addObject:", v18);
              uint64_t v165 = OSLogHandleForTransportCategory("UTunConnection");
              v166 = (os_log_s *)objc_claimAutoreleasedReturnValue(v165);
              if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v18;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = [v181 byteOffset];
                *(_WORD *)&buf[22] = 2048;
                v228 = (uint64_t (*)(uint64_t, uint64_t))[v24 totalBytesReceived];
                _os_log_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_DEFAULT,  "IDSSocketPairCommandResourceTransferMessage received %@ @ incorrect offset %llu (should be @%llu)",  buf,  0x20u);
              }

              uint64_t v168 = os_log_shim_legacy_logging_enabled(v167);
              if ((_DWORD)v168)
              {
                if (_IDSShouldLogTransport(v168))
                {
                  id v174 = [v181 byteOffset];
                  id v176 = [v24 totalBytesReceived];
                  _IDSLogTransport( @"UTunConnection",  @"IDS",  @"IDSSocketPairCommandResourceTransferMessage received %@ @ incorrect offset %llu (should be @%llu)");
                  if (_IDSShouldLog(0LL, @"UTunConnection"))
                  {
                    objc_msgSend(v181, "byteOffset", v18, v174, v176);
                    [v24 totalBytesReceived];
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"IDSSocketPairCommandResourceTransferMessage received %@ @ incorrect offset %llu (should be @%llu)");
                  }
                }
              }
            }

            goto LABEL_185;
          case 1u:
            BOOL v178 = a8;
            if (-[IDSUTunConnection _resourceTransferUUIDAlreaadyReceived:]( self,  "_resourceTransferUUIDAlreaadyReceived:",  v18))
            {
              uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog UTunConnection](&OBJC_CLASS___IDSFoundationLog, "UTunConnection"));
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Duplicate file transfer setup detected {duplicateUUID: %@}",  buf,  0xCu);
              }

              id v43 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSocketPairResourceTransferMessage cancelMessageWithSequenceNumber:streamID:messageUUID:cancelReason:]( &OBJC_CLASS___IDSSocketPairResourceTransferMessage,  "cancelMessageWithSequenceNumber:streamID:messageUUID:cancelReason:",  0LL,  v14,  v18,  6LL));
              id v44 = v43;
              if (self->_supportDynamicServices)
              {
                if (self->_supportDynamicServicesOptimization) {
                  [v43 setStreamID:1];
                }
                else {
                  [v43 setTopic:v184];
                }
              }

              __int16 v91 = self->_resettingIncomingResourceTransfers;
              if (!v91)
              {
                id v92 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                __int16 v93 = self->_resettingIncomingResourceTransfers;
                self->_resettingIncomingResourceTransfers = v92;

                __int16 v91 = self->_resettingIncomingResourceTransfers;
              }

              -[NSMutableSet addObject:](v91, "addObject:", v18);
              -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v44,  1LL);
            }

            -[NSMutableSet removeObject:](self->_resettingIncomingResourceTransfers, "removeObject:", v18);
            id v24 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_incomingResourceTransfers, "objectForKey:", v18));
            if (v24)
            {
              if ((-[NSMutableSet containsObject:]( self->_resumingIncomingResourceTransfers,  "containsObject:",  v18) & 1) == 0)
              {
                uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSocketPairResourceTransferMessage resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:]( IDSSocketPairResourceTransferMessage,  "resumeMessageWithSequenceNumber:streamID:messageUUID:nextByteOffset:",  0,  v14,  v18,  [v24 totalBytesReceived]));
                __int16 v95 = v94;
                if (self->_supportDynamicServices)
                {
                  if (self->_supportDynamicServicesOptimization) {
                    [v94 setStreamID:1];
                  }
                  else {
                    [v94 setTopic:v184];
                  }
                }

                -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v95,  1LL);
                v117 = self->_resumingIncomingResourceTransfers;
                if (!v117)
                {
                  unsigned int v118 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                  unsigned int v119 = self->_resumingIncomingResourceTransfers;
                  self->_resumingIncomingResourceTransfers = v118;

                  v117 = self->_resumingIncomingResourceTransfers;
                }

                -[NSMutableSet addObject:](v117, "addObject:", v18);
                uint64_t v120 = OSLogHandleForTransportCategory("UTunConnection");
                v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
                if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                {
                  id v122 = [v24 totalBytesReceived];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v18;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v122;
                  _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "IDSSocketPairCommandResourceTransferMessage already receiving message %@ @%llu",  buf,  0x16u);
                }

                uint64_t v124 = os_log_shim_legacy_logging_enabled(v123);
                if ((_DWORD)v124)
                {
                  if (_IDSShouldLogTransport(v124))
                  {
                    id v169 = v18;
                    unint64_t v170 = (unint64_t)[v24 totalBytesReceived];
                    _IDSLogTransport( @"UTunConnection",  @"IDS",  @"IDSSocketPairCommandResourceTransferMessage already receiving message %@ @%llu");
                    if (_IDSShouldLog(0LL, @"UTunConnection"))
                    {
                      id v125 = objc_msgSend(v24, "totalBytesReceived", v18, v170);
                      id v169 = v18;
                      unint64_t v170 = (unint64_t)v125;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"IDSSocketPairCommandResourceTransferMessage already receiving message %@ @%llu");
                    }
                  }
                }
              }

- (void)_processIncomingDataMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:self->_priority];

  if (-[IDSUTunConnection _messageHasValidEncryptionStatus:](self, "_messageHasValidEncryptionStatus:", v4)
    || -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100256FC8;
    v9[3] = &unk_1008FEED8;
    id v10 = v4;
    id v11 = self;
    -[IDSUTunConnection _optionallyDecryptMessage:completionBlock:]( self,  "_optionallyDecryptMessage:completionBlock:",  v10,  v9);
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("Warning");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ received a message that we cannot accept without encryption! %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      _IDSWarnV(@"IDSFoundation", @"%@ received a message that we cannot accept without encryption! %@");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ received a message that we cannot accept without encryption! %@");
      _IDSLogTransport( @"Warning",  @"IDS",  @"%@ received a message that we cannot accept without encryption! %@");
    }
  }
}

- (void)_processDecryptedMessage:(id)a3
{
  id v4 = a3;
  unint64_t v230 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 1LL);
  unint64_t v229 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 0LL);
  unint64_t v228 = -[IDSUTunConnection _sendingMessageCountForClass:](self, "_sendingMessageCountForClass:", 2LL);
  unsigned int v223 = -[IDSUTunConnection _isMagnetConnection](self, "_isMagnetConnection");
  if ((objc_opt_respondsToSelector(v4, "messageUUID") & 1) != 0)
  {
    __int16 v233 = (IDSUTunConnection *)(id)objc_claimAutoreleasedReturnValue([v4 messageUUID]);
  }

  else
  {
    __int16 v233 = 0LL;
  }

  if ((objc_opt_respondsToSelector(v4, "peerResponseIdentifier") & 1) != 0)
  {
    double v232 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue([v4 peerResponseIdentifier]));
  }

  else
  {
    double v232 = 0.0;
  }

  if ((objc_opt_respondsToSelector(v4, "expectsPeerResponse") & 1) != 0) {
    id v5 = [v4 expectsPeerResponse];
  }
  else {
    id v5 = 0LL;
  }
  if ((objc_opt_respondsToSelector(v4, "wantsAppAck") & 1) != 0) {
    id v6 = [v4 wantsAppAck];
  }
  else {
    id v6 = 0LL;
  }
  else {
    unsigned __int8 v226 = 0;
  }
  if ((objc_opt_respondsToSelector(v4, "expiryDate") & 1) != 0)
  {
    uint64_t v7 = (char *)(id)objc_claimAutoreleasedReturnValue([v4 expiryDate]);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v8 = OSLogHandleForTransportCategory("UTunConnection");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    *(_DWORD *)buf = 138544386;
    *(void *)v328 = v233;
    if ((_DWORD)v5) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    if ((_DWORD)v6) {
      id v10 = @"YES";
    }
    *(_WORD *)&v328[8] = 2112;
    *(double *)&v328[10] = v232;
    *(_WORD *)&v328[18] = 2112;
    *(void *)&v328[20] = v11;
    *(_WORD *)&v328[28] = 2112;
    *(void *)&v328[30] = v10;
    *(_WORD *)&v328[38] = 2112;
    *(void *)&v328[40] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received message has messageUUID %{public}@ peerResponseID %@ expectsPeerResponse? %@ wantsAppAck %@ remoteExpiryDate: %@",  buf,  0x34u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
  {
    *(double *)&__int16 v14 = (_DWORD)v5 ? COERCE_DOUBLE(@"YES") : COERCE_DOUBLE(@"NO");
    id v15 = (_DWORD)v6 ? @"YES" : @"NO";
    v221 = v15;
    uint64_t v222 = v7;
    double v219 = v232;
    double v220 = *(double *)&v14;
    id v215 = v233;
    _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Received message has messageUUID %{public}@ peerResponseID %@ expectsPeerResponse? %@ wantsAppAck %@ remoteExpiryDate: %@");
    if (_IDSShouldLog(0LL, @"UTunConnection"))
    {
      v221 = v15;
      uint64_t v222 = v7;
      double v219 = v232;
      double v220 = *(double *)&v14;
      id v215 = v233;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Received message has messageUUID %{public}@ peerResponseID %@ expectsPeerResponse? %@ wantsAppAck %@ remoteExpiryDate: %@");
    }
  }

  if (v7)
  {
    [v7 timeIntervalSinceNow];
    if (v16 < 0.0)
    {
      uint64_t v17 = OSLogHandleForTransportCategory("UTunConnection");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v328 = v233;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received a message that has passed its expiry date, sending back an expired ack MessageUUID: %@",  buf,  0xCu);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          id v215 = v233;
          _IDSLogTransport( @"UTunConnection",  @"IDS",  @"Received a message that has passed its expiry date, sending back an expired ack MessageUUID: %@");
          if (_IDSShouldLog(0LL, @"UTunConnection"))
          {
            id v215 = v233;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Received a message that has passed its expiry date, sending back an expired ack MessageUUID: %@");
          }
        }
      }

      -[IDSUTunConnection _sendExpiredAckForMessage:]( self,  "_sendExpiredAckForMessage:",  v4,  v215,  *(void *)&v219,  *(void *)&v220,  v221,  v222);
      goto LABEL_177;
    }
  }

  if (self->_needsHandshake && [v4 command] != 4)
  {
    uint64_t v32 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      unsigned int v35 = [v4 command];
      *(_DWORD *)buf = 138412802;
      *(void *)v328 = self;
      *(_WORD *)&v328[8] = 2112;
      *(void *)&v328[10] = identifier;
      *(_WORD *)&v328[18] = 1024;
      *(_DWORD *)&v328[20] = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%@ [%@] received a %d message when it was expecting a handshake!",  buf,  0x1Cu);
    }

    uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
    if ((_DWORD)v37)
    {
      if (_IDSShouldLogTransport(v37))
      {
        double v219 = *(double *)&self->_identifier;
        *(void *)&double v220 = [v4 command];
        id v215 = self;
        _IDSLogTransport( @"UTunConnection",  @"IDS",  @"%@ [%@] received a %d message when it was expecting a handshake!");
        if (_IDSShouldLog(0LL, @"UTunConnection"))
        {
          uint64_t v38 = self->_identifier;
          unsigned int v39 = objc_msgSend(v4, "command", self, *(void *)&v219, *(void *)&v220);
          double v219 = *(double *)&v38;
          *(void *)&double v220 = v39;
          id v215 = self;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ [%@] received a %d message when it was expecting a handshake!");
        }
      }
    }

    uint64_t v40 = OSLogHandleForTransportCategory("UTunConnection");
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Incompatible IDS version number!", buf, 2u);
    }

    uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
    if ((_DWORD)v43)
    {
      if (_IDSShouldLogTransport(v43))
      {
        _IDSLogTransport(@"UTunConnection", @"IDS", @"Incompatible IDS version number!");
      }
    }

    uint64_t v44 = OSLogHandleForIDSCategory("Warning");
    uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Incompatible IDS version number - please make sure your build versions match!",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v46))
    {
      _IDSWarnV( @"IDSFoundation",  @"Incompatible IDS version number - please make sure your build versions match!");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Incompatible IDS version number - please make sure your build versions match!");
      *(void *)&double v47 = _IDSLogTransport( @"Warning",  @"IDS",  @"Incompatible IDS version number - please make sure your build versions match!").n128_u64[0];
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue( +[IMLockdownManager sharedInstance]( &OBJC_CLASS___IMLockdownManager,  "sharedInstance",  v47,  v215,  *(void *)&v219,  *(void *)&v220,  v221,  v222));
    unsigned int v49 = [v48 isInternalInstall];

    if (v49) {
      -[IDSUTunConnection _dumpLogs](self, "_dumpLogs");
    }
  }

  else
  {
    if ((objc_opt_respondsToSelector(v4, "streamID") & 1) == 0)
    {
      *(double *)&v224 = 0.0;
      double key = 0.0;
      goto LABEL_131;
    }

    *(double *)&v224 = COERCE_DOUBLE([v4 streamID]);
    if (!self->_supportDynamicServices)
    {
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunConnection _UTunDeliveryController](self, "_UTunDeliveryController"));
      double key = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v50 topicForStreamID:v224]));

      goto LABEL_131;
    }

    double key = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v4 topic]));
    char v326 = 0;
    if (key != 0.0)
    {
      if (!self->_supportDynamicServicesOptimization) {
        goto LABEL_123;
      }
      if ((_DWORD)v224)
      {
        -[IDSUTunPeerServiceMap associateServiceName:withStreamID:remoteInstanceID:remoteInstanceIDChanged:]( self->_outgoingServiceMap,  "associateServiceName:withStreamID:remoteInstanceID:remoteInstanceIDChanged:",  *(void *)&key,  v224,  self->_remoteInstanceID,  &v326);
        if (v326) {
          goto LABEL_124;
        }
      }

      char v325 = 0;
      LOWORD(v281) = 0;
      if (-[IDSUTunPeerServiceMap translateServiceName:toStreamID:createIfNotFound:mappingCreated:remoteInstanceID:remoteInstanceIDChanged:]( self->_incomingServiceMap,  "translateServiceName:toStreamID:createIfNotFound:mappingCreated:remoteInstanceID:remoteInstanceIDChanged:",  *(void *)&key,  &v281,  1LL,  &v325,  self->_remoteInstanceID,  &v326,  v215,  *(void *)&v219,  *(void *)&v220,  v221,  v222))
      {
        incomingServiceMapUpdateCounter = self->_incomingServiceMapUpdateCounter;
        if (!incomingServiceMapUpdateCounter)
        {
          CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          uint64_t v23 = self->_incomingServiceMapUpdateCounter;
          self->_incomingServiceMapUpdateCounter = Mutable;

          incomingServiceMapUpdateCounter = self->_incomingServiceMapUpdateCounter;
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( incomingServiceMapUpdateCounter,  "objectForKey:",  *(void *)&key));
        if ((uint64_t)[v24 integerValue] < 2)
        {
          uint64_t v26 = (char *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v24 integerValue] + 1));
          if (v26) {
            CFDictionarySetValue( (CFMutableDictionaryRef)self->_incomingServiceMapUpdateCounter,  *(const void **)&key,  v26);
          }
        }

        else
        {
          CFDictionarySetValue( (CFMutableDictionaryRef)self->_incomingServiceMapUpdateCounter,  *(const void **)&key,  &off_100947620);
          id v25 = objc_alloc(&OBJC_CLASS___IDSSocketPairServiceMapMessage);
          uint64_t v26 = (char *)[v25 initWithReason:1 mappedStreamID:(unsigned __int16)v281 serviceName:*(void *)&key];
          -[IDSUTunConnection _sendSocketMessage:ignoreSequenceNumber:]( self,  "_sendSocketMessage:ignoreSequenceNumber:",  v26,  1LL);
          uint64_t v27 = OSLogHandleForIDSCategory("UTunConnection");
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            if (v325) {
              id v29 = @"YES";
            }
            else {
              id v29 = @"NO";
            }
            *(_DWORD *)buf = 138413314;
            *(void *)v328 = v233;
            *(_WORD *)&v328[8] = 2112;
            *(double *)&v328[10] = key;
            *(_WORD *)&v328[18] = 1024;
            *(_DWORD *)&v328[20] = (unsigned __int16)v281;
            *(_WORD *)&v328[24] = 2112;
            *(void *)&v328[26] = v29;
            *(_WORD *)&v328[34] = 2112;
            *(void *)&v328[36] = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Incoming message %@ servicename %@ streamID-found %u newly-created %@ (serviceMapMessage %@)",  buf,  0x30u);
          }

          if (os_log_shim_legacy_logging_enabled(v30)
            && _IDSShouldLog(1LL, @"UTunConnection"))
          {
            if (v325) {
              uint64_t v31 = @"YES";
            }
            else {
              uint64_t v31 = @"NO";
            }
            v221 = (__CFString *)v31;
            uint64_t v222 = v26;
            *(void *)&double v220 = (unsigned __int16)v281;
            id v215 = v233;
            double v219 = key;
            _IDSLogV( 1LL,  @"IDSFoundation",  @"UTunConnection",  @"Incoming message %@ servicename %@ streamID-found %u newly-created %@ (serviceMapMessage %@)");
          }
        }

LABEL_122:
        goto LABEL_123;
      }

      if (!v325)
      {
        uint64_t v67 = OSLogHandleForIDSCategory("UTunConnection");
        uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v328 = v233;
          *(_WORD *)&v328[8] = 2112;
          *(double *)&v328[10] = key;
          _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "Cannot create mapping while receiving message %@ with topic %@ - continuing",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v69)
          && _IDSShouldLog(0LL, @"UTunConnection"))
        {
          id v215 = v233;
          double v219 = key;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"Cannot create mapping while receiving message %@ with topic %@ - continuing");
        }
      }

- (void)_dumpLogs
{
  if (qword_1009C0798 != -1) {
    dispatch_once(&qword_1009C0798, &stru_1008FF010);
  }
}

- (void)connectionDidClose:(id)a3
{
  id v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    [v5 assertRunningWithPriority:self->_priority];

    uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ informed that utun socket pair connection %@ has closed...",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"UTunConnection"))
    {
      uint64_t v9 = self;
      id v10 = v4;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ informed that utun socket pair connection %@ has closed...");
    }

    -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection", v9, v10);
    -[IDSUTunConnection _checkAndStartConnection](self, "_checkAndStartConnection");
  }
}

- (void)connectionDidClose
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  uint64_t v4 = OSLogHandleForIDSCategory("UTunConnection");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ informed that IDSNWSocketPairConnection has closed.",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6) && _IDSShouldLog(0LL, @"UTunConnection"))
  {
    uint64_t v7 = self;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ informed that IDSNWSocketPairConnection has closed.");
  }

  -[IDSUTunConnection _nonThreadSafeStopConnection](self, "_nonThreadSafeStopConnection", v7);
  -[IDSUTunConnection _checkAndStartConnection](self, "_checkAndStartConnection");
}

- (void)connection:(id)a3 didReceiveDataMessage:(id)a4
{
  if (self->_socketConnection == a3)
  {
    id v6 = a4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    [v5 assertRunningWithPriority:self->_priority];

    -[IDSUTunConnection _clearLastFallbackWithReason:]( self,  "_clearLastFallbackWithReason:",  @"message received via local link");
    -[IDSUTunConnection _processIncomingDataMessage:](self, "_processIncomingDataMessage:", v6);
  }

- (void)didReceiveDataMessage:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v4 assertRunningWithPriority:self->_priority];

  -[IDSUTunConnection _clearLastFallbackWithReason:]( self,  "_clearLastFallbackWithReason:",  @"message received via local link");
  -[IDSUTunConnection _processIncomingDataMessage:](self, "_processIncomingDataMessage:", v5);
}

- (void)connectionBecameEmpty:(id)a3
{
  uint64_t v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    [v5 assertRunningWithPriority:self->_priority];

    uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ connectionBecameEmpty %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(1LL, @"UTunConnection"))
    {
      uint64_t v9 = self;
      id v10 = v4;
      _IDSLogV(1LL, @"IDSFoundation", @"UTunConnection", @"%@ connectionBecameEmpty %@");
    }

    -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages", v9, v10);
  }
}

- (void)retryWaitingMessages
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v3 assertRunningWithPriority:self->_priority];

  uint64_t v4 = OSLogHandleForIDSCategory("UTunConnection");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    socketConnection = self->_socketConnection;
    *(_DWORD *)buf = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = socketConnection;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ connectionBecameEmpty %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(1LL, @"UTunConnection"))
  {
    uint64_t v8 = self;
    uint64_t v9 = self->_socketConnection;
    _IDSLogV(1LL, @"IDSFoundation", @"UTunConnection", @"%@ connectionBecameEmpty %@");
  }

  -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages", v8, v9);
}

- (void)connectionBecameEmpty
{
}

- (void)connectionDidReachInFlightMessageLowWaterMark:(id)a3
{
  uint64_t v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    [v5 assertRunningWithPriority:self->_priority];

    uint64_t v6 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@ connectionDidReachInFlightMessageLowWaterMark %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(1LL, @"UTunConnection"))
    {
      uint64_t v9 = self;
      id v10 = v4;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"UTunConnection",  @"%@ connectionDidReachInFlightMessageLowWaterMark %@");
    }

    -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages", v9, v10);
  }
}

- (void)connectionDidReceiveBytes:(id)a3
{
  uint64_t v4 = (IDSSocketPairConnectionProtocol *)a3;
  if (self->_socketConnection == v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("UTunConnection");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      __int16 v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ connectionDidReceiveBytes %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v7)
      && _IDSShouldLog(1LL, @"UTunConnection"))
    {
      uint64_t v8 = self;
      uint64_t v9 = v4;
      _IDSLogV(1LL, @"IDSFoundation", @"UTunConnection", @"%@ connectionDidReceiveBytes %@");
    }

    -[IDSUTunConnection _clearLastFallbackWithReason:]( self,  "_clearLastFallbackWithReason:",  @"local link did receive bytes",  v8,  v9);
    -[IDSUTunConnection _dequeueMessages](self, "_dequeueMessages");
  }
}

- (void)forceOTRNegotiation:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v9 assertRunningWithPriority:a4];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u-%1u",  v7,  a4,  0LL));
  uint64_t v11 = OSLogHandleForTransportCategory("IDSUTunConnection");
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Calling IDSOTRController:startOTRNegotiationWithDeviceIfNeeded to force session negotiation.",  buf,  2u);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      _IDSLogTransport( @"IDSUTunConnection",  @"IDS",  @"Calling IDSOTRController:startOTRNegotiationWithDeviceIfNeeded to force session negotiation.");
      if (_IDSShouldLog(0LL, @"IDSUTunConnection")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunConnection",  @"Calling IDSOTRController:startOTRNegotiationWithDeviceIfNeeded to force session negotiation.");
      }
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v15 setOTRTestBlockFromCompletionBlock:v8 token:v10];

  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  [v16 startOTRNegotiationWithDeviceIfNeeded:IDSDeviceDefaultPairedDeviceUniqueID token:v10 reset:1 errorHandler:0];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)maxQueueSize
{
  return self->_maxQueueSize;
}

- (void)setMaxQueueSize:(unint64_t)a3
{
  self->_unint64_t maxQueueSize = a3;
}

- (NSString)cbuuid
{
  return self->_cbuuid;
}

- (void)setCbuuid:(id)a3
{
}

- (BOOL)isAlwaysConnected
{
  return self->_isAlwaysConnected;
}

- (void)setIsAlwaysConnected:(BOOL)a3
{
  self->_isAlwaysConnected = a3;
}

- (NSDictionary)cumulativeIncomingStatistics
{
  return &self->_cumulativeIncomingStatistics->super;
}

- (NSDictionary)cumulativeOutgoingStatistics
{
  return &self->_cumulativeOutgoingStatistics->super;
}

- (BOOL)isCloudEnabled
{
  return self->_isCloudEnabled;
}

- (void)setSupportedMessageTypes:(id)a3
{
}

- (double)rtt
{
  return self->_rtt;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)idsPriority
{
  return self->_idsPriority;
}

- (void)setIdsPriority:(int64_t)a3
{
  self->_idsPriority = a3;
}

- (IDSUTunConnectionDelegate)delegate
{
  return (IDSUTunConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableOTR
{
  return self->_enableOTR;
}

- (BOOL)supportsLegacyOTRSessionToken
{
  return self->_supportsLegacyOTRSessionToken;
}

- (void)setSupportsLegacyOTRSessionToken:(BOOL)a3
{
  self->_supportsLegacyOTRSessionToken = a3;
}

- (IDSUTunConnection)cloudConnection
{
  return self->_cloudConnection;
}

- (void)setCloudConnection:(id)a3
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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end