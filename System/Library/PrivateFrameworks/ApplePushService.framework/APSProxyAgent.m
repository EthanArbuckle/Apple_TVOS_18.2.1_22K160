@interface APSProxyAgent
- (APSEnvironment)environment;
- (APSIDSProxyManager)proxyManager;
- (APSProxyAgent)initWithEnvironment:(id)a3 proxyManager:(id)a4 delegate:(id)a5;
- (APSProxyAgentDelegate)delegate;
- (BOOL)canAttemptConnection;
- (BOOL)didPushCauseWake;
- (BOOL)generationMatches:(unint64_t)a3;
- (BOOL)gotNewToken;
- (BOOL)hasActiveConnection;
- (BOOL)isEnabled;
- (BOOL)isPowerEfficientToUse;
- (BOOL)isPreferredInterface;
- (BOOL)isSuspended;
- (BOOL)secureHandshakeEnabled;
- (NSArray)activeProtocolConnections;
- (NSData)token;
- (NSHashTable)dataListeners;
- (NSHashTable)stateListeners;
- (NSMutableArray)appTokenGenerateCompletions;
- (NSMutableDictionary)connectionTypeByMessageID;
- (NSMutableDictionary)outgoingMessageGUIDToCompletion;
- (NSMutableDictionary)outgoingMessageGUIDToMessageID;
- (NSNumber)maxLargeMessageSize;
- (NSNumber)maxMessageSize;
- (NSString)description;
- (NSString)guid;
- (NSString)identifier;
- (NSString)serverHostname;
- (NSString)serverIPAddress;
- (id)presenceCompletion;
- (id)queuedPresenceSend;
- (id)sendMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 ultraConstrainedAllowed:(BOOL)a7 withCompletion:(id)a8;
- (int)linkQuality;
- (int64_t)connectionType;
- (int64_t)interfaceConstraint;
- (unint64_t)presenceRetryTimeDelta;
- (void)_failAllPendingMessages;
- (void)_markDisconnectedIsPermanent:(BOOL)a3;
- (void)_noteConnection;
- (void)_sendInactiveMessage;
- (void)_sendMessageTracingAckWithStatus:(int)a3 topic:(id)a4 tracingUUID:(id)a5 token:(id)a6;
- (void)addDataListener:(id)a3;
- (void)addStateListener:(id)a3;
- (void)dealloc;
- (void)disconnectWithReason:(unsigned int)a3;
- (void)enumerateDataRecipient:(id)a3;
- (void)enumerateStateListeners:(id)a3;
- (void)kickstartProxyConnection;
- (void)proxyManager:(id)a3 appTokenGenerateResponse:(id)a4 error:(id)a5 guid:(id)a6 environmentName:(id)a7;
- (void)proxyManager:(id)a3 expiredNonceWithServerTime:(id)a4 shouldRollToken:(BOOL)a5 guid:(id)a6 environmentName:(id)a7;
- (void)proxyManager:(id)a3 handlePubSubChannelListRequest:(int64_t)a4 envName:(id)a5 guid:(id)a6;
- (void)proxyManager:(id)a3 handlePubSubChannelListResponse:(id)a4 environmentName:(id)a5 guid:(id)a6;
- (void)proxyManager:(id)a3 handlePubSubUpdateMessage:(id)a4 connectionType:(int64_t)a5 environmentName:(id)a6 guid:(id)a7;
- (void)proxyManager:(id)a3 incomingMessageSize:(id)a4 largeMessageSize:(id)a5 guid:(id)a6 environmentName:(id)a7;
- (void)proxyManager:(id)a3 incomingPushToken:(id)a4 guid:(id)a5 environmentName:(id)a6;
- (void)proxyManager:(id)a3 isConnected:(BOOL)a4 guid:(id)a5 environmentName:(id)a6;
- (void)proxyManager:(id)a3 isNearbyChanged:(BOOL)a4;
- (void)proxyManager:(id)a3 receivedPush:(id)a4 connectionType:(id)a5 generation:(id)a6 guid:(id)a7 environmentName:(id)a8;
- (void)proxyManager:(id)a3 reversePushResponse:(id)a4 messageGUID:(id)a5 messageId:(id)a6 guid:(id)a7 environmentName:(id)a8;
- (void)proxyManagerReceivedDaemonAliveNotification:(id)a3;
- (void)removeDataListener:(id)a3;
- (void)removeStateListener:(id)a3;
- (void)sendConnectMessageWithToken:(id)a3 presenceFlags:(unsigned int)a4 certificates:(id)a5 nonce:(id)a6 signature:(id)a7 hostCertificateInfo:(id)a8 withCompletion:(id)a9;
- (void)sendFilterMessageWithEnabledTopicsByHash:(id)a3 ignoredTopicsByHash:(id)a4 opportunisticTopicsByHash:(id)a5 nonWakingTopicsByHash:(id)a6 pausedTopicsByHash:(id)a7 saltsByTopic:(id)a8 token:(id)a9 version:(unint64_t)a10 expectsResponse:(BOOL)a11 withCompletion:(id)a12;
- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 generation:(int64_t)a5 token:(id)a6;
- (void)sendMessageTracingAckWithTopicHash:(id)a3 topic:(id)a4 tracingUUID:(id)a5 status:(int)a6 token:(id)a7;
- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9;
- (void)setAppTokenGenerateCompletions:(id)a3;
- (void)setCanAttemptConnection:(BOOL)a3;
- (void)setConnectionTypeByMessageID:(id)a3;
- (void)setDataListeners:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setGotNewToken:(BOOL)a3;
- (void)setGuid:(id)a3;
- (void)setHasActiveConnection:(BOOL)a3;
- (void)setMaxLargeMessageSize:(id)a3;
- (void)setMaxMessageSize:(id)a3;
- (void)setOutgoingMessageGUIDToCompletion:(id)a3;
- (void)setOutgoingMessageGUIDToMessageID:(id)a3;
- (void)setPresenceCompletion:(id)a3;
- (void)setPresenceRetryTimeDelta:(unint64_t)a3;
- (void)setProxyManager:(id)a3;
- (void)setQueuedPresenceSend:(id)a3;
- (void)setStateListeners:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation APSProxyAgent

