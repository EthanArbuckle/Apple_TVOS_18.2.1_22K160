@interface APSCourierConnection
- (APSCourierConnection)initWithEnvironment:(id)a3;
- (APSCourierConnectionDelegate)delegate;
- (BOOL)didPushCauseWake;
- (BOOL)didPushCauseWakeOnInterface:(int64_t)a3;
- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4;
- (BOOL)hasConnectionEstablishTimer;
- (BOOL)hasConnectionEstablishTimerOnInterface:(int64_t)a3;
- (BOOL)hasKeepAliveResponseTimerOnInterface:(int64_t)a3;
- (BOOL)hasOpenConnection;
- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3;
- (BOOL)informingOfWrite;
- (BOOL)isConnected;
- (BOOL)isConnectedOnInterface:(int64_t)a3;
- (BOOL)isConnectingOnInterface:(int64_t)a3;
- (BOOL)isDualChannelAllowed;
- (BOOL)isExpensiveToUseInterface:(int64_t)a3;
- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface;
- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3;
- (BOOL)isKeepAliveProxySupportedOnSocketOnInterface:(int64_t)a3;
- (BOOL)isPackedFormatOnInterface:(int64_t)a3;
- (BOOL)isSuspendedOnInterface:(int64_t)a3;
- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3;
- (BOOL)minimumIntervalFallbackEnabledOnInterface:(int64_t)a3;
- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6 onInterface:(int64_t)a7;
- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled;
- (BOOL)remainsConnectedWhenWWANSuspends;
- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9;
- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4;
- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4 withDisconnectReason:(unsigned int)a5;
- (BOOL)shouldClientScheduleReconnectDueToFailureOnInterface:(int64_t)a3;
- (BOOL)shouldConnectOnInterface:(int64_t)a3;
- (Class)tcpStreamClass;
- (NSDate)lastConnected;
- (NSDictionary)connectionDebugInfo;
- (NSString)ifname;
- (NSString)redirectHost;
- (NSString)tcpInfoDescription;
- (double)currentKeepAliveInterval;
- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3;
- (double)expensiveConditionsBackOffInterval;
- (double)keepAliveGracePeriodOnInterface:(int64_t)a3;
- (double)minimumKeepAliveInterval;
- (double)wifiKeepAliveEarlyFireConstantInterval;
- (id)TCPStreamWithEnvironment:(id)a3;
- (id)_currentStream;
- (id)connectionAttemptsInExpensiveConditions;
- (id)currentKeepAliveStateOnInterface:(int64_t)a3;
- (id)interfaceNameForInterface:(int64_t)a3;
- (id)objectForKey:(id)a3 onInterface:(int64_t)a4;
- (id)pcInterfaceMonitorNonCellular;
- (id)pcInterfaceMonitorOnInterface:(int64_t)a3;
- (id)pcInterfaceMonitorWWAN;
- (id)serverAddressForInterface:(int64_t)a3;
- (id)serverHostnameForInterface:(int64_t)a3;
- (id)serverIPAddressForInterface:(int64_t)a3;
- (id)serverPortForInterface:(int64_t)a3;
- (id)streamForInterface:(int64_t)a3;
- (id)tcpInfoDescriptionForInterface:(int64_t)a3;
- (id)usingCachedIPAddressOnInterface:(int64_t)a3;
- (int)currentGrowthStageOnInterface:(int64_t)a3;
- (int)lastKeepAliveActionOnInterface:(int64_t)a3;
- (int)nwInterfaceTypeForInterface:(int64_t)a3;
- (int64_t)_interfaceForConnectionManager:(id)a3;
- (int64_t)_interfaceForProtocolParser:(id)a3;
- (int64_t)_interfaceForStream:(id)a3;
- (int64_t)connectingInterface;
- (int64_t)interfaceConstraintForInterface:(int64_t)a3;
- (int64_t)lastAttemptedInterface;
- (int64_t)nextConnectionAttemptInterface;
- (int64_t)preferredInterface;
- (unint64_t)countConnectedInterfaces;
- (unint64_t)countOfGrowthActionsOnInterface:(int64_t)a3;
- (unint64_t)countOpenConnections;
- (unint64_t)maxExpensiveConditionsConnectionAttempts;
- (unint64_t)tcpStream:(id)a3 dataReceived:(id)a4 isWakingMessage:(BOOL)a5;
- (unsigned)disconnectReason;
- (unsigned)redirectCount;
- (void)__updateConnectionManagerKeepAliveIntervalNonCellular;
- (void)__updateConnectionManagerKeepAliveIntervalWWAN;
- (void)_connectionEstablishTimerFired:(id)a3;
- (void)_handleDualModeState;
- (void)_keepAliveResponseTimerFired:(id)a3;
- (void)_prepareToParseOutgoingDataOnInterface:(int64_t)a3;
- (void)_updateConnectionManagerKeepAliveIntervalNonCellular;
- (void)_updateConnectionManagerKeepAliveIntervalWWAN;
- (void)clearConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)clearKeepAliveResponseTimerOnInterface:(int64_t)a3;
- (void)clearRedirectCount;
- (void)closeStreamForInterface:(int64_t)a3;
- (void)connectToEnvironment:(id)a3 onInterface:(int64_t)a4 allowedInterfaceConstraint:(int64_t)a5 useAlternatePort:(BOOL)a6 keepAliveProxyMode:(unint64_t)a7;
- (void)connectionManager:(id)a3 handleEvent:(int)a4 context:(id)a5;
- (void)dealloc;
- (void)holdPowerAssertionUntilStreamsQuiesce;
- (void)incrementRedirectCount;
- (void)protocolParser:(id)a3 receiveAPNSPackError:(id)a4;
- (void)resumeManagerWithAction:(int)a3 onInterface:(int64_t)a4;
- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8;
- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 onInterface:(int64_t)a17;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 onInterface:(int64_t)a13;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 onInterface:(int64_t)a12;
- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 onInterface:(int64_t)a10;
- (void)sendFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4 onInterface:(int64_t)a5;
- (void)sendFlushResponseMessageWithPaddingLength:(unint64_t)a3 onInterface:(int64_t)a4;
- (void)sendKeepAliveMessageWithMetadata:(id)a3 onInterface:(int64_t)a4;
- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6;
- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7;
- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3;
- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6;
- (void)sendSetActiveIntervalMessageWithInterval:(unsigned int)a3 onInterface:(int64_t)a4;
- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 onInterface:(int64_t)a9;
- (void)setConnectionAttemptsInExpensiveConditions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnectReason:(unsigned int)a3;
- (void)setEnableNonCellularOnConnectionManager:(BOOL)a3;
- (void)setExpensiveConditionsBackOffInterval:(double)a3;
- (void)setInformingOfWrite:(BOOL)a3;
- (void)setIsConnecting:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setIsDualChannelAllowed:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setKeepAliveConfiguration:(unint64_t)a3;
- (void)setKeepAliveGracePeriod:(double)a3 onInterface:(int64_t)a4;
- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setLastConnected:(id)a3;
- (void)setMaxExpensiveConditionsConnectionAttempts:(unint64_t)a3;
- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4 onInterface:(int64_t)a5;
- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3;
- (void)setRedirectHost:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setServerStatsExpectedKeepAlive:(double)a3 onInterface:(int64_t)a4;
- (void)setServerStatsMaxKeepAlive:(double)a3 onInterface:(int64_t)a4;
- (void)setServerStatsMinKeepAlive:(double)a3 onInterface:(int64_t)a4;
- (void)setStream:(id)a3 forInterface:(int64_t)a4;
- (void)setUsingCachedIPAddress:(id)a3 onInterface:(int64_t)a4;
- (void)setUsingServerStatsAggressively:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setWifiKeepAliveEarlyFireConstantInterval:(double)a3;
- (void)startConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4;
- (void)stopAndResetManagerOnInterface:(int64_t)a3;
- (void)stopManagerOnInterface:(int64_t)a3;
- (void)stopManagers;
- (void)tcpStream:(id)a3 errorOccured:(id)a4;
- (void)tcpStream:(id)a3 hasDeterminedServerHostname:(id)a4;
- (void)tcpStream:(id)a3 receivedServerBag:(id)a4;
- (void)tcpStreamDidFailToFindKeepAliveProxyInterface:(id)a3;
- (void)tcpStreamDidFailToForceKeepAliveProxyInterface:(id)a3;
- (void)tcpStreamDidFailToObtainKeepAliveProxy:(id)a3 willRetry:(BOOL)a4;
- (void)tcpStreamEndEncountered:(id)a3 withReason:(unsigned int)a4;
- (void)tcpStreamHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 maxEncoderTableSize:(unint64_t)a6 maxDecoderTableSize:(unint64_t)a7 secureHandshakeEnabled:(BOOL)a8;
- (void)updateConnectionManagerKeepAliveIntervalOnInterface:(int64_t)a3;
- (void)writeDataInBackground:(id)a3;
- (void)writeDataInBackground:(id)a3 onInterface:(int64_t)a4;
@end

@implementation APSCourierConnection

- (APSCourierConnection)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___APSCourierConnection;
  v5 = -[APSCourierConnection init](&v27, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lastAttemptedInterface = 3LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    v8 = (NSString *)[v7 copy];
    domain = v6->_domain;
    v6->_domain = v8;

    unint64_t v10 = 0LL;
    v6->_redirectCount = 0;
    v6->_disconnectReason = 0;
    uint64_t v26 = APSBundleIdentifier;
    connectionManagers = v6->_connectionManagers;
    char v12 = 1;
    do
    {
      v13 = objc_autoreleasePoolPush();
      v14 = objc_alloc(&OBJC_CLASS___NSString);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      id v16 = sub_10003CEE4(v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%@(%@)-%@", v26, v15, v17);

      id v19 = [v4 priority];
      int v20 = v12 & 1;
      uint64_t v21 = 2LL;
      if ((v12 & 1) == 0) {
        uint64_t v21 = 3LL;
      }
      if (v19) {
        BOOL v22 = v21;
      }
      else {
        BOOL v22 = (v12 & 1) == 0;
      }
      v23 = -[PCConnectionManager initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:serviceIdentifier:]( objc_alloc(&OBJC_CLASS___PCConnectionManager),  "initWithConnectionClass:interfaceIdentifier:guidancePriority:delegate:serviceIdentifier:",  0LL,  v12 & 1,  v22,  v6,  v18);
      v24 = connectionManagers[v10];
      connectionManagers[v10] = v23;

      -[PCConnectionManager setOnlyAllowedStyle:](connectionManagers[v10], "setOnlyAllowedStyle:", 0LL);
      objc_autoreleasePoolPop(v13);
      char v12 = 0;
      unint64_t v10 = 1LL;
    }

    while (v20);
    v6->_maxExpensiveConditionsConnectionAttempts = 3LL;
    v6->_expensiveConditionsBackOffInterval = 600.0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2 = 0LL;
  streams = self->_streams;
  parsers = self->_parsers;
  usingCachedIPAddress = self->_usingCachedIPAddress;
  connectionManagers = self->_connectionManagers;
  keepAliveTimers = self->_keepAliveTimers;
  keepAlivePowerAssertions = self->_keepAlivePowerAssertions;
  connectionEstablishTimers = self->_connectionEstablishTimers;
  connectionEstablishPowerAssertions = self->_connectionEstablishPowerAssertions;
  char v11 = 1;
  do
  {
    char v12 = v11;
    -[APSTCPStream setDelegate:](streams[v2], "setDelegate:", 0LL);
    v13 = streams[v2];
    streams[v2] = 0LL;

    v14 = parsers[v2];
    parsers[v2] = 0LL;

    v15 = usingCachedIPAddress[v2];
    usingCachedIPAddress[v2] = 0LL;

    -[PCConnectionManager stopManager](connectionManagers[v2], "stopManager");
    id v16 = keepAliveTimers[v2];
    if (v16) {
      -[NSTimer invalidate](v16, "invalidate");
    }
    v17 = keepAlivePowerAssertions[v2];
    if (v17)
    {
      keepAlivePowerAssertions[v2] = 0LL;
    }

    v18 = connectionEstablishTimers[v2];
    if (v18) {
      -[NSTimer invalidate](v18, "invalidate");
    }
    id v19 = connectionEstablishPowerAssertions[v2];
    if (v19)
    {
      connectionEstablishPowerAssertions[v2] = 0LL;
    }

    char v11 = 0;
    uint64_t v2 = 1LL;
  }

  while ((v12 & 1) != 0);
  redirectHost = self->_redirectHost;
  self->_redirectHost = 0LL;

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___APSCourierConnection;
  -[APSCourierConnection dealloc](&v22, "dealloc");
}

- (void)setStream:(id)a3 forInterface:(int64_t)a4
{
}

- (id)streamForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    v3 = self->_streams[a3];
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

- (int64_t)_interfaceForProtocolParser:(id)a3
{
  if (self->_parsers[1] == a3) {
    return 1LL;
  }
  if (self->_parsers[0] == a3) {
    return 0LL;
  }
  return 3LL;
}

- (void)_prepareToParseOutgoingDataOnInterface:(int64_t)a3
{
  if (!self->_informingOfWrite)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection streamForInterface:](self, "streamForInterface:"));
    unsigned int v6 = [v5 isConnected];

    if (v6)
    {
      self->_informingOfWrite = 1;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection delegate](self, "delegate"));
      [v7 courierConnection:self aboutToWriteDataOnConnectedInterface:a3];

      self->_informingOfWrite = 0;
    }
  }

- (int64_t)_interfaceForStream:(id)a3
{
  if (self->_streams[1] == a3) {
    return 1LL;
  }
  if (self->_streams[0] == a3) {
    return 0LL;
  }
  return 3LL;
}

- (int64_t)_interfaceForConnectionManager:(id)a3
{
  if (self->_connectionManagers[1] == a3) {
    return 1LL;
  }
  if (self->_connectionManagers[0] == a3) {
    return 0LL;
  }
  return 3LL;
}

- (void)incrementRedirectCount
{
}

- (void)clearRedirectCount
{
  self->_redirectCount = 0;
}

- (unsigned)redirectCount
{
  return self->_redirectCount;
}

- (id)usingCachedIPAddressOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    v3 = self->_usingCachedIPAddress[a3];
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

- (void)setUsingCachedIPAddress:(id)a3 onInterface:(int64_t)a4
{
  unsigned int v6 = (NSString *)a3;
  if (a4 >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003CEE4(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v12 = 138412802;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: asked to set setCachedIPAddress %@ on invalid interface %@",  (uint8_t *)&v12,  0x20u);
  }

  usingCachedIPAddress = self->_usingCachedIPAddress;
  if (usingCachedIPAddress[a4] != v6)
  {
    unint64_t v10 = (NSString *)-[NSString copy](v6, "copy");
    char v11 = usingCachedIPAddress[a4];
    usingCachedIPAddress[a4] = v10;
  }
}

- (BOOL)isConnectingOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_isConnecting[a3];
}

- (void)setIsConnecting:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  if (a4 < 2)
  {
    self->_isConnecting[a4] = a3;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    id v8 = sub_10003CEE4(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    char v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: asked to set isConnecting %@ on invalid interface %@",  (uint8_t *)&v10,  0x20u);
  }

- (void)setIsSuspended:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  if (a4 < 2)
  {
    -[APSTCPStream setIsSuspended:](self->_streams[a4], "setIsSuspended:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    id v8 = sub_10003CEE4(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    char v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: asked to set isSuspended %@ on invalid interface %@",  (uint8_t *)&v10,  0x20u);
  }

- (BOOL)isSuspendedOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[APSTCPStream isSuspended](self->_streams[a3], "isSuspended");
  }
  else {
    return 0;
  }
}

- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3
{
  if (self->_remainsConnectedWhenWWANSuspends != a3)
  {
    self->_remainsConnectedWhenWWANSuspends = a3;
    -[PCConnectionManager setAlwaysWantsInterfaceChangeCallbacks:]( self->_connectionManagers[0],  "setAlwaysWantsInterfaceChangeCallbacks:");
    -[PCConnectionManager setAlwaysWantsInterfaceChangeCallbacks:]( self->_connectionManagers[1],  "setAlwaysWantsInterfaceChangeCallbacks:",  self->_remainsConnectedWhenWWANSuspends);
  }

- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3
{
  if (self->_powerOptimizationsForExpensiveNetworkingDisabled != a3)
  {
    self->_powerOptimizationsForExpensiveNetworkingDisabled = a3;
    -[PCConnectionManager setPowerOptimizationsForExpensiveNetworkingDisabled:]( self->_connectionManagers[0],  "setPowerOptimizationsForExpensiveNetworkingDisabled:");
    -[PCConnectionManager setPowerOptimizationsForExpensiveNetworkingDisabled:]( self->_connectionManagers[1],  "setPowerOptimizationsForExpensiveNetworkingDisabled:",  self->_powerOptimizationsForExpensiveNetworkingDisabled);
  }

- (void)setWifiKeepAliveEarlyFireConstantInterval:(double)a3
{
  if (self->_wifiKeepAliveEarlyFireConstantInterval != a3)
  {
    self->_wifiKeepAliveEarlyFireConstantInterval = a3;
    -[PCConnectionManager setNonCellularEarlyFireConstantInterval:]( self->_connectionManagers[1],  "setNonCellularEarlyFireConstantInterval:");
  }

- (void)setKeepAliveConfiguration:(unint64_t)a3
{
  if (a3) {
    double v4 = 60.0;
  }
  else {
    double v4 = 300.0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    unsigned int v6 = "-[APSCourierConnection setKeepAliveConfiguration:]";
    __int16 v7 = 2048;
    double v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = 0x417E133800000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: interval %f timeout %f",  (uint8_t *)&v5,  0x20u);
  }

  -[PCConnectionManager setKeepAliveOverrideOnInterface:interval:timeout:]( self->_connectionManagers[1],  "setKeepAliveOverrideOnInterface:interval:timeout:",  0LL,  v4,  31536000.0);
}

- (id)connectionAttemptsInExpensiveConditions
{
  return self->_connectionAttemptsInExpensiveConditions;
}

- (void)setConnectionAttemptsInExpensiveConditions:(id)a3
{
  int v5 = (NSMutableArray *)a3;
  connectionAttemptsInExpensiveConditions = self->_connectionAttemptsInExpensiveConditions;
  p_connectionAttemptsInExpensiveConditions = &self->_connectionAttemptsInExpensiveConditions;
  if (connectionAttemptsInExpensiveConditions != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_connectionAttemptsInExpensiveConditions, a3);
    int v5 = v8;
  }
}

- (BOOL)shouldConnectOnInterface:(int64_t)a3
{
  int v5 = objc_autoreleasePoolPush();
  if (self->_powerOptimizationsForExpensiveNetworkingDisabled) {
    goto LABEL_19;
  }
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection redirectHost](self, "redirectHost"));
  if (!v6)
  {
    if (!-[APSCourierConnection isExpensiveToUseInterface:](self, "isExpensiveToUseInterface:", a3)) {
      goto LABEL_19;
    }
    if (!self->_connectionAttemptsInExpensiveConditions)
    {
      __int16 v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      connectionAttemptsInExpensiveConditions = self->_connectionAttemptsInExpensiveConditions;
      self->_connectionAttemptsInExpensiveConditions = v7;
    }

    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    if (-[NSMutableArray count](self->_connectionAttemptsInExpensiveConditions, "count"))
    {
      unint64_t v10 = 0LL;
      do
      {
        char v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_connectionAttemptsInExpensiveConditions,  "objectAtIndexedSubscript:",  v10));
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        if (v14 < 0.0 || v14 > self->_expensiveConditionsBackOffInterval) {
          [v9 addIndex:v10];
        }
        ++v10;
      }

      while ((unint64_t)-[NSMutableArray count](self->_connectionAttemptsInExpensiveConditions, "count") > v10);
    }

    -[NSMutableArray removeObjectsAtIndexes:]( self->_connectionAttemptsInExpensiveConditions,  "removeObjectsAtIndexes:",  v9);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    if ((unint64_t)-[NSMutableArray count](self->_connectionAttemptsInExpensiveConditions, "count") >= self->_maxExpensiveConditionsConnectionAttempts)
    {
      BOOL v20 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      id v22 = sub_10003CEE4(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      unint64_t maxExpensiveConditionsConnectionAttempts = self->_maxExpensiveConditionsConnectionAttempts;
      double expensiveConditionsBackOffInterval = self->_expensiveConditionsBackOffInterval;
      int v30 = 138413058;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v23;
      __int16 v34 = 2048;
      unint64_t v35 = maxExpensiveConditionsConnectionAttempts;
      __int16 v36 = 2048;
      double v37 = expensiveConditionsBackOffInterval;
      uint64_t v26 = "%@ Device is in bad cellular link quality and has exceeded max connection attempts allowed. Not attempting t"
            "o connect! {interface:%@, maxConnectionAttemptsAllowed:%lu, expensiveConditionsBackOffInterval:%f}";
    }

    else
    {
      if (!-[NSMutableArray count](self->_connectionAttemptsInExpensiveConditions, "count")
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_connectionAttemptsInExpensiveConditions, "lastObject")),
            [v16 timeIntervalSinceDate:v17],
            double v19 = v18,
            v17,
            v19 > (double)(uint64_t)llround( self->_expensiveConditionsBackOffInterval / (double)self->_maxExpensiveConditionsConnectionAttempts)))
      {
        -[NSMutableArray addObject:](self->_connectionAttemptsInExpensiveConditions, "addObject:", v16);
        BOOL v20 = 1;
LABEL_26:

        goto LABEL_20;
      }

      BOOL v20 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      id v27 = sub_10003CEE4(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v27);
      unint64_t v28 = self->_maxExpensiveConditionsConnectionAttempts;
      double v29 = self->_expensiveConditionsBackOffInterval;
      int v30 = 138413058;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v23;
      __int16 v34 = 2048;
      unint64_t v35 = v28;
      __int16 v36 = 2048;
      double v37 = v29;
      uint64_t v26 = "%@ Device is in bad cellular link quality and hasn't passed reconnect threshold. Not attempting to connect! "
            "{interface:%@, maxConnectionAttemptsAllowed:%lu, expensiveConditionsBackOffInterval:%f}";
    }

    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v26,  (uint8_t *)&v30,  0x2Au);

    BOOL v20 = 0;
    goto LABEL_26;
  }

LABEL_19:
  BOOL v20 = 1;
LABEL_20:
  objc_autoreleasePoolPop(v5);
  return v20;
}

- (void)connectToEnvironment:(id)a3 onInterface:(int64_t)a4 allowedInterfaceConstraint:(int64_t)a5 useAlternatePort:(BOOL)a6 keepAliveProxyMode:(unint64_t)a7
{
  BOOL v7 = a6;
  id v11 = a3;
  if (a4 < 2)
  {
    if (!self->_isDualChannelAllowed)
    {
      int64_t v14 = -[APSCourierConnection connectingInterface](self, "connectingInterface");
      if (v14 != 3)
      {
        unint64_t v15 = v14;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = sub_10003CEE4(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          int v30 = 138412546;
          v31 = self;
          __int16 v32 = 2112;
          v33 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ - INTEGRITY CHECK FAILED: closing the pending connection on %@",  (uint8_t *)&v30,  0x16u);
        }

        -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", v15);
        -[APSCourierConnectionDelegate courierConnection:disconnectStreamOnInterface:withReason:]( self->_delegate,  "courierConnection:disconnectStreamOnInterface:withReason:",  self,  v15,  1040LL);
      }
    }

    if (a4 == 1) {
      -[PCConnectionManager setEnableNonCellularConnections:]( self->_connectionManagers[1],  "setEnableNonCellularConnections:",  1LL);
    }
    streams = self->_streams;
    double v19 = self->_streams[a4];
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v20)
      {
        id v21 = sub_10003CEE4(a4);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = streams[a4];
        int v30 = 138412802;
        v31 = self;
        __int16 v32 = 2112;
        v33 = v22;
        __int16 v34 = 2112;
        unint64_t v35 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ request to connect with preference %@ but we already have a stream %@",  (uint8_t *)&v30,  0x20u);
      }
    }

    else
    {
      if (v20)
      {
        id v24 = sub_10003CEE4(a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        int v30 = 138412546;
        v31 = self;
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Opening stream on interface %@",  (uint8_t *)&v30,  0x16u);
      }

      self->_lastAttemptedInterface = a4;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[PCCarrierBundleHelper helper](&OBJC_CLASS___PCCarrierBundleHelper, "helper"));
      unsigned __int8 v27 = [v26 BOOLValueFromPushBundleForKey:APSForceKeepAliveV1Key error:0];

      if ((v27 & 1) == 0) {
        self->_keepAliveV2Supported[a4] = 1;
      }
      uint64_t v28 = objc_claimAutoreleasedReturnValue(-[APSCourierConnection TCPStreamWithEnvironment:](self, "TCPStreamWithEnvironment:", v11));
      double v29 = streams[a4];
      streams[a4] = (APSTCPStream *)v28;

      -[APSTCPStream setDelegate:](streams[a4], "setDelegate:", self);
      -[APSTCPStream setForceWWANInterface:](streams[a4], "setForceWWANInterface:", a4 == 0);
      -[APSTCPStream setUseAlternatePort:](streams[a4], "setUseAlternatePort:", v7);
      -[APSTCPStream setRedirectHostname:](streams[a4], "setRedirectHostname:", self->_redirectHost);
      -[APSTCPStream setCachedIPAddress:](streams[a4], "setCachedIPAddress:", self->_usingCachedIPAddress[a4]);
      -[APSTCPStream setRemainsConnectedWhenWWANSuspends:]( streams[a4],  "setRemainsConnectedWhenWWANSuspends:",  self->_remainsConnectedWhenWWANSuspends);
      -[APSTCPStream setAllowedInterfaceConstraint:](streams[a4], "setAllowedInterfaceConstraint:", a5);
      -[APSCourierConnection setIsConnecting:onInterface:](self, "setIsConnecting:onInterface:", 1LL, a4);
      -[APSTCPStream open](streams[a4], "open");
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = sub_10003CEE4(a4);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v30 = 138412546;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to connect with invalid interface %@",  (uint8_t *)&v30,  0x16u);
  }
}

- (Class)tcpStreamClass
{
  v3 = &off_10011C8A0;
  if ((_os_feature_enabled_impl("APS", "UseNWConnectionTCPStream") & 1) == 0
    && !_os_feature_enabled_impl("APS", "EmperorPenguin"))
  {
    v3 = &off_10011C8B0;
  }

  uint64_t v4 = objc_opt_class(*v3, v2);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)TCPStreamWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend( objc_alloc(-[APSCourierConnection tcpStreamClass](self, "tcpStreamClass")),  "initWithEnvironment:",  v4);

  return v5;
}

- (void)writeDataInBackground:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  if (a4 <= 1 && (BOOL v7 = self->_streams[a4]) != 0LL)
  {
    double v8 = v7;
    -[APSTCPStream writeDataInBackground:](v7, "writeDataInBackground:", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_10003CEE4(a4);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    int64_t v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Asked to write data but our stream for interface %@ is invalid",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)writeDataInBackground:(id)a3
{
  id v4 = a3;
  -[APSCourierConnection writeDataInBackground:onInterface:]( self,  "writeDataInBackground:onInterface:",  v4,  -[APSCourierConnection preferredInterface](self, "preferredInterface"));
}

- (void)closeStreamForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    v3 = (id *)&(&self->super.isa)[a3];
    [v3[2] close];
    [v3[2] setDelegate:0];
    id v4 = v3[2];
    v3[2] = 0LL;

    id v5 = v3[4];
    v3[4] = 0LL;
  }

- (void)stopManagers
{
}

- (void)stopManagerOnInterface:(int64_t)a3
{
  if (a3 == 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      double v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to stopManager on None, stopping on all interfaces.",  (uint8_t *)&v7,  0xCu);
    }

    -[PCConnectionManager stopManager](self->_connectionManagers[0], "stopManager");
    -[PCConnectionManager stopManager](self->_connectionManagers[1], "stopManager");
  }

  else if (a3 < 2)
  {
    -[PCConnectionManager stopManager](self->_connectionManagers[a3], "stopManager");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = 138412546;
    double v8 = self;
    __int16 v9 = 2112;
    unint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to stopManager with invalid interface %@",  (uint8_t *)&v7,  0x16u);
  }

- (void)stopAndResetManagerOnInterface:(int64_t)a3
{
  if (a3 == 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      double v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to stopAndResetManager on None, stopping on all interfaces.",  (uint8_t *)&v7,  0xCu);
    }

    -[PCConnectionManager stopAndResetManager](self->_connectionManagers[0], "stopAndResetManager");
    -[PCConnectionManager stopAndResetManager](self->_connectionManagers[1], "stopAndResetManager");
  }

  else if (a3 < 2)
  {
    -[PCConnectionManager stopAndResetManager](self->_connectionManagers[a3], "stopAndResetManager");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = 138412546;
    double v8 = self;
    __int16 v9 = 2112;
    unint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to stopAndResetManager with invalid interface %@",  (uint8_t *)&v7,  0x16u);
  }

- (id)pcInterfaceMonitorWWAN
{
  return -[APSCourierConnection pcInterfaceMonitorOnInterface:](self, "pcInterfaceMonitorOnInterface:", 0LL);
}

- (id)pcInterfaceMonitorNonCellular
{
  return -[APSCourierConnection pcInterfaceMonitorOnInterface:](self, "pcInterfaceMonitorOnInterface:", 1LL);
}

- (id)pcInterfaceMonitorOnInterface:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return 0LL;
    }
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  v5,  v3,  v4));
}

- (BOOL)isExpensiveToUseInterface:(int64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection pcInterfaceMonitorOnInterface:](self, "pcInterfaceMonitorOnInterface:", a3));
  unsigned __int8 v4 = [v3 isNetworkingPowerExpensiveToUse];

  return v4;
}

- (void)resumeManagerWithAction:(int)a3 onInterface:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a4 < 2)
  {
    if (-[APSTCPStream isConnected](self->_streams[a4], "isConnected")) {
      -[PCConnectionManager setCurrentAddressFamily:]( self->_connectionManagers[a4],  "setCurrentAddressFamily:",  -[APSTCPStream ipAddressFamily](self->_streams[a4], "ipAddressFamily") != 2);
    }
    unsigned int v9 = -[APSCourierConnection keepAliveV2SupportedOnInterface:](self, "keepAliveV2SupportedOnInterface:", a4);
    unint64_t v10 = self->_connectionManagers[a4];
    if (v9) {
      -[PCConnectionManager resumeManagerWithAction:forceGrow:](v10, "resumeManagerWithAction:forceGrow:", v5);
    }
    else {
      -[PCConnectionManager resumeManagerWithAction:](v10, "resumeManagerWithAction:", v5);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003CEE4(a4);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v11 = 138412802;
    id v12 = self;
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to resumeManager with action %d with invalid interface %@",  (uint8_t *)&v11,  0x1Cu);
  }

- (void)setServerStatsMaxKeepAlive:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    -[PCConnectionManager setServerStatsMaxKeepAliveInterval:]( self->_connectionManagers[a4],  "setServerStatsMaxKeepAliveInterval:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003CEE4(a4);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138412802;
    unint64_t v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to set server stats max keep alive interval with interval %f with invalid interface %@",  (uint8_t *)&v9,  0x20u);
  }

- (void)setServerStatsMinKeepAlive:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    -[PCConnectionManager setServerStatsMinKeepAliveInterval:]( self->_connectionManagers[a4],  "setServerStatsMinKeepAliveInterval:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003CEE4(a4);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138412802;
    unint64_t v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to set server stats min keep alive interval with interval %f with invalid interface %@",  (uint8_t *)&v9,  0x20u);
  }

- (void)setServerStatsExpectedKeepAlive:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    -[PCConnectionManager setServerStatsExpectedKeepAliveInterval:]( self->_connectionManagers[a4],  "setServerStatsExpectedKeepAliveInterval:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003CEE4(a4);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138412802;
    unint64_t v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to set server stats expected keep alive interval with interval %f with invalid interface %@",  (uint8_t *)&v9,  0x20u);
  }

- (void)setUsingServerStatsAggressively:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  if (a4 < 2)
  {
    -[PCConnectionManager setUsingServerStatsAggressively:]( self->_connectionManagers[a4],  "setUsingServerStatsAggressively:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    id v8 = sub_10003CEE4(a4);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    __int16 v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to set using server stats aggressively %@ with invalid interface %@",  (uint8_t *)&v10,  0x20u);
  }

- (double)keepAliveGracePeriodOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    -[PCConnectionManager keepAliveGracePeriod](self->_connectionManagers[a3], "keepAliveGracePeriod");
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = sub_10003CEE4(a3);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      int v8 = 138412546;
      int v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get GracePeriod with invalid interface %@",  (uint8_t *)&v8,  0x16u);
    }

    return 0.0;
  }

  return result;
}

- (void)setKeepAliveGracePeriod:(double)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    -[PCConnectionManager setKeepAliveGracePeriod:](self->_connectionManagers[a4], "setKeepAliveGracePeriod:");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_10003CEE4(a4);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138412802;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to setManager with GracePeriod:%f with invalid interface %@",  (uint8_t *)&v9,  0x20u);
  }

- (BOOL)minimumIntervalFallbackEnabledOnInterface:(int64_t)a3
{
  return -[PCConnectionManager minimumIntervalFallbackEnabled]( self->_connectionManagers[a3],  "minimumIntervalFallbackEnabled");
}

- (void)setMinimumIntervalFallbackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PCConnectionManager setMinimumIntervalFallbackEnabled:]( self->_connectionManagers[0],  "setMinimumIntervalFallbackEnabled:");
  -[PCConnectionManager setMinimumIntervalFallbackEnabled:]( self->_connectionManagers[1],  "setMinimumIntervalFallbackEnabled:",  v3);
}

- (void)setEnableNonCellularOnConnectionManager:(BOOL)a3
{
}

- (void)updateConnectionManagerKeepAliveIntervalOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    if (a3) {
      -[APSCourierConnection _updateConnectionManagerKeepAliveIntervalNonCellular]( self,  "_updateConnectionManagerKeepAliveIntervalNonCellular");
    }
    else {
      -[APSCourierConnection _updateConnectionManagerKeepAliveIntervalWWAN]( self,  "_updateConnectionManagerKeepAliveIntervalWWAN");
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = 138412546;
    int v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to update keepAliveInterval with invalid interface %@",  (uint8_t *)&v7,  0x16u);
  }

- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4
{
  if (a4 < 2)
  {
    self->_keepAliveV2Supported[a4] = a3;
    if (!a3) {
      -[APSCourierConnection setKeepAliveGracePeriod:onInterface:]( self,  "setKeepAliveGracePeriod:onInterface:",  a4,  0.0);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10003CEE4(a4);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to change keepAliveV2Supported with invalid interface %@",  (uint8_t *)&v8,  0x16u);
  }

- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_keepAliveV2Supported[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get keepAliveV2Supported with invalid interface %@",  (uint8_t *)&v8,  0x16u);
  }

  return 1;
}

- (int)lastKeepAliveActionOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return -[PCConnectionManager lastProcessedAction]( self->_connectionManagers[a3],  "lastProcessedAction");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get lastKeepAliveAction with invalid interface %@",  (uint8_t *)&v8,  0x16u);
  }

  return 0;
}

- (void)__updateConnectionManagerKeepAliveIntervalWWAN
{
}

- (void)_updateConnectionManagerKeepAliveIntervalWWAN
{
}

- (void)__updateConnectionManagerKeepAliveIntervalNonCellular
{
}

- (void)_updateConnectionManagerKeepAliveIntervalNonCellular
{
}

- (BOOL)hasConnectionEstablishTimer
{
  return self->_connectionEstablishTimers[0] || self->_connectionEstablishTimers[1] != 0LL;
}

- (BOOL)hasConnectionEstablishTimerOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_connectionEstablishTimers[a3] != 0LL;
}

- (void)startConnectionEstablishTimerOnInterface:(int64_t)a3
{
  id v5 = objc_autoreleasePoolPush();
  if (a3 <= 1)
  {
    -[APSCourierConnection clearConnectionEstablishTimerOnInterface:]( self,  "clearConnectionEstablishTimerOnInterface:",  a3);
    uint64_t v6 = APSBundleIdentifier;
    domain = self->_domain;
    id v8 = sub_10003CEE4(a3);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-connectionestablish-%@-%@",  v6,  domain,  v9));

    __int16 v11 = -[APSPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:holdDuration:",  v10,  213LL,  40.0);
    double v12 = &(&self->super.isa)[a3];
    Class v13 = v12[22];
    v12[22] = (Class)v11;

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_connectionEstablishTimerFired:",  0LL,  0LL,  30.0));
    Class v15 = v12[20];
    v12[20] = (Class)v14;
  }

  objc_autoreleasePoolPop(v5);
}

- (void)clearConnectionEstablishTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    connectionEstablishTimers = self->_connectionEstablishTimers;
    uint64_t v6 = self->_connectionEstablishTimers[a3];
    if (v6)
    {
      -[NSTimer invalidate](v6, "invalidate");
      int v7 = connectionEstablishTimers[a3];
      connectionEstablishTimers[a3] = 0LL;
    }

    id v8 = self->_connectionEstablishPowerAssertions[a3];
    if (v8)
    {
      self->_connectionEstablishPowerAssertions[a3] = 0LL;
    }
  }

- (void)_connectionEstablishTimerFired:(id)a3
{
  unsigned __int8 v4 = (NSTimer *)a3;
  id v5 = v4;
  uint64_t v6 = 3LL;
  if (self->_connectionEstablishTimers[0] == v4) {
    uint64_t v6 = 0LL;
  }
  if (self->_connectionEstablishTimers[1] == v4) {
    unint64_t v7 = 1LL;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v7 <= 1)
  {
    __int16 v9 = v4;
    -[APSCourierConnection clearConnectionEstablishTimerOnInterface:]( self,  "clearConnectionEstablishTimerOnInterface:",  v7);
    char v8 = objc_opt_respondsToSelector(self->_delegate, "courierConnection:connectionEstablishTimerFiredOnInterface:");
    id v5 = v9;
    if ((v8 & 1) != 0)
    {
      -[APSCourierConnectionDelegate courierConnection:connectionEstablishTimerFiredOnInterface:]( self->_delegate,  "courierConnection:connectionEstablishTimerFiredOnInterface:",  self,  v7);
      id v5 = v9;
    }
  }
}

- (BOOL)hasKeepAliveResponseTimerOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_keepAliveTimers[a3] != 0LL;
}

- (void)startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = objc_autoreleasePoolPush();
  if (a3 <= 1)
  {
    -[APSCourierConnection clearKeepAliveResponseTimerOnInterface:](self, "clearKeepAliveResponseTimerOnInterface:", a3);
    uint64_t v8 = APSBundleIdentifier;
    domain = self->_domain;
    id v10 = sub_10003CEE4(a3);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-keepalive-%@-%@",  v8,  domain,  v11));

    Class v13 = -[APSPowerAssertion_NoHold initWithName:category:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:",  v12,  215LL);
    uint64_t v14 = &(&self->super.isa)[a3];
    Class v15 = v14[18];
    v14[18] = (Class)v13;

    double v16 = 20.0;
    if (v4) {
      double v16 = 5.0;
    }
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_keepAliveResponseTimerFired:",  0LL,  0LL,  v16));
    Class v18 = v14[12];
    v14[12] = (Class)v17;
  }

  objc_autoreleasePoolPop(v7);
}

- (void)clearKeepAliveResponseTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    keepAliveTimers = self->_keepAliveTimers;
    uint64_t v6 = self->_keepAliveTimers[a3];
    if (v6)
    {
      -[NSTimer invalidate](v6, "invalidate");
      unint64_t v7 = keepAliveTimers[a3];
      keepAliveTimers[a3] = 0LL;
    }

    uint64_t v8 = self->_keepAlivePowerAssertions[a3];
    if (v8)
    {
      self->_keepAlivePowerAssertions[a3] = 0LL;
    }
  }

- (void)_keepAliveResponseTimerFired:(id)a3
{
  BOOL v4 = (NSTimer *)a3;
  id v5 = v4;
  uint64_t v6 = 3LL;
  if (self->_keepAliveTimers[0] == v4) {
    uint64_t v6 = 0LL;
  }
  if (self->_keepAliveTimers[1] == v4) {
    unint64_t v7 = 1LL;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v7 <= 1)
  {
    __int16 v9 = v4;
    -[APSCourierConnection clearKeepAliveResponseTimerOnInterface:](self, "clearKeepAliveResponseTimerOnInterface:", v7);
    char v8 = objc_opt_respondsToSelector(self->_delegate, "courierConnection:keepAliveResponseTimerFiredOnInterface:");
    id v5 = v9;
    if ((v8 & 1) != 0)
    {
      -[APSCourierConnectionDelegate courierConnection:keepAliveResponseTimerFiredOnInterface:]( self->_delegate,  "courierConnection:keepAliveResponseTimerFiredOnInterface:",  self,  v7);
      id v5 = v9;
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4 onInterface:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  if (v8 && a5 <= 1)
  {
    contexts = self->_contexts;
    id v10 = contexts[a5];
    if (v14)
    {
      if (!v10)
      {
        __int16 v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
        double v12 = contexts[a5];
        contexts[a5] = v11;

        id v10 = contexts[a5];
      }

      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, v8);
    }

    else
    {
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v8);
      if (!-[NSMutableDictionary count](contexts[a5], "count"))
      {
        Class v13 = contexts[a5];
        contexts[a5] = 0LL;
      }
    }
  }
}

- (id)objectForKey:(id)a3 onInterface:(int64_t)a4
{
  if (a4 <= 1) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_contexts[a4], "objectForKey:", a3, v4, v5));
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v6;
}

- (APSCourierConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  uint64_t v5 = (APSCourierConnectionDelegate *)a3;
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  if (delegate != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_delegate, a3);
    uint64_t v5 = v8;
  }
}

- (id)_currentStream
{
  uint64_t v3 = -[APSCourierConnection preferredInterface](self, "preferredInterface");
  if (v3 <= 1) {
    uint64_t v4 = self->_streams[v3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4;
}

- (id)serverAddressForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream serverIPAddress](self->_streams[a3], "serverIPAddress", v3, v4));
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v5;
}

- (id)serverPortForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    uint64_t v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[APSTCPStream serverPort](self->_streams[a3], "serverPort")));
  }
  else {
    uint64_t v3 = &off_10012B6C8;
  }
  return v3;
}

- (NSString)tcpInfoDescription
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection _currentStream](self, "_currentStream"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tcpInfoDescription]);

  return (NSString *)v3;
}

- (id)tcpInfoDescriptionForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream tcpInfoDescription](self->_streams[a3], "tcpInfoDescription", v3, v4));
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v5;
}

- (int64_t)nextConnectionAttemptInterface
{
  if (-[APSTCPStream isConnected](self->_streams[1], "isConnected")) {
    return 0LL;
  }
  if (-[APSTCPStream isConnected](self->_streams[0], "isConnected")) {
    return 1LL;
  }
  if (self->_streams[1]) {
    return 0LL;
  }
  if (self->_streams[0]) {
    return 1LL;
  }
  int64_t lastAttemptedInterface = self->_lastAttemptedInterface;
  int64_t v5 = 3LL;
  if (!lastAttemptedInterface) {
    int64_t v5 = 1LL;
  }
  if (lastAttemptedInterface == 1) {
    return 0LL;
  }
  else {
    return v5;
  }
}

- (int64_t)preferredInterface
{
  if (-[APSTCPStream isConnected](self->_streams[1], "isConnected")) {
    return 1LL;
  }
  if (-[APSTCPStream isConnected](self->_streams[0], "isConnected")) {
    return 0LL;
  }
  return 3LL;
}

- (int64_t)connectingInterface
{
  uint64_t v2 = 0LL;
  streams = self->_streams;
  int v4 = 1;
  int64_t v5 = 3LL;
  do
  {
    while (1)
    {
      int v6 = v4;
      unint64_t v7 = streams[v2];
      if (v7) {
        break;
      }
      int v4 = 0;
      uint64_t v2 = 1LL;
      if ((v6 & 1) == 0) {
        return v5;
      }
    }

    int64_t v8 = v2;
    unsigned int v9 = -[APSTCPStream isConnected](v7, "isConnected");
    int v4 = 0;
    uint64_t v2 = 1LL;
  }

  while ((v9 & v6 & 1) != 0);
  if (v9) {
    return 3LL;
  }
  else {
    return v8;
  }
}

- (int64_t)lastAttemptedInterface
{
  return self->_lastAttemptedInterface;
}

- (id)serverIPAddressForInterface:(int64_t)a3
{
  if (a3 <= 1 && (int64_t v5 = self->_streams[a3]) != 0LL)
  {
    int v6 = v5;
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream serverIPAddress](v5, "serverIPAddress"));

    return v7;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = sub_10003CEE4(a3);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      double v12 = self;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: asked for serverIPAddress but we have no current stream for interface %@",  (uint8_t *)&v11,  0x16u);
    }

    return 0LL;
  }

- (id)serverHostnameForInterface:(int64_t)a3
{
  if (a3 <= 1 && (int64_t v5 = self->_streams[a3]) != 0LL)
  {
    int v6 = v5;
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream serverHostname](v5, "serverHostname"));

    return v7;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = sub_10003CEE4(a3);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      double v12 = self;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: asked for serverHostname but we have no current stream for interface %@",  (uint8_t *)&v11,  0x16u);
    }

    return 0LL;
  }

- (id)interfaceNameForInterface:(int64_t)a3
{
  if (a3 <= 1 && (int64_t v5 = self->_streams[a3]) != 0LL)
  {
    int v6 = v5;
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream interfaceName](v5, "interfaceName"));

    return v7;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = sub_10003CEE4(a3);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      double v12 = self;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: asked for interfaceName but we have no current stream for interface %@",  (uint8_t *)&v11,  0x16u);
    }

    return 0LL;
  }

- (int)nwInterfaceTypeForInterface:(int64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection interfaceNameForInterface:](self, "interfaceNameForInterface:", a3));
  int v4 = v3;
  if (v3)
  {
    int64_t v5 = (nw_interface *)nw_interface_create_with_name([v3 UTF8String]);
    nw_interface_type_t type = nw_interface_get_type(v5);
  }

  else
  {
    nw_interface_type_t type = nw_interface_type_other;
  }

  return type;
}

- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4
{
  return -[APSCourierConnection setIsConnected:onInterface:withDisconnectReason:]( self,  "setIsConnected:onInterface:withDisconnectReason:",  a3,  a4,  1010LL);
}

- (BOOL)setIsConnected:(BOOL)a3 onInterface:(int64_t)a4 withDisconnectReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v7 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_10003CEE4(a4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138413058;
    uint64_t v28 = self;
    __int16 v29 = 1024;
    *(_DWORD *)int v30 = v7;
    *(_WORD *)&v30[4] = 2112;
    *(void *)&v30[6] = v10;
    *(_WORD *)&v30[14] = 1024;
    *(_DWORD *)&v30[16] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Setting is connected %d on interface %@ with reason %u",  buf,  0x22u);
  }

  if (a4 < 2)
  {
    if (!self->_isDualChannelAllowed
      && v7
      && -[APSCourierConnection countConnectedInterfaces](self, "countConnectedInterfaces") >= 2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ - INTEGRITY CHECK FAILED: closing the old connections",  buf,  0xCu);
      }

      unint64_t v16 = 0LL;
      char v17 = 1;
      *(void *)&__int128 v15 = 138412546LL;
      __int128 v26 = v15;
      do
      {
        char v18 = v17;
        if (-[APSTCPStream isConnected](self->_streams[v16], "isConnected", v26))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = sub_10003CEE4(v16);
            BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            *(_DWORD *)buf = v26;
            uint64_t v28 = self;
            __int16 v29 = 2112;
            *(void *)int v30 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ closing old connection on %@",  buf,  0x16u);
          }

          -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", v16);
          -[APSCourierConnectionDelegate courierConnection:disconnectStreamOnInterface:withReason:]( self->_delegate,  "courierConnection:disconnectStreamOnInterface:withReason:",  self,  v16,  5LL);
        }

        char v17 = 0;
        unint64_t v16 = 1LL;
      }

      while ((v18 & 1) != 0);
    }

    id v21 = self->_streams[a4];
    unsigned __int8 v11 = -[APSTCPStream isConnected](v21, "isConnected");
    if (v21)
    {
      -[APSTCPStream setIsConnected:](v21, "setIsConnected:", v7);
    }

    else if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = sub_10003CEE4(a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = self;
        __int16 v29 = 2112;
        *(void *)int v30 = @"YES";
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Uh oh! Asked to set isConnected %@ on interface %@ but we have no stream for that interface!",  buf,  0x20u);
      }

      goto LABEL_32;
    }

    if (a4 == 1 && !v7) {
      -[PCConnectionManager setEnableNonCellularConnections:]( self->_connectionManagers[1],  "setEnableNonCellularConnections:",  0LL);
    }
    if (!v7)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[APSCourierConnection setLastConnected:](self, "setLastConnected:", v24);
    }

- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4
{
  return -[APSTCPStream generation](self->_streams[a4], "generation") == a3;
}

- (BOOL)isConnected
{
  uint64_t v2 = 0LL;
  streams = self->_streams;
  char v4 = 1;
  do
  {
    unsigned int v5 = -[APSTCPStream isConnected](streams[v2], "isConnected");
    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v2 = 1LL;
  }

  while (!v5);
  return v5;
}

- (BOOL)isConnectedOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[APSTCPStream isConnected](self->_streams[a3], "isConnected");
  }
  else {
    return 0;
  }
}

- (unint64_t)countConnectedInterfaces
{
  uint64_t v2 = 0LL;
  unint64_t v3 = 0LL;
  streams = self->_streams;
  char v5 = 1;
  do
  {
    char v6 = v5;
    unsigned int v7 = -[APSTCPStream isConnected](streams[v2], "isConnected");
    char v5 = 0;
    v3 += v7;
    uint64_t v2 = 1LL;
  }

  while ((v6 & 1) != 0);
  return v3;
}

- (unint64_t)countOpenConnections
{
  uint64_t v3 = 0LL;
  unint64_t v4 = 0LL;
  char v5 = 1;
  do
  {
    char v6 = v5;
    unsigned int v7 = -[APSCourierConnection hasOpenConnectionOnInterface:](self, "hasOpenConnectionOnInterface:", v3);
    char v5 = 0;
    v4 += v7;
    uint64_t v3 = 1LL;
  }

  while ((v6 & 1) != 0);
  return v4;
}

- (BOOL)hasOpenConnection
{
  return self->_streams[0] || self->_streams[1] != 0LL;
}

- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3
{
  return a3 <= 1 && self->_streams[a3] != 0LL;
}

- (BOOL)isKeepAliveProxySupportedOnSocketOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[APSTCPStream isKeepAliveProxySupportedOnSocketInterface]( self->_streams[a3],  "isKeepAliveProxySupportedOnSocketInterface");
  }
  else {
    return 0;
  }
}

- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[APSTCPStream isKeepAliveProxyConfigured](self->_streams[a3], "isKeepAliveProxyConfigured");
  }
  else {
    return 0;
  }
}

- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface
{
  uint64_t v2 = 0LL;
  streams = self->_streams;
  char v4 = 1;
  do
  {
    unsigned int v5 = -[APSTCPStream isKeepAliveProxyConfigured](streams[v2], "isKeepAliveProxyConfigured");
    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v2 = 1LL;
  }

  while (!v5);
  return v5;
}

- (NSString)ifname
{
  uint64_t v3 = -[APSCourierConnection preferredInterface](self, "preferredInterface");
  if (v3 > 1) {
    char v4 = 0LL;
  }
  else {
    char v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSTCPStream ifname](self->_streams[v3], "ifname"));
  }
  return (NSString *)v4;
}

- (double)minimumKeepAliveInterval
{
  uint64_t v3 = -[APSCourierConnection preferredInterface](self, "preferredInterface");
  connectionManagers = self->_connectionManagers;
  if (v3 < 2) {
    connectionManagers = &self->_connectionManagers[v3];
  }
  -[PCConnectionManager minimumKeepAliveInterval](*connectionManagers, "minimumKeepAliveInterval");
  return result;
}

- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3
{
  connectionManagers = self->_connectionManagers;
  if (a3 <= 1) {
    connectionManagers = &self->_connectionManagers[a3];
  }
  -[PCConnectionManager currentKeepAliveInterval](*connectionManagers, "currentKeepAliveInterval");
  return result;
}

- (id)currentKeepAliveStateOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return (id)objc_claimAutoreleasedReturnValue( -[PCConnectionManager currentKeepAliveState]( self->_connectionManagers[a3],  "currentKeepAliveState"));
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown interface, not reporting a keep alive state.",  v4,  2u);
  }

  return 0LL;
}

- (int)currentGrowthStageOnInterface:(int64_t)a3
{
  connectionManagers = self->_connectionManagers;
  if (a3 <= 1) {
    connectionManagers = &self->_connectionManagers[a3];
  }
  return -[PCConnectionManager currentGrowthStage](*connectionManagers, "currentGrowthStage");
}

- (BOOL)shouldClientScheduleReconnectDueToFailureOnInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[PCConnectionManager shouldClientScheduleReconnectDueToFailure]( self->_connectionManagers[a3],  "shouldClientScheduleReconnectDueToFailure");
  }
  else {
    return 0;
  }
}

- (unint64_t)countOfGrowthActionsOnInterface:(int64_t)a3
{
  connectionManagers = self->_connectionManagers;
  if (a3 <= 1) {
    connectionManagers = &self->_connectionManagers[a3];
  }
  return (unint64_t)-[PCConnectionManager countOfGrowthActions](*connectionManagers, "countOfGrowthActions");
}

- (void)_handleDualModeState
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = @"YES";
    if (!self->_isDualChannelAllowed) {
      uint64_t v3 = @"NO";
    }
    int v6 = 138412546;
    unsigned int v7 = self;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: handleDualModeState isDualChannelAllowed %@",  (uint8_t *)&v6,  0x16u);
  }

  if (!-[APSCourierConnection isDualChannelAllowed](self, "isDualChannelAllowed"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      unsigned int v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ dual channel is no longer allowed",  (uint8_t *)&v6,  0xCu);
    }

    if (-[APSTCPStream isConnected](self->_streams[0], "isConnected"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ WWAN is connected; to be consistent, closing the non-cellular connection",
          (uint8_t *)&v6,
          0xCu);
      }

      -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", 1LL);
      -[APSCourierConnectionDelegate courierConnection:disconnectStreamOnInterface:withReason:]( self->_delegate,  "courierConnection:disconnectStreamOnInterface:withReason:",  self,  1LL,  5LL);
    }

    if (-[APSTCPStream isConnected](self->_streams[1], "isConnected"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ NonCellular is connected; to be consistent, closing the wwan connection",
          (uint8_t *)&v6,
          0xCu);
      }

      -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", 0LL);
      -[APSCourierConnectionDelegate courierConnection:disconnectStreamOnInterface:withReason:]( self->_delegate,  "courierConnection:disconnectStreamOnInterface:withReason:",  self,  0LL,  5LL);
    }

    char v4 = self->_streams[0];
    if (v4)
    {
      if (!-[APSTCPStream isConnected](v4, "isConnected")
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ WWAN is connecting; to be consistent, closing the non-cellular connection",
          (uint8_t *)&v6,
          0xCu);
      }

      -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", 1LL);
      -[APSCourierConnectionDelegate courierConnection:disconnectStreamOnInterface:withReason:]( self->_delegate,  "courierConnection:disconnectStreamOnInterface:withReason:",  self,  1LL,  5LL);
    }

    unsigned int v5 = self->_streams[1];
    if (v5)
    {
      if (!-[APSTCPStream isConnected](v5, "isConnected")
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ NonCellular is connecting; to be consistent, closing the wwan connection",
          (uint8_t *)&v6,
          0xCu);
      }

      -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", 0LL);
      -[APSCourierConnectionDelegate courierConnection:disconnectStreamOnInterface:withReason:]( self->_delegate,  "courierConnection:disconnectStreamOnInterface:withReason:",  self,  0LL,  5LL);
    }

    if (-[PCConnectionManager isRunning](self->_connectionManagers[0], "isRunning"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ WWAN's connection manager is running. To be consistent, stopping WiFi's manager",  (uint8_t *)&v6,  0xCu);
      }

      -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", 1LL);
    }

    if (-[PCConnectionManager isRunning](self->_connectionManagers[1], "isRunning"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        unsigned int v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ WiFi's connection manager is running. To be consistent, stopping WWAN's manager",  (uint8_t *)&v6,  0xCu);
      }

      -[APSCourierConnection stopAndResetManagerOnInterface:](self, "stopAndResetManagerOnInterface:", 0LL);
    }
  }

- (void)setIsDualChannelAllowed:(BOOL)a3
{
  if (self->_isDualChannelAllowed != a3) {
    self->_isDualChannelAllowed = a3;
  }
  -[APSCourierConnection _handleDualModeState](self, "_handleDualModeState");
}

- (BOOL)isDualChannelAllowed
{
  return self->_isDualChannelAllowed;
}

- (BOOL)didPushCauseWake
{
  uint64_t v2 = 0LL;
  streams = self->_streams;
  int v4 = 1;
  do
  {
    while (1)
    {
      int v5 = v4;
      if ((objc_opt_respondsToSelector(streams[v2], "didPushCauseWake") & 1) != 0) {
        break;
      }
      int v4 = 0;
      BOOL result = 0;
      uint64_t v2 = 1LL;
      if ((v5 & 1) == 0) {
        return result;
      }
    }

    BOOL result = -[APSTCPStream didPushCauseWake](streams[v2], "didPushCauseWake");
    if (result) {
      break;
    }
    int v4 = 0;
    uint64_t v2 = 1LL;
  }

  while (((v5 ^ 1) & 1) == 0);
  return result;
}

- (BOOL)didPushCauseWakeOnInterface:(int64_t)a3
{
  if (a3 > 1) {
    return 0;
  }
  streams = self->_streams;
  return (objc_opt_respondsToSelector(self->_streams[a3], "didPushCauseWake") & 1) != 0
      && -[APSTCPStream didPushCauseWake](streams[a3], "didPushCauseWake");
}

- (int64_t)interfaceConstraintForInterface:(int64_t)a3
{
  if (a3 <= 1 && (uint64_t v3 = self->_streams[a3]) != 0LL) {
    return -[APSTCPStream interfaceConstraint](v3, "interfaceConstraint");
  }
  else {
    return 0LL;
  }
}

- (void)holdPowerAssertionUntilStreamsQuiesce
{
  uint64_t v2 = 0LL;
  streams = self->_streams;
  char v4 = 1;
  do
  {
    char v5 = v4;
    if ((objc_opt_respondsToSelector(streams[v2], "holdPowerAssertionUntilStreamQuiesces") & 1) != 0) {
      -[APSTCPStream holdPowerAssertionUntilStreamQuiesces](streams[v2], "holdPowerAssertionUntilStreamQuiesces");
    }
    char v4 = 0;
    uint64_t v2 = 1LL;
  }

  while ((v5 & 1) != 0);
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 onInterface:(int64_t)a13
{
  id v17 = a11;
  id v18 = a10;
  id v27 = a9;
  id v19 = a8;
  id v26 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a13);
  BOOL v20 = self->_parsers[a13];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection streamForInterface:](self, "streamForInterface:", a6));
  id v22 = [v21 interfaceConstraint];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection lastConnected](self, "lastConnected"));
  LODWORD(v25) = -[APSCourierConnection disconnectReason](self, "disconnectReason");
  LOBYTE(v24) = a12;
  id v31 = -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:redirectCount:lastConnected:disconnectReason:]( v20,  "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certific ates:nonce:signature:redirectCount:lastConnected:disconnectReason:",  v26,  a4,  a5,  a6,  v22,  a7,  v19,  v27,  v18,  v17,  v24,  v23,  v25);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v31, a13);
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 onInterface:(int64_t)a12
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a12);
  v23 = self->_parsers[a12];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection lastConnected](self, "lastConnected"));
  LODWORD(v26) = -[APSCourierConnection disconnectReason](self, "disconnectReason");
  LOBYTE(v25) = a11;
  id v29 = -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:lastConnected:disconnectReason:]( v23,  "copyConnectMessageWithToken:state:presenceFlags:metadata:certificates:nonce:signature:hostCertificateInfo:redi rectCount:lastConnected:disconnectReason:",  v22,  a4,  a5,  v21,  v20,  v19,  v18,  v17,  v25,  v24,  v26);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v29, a12);
}

- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 onInterface:(int64_t)a17
{
  id v24 = a16;
  id v25 = a11;
  id v26 = a10;
  id v49 = a9;
  id v27 = a8;
  id v28 = a7;
  id v29 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a17);
  int v30 = &(&self->super.isa)[a17];
  v51 = v28;
  if (v30[15])
  {
    unsigned int v31 = a6;
    v42 = v24;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = sub_10003CEE4(a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138412546;
      v54 = self;
      __int16 v55 = 2112;
      v56 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ copy presence message with APSProtocolSerialPresenceFlagEnableCachedIP on interface %@",  buf,  0x16u);
    }

    __int16 v34 = self->_parsers[a17];
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection streamForInterface:](self, "streamForInterface:", a4));
    id v35 = [v41 interfaceConstraint];
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection lastConnected](self, "lastConnected"));
    LODWORD(v40) = -[APSCourierConnection disconnectReason](self, "disconnectReason");
    LOBYTE(v39) = a12;
    id v36 = -[APSProtocolParser copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:]( v34,  "copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates :nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:t lsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:",  v29,  a4,  v35,  v31 | 0x100,  a5,  v51,  a13,  a14,  a15,  v27,  v49,  v26,  v25,  v39,  v42,  v48,  v40);

    double v37 = v41;
  }

  else
  {
    Class v44 = v30[4];
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection streamForInterface:](self, "streamForInterface:", a4));
    id v43 = [v46 interfaceConstraint];
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection lastConnected](self, "lastConnected"));
    LODWORD(v40) = -[APSCourierConnection disconnectReason](self, "disconnectReason");
    v38 = v24;
    LOBYTE(v39) = a12;
    id v36 = -[objc_class copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:]( v44,  "copyConnectMessageWithToken:interface:interfaceConstraint:presenceFlags:activeInterval:metadata:certificates :nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:t lsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:",  v29,  a4,  v43,  a6,  a5,  v51,  a13,  a14,  a15,  v27,  v49,  v26,  v25,  v39,  v24,  v45,  v40);

    double v37 = v46;
  }

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v36, a17);
  -[APSCourierConnection setDisconnectReason:](self, "setDisconnectReason:", 0LL);
}

- (void)sendFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4 onInterface:(int64_t)a5
{
  id v9 = -[APSProtocolParser copyFlushMessageWithWantPaddingLength:paddingLength:]( self->_parsers[a5],  "copyFlushMessageWithWantPaddingLength:paddingLength:",  a3,  a4);
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v9, a5);
}

- (void)sendFlushResponseMessageWithPaddingLength:(unint64_t)a3 onInterface:(int64_t)a4
{
  id v7 = -[APSProtocolParser copyFlushResponseMessageWithPaddingLength:]( self->_parsers[a4],  "copyFlushResponseMessageWithPaddingLength:",  a3);
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v7, a4);
}

- (void)sendSetActiveIntervalMessageWithInterval:(unsigned int)a3 onInterface:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a4);
  id v7 = -[APSProtocolParser copySetActiveIntervalMessageWithInterval:]( self->_parsers[a4],  "copySetActiveIntervalMessageWithInterval:",  v5);
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v7, a4);
}

- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a5);
  id v9 = -[APSProtocolParser copySetActiveState:forInterval:]( self->_parsers[a5],  "copySetActiveState:forInterval:",  v7,  v6);
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v9, a5);
}

- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a6);
  id v12 = -[APSProtocolParser copyMessageAcknowledgeMessageWithResponse:messageId:token:]( self->_parsers[a6],  "copyMessageAcknowledgeMessageWithResponse:messageId:token:",  a3,  v11,  v10);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v12, a6);
}

- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3
{
  id v5 = -[APSProtocolParser copyMessageTransportAcknowledgeMessage]( self->_parsers[a3],  "copyMessageTransportAcknowledgeMessage");
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v5, a3);
}

- (void)sendKeepAliveMessageWithMetadata:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a4);
  id v7 = -[APSProtocolParser copyKeepAliveMessageWithMetadata:]( self->_parsers[a4],  "copyKeepAliveMessageWithMetadata:",  v6);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v7, a4);
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 onInterface:(int64_t)a9
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = a5;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a9);
  id v18 = -[APSProtocolParser copyTokenGenerateMessageWithTopicHash:baseToken:appId:expirationTTL:vapidPublicKeyHash:type:]( self->_parsers[a9],  "copyTokenGenerateMessageWithTopicHash:baseToken:appId:expirationTTL:vapidPublicKeyHash:type:",  v17,  v16,  v11,  v10,  v15,  a8);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v18, a9);
}

- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a8);
  id v15 = -[APSProtocolParser copyPresenceTrackingRequestWithMessageID:pushToken:salt:trackingFlag:timestamp:]( self->_parsers[a8],  "copyPresenceTrackingRequestWithMessageID:pushToken:salt:trackingFlag:timestamp:",  a3,  v14,  a5,  v10,  a7);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v15, a8);
}

- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a7);
  id v15 = -[APSProtocolParser copyMessageTracingAckWithTopicHash:status:tracingUUID:token:]( self->_parsers[a7],  "copyMessageTracingAckWithTopicHash:status:tracingUUID:token:",  v14,  v8,  v13,  v12);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v15, a7);
}

- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 onInterface:(int64_t)a10
{
  id v11 = -[APSProtocolParser copyFilterMessageWithEnabledHashes:ignoredHashes:opportunisticHashes:nonWakingHashes:pausedHashes:token:version:]( self->_parsers[a10],  "copyFilterMessageWithEnabledHashes:ignoredHashes:opportunisticHashes:nonWakingHashes:pausedHashes:token:version:",  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v11, a10);
}

- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a9);
  id v19 = -[APSProtocolParser copyMessageWithTopicHash:identifier:payload:token:isPlistFormat:lastRTT:]( self->_parsers[a9],  "copyMessageWithTopicHash:identifier:payload:token:isPlistFormat:lastRTT:",  v18,  a4,  v17,  v16,  v9,  v15);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v19, a9);
  return v19 != 0LL;
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a5);
  id v9 = -[APSProtocolParser copyTaskControlMessageWithInput:messageId:]( self->_parsers[a5],  "copyTaskControlMessageWithInput:messageId:",  v8,  a4);

  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v9, a5);
}

- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = sub_10003CEE4(a6);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v15 = 138412546;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Sending pubsub message on interface %@",  (uint8_t *)&v15,  0x16u);
  }

  -[APSCourierConnection _prepareToParseOutgoingDataOnInterface:](self, "_prepareToParseOutgoingDataOnInterface:", a6);
  id v14 = -[APSProtocolParser copyPubSubChannelListWithInput:baseToken:messageID:]( self->_parsers[a6],  "copyPubSubChannelListWithInput:baseToken:messageID:",  v10,  v11,  v7);
  -[APSCourierConnection writeDataInBackground:onInterface:](self, "writeDataInBackground:onInterface:", v14, a6);
}

- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6 onInterface:(int64_t)a7
{
  return -[APSProtocolParser parseMessage:parameters:isInvalid:lengthParsed:]( self->_parsers[a7],  "parseMessage:parameters:isInvalid:lengthParsed:",  a3,  a4,  a5,  a6);
}

- (BOOL)isPackedFormatOnInterface:(int64_t)a3
{
  return -[APSProtocolParser isPackedFormat](self->_parsers[a3], "isPackedFormat");
}

- (void)connectionManager:(id)a3 handleEvent:(int)a4 context:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  delegate = self->_delegate;
  id v9 = a5;
  id v10 = a3;
  -[APSCourierConnectionDelegate courierConnection:connectionManager:handleEvent:context:onInterface:]( delegate,  "courierConnection:connectionManager:handleEvent:context:onInterface:",  self,  v10,  v5,  v9,  -[APSCourierConnection _interfaceForConnectionManager:](self, "_interfaceForConnectionManager:", v10));
}

- (void)protocolParser:(id)a3 receiveAPNSPackError:(id)a4
{
  delegate = self->_delegate;
  id v7 = a4;
  -[APSCourierConnectionDelegate courierConnection:parserErrorMessage:OnInterface:]( delegate,  "courierConnection:parserErrorMessage:OnInterface:",  self,  v7,  -[APSCourierConnection _interfaceForProtocolParser:](self, "_interfaceForProtocolParser:", a3));
}

- (unint64_t)tcpStream:(id)a3 dataReceived:(id)a4 isWakingMessage:(BOOL)a5
{
  BOOL v5 = a5;
  delegate = self->_delegate;
  id v9 = a4;
  id v10 = a3;
  int64_t v11 = -[APSCourierConnection _interfaceForStream:](self, "_interfaceForStream:", v10);
  id v12 = [v10 generation];

  id v13 = -[APSCourierConnectionDelegate courierConnection:dataReceived:onInterface:withGeneration:isWakingMessage:]( delegate,  "courierConnection:dataReceived:onInterface:withGeneration:isWakingMessage:",  self,  v9,  v11,  v12,  v5);
  return (unint64_t)v13;
}

- (void)tcpStreamEndEncountered:(id)a3 withReason:(unsigned int)a4
{
}

- (void)tcpStream:(id)a3 errorOccured:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog networking](&OBJC_CLASS___APSLog, "networking"));
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 tcpInfoDescription]);
    if (v10)
    {
      int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog networking](&OBJC_CLASS___APSLog, "networking"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000BFA70((uint64_t)v10, v11);
      }
    }
  }

  -[APSCourierConnectionDelegate courierConnection:errorOccured:onInterface:]( self->_delegate,  "courierConnection:errorOccured:onInterface:",  self,  v7,  -[APSCourierConnection _interfaceForStream:](self, "_interfaceForStream:", v6));
}

- (void)tcpStream:(id)a3 receivedServerBag:(id)a4
{
}

- (void)tcpStream:(id)a3 hasDeterminedServerHostname:(id)a4
{
  delegate = self->_delegate;
  id v7 = a4;
  -[APSCourierConnectionDelegate courierConnection:hasDeterminedServerHostname:onInterface:]( delegate,  "courierConnection:hasDeterminedServerHostname:onInterface:",  self,  v7,  -[APSCourierConnection _interfaceForStream:](self, "_interfaceForStream:", a3));
}

- (void)tcpStreamHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 maxEncoderTableSize:(unint64_t)a6 maxDecoderTableSize:(unint64_t)a7 secureHandshakeEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v18 = a4;
  int64_t v14 = -[APSCourierConnection _interfaceForStream:](self, "_interfaceForStream:", a3);
  int v15 = objc_alloc_init(&OBJC_CLASS___APSProtocolParser);
  id v16 = &(&self->super.isa)[v14];
  Class v17 = v16[4];
  v16[4] = (Class)v15;

  -[objc_class setDelegate:](v16[4], "setDelegate:", self);
  -[objc_class setIsPackedFormat:maxEncoderTableSize:maxDecoderTableSize:interface:]( v16[4],  "setIsPackedFormat:maxEncoderTableSize:maxDecoderTableSize:interface:",  v11,  a6,  a7,  v14);
  -[APSCourierConnectionDelegate courierConnectionHasConnected:context:enabledPackedFormat:secureHandshakeEnabled:onInterface:]( self->_delegate,  "courierConnectionHasConnected:context:enabledPackedFormat:secureHandshakeEnabled:onInterface:",  self,  v18,  v11,  v8,  v14);
}

- (double)currentKeepAliveInterval
{
  return result;
}

- (void)tcpStreamDidFailToForceKeepAliveProxyInterface:(id)a3
{
}

- (void)tcpStreamDidFailToObtainKeepAliveProxy:(id)a3 willRetry:(BOOL)a4
{
}

- (void)tcpStreamDidFailToFindKeepAliveProxyInterface:(id)a3
{
}

- (NSDictionary)connectionDebugInfo
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[APSTCPStream connectionDebugInfo](self->_streams[0], "connectionDebugInfo"));
  BOOL v5 = (void *)v4;
  if (v4) {
    id v6 = (const __CFString *)v4;
  }
  else {
    id v6 = @"N/A";
  }
  id v7 = sub_10003CEE4(0LL);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, v8);

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[APSTCPStream connectionDebugInfo](self->_streams[1], "connectionDebugInfo"));
  id v10 = (void *)v9;
  if (v9) {
    BOOL v11 = (const __CFString *)v9;
  }
  else {
    BOOL v11 = @"N/A";
  }
  id v12 = sub_10003CEE4(1uLL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, v13);

  return (NSDictionary *)v3;
}

- (NSDate)lastConnected
{
  return self->_lastConnected;
}

- (void)setLastConnected:(id)a3
{
}

- (unsigned)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(unsigned int)a3
{
  self->_disconnectReason = a3;
}

- (NSString)redirectHost
{
  return self->_redirectHost;
}

- (void)setRedirectHost:(id)a3
{
}

- (BOOL)remainsConnectedWhenWWANSuspends
{
  return self->_remainsConnectedWhenWWANSuspends;
}

- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled
{
  return self->_powerOptimizationsForExpensiveNetworkingDisabled;
}

- (unint64_t)maxExpensiveConditionsConnectionAttempts
{
  return self->_maxExpensiveConditionsConnectionAttempts;
}

- (void)setMaxExpensiveConditionsConnectionAttempts:(unint64_t)a3
{
  self->_unint64_t maxExpensiveConditionsConnectionAttempts = a3;
}

- (double)expensiveConditionsBackOffInterval
{
  return self->_expensiveConditionsBackOffInterval;
}

- (void)setExpensiveConditionsBackOffInterval:(double)a3
{
  self->_double expensiveConditionsBackOffInterval = a3;
}

- (double)wifiKeepAliveEarlyFireConstantInterval
{
  return self->_wifiKeepAliveEarlyFireConstantInterval;
}

- (BOOL)informingOfWrite
{
  return self->_informingOfWrite;
}

- (void)setInformingOfWrite:(BOOL)a3
{
  self->_informingOfWrite = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 0LL; i != -2; --i)
    objc_storeStrong((id *)&self->_connectionEstablishPowerAssertions[i + 1], 0LL);
  for (uint64_t j = 0LL; j != -2; --j)
    objc_storeStrong((id *)&self->_connectionEstablishTimers[j + 1], 0LL);
  for (uint64_t k = 0LL; k != -2; --k)
    objc_storeStrong((id *)&self->_keepAlivePowerAssertions[k + 1], 0LL);
  for (uint64_t m = 0LL; m != -2; --m)
    objc_storeStrong((id *)&self->_usingCachedIPAddress[m + 1], 0LL);
  for (uint64_t n = 0LL; n != -2; --n)
    objc_storeStrong((id *)&self->_keepAliveTimers[n + 1], 0LL);
  for (iuint64_t i = 0LL; ii != -2; --ii)
    objc_storeStrong((id *)&self->_contexts[ii + 1], 0LL);
  for (juint64_t j = 0LL; jj != -2; --jj)
    objc_storeStrong((id *)&self->_connectionManagers[jj + 1], 0LL);
  objc_storeStrong((id *)&self->_redirectHost, 0LL);
  for (kuint64_t k = 5LL; kk != 3; --kk)
    objc_storeStrong((id *)&(&self->super.isa)[kk], 0LL);
  do
    objc_storeStrong((id *)&(&self->super.isa)[kk--], 0LL);
  while (kk != 1);
  objc_storeStrong((id *)&self->_domain, 0LL);
}

@end