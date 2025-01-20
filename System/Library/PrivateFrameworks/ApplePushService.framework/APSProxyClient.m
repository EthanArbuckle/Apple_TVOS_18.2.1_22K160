@interface APSProxyClient
- (APSEnvironment)environment;
- (APSFilterVersionStateMachine)filterVersionStateMachine;
- (APSIDSProxyManager)proxyManager;
- (APSProxyClient)initWithEnvironment:(id)a3 guid:(id)a4;
- (APSProxyClientDelegate)delegate;
- (APSRateLimiter)connectedNotesSentLimiter;
- (APSTopicGroup)topics;
- (APSTopicManager)topicManager;
- (BOOL)_setToken:(id)a3;
- (BOOL)isActive;
- (BOOL)isConnected;
- (BOOL)isConnectedOnInterface:(id)a3;
- (BOOL)isInvalid;
- (BOOL)needsToConnect;
- (BOOL)needsToConnectOnInterface:(id)a3;
- (BOOL)needsToDisconnect;
- (BOOL)needsToDisconnectOnInterface:(id)a3;
- (BOOL)shouldOnlySendFilterOnPreferredInterface;
- (NSData)certificate;
- (NSData)nonce;
- (NSData)publicToken;
- (NSData)signature;
- (NSDate)lastPresence;
- (NSMutableDictionary)filterModeByInterfaceIdentifier;
- (NSMutableDictionary)stateByInterfaceIdentifier;
- (NSMutableSet)pendingMessageGUIDs;
- (NSString)guid;
- (NSString)hwVersion;
- (NSString)swBuild;
- (NSString)swVersion;
- (id)_createRequestForPubSubData:(id)a3 messageID:(unsigned int)a4 connectionType:(int64_t)a5 environment:(id)a6;
- (id)aps_prettyDescription;
- (id)tokenName;
- (unint64_t)filterModeOnInterface:(id)a3;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (unint64_t)stateOnInterface:(id)a3;
- (void)_adjustConnectedStateWithInterfaceHint:(BOOL)a3;
- (void)dealloc;
- (void)handleAppTokenGenerateResponse:(id)a3 error:(id)a4;
- (void)handleExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4;
- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4;
- (void)incomingPresenceWithCertificate:(id)a3 nonce:(id)a4 signature:(id)a5 token:(id)a6 hwVersion:(id)a7 swVersion:(id)a8 swBuild:(id)a9;
- (void)invalidate;
- (void)noteIsConnected;
- (void)proxyManager:(id)a3 inactiveReceivedForGuid:(id)a4 environmentName:(id)a5;
- (void)proxyManager:(id)a3 incomingFilterForGuid:(id)a4 environmentName:(id)a5 enabledTopics:(id)a6 ignoredTopics:(id)a7 opportunisticTopics:(id)a8 nonWakingTopics:(id)a9 topicSalts:(id)a10;
- (void)proxyManager:(id)a3 isNearbyChanged:(BOOL)a4;
- (void)proxyManager:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7 guid:(id)a8 environmentName:(id)a9;
- (void)proxyManager:(id)a3 receivedPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8 guid:(id)a9 environmentName:(id)a10;
- (void)proxyManager:(id)a3 sendPubSubChannelList:(id)a4 messageID:(unsigned int)a5 token:(id)a6 connectionType:(int64_t)a7 environmentName:(id)a8 guid:(id)a9;
- (void)proxyManager:(id)a3 sendReversePush:(id)a4 guid:(id)a5 environmentName:(id)a6;
- (void)proxyManager:(id)a3 tokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9 guid:(id)a10 environmentName:(id)a11;
- (void)receivedPush:(id)a3 onConnectionType:(int64_t)a4 withGeneration:(unint64_t)a5;
- (void)sendPubSubChannelListRequestForConnectionType:(int64_t)a3;
- (void)sendPubSubChannelListResponse:(id)a3;
- (void)sendPubSubUpdateMessage:(id)a3 forConnectionType:(int64_t)a4;
- (void)setActive:(BOOL)a3;
- (void)setCertificate:(id)a3;
- (void)setConnectedNotesSentLimiter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFilterMode:(unint64_t)a3 onInterface:(id)a4;
- (void)setFilterModeByInterfaceIdentifier:(id)a3;
- (void)setFilterVersionStateMachine:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHwVersion:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setPendingMessageGUIDs:(id)a3;
- (void)setProxyManager:(id)a3;
- (void)setPublicToken:(id)a3;
- (void)setSignature:(id)a3;
- (void)setState:(unint64_t)a3 onInterface:(id)a4;
- (void)setStateByInterfaceIdentifier:(id)a3;
- (void)setSwBuild:(id)a3;
- (void)setSwVersion:(id)a3;
- (void)setTopicManager:(id)a3;
@end

@implementation APSProxyClient

- (APSProxyClient)initWithEnvironment:(id)a3 guid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___APSProxyClient;
  v9 = -[APSProxyClient init](&v21, "init");
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    guid = v9->_guid;
    v9->_guid = v10;

    objc_storeStrong((id *)&v9->_environment, a3);
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    stateByInterfaceIdentifier = v9->_stateByInterfaceIdentifier;
    v9->_stateByInterfaceIdentifier = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    filterModeByInterfaceIdentifier = v9->_filterModeByInterfaceIdentifier;
    v9->_filterModeByInterfaceIdentifier = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___APSFilterVersionStateMachine);
    filterVersionStateMachine = v9->_filterVersionStateMachine;
    v9->_filterVersionStateMachine = v16;

    v18 = -[APSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___APSRateLimiter),  "initWithLimit:timeLimit:",  10LL,  1800.0);
    connectedNotesSentLimiter = v9->_connectedNotesSentLimiter;
    v9->_connectedNotesSentLimiter = v18;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSProxyClient;
  -[APSProxyClient dealloc](&v3, "dealloc");
}

- (id)aps_prettyDescription
{
  guid = self->_guid;
  if (self->_active) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  if (self->_invalid) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v25 = v4;
  v26 = v3;
  uint64_t v5 = APSPrettyPrintCollection(self->_stateByInterfaceIdentifier, 0LL, 0LL, 2LL);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v6 = APSPrettyPrintCollection(self->_filterModeByInterfaceIdentifier, 0LL, 0LL, 2LL);
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager group](self->_topicManager, "group"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v29 enabledTopics]);
  uint64_t v7 = APSPrettyPrintCollection(v28, 0LL, 0LL, 2LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager group](self->_topicManager, "group"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 ignoredTopics]);
  uint64_t v9 = APSPrettyPrintCollection(v22, 0LL, 0LL, 2LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager group](self->_topicManager, "group"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 opportunisticTopics]);
  uint64_t v13 = APSPrettyPrintCollection(v12, 0LL, 0LL, 2LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager group](self->_topicManager, "group"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nonWakingTopics]);
  uint64_t v17 = APSPrettyPrintCollection(v16, 0LL, 0LL, 2LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%p guid: %@; isActive: %@; invalid: %@ stateByInterfaceIdentifier: %@; filterModeByInterfaceIdentifier: %@; enabledTopics: %@, ignoredTopics: %@, opportunisticTopics: %@, nonWakingTopics: %@>",
                    self,
                    guid,
                    v26,
                    v25,
                    v23,
                    v21,
                    v8,
                    v10,
                    v14,
                    v18));

  return v19;
}

- (void)setProxyManager:(id)a3
{
  uint64_t v5 = (APSIDSProxyManager *)a3;
  proxyManager = self->_proxyManager;
  if (proxyManager != v5)
  {
    uint64_t v7 = v5;
    -[APSIDSProxyManager removeListener:environment:]( proxyManager,  "removeListener:environment:",  self,  self->_environment);
    objc_storeStrong((id *)&self->_proxyManager, a3);
    -[APSIDSProxyManager setListener:environment:]( self->_proxyManager,  "setListener:environment:",  self,  self->_environment);
    uint64_t v5 = v7;
  }
}

- (void)incomingPresenceWithCertificate:(id)a3 nonce:(id)a4 signature:(id)a5 token:(id)a6 hwVersion:(id)a7 swVersion:(id)a8 swBuild:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138413058;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ incomingPresence {hwVersion: %@, swVersion: %@, swBuild: %@}",  (uint8_t *)&v25,  0x2Au);
  }

  -[APSProxyClient setCertificate:](self, "setCertificate:", v21);
  -[APSProxyClient setNonce:](self, "setNonce:", v20);

  -[APSProxyClient setSignature:](self, "setSignature:", v19);
  -[APSProxyClient setHwVersion:](self, "setHwVersion:", v15);
  -[APSProxyClient _setToken:](self, "_setToken:", v18);

  -[APSProxyClient setSwVersion:](self, "setSwVersion:", v16);
  -[APSProxyClient setSwBuild:](self, "setSwBuild:", v17);
  v23 = objc_alloc_init(&OBJC_CLASS___NSDate);
  lastPresence = self->_lastPresence;
  self->_lastPresence = v23;

  -[APSProxyClient setActive:](self, "setActive:", 1LL);
}

- (void)handleExpiredNonceWithServerTime:(id)a3 shouldRollToken:(BOOL)a4
{
  BOOL v4 = a4;
  proxyManager = self->_proxyManager;
  guid = self->_guid;
  environment = self->_environment;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](environment, "name"));
  -[APSIDSProxyManager sendExpiredNonceWithServerTime:shouldRollToken:guid:environmentName:]( proxyManager,  "sendExpiredNonceWithServerTime:shouldRollToken:guid:environmentName:",  v8,  v4,  guid,  v9);
}

- (void)receivedPush:(id)a3 onConnectionType:(int64_t)a4 withGeneration:(unint64_t)a5
{
  proxyManager = self->_proxyManager;
  guid = self->_guid;
  environment = self->_environment;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](environment, "name"));
  -[APSIDSProxyManager sendReceivedPush:forConnectionType:generation:guid:environmentName:]( proxyManager,  "sendReceivedPush:forConnectionType:generation:guid:environmentName:",  v10,  a4,  a5,  guid,  v11);
}

- (BOOL)needsToConnectOnInterface:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateByInterfaceIdentifier,  "objectForKeyedSubscript:",  a3));
  uint64_t v5 = (char *)[v4 unsignedIntegerValue];

  BOOL v6 = !self->_active || (unint64_t)(v5 - 3) >= 0xFFFFFFFFFFFFFFFELL;
  return !v6;
}

- (BOOL)needsToDisconnectOnInterface:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateByInterfaceIdentifier,  "objectForKeyedSubscript:",  a3));
  id v5 = [v4 unsignedIntegerValue];

  if (self->_active) {
    return 0;
  }
  return v5 != (id)3 && v5 != 0LL;
}

- (BOOL)needsToDisconnect
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient stateByInterfaceIdentifier](self, "stateByInterfaceIdentifier", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[APSProxyClient needsToDisconnectOnInterface:]( self,  "needsToDisconnectOnInterface:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i)))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isConnectedOnInterface:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_stateByInterfaceIdentifier,  "objectForKeyedSubscript:",  a3));
  id v4 = [v3 unsignedIntegerValue];

  return v4 == (id)2;
}

- (void)_adjustConnectedStateWithInterfaceHint:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient stateByInterfaceIdentifier](self, "stateByInterfaceIdentifier", 0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedIntegerValue] == (id)2)
        {
          uint64_t v7 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)noteIsConnected
{
  if (-[APSRateLimiter isUnderLimit](self->_connectedNotesSentLimiter, "isUnderLimit"))
  {
    -[APSRateLimiter note](self->_connectedNotesSentLimiter, "note");
    -[APSProxyClient _adjustConnectedStateWithInterfaceHint:](self, "_adjustConnectedStateWithInterfaceHint:", 1LL);
  }

  else
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      connectedNotesSentLimiter = self->_connectedNotesSentLimiter;
      int v5 = 138412546;
      uint64_t v6 = self;
      __int16 v7 = 2112;
      uint64_t v8 = connectedNotesSentLimiter;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ noted connections too many times, likely in a loop -- stopping {connectedNotesSentLimiter: %@}",  (uint8_t *)&v5,  0x16u);
    }
  }

- (void)setState:(unint64_t)a3 onInterface:(id)a4
{
  id v6 = a4;
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient stateByInterfaceIdentifier](self, "stateByInterfaceIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  unint64_t v9 = (unint64_t)[v8 unsignedIntegerValue];

  __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 3) {
      __int128 v11 = @"unknown";
    }
    else {
      __int128 v11 = off_10011F528[v9];
    }
    if (a3 > 3) {
      __int128 v12 = @"unknown";
    }
    else {
      __int128 v12 = off_10011F528[a3];
    }
    int v17 = 138413058;
    __int128 v18 = self;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    __int16 v22 = v12;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ setting state from %@ to %@ onInterface %@",  (uint8_t *)&v17,  0x2Au);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient stateByInterfaceIdentifier](self, "stateByInterfaceIdentifier"));
  [v14 setObject:v13 forKeyedSubscript:v6];

  BOOL v16 = a3 == 2 && v9 != 2;
  -[APSProxyClient _adjustConnectedStateWithInterfaceHint:](self, "_adjustConnectedStateWithInterfaceHint:", v16);
}

- (unint64_t)stateOnInterface:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient stateByInterfaceIdentifier](self, "stateByInterfaceIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  id v7 = [v6 unsignedIntegerValue];
  return (unint64_t)v7;
}

- (void)setFilterMode:(unint64_t)a3 onInterface:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient filterModeByInterfaceIdentifier](self, "filterModeByInterfaceIdentifier"));
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (unint64_t)filterModeOnInterface:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient filterModeByInterfaceIdentifier](self, "filterModeByInterfaceIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  id v7 = [v6 unsignedIntegerValue];
  return (unint64_t)v7;
}

- (BOOL)shouldOnlySendFilterOnPreferredInterface
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient filterModeByInterfaceIdentifier](self, "filterModeByInterfaceIdentifier"));
  if ((unint64_t)[v3 count] < 2)
  {

    return 0;
  }

  char v4 = _os_feature_enabled_impl("APS", "SingleInterfaceFilterOptimizationProxy");

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient filterModeByInterfaceIdentifier](self, "filterModeByInterfaceIdentifier"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005F324;
  v8[3] = &unk_10011F450;
  v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  BOOL v6 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)_setToken:(id)a3
{
  char v4 = (NSData *)a3;
  BOOL v5 = 0;
  if (v4)
  {
    publicToken = self->_publicToken;
    if (publicToken != v4)
    {
      if (-[NSData isEqualToData:](publicToken, "isEqualToData:", v4))
      {
        BOOL v5 = 0;
      }

      else
      {
        id v7 = self->_publicToken;
        id v8 = (NSData *)-[NSData copy](v4, "copy");
        uint64_t v9 = self->_publicToken;
        self->_publicToken = v8;

        if (v7)
        {
          __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            v14 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ had a token but got a different one - any previously sent presence is now wrong",  (uint8_t *)&v13,  0xCu);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained pushTokenBecameInvalidForClient:self];
        }

        BOOL v5 = 1;
      }
    }
  }

  return v5;
}

- (void)setPublicToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    publicToken = self->_publicToken;
    int v10 = 138412802;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = publicToken;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ got a token %@ (had %@)",  (uint8_t *)&v10,  0x20u);
  }

  if (-[APSProxyClient _setToken:](self, "_setToken:", v4))
  {
    proxyManager = self->_proxyManager;
    guid = self->_guid;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendPushToken:guid:environmentName:]( proxyManager,  "sendPushToken:guid:environmentName:",  v4,  guid,  v9);
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    if (a3)
    {
      if (self->_invalid)
      {
        id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          publicToken = self->_publicToken;
          *(_DWORD *)buf = 138412546;
          id v8 = self;
          __int16 v9 = 2112;
          int v10 = publicToken;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ has been activated while invalidated (%@)",  buf,  0x16u);
        }
      }

      else
      {
        self->_active = a3;
        -[APSIDSProxyManager setListener:environment:]( self->_proxyManager,  "setListener:environment:",  self,  self->_environment);
      }
    }

    else
    {
      self->_active = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained clientBecameInactive:self];
    }
  }

- (void)invalidate
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    publicToken = self->_publicToken;
    int v5 = 138412546;
    BOOL v6 = self;
    __int16 v7 = 2112;
    id v8 = publicToken;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ has been invalidated %@",  (uint8_t *)&v5,  0x16u);
  }

  self->_invalid = 1;
  -[APSProxyClient setActive:](self, "setActive:", 0LL);
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  if (self->_largeMessageSize == a3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Large Message Size did not change, not sending to client device.",  buf,  0xCu);
    }
  }

  else
  {
    self->_largeMessageSize = a3;
    proxyManager = self->_proxyManager;
    guid = self->_guid;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendLargeMessageSize:guid:environmentName:]( proxyManager,  "sendLargeMessageSize:guid:environmentName:",  a3,  guid);
  }

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_messageSize == a3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Message Size did not change, not sending to client device.",  buf,  0xCu);
    }
  }

  else
  {
    self->_messageSize = a3;
    proxyManager = self->_proxyManager;
    guid = self->_guid;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendMessageSize:guid:environmentName:]( proxyManager,  "sendMessageSize:guid:environmentName:",  a3,  guid);
  }

- (APSTopicGroup)topics
{
  return -[APSTopicManager group](self->_topicManager, "group");
}

- (void)proxyManager:(id)a3 isNearbyChanged:(BOOL)a4
{
  if (!a4 && self->_active)
  {
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy", a3));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      __int16 v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ isNearby became NO, deactivating",  (uint8_t *)&v6,  0xCu);
    }

    -[APSProxyClient setActive:](self, "setActive:", 0LL);
  }

- (void)proxyManager:(id)a3 incomingFilterForGuid:(id)a4 environmentName:(id)a5 enabledTopics:(id)a6 ignoredTopics:(id)a7 opportunisticTopics:(id)a8 nonWakingTopics:(id)a9 topicSalts:(id)a10
{
  id v16 = a3;
  id v74 = a4;
  id v17 = a5;
  id v18 = a6;
  id v73 = a7;
  id v72 = a8;
  id v71 = a9;
  id v19 = a10;
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v19;
    id v22 = v18;
    guid = self->_guid;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138413314;
    v91 = self;
    __int16 v92 = 2112;
    id v93 = v74;
    __int16 v94 = 2112;
    v95 = guid;
    id v18 = v22;
    id v19 = v21;
    __int16 v96 = 2112;
    id v97 = v17;
    __int16 v98 = 2112;
    v99 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ incomingFilterForGuid guid %@ myGuid %@  envName %@  myEnvName %@",  buf,  0x34u);
  }

  if ([v74 isEqualToString:self->_guid])
  {
    int v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v26 = [v17 isEqualToString:v25];

    if (v26)
    {
      id v63 = v17;
      id v64 = v16;
      if (!self->_topicManager)
      {
        __int16 v27 = -[APSDictionaryTopicSaltStore initWithDictionary:]( objc_alloc(&OBJC_CLASS___APSDictionaryTopicSaltStore),  "initWithDictionary:",  v19);
        id v28 = -[APSTopicHasher initWithTopicSaltStore:]( objc_alloc(&OBJC_CLASS___APSTopicHasher),  "initWithTopicSaltStore:",  v27);
        __int16 v29 = -[APSTopicManager initWithEnvironment:topicHasher:user:userPreferences:ultraConstrainedProvider:delegate:]( objc_alloc(&OBJC_CLASS___APSTopicManager),  "initWithEnvironment:topicHasher:user:userPreferences:ultraConstrainedProvider:delegate:",  self->_environment,  v28,  0LL,  0LL,  0LL,  0LL);
        topicManager = self->_topicManager;
        self->_topicManager = v29;
      }

      id v61 = v19;
      context = objc_autoreleasePoolPush();
      id v62 = v18;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v73));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v72));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v71));
      v58 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int16 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v32 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v55 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v33 = [v70 mutableCopy];
      id v34 = [v69 mutableCopy];
      id v65 = [v67 mutableCopy];
      id v56 = [v68 mutableCopy];
      v35 = self->_topicManager;
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472LL;
      v84[2] = sub_100060230;
      v84[3] = &unk_10011F4B8;
      v89 = &stru_10011F490;
      v36 = v58;
      v85 = v36;
      v37 = v31;
      v86 = v37;
      v38 = v32;
      v87 = v38;
      v39 = v55;
      v88 = v39;
      -[APSTopicManager performFilterBlock:](v35, "performFilterBlock:", v84);
      [v33 minusSet:v36];
      [v34 minusSet:v37];
      [v65 minusSet:v38];
      [v56 minusSet:v39];
      -[NSMutableSet minusSet:](v36, "minusSet:", v70);
      -[NSMutableSet minusSet:](v37, "minusSet:", v69);
      -[NSMutableSet minusSet:](v38, "minusSet:", v67);
      -[NSMutableSet minusSet:](v39, "minusSet:", v68);
      v40 = self->_topicManager;
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472LL;
      v75[2] = sub_1000602F0;
      v75[3] = &unk_10011F508;
      v41 = v36;
      v76 = v41;
      v42 = v37;
      v77 = v42;
      v43 = v38;
      v78 = v43;
      v44 = v39;
      v79 = v44;
      id v45 = v33;
      id v80 = v45;
      id v46 = v34;
      id v81 = v46;
      id v66 = v65;
      id v82 = v66;
      id v47 = v56;
      id v83 = v47;
      -[APSTopicManager performTransactionBlock:](v40, "performTransactionBlock:", v75);
      v59 = v46;
      if ([v45 count])
      {
        BOOL v48 = 1;
        id v19 = v61;
        id v18 = v62;
LABEL_11:
        v50 = v42;
        v51 = v43;
        v52 = v44;
        v53 = v50;
LABEL_12:

        objc_autoreleasePoolPop(context);
        id v17 = v63;
        id v16 = v64;
        if (v48 && -[APSProxyClient isConnected](self, "isConnected"))
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained requestFilterForClient:self];
        }

        goto LABEL_15;
      }

      id v49 = [v46 count];
      id v19 = v61;
      id v18 = v62;
      if (v49)
      {
        BOOL v48 = 1;
        goto LABEL_11;
      }

      v57 = v42;
      if ([v66 count])
      {
        BOOL v48 = 1;
        v51 = v43;
      }

      else
      {
        v51 = v43;
        if (![v47 count])
        {
          v52 = v44;
          if (!-[NSMutableSet count](v41, "count"))
          {
            v53 = v57;
            BOOL v48 = -[NSMutableSet count](v57, "count")
               || -[NSMutableSet count](v51, "count")
               || -[NSMutableSet count](v52, "count") != 0LL;
            goto LABEL_12;
          }

          BOOL v48 = 1;
          goto LABEL_21;
        }

        BOOL v48 = 1;
      }

      v52 = v44;
LABEL_21:
      v53 = v57;
      goto LABEL_12;
    }
  }

- (void)proxyManager:(id)a3 inactiveReceivedForGuid:(id)a4 environmentName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    int v15 = 138413314;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = guid;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ inactiveReceivedForGuid guid %@ myGuid %@  envName %@  myEnvName %@",  (uint8_t *)&v15,  0x34u);
  }

  if ([v7 isEqualToString:self->_guid])
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v13 = [v8 isEqualToString:v12];

    if (v13)
    {
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ client told us that we should no longer be active.",  (uint8_t *)&v15,  0xCu);
      }

      -[APSProxyClient setActive:](self, "setActive:", 0LL);
    }
  }
}

- (void)proxyManager:(id)a3 receivedPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8 guid:(id)a9 environmentName:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = v21;
    id v23 = v19;
    id v24 = v18;
    id v25 = v17;
    id v26 = v16;
    id v27 = v15;
    guid = self->_guid;
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138413314;
    v35 = self;
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2112;
    v39 = guid;
    id v15 = v27;
    id v16 = v26;
    id v17 = v25;
    id v18 = v24;
    id v19 = v23;
    id v21 = v33;
    __int16 v40 = 2112;
    id v41 = v33;
    __int16 v42 = 2112;
    v43 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ receivedPushAckResponse guid %@ myGuid %@  envName %@  myEnvName %@",  buf,  0x34u);
  }

  if ([v20 isEqualToString:self->_guid])
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v31 = [v21 isEqualToString:v30];

    if (v31)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self requestPushAckResponse:v15 messageId:v16 token:v17 connectionType:v18 generation:v19];
    }
  }
}

- (void)proxyManager:(id)a3 sendReversePush:(id)a4 guid:(id)a5 environmentName:(id)a6
{
  id v7 = a4;
  pendingMessageGUIDs = self->_pendingMessageGUIDs;
  id v13 = v7;
  if (!pendingMessageGUIDs)
  {
    __int16 v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    int v10 = self->_pendingMessageGUIDs;
    self->_pendingMessageGUIDs = v9;

    id v7 = v13;
    pendingMessageGUIDs = self->_pendingMessageGUIDs;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
  -[NSMutableSet addObject:](pendingMessageGUIDs, "addObject:", v11);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained client:self requestSendOutgoingMessage:v13];
}

- (void)proxyManager:(id)a3 tokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9 guid:(id)a10 environmentName:(id)a11
{
  id v28 = a4;
  id v29 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138413314;
    unsigned int v31 = self;
    __int16 v32 = 2112;
    id v33 = v20;
    __int16 v34 = 2112;
    v35 = guid;
    __int16 v36 = 2112;
    id v37 = v21;
    __int16 v38 = 2112;
    v39 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ appTokenGenerate request guid %@ myGuid %@  envName %@  myEnvName %@",  buf,  0x34u);
  }

  if ([v20 isEqualToString:self->_guid])
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v26 = [v21 isEqualToString:v25];

    if (v26)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self requestTokenGenerateWithTopicHash:v28 baseToken:v29 appId:v16 expirationTTL:v17 vapidPublicKeyHash:v18 type:v19];
    }
  }
}

- (void)proxyManager:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7 guid:(id)a8 environmentName:(id)a9
{
  uint64_t v12 = *(void *)&a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    int v25 = 138413314;
    unsigned int v26 = self;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = guid;
    __int16 v31 = 2112;
    id v32 = v18;
    __int16 v33 = 2112;
    __int16 v34 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ message tracing guid %@ myGuid %@  envName %@  myEnvName %@",  (uint8_t *)&v25,  0x34u);
  }

  if ([v17 isEqualToString:self->_guid])
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v23 = [v18 isEqualToString:v22];

    if (v23)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self messageTracingWithStatus:v12 topic:v14 tracingUUID:v15 token:v16];
    }
  }
}

- (void)proxyManager:(id)a3 sendPubSubChannelList:(id)a4 messageID:(unsigned int)a5 token:(id)a6 connectionType:(int64_t)a7 environmentName:(id)a8 guid:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v17;
    __int16 v27 = 2112;
    id v28 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ sendPubSubChannelList request guid %@ envName %@",  (uint8_t *)&v23,  0x20u);
  }

  if ([v17 isEqualToString:self->_guid])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v20 = [v16 isEqualToString:v19];

    if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[APSProxyClient _createRequestForPubSubData:messageID:connectionType:environment:]( self,  "_createRequestForPubSubData:messageID:connectionType:environment:",  v14,  v12,  a7,  v16));
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained client:self sendPubSubChannelList:v21 token:v15];
    }
  }
}

- (void)sendPubSubChannelListResponse:(id)a3
{
  if (self->_active)
  {
    id v4 = a3;
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      __int16 v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ sending pubsub channel list response to agent device",  (uint8_t *)&v8,  0xCu);
    }

    proxyManager = self->_proxyManager;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendPubSubChannelListResponse:environmentName:guid:]( proxyManager,  "sendPubSubChannelListResponse:environmentName:guid:",  v4,  v7,  self->_guid);
  }

- (id)_createRequestForPubSubData:(id)a3 messageID:(unsigned int)a4 connectionType:(int64_t)a5 environment:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  environment = self->_environment;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[APSConfiguration configurationForEnvironment:connectionType:]( &OBJC_CLASS___APSConfiguration,  "configurationForEnvironment:connectionType:",  environment,  a5));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pubSubRetryAttemptsCount]);
  id v13 = [v12 unsignedIntegerValue];
  if (v13) {
    uint64_t v14 = (uint64_t)v13;
  }
  else {
    uint64_t v14 = 3LL;
  }

  id v15 = objc_alloc(&OBJC_CLASS___APSPubSubRequest);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  uint64_t v17 = PKNonMacTokenName;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient publicToken](self, "publicToken"));
  id v19 = -[APSPubSubRequest initWithMetadata:messageID:userName:token:subscriptionType:connectionType:retryCount:]( v15,  "initWithMetadata:messageID:userName:token:subscriptionType:connectionType:retryCount:",  v10,  v16,  v17,  v18,  0LL,  a5,  v14);

  return v19;
}

- (void)sendPubSubUpdateMessage:(id)a3 forConnectionType:(int64_t)a4
{
  if (self->_active)
  {
    id v6 = a3;
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ sending pubsub update message to agent device",  (uint8_t *)&v10,  0xCu);
    }

    proxyManager = self->_proxyManager;
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendPubSubUpdateMessage:connectionType:environmentName:guid:]( proxyManager,  "sendPubSubUpdateMessage:connectionType:environmentName:guid:",  v6,  a4,  v9,  self->_guid);
  }

- (void)sendPubSubChannelListRequestForConnectionType:(int64_t)a3
{
  if (self->_active)
  {
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      __int16 v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ sending pubsub channel list request message to client device",  (uint8_t *)&v8,  0xCu);
    }

    proxyManager = self->_proxyManager;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendPubSubChannelListRequest:environmentName:guid:]( proxyManager,  "sendPubSubChannelListRequest:environmentName:guid:",  a3,  v7,  self->_guid);
  }

- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    int v23 = self;
    __int16 v24 = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ received result %@ for outgoing message %@",  (uint8_t *)&v22,  0x20u);
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 guid]);
  if (v9)
  {
    int v10 = (void *)v9;
    pendingMessageGUIDs = self->_pendingMessageGUIDs;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
    LODWORD(pendingMessageGUIDs) = -[NSMutableSet containsObject:]( pendingMessageGUIDs,  "containsObject:",  v12);

    if ((_DWORD)pendingMessageGUIDs)
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        int v23 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ We have this message, forwarding feedback to proxied device.",  (uint8_t *)&v22,  0xCu);
      }

      uint64_t v14 = self->_pendingMessageGUIDs;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
      -[NSMutableSet removeObject:](v14, "removeObject:", v15);

      id v16 = [v6 code];
      proxyManager = self->_proxyManager;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
      id v19 = [v7 messageID];
      guid = self->_guid;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
      -[APSIDSProxyManager sendReversePushResponse:messageGUID:messageId:guid:environmentName:]( proxyManager,  "sendReversePushResponse:messageGUID:messageId:guid:environmentName:",  v16,  v18,  v19,  guid,  v21);
    }
  }
}

- (void)handleAppTokenGenerateResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog proxy](&OBJC_CLASS___APSLog, "proxy"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ received result AppTokenGenerateResponse %@ error %@",  (uint8_t *)&v12,  0x20u);
  }

  proxyManager = self->_proxyManager;
  guid = self->_guid;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  -[APSIDSProxyManager sendAppTokenGenerateResponse:error:guid:environmentName:]( proxyManager,  "sendAppTokenGenerateResponse:error:guid:environmentName:",  v6,  v7,  guid,  v11);
}

- (id)tokenName
{
  return 0LL;
}

- (APSIDSProxyManager)proxyManager
{
  return self->_proxyManager;
}

- (APSProxyClientDelegate)delegate
{
  return (APSProxyClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)stateByInterfaceIdentifier
{
  return self->_stateByInterfaceIdentifier;
}

- (void)setStateByInterfaceIdentifier:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_int isConnected = a3;
}

- (BOOL)needsToConnect
{
  return self->_needsToConnect;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSString)hwVersion
{
  return self->_hwVersion;
}

- (void)setHwVersion:(id)a3
{
}

- (NSDate)lastPresence
{
  return self->_lastPresence;
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (void)setSwVersion:(id)a3
{
}

- (NSString)swBuild
{
  return self->_swBuild;
}

- (void)setSwBuild:(id)a3
{
}

- (NSData)publicToken
{
  return self->_publicToken;
}

- (APSFilterVersionStateMachine)filterVersionStateMachine
{
  return self->_filterVersionStateMachine;
}

- (void)setFilterVersionStateMachine:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)filterModeByInterfaceIdentifier
{
  return self->_filterModeByInterfaceIdentifier;
}

- (void)setFilterModeByInterfaceIdentifier:(id)a3
{
}

- (APSTopicManager)topicManager
{
  return self->_topicManager;
}

- (void)setTopicManager:(id)a3
{
}

- (NSMutableSet)pendingMessageGUIDs
{
  return self->_pendingMessageGUIDs;
}

- (void)setPendingMessageGUIDs:(id)a3
{
}

- (APSRateLimiter)connectedNotesSentLimiter
{
  return self->_connectedNotesSentLimiter;
}

- (void)setConnectedNotesSentLimiter:(id)a3
{
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)largeMessageSize
{
  return self->_largeMessageSize;
}

- (void).cxx_destruct
{
}

@end