- (APSProxyAgent)initWithEnvironment:(id)a3 proxyManager:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___APSProxyAgent;
  v12 = -[APSProxyAgent init](&v26, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_environment, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    guid = v13->_guid;
    v13->_guid = (NSString *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    appTokenGenerateCompletions = v13->_appTokenGenerateCompletions;
    v13->_appTokenGenerateCompletions = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connectionTypeByMessageID = v13->_connectionTypeByMessageID;
    v13->_connectionTypeByMessageID = v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    stateListeners = v13->_stateListeners;
    v13->_stateListeners = (NSHashTable *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    dataListeners = v13->_dataListeners;
    v13->_dataListeners = (NSHashTable *)v23;

    objc_storeStrong((id *)&v13->_proxyManager, a4);
    -[APSIDSProxyManager setListener:environment:]( v13->_proxyManager,  "setListener:environment:",  v13,  v13->_environment);
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSProxyAgent;
  -[APSProxyAgent dealloc](&v3, "dealloc");
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent environment](self, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p %@>",  v3,  self,  v5));

  return (NSString *)v6;
}

- (NSArray)activeProtocolConnections
{
  if (self->_canAttemptConnection)
  {
    v4 = self;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return (NSArray *)v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v3) {
      v5 = @"YES";
    }
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setEnabled: %@",  (uint8_t *)&v6,  0x16u);
  }

  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    if (v3)
    {
      -[APSProxyAgent proxyManager:isNearbyChanged:]( self,  "proxyManager:isNearbyChanged:",  self->_proxyManager,  -[APSIDSProxyManager isNearby](self->_proxyManager, "isNearby"));
    }

    else
    {
      -[APSProxyAgent _markDisconnectedIsPermanent:](self, "_markDisconnectedIsPermanent:", 1LL);
      -[APSProxyAgent _sendInactiveMessage](self, "_sendInactiveMessage");
    }
  }

- (int64_t)interfaceConstraint
{
  return 0LL;
}

- (void)_sendInactiveMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = -[APSIDSProxyManager isNearby](self->_proxyManager, "isNearby");
    v4 = @"NO";
    if (v3) {
      v4 = @"YES";
    }
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sendInactiveMessage, isNearby? %@",  (uint8_t *)&v7,  0x16u);
  }

  if (-[APSIDSProxyManager isNearby](self->_proxyManager, "isNearby"))
  {
    proxyManager = self->_proxyManager;
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendInactiveWithEnvironmentName:guid:]( proxyManager,  "sendInactiveWithEnvironmentName:guid:",  v6,  self->_guid);
  }

- (void)_sendMessageTracingAckWithStatus:(int)a3 topic:(id)a4 tracingUUID:(id)a5 token:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138413058;
    v17 = self;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ send message tracing ack to agent device with status %u topic %@ tracingUUID %@",  (uint8_t *)&v16,  0x26u);
  }

  guid = self->_guid;
  proxyManager = self->_proxyManager;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  -[APSIDSProxyManager sendMessageTracingStatus:topic:tracingUUID:token:guid:environmentName:]( proxyManager,  "sendMessageTracingStatus:topic:tracingUUID:token:guid:environmentName:",  v8,  v10,  v11,  v12,  guid,  v15);
}

- (void)_failAllPendingMessages
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = -[NSMutableDictionary count](self->_outgoingMessageGUIDToCompletion, "count");
    *(_DWORD *)buf = 138412546;
    id v21 = self;
    __int16 v22 = 2048;
    id v23 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ _failAllPendingMessages: %lu",  buf,  0x16u);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = self->_outgoingMessageGUIDToCompletion;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_outgoingMessageGUIDToCompletion,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v8)));
        uint64_t v10 = APSError(5LL, @"Proxy connection died");
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v6);
  }

  -[APSIDSProxyManager removeAllPendingAPSMessages](self->_proxyManager, "removeAllPendingAPSMessages");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent appTokenGenerateCompletions](self, "appTokenGenerateCompletions"));
  [v12 removeAllObjects];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent connectionTypeByMessageID](self, "connectionTypeByMessageID"));
  [v13 removeAllObjects];

  -[APSProxyAgent setPresenceCompletion:](self, "setPresenceCompletion:", 0LL);
  -[APSProxyAgent setQueuedPresenceSend:](self, "setQueuedPresenceSend:", 0LL);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000A8B28;
  v14[3] = &unk_10011FFA0;
  v14[4] = self;
  -[APSProxyAgent enumerateStateListeners:](self, "enumerateStateListeners:", v14);
}

- (void)_markDisconnectedIsPermanent:(BOOL)a3
{
  if (a3)
  {
    -[APSProxyAgent _failAllPendingMessages](self, "_failAllPendingMessages");
    -[APSProxyAgent setCanAttemptConnection:](self, "setCanAttemptConnection:", 0LL);
  }

  -[APSProxyAgent setHasActiveConnection:](self, "setHasActiveConnection:", 0LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A8C94;
  v8[3] = &unk_10011FFA0;
  v8[4] = self;
  -[APSProxyAgent enumerateStateListeners:](self, "enumerateStateListeners:", v8);
  if (!a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent proxyManager](self, "proxyManager"));
    unsigned int v6 = [v5 isNearby];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (v6) {
        uint64_t v7 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ _markDisconnectedIsPermanent, might reconnect {isNearby: %@}",  buf,  0x16u);
    }

    if (v6) {
      -[APSProxyAgent _noteConnection](self, "_noteConnection");
    }
  }

- (void)kickstartProxyConnection
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    v4 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: We may be an orphaned client, kickstarting proxy connection.",  (uint8_t *)&v3,  0xCu);
  }

  -[APSProxyAgent _noteConnection](self, "_noteConnection");
}

- (void)_noteConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained proxyAgent:self openedNewProtocolConnection:self];
}

- (void)proxyManager:(id)a3 isNearbyChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v4) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ isNearbyChanged %@",  (uint8_t *)&v8,  0x16u);
  }

  if (v4) {
    -[APSProxyAgent _noteConnection](self, "_noteConnection");
  }
  else {
    -[APSProxyAgent _markDisconnectedIsPermanent:](self, "_markDisconnectedIsPermanent:", 1LL);
  }
}

- (void)proxyManagerReceivedDaemonAliveNotification:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent queuedPresenceSend](self, "queuedPresenceSend", a3));

  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      int v7 = 138412290;
      int v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ proxyManagerReceivedDaemonAliveNotification, resending presence",  (uint8_t *)&v7,  0xCu);
    }

    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[APSProxyAgent queuedPresenceSend](self, "queuedPresenceSend"));
    ((void (**)(void, APSProxyAgent *))v6)[2](v6, self);
  }

  else
  {
    if (v5)
    {
      int v7 = 138412290;
      int v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ proxyManagerReceivedDaemonAliveNotification, failing connection",  (uint8_t *)&v7,  0xCu);
    }

    -[APSProxyAgent _markDisconnectedIsPermanent:](self, "_markDisconnectedIsPermanent:", 0LL);
  }

- (void)proxyManager:(id)a3 isConnected:(BOOL)a4 guid:(id)a5 environmentName:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  __int16 v11 = (__CFString *)a5;
  id v12 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138413314;
    objc_super v26 = self;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    v30 = guid;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    v34 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ connectedStatus change guid %@ myGuid %@ envName %@  myEnvName %@",  buf,  0x34u);
  }

  if (-[__CFString isEqualToString:](v11, "isEqualToString:", self->_guid))
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v16 = [v12 isEqualToString:v15];

    if (v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v17 = @"NO";
        if (v8) {
          __int128 v17 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        objc_super v26 = self;
        __int16 v27 = 2112;
        v28 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received connectedStatus, isConnected %@",  buf,  0x16u);
      }

      if (v8)
      {
        self->_presenceRetryTimeDelta = 0LL;
        id v23 = @"APSProtocolConnectedResponse";
        v24 = &off_10012B758;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
        id v19 = [v18 mutableCopy];

        if (-[APSProxyAgent gotNewToken](self, "gotNewToken"))
        {
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent token](self, "token"));
          [v19 setObject:v20 forKeyedSubscript:@"APSProtocolToken"];

          -[APSProxyAgent setGotNewToken:](self, "setGotNewToken:", 0LL);
        }

        -[APSProxyAgent setHasActiveConnection:](self, "setHasActiveConnection:", 1LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent presenceCompletion](self, "presenceCompletion"));

        if (v21)
        {
          __int16 v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[APSProxyAgent presenceCompletion]( self,  "presenceCompletion"));
          ((void (**)(void, id, void))v22)[2](v22, v19, 0LL);
        }
      }

      else
      {
        -[APSProxyAgent _markDisconnectedIsPermanent:](self, "_markDisconnectedIsPermanent:", 0LL);
      }
    }
  }
}

- (void)proxyManager:(id)a3 incomingPushToken:(id)a4 guid:(id)a5 environmentName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    int v18 = 138413314;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = guid;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ incomingPushToken guid %@ myGuid %@  envName %@  myEnvName %@",  (uint8_t *)&v18,  0x34u);
  }

  if ([v12 isEqualToString:self->_guid])
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v17 = [v13 isEqualToString:v16];

    if (v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = self;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received push token %@",  (uint8_t *)&v18,  0x16u);
      }

      -[APSProxyAgent setToken:](self, "setToken:", v11);
      -[APSProxyAgent setGotNewToken:](self, "setGotNewToken:", 1LL);
    }
  }
}

- (void)proxyManager:(id)a3 incomingMessageSize:(id)a4 largeMessageSize:(id)a5 guid:(id)a6 environmentName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    int v21 = 138413826;
    __int16 v22 = self;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    v30 = guid;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ incomingMessageSize %@ largeMessageSize %@ guid %@ myGuid %@  envName %@  myEnvName %@",  (uint8_t *)&v21,  0x48u);
  }

  if ([v15 isEqualToString:self->_guid])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v20 = [v16 isEqualToString:v19];

    if (v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412802;
        __int16 v22 = self;
        __int16 v23 = 2112;
        id v24 = v13;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received sizes %@ %@",  (uint8_t *)&v21,  0x20u);
      }

      -[APSProxyAgent setMaxMessageSize:](self, "setMaxMessageSize:", v13);
      -[APSProxyAgent setMaxLargeMessageSize:](self, "setMaxLargeMessageSize:", v14);
    }
  }
}

- (void)proxyManager:(id)a3 receivedPush:(id)a4 connectionType:(id)a5 generation:(id)a6 guid:(id)a7 environmentName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138413314;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v18;
    __int16 v33 = 2112;
    v34 = guid;
    __int16 v35 = 2112;
    id v36 = v19;
    __int16 v37 = 2112;
    v38 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ receivedPush guid %@ myGuid %@  envName %@  myEnvName %@",  buf,  0x34u);
  }

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"APSProtocolMessageID"]);
  if (v22)
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent connectionTypeByMessageID](self, "connectionTypeByMessageID"));
    [v23 setObject:v16 forKeyedSubscript:v22];
  }

  if ([v18 isEqualToString:self->_guid])
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v25 = [v19 isEqualToString:v24];

    if (v25)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received push %@",  buf,  0x16u);
      }

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000A98AC;
      v26[3] = &unk_100121330;
      v26[4] = self;
      id v27 = v15;
      id v28 = v17;
      -[APSProxyAgent enumerateDataRecipient:](self, "enumerateDataRecipient:", v26);
    }
  }
}

- (void)proxyManager:(id)a3 reversePushResponse:(id)a4 messageGUID:(id)a5 messageId:(id)a6 guid:(id)a7 environmentName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138413314;
    id v32 = self;
    __int16 v33 = 2112;
    id v34 = v18;
    __int16 v35 = 2112;
    id v36 = guid;
    __int16 v37 = 2112;
    id v38 = v19;
    __int16 v39 = 2112;
    v40 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ reversePushResponse guid %@ myGuid %@  envName %@  myEnvName %@",  buf,  0x34u);
  }

  if ([v18 isEqualToString:self->_guid])
  {
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v23 = [v19 isEqualToString:v22];

    if (v23)
    {
      id v24 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_outgoingMessageGUIDToCompletion,  "objectForKey:",  v16));
      if (v24)
      {
        unsigned int v25 = [v15 intValue];
        if (v25 > 6) {
          uint64_t v26 = 255LL;
        }
        else {
          uint64_t v26 = qword_100102D10[v25];
        }
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v26,  @"APSProtocolDeliveryStatus"));
        v30 = v27;
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));

        ((void (**)(void, void *, void))v24)[2](v24, v28, 0LL);
        -[NSMutableDictionary removeObjectForKey:](self->_outgoingMessageGUIDToCompletion, "removeObjectForKey:", v16);
        -[NSMutableDictionary removeObjectForKey:](self->_outgoingMessageGUIDToMessageID, "removeObjectForKey:", v16);
        if ([v15 intValue] == 2)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = self;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ reverse push response was Invalid -- make sure the agent device has asserted our presence.",  buf,  0xCu);
          }

          -[APSProxyAgent _markDisconnectedIsPermanent:](self, "_markDisconnectedIsPermanent:", 0LL);
        }
      }
    }
  }
}

- (void)proxyManager:(id)a3 expiredNonceWithServerTime:(id)a4 shouldRollToken:(BOOL)a5 guid:(id)a6 environmentName:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      id v16 = @"YES";
    }
    else {
      id v16 = @"NO";
    }
    guid = self->_guid;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unint64_t presenceRetryTimeDelta = self->_presenceRetryTimeDelta;
    *(_DWORD *)buf = 138414082;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    __int16 v31 = v16;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    __int16 v35 = guid;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    __int16 v39 = v18;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2048;
    unint64_t v43 = presenceRetryTimeDelta;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ expiredNonceWithServerTime shouldRollToken %@ guid %@ myGuid %@  envName %@  myEnvName %@  serverTime %@  delayTime %llu",  buf,  0x52u);
  }

  if ([v14 isEqualToString:self->_guid])
  {
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    if (![v15 isEqualToString:v20])
    {
LABEL_12:

      goto LABEL_13;
    }

    unint64_t v21 = self->_presenceRetryTimeDelta;

    if (v21 <= 0x8BB2C96FFFLL)
    {
      dispatch_time_t v22 = dispatch_time(0LL, self->_presenceRetryTimeDelta);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A9E10;
      block[3] = &unk_100121358;
      BOOL v27 = v9;
      id v25 = v13;
      uint64_t v26 = self;
      dispatch_after(v22, &_dispatch_main_q, block);
      unint64_t v23 = 2 * self->_presenceRetryTimeDelta;
      if (!v23) {
        unint64_t v23 = 2LL;
      }
      self->_unint64_t presenceRetryTimeDelta = v23;
      unsigned int v20 = v25;
      goto LABEL_12;
    }
  }

- (void)proxyManager:(id)a3 appTokenGenerateResponse:(id)a4 error:(id)a5 guid:(id)a6 environmentName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (NSString *)a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    guid = self->_guid;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    int v24 = 138413314;
    id v25 = self;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = guid;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    id v33 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ appTokenGenerate response guid %@ myGuid %@  envName %@  myEnvName %@",  (uint8_t *)&v24,  0x34u);
  }

  if ([v15 isEqualToString:self->_guid])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v20 = [v16 isEqualToString:v19];

    if (v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412802;
        id v25 = self;
        __int16 v26 = 2112;
        id v27 = v13;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received appTokenGenerateResponse %@ errorCode %@",  (uint8_t *)&v24,  0x20u);
      }

      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent appTokenGenerateCompletions](self, "appTokenGenerateCompletions"));
      dispatch_time_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v21 firstObject]);

      if (v22)
      {
        ((void (**)(void, id, void))v22)[2](v22, v13, 0LL);
        unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent appTokenGenerateCompletions](self, "appTokenGenerateCompletions"));
        [v23 removeObjectAtIndex:0];
      }
    }
  }
}

- (void)proxyManager:(id)a3 handlePubSubChannelListResponse:(id)a4 environmentName:(id)a5 guid:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sendPubSubChannelList response guid %@ envName %@",  buf,  0x20u);
  }

  if ([v13 isEqualToString:self->_guid])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000AA30C;
      v16[3] = &unk_100121380;
      v16[4] = self;
      id v17 = v11;
      -[APSProxyAgent enumerateDataRecipient:](self, "enumerateDataRecipient:", v16);
    }
  }
}

- (void)proxyManager:(id)a3 handlePubSubUpdateMessage:(id)a4 connectionType:(int64_t)a5 environmentName:(id)a6 guid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = sub_100005B48(a5);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138413058;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v17;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ PubSub update message guid %@ interface %@ envName %@",  buf,  0x2Au);
  }

  if ([v15 isEqualToString:self->_guid])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    unsigned int v19 = [v14 isEqualToString:v18];

    if (v19)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000AA4C0;
      v20[3] = &unk_100121380;
      v20[4] = self;
      id v21 = v13;
      -[APSProxyAgent enumerateDataRecipient:](self, "enumerateDataRecipient:", v20);
    }
  }
}

- (void)proxyManager:(id)a3 handlePubSubChannelListRequest:(int64_t)a4 envName:(id)a5 guid:(id)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = a6;
    __int16 v13 = 2112;
    id v14 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ PubSub channel list request message guid %@ envName %@",  (uint8_t *)&v9,  0x20u);
  }

- (void)enumerateStateListeners:(id)a3
{
  BOOL v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v5 = self->_stateListeners;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateDataRecipient:(id)a3
{
  BOOL v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v5 = self->_dataListeners;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addStateListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSProxyAgent stateListeners](self, "stateListeners"));
  [v5 addObject:v4];
}

- (void)removeStateListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSProxyAgent stateListeners](self, "stateListeners"));
  [v5 removeObject:v4];
}

- (void)addDataListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSProxyAgent dataListeners](self, "dataListeners"));
  [v5 addObject:v4];
}

- (void)removeDataListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSProxyAgent dataListeners](self, "dataListeners"));
  [v5 removeObject:v4];
}

- (BOOL)isPreferredInterface
{
  return 1;
}

- (BOOL)didPushCauseWake
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"PROXY";
}

- (int64_t)connectionType
{
  return 2LL;
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)secureHandshakeEnabled
{
  return 1;
}

- (NSString)serverIPAddress
{
  return 0LL;
}

- (NSString)serverHostname
{
  return 0LL;
}

- (int)linkQuality
{
  return 0;
}

- (BOOL)isPowerEfficientToUse
{
  return 1;
}

- (void)disconnectWithReason:(unsigned int)a3
{
}

- (BOOL)generationMatches:(unint64_t)a3
{
  return 1;
}

- (void)sendConnectMessageWithToken:(id)a3 presenceFlags:(unsigned int)a4 certificates:(id)a5 nonce:(id)a6 signature:(id)a7 hostCertificateInfo:(id)a8 withCompletion:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = -[APSIDSProxyManager isNearby](self->_proxyManager, "isNearby");
    id v21 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v44 = 2112;
    if (v20) {
      id v21 = @"YES";
    }
    id v45 = v14;
    __int16 v46 = 2112;
    v47 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ _sendPresenceMessageWithServerTime %@, isNearby? %@",  buf,  0x20u);
  }

  if (self->_enabled && -[APSProxyAgent canAttemptConnection](self, "canAttemptConnection"))
  {
    id v33 = v16;
    sysctlbyname("hw.machine", 0LL, (size_t *)buf, 0LL, 0LL);
    __int16 v22 = malloc(*(size_t *)buf);
    sysctlbyname("hw.machine", v22, (size_t *)buf, 0LL, 0LL);
    id v23 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v22,  4LL);
    if (v22) {
      free(v22);
    }
    __int16 v24 = (void *)_CFCopySystemVersionDictionary();
    __int16 v32 = v24;
    if (v24)
    {
      id v25 = v24;
      __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v24 objectForKey:_kCFSystemVersionProductVersionKey]);
      id v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v25 objectForKey:_kCFSystemVersionBuildVersionKey]);
    }

    else
    {
      id v27 = @"Unknown";
      __int16 v26 = @"Unknown";
    }

    -[APSProxyAgent setPresenceCompletion:](self, "setPresenceCompletion:", v19);
    -[APSProxyAgent setToken:](self, "setToken:", v14);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000AACA4;
    v34[3] = &unk_1001213A8;
    id v35 = v14;
    __int16 v36 = v23;
    id v37 = v26;
    __int16 v38 = v27;
    id v39 = v15;
    id v16 = v33;
    id v40 = v33;
    id v41 = v17;
    id v42 = v18;
    id v31 = v27;
    __int16 v28 = v26;
    id v29 = v23;
    -[APSProxyAgent setQueuedPresenceSend:](self, "setQueuedPresenceSend:", v34);
    __int16 v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[APSProxyAgent queuedPresenceSend](self, "queuedPresenceSend"));
    ((void (**)(void, APSProxyAgent *))v30)[2](v30, self);
  }
}

- (id)sendMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 ultraConstrainedAllowed:(BOOL)a7 withCompletion:(id)a8
{
  id v10 = a3;
  id v11 = a8;
  __int128 v12 = v11;
  if (v10 && v11)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v15 = (id)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412546;
      __int16 v32 = self;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sendingMessage with messageGUID %@",  (uint8_t *)&v31,  0x16u);
    }

    [v10 setGuid:v15];
    outgoingMessageGUIDToCompletion = self->_outgoingMessageGUIDToCompletion;
    if (!outgoingMessageGUIDToCompletion)
    {
      unsigned int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v21 = self->_outgoingMessageGUIDToCompletion;
      self->_outgoingMessageGUIDToCompletion = v20;

      outgoingMessageGUIDToCompletion = self->_outgoingMessageGUIDToCompletion;
    }

    id v22 = objc_retainBlock(v12);
    -[NSMutableDictionary setObject:forKey:](outgoingMessageGUIDToCompletion, "setObject:forKey:", v22, v15);

    outgoingMessageGUIDToMessageID = self->_outgoingMessageGUIDToMessageID;
    if (!outgoingMessageGUIDToMessageID)
    {
      __int16 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v25 = self->_outgoingMessageGUIDToMessageID;
      self->_outgoingMessageGUIDToMessageID = v24;

      outgoingMessageGUIDToMessageID = self->_outgoingMessageGUIDToMessageID;
    }

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 messageID]));
    -[NSMutableDictionary setObject:forKey:](outgoingMessageGUIDToMessageID, "setObject:forKey:", v26, v15);

    guid = self->_guid;
    proxyManager = self->_proxyManager;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendMessage:guid:environmentName:]( proxyManager,  "sendMessage:guid:environmentName:",  v10,  guid,  v29);

    id v17 = 0LL;
  }

  else
  {
    uint64_t v16 = APSError(2LL, @"Missing message or completion");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  return v17;
}

- (void)sendFilterMessageWithEnabledTopicsByHash:(id)a3 ignoredTopicsByHash:(id)a4 opportunisticTopicsByHash:(id)a5 nonWakingTopicsByHash:(id)a6 pausedTopicsByHash:(id)a7 saltsByTopic:(id)a8 token:(id)a9 version:(unint64_t)a10 expectsResponse:(BOOL)a11 withCompletion:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  if (-[APSProxyAgent hasActiveConnection](self, "hasActiveConnection"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 allValues]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 allValues]);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 allValues]);
      *(_DWORD *)buf = 138413570;
      id v40 = self;
      __int16 v41 = 2112;
      id v42 = v22;
      __int16 v43 = 2112;
      __int16 v44 = v23;
      __int16 v45 = 2112;
      __int16 v46 = v24;
      __int16 v47 = 2112;
      v48 = v25;
      __int16 v49 = 2112;
      id v50 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sending filter to agent device for enabled %@ ignored %@ opportunistic %@ nonWaking %@ topicSalts %@",  buf,  0x3Eu);
    }

    proxyManager = self->_proxyManager;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    guid = self->_guid;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v17 allValues]);
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v18 allValues]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v19 allValues]);
    id v30 = v19;
    id v31 = v17;
    __int16 v32 = (void *)v29;
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v20 allValues]);
    id v34 = v20;
    id v35 = v18;
    __int16 v36 = (void *)v33;
    -[APSIDSProxyManager sendFilterWithEnvironmentName:guid:enabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:topicSalts:]( proxyManager,  "sendFilterWithEnvironmentName:guid:enabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:topicSalts:",  v26,  guid,  v27,  v28,  v32,  v33,  v21);

    id v18 = v35;
    id v20 = v34;

    id v17 = v31;
    id v19 = v30;
  }
}

- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 generation:(int64_t)a5 token:(id)a6
{
  id v18 = a4;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent connectionTypeByMessageID](self, "connectionTypeByMessageID"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v18]);

  proxyManager = self->_proxyManager;
  id v14 = v10;
  if (!v10) {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent token](self, "token"));
  }
  id v15 = [v12 integerValue];
  guid = self->_guid;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  -[APSIDSProxyManager sendResponse:messageId:token:connectionType:generation:guid:environmentName:]( proxyManager,  "sendResponse:messageId:token:connectionType:generation:guid:environmentName:",  a3,  v18,  v14,  v15,  a5,  guid,  v17);

  if (!v10) {
}
  }

- (void)sendMessageTracingAckWithTopicHash:(id)a3 topic:(id)a4 tracingUUID:(id)a5 status:(int)a6 token:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = self;
    __int16 v22 = 1024;
    int v23 = v8;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ send message tracing ack to agent device with status %u topic %@ tracingUUID %@",  (uint8_t *)&v20,  0x26u);
  }

  proxyManager = self->_proxyManager;
  id v17 = v15;
  if (!v15) {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent token](self, "token"));
  }
  guid = self->_guid;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  -[APSIDSProxyManager sendMessageTracingStatus:topic:tracingUUID:token:guid:environmentName:]( proxyManager,  "sendMessageTracingStatus:topic:tracingUUID:token:guid:environmentName:",  v8,  v13,  v14,  v17,  guid,  v19);

  if (!v15) {
}
  }

- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (-[APSProxyAgent hasActiveConnection](self, "hasActiveConnection"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ sending pubsub channel list to agent device",  (uint8_t *)&v13,  0xCu);
    }

    proxyManager = self->_proxyManager;
    id v11 = v9;
    if (!v9) {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent token](self, "token"));
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[APSIDSProxyManager sendPubSubChannelList:messageID:token:connectionType:environmentName:guid:]( proxyManager,  "sendPubSubChannelList:messageID:token:connectionType:environmentName:guid:",  v8,  v5,  v11,  2LL,  v12,  self->_guid);

    if (!v9) {
  }
    }
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = a5;
  id v16 = a9;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyAgent appTokenGenerateCompletions](self, "appTokenGenerateCompletions"));
  id v21 = objc_retainBlock(v16);

  [v20 addObject:v21];
  proxyManager = self->_proxyManager;
  id v25 = v18;
  if (!v18) {
    id v25 = (id)objc_claimAutoreleasedReturnValue(-[APSProxyAgent token](self, "token"));
  }
  guid = self->_guid;
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  -[APSIDSProxyManager sendTokenGenerateMessageWithTopicHash:baseToken:appId:expirationTTL:vapidPublicKeyHash:type:guid:environmentName:]( proxyManager,  "sendTokenGenerateMessageWithTopicHash:baseToken:appId:expirationTTL:vapidPublicKeyHash:type:guid:environmentName:",  v19,  v25,  v12,  v11,  v17,  a8,  guid,  v24);

  if (!v18) {
}
  }

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (APSIDSProxyManager)proxyManager
{
  return self->_proxyManager;
}

- (void)setProxyManager:(id)a3
{
}

- (APSProxyAgentDelegate)delegate
{
  return (APSProxyAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (BOOL)canAttemptConnection
{
  return self->_canAttemptConnection;
}

- (void)setCanAttemptConnection:(BOOL)a3
{
  self->_canAttemptConnection = a3;
}

- (BOOL)hasActiveConnection
{
  return self->_hasActiveConnection;
}

- (void)setHasActiveConnection:(BOOL)a3
{
  self->_hasActiveConnection = a3;
}

- (unint64_t)presenceRetryTimeDelta
{
  return self->_presenceRetryTimeDelta;
}

- (void)setPresenceRetryTimeDelta:(unint64_t)a3
{
  self->_unint64_t presenceRetryTimeDelta = a3;
}

- (id)queuedPresenceSend
{
  return self->_queuedPresenceSend;
}

- (void)setQueuedPresenceSend:(id)a3
{
}

- (id)presenceCompletion
{
  return self->_presenceCompletion;
}

- (void)setPresenceCompletion:(id)a3
{
}

- (NSMutableArray)appTokenGenerateCompletions
{
  return self->_appTokenGenerateCompletions;
}

- (void)setAppTokenGenerateCompletions:(id)a3
{
}

- (NSNumber)maxMessageSize
{
  return self->_maxMessageSize;
}

- (void)setMaxMessageSize:(id)a3
{
}

- (NSNumber)maxLargeMessageSize
{
  return self->_maxLargeMessageSize;
}

- (void)setMaxLargeMessageSize:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (BOOL)gotNewToken
{
  return self->_gotNewToken;
}

- (void)setGotNewToken:(BOOL)a3
{
  self->_gotNewToken = a3;
}

- (NSMutableDictionary)outgoingMessageGUIDToCompletion
{
  return self->_outgoingMessageGUIDToCompletion;
}

- (void)setOutgoingMessageGUIDToCompletion:(id)a3
{
}

- (NSMutableDictionary)outgoingMessageGUIDToMessageID
{
  return self->_outgoingMessageGUIDToMessageID;
}

- (void)setOutgoingMessageGUIDToMessageID:(id)a3
{
}

- (NSMutableDictionary)connectionTypeByMessageID
{
  return self->_connectionTypeByMessageID;
}

- (void)setConnectionTypeByMessageID:(id)a3
{
}

- (NSHashTable)stateListeners
{
  return self->_stateListeners;
}

- (void)setStateListeners:(id)a3
{
}

- (NSHashTable)dataListeners
{
  return self->_dataListeners;
}

- (void)setDataListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end