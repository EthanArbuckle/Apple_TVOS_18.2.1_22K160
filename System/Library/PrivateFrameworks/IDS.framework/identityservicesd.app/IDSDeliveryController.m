@interface IDSDeliveryController
+ (id)sharedInstance;
+ (id)tokenURINegativeCacheItemForTokenURI:(id)a3 service:(id)a4;
- (BOOL)_forceAttachmentForMessage:(id)a3;
- (BOOL)_sendAsAttachmentForMessage:(id)a3 payloadData:(id)a4;
- (BOOL)isSupportedEngramVersionNumber:(int64_t)a3;
- (BOOL)shouldMinimizeBagCacheTime;
- (IDSDeliveryController)init;
- (id)_constructDeliveryPipeline;
- (id)_constructOfflineDeliveryPipeline;
- (id)_keyForURIs:(id)a3 service:(id)a4;
- (id)_tokenURIForToken:(id)a3 uri:(id)a4;
- (id)awdLogger;
- (id)encryptionController;
- (id)keyTransparencyVerifier;
- (id)peerIDManager;
- (id)pinnedIdentityController;
- (int64_t)_maxPayloadSizeForMessage:(id)a3;
- (int64_t)effectiveMaxPayloadSizeIfCanUseLargePayload:(BOOL)a3;
- (int64_t)groupCryptoMinVersionNumber;
- (unint64_t)_destinationCountForURIsAndTokens:(id)a3;
- (void)_checkFastDormancy;
- (void)_discardMessage:(id)a3 forURIs:(id)a4 service:(id)a5;
- (void)_emptyMessagesForURIs:(id)a3 service:(id)a4;
- (void)_handleAccessoryMessageForID:(id)a3 msg:(id)a4 service:(id)a5 fromID:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8;
- (void)_handleMessagesForURIs:(id)a3 originalURIs:(id)a4 service:(id)a5 fromID:(id)a6 fromCoalesceQueue:(BOOL)a7 withQueryCompletion:(id)a8;
- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5;
- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5 withCompletion:(id)a6;
- (void)_pipelinesHandleMessagesToCoalesce:(id)a3 forService:(id)a4 sendMode:(id)a5;
- (void)_processMessageResponse:(id)a3 error:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9;
- (void)_queueMessage:(id)a3 service:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 originallyToURIs:(id)a12 ktURIVerificationMap:(id)a13 canUseLargePayload:(BOOL)a14 sendOnePerToken:(BOOL)a15 registrationProperties:(id)a16 fakeMessage:(BOOL)a17 alwaysSkipSelf:(BOOL)a18 alwaysIncludeSelf:(BOOL)a19 forceQuery:(int64_t)a20 disallowRefresh:(BOOL)a21 prioritizedTokenList:(id)a22 wantsFirewallDonation:(BOOL)a23 destinationObject:(id)a24 willSendBlock:(id)a25 completionBlock:(id)a26 fromCoalesceQueue:(BOOL)a27;
- (void)_sendAttachmentWithGuid:(id)a3 service:(id)a4 topic:(id)a5 originalCommand:(id)a6 additionalDictionary:(id)a7 encryptedData:(id)a8 toToken:(id)a9 toID:(id)a10 fromID:(id)a11 fromIdentity:(id)a12 canUseLargePayload:(BOOL)a13 expirationDate:(id)a14 destinationObject:(id)a15 ackBlock:(id)a16 completionBlock:(id)a17;
- (void)_sendErrorDictionary:(id)a3 onService:(id)a4 fromID:(id)a5 fromIdentity:(id)a6 toID:(id)a7 toToken:(id)a8 topic:(id)a9 sendCompletionBlock:(id)a10;
- (void)_sendFTFanoutMessage:(id)a3 service:(id)a4 fromID:(id)a5 toURIs:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8;
- (void)_sendFTMessage:(id)a3 service:(id)a4 fromID:(id)a5 toID:(id)a6 toToken:(id)a7 toSessionToken:(id)a8 toURIs:(id)a9 fromIdentity:(id)a10 completionBlock:(id)a11;
- (void)_sendMessage:(id)a3 dataToEncrypt:(id)a4 withEncryptedAttributes:(id)a5 onService:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 canUseLargePayload:(BOOL)a12 sendOnePerToken:(BOOL)a13 allowPartialSendsToSucceed:(BOOL)a14 registrationProperties:(id)a15 fakeMessage:(BOOL)a16 alwaysSkipSelf:(BOOL)a17 alwaysIncludeSelf:(BOOL)a18 forceQuery:(int64_t)a19 disallowRefresh:(BOOL)a20 prioritizedTokenList:(id)a21 wantsFirewallDonation:(BOOL)a22 destinationObject:(id)a23 willSendBlock:(id)a24 completionBlock:(id)a25 firstAttemptDate:(id)a26 ktURIVerificationMap:(id)a27 fromCoalesceQueue:(BOOL)a28 withQueryCompletion:(id)a29;
- (void)_sendMessageDictionary:(id)a3 lastRetryInterval:(double)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 canUseLargePayload:(BOOL)a9 sendOnePerToken:(BOOL)a10 allowPartialSendsToSucceed:(BOOL)a11 highPriority:(BOOL)a12 fireAndForget:(BOOL)a13 expirationDate:(id)a14 enforceRemoteTimeouts:(BOOL)a15 messageID:(id)a16 fromID:(id)a17 fromShortHandle:(id)a18 fromIdentity:(id)a19 toID:(id)a20 toURIs:(id)a21 accessToken:(id)a22 topic:(id)a23 registrationProperties:(id)a24 fakeMessage:(BOOL)a25 alwaysSkipSelf:(BOOL)a26 alwaysIncludeSelf:(BOOL)a27 forceQuery:(int64_t)a28 pushPriority:(id)a29 ignoreMaxRetryCount:(BOOL)a30 disallowRefresh:(BOOL)a31 originalTimestamp:(id)a32 prioritizedTokenList:(id)a33 wantsFirewallDonation:(BOOL)a34 destinationObject:(id)a35 deliveryMinimumTimeDelay:(id)a36 deliveryMinimumTime:(id)a37 sendMode:(id)a38 KTURIVerificationMap:(id)a39 ackBlock:(id)a40 willSendBlock:(id)a41 sendCompletionBlock:(id)a42;
- (void)addTokenURINegativeCacheClearBlock;
- (void)dealloc;
- (void)handler:(id)a3 isConnectedChanged:(BOOL)a4;
- (void)queueManager:(id)a3 receivedMessagesToSend:(id)a4 forTopic:(id)a5 sendMode:(id)a6;
- (void)sendIDSMessage:(id)a3 service:(id)a4 topic:(id)a5 completionBlock:(id)a6;
- (void)sendMessageDictionary:(id)a3 messageID:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 expirationDate:(id)a9 enforceRemoteTimeouts:(BOOL)a10 canUseLargePayload:(BOOL)a11 sendOnePerToken:(BOOL)a12 allowPartialSendsToSucceed:(BOOL)a13 priority:(int64_t)a14 fireAndForget:(BOOL)a15 fromID:(id)a16 fromShortHandle:(id)a17 fromIdentity:(id)a18 toURIs:(id)a19 accessToken:(id)a20 topic:(id)a21 registrationProperties:(id)a22 fakeMessage:(BOOL)a23 alwaysSkipSelf:(BOOL)a24 alwaysIncludeSelf:(BOOL)a25 forceQuery:(int64_t)a26 pushPriority:(id)a27 ignoreMaxRetryCount:(BOOL)a28 disallowRefresh:(BOOL)a29 originalTimestamp:(id)a30 prioritizedTokenList:(id)a31 wantsFirewallDonation:(BOOL)a32 destinationObject:(id)a33 deliveryMinimumTimeDelay:(id)a34 deliveryMinimumTime:(id)a35 sendMode:(id)a36 KTURIVerificationMap:(id)a37 ackBlock:(id)a38 willSendBlock:(id)a39 sendCompletionBlock:(id)a40;
- (void)sendRTCMetricWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8;
- (void)setSenderKeyDistributionManager:(id)a3;
@end

@implementation IDSDeliveryController

+ (id)sharedInstance
{
  if (qword_1009BED70 != -1) {
    dispatch_once(&qword_1009BED70, &stru_1008FD030);
  }
  return (id)qword_1009BED78;
}

- (IDSDeliveryController)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IDSDeliveryController;
  v2 = -[IDSDeliveryController init](&v22, "init");
  if (v2)
  {
    id v3 = sub_10019E564();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    messageDelivery = v2->_messageDelivery;
    v2->_messageDelivery = (FTMessageDelivery *)v4;

    v6 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  10LL,  1800.0);
    tokenURINegativeCache = v2->_tokenURINegativeCache;
    v2->_tokenURINegativeCache = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
    uint64_t v10 = im_primary_queue(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v8 addListener:v2 topics:0 commands:0 queue:v11];

    v12 = objc_alloc(&OBJC_CLASS___IDSCoalesceMessageQueueManager);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v14 = -[IDSCoalesceMessageQueueManager initWithBag:](v12, "initWithBag:", v13);
    coalesceMessageQueueManager = v2->_coalesceMessageQueueManager;
    v2->_coalesceMessageQueueManager = v14;

    -[IDSCoalesceMessageQueueManager setDelegate:](v2->_coalesceMessageQueueManager, "setDelegate:", v2);
    -[FTMessageDelivery setDisallowRetry:](v2->_messageDelivery, "setDisallowRetry:", 0LL);
    if (-[IDSDeliveryController shouldMinimizeBagCacheTime](v2, "shouldMinimizeBagCacheTime"))
    {
      uint64_t v16 = OSLogHandleForIDSCategory("IDSDelivery");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Forcing a bag fetch to refresh EN versioning",  v21,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v18)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Forcing a bag fetch to refresh EN versioning");
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
      [v19 forceBagLoad];
    }

    -[IDSDeliveryController addTokenURINegativeCacheClearBlock](v2, "addTokenURINegativeCacheClearBlock");
  }

  return v2;
}

- (void)setSenderKeyDistributionManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_senderKeyDistributionManager, a3);
    id v5 = v6;
  }
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
  [v3 removeFastDormancyDisableToken:@"IDSDeliveryManager"];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  [v4 removeListener:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSDeliveryController;
  -[IDSDeliveryController dealloc](&v5, "dealloc");
}

- (id)awdLogger
{
  return +[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance");
}

- (BOOL)shouldMinimizeBagCacheTime
{
  return 0;
}

- (int64_t)groupCryptoMinVersionNumber
{
  if (-[IDSDeliveryController shouldMinimizeBagCacheTime](self, "shouldMinimizeBagCacheTime"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    [v2 startBagLoad];
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"gc-min-version"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)) {
    int64_t v7 = (int)[v4 intValue];
  }
  else {
    int64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)isSupportedEngramVersionNumber:(int64_t)a3
{
  return -[IDSDeliveryController groupCryptoMinVersionNumber](self, "groupCryptoMinVersionNumber") <= a3;
}

- (void)addTokenURINegativeCacheClearBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController peerIDManager](self, "peerIDManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001B1BA8;
  v4[3] = &unk_1008FD058;
  objc_copyWeak(&v5, &location);
  [v3 addClientDataUpdateBlock:v4 forToken:@"ratelimiter-clear-on-success"];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)tokenURINegativeCacheItemForTokenURI:(id)a3 service:(id)a4
{
  uint64_t v4 = 0LL;
  if (a3 && a4)
  {
    id v6 = a4;
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 prefixedURI]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v7, v6));
  }

  return v4;
}

- (void)handler:(id)a3 isConnectedChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && -[NSMutableArray count](self->_pendingOfflineMessages, "count"))
  {
    uint64_t v7 = OSLogHandleForIDSCategory("IDSDelivery");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = -[NSMutableArray count](self->_pendingOfflineMessages, "count");
      *(_DWORD *)buf = 134218240;
      id v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = 0x4024000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IDSDelivery has %lu pending offline messages and sees that push is now connected - scheduling a send attempt in %f seconds.",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"IDSDelivery"))
    {
      -[NSMutableArray count](self->_pendingOfflineMessages, "count");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"IDSDelivery has %lu pending offline messages and sees that push is now connected - scheduling a send attempt in %f seconds.");
    }

    v11 = self->_pendingOfflineMessages;
    pendingOfflineMessages = self->_pendingOfflineMessages;
    self->_pendingOfflineMessages = 0LL;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001B1EDC;
    v14[3] = &unk_1008F5F80;
    v15 = v11;
    uint64_t v16 = self;
    v13 = v11;
    im_dispatch_after_primary_queue(v14, 10.0);
  }
}

- (int64_t)effectiveMaxPayloadSizeIfCanUseLargePayload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (uint64_t)-[FTMessageDelivery maxLargeMessageSize](self->_messageDelivery, "maxLargeMessageSize");
  unint64_t v6 = v5 & ~(v5 >> 63);
  uint64_t v7 = (uint64_t)-[FTMessageDelivery maxMessageSize](self->_messageDelivery, "maxMessageSize");
  unint64_t v8 = v7 & ~(v7 >> 63);
  int v9 = _os_feature_enabled_impl("IDS", "ReducedLargePayloadSizeOverhead");
  int v10 = v9;
  if (v6 <= v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v6;
  }
  if (!v3) {
    uint64_t v11 = v8;
  }
  double v12 = 0.6;
  if (v3) {
    double v12 = 0.9;
  }
  uint64_t v13 = (uint64_t)(v12 * (double)v11);
  if ((v3 & v9) != 0) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.8;
  }
  uint64_t v15 = v11 - 1000;
  if (v15 >= v13) {
    uint64_t v15 = v13;
  }
  int64_t v16 = (uint64_t)(v14 * (double)v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = @"NO";
    int v21 = 134219010;
    int64_t v22 = v16;
    if (v3) {
      __int16 v19 = @"YES";
    }
    else {
      __int16 v19 = @"NO";
    }
    __int16 v23 = 2112;
    v24 = v19;
    if (v10) {
      id v18 = @"YES";
    }
    __int16 v25 = 2112;
    v26 = v18;
    __int16 v27 = 2048;
    unint64_t v28 = v6;
    __int16 v29 = 2048;
    unint64_t v30 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "-effectiveMaxPayloadSizeIfCanUseLargePayload: {effectiveSizeToReturn: %ld, canUseLargePayload: %@, ReducedLargePay loadSizeOverhead: %@, courierAllowedLargeSize: %ld, courierAllowedNormalSize: %ld}",  (uint8_t *)&v21,  0x34u);
  }

  return v16;
}

- (void)_processMessageResponse:(id)a3 error:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9
{
  id v15 = a3;
  id v63 = a4;
  id v64 = a6;
  id v65 = a7;
  id v16 = a8;
  id v17 = a9;
  if (a5 == 7000)
  {
    uint64_t v56 = OSLogHandleForIDSCategory("Warning");
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v67 = v65;
      __int16 v68 = 2112;
      id v69 = v64;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "Message was rate limited from the server, failing message (%@ -> %@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v58))
    {
      _IDSWarnV(@"IDSFoundation", @"Message was rate limited from the server, failing message (%@ -> %@)");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Message was rate limited from the server, failing message (%@ -> %@)");
      _IDSLogTransport( @"Warning",  @"IDS",  @"Message was rate limited from the server, failing message (%@ -> %@)");
    }
  }

  else if (a5 == 5032)
  {
    id v61 = v17;
    v62 = self;
    uint64_t v18 = OSLogHandleForIDSCategory("IDSDelivery");
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Bad signature for message: %@    blowing peer tokens",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"IDSDelivery"))
    {
      v59 = v15;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Bad signature for message: %@    blowing peer tokens");
    }

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___IDSPeerMessage, v21);
    if ((objc_opt_isKindOfClass(v15, v22) & 1) != 0)
    {
      uint64_t v23 = OSLogHandleForIDSCategory("IDSDelivery");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v15 targetPeerID]);
        *(_DWORD *)buf = 138412290;
        id v67 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " targetPeerID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v26)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v15 targetPeerID]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @" targetPeerID: %@");
      }

      uint64_t v27 = OSLogHandleForIDSCategory("IDSDelivery");
      unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v15 sourcePeerID]);
        *(_DWORD *)buf = 138412290;
        id v67 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " sourcePeerID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v30)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v15 sourcePeerID]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @" sourcePeerID: %@");
      }

      uint64_t v31 = OSLogHandleForIDSCategory("IDSDelivery");
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v15 targetToken]);
        *(_DWORD *)buf = 138412290;
        id v67 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "  targetToken: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v34)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v15 targetToken]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"  targetToken: %@");
      }

      uint64_t v35 = OSLogHandleForIDSCategory("IDSDelivery");
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v15 targetSessionToken]);
        *(_DWORD *)buf = 138412290;
        id v67 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, " sessionToken: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v38)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v15 targetSessionToken]);
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @" sessionToken: %@");
      }

      uint64_t v39 = OSLogHandleForIDSCategory("IDSDelivery");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v16;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "      service: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v41)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        v59 = v16;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"      service: %@");
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController peerIDManager](self, "peerIDManager", v59));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v15 targetPeerID]);
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v43,  v16));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v15 targetToken]);
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v45,  v16));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v15 sourcePeerID]);
      v48 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v47,  v16));
      LOBYTE(v60) = 0;
      v49 = (void *)objc_claimAutoreleasedReturnValue( [v42 sessionTokenForURI:v44 pushToken:v46 fromURI:v48 service:v16 expirationDate:0 refreshDate:0 fromIdentity:v61 includeSelfDevice:v60]);

      uint64_t v50 = OSLogHandleForIDSCategory("IDSDelivery");
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v49;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, " current sessionToken: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v52)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        v59 = v49;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @" current sessionToken: %@");
      }
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController peerIDManager](v62, "peerIDManager", v59));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v64,  v16));
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v65,  v16));
    [v53 forgetPeerTokensForURI:v54 fromURI:v55 service:v16];

    id v17 = v61;
  }
}

- (id)_keyForURIs:(id)a3 service:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", a3));
  [v6 addObject:v5];

  return v6;
}

- (void)_checkFastDormancy
{
  id v2 = -[NSMutableDictionary count](self->_messageQueue, "count");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
  id v4 = v3;
  if (v2) {
    [v3 addFastDormancyDisableToken:@"IDSDeliveryManager"];
  }
  else {
    [v3 removeFastDormancyDisableToken:@"IDSDeliveryManager"];
  }
}

- (void)_handleAccessoryMessageForID:(id)a3 msg:(id)a4 service:(id)a5 fromID:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v34 = a5;
  id v35 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  uint64_t v18 = OSLogHandleForIDSCategory("IDSDelivery");
  __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Message is destined for an accessory with uri %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    v32 = v17;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Message is destined for an accessory with uri %@");
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessToken", v32));

  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 prefixedURI]);
    unsigned int v23 = [v22 hasPrefix:@"accessory:"];

    if (v23)
    {
      id v24 = (id)objc_claimAutoreleasedReturnValue([v17 unprefixedURI]);
    }

    else
    {
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 prefixedURI]);
      id v24 = [v25 copy];
    }

    [v14 setTargetPeerID:v24];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1001B31BC;
    v36[3] = &unk_1008FD080;
    id v26 = v14;
    id v37 = v26;
    id v27 = v17;
    id v38 = v27;
    id v39 = v16;
    unint64_t v28 = objc_retainBlock(v36);
    uint64_t v29 = OSLogHandleForIDSCategory("IDSDelivery");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Sending To %@", buf, 0xCu);
    }

    -[IDSDeliveryController _sendFTMessage:service:fromID:toID:toToken:toSessionToken:toURIs:fromIdentity:completionBlock:]( self,  "_sendFTMessage:service:fromID:toID:toToken:toSessionToken:toURIs:fromIdentity:completionBlock:",  v26,  v34,  v35,  v24,  0LL,  0LL,  0LL,  v15,  v28);
  }
}

- (void)_handleMessagesForURIs:(id)a3 originalURIs:(id)a4 service:(id)a5 fromID:(id)a6 fromCoalesceQueue:(BOOL)a7 withQueryCompletion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v45 = (NSMutableArray *)a4;
  id v48 = a5;
  id v15 = a6;
  v44 = (void (**)(id, NSMutableArray *))a8;
  value = v14;
  if ([v14 count])
  {
    v49 = self;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:", v45, v48));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_messageQueue, "objectForKey:", v43));
    uint64_t v17 = OSLogHandleForIDSCategory("IDSDelivery");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v58 = v14;
      __int16 v59 = 2112;
      uint64_t v60 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Handling message queue With Fanout for display IDs: %@  (originalURIs: %@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(0LL, @"IDSDelivery"))
    {
      id v41 = v14;
      v42 = v45;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Handling message queue With Fanout for display IDs: %@  (originalURIs: %@)");
    }

    uint64_t v20 = OSLogHandleForIDSCategory("IDSDelivery");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_messageQueue, "allKeys"));
      *(_DWORD *)buf = 138412290;
      id v58 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "   Queue: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v23) && _IDSShouldLog(0LL, @"IDSDelivery"))
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_messageQueue, "allKeys"));
      _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"   Queue: %@");
    }

    v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id obj = v16;
    id v24 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v53;
      uint64_t v26 = IDSDeliveryFromIDKey;
      id v27 = (const void *)IDSDeliveryFinalURIsKey;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v53 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          if (v15
            && (uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v52 + 1) + 8 * (void)i) objectForKeyedSubscript:v26]),  v31 = objc_msgSend(v15, "isEqualToString:", v30),  v30,  (v31 & 1) == 0))
          {
            -[NSMutableArray addObject:](v46, "addObject:", v29);
          }

          else if (v9)
          {
            v32 = (__CFDictionary *)objc_msgSend(v29, "mutableCopy", v41, v42);
            v33 = v32;
            if (value) {
              CFDictionarySetValue(v32, v27, value);
            }
            -[NSMutableArray addObject:](v47, "addObject:", v33);
          }

          else
          {
            -[IDSDeliveryController _pipelineHandleMessage:forURIs:service:]( v49,  "_pipelineHandleMessage:forURIs:service:",  v29,  value,  v48);
          }
        }

        id v24 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      }

      while (v24);
    }

    v44[2](v44, v47);
    if (obj)
    {
      if (-[NSMutableArray count](v46, "count"))
      {
        uint64_t v34 = OSLogHandleForIDSCategory("IDSDelivery");
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v58 = v15;
          __int16 v59 = 2112;
          uint64_t v60 = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  " FromID didn't match some messages, keeping some messages in queue {fromID: %@, toKeep: %@}",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v36)
          && _IDSShouldLog(0LL, @"IDSDelivery"))
        {
          id v41 = v15;
          v42 = v46;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @" FromID didn't match some messages, keeping some messages in queue {fromID: %@, toKeep: %@}");
        }

        -[NSMutableDictionary setObject:forKey:](v49->_messageQueue, "setObject:forKey:", v46, v43, v41, v42);
      }

      else
      {
        uint64_t v37 = OSLogHandleForIDSCategory("IDSDelivery");
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, " Flushing message queue", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled(v39)
          && _IDSShouldLog(0LL, @"IDSDelivery"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @" Flushing message queue");
        }

        -[NSMutableDictionary removeObjectForKey:](v49->_messageQueue, "removeObjectForKey:", v43, v41);
        if (!-[NSMutableDictionary count](v49->_messageQueue, "count"))
        {
          messageQueue = v49->_messageQueue;
          v49->_messageQueue = 0LL;
        }
      }
    }

    -[IDSDeliveryController _checkFastDormancy](v49, "_checkFastDormancy", v41);
  }
}

- (BOOL)_sendAsAttachmentForMessage:(id)a3 payloadData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDeliveryMessageKey]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageBody]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSCommandKey]);
  unint64_t v11 = -[IDSDeliveryController _maxPayloadSizeForMessage:](self, "_maxPayloadSizeForMessage:", v6);
  uint64_t v12 = OSLogHandleForIDSCategory("IDSDelivery");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = [v9 count];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Checking the estimated payload size for message not requesting encryption... %d B",  buf,  8u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(1LL, @"IDSDelivery"))
  {
    id v27 = [v9 count];
    _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDelivery",  @"Checking the estimated payload size for message not requesting encryption... %d B");
  }

  BOOL v16 = -[IDSDeliveryController _forceAttachmentForMessage:](self, "_forceAttachmentForMessage:", v6, v27);
  if (v7 && (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData, v15), (objc_opt_isKindOfClass(v7, v17) & 1) != 0))
  {
    id v18 = [v7 length];
  }

  else
  {
    id v18 = 0LL;
  }

  if ([v10 integerValue] == (id)104)
  {
    uint64_t v19 = OSLogHandleForIDSCategory("IDSDelivery");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Attachment commands must not be forced to send as attachments",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v21) && _IDSShouldLog(0LL, @"IDSDelivery")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Attachment commands must not be forced to send as attachments");
    }
    BOOL v16 = 0;
  }

  uint64_t v22 = OSLogHandleForIDSCategory("IDSDelivery");
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = @"NO";
    if (v16) {
      id v24 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = v24;
    __int16 v30 = 2048;
    id v31 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  " sendAsAttachment? %@ The payload is %lu bytes.",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v25) && _IDSShouldLog(0LL, @"IDSDelivery")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @" sendAsAttachment? %@ The payload is %lu bytes.");
  }

  return v16;
}

- (BOOL)_forceAttachmentForMessage:(id)a3
{
  int v3 = IMGetCachedDomainBoolForKey(@"com.apple.ids", @"ForceAttachmentMessage", a3);
  if (v3) {
    _IMWarn(@"Forcing attachment message default set");
  }
  return v3;
}

- (int64_t)_maxPayloadSizeForMessage:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:IDSDeliveryCanUseLargePayloadKey]);
  id v5 = [v4 BOOLValue];

  return -[IDSDeliveryController effectiveMaxPayloadSizeIfCanUseLargePayload:]( self,  "effectiveMaxPayloadSizeIfCanUseLargePayload:",  v5);
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (id)keyTransparencyVerifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance](&OBJC_CLASS___IDSKeyTransparencyVerifier, "sharedInstance");
}

- (id)encryptionController
{
  return +[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance");
}

- (id)pinnedIdentityController
{
  return +[IDSPinnedIdentityController sharedInstance](&OBJC_CLASS___IDSPinnedIdentityController, "sharedInstance");
}

- (unint64_t)_destinationCountForURIsAndTokens:(id)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = a3;
  unint64_t v4 = 0LL;
  id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v7)]);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"push-tokens"]);
        id v10 = [v9 count];

        v4 += (unint64_t)v10;
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v5);
  }

  uint64_t v11 = OSLogHandleForIDSCategory("IDSDelivery");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "We will send %@ individual messages",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"We will send %@ individual messages");
  }

  return v4;
}

- (void)_emptyMessagesForURIs:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    messageQueue = self->_messageQueue;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:", v6, v7));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](messageQueue, "objectForKey:", v9));

    if (v10)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("IDSDelivery");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Emptying message queue for URIs: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v13)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        id v20 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"Emptying message queue for URIs: %@");
      }

      uint64_t v14 = self->_messageQueue;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:", v6, v7, v20));
      -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

      if (!-[NSMutableDictionary count](self->_messageQueue, "count"))
      {
        BOOL v16 = self->_messageQueue;
        self->_messageQueue = 0LL;
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("IDSDelivery");
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No queued items to remove for URIs: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        id v20 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"No queued items to remove for URIs: %@");
      }
    }

    -[IDSDeliveryController _checkFastDormancy](self, "_checkFastDormancy", v20);
  }
}

- (void)_discardMessage:(id)a3 forURIs:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    messageQueue = self->_messageQueue;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:", v9, v10));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](messageQueue, "objectForKey:", v12));

    if (v13 && (id v14 = [v13 indexOfObjectIdenticalTo:v8], v14 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      id v18 = v14;
      uint64_t v19 = OSLogHandleForIDSCategory("IDSDelivery");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Removing message from queue for URIs: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v21)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        id v25 = v9;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"Removing message from queue for URIs: %@");
      }

      objc_msgSend(v13, "removeObjectAtIndex:", v18, v25);
      if (![v13 count])
      {
        id v22 = self->_messageQueue;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:", v9, v10));
        -[NSMutableDictionary removeObjectForKey:](v22, "removeObjectForKey:", v23);

        if (!-[NSMutableDictionary count](self->_messageQueue, "count"))
        {
          id v24 = self->_messageQueue;
          self->_messageQueue = 0LL;
        }
      }
    }

    else
    {
      uint64_t v15 = OSLogHandleForIDSCategory("IDSDelivery");
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No queued message matched for removal for URIs: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v17)
        && _IDSShouldLog(0LL, @"IDSDelivery"))
      {
        id v25 = v9;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"No queued message matched for removal for URIs: %@");
      }
    }

    -[IDSDeliveryController _checkFastDormancy](self, "_checkFastDormancy", v25);
  }
}

- (void)_queueMessage:(id)a3 service:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 originallyToURIs:(id)a12 ktURIVerificationMap:(id)a13 canUseLargePayload:(BOOL)a14 sendOnePerToken:(BOOL)a15 registrationProperties:(id)a16 fakeMessage:(BOOL)a17 alwaysSkipSelf:(BOOL)a18 alwaysIncludeSelf:(BOOL)a19 forceQuery:(int64_t)a20 disallowRefresh:(BOOL)a21 prioritizedTokenList:(id)a22 wantsFirewallDonation:(BOOL)a23 destinationObject:(id)a24 willSendBlock:(id)a25 completionBlock:(id)a26 fromCoalesceQueue:(BOOL)a27
{
  id v32 = a3;
  id v33 = a4;
  id value = a5;
  id v84 = a6;
  id v79 = a7;
  id v80 = a8;
  uint64_t v34 = v33;
  id v81 = a9;
  id v82 = a10;
  id v35 = a11;
  id v36 = a12;
  id v75 = a13;
  id v78 = a16;
  id v77 = a22;
  id v76 = a24;
  id v74 = a25;
  id v37 = a26;
  id v38 = [v35 count];
  if (v32 && v38)
  {
    uint64_t v39 = OSLogHandleForIDSCategory("IDSDelivery");
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v86 = v32;
      __int16 v87 = 2112;
      id v88 = v35;
      __int16 v89 = 2112;
      v90 = v34;
      __int16 v91 = 2112;
      id v92 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Enqueuing message: %@  to people: %@ service: %@ (original: %@)",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v41) && _IDSShouldLog(0LL, @"IDSDelivery"))
    {
      id v69 = v34;
      id v70 = v36;
      id v67 = v32;
      id v68 = v35;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Enqueuing message: %@  to people: %@ service: %@ (original: %@)");
    }

    if (objc_msgSend(v36, "count", v67, v68, v69, v70)) {
      v42 = v36;
    }
    else {
      v42 = v35;
    }
    id v43 = v42;
    messageQueue = self->_messageQueue;
    id v71 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](self, "_keyForURIs:service:"));
    v46 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](messageQueue, "objectForKey:", v45));

    if (!v46)
    {
      v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v47 = self;
      id v48 = self->_messageQueue;
      if (!v48)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        uint64_t v50 = self->_messageQueue;
        self->_messageQueue = Mutable;

        id v48 = self->_messageQueue;
        v47 = self;
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _keyForURIs:service:](v47, "_keyForURIs:service:", v71, v34));
      -[NSMutableDictionary setObject:forKey:](v48, "setObject:forKey:", v46, v51);
    }

    if (v37)
    {
      id v52 = [v37 copy];
      id v53 = objc_retainBlock(v52);
    }

    else
    {
      id v53 = 0LL;
    }

    if (v74)
    {
      id v54 = [v74 copy];
      id v72 = objc_retainBlock(v54);
    }

    else
    {
      id v72 = 0LL;
    }

    __int128 v55 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryMessageKey, v32);
    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryDataToEncryptKey, value);
    }
    if (v84) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryEncryptionAttributesKey, v84);
    }
    id v56 = objc_retainBlock(v53);
    if (v56) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryCompletionBlockKey, v56);
    }

    id v57 = objc_retainBlock(v72);
    if (v57) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryWillSendBlockKey, v57);
    }

    if (v79) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryFromIDKey, v79);
    }
    if (v80) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryFromShortHandle, v80);
    }
    if (v81) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryFromIdentityKey, v81);
    }
    if (v82) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryToIDKey, v82);
    }
    if (v36) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryOriginalURIsKey, v36);
    }
    if (v34) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryServiceKey, v34);
    }
    id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a14));
    if (v58) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryCanUseLargePayloadKey, v58);
    }

    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a15));
    if (v59) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliverySendOnePerTokenKey, v59);
    }

    if (v78) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryRegistrationPropertiesKey, v78);
    }
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a17));
    if (v60) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryFakeMessageKey, v60);
    }

    id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a18));
    if (v61) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryAlwaysSkipSelfKey, v61);
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a19));
    if (v62) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryAlwaysIncludeSelfKey, v62);
    }

    id v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a20));
    if (v63) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryForceQueryKey, v63);
    }

    id v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a21));
    if (v64) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryDisallowQueryRefreshKey, v64);
    }

    if (v77) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryPrioritizedTokenListKey, v77);
    }
    id v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a23));
    if (v65) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryWantsFirewallDonation, v65);
    }

    if (v76) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryIDSDestinationKey, v76);
    }
    if (v75) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryKeyTransparencyURIVerificationMapKey, v75);
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a27));
    if (v66) {
      CFDictionarySetValue((CFMutableDictionaryRef)v55, IDSDeliveryFromCoalesceQueueKey, v66);
    }

    -[NSMutableArray addObject:](v46, "addObject:", v55);
    -[IDSDeliveryController _checkFastDormancy](self, "_checkFastDormancy");
  }
}

- (void)_sendFTMessage:(id)a3 service:(id)a4 fromID:(id)a5 toID:(id)a6 toToken:(id)a7 toSessionToken:(id)a8 toURIs:(id)a9 fromIdentity:(id)a10 completionBlock:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v64 = a7;
  id v61 = a8;
  id v62 = a9;
  id v60 = a10;
  id v58 = a11;
  unsigned int v59 = [v18 isEqualToString:v19];
  uint64_t v20 = OSLogHandleForIDSCategory("IDSDelivery");
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v17;
    if (v59) {
      uint64_t v23 = @"YES";
    }
    else {
      uint64_t v23 = @"NO";
    }
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 wantsDeliveryStatus]);
    unsigned int v25 = [v24 intValue];
    unsigned int v26 = [v16 wantsCertifiedDelivery];
    *(_DWORD *)buf = 138414082;
    if (v25) {
      id v27 = @"YES";
    }
    else {
      id v27 = @"NO";
    }
    id v74 = v16;
    if (v26) {
      unint64_t v28 = @"YES";
    }
    else {
      unint64_t v28 = @"NO";
    }
    __int16 v75 = 2112;
    id v76 = v18;
    __int16 v77 = 2112;
    id v78 = v19;
    __int16 v79 = 2112;
    id v80 = v64;
    __int16 v81 = 2112;
    id v82 = v62;
    __int16 v83 = 2112;
    id v84 = v23;
    __int16 v85 = 2112;
    id v86 = v27;
    __int16 v87 = 2112;
    id v88 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "send FTMessage: %@   fromID: %@   toID: %@  toToken: %@  toURIs: %@  toMe: %@  delivery status: %@ certified delivery: %@",  buf,  0x52u);

    id v17 = v22;
  }

  if (os_log_shim_legacy_logging_enabled(v29) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    if (v59) {
      id v31 = @"YES";
    }
    else {
      id v31 = @"NO";
    }
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v16 wantsDeliveryStatus]);
    else {
      id v33 = @"NO";
    }
    else {
      uint64_t v34 = @"NO";
    }
    id v56 = v33;
    id v57 = v34;
    id v54 = v62;
    __int128 v55 = v31;
    id v52 = v19;
    id v53 = v64;
    id v50 = v16;
    id v51 = v18;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"send FTMessage: %@   fromID: %@   toID: %@  toToken: %@  toURIs: %@  toMe: %@  delivery status: %@ certified delivery: %@");
  }

  if (v64)
  {
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___IDSPeerMessage, v30);
    if ((objc_opt_isKindOfClass(v16, v35) & 1) != 0)
    {
      if (!v61)
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController peerIDManager](self, "peerIDManager"));
        id v37 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v19,  v17));
        id v38 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v64,  v17));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v18,  v17));
        LOBYTE(v51) = 0;
        id v61 = (id)objc_claimAutoreleasedReturnValue( [v36 sessionTokenForURI:v37 pushToken:v38 fromURI:v39 service:v17 expirationDate:0 refreshDate:0 fromIdentity:v60 includeSelfDevice:v51]);
      }

      objc_msgSend(v16, "setTargetToken:", v64, v50, v51, v52, v53, v54, v55, v56, v57);
      [v16 setSourcePeerID:v18];
      [v16 setTargetSessionToken:v61];
      [v16 setTargetPeerID:v19];
      if (v59)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v16 wantsDeliveryStatus]);
        BOOL v41 = [v40 intValue] == 0;

        if (!v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
          [v16 setWantsDeliveryStatus:v42];
        }
      }
    }
  }

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1001B5240;
  v65[3] = &unk_1008FD0A8;
  id v66 = v19;
  id v67 = v18;
  id v68 = self;
  id v69 = v17;
  id v70 = v60;
  id v71 = v62;
  id v72 = v58;
  id v43 = v62;
  v44 = v17;
  id v45 = v58;
  id v46 = v60;
  id v47 = v44;
  id v48 = v18;
  id v49 = v19;
  [v16 setCompletionBlock:v65];
  -[FTMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v16);
  -[IDSDeliveryController _checkFastDormancy](self, "_checkFastDormancy");
}

- (void)_sendFTFanoutMessage:(id)a3 service:(id)a4 fromID:(id)a5 toURIs:(id)a6 fromIdentity:(id)a7 completionBlock:(id)a8
{
  id v64 = a3;
  id v58 = a4;
  id v62 = a5;
  id v61 = a6;
  id v59 = a7;
  id v60 = a8;
  uint64_t v13 = OSLogHandleForIDSCategory("IDSDelivery");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue([v64 messageID]);
    a4 = (id)objc_claimAutoreleasedReturnValue([v64 groupPayload]);
    if (a4) {
      id v16 = @"YES";
    }
    else {
      id v16 = @"NO";
    }
    id v17 = (id)objc_claimAutoreleasedReturnValue([v64 chunkNumber]);
    else {
      id v18 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    id v86 = v64;
    __int16 v87 = 2112;
    id v88 = v15;
    __int16 v89 = 2112;
    v90 = (void *)v16;
    __int16 v91 = 2112;
    id v92 = v17;
    __int16 v93 = 2112;
    v94 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "    Told to send Fanout Message: %@ GUID: %@ isEngram? %@ Chunk: %@ isFinal?: %@ ",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v64 messageID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v64 groupPayload]);
    if (v21) {
      id v22 = @"YES";
    }
    else {
      id v22 = @"NO";
    }
    a4 = (id)objc_claimAutoreleasedReturnValue([v64 chunkNumber]);
    else {
      uint64_t v23 = @"NO";
    }
    id v56 = a4;
    id v57 = v23;
    id v54 = v20;
    __int128 v55 = (void *)v22;
    id v53 = v64;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"    Told to send Fanout Message: %@ GUID: %@ isEngram? %@ Chunk: %@ isFinal?: %@ ");
  }

  id v67 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v66 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v64 individualPeerMessages]);
  id v24 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (!v24)
  {

LABEL_37:
    objc_msgSend(v64, "setWantsCertifiedDelivery:", 1, v53, v54, v55);
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v64 individualPeerMessages]);
    id v35 = [v34 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v76;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v76 != v36) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * (void)i) setWantsCertifiedDelivery:0];
        }

        id v35 = [v34 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }

      while (v35);
    }

    goto LABEL_45;
  }

  uint64_t v25 = *(void *)v80;
  unsigned __int8 v26 = 1;
  do
  {
    for (j = 0LL; j != v24; j = (char *)j + 1)
    {
      if (*(void *)v80 != v25) {
        objc_enumerationMutation(obj);
      }
      unint64_t v28 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)j);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dictionaryRepresentation", v53, v54, v55, v56, v57));
      -[NSMutableSet addObject:](v66, "addObject:", v29);

      uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 encryptionType]);
      id v31 = v30;
      if (!v30)
      {
        id v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v64 encryptionType]);
        a4 = v32;
        if (v32) {
          id v31 = v32;
        }
        else {
          id v31 = @"none";
        }
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue([v28 targetToken]);
      -[NSMutableDictionary setObject:forKey:](v67, "setObject:forKey:", v31, v33);

      if (!v30) {
      if ((v26 & 1) != 0)
      }
        unsigned __int8 v26 = [v28 wantsCertifiedDelivery];
      else {
        unsigned __int8 v26 = 0;
      }
    }

    id v24 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
  }

  while (v24);

  if ((v26 & 1) != 0) {
    goto LABEL_37;
  }
LABEL_45:
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v64 encryptionType]);
  if (v38)
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v64 encryptionType]);
    unsigned __int8 v40 = [v39 isEqualToString:@"none"];

    if ((v40 & 1) == 0)
    {
      uint64_t v41 = OSLogHandleForIDSCategory("1to1EC");
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = (id)objc_claimAutoreleasedReturnValue([v64 messageID]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v64 encryptionType]);
        *(_DWORD *)buf = 138412802;
        id v86 = v43;
        __int16 v87 = 2112;
        id v88 = v44;
        __int16 v89 = 2112;
        v90 = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Sending %@ with top-level encryption type %@ and dtls: %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v45) && _IDSShouldLog(0LL, @"1to1EC"))
      {
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v64 messageID]);
        id v54 = (void *)objc_claimAutoreleasedReturnValue([v64 encryptionType]);
        __int128 v55 = v67;
        id v53 = v46;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"1to1EC",  @"Sending %@ with top-level encryption type %@ and dtls: %@");
      }
    }
  }

  if (objc_msgSend(v64, "isFinalMessage", v53, v54, v55))
  {
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v64 individualPeerMessages]);
    BOOL v48 = [v47 count] == (id)1;
  }

  else
  {
    BOOL v48 = 0;
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1001B6578;
  v68[3] = &unk_1008FD0D0;
  id v69 = v66;
  id v70 = v62;
  BOOL v74 = v48;
  id v71 = v61;
  id v72 = self;
  id v73 = v60;
  id v49 = v61;
  id v50 = v60;
  id v51 = v62;
  id v52 = v66;
  [v64 setCompletionBlock:v68];
  -[FTMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", v64);
  -[IDSDeliveryController _checkFastDormancy](self, "_checkFastDormancy");
}

- (void)_sendAttachmentWithGuid:(id)a3 service:(id)a4 topic:(id)a5 originalCommand:(id)a6 additionalDictionary:(id)a7 encryptedData:(id)a8 toToken:(id)a9 toID:(id)a10 fromID:(id)a11 fromIdentity:(id)a12 canUseLargePayload:(BOOL)a13 expirationDate:(id)a14 destinationObject:(id)a15 ackBlock:(id)a16 completionBlock:(id)a17
{
  id v59 = (__CFString *)a3;
  id v22 = a4;
  id v60 = a5;
  id v52 = a6;
  id v53 = a7;
  id v58 = a8;
  id v61 = a9;
  id v23 = a10;
  id v62 = a11;
  id v54 = a12;
  id v55 = a14;
  id v56 = a15;
  id v57 = a16;
  id v24 = a17;
  uint64_t v25 = OSLogHandleForIDSCategory("IDSDelivery");
  unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    __int128 v81 = v59;
    __int16 v82 = 2112;
    id v83 = v60;
    __int16 v84 = 2112;
    id v85 = v61;
    __int16 v86 = 2112;
    id v87 = v23;
    __int16 v88 = 2112;
    id v89 = v62;
    __int16 v90 = 2112;
    id v91 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Asked to sendAttachmentWithGUID %@  topic %@ toToken %@ toID %@ fromID %@ service: %@",  buf,  0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled(v27) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    id v49 = v62;
    id v50 = v22;
    id v47 = v61;
    id v48 = v23;
    v44 = v59;
    id v46 = v60;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Asked to sendAttachmentWithGUID %@  topic %@ toToken %@ toID %@ fromID %@ service: %@");
  }

  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager defaultManager]( &OBJC_CLASS___NSFileManager,  "defaultManager",  v44,  v46,  v47,  v48,  v49,  v50));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _randomTemporaryPathWithSuffix:0]);

  if (v29)
  {
    if ([v58 writeToFile:v29 atomically:1])
    {
      uint64_t v30 = OSLogHandleForIDSCategory("Attachments");
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v81 = @"YES";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "    Wrote data to path: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v32)
        && _IDSShouldLog(0LL, @"Attachments"))
      {
        uint64_t v45 = @"YES";
        _IDSLogV(0LL, @"IDSFoundation", @"Attachments", @"    Wrote data to path: %@");
      }

      id v33 = objc_msgSend(v24, "copy", v45);

      uint64_t v34 = -[IDSServiceProperties initWithServiceIdentifier:]( objc_alloc(&OBJC_CLASS___IDSServiceProperties),  "initWithServiceIdentifier:",  v22);
      id v35 = (NSError *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties dataUsageBundleID](v34, "dataUsageBundleID"));
      id v36 = -[IDSDaemon _IMTransferServiceController]_0();
      id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByResolvingAndStandardizingPath]);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUIDForObject:](&OBJC_CLASS___NSString, "stringGUIDForObject:", v29));
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_1001B7810;
      v63[3] = &unk_1008FD160;
      id v64 = (IDSDeliveryContext *)v53;
      id v65 = v52;
      id v66 = v59;
      id v77 = v33;
      id v67 = v29;
      id v68 = self;
      id v69 = v22;
      BOOL v79 = a13;
      id v70 = v55;
      id v71 = v62;
      id v72 = v54;
      id v73 = v23;
      id v74 = v61;
      id v75 = v60;
      id v76 = v56;
      id v78 = v57;
      unsigned __int8 v40 = (void (**)(id, IDSDeliveryContext *))v33;
      [v37 sendFilePath:v38 topic:v75 userInfo:0 transferID:v39 sourceAppID:v35 encryptFile:0 progressBlock:&stru_1008FD110 completionBlock:v63];

      uint64_t v41 = v64;
      goto LABEL_18;
    }

    v42 = @"Failed to write wrapped data";
  }

  else
  {
    v42 = @"Failed to create temporary directory";
  }

  _IMWarn(v42);
  unsigned __int8 v40 = (void (**)(id, IDSDeliveryContext *))[v24 copy];

  if (v40)
  {
    uint64_t v34 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"Failed uploading attachment file transfer",  NSLocalizedDescriptionKey,  0LL);
    id v43 = objc_alloc(&OBJC_CLASS___NSError);
    id v35 = -[NSError initWithDomain:code:userInfo:](v43, "initWithDomain:code:userInfo:", IDSSendErrorDomain, 4LL, v34);
    uint64_t v41 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  -[NSError code](v35, "code"),  v35,  1LL);
    v40[2](v40, v41);
LABEL_18:
  }
}

- (id)_tokenURIForToken:(id)a3 uri:(id)a4
{
  unint64_t v4 = (void *)_IDSCopyIDForTokenWithURI(a3, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v4));

  return v5;
}

- (void)_sendMessage:(id)a3 dataToEncrypt:(id)a4 withEncryptedAttributes:(id)a5 onService:(id)a6 fromID:(id)a7 fromShortHandle:(id)a8 fromIdentity:(id)a9 toID:(id)a10 toURIs:(id)a11 canUseLargePayload:(BOOL)a12 sendOnePerToken:(BOOL)a13 allowPartialSendsToSucceed:(BOOL)a14 registrationProperties:(id)a15 fakeMessage:(BOOL)a16 alwaysSkipSelf:(BOOL)a17 alwaysIncludeSelf:(BOOL)a18 forceQuery:(int64_t)a19 disallowRefresh:(BOOL)a20 prioritizedTokenList:(id)a21 wantsFirewallDonation:(BOOL)a22 destinationObject:(id)a23 willSendBlock:(id)a24 completionBlock:(id)a25 firstAttemptDate:(id)a26 ktURIVerificationMap:(id)a27 fromCoalesceQueue:(BOOL)a28 withQueryCompletion:(id)a29
{
  id v34 = a3;
  id v35 = a4;
  id v161 = a5;
  id v36 = a6;
  id v37 = a7;
  id v38 = a8;
  id v154 = a9;
  id v39 = a10;
  id v40 = a11;
  id v41 = a15;
  id v143 = a21;
  id v141 = a23;
  id v158 = a24;
  id v159 = a25;
  id v42 = a26;
  id v151 = a27;
  v160 = (void (**)(id, void *))a29;
  v212 = _os_activity_create( (void *)&_mh_execute_header,  "IDSDeliveryController sendMessage",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v212, &state);
  v152 = v42;
  if (!v42) {
    v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v34 sendMode]);
  v153 = v43;
  if (v43) {
    BOOL v169 = [v43 integerValue] != 0;
  }
  else {
    BOOL v169 = 0;
  }
  unsigned int obj = -[IDSCoalesceMessageQueueManager coalesceQueueExistsForTopic:]( self->_coalesceMessageQueueManager,  "coalesceQueueExistsForTopic:",  v36);
  if (v159)
  {
    id v44 = [v159 copy];
    id v155 = objc_retainBlock(v44);
  }

  else
  {
    id v155 = 0LL;
  }

  if (v158)
  {
    id v45 = [v158 copy];
    id v156 = objc_retainBlock(v45);
  }

  else
  {
    id v156 = 0LL;
  }

  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v46 = (NSMutableSet *)v34;
  if (v46) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryMessageKey, v46);
  }
  v157 = v46;

  id v47 = v35;
  if (v47) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryDataToEncryptKey, v47);
  }
  v150 = v47;

  id v48 = v161;
  if (v48) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryEncryptionAttributesKey, v48);
  }
  v149 = v48;

  id v49 = v36;
  if (v49) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryServiceKey, v49);
  }
  v172 = v49;

  id v50 = v37;
  if (v50) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryFromIDKey, v50);
  }
  v164 = v50;

  id v51 = v38;
  if (v51) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryFromShortHandle, v51);
  }
  v148 = v51;

  id v52 = v154;
  if (v52) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryFromIdentityKey, v52);
  }
  v147 = v52;

  id v53 = v39;
  if (v53) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryToIDKey, v53);
  }
  v146 = v53;

  id v54 = v40;
  id v162 = v54;
  if (v54)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryOriginalURIsKey, v54);
    id v54 = v162;
  }

  id v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v55) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryCanUseLargePayloadKey, v55);
  }

  id v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v56) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliverySendOnePerTokenKey, v56);
  }

  id v57 = v41;
  if (v57) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryRegistrationPropertiesKey, v57);
  }
  v145 = v57;

  id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v58) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryFakeMessageKey, v58);
  }

  id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v59) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryAlwaysSkipSelfKey, v59);
  }

  id v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v60) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryAlwaysIncludeSelfKey, v60);
  }

  id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
  if (v61) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryForceQueryKey, v61);
  }

  id v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v62) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryDisallowQueryRefreshKey, v62);
  }

  id v63 = v143;
  if (v63) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryPrioritizedTokenListKey, v63);
  }
  v144 = v63;

  id v64 = v141;
  if (v64) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryIDSDestinationKey, v64);
  }
  v142 = v64;

  id v65 = objc_retainBlock(v156);
  if (v65) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryWillSendBlockKey, v65);
  }

  id v66 = objc_retainBlock(v155);
  if (v66) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryCompletionBlockKey, v66);
  }

  id v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  if (v67) {
    CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryFromCoalesceQueueKey, v67);
  }

  if (v169 && !a28)
  {
    -[IDSCoalesceMessageQueueManager handleMessageToCoalesce:forTopic:sendMode:]( self->_coalesceMessageQueueManager,  "handleMessageToCoalesce:forTopic:sendMode:",  theDict,  v49,  v153);
    uint64_t v68 = OSLogHandleForIDSCategory("IDSDelivery");
    id v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      id v70 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( -[IDSCoalesceMessageQueueManager loggableOverviewForTopic:]( self->_coalesceMessageQueueManager,  "loggableOverviewForTopic:",  v49));
      *(_DWORD *)buf = 138412290;
      v214 = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "  Coalesce queue view : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v71) && _IDSShouldLog(0LL, @"IDSDelivery"))
    {
      v127 = (void *)objc_claimAutoreleasedReturnValue( -[IDSCoalesceMessageQueueManager loggableOverviewForTopic:]( self->_coalesceMessageQueueManager,  "loggableOverviewForTopic:",  v49));
      _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"  Coalesce queue view : %@");
    }

- (void)sendIDSMessage:(id)a3 service:(id)a4 topic:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  im_assert_primary_base_queue(v13, v14);
  if (v10)
  {
    uint64_t v15 = OSLogHandleForIDSCategory("IDSDelivery");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Sending IDSMessage: %@  topic: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v17))
    {
      id v21 = v10;
      id v22 = v12;
      _IDSLogEventV(@"IDSFoundation", @"IDSDelivery", @"Sending IDSMessage: %@  topic: %@");
    }

    objc_msgSend(v10, "setTopic:", v12, v21, v22);
    -[IDSDeliveryController _sendFTMessage:service:fromID:toID:toToken:toSessionToken:toURIs:fromIdentity:completionBlock:]( self,  "_sendFTMessage:service:fromID:toID:toToken:toSessionToken:toURIs:fromIdentity:completionBlock:",  v10,  v11,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v13);
  }

  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory("IDSDelivery");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "sendIDSMessage called with nil message -- returning",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v20)) {
      _IDSLogEventV( @"IDSFoundation",  @"IDSDelivery",  @"sendIDSMessage called with nil message -- returning");
    }
  }
}

- (void)_sendMessageDictionary:(id)a3 lastRetryInterval:(double)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 canUseLargePayload:(BOOL)a9 sendOnePerToken:(BOOL)a10 allowPartialSendsToSucceed:(BOOL)a11 highPriority:(BOOL)a12 fireAndForget:(BOOL)a13 expirationDate:(id)a14 enforceRemoteTimeouts:(BOOL)a15 messageID:(id)a16 fromID:(id)a17 fromShortHandle:(id)a18 fromIdentity:(id)a19 toID:(id)a20 toURIs:(id)a21 accessToken:(id)a22 topic:(id)a23 registrationProperties:(id)a24 fakeMessage:(BOOL)a25 alwaysSkipSelf:(BOOL)a26 alwaysIncludeSelf:(BOOL)a27 forceQuery:(int64_t)a28 pushPriority:(id)a29 ignoreMaxRetryCount:(BOOL)a30 disallowRefresh:(BOOL)a31 originalTimestamp:(id)a32 prioritizedTokenList:(id)a33 wantsFirewallDonation:(BOOL)a34 destinationObject:(id)a35 deliveryMinimumTimeDelay:(id)a36 deliveryMinimumTime:(id)a37 sendMode:(id)a38 KTURIVerificationMap:(id)a39 ackBlock:(id)a40 willSendBlock:(id)a41 sendCompletionBlock:(id)a42
{
  BOOL v112 = a8;
  id v96 = a3;
  id v97 = a5;
  id v98 = a6;
  v113 = (IDSPeerAccessoryMessage *)a7;
  id v117 = a14;
  id v106 = a16;
  id v118 = a17;
  id v114 = a18;
  id v105 = a19;
  id v45 = a20;
  id v46 = a21;
  id v47 = a22;
  id v116 = a23;
  id v99 = a24;
  id v104 = a29;
  id v108 = a32;
  id v100 = a33;
  id v101 = a35;
  id v109 = a36;
  id v110 = a37;
  id v111 = a38;
  id v102 = a39;
  id v115 = a40;
  id v103 = a41;
  id v107 = a42;
  v95 = v47;
  if (v47)
  {
    id v48 = -[IDSPeerMessage initWithHighPriority:]( objc_alloc(&OBJC_CLASS___IDSPeerAccessoryMessage),  "initWithHighPriority:",  a12);
    -[IDSPeerAccessoryMessage setAccessToken:](v48, "setAccessToken:", v47);
    BOOL v49 = a12;
  }

  else
  {
    BOOL v49 = a12;
    id v48 = -[IDSPeerMessage initWithHighPriority:]( objc_alloc(&OBJC_CLASS___IDSPeerMessage),  "initWithHighPriority:",  a12);
  }

  id v50 = [v96 mutableCopy];
  uint64_t v51 = IDSWantsDeliveryStatusKey;
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:IDSWantsDeliveryStatusKey]);
  -[IDSPeerAccessoryMessage setWantsDeliveryStatus:](v48, "setWantsDeliveryStatus:", v52);

  [v50 removeObjectForKey:v51];
  uint64_t v53 = IDSCertifiedDeliveryVersionKey;
  id v54 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:IDSCertifiedDeliveryVersionKey]);
  uint64_t v55 = (uint64_t)[v54 integerValue];

  if (v55 >= 1)
  {
    -[IDSPeerAccessoryMessage setWantsCertifiedDelivery:](v48, "setWantsCertifiedDelivery:", 1LL);
    [v50 removeObjectForKey:v53];
  }

  if (v49)
  {
    id v56 = v45;
  }

  else
  {
    id v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL));
    -[IDSPeerMessage setPriority:](v48, "setPriority:", v57);

    id v56 = v45;
  }

  -[IDSPeerMessage setAdditionalDictionary:](v48, "setAdditionalDictionary:", v50);
  -[IDSPeerMessage setSourcePeerID:](v48, "setSourcePeerID:", v118);
  -[IDSPeerMessage setSourceShortHandle:](v48, "setSourceShortHandle:", v114);
  -[IDSPeerMessage setTargetPeerID:](v48, "setTargetPeerID:", v56);
  if (v106)
  {
    -[IDSPeerMessage setMessageID:](v48, "setMessageID:");
  }

  else
  {
    id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    -[IDSPeerMessage setMessageID:](v48, "setMessageID:", v58);

    id v56 = v45;
  }

  -[IDSPeerMessage setFireAndForget:](v48, "setFireAndForget:", a13);
  -[IDSPeerAccessoryMessage setIgnoreMaxRetryCount:](v48, "setIgnoreMaxRetryCount:", a30);
  -[IDSPeerAccessoryMessage setOriginalTimestamp:](v48, "setOriginalTimestamp:", v108);
  -[IDSPeerMessage setDeliveryMinimumTimeDelay:](v48, "setDeliveryMinimumTimeDelay:", v109);
  -[IDSPeerMessage setDeliveryMinimumTime:](v48, "setDeliveryMinimumTime:", v110);
  -[IDSPeerMessage setSendMode:](v48, "setSendMode:", v111);
  if (v56)
  {
    uint64_t v59 = objc_claimAutoreleasedReturnValue([v56 _stripPotentialTokenURIWithToken:0]);
    id v60 = (void *)v59;
    LODWORD(v56) = 0;
    if (v118 && v59) {
      LODWORD(v56) = [v118 isEqualToIgnoringCase:v59];
    }
  }

  else
  {
    id v60 = 0LL;
  }

  if ((unint64_t)[v46 count] <= 1)
  {
    id v61 = (void *)objc_claimAutoreleasedReturnValue([v46 lastObject]);
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v61 tokenFreeURI]);
    id v63 = (void *)objc_claimAutoreleasedReturnValue([v62 prefixedURI]);
    LODWORD(v56) = v56 | [v63 isEqualToIgnoringCase:v118];
  }

  -[IDSPeerAccessoryMessage setWantsResponse:](v48, "setWantsResponse:", v112);
  -[IDSPeerAccessoryMessage setTopic:](v48, "setTopic:", v116);
  if (v115)
  {
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472LL;
    v119[2] = sub_1001BB44C;
    v119[3] = &unk_1008FD218;
    id v120 = v115;
    -[IDSPeerAccessoryMessage setDeliveryAcknowledgementBlock:](v48, "setDeliveryAcknowledgementBlock:", v119);
  }

  if (v117)
  {
    [v117 timeIntervalSinceNow];
    double v65 = v64;
    if (v64 > 2.22044605e-16)
    {
      -[IDSPeerAccessoryMessage setTimeout:](v48, "setTimeout:", v64);
      id v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"service-max-timeout-%@",  v113));
      if (v66)
      {
        id v67 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
        uint64_t v68 = (__CFString *)objc_claimAutoreleasedReturnValue([v67 objectForKey:v66]);
      }

      else
      {
        uint64_t v68 = 0LL;
      }

      if (-[__CFString unsignedIntegerValue](v68, "unsignedIntegerValue"))
      {
        uint64_t v69 = OSLogHandleForIDSCategory("IDSDelivery");
        id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v113;
          __int16 v123 = 2112;
          v124 = v68;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Server has overridden service maximum timeout: %@, capping message timeout with %@.",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v71)
          && _IDSShouldLog(0LL, @"IDSDelivery"))
        {
          __int16 v86 = v113;
          id v87 = v68;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"Server has overridden service maximum timeout: %@, capping message timeout with %@.");
        }

        double v72 = (double)(unint64_t)-[__CFString unsignedIntegerValue](v68, "unsignedIntegerValue", v86, v87);
        if (v65 < v72) {
          double v72 = v65;
        }
        -[IDSPeerAccessoryMessage setTimeout:](v48, "setTimeout:", v72);
      }
    }

    if (v65 < IDSMaxMessageTimeout + -60.0 && a15) {
      -[IDSPeerMessage setExpirationDate:](v48, "setExpirationDate:", v117);
    }
  }

  if (!v46)
  {
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v45));
    uint64_t v77 = IMSingleObjectArray(v73, v74, v75, v76);
    id v46 = (id)objc_claimAutoreleasedReturnValue(v77);
  }

  uint64_t v78 = OSLogHandleForIDSCategory("IDSDelivery");
  BOOL v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v80 = @"NO";
    *(_DWORD *)buf = 138414082;
    v122 = v48;
    if (v112) {
      uint64_t v81 = @"YES";
    }
    else {
      uint64_t v81 = @"NO";
    }
    v124 = v81;
    __int16 v123 = 2112;
    if ((_DWORD)v56) {
      __int128 v80 = @"YES";
    }
    __int16 v125 = 2112;
    id v126 = v117;
    __int16 v127 = 2112;
    id v128 = v118;
    __int16 v129 = 2112;
    id v130 = v45;
    __int16 v131 = 2112;
    id v132 = v46;
    __int16 v133 = 2112;
    id v134 = v116;
    __int16 v135 = 2112;
    uint64_t v136 = v80;
    _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Sending messageDictionary: {suppressed} peerMessage %@  wantsResponse %@ timeout %@ fromID: %@ toID %@ toPeople %@ topic %@ toMyself: %@",  buf,  0x52u);
  }

  if (os_log_shim_legacy_logging_enabled(v82))
  {
    if ((_DWORD)v56) {
      int v84 = @"YES";
    }
    else {
      int v84 = @"NO";
    }
    unint64_t v90 = v84;
    id v89 = v46;
    id v88 = v118;
    _IDSLogEventV( @"IDSFoundation",  @"IDSDelivery",  @"Sending messageDictionary: {suppressed} peerMessage %@  wantsResponse %@ timeout %@ fromID: %@ toID %@ toPeople %@ topic %@ toMyself: %@");
  }

  uint64_t v85 = objc_opt_class(&OBJC_CLASS___IDSPeerAccessoryMessage, v83);
  if ((objc_opt_isKindOfClass(v48, v85) & 1) != 0)
  {
    -[IDSDeliveryController _handleAccessoryMessageForID:msg:service:fromID:fromIdentity:completionBlock:]( self,  "_handleAccessoryMessageForID:msg:service:fromID:fromIdentity:completionBlock:",  v46,  v48,  v113,  v118,  v105,  v107);
  }

  else
  {
    LOBYTE(v92) = 0;
    LOBYTE(v91) = a34;
    LOBYTE(v90) = a31;
    *(_WORD *)((char *)&v89 + 1) = __PAIR16__(a27, a26);
    LOBYTE(v89) = a25;
    *(_WORD *)((char *)&v88 + 1) = __PAIR16__(a11, a10);
    LOBYTE(v88) = a9;
    -[IDSDeliveryController _sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:]( self,  "_sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUs eLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysI ncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:c ompletionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:",  v48,  v97,  v98,  v113,  v118,  v114,  v105,  v45,  v46,  v88,  v99,  v89,  a28,  v90,  v100,  v91,  v101,  v103,  v107,  0LL,  v102,  v92,  &stru_1008FD238);
  }
}

- (void)_sendErrorDictionary:(id)a3 onService:(id)a4 fromID:(id)a5 fromIdentity:(id)a6 toID:(id)a7 toToken:(id)a8 topic:(id)a9 sendCompletionBlock:(id)a10
{
  id v44 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  uint64_t v23 = OSLogHandleForIDSCategory("IDSDelivery");
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    id v46 = v44;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v17;
    __int16 v51 = 2112;
    id v52 = v18;
    __int16 v53 = 2112;
    id v54 = v19;
    __int16 v55 = 2112;
    id v56 = v20;
    __int16 v57 = 2112;
    id v58 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "_sendErrorMessage %@ onService %@ fromID %@ fromIdentity %@ toID %@ toToken %@ topic %@",  buf,  0x48u);
  }

  if (os_log_shim_legacy_logging_enabled(v25) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    id v39 = v20;
    id v40 = v21;
    id v37 = v18;
    id v38 = v19;
    id v34 = v16;
    id v35 = v17;
    id v32 = v44;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDelivery",  @"_sendErrorMessage %@ onService %@ fromID %@ fromIdentity %@ toID %@ toToken %@ topic %@");
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDeliveryController _tokenURIForToken:uri:]( self,  "_tokenURIForToken:uri:",  v20,  v19,  v32,  v34,  v35,  v37,  v38,  v39,  v40));
  uint64_t v30 = IMSingleObjectArray(v26, v27, v28, v29);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  LOBYTE(v43) = 0;
  LOWORD(v42) = 0;
  BYTE2(v41) = 0;
  LOWORD(v41) = 0;
  LOBYTE(v36) = 0;
  LODWORD(v33) = 0x10000;
  -[IDSDeliveryController _sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:messageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:]( self,  "_sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePa yload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:mes sageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSk ipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTo kenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificat ionMap:ackBlock:willSendBlock:sendCompletionBlock:",  v44,  0LL,  0LL,  v16,  1LL,  0LL,  0.0,  v33,  0LL,  v36,  0LL,  v17,  0LL,  v18,  v19,  v31,  0LL,  v21,  0LL,  v41,  0LL,  0LL,  v42,  0LL,  0LL,  v43,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v22);
}

- (void)sendMessageDictionary:(id)a3 messageID:(id)a4 dataToEncrypt:(id)a5 withEncryptedAttributes:(id)a6 onService:(id)a7 wantsResponse:(BOOL)a8 expirationDate:(id)a9 enforceRemoteTimeouts:(BOOL)a10 canUseLargePayload:(BOOL)a11 sendOnePerToken:(BOOL)a12 allowPartialSendsToSucceed:(BOOL)a13 priority:(int64_t)a14 fireAndForget:(BOOL)a15 fromID:(id)a16 fromShortHandle:(id)a17 fromIdentity:(id)a18 toURIs:(id)a19 accessToken:(id)a20 topic:(id)a21 registrationProperties:(id)a22 fakeMessage:(BOOL)a23 alwaysSkipSelf:(BOOL)a24 alwaysIncludeSelf:(BOOL)a25 forceQuery:(int64_t)a26 pushPriority:(id)a27 ignoreMaxRetryCount:(BOOL)a28 disallowRefresh:(BOOL)a29 originalTimestamp:(id)a30 prioritizedTokenList:(id)a31 wantsFirewallDonation:(BOOL)a32 destinationObject:(id)a33 deliveryMinimumTimeDelay:(id)a34 deliveryMinimumTime:(id)a35 sendMode:(id)a36 KTURIVerificationMap:(id)a37 ackBlock:(id)a38 willSendBlock:(id)a39 sendCompletionBlock:(id)a40
{
  BOOL v60 = a8;
  id v54 = a40;
  id v40 = a39;
  id v41 = a38;
  id v58 = a37;
  id v42 = a36;
  id v43 = a35;
  id v44 = a34;
  id v56 = a33;
  id v55 = a31;
  id v53 = a30;
  id v51 = a27;
  id v52 = a22;
  id v77 = a21;
  id v76 = a20;
  id v75 = a19;
  id v74 = a18;
  id v73 = a17;
  id v72 = a16;
  id v71 = a9;
  id v70 = a7;
  id v68 = a6;
  id v66 = a5;
  id v64 = a4;
  id v62 = a3;
  im_assert_primary_base_queue(v62, v45);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_1001BBAF8;
  v78[3] = &unk_1008FA288;
  id v79 = v54;
  id v57 = v54;
  LOBYTE(v50) = a32;
  LOWORD(v49) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v48 + 1) = __PAIR16__(a25, a24);
  LOBYTE(v48) = a23;
  LOBYTE(v47) = a10;
  BYTE3(v46) = a15;
  BYTE2(v46) = a14 == 300;
  LOWORD(v46) = __PAIR16__(a13, a12);
  -[IDSDeliveryController _sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:messageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:]( self,  "_sendMessageDictionary:lastRetryInterval:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:canUseLargePa yload:sendOnePerToken:allowPartialSendsToSucceed:highPriority:fireAndForget:expirationDate:enforceRemoteTimeouts:mes sageID:fromID:fromShortHandle:fromIdentity:toID:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSk ipSelf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritizedTo kenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KTURIVerificat ionMap:ackBlock:willSendBlock:sendCompletionBlock:",  v62,  v66,  v68,  v70,  v60,  a11,  0.0,  v46,  v71,  v47,  v64,  v72,  v73,  v74,  0LL,  v75,  v76,  v77,  v52,  v48,  a26,  v51,  v49,  v53,  v55,  v50,  v56,  v44,  v43,  v42,  v58,  v41,  v40,  v78);
}

- (void)_pipelinesHandleMessagesToCoalesce:(id)a3 forService:(id)a4 sendMode:(id)a5
{
  id v7 = a3;
  id v41 = a4;
  id v33 = a5;
  id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  os_activity_t v32 = _os_activity_create( (void *)&_mh_execute_header,  "All sends complete",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v36 = *(void *)v55;
    uint64_t v10 = IDSDeliveryMessageKey;
    uint64_t v35 = IDSDeliveryCompletionBlockKey;
    uint64_t v11 = IDSDeliveryFinalURIsKey;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v55 != v36) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v10]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 messageID]);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v10]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deliveryAcknowledgementBlock]);

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v35]);
        id v20 = objc_retainBlock(v18);
        -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v20, v16);

        id v21 = objc_retainBlock(v19);
        -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v21, v16);

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v11]);
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472LL;
        v51[2] = sub_1001BBF04;
        v51[3] = &unk_1008FD260;
        id v52 = v39;
        id v53 = v14;
        id v23 = v14;
        -[IDSDeliveryController _pipelineHandleMessage:forURIs:service:withCompletion:]( self,  "_pipelineHandleMessage:forURIs:service:withCompletion:",  v13,  v22,  v41,  v51);

        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 promise]);
        -[NSMutableArray addObject:](v42, "addObject:", v24);

        id v12 = (char *)v12 + 1;
      }

      while (v9 != v12);
      id v9 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }

    while (v9);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[CUTUnsafePromise all:](&OBJC_CLASS___CUTUnsafePromise, "all:", v42));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1001BC028;
  v43[3] = &unk_1008FD288;
  id v44 = v41;
  uint64_t v45 = self;
  os_activity_t v46 = v32;
  uint64_t v47 = v39;
  uint64_t v48 = v38;
  uint64_t v49 = v37;
  id v50 = v33;
  id v26 = v33;
  uint64_t v27 = v37;
  uint64_t v28 = v38;
  uint64_t v29 = v39;
  uint64_t v30 = v32;
  id v31 = v41;
  [v25 registerResultBlock:v43];
}

- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001BC218;
  v10[3] = &unk_1008FD2B0;
  id v11 = a3;
  id v12 = a5;
  id v13 = self;
  id v8 = v12;
  id v9 = v11;
  -[IDSDeliveryController _pipelineHandleMessage:forURIs:service:withCompletion:]( self,  "_pipelineHandleMessage:forURIs:service:withCompletion:",  v9,  a4,  v8,  v10);
}

- (void)_pipelineHandleMessage:(id)a3 forURIs:(id)a4 service:(id)a5 withCompletion:(id)a6
{
  id v41 = a3;
  id v10 = a4;
  id v11 = a5;
  id v40 = a6;
  id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:IDSDeliveryCanUseLargePayloadKey]);
  int64_t v13 = -[IDSDeliveryController effectiveMaxPayloadSizeIfCanUseLargePayload:]( self,  "effectiveMaxPayloadSizeIfCanUseLargePayload:",  [v12 BOOLValue]);

  id v14 = -[IDSDeliveryPipelineParameter initWithInfo:uris:service:maxSize:]( objc_alloc(&OBJC_CLASS___IDSDeliveryPipelineParameter),  "initWithInfo:uris:service:maxSize:",  v41,  v10,  v11,  v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryPipelineParameter guid](v14, "guid"));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Sending guid %@ through delivery pipeline",  (uint8_t *)&buf,  0xCu);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryPipelineParameter guid](v14, "guid"));
  id v18 = [v17 copy];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryPipelineParameter description](v14, "description"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1001BCCA4;
  v51[3] = &unk_1008F5F80;
  id v20 = v18;
  id v52 = v20;
  id v38 = v19;
  id v53 = v38;
  cut_dispatch_log_queue(v51);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryPipelineParameter messageToSend](v14, "messageToSend"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 messageBody]);
  id v25 = sub_1001BC53C(v22, v24, IDSCommandKey);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  LODWORD(v23) = [v26 integerValue] != (id)133;
  uint64_t v27 = -[IDSServiceProperties initWithServiceIdentifier:]( objc_alloc(&OBJC_CLASS___IDSServiceProperties),  "initWithServiceIdentifier:",  v11);
  else {
    uint64_t v28 = objc_claimAutoreleasedReturnValue(-[IDSDeliveryController _constructDeliveryPipeline](self, "_constructDeliveryPipeline"));
  }
  uint64_t v29 = (void *)v28;
  if (_os_feature_enabled_impl("IDS", "GFTPerfSignpostCollection")
    && IDSCommandIsGroupSessionCommand(v26))
  {
    kdebug_trace(722010432, [v26 integerValue], 0, 0, 0);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:IDSDeliveryCompletionBlockKey]);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 runWithInput:v14]);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000LL;
  __int128 v56 = sub_1001BCD5C;
  __int128 v57 = sub_1001BCD6C;
  id v58 = 0LL;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1001BCD74;
  v42[3] = &unk_1008FD2D8;
  id v37 = v26;
  id v43 = v37;
  id v44 = self;
  id v32 = v11;
  id v45 = v32;
  id v36 = v10;
  id v46 = v36;
  id v33 = v30;
  id v48 = v33;
  p___int128 buf = &buf;
  id v34 = v39;
  id v47 = v34;
  id v35 = v40;
  id v49 = v35;
  [v31 registerResultBlock:v42];

  _Block_object_dispose(&buf, 8);
}

- (id)_constructDeliveryPipeline
{
  id v3 = objc_alloc(&OBJC_CLASS___IDSMMCSUploader);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController encryptionController](self, "encryptionController"));
  id v5 = objc_alloc_init(&OBJC_CLASS___IDSTransferServicesController);
  id v6 = -[IDSMMCSUploader initWithEncryptionController:transferServicesController:]( v3,  "initWithEncryptionController:transferServicesController:",  v4,  v5);

  id v7 = objc_alloc(&OBJC_CLASS___IDSEndpointResolverComponent);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController peerIDManager](self, "peerIDManager"));
  id v9 = -[IDSEndpointResolverComponent initWithQueryCache:](v7, "initWithQueryCache:", v8);

  id v10 = objc_alloc_init(&OBJC_CLASS___IDSMadridEndpointFilterComponent);
  id v11 = objc_alloc(&OBJC_CLASS___IDSEncryptionComponent);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController encryptionController](self, "encryptionController"));
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController pinnedIdentityController](self, "pinnedIdentityController"));
  id v14 = -[IDSEncryptionComponent initWithEncryptionController:pinnedIdentityController:]( v11,  "initWithEncryptionController:pinnedIdentityController:",  v12,  v13);

  uint64_t v15 = -[IDSMessageFactoryComponent initWithMMCSUploader:]( objc_alloc(&OBJC_CLASS___IDSMessageFactoryComponent),  "initWithMMCSUploader:",  v6);
  id v16 = objc_alloc_init(&OBJC_CLASS___IDSFanoutFactoryComponent);
  if ((_os_feature_enabled_impl("IDS", "AlwaysPopulateFirewall") & 1) != 0
    || +[IMUserDefaults isFirewallEnabled](&OBJC_CLASS___IMUserDefaults, "isFirewallEnabled"))
  {
    id v17 = objc_alloc(&OBJC_CLASS___IDSFirewallEndpointDonationComponent);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFirewallStore sharedInstance](&OBJC_CLASS___IDSFirewallStore, "sharedInstance"));
    id v20 = -[IDSFirewallEndpointDonationComponent initWithServiceController:firewallStore:]( v17,  "initWithServiceController:firewallStore:",  v18,  v19);

    v25[0] = v9;
    v25[1] = v10;
    v25[2] = v20;
    v25[3] = v14;
    v25[4] = v15;
    v25[5] = v16;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 6LL));
  }

  else
  {
    v24[0] = v9;
    v24[1] = v10;
    v24[2] = v14;
    v24[3] = v15;
    v24[4] = v16;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 5LL));
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPipelineComponent pipelineFromComponents:]( &OBJC_CLASS___IDSPipelineComponent,  "pipelineFromComponents:",  v21));

  return v22;
}

- (id)_constructOfflineDeliveryPipeline
{
  id v3 = objc_alloc(&OBJC_CLASS___IDSEndpointResolverComponent);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController peerIDManager](self, "peerIDManager"));
  id v5 = -[IDSEndpointResolverComponent initWithQueryCache:](v3, "initWithQueryCache:", v4);

  id v6 = objc_alloc_init(&OBJC_CLASS___IDSMadridEndpointFilterComponent);
  id v7 = objc_alloc(&OBJC_CLASS___IDSIMLEncryptionComponent);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeliveryController encryptionController](self, "encryptionController"));
  id v9 = -[IDSIMLEncryptionComponent initWithEncryptionController:](v7, "initWithEncryptionController:", v8);

  id v10 = objc_alloc_init(&OBJC_CLASS___IDSIMLMessageFactoryComponent);
  id v11 = objc_alloc_init(&OBJC_CLASS___IDSIMLFanoutFactoryComponent);
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v9;
  v15[3] = v10;
  v15[4] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 5LL));
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPipelineComponent pipelineFromComponents:]( &OBJC_CLASS___IDSPipelineComponent,  "pipelineFromComponents:",  v12));

  return v13;
}

- (void)sendRTCMetricWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[IDSDeliveryControllerTimeMetric alloc] initWithStartDate:v14 endDate:v13 endpointCount:a5 usedPipeline:v10 usedMMCS:v9 responseCode:a8];

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [v15 timeToSend];
    uint64_t v18 = v17;
    id v19 = [v15 endpointCount];
    else {
      id v20 = @"NO";
    }
    int v23 = 134219010;
    else {
      uint64_t v21 = @"NO";
    }
    uint64_t v24 = v18;
    __int16 v25 = 2048;
    id v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = v21;
    __int16 v31 = 2048;
    int64_t v32 = a8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Submitting metric { sendTime: %.4f, endpointCount: %ld, pipeline: %@, mmcs: %@ responseCode: %ld }",  (uint8_t *)&v23,  0x34u);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRTCLogger loggerWithCategory:](&OBJC_CLASS___IDSRTCLogger, "loggerWithCategory:", 2000LL));
  [v22 logMetric:v15];
}

- (void)queueManager:(id)a3 receivedMessagesToSend:(id)a4 forTopic:(id)a5 sendMode:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v30 = a6;
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v96 = v9;
    __int16 v97 = 2048;
    id v98 = [v8 count];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDSDeliveryController received messages to coalesce for topic %@ count %lu",  buf,  0x16u);
  }

  uint64_t v55 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  id obj = v8;
  id v57 = [obj countByEnumeratingWithState:&v90 objects:v94 count:16];
  if (v57)
  {
    uint64_t v53 = IDSDeliveryMessageKey;
    uint64_t v54 = *(void *)v91;
    uint64_t v51 = IDSDeliveryEncryptionAttributesKey;
    uint64_t v52 = IDSDeliveryDataToEncryptKey;
    uint64_t v49 = IDSDeliveryFromIDKey;
    uint64_t v50 = IDSDeliveryServiceKey;
    uint64_t v47 = IDSDeliveryFromIdentityKey;
    uint64_t v48 = IDSDeliveryFromShortHandle;
    uint64_t v45 = IDSDeliveryOriginalURIsKey;
    uint64_t v46 = IDSDeliveryToIDKey;
    uint64_t v43 = IDSDeliverySendOnePerTokenKey;
    uint64_t v44 = IDSDeliveryCanUseLargePayloadKey;
    uint64_t v41 = IDSDeliveryFakeMessageKey;
    uint64_t v42 = IDSDeliveryRegistrationPropertiesKey;
    uint64_t v39 = IDSDeliveryAlwaysIncludeSelfKey;
    uint64_t v40 = IDSDeliveryAlwaysSkipSelfKey;
    uint64_t v37 = IDSDeliveryDisallowQueryRefreshKey;
    uint64_t v38 = IDSDeliveryForceQueryKey;
    uint64_t v35 = IDSDeliveryIDSDestinationKey;
    uint64_t v36 = IDSDeliveryPrioritizedTokenListKey;
    uint64_t v33 = IDSDeliveryCompletionBlockKey;
    uint64_t v34 = IDSDeliveryWillSendBlockKey;
    uint64_t v32 = IDSDeliveryFromCoalesceQueueKey;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v91 != v54) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v90 + 1) + 8 * v11);
        id v72 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
        int v84 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v53]);
        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v52]);
        uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v51]);
        id v77 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v50]);
        id v76 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v49]);
        id v74 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v48]);
        uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v47]);
        id v58 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v46]);
        id v70 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v45]);
        uint64_t v80 = v11;
        id v79 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v44]);
        unsigned __int8 v69 = [v79 BOOLValue];
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v43]);
        unsigned __int8 v67 = [v78 BOOLValue];
        id v75 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v44]);
        unsigned __int8 v65 = [v75 BOOLValue];
        BOOL v60 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v42]);
        id v71 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v41]);
        unsigned __int8 v63 = [v71 BOOLValue];
        id v68 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v40]);
        unsigned __int8 v61 = [v68 BOOLValue];
        id v66 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v39]);
        unsigned __int8 v59 = [v66 BOOLValue];
        id v64 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v38]);
        id v13 = [v64 integerValue];
        id v62 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v37]);
        unsigned __int8 v14 = [v62 BOOLValue];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v36]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v35]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v34]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v33]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v32]);
        unsigned __int8 v20 = [v19 BOOLValue];
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472LL;
        v88[2] = sub_1001BE008;
        v88[3] = &unk_1008FD300;
        id v89 = v72;
        id v73 = v72;
        LOBYTE(v29) = v20;
        LOBYTE(v28) = 0;
        LOBYTE(v27) = v14;
        BYTE2(v26) = v59;
        BYTE1(v26) = v61;
        LOBYTE(v26) = v63;
        BYTE2(v25) = v65;
        BYTE1(v25) = v67;
        LOBYTE(v25) = v69;
        -[IDSDeliveryController _sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf:alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:willSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:]( self,  "_sendMessage:dataToEncrypt:withEncryptedAttributes:onService:fromID:fromShortHandle:fromIdentity:toID:toURIs:c anUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:registrationProperties:fakeMessage:alwaysSkipSelf :alwaysIncludeSelf:forceQuery:disallowRefresh:prioritizedTokenList:wantsFirewallDonation:destinationObject:wil lSendBlock:completionBlock:firstAttemptDate:ktURIVerificationMap:fromCoalesceQueue:withQueryCompletion:",  v84,  v83,  v82,  v77,  v76,  v74,  v81,  v58,  v70,  v25,  v60,  v26,  v13,  v27,  v15,  v28,  v16,  v17,  v18,  0LL,  0LL,  v29,  v88);

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v73 promise]);
        -[NSMutableArray addObject:](v55, "addObject:", v21);

        uint64_t v11 = v80 + 1;
      }

      while (v57 != (id)(v80 + 1));
      id v57 = [obj countByEnumeratingWithState:&v90 objects:v94 count:16];
    }

    while (v57);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[CUTUnsafePromise all:](&OBJC_CLASS___CUTUnsafePromise, "all:", v55));
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_1001BE014;
  v85[3] = &unk_1008FBB78;
  v85[4] = self;
  id v86 = v9;
  id v87 = v30;
  id v23 = v30;
  id v24 = v9;
  [v22 registerResultBlock:v85];
}

- (void).cxx_destruct
{
}

@end