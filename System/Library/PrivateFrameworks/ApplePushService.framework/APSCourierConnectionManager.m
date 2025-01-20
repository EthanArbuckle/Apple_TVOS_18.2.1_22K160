@interface APSCourierConnectionManager
- (APSConnectionHistory)connectionHistory;
- (APSConnectionRetryStateManaging)connectionRetryManager;
- (APSCourierConnection)courierConnection;
- (APSCourierConnectionManager)initWithEnvironment:(id)a3 courierConnection:(id)a4 carrierBundleHelper:(id)a5 networkMonitor:(id)a6 connectionRetryManager:(id)a7 delegate:(id)a8;
- (APSCourierConnectionManager)initWithEnvironment:(id)a3 delegate:(id)a4;
- (APSCourierConnectionManagerDelegate)delegate;
- (APSEnvironment)environment;
- (APSNetworkMonitor)networkMonitor;
- (APSNoOpPowerAssertion)waitForConnectionAttemptsPowerAssertion;
- (APSOutgoingQueue)outgoingConnectMessageQueue;
- (APSOutgoingQueue)outgoingFilterQueue;
- (APSOutgoingQueue)outgoingSendMessageQueue;
- (APSOutgoingQueue)tokenGenerateResponseQueue;
- (APSPowerAssertion)criticalReliabilityPowerAssertion;
- (APSPowerAssertion)delayedKeepAlivePowerAssertion;
- (APSRateLimiter)suspendToggleDailyLimiter;
- (APSRateLimiter)suspendToggleHourlyLimiter;
- (APSReachabilityHandler)reachabilityHandler;
- (APSServerTimeTracker)serverTimeTracker;
- (APSSymptomReporter)symptomReporter;
- (BOOL)_adjustConnectionWithInterfacePreference:(int64_t)a3;
- (BOOL)_connectStreamWithInterfacePreference:(int64_t)a3;
- (BOOL)_handleRedirectMessage:(id)a3 onInterface:(int64_t)a4;
- (BOOL)_isInternetReachableOnInterface:(int64_t)a3;
- (BOOL)_isWiFiLinkQualityBetter;
- (BOOL)_neededToSwitchToKeepAliveProxyInterface;
- (BOOL)_requestKeepAliveProxy;
- (BOOL)_useShortKeepAliveInterval;
- (BOOL)allowedToHaveMultipleOpenInterfaces;
- (BOOL)didPushCauseWake;
- (BOOL)enableCriticalReliability;
- (BOOL)enabled;
- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4;
- (BOOL)handlingFailure;
- (BOOL)hasOpenConnection;
- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3;
- (BOOL)isAttemptingToReconnect;
- (BOOL)isCellularWatch;
- (BOOL)isConnected;
- (BOOL)isConnectedOnInterface:(int64_t)a3;
- (BOOL)isKeepAliveProxyConfiguredOnAnyConnection;
- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface;
- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3;
- (BOOL)isPiggybacking;
- (BOOL)isSuspendedOnInterface:(int64_t)a3;
- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3;
- (BOOL)pendingPostSuspensionWWANFlush;
- (BOOL)remainsConnectedWhenWWANSuspends;
- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9 withCompletion:(id)a10;
- (BOOL)shouldRun;
- (BOOL)shouldUseInternet;
- (BOOL)useServerKeepAliveStatsOnInterface:(int64_t)a3;
- (CoreTelephonyClient)ctClient;
- (NSArray)activeProtocolConnections;
- (NSDate)lastConnectionAttempt;
- (NSNumber)serverExpectedKeepAliveInterval;
- (NSNumber)serverMaxKeepAliveInterval;
- (NSNumber)serverMinKeepAliveInterval;
- (NSString)currentLinkQualityString;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ifname;
- (NSString)latestGeoRegion;
- (NSTimer)criticalFlushTimer;
- (NSTimer)resetInterfacePreferenceTimer;
- (PCCarrierBundleHelper)carrierBundleHelper;
- (PCPersistentTimer)criticalReliabilityTimer;
- (PCPersistentTimer)delayedReconnectTimer;
- (PCPersistentTimer)delayedSuspendKeepAliveTimer;
- (PCPersistentTimer)pendingMessageReconnectTimer;
- (__SecIdentity)clientIdentity;
- (double)currentKeepAliveInterval;
- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3;
- (double)delayedReconnectTLSInterval;
- (double)delayedSuspendKeepAliveInterval;
- (double)filterMessageTimeout;
- (double)keepAliveV2TimeDriftMaximum;
- (double)lastClientRequestedKeepaliveTime;
- (double)lastIPCachingTTLSeconds;
- (double)startedDarkWake;
- (id)JSONDebugState;
- (id)_sendOutgoingMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 onInterface:(int64_t)a7 ultraConstrainedAllowed:(BOOL)a8 withCompletion:(id)a9;
- (id)aps_prettyDescription;
- (id)connectionTimeForInterface:(int64_t)a3;
- (id)consecutiveConnectionFailureReasonOnInterface:(int64_t)a3;
- (id)copyOperatorName;
- (id)currentKeepAliveStateOnInterface:(int64_t)a3;
- (id)dailySuspendToggleRateLimiter;
- (id)dnsResolutionTimeMillisecondsOnInterface:(int64_t)a3;
- (id)hourlySuspendToggleRateLimiter;
- (id)maxLargeMessageSizeForInterface:(int64_t)a3;
- (id)maxMessageSizeForInterface:(int64_t)a3;
- (id)pcInterfaceMonitorNonCellular;
- (id)pcInterfaceMonitorOnInterface:(int64_t)a3;
- (id)pcInterfaceMonitorWWAN;
- (id)pcPersistentInterfaceManager;
- (id)protocolConnectionForInterface:(int64_t)a3;
- (id)serverHostnameForInterface:(int64_t)a3;
- (id)serverIPAddressForInterface:(int64_t)a3;
- (id)tcpHandshakeTimeMillisecondsOnInterface:(int64_t)a3;
- (id)tcpInfoDescription;
- (id)tlsHandshakeTimeMillisecondsOnInterface:(int64_t)a3;
- (int)_linkQualityForInterface:(int64_t)a3;
- (int)interfacePreference;
- (int)lastPushLQ;
- (int)lastPushRAT;
- (int64_t)delayedReconnectTLSIntervalTrigger;
- (int64_t)interfaceConstraintForInterface:(int64_t)a3;
- (int64_t)preferredInterface;
- (int64_t)suspendToggleDailyLimit;
- (int64_t)suspendToggleHourlyLimit;
- (unint64_t)cmaType;
- (unint64_t)consecutiveConnectionFailureCount;
- (unint64_t)consecutiveTLSConnectionFailureCount;
- (unint64_t)countConnectedInterfaces;
- (unint64_t)countOpenConnections;
- (unint64_t)courierConnection:(id)a3 dataReceived:(id)a4 onInterface:(int64_t)a5 withGeneration:(unint64_t)a6 isWakingMessage:(BOOL)a7;
- (unint64_t)findKeepAliveProxyInterfaceFailureCount;
- (unint64_t)forceKeepAliveProxyInterfaceFailureCount;
- (unint64_t)lastIPCachingPercentage;
- (unint64_t)obtainKeepAliveProxyFailureCount;
- (unint64_t)serverTimeInNanoSeconds;
- (unsigned)_keepAliveVersionForInterface:(int64_t)a3;
- (unsigned)redirectCount;
- (void)__delayedPerformKeepAliveOnInterface:(id)a3;
- (void)_adjustConnection;
- (void)_cacheIPAddress:(id)a3 onInterface:(int64_t)a4;
- (void)_clearConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)_clearDelayedReconnectTimer;
- (void)_clearFilterMessageTimerOnInterface:(int64_t)a3;
- (void)_clearKeepAliveResponseTimerOnInterface:(int64_t)a3;
- (void)_clearPostSuspensionFlushState;
- (void)_clearResetInterfacePreferenceTimer;
- (void)_criticalReliabilityTimerFired;
- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3;
- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3 withDelay:(double)a4;
- (void)_delayedReconnectTimerFired;
- (void)_delayedSuspendKeepAliveTimerFired:(id)a3;
- (void)_disconnectAllStreamsWithReason:(unsigned int)a3;
- (void)_disconnectStreamForInterface:(int64_t)a3 withReason:(unsigned int)a4;
- (void)_filterMessageTimeoutTimerFired:(id)a3;
- (void)_handleConnectionAfterSuspensionRecoveryOnInterface:(int64_t)a3 withKeepAlive:(BOOL)a4;
- (void)_handleConnectionFailureOnInterface:(int64_t)a3 forceDelayedReconnect:(BOOL)a4 withReason:(unsigned int)a5;
- (void)_handleConnectionRecoverFromSuspensionOnInterface:(int64_t)a3;
- (void)_handleConnectionSuspendedOnInterface:(int64_t)a3;
- (void)_handleDelayKeepAliveCancelMessageOnInterface:(int64_t)a3;
- (void)_handleFlushMessage:(id)a3 onInterface:(int64_t)a4;
- (void)_handleKeepAliveAckMessage:(id)a3 onInterface:(int64_t)a4;
- (void)_handleKeepAliveResponseMessage:(id)a3 onInterface:(int64_t)a4 didWake:(BOOL)a5;
- (void)_invokeInFailureHandlingContext:(id)a3;
- (void)_pendingMessageReconnectTimerFired;
- (void)_performFlushWithPaddingLength:(unint64_t)a3;
- (void)_performKeepAliveOnInterface:(int64_t)a3 shortInterval:(BOOL)a4 withAction:(int)a5;
- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4;
- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4 shortInterval:(BOOL)a5 onInterface:(int64_t)a6;
- (void)_resetInterfacePreferenceTimerFired:(id)a3;
- (void)_resetKeepAliveOnInterface:(int64_t)a3;
- (void)_resetServerKeepAliveStatsOnInterface:(int64_t)a3;
- (void)_startConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)_startFilterMessageTimerOnInterface:(int64_t)a3;
- (void)_startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4;
- (void)_startResetInterfacePreferenceTimer;
- (void)_submitKeepAliveFailedAWDonInterface:(int64_t)a3;
- (void)_submitKeepAliveSucceededAWDonInterface:(int64_t)a3;
- (void)_switchToKeepAliveProxyInterface;
- (void)_useCachedLastIPIfPossible:(int64_t)a3;
- (void)_useInteractivePowerAssertionIfNeededWithReason:(id)a3;
- (void)adjustConnectionsIfNeeded;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)carrierBundleDidChange;
- (void)clearConsecutiveConnectionFailureReasonOnInterface:(int64_t)a3;
- (void)clearDNSResolutionAndTLSHandshakeOnInterface:(int64_t)a3;
- (void)clearProtocolConnectionForInterface:(int64_t)a3;
- (void)courierConnection:(id)a3 aboutToWriteDataOnConnectedInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 connectionEstablishTimerFiredOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 connectionManager:(id)a4 handleEvent:(int)a5 context:(id)a6 onInterface:(int64_t)a7;
- (void)courierConnection:(id)a3 disconnectStreamOnInterface:(int64_t)a4 withReason:(unsigned int)a5;
- (void)courierConnection:(id)a3 errorOccured:(id)a4 onInterface:(int64_t)a5;
- (void)courierConnection:(id)a3 failedToFindKeepAliveProxyOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 failedToForceKeepAliveProxyOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 failedToObtainKeepAliveProxyOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 hasDeterminedServerHostname:(id)a4 onInterface:(int64_t)a5;
- (void)courierConnection:(id)a3 keepAliveResponseTimerFiredOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 parserErrorMessage:(id)a4 OnInterface:(int64_t)a5;
- (void)courierConnection:(id)a3 receivedServerBag:(id)a4;
- (void)courierConnection:(id)a3 streamEndedOnInterface:(int64_t)a4 withReason:(unsigned int)a5;
- (void)courierConnectionHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 secureHandshakeEnabled:(BOOL)a6 onInterface:(int64_t)a7;
- (void)dealloc;
- (void)forceAdjustConnections;
- (void)holdPowerAssertionUntilStreamsQuiesce;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceRadioHotnessChanged:(id)a3;
- (void)markInitiallyConnectedOnInterface:(int64_t)a3;
- (void)networkMonitor:(id)a3 enableWiFiAssertionForPiggybackConnection:(BOOL)a4;
- (void)networkMonitor:(id)a3 evaluateDualModeState:(BOOL)a4;
- (void)networkMonitorWiFiBecameAssociated:(id)a3;
- (void)notePush;
- (void)performKeepAlive;
- (void)performKeepAliveOnInterface:(int64_t)a3;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)prepareForSleep;
- (void)recalculateCriticalReliability;
- (void)refreshCriticalReliability;
- (void)refreshCriticalReliabilityTimerWithShortKeepAlive:(BOOL)a3;
- (void)requestConnectionIfNeeded;
- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8;
- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 withCompletion:(id)a17 onInterface:(int64_t)a18;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 interface:(int64_t)a5 activeInterval:(unsigned int)a6 presenceFlags:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 withCompletion:(id)a13 onInterface:(int64_t)a14;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 withCompletion:(id)a12 onInterface:(int64_t)a13;
- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 expectsResponse:(BOOL)a10 onInterface:(int64_t)a11 withCompletion:(id)a12;
- (void)sendFlushOnAllConnectionshWithPaddingLength:(unint64_t)a3;
- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6;
- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7;
- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3;
- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6;
- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9 onInterface:(int64_t)a10;
- (void)setCarrierBundleHelper:(id)a3;
- (void)setClientIdentity:(__SecIdentity *)a3;
- (void)setCmaType:(unint64_t)a3;
- (void)setConnectionFailure:(id)a3 onInterface:(int64_t)a4;
- (void)setConnectionHistory:(id)a3;
- (void)setConnectionRetryManager:(id)a3;
- (void)setConnectionStatistics:(id)a3 onInterface:(int64_t)a4;
- (void)setConnectionTime:(id)a3 forInterface:(int64_t)a4;
- (void)setConsecutiveConnectionFailureCount:(unint64_t)a3;
- (void)setConsecutiveTLSConnectionFailureCount:(unint64_t)a3;
- (void)setCourierConnection:(id)a3;
- (void)setCriticalFlushTimer:(id)a3;
- (void)setCriticalReliabilityPowerAssertion:(id)a3;
- (void)setCriticalReliabilityTimer:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDelayedKeepAlivePowerAssertion:(id)a3;
- (void)setDelayedReconnectTLSInterval:(double)a3;
- (void)setDelayedReconnectTLSIntervalTrigger:(int64_t)a3;
- (void)setDelayedReconnectTimer:(id)a3;
- (void)setDelayedSuspendKeepAliveInterval:(double)a3;
- (void)setDelayedSuspendKeepAliveTimer:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setFilterMessageTimeout:(double)a3;
- (void)setFindKeepAliveProxyInterfaceFailureCount:(unint64_t)a3;
- (void)setForceKeepAliveProxyInterfaceFailureCount:(unint64_t)a3;
- (void)setHandlingFailure:(BOOL)a3;
- (void)setInterfacePreference:(int)a3;
- (void)setKeepAliveConfiguration:(unint64_t)a3;
- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setKeepAliveV2TimeDriftMaximum:(double)a3;
- (void)setLastClientRequestedKeepaliveTime:(double)a3;
- (void)setLastConnectionAttempt:(id)a3;
- (void)setLastIPCachingPercentage:(unint64_t)a3;
- (void)setLastIPCachingTTLSeconds:(double)a3;
- (void)setLastPushLQ:(int)a3;
- (void)setLastPushRAT:(int)a3;
- (void)setLatestGeoRegion:(id)a3;
- (void)setMaxLargeMessageSize:(id)a3 forInterface:(int64_t)a4;
- (void)setMaxMessageSize:(id)a3 forInterface:(int64_t)a4;
- (void)setNetworkMonitor:(id)a3;
- (void)setObtainKeepAliveProxyFailureCount:(unint64_t)a3;
- (void)setOutgoingConnectMessageQueue:(id)a3;
- (void)setOutgoingFilterQueue:(id)a3;
- (void)setOutgoingSendMessageQueue:(id)a3;
- (void)setPendingMessageReconnectTimer:(id)a3;
- (void)setPendingPostSuspensionWWANFlush:(BOOL)a3;
- (void)setReachabilityHandler:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setResetInterfacePreferenceTimer:(id)a3;
- (void)setServerExpectedKeepAliveInterval:(id)a3;
- (void)setServerMaxKeepAliveInterval:(id)a3;
- (void)setServerMinKeepAliveInterval:(id)a3;
- (void)setServerSupportsDualMode:(BOOL)a3;
- (void)setServerTimeTracker:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)setShouldUseInternet:(BOOL)a3;
- (void)setStartedDarkWake:(double)a3;
- (void)setSuspendToggleDailyLimit:(int64_t)a3;
- (void)setSuspendToggleDailyLimiter:(id)a3;
- (void)setSuspendToggleHourlyLimit:(int64_t)a3;
- (void)setSuspendToggleHourlyLimiter:(id)a3;
- (void)setSymptomReporter:(id)a3;
- (void)setTokenGenerateResponseQueue:(id)a3;
- (void)setWaitForConnectionAttemptsPowerAssertion:(id)a3;
- (void)stopManagerOnInterface:(int64_t)a3;
- (void)triggerCriticalReliability;
- (void)updateKeepAliveInterval:(double)a3;
@end

@implementation APSCourierConnectionManager

- (APSCourierConnectionManager)initWithEnvironment:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[APSCourierConnection initWithEnvironment:]( objc_alloc(&OBJC_CLASS___APSCourierConnection),  "initWithEnvironment:",  v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PCCarrierBundleHelper helper](&OBJC_CLASS___PCCarrierBundleHelper, "helper"));
  v10 = objc_alloc_init(&OBJC_CLASS___APSNetworkMonitor);
  v11 = objc_alloc_init(&OBJC_CLASS___APSDefaultConnectionRetryStateManager);
  v12 = -[APSCourierConnectionManager initWithEnvironment:courierConnection:carrierBundleHelper:networkMonitor:connectionRetryManager:delegate:]( self,  "initWithEnvironment:courierConnection:carrierBundleHelper:networkMonitor:connectionRetryManager:delegate:",  v7,  v8,  v9,  v10,  v11,  v6);

  return v12;
}

- (APSCourierConnectionManager)initWithEnvironment:(id)a3 courierConnection:(id)a4 carrierBundleHelper:(id)a5 networkMonitor:(id)a6 connectionRetryManager:(id)a7 delegate:(id)a8
{
  id v49 = a3;
  id v48 = a4;
  id v47 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___APSCourierConnectionManager;
  v18 = -[APSCourierConnectionManager init](&v50, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_environment, a3);
    objc_storeStrong((id *)&v19->_delegate, a8);
    objc_storeStrong((id *)&v19->_carrierBundleHelper, a5);
    v20 = objc_alloc_init(&OBJC_CLASS___APSServerTimeTracker);
    serverTimeTracker = v19->_serverTimeTracker;
    v19->_serverTimeTracker = v20;

    objc_storeStrong((id *)&v19->_networkMonitor, a6);
    -[APSNetworkMonitor setDelegate:](v19->_networkMonitor, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_connectionRetryManager, a7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorNonCellular](v19, "pcInterfaceMonitorNonCellular"));
    [v22 addDelegate:v19 queue:&_dispatch_main_q];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](v19, "pcInterfaceMonitorWWAN"));
    [v23 addDelegate:v19 queue:&_dispatch_main_q];

    p_courierConnection = (id *)&v19->_courierConnection;
    objc_storeStrong((id *)&v19->_courierConnection, a4);
    if (-[APSCourierConnectionManager isCellularWatch](v19, "isCellularWatch")
      && (_os_feature_enabled_impl("APS", "CellularWatchNormalKAInterval") & 1) == 0)
    {
      [*p_courierConnection setWifiKeepAliveEarlyFireConstantInterval:120.0];
    }

    else
    {
      v19->_delayedReconnectTLSInterval = 120.0;
      v19->_delayedReconnectTLSIntervalTrigger = 50LL;
    }

    if (-[APSCourierConnectionManager _useShortKeepAliveInterval](v19, "_useShortKeepAliveInterval")) {
      [*p_courierConnection setKeepAliveConfiguration:0];
    }
    -[APSCourierConnection setRemainsConnectedWhenWWANSuspends:]( v19->_courierConnection,  "setRemainsConnectedWhenWWANSuspends:",  v19->_remainsConnectedWhenWWANSuspends);
    -[PCCarrierBundleHelper addDelegate:](v19->_carrierBundleHelper, "addDelegate:", v19);
    if ((-[PCCarrierBundleHelper BOOLValueFromPushBundleForKey:error:]( v19->_carrierBundleHelper,  "BOOLValueFromPushBundleForKey:error:",  APSForceKeepAliveV1Key,  0LL) & 1) != 0)
    {
      id v25 = -[APSCourierConnectionManager copyOperatorName](v19, "copyOperatorName");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ opts out of Keep Alive 2.0", buf, 0xCu);
      }
    }

    else
    {
      [*p_courierConnection setKeepAliveV2Supported:1 onInterface:0];
    }

    -[APSCourierConnection setKeepAliveV2Supported:onInterface:]( v19->_courierConnection,  "setKeepAliveV2Supported:onInterface:",  1LL,  1LL);
    -[APSCourierConnection setDelegate:](v19->_courierConnection, "setDelegate:", v19);
    BOOL v27 = sub_100077718(APSIsST);
    double v28 = 160.0;
    if (v27) {
      double v28 = 600.0;
    }
    v19->_delayedSuspendKeepAliveInterval = v28;
    *(_OWORD *)&v19->_suspendToggleHourlyLimit = xmmword_100102C90;
    v19->_keepAliveV2TimeDriftMaximum = 30.0;
    v19->_lastIPCachingTTLSeconds = 0.0;
    v19->_cmaType = 0LL;
    v19->_lastIPCachingPercentage = 0LL;
    v29 = objc_alloc_init(&OBJC_CLASS___APSConnectionHistory);
    connectionHistory = v19->_connectionHistory;
    v19->_connectionHistory = v29;

    v19->_filterMessageTimeout = 30.0;
    uint64_t v31 = APSBundleIdentifier;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](v19->_environment, "domain"));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-wakeconnection-%@",  v31,  v32));

    v34 = -[APSNoOpPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSNoOpPowerAssertion),  "initWithName:category:holdDuration:",  v33,  201LL,  19.0);
    waitForConnectionAttemptsPowerAssertion = v19->_waitForConnectionAttemptsPowerAssertion;
    v19->_waitForConnectionAttemptsPowerAssertion = v34;

    v36 = objc_alloc_init(&OBJC_CLASS___APSOutgoingQueue);
    outgoingSendMessageQueue = v19->_outgoingSendMessageQueue;
    v19->_outgoingSendMessageQueue = v36;

    v38 = objc_alloc_init(&OBJC_CLASS___APSOutgoingQueue);
    outgoingConnectMessageQueue = v19->_outgoingConnectMessageQueue;
    v19->_outgoingConnectMessageQueue = v38;

    v40 = objc_alloc_init(&OBJC_CLASS___APSOutgoingQueue);
    tokenGenerateResponseQueue = v19->_tokenGenerateResponseQueue;
    v19->_tokenGenerateResponseQueue = v40;

    v42 = objc_alloc_init(&OBJC_CLASS___APSOutgoingQueue);
    outgoingFilterQueue = v19->_outgoingFilterQueue;
    v19->_outgoingFilterQueue = v42;

    v44 = -[CoreTelephonyClient initWithQueue:]( objc_alloc(&OBJC_CLASS___CoreTelephonyClient),  "initWithQueue:",  &_dispatch_main_q);
    ctClient = v19->_ctClient;
    v19->_ctClient = v44;
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSCourierConnectionManager;
  -[APSCourierConnectionManager dealloc](&v3, "dealloc");
}

- (void)markInitiallyConnectedOnInterface:(int64_t)a3
{
  if (!-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:"))
  {
    -[APSCourierConnectionManager _clearConnectionEstablishTimerOnInterface:]( self,  "_clearConnectionEstablishTimerOnInterface:",  a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionRetryManager](self, "connectionRetryManager"));
    [v5 noteConnectionEstablished];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionRetryManager](self, "connectionRetryManager"));
    [v6 notePresenceSuccess];

    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnection serverIPAddressForInterface:]( self->_courierConnection,  "serverIPAddressForInterface:",  a3));
    if (self->_lastIPCachingTTLSeconds > 0.0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnection usingCachedIPAddressOnInterface:]( self->_courierConnection,  "usingCachedIPAddressOnInterface:",  a3));

      if (!v8) {
        -[APSCourierConnectionManager _cacheIPAddress:onInterface:](self, "_cacheIPAddress:onInterface:", v7, a3);
      }
    }

    -[APSCourierConnection setUsingCachedIPAddress:onInterface:]( self->_courierConnection,  "setUsingCachedIPAddress:onInterface:",  0LL,  a3);
    -[APSCourierConnection setIsConnecting:onInterface:]( self->_courierConnection,  "setIsConnecting:onInterface:",  0LL,  a3);
    -[APSCourierConnection setIsConnected:onInterface:]( self->_courierConnection,  "setIsConnected:onInterface:",  1LL,  a3);
    if (-[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces") >= 2) {
      -[APSNetworkMonitor openedSecondChannel](self->_networkMonitor, "openedSecondChannel");
    }
    self->_cmaType = 0LL;
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v28 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for PushConnectionConnected",  buf,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"startedOpeningStream" onInterface:a3]);
    v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    v14 = v13;

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 timeIntervalSinceDate:v14];
    double v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a3)));
    uint64_t v19 = +[APSMetricLogger dualChannelStateFrom:isPiggyBacking:]( &OBJC_CLASS___APSMetricLogger,  "dualChannelStateFrom:isPiggyBacking:",  self->_courierConnection,  -[APSNetworkMonitor isPiggybacking](self->_networkMonitor, "isPiggybacking"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager dnsResolutionTimeMillisecondsOnInterface:]( self,  "dnsResolutionTimeMillisecondsOnInterface:",  a3));
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager tlsHandshakeTimeMillisecondsOnInterface:]( self,  "tlsHandshakeTimeMillisecondsOnInterface:",  a3));
    +[APSMetricLogger connectionConnectedWithDuration:interface:linkQuality:dualChannelState:dnsResolutionTimeMilliseconds:tlsHandshakeTimeMilliseconds:]( &OBJC_CLASS___APSMetricLogger,  "connectionConnectedWithDuration:interface:linkQuality:dualChannelState:dnsResolutionTimeMilliseconds:tlsHandshakeT imeMilliseconds:",  v20,  a3,  v18,  v19,  v21,  v22);

    -[APSCourierConnectionManager clearDNSResolutionAndTLSHandshakeOnInterface:]( self,  "clearDNSResolutionAndTLSHandshakeOnInterface:",  a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    [v23 setObject:0 forKey:@"startedOpeningStream" onInterface:a3];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v24 setObject:v25 forKey:@"connectionEstablished" onInterface:a3];

    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v28 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@: AWD PushConnectionConnected finished",  buf,  0xCu);
    }
  }

- (void)_adjustConnection
{
}

- (BOOL)_adjustConnectionWithInterfacePreference:(int64_t)a3
{
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentLinkQualityString]);
    int v16 = 138412802;
    double v17 = self;
    __int16 v18 = 2048;
    unint64_t v19 = v6;
    __int16 v20 = 2112;
    v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "APSUserCourier %@ adjusting connection. Connected on %lu interfaces. Current link quality: %@",  (uint8_t *)&v16,  0x20u);
  }

  if (-[APSCourierConnectionManager shouldUseInternet](self, "shouldUseInternet"))
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = sub_10003CEE4(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v16 = 138412546;
      double v17 = self;
      __int16 v18 = 2112;
      unint64_t v19 = (unint64_t)v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ calling _connectStream with interface preference %@",  (uint8_t *)&v16,  0x16u);
    }

    if (a3 == 3 && -[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode"))
    {
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        double v17 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ _connectStream has None preference and dual channel is enabled.",  (uint8_t *)&v16,  0xCu);
      }

      if (-[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  0LL))
      {
        LODWORD(a3) = 0;
      }

      else
      {
        a3 = objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          double v17 = self;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)a3,  OS_LOG_TYPE_DEFAULT,  "%@ _connectStream - kicking WWAN for dual channel",  (uint8_t *)&v16,  0xCu);
        }

        LODWORD(a3) = -[APSCourierConnectionManager _connectStreamWithInterfacePreference:]( self,  "_connectStreamWithInterfacePreference:",  0LL);
      }

      if (!-[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  1LL))
      {
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          double v17 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ _connectStream - kicking NonCellular for dual channel",  (uint8_t *)&v16,  0xCu);
        }

        LODWORD(a3) = a3 | -[APSCourierConnectionManager _connectStreamWithInterfacePreference:]( self,  "_connectStreamWithInterfacePreference:",  1LL);
      }
    }

    else
    {
      LOBYTE(a3) = -[APSCourierConnectionManager _connectStreamWithInterfacePreference:]( self,  "_connectStreamWithInterfacePreference:",  a3);
    }
  }

  else
  {
    if (-[APSCourierConnection hasOpenConnection](self->_courierConnection, "hasOpenConnection"))
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        double v17 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Disconnecting from courier as there are no more connections with enabled topics, we have been disabled, or we are in push proxy mode.",  (uint8_t *)&v16,  0xCu);
      }
    }

    -[APSCourierConnection stopManagers](self->_courierConnection, "stopManagers");
    -[APSCourierConnectionManager _disconnectAllStreamsWithReason:](self, "_disconnectAllStreamsWithReason:", 2LL);
    LOBYTE(a3) = 0;
  }

  return a3;
}

- (void)_disconnectAllStreamsWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[APSCourierConnectionManager _disconnectStreamForInterface:withReason:]( self,  "_disconnectStreamForInterface:withReason:",  1LL,  *(void *)&a3);
  -[APSCourierConnectionManager _disconnectStreamForInterface:withReason:]( self,  "_disconnectStreamForInterface:withReason:",  0LL,  v3);
  self->_cmaType = 0LL;
}

- (void)_handleConnectionFailureOnInterface:(int64_t)a3 forceDelayedReconnect:(BOOL)a4 withReason:(unsigned int)a5
{
  BOOL v5 = a4;
  unint64_t v6 = a3;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10008ACB4;
  v70[3] = &unk_10011FF78;
  v70[4] = self;
  v70[5] = a3;
  unsigned int v71 = a5;
  -[APSCourierConnectionManager _invokeInFailureHandlingContext:](self, "_invokeInFailureHandlingContext:", v70);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionRetryManager](self, "connectionRetryManager"));
  [v8 noteConnectionAttemptFailed];

  if (-[APSCourierConnection isConnectingOnInterface:](self->_courierConnection, "isConnectingOnInterface:", v6))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnection usingCachedIPAddressOnInterface:]( self->_courierConnection,  "usingCachedIPAddressOnInterface:",  v6));

    if (v9) {
      -[APSCourierConnectionManager _cacheIPAddress:onInterface:](self, "_cacheIPAddress:onInterface:", 0LL, v6);
    }
    else {
      -[APSCourierConnectionManager _useCachedLastIPIfPossible:](self, "_useCachedLastIPIfPossible:", v6);
    }
    -[APSCourierConnection setIsConnecting:onInterface:]( self->_courierConnection,  "setIsConnecting:onInterface:",  0LL,  v6);
  }

  unint64_t consecutiveConnectionFailureCount = self->_consecutiveConnectionFailureCount;
  if (consecutiveConnectionFailureCount)
  {
    unsigned int v11 = -[APSCourierConnectionManager isCellularWatch](self, "isCellularWatch");
    if (v6 == 1 && v11)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"APSDDetectedUnusableWiFi", 0LL, 0LL, 1u);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: WiFi might be out of range or captive. Posting notification for iRatManager: APSDDetectedUnusableWiFi.",  buf,  0xCu);
      }
    }

    symptomReporter = self->_symptomReporter;
    if (!symptomReporter)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___APSSymptomReporter);
      int v16 = self->_symptomReporter;
      self->_symptomReporter = v15;

      symptomReporter = self->_symptomReporter;
    }

    -[APSSymptomReporter reportConnectionFailureOnConnectionType:]( symptomReporter,  "reportConnectionFailureOnConnectionType:",  v6 != 0);
    unint64_t consecutiveConnectionFailureCount = self->_consecutiveConnectionFailureCount;
  }

  self->_unint64_t consecutiveConnectionFailureCount = consecutiveConnectionFailureCount + 1;
  -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  0LL,  @"connectionEstablished",  v6);
  unsigned int v17 = -[APSCourierConnection isConnected](self->_courierConnection, "isConnected");
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = sub_10003CEE4(v6);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    unint64_t v65 = self->_consecutiveConnectionFailureCount;
    unint64_t v66 = v6;
    BOOL v67 = v5;
    v21 = @"YES";
    if (v17) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    id v23 = sub_10003CEE4(-[APSCourierConnection preferredInterface](self->_courierConnection, "preferredInterface"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode")) {
      id v25 = @"YES";
    }
    else {
      id v25 = @"NO";
    }
    if (!self->_enableCriticalReliability) {
      v21 = @"NO";
    }
    unint64_t cmaType = self->_cmaType;
    unint64_t v27 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    *(_DWORD *)buf = 138414338;
    v73 = self;
    __int16 v74 = 2112;
    double v75 = *(double *)&v20;
    __int16 v76 = 2048;
    uint64_t v77 = v65;
    __int16 v78 = 2112;
    v79 = v22;
    unint64_t v6 = v66;
    __int16 v80 = 2112;
    v81 = v24;
    __int16 v82 = 2112;
    v83 = v25;
    __int16 v84 = 2112;
    v85 = v21;
    BOOL v5 = v67;
    __int16 v86 = 2048;
    unint64_t v87 = cmaType;
    __int16 v88 = 2048;
    unint64_t v89 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: Disconnected in response to connection failure on interface %@. (Consecutive failures: %lu) isConnected %@ onI nterface %@  shouldUseDualChannel %@ criticalReliability %@ cmaType %lu. Connected on %lu interfaces.",  buf,  0x5Cu);
  }

  int64_t v28 = v6;
  if (!-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode"))
  {
    if (v17)
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = self;
        v36 = "%@: We are still connected on another interface. No need to retry/schedule a retry.";
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
      }
    }

    else
    {
      if (!-[APSCourierConnection hasOpenConnection](self->_courierConnection, "hasOpenConnection"))
      {
        int64_t v28 = -[APSCourierConnection nextConnectionAttemptInterface]( self->_courierConnection,  "nextConnectionAttemptInterface");
        if (self->_consecutiveConnectionFailureCount == 1
          && -[APSCourierConnectionManager _isWiFiLinkQualityBetter](self, "_isWiFiLinkQualityBetter"))
        {
          int64_t v28 = 1LL;
        }

        goto LABEL_26;
      }

      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = self;
        v36 = "%@: We have an open connection attempt on another interface. No need to retry/schedule a retry.";
        goto LABEL_42;
      }
    }

    -[APSCourierConnection stopManagerOnInterface:](self->_courierConnection, "stopManagerOnInterface:", v6);
    return;
  }

- (void)_delayedReconnectTimerFired
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unint64_t v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: _delayedReconnectTimerFired! Connecting now.",  (uint8_t *)&v5,  0xCu);
  }

  -[PCPersistentTimer invalidate](self->_delayedReconnectTimer, "invalidate");
  delayedReconnectTimer = self->_delayedReconnectTimer;
  self->_delayedReconnectTimer = 0LL;

  -[APSCourierConnectionManager _adjustConnectionWithInterfacePreference:]( self,  "_adjustConnectionWithInterfacePreference:",  -[APSCourierConnection nextConnectionAttemptInterface](self->_courierConnection, "nextConnectionAttemptInterface"));
}

- (void)_clearDelayedReconnectTimer
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unint64_t v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: Canceling _delayedReconnectTimer.",  (uint8_t *)&v5,  0xCu);
  }

  -[PCPersistentTimer invalidate](self->_delayedReconnectTimer, "invalidate");
  delayedReconnectTimer = self->_delayedReconnectTimer;
  self->_delayedReconnectTimer = 0LL;
}

- (void)_pendingMessageReconnectTimerFired
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unint64_t v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: _pendingMessageReconnectTimerFired!",  (uint8_t *)&v5,  0xCu);
  }

  -[PCPersistentTimer invalidate](self->_pendingMessageReconnectTimer, "invalidate");
  pendingMessageReconnectTimer = self->_pendingMessageReconnectTimer;
  self->_pendingMessageReconnectTimer = 0LL;

  -[APSCourierConnectionManager _adjustConnectionWithInterfacePreference:]( self,  "_adjustConnectionWithInterfacePreference:",  -[APSCourierConnection nextConnectionAttemptInterface](self->_courierConnection, "nextConnectionAttemptInterface"));
}

- (void)_disconnectStreamForInterface:(int64_t)a3 withReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_10003CEE4(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412802;
    v38 = self;
    __int16 v39 = 2112;
    v40 = v9;
    __int16 v41 = 1024;
    int v42 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ _disconnectStream for interface: %@ with reason: %u",  buf,  0x1Cu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingConnectMessageQueue](self, "outgoingConnectMessageQueue"));
  id v11 = sub_10003CEE4(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 clearEnqueuedSendsOnInterface:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingSendMessageQueue](self, "outgoingSendMessageQueue"));
  id v14 = sub_10003CEE4(a3);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 clearEnqueuedSendsOnInterface:v15];

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager tokenGenerateResponseQueue](self, "tokenGenerateResponseQueue"));
  id v17 = sub_10003CEE4(a3);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 clearEnqueuedSendsOnInterface:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingFilterQueue](self, "outgoingFilterQueue"));
  id v20 = sub_10003CEE4(a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v19 clearEnqueuedSendsOnInterface:v21];

  -[APSCourierConnectionManager setConnectionTime:forInterface:](self, "setConnectionTime:forInterface:", 0LL, a3);
  -[APSCourierConnectionManager _clearFilterMessageTimerOnInterface:](self, "_clearFilterMessageTimerOnInterface:", a3);
  -[APSCourierConnection setIsSuspended:onInterface:](self->_courierConnection, "setIsSuspended:onInterface:", 0LL, a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnection redirectHost](self->_courierConnection, "redirectHost"));

  if (!v22) {
    -[APSCourierConnection clearRedirectCount](self->_courierConnection, "clearRedirectCount");
  }
  unsigned int v23 = -[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", a3);
  unsigned int v24 = -[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  a3);
  -[APSCourierConnection closeStreamForInterface:](self->_courierConnection, "closeStreamForInterface:", a3);
  -[APSCourierConnection setIsConnected:onInterface:withDisconnectReason:]( self->_courierConnection,  "setIsConnected:onInterface:withDisconnectReason:",  0LL,  a3,  v4);
  if (!a3) {
    -[APSCourierConnectionManager _clearPostSuspensionFlushState](self, "_clearPostSuspensionFlushState");
  }
  uint64_t v25 = v24 & (v23 ^ 1);
  if (v23)
  {
    if ((id)-[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces") == (id)1) {
      -[APSNetworkMonitor closedSecondChannel:](self->_networkMonitor, "closedSecondChannel:", a3);
    }
    -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:]( self,  "_clearKeepAliveResponseTimerOnInterface:",  a3);
  }

  else if ((_DWORD)v25)
  {
    -[APSCourierConnectionManager _clearConnectionEstablishTimerOnInterface:]( self,  "_clearConnectionEstablishTimerOnInterface:",  a3);
  }

  if (self->_enabled)
  {
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v27 = (APSCourierConnectionManager *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
      id v28 = sub_10003CEE4(a3);
      unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 138412546;
      v38 = v27;
      __int16 v39 = 2112;
      v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Connection closed %@ %@", buf, 0x16u);
    }
  }

  if (v23) {
    uint64_t v30 = 2LL;
  }
  else {
    uint64_t v30 = v25;
  }
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager protocolConnectionForInterface:]( self,  "protocolConnectionForInterface:",  a3));
  -[APSCourierConnectionManager clearProtocolConnectionForInterface:](self, "clearProtocolConnectionForInterface:", a3);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10008B2DC;
  v33[3] = &unk_10011FFC8;
  id v34 = v31;
  uint64_t v35 = v30;
  int v36 = v4;
  id v32 = v31;
  [v32 enumerateStateListeners:v33];
}

- (void)_cacheIPAddress:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_10003CEE4(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412802;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ cache ip address %@ on interface %@",  buf,  0x20u);
  }

  id v10 = (const __CFString *)APSCachedIPKey;
  CFPropertyListRef v11 = sub_10007783C(APSCachedIPKey, 0);
  if (v11)
  {
    id v13 = (void *)v11;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
      id v15 = (NSMutableDictionary *)[v13 mutableCopy];
    }
    else {
      id v15 = 0LL;
    }
    CFRelease(v13);
    if (!v6) {
      goto LABEL_12;
    }
  }

  else
  {
    id v15 = 0LL;
    if (!v6) {
      goto LABEL_12;
    }
  }

  if (!v15)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
LABEL_13:
    int v16 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int16 v18 = -[NSDictionary initWithObjectsAndKeys:]( v16,  "initWithObjectsAndKeys:",  v17,  @"date",  v6,  @"ip",  0LL);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v18, v19);

    goto LABEL_14;
  }

- (void)_useCachedLastIPIfPossible:(int64_t)a3
{
  if (self->_lastIPCachingTTLSeconds > 0.0)
  {
    id v6 = (void *)sub_10007783C(APSCachedIPKey, 0);
    if (v6)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v8]);

        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"ip"]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"date"]);
          if (v13)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v14 timeIntervalSinceDate:v13];
            double v16 = v15;
          }

          else
          {
            double v16 = 978307200.0;
          }

          if (v12 && v16 > 0.0 && v16 < self->_lastIPCachingTTLSeconds)
          {
            -[APSCourierConnection setUsingCachedIPAddress:onInterface:]( self->_courierConnection,  "setUsingCachedIPAddress:onInterface:",  v12,  a3);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = sub_10003CEE4(a3);
              id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              int v20 = 138413314;
              v21 = self;
              __int16 v22 = 2080;
              __int16 v23 = "-[APSCourierConnectionManager _useCachedLastIPIfPossible:]";
              __int16 v24 = 2112;
              __int16 v25 = v12;
              __int16 v26 = 2048;
              double v27 = v16;
              __int16 v28 = 2112;
              unint64_t v29 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@ %s setCachedIPAddress %@ with age %f on interface %@",  (uint8_t *)&v20,  0x34u);
            }
          }

          goto LABEL_9;
        }
      }
    }

    uint64_t v12 = 0LL;
    id v13 = 0LL;
LABEL_9:
  }

- (void)_clearPostSuspensionFlushState
{
  delayedSuspendKeepAliveTimer = self->_delayedSuspendKeepAliveTimer;
  self->_delayedSuspendKeepAliveTimer = 0LL;

  self->_pendingPostSuspensionWWANFlush = 0;
}

- (BOOL)_connectStreamWithInterfacePreference:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10003CEE4(-[APSCourierConnection preferredInterface](self->_courierConnection, "preferredInterface"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    unint64_t consecutiveConnectionFailureCount = self->_consecutiveConnectionFailureCount;
    id v9 = sub_10003CEE4(a3);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
    if (-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode")) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    unint64_t v12 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    *(_DWORD *)buf = 138413570;
    v124 = self;
    __int16 v125 = 2112;
    unint64_t v126 = (unint64_t)v7;
    __int16 v127 = 2048;
    unint64_t v128 = consecutiveConnectionFailureCount;
    __int16 v129 = 2112;
    v130 = v10;
    __int16 v131 = 2112;
    v132 = v11;
    __int16 v133 = 2048;
    unint64_t v134 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ attempting to _connectStream. currently onInterface %@ consecutiveFailures %lu preference %@ shouldUseDualChann el %@. Connected on %lu interfaces.",  buf,  0x3Eu);
  }

  if (+[APSSimulatorSupport isSimulator](&OBJC_CLASS___APSSimulatorSupport, "isSimulator")
    && !+[APSSimulatorSupport isBuildSupported](&OBJC_CLASS___APSSimulatorSupport, "isBuildSupported"))
  {
    unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v30 = +[APSSimulatorSupport isBuildSupported](&OBJC_CLASS___APSSimulatorSupport, "isBuildSupported");
      unint64_t v31 = @"NO";
      if (v30) {
        unint64_t v31 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v124 = (APSCourierConnectionManager *)v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Build version not supported {isSupportedOnBuild:%@} - disconnecting",  buf,  0xCu);
    }

    return 0;
  }

  if (self->_delayedReconnectTimer)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      return 0;
    }

    delayedReconnectTimer = self->_delayedReconnectTimer;
    *(_DWORD *)buf = 138412546;
    v124 = self;
    __int16 v125 = 2112;
    unint64_t v126 = (unint64_t)delayedReconnectTimer;
    double v15 = "%@: Not connecting. {delayedReconnectTimer:%@}";
    goto LABEL_11;
  }

  id v18 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastConnectionAttempt = self->_lastConnectionAttempt;
  self->_lastConnectionAttempt = v18;

  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
  unsigned int v21 = [v20 courierConnectionManagerClientsWillBeAbleToConnect];

  if (!v21)
  {
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000BFDF4(v32);
    }

    -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  3LL,  1LL,  14LL);
    return 0;
  }

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorNonCellular](self, "pcInterfaceMonitorNonCellular"));
  unsigned int v23 = [v22 isInterfaceUsable];

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  id v25 = [v24 interfaceConstraint];

  else {
    unint64_t v26 = a3;
  }
  if (!-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode"))
  {
    unsigned int v27 = -[APSCourierConnection hasOpenConnection](self->_courierConnection, "hasOpenConnection");
    if (v26 == 3)
    {
      if (v27)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        unint64_t v28 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
        *(_DWORD *)buf = 138412546;
        v124 = self;
        __int16 v125 = 2048;
        unint64_t v126 = v28;
        double v15 = "%@ _connectStream - caller is ensuring that we are connected. We are so there's nothing to do here. - Conn"
              "ected on %lu interfaces.";
LABEL_11:
        double v16 = (os_log_s *)v13;
        uint32_t v17 = 22;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        goto LABEL_13;
      }
    }
  }

  if (-[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  v26))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = sub_10003CEE4(v26);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      courierConnection = self->_courierConnection;
      *(_DWORD *)buf = 138412802;
      v124 = self;
      __int16 v125 = 2112;
      unint64_t v126 = (unint64_t)v35;
      __int16 v127 = 2112;
      unint64_t v128 = (unint64_t)courierConnection;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "%@ _connectStream - called with a preference %@ that matches our current connection %@, nothing to do",  buf,  0x20u);
    }

    goto LABEL_13;
  }

  if (-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode"))
  {
    if (-[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  1LL))
    {
      unsigned int v37 = -[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  0LL);
      if (v26 == 3)
      {
        if (v37)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 138412290;
          v124 = self;
          double v15 = "%@ _connectStream - should use dual channel, no preference specified and we are already connected on both channels.";
          goto LABEL_111;
        }
      }
    }
  }

  int v38 = v23 ^ 1;
  __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
  unsigned int v40 = [v39 isWWANInterfaceUp];

  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  unsigned int v42 = [v41 isInterfaceUsable] & v40;

  if (_os_feature_enabled_impl("APS", "EmperorPenguin"))
  {
    if (v25 == (id)1) {
      unsigned int v43 = v42;
    }
    else {
      unsigned int v43 = 0;
    }
    if (v25 == (id)1) {
      char v44 = 0;
    }
    else {
      char v44 = v42;
    }
    if ((v44 & 1) == 0 && (v43 & v38 & 1) == 0) {
      goto LABEL_50;
    }
  }

  else if (!v42)
  {
LABEL_50:
    int v45 = 0;
    uint64_t v46 = 0LL;
    goto LABEL_53;
  }

  uint64_t v46 = -[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  0LL) ^ 1;
  int v45 = 1;
LABEL_53:
  if (v23) {
    v46 += -[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  1LL) ^ 1;
  }
  unsigned __int8 v47 = -[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode");
  unsigned int v48 = -[APSCourierConnection hasOpenConnection](self->_courierConnection, "hasOpenConnection");
  if ((v47 & 1) == 0)
  {
    char v54 = v48 ^ 1;
    if (v26) {
      char v54 = 1;
    }
    if ((v54 & 1) != 0
      || (unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN")),
          char v56 = [v55 isInterfaceHistoricallyUsable] & v40,
          v55,
          (v56 & 1) != 0))
    {
      unsigned int v57 = !-[APSCourierConnection hasOpenConnection](self->_courierConnection, "hasOpenConnection");
      if (v26 != 1) {
        unsigned int v57 = 1;
      }
      if (((v57 | v23) & 1) != 0) {
        goto LABEL_75;
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v124 = self;
      double v15 = "%@ _connectStream - want wifi but it is not currently usable, nothing to do";
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v124 = self;
      double v15 = "%@ _connectStream - want wwan but it is not historically usable, nothing to do";
    }

- (void)_startConnectionEstablishTimerOnInterface:(int64_t)a3
{
}

- (void)_clearConnectionEstablishTimerOnInterface:(int64_t)a3
{
}

- (void)_clearKeepAliveResponseTimerOnInterface:(int64_t)a3
{
}

- (void)_startFilterMessageTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    -[APSCourierConnectionManager _clearFilterMessageTimerOnInterface:](self, "_clearFilterMessageTimerOnInterface:");
    double filterMessageTimeout = self->_filterMessageTimeout;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_filterMessageTimeoutTimerFired:",  v9,  0LL,  filterMessageTimeout));
    uint64_t v7 = &(&self->super.isa)[a3];
    Class v8 = v7[18];
    v7[18] = (Class)v6;
  }

- (void)_clearFilterMessageTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    filterMessageTimer = self->_filterMessageTimer;
    uint64_t v5 = self->_filterMessageTimer[a3];
    if (v5)
    {
      -[NSTimer invalidate](v5, "invalidate");
      uint64_t v6 = filterMessageTimer[a3];
      filterMessageTimer[a3] = 0LL;
    }
  }

- (void)_filterMessageTimeoutTimerFired:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = [v4 integerValue];

  -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  v5,  0LL,  22LL);
}

- (NSString)ifname
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 ifname]);

  return (NSString *)v3;
}

- (id)pcInterfaceMonitorWWAN
{
  return -[APSCourierConnectionManager pcInterfaceMonitorOnInterface:](self, "pcInterfaceMonitorOnInterface:", 0LL);
}

- (id)pcInterfaceMonitorNonCellular
{
  return -[APSCourierConnectionManager pcInterfaceMonitorOnInterface:](self, "pcInterfaceMonitorOnInterface:", 1LL);
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

- (id)pcPersistentInterfaceManager
{
  return +[PCPersistentInterfaceManager sharedInstance](&OBJC_CLASS___PCPersistentInterfaceManager, "sharedInstance");
}

- (BOOL)_isWiFiLinkQualityBetter
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  if ([v3 isPoorLinkQuality])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorNonCellular](self, "pcInterfaceMonitorNonCellular"));
    if ([v4 isPoorLinkQuality])
    {
      unsigned __int8 v5 = 0;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorNonCellular](self, "pcInterfaceMonitorNonCellular"));
      if ([v6 isInternetReachable])
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
        unsigned __int8 v5 = [v7 isWakeOnWiFiSupported];
      }

      else
      {
        unsigned __int8 v5 = 0;
      }
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_requestKeepAliveProxy
{
  return 0;
}

- (int)_linkQualityForInterface:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorNonCellular](self, "pcInterfaceMonitorNonCellular"));
  }
  else {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  }
  uint64_t v4 = v3;
  int v5 = [v3 linkQuality];

  return v5;
}

- (BOOL)isCellularWatch
{
  return 0;
}

- (BOOL)shouldUseInternet
{
  if (self->_enabled)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
    self->_shouldUseInternet = [v3 courierConnectionManagerClientsCanConnectRightNow];

    return self->_shouldUseInternet;
  }

  else
  {
    BOOL result = 0;
    self->_shouldUseInternet = 0;
  }

  return result;
}

- (BOOL)_useShortKeepAliveInterval
{
  if (qword_10014E960 != -1) {
    dispatch_once(&qword_10014E960, &stru_10011FFE8);
  }
  return byte_10014E958;
}

- (id)copyOperatorName
{
  return -[PCCarrierBundleHelper copyValueForKey:error:]( self->_carrierBundleHelper,  "copyValueForKey:error:",  APSCarrierNameKey,  0LL);
}

- (unsigned)_keepAliveVersionForInterface:(int64_t)a3
{
  if (-[APSCourierConnection keepAliveV2SupportedOnInterface:]( self->_courierConnection,  "keepAliveV2SupportedOnInterface:",  a3))
  {
    return 2;
  }

  else
  {
    return 1;
  }

- (BOOL)useServerKeepAliveStatsOnInterface:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  if (-[APSConnectionHistory connectionQualityOnInterface:](self->_connectionHistory, "connectionQualityOnInterface:") < 1) {
    return 0;
  }
  if (self->_serverMaxKeepAliveInterval || self->_serverExpectedKeepAliveInterval) {
    return 1;
  }
  return self->_serverMinKeepAliveInterval != 0LL;
}

- (BOOL)_isInternetReachableOnInterface:(int64_t)a3
{
  if (a3 > 1) {
    return 0;
  }
  uint64_t v11 = v3;
  if (a3 == 1) {
    Class v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorNonCellular](self, "pcInterfaceMonitorNonCellular"));
  }
  else {
    Class v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  }
  id v9 = v8;
  unsigned __int8 v10 = objc_msgSend(v8, "isInternetReachable", v4, v11, v5, v6);

  return v10;
}

- (id)hourlySuspendToggleRateLimiter
{
  suspendToggleHourlyLimiter = self->_suspendToggleHourlyLimiter;
  if (!suspendToggleHourlyLimiter || -[APSRateLimiter isUnset](suspendToggleHourlyLimiter, "isUnset"))
  {
    uint64_t v4 = -[APSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___APSRateLimiter),  "initWithLimit:timeLimit:",  self->_suspendToggleHourlyLimit,  3600.0);
    uint64_t v5 = self->_suspendToggleHourlyLimiter;
    self->_suspendToggleHourlyLimiter = v4;
  }

  return self->_suspendToggleHourlyLimiter;
}

- (id)dailySuspendToggleRateLimiter
{
  suspendToggleDailyLimiter = self->_suspendToggleDailyLimiter;
  if (!suspendToggleDailyLimiter || -[APSRateLimiter isUnset](suspendToggleDailyLimiter, "isUnset"))
  {
    uint64_t v4 = -[APSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___APSRateLimiter),  "initWithLimit:timeLimit:",  self->_suspendToggleDailyLimit,  86400.0);
    uint64_t v5 = self->_suspendToggleDailyLimiter;
    self->_suspendToggleDailyLimiter = v4;
  }

  return self->_suspendToggleDailyLimiter;
}

- (void)clearDNSResolutionAndTLSHandshakeOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    Class v8 = &(&self->super.isa)[a3];
    Class v9 = v8[3];
    v8[3] = 0LL;

    Class v10 = v8[5];
    v8[5] = 0LL;
  }

  else
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_10003CEE4(a3);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v11 = 138412546;
      unint64_t v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to clear dnsResolutionTimeMilliseconds on invalid interface %@",  (uint8_t *)&v11,  0x16u);
    }
  }

- (NSString)currentLinkQualityString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentLinkQualityString]);

  return (NSString *)v3;
}

- (NSArray)activeProtocolConnections
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = 0LL;
  protocolConnections = self->_protocolConnections;
  char v6 = 1;
  do
  {
    char v7 = v6;
    Class v8 = protocolConnections[v4];
    Class v9 = v8;
    if (v8 && -[APSCourierConnectionProtocolConnection isConnected](v8, "isConnected")) {
      -[NSMutableArray addObject:](v3, "addObject:", v9);
    }

    char v6 = 0;
    uint64_t v4 = 1LL;
  }

  while ((v7 & 1) != 0);
  id v10 = -[NSMutableArray copy](v3, "copy");

  return (NSArray *)v10;
}

- (void)clearProtocolConnectionForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    uint64_t v3 = &(&self->super.isa)[a3];
    Class v4 = v3[12];
    v3[12] = 0LL;
  }

- (id)protocolConnectionForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    uint64_t v3 = self->_protocolConnections[a3];
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3;
}

- (void)carrierBundleDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008D154;
  block[3] = &unk_10011E4F0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)courierConnection:(id)a3 connectionManager:(id)a4 handleEvent:(int)a5 context:(id)a6 onInterface:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  switch(a5)
  {
    case 2:
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v21 = [v12 keepAliveV2SupportedOnInterface:a7];
        __int16 v22 = @"NO";
        if (v21) {
          __int16 v22 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v68 = self;
        __int16 v69 = 2112;
        *(void *)id v70 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@: received PCEventPushKeepAlive call back, keepAliveV2SupportedOnInterface: %@",  buf,  0x16u);
      }

      if ([v12 keepAliveV2SupportedOnInterface:a7])
      {
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:PCTimerFireEarlyToCoalesceKey]);
        unsigned int v24 = [v23 BOOLValue];

        if (!v24)
        {
          -[APSCourierConnectionManager _submitKeepAliveFailedAWDonInterface:]( self,  "_submitKeepAliveFailedAWDonInterface:",  a7);
          unsigned int v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for KeepAliveFailed finished",  buf,  0xCu);
          }

          char v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected",  buf,  0xCu);
          }

          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:]( self,  "_linkQualityForInterface:",  a7)));
          +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  a7,  v27,  15LL);
          unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected finished",  buf,  0xCu);
          }

          -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  a7,  0LL,  15LL);
          goto LABEL_79;
        }

        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v68 = self;
          __int16 v69 = 2112;
          *(void *)id v70 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: PCEventPushKeepAlive callback is an early fire from %@",  buf,  0x16u);
        }

        -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  a7,  0LL,  2LL);
      }

      else
      {
        unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = sub_10003CEE4(a7);
          unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          unsigned int v43 = -[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode");
          char v44 = @"NO";
          *(_DWORD *)buf = 138412802;
          v68 = self;
          __int16 v69 = 2112;
          if (v43) {
            char v44 = @"YES";
          }
          *(void *)id v70 = v42;
          *(_WORD *)&v70[8] = 2112;
          *(void *)&v70[10] = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%@: performing keepAlive for interface %@. Should use dual channel? %@",  buf,  0x20u);
        }

        -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  a7,  0LL,  2LL);
        if (!-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode"))
        {
          int64_t v45 = -[APSCourierConnection preferredInterface](self->_courierConnection, "preferredInterface");
          if (v45)
          {
            if (v45 == 1)
            {
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
              if ([v46 isInterfaceHistoricallyUsable])
              {
                unsigned __int8 v47 = -[APSCourierConnectionManager _isWiFiLinkQualityBetter](self, "_isWiFiLinkQualityBetter");

                if ((v47 & 1) == 0)
                {
                  unsigned int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v68 = self;
                    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%@: PCEventPushKeepAlive - we're connected over wifi and wwan is historically usable. Attempting t o switch to WWAN.",  buf,  0xCu);
                  }

                  APSAlert(@"WiFi keepAliveTime-try WWAN");
                  id v18 = self;
                  int64_t v19 = 0LL;
                  goto LABEL_7;
                }
              }

              else
              {
              }
            }
          }

          else if (-[APSCourierConnectionManager _isWiFiLinkQualityBetter](self, "_isWiFiLinkQualityBetter"))
          {
            unint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v68 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%@: PCEventPushKeepAlive - we're connected over wwan but WiFi is better LQ. Attempting to switch to WiFi.",  buf,  0xCu);
            }

            APSAlert(@"WWAN keepAliveTime-try WiFi");
            id v18 = self;
            int64_t v19 = 1LL;
            goto LABEL_7;
          }
        }
      }

      goto LABEL_80;
    case 3:
    case 4:
    case 5:
      double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = sub_10003CEE4(a7);
        uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138412802;
        v68 = self;
        __int16 v69 = 1024;
        *(_DWORD *)id v70 = a5;
        *(_WORD *)&v70[4] = 2112;
        *(void *)&void v70[6] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ handleEvent: %d onInterface %@",  buf,  0x1Cu);
      }

      if (-[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode"))
      {
        -[APSCourierConnectionManager _disconnectStreamForInterface:withReason:]( self,  "_disconnectStreamForInterface:withReason:",  a7,  3LL);
        id v18 = self;
        int64_t v19 = a7;
      }

      else
      {
        -[APSCourierConnectionManager _disconnectAllStreamsWithReason:](self, "_disconnectAllStreamsWithReason:", 3LL);
        int64_t v19 = -[APSCourierConnection nextConnectionAttemptInterface]( self->_courierConnection,  "nextConnectionAttemptInterface");
        id v18 = self;
      }

- (void)courierConnection:(id)a3 disconnectStreamOnInterface:(int64_t)a4 withReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  Class v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_10003CEE4(a4);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    unint64_t v12 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    int v16 = 138413058;
    uint32_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    unsigned int v21 = v11;
    __int16 v22 = 2048;
    unint64_t v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ courierConnection %@ asked us to disconnect stream on interface %@. Connected on %lu interfaces.",  (uint8_t *)&v16,  0x2Au);
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint32_t v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected",  (uint8_t *)&v16,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a4)));
  +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  a4,  v14,  v5);
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint32_t v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected finished",  (uint8_t *)&v16,  0xCu);
  }

  -[APSCourierConnectionManager _disconnectStreamForInterface:withReason:]( self,  "_disconnectStreamForInterface:withReason:",  a4,  v5);
}

- (void)courierConnection:(id)a3 streamEndedOnInterface:(int64_t)a4 withReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  Class v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_10003CEE4(a4);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412802;
    unsigned int v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Stream end encountered for %@ onInterface %@",  buf,  0x20u);
  }

  unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected",  buf,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a4)));
  +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  a4,  v13,  v5);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected finished",  buf,  0xCu);
  }

  -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  a4,  0LL,  v5);
  double v15 = @"wifi";
  if (!a4) {
    double v15 = @"wwan";
  }
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:]( self,  "_linkQualityForInterface:",  a4,  @"Interface",  @"LinkQuality",  v15)));
  v19[1] = v16;
  uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  &v18,  2LL));

  APSPowerLog(@"Connection Stream Ended", v17);
}

- (void)courierConnection:(id)a3 parserErrorMessage:(id)a4 OnInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = sub_10003CEE4(a5);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@: Encoding/decoding error occurred for %@ onInterface %@: %@",  (uint8_t *)&v13,  0x2Au);
  }

  -[APSCourierConnectionManager _disconnectStreamForInterface:withReason:]( self,  "_disconnectStreamForInterface:withReason:",  a5,  6LL);
  -[APSCourierConnectionManager _adjustConnectionWithInterfacePreference:]( self,  "_adjustConnectionWithInterfacePreference:",  a5);
}

- (void)courierConnection:(id)a3 aboutToWriteDataOnConnectedInterface:(int64_t)a4
{
  if ((unint64_t)a4 <= 1)
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008E334;
    v7[3] = &unk_10011FFA0;
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager protocolConnectionForInterface:]( self,  "protocolConnectionForInterface:",  a4));
    id v6 = v8;
    [v6 enumerateStateListeners:v7];
  }

- (void)courierConnection:(id)a3 errorOccured:(id)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 tcpInfoDescription]);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog networking](&OBJC_CLASS___APSLog, "networking"));
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12 && v10 != 0LL)
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog networking](&OBJC_CLASS___APSLog, "networking"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000BFE34();
    }
  }

  __int16 v15 = sub_100077B60(v9);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    __int16 v17 = (void *)v16;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"TLS Error Code=%ld \"%@\",  [v9 code],  v16));

    ++self->_consecutiveTLSConnectionFailureCount;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = sub_10003CEE4(a5);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    __int16 v22 = (void *)v21;
    *(_DWORD *)buf = 138413058;
    if (v18) {
      id v23 = v18;
    }
    else {
      id v23 = v9;
    }
    id v32 = self;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    uint64_t v36 = v21;
    __int16 v37 = 2112;
    id v38 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: Stream error occurred for %@ onInterface %@: %@",  buf,  0x2Au);
  }

  __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected (withError)",  buf,  0xCu);
  }

  +[APSMetricLogger connectionEncounteredSSLError:interface:]( APSMetricLogger,  "connectionEncounteredSSLError:interface:",  +[APSMetricLogger sslErrorFromErrorCode:]( APSMetricLogger,  "sslErrorFromErrorCode:",  [v9 code]),  a5);
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected (withError) finished",  buf,  0xCu);
  }

  if (a5) {
    unint64_t v26 = @"wifi";
  }
  else {
    unint64_t v26 = @"wwan";
  }
  v29[0] = @"Interface";
  v29[1] = @"LinkQuality";
  v30[0] = v26;
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a5)));
  v30[1] = v27;
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));

  APSPowerLog(@"Connection Stream End Error", v28);
  -[APSCourierConnectionManager setConnectionFailure:onInterface:](self, "setConnectionFailure:onInterface:", v9, a5);
  -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  a5,  0LL,  19LL);
}

- (double)currentKeepAliveInterval
{
  return result;
}

- (void)courierConnection:(id)a3 receivedServerBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  networkMonitor = self->_networkMonitor;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 disableCostDrivenDualChannelAttempts]);
  -[APSNetworkMonitor setDisableCostDrivenDualChannelAttempts:]( networkMonitor,  "setDisableCostDrivenDualChannelAttempts:",  v9);

  uint64_t v10 = self->_networkMonitor;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 piggybackDualChannelAttempts]);
  -[APSNetworkMonitor setPiggybackDualChannelAttempts:](v10, "setPiggybackDualChannelAttempts:", v11);

  BOOL v12 = self->_networkMonitor;
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 costDrivenDualChannelAttempts]);
  -[APSNetworkMonitor setCostDrivenDualChannelAttempts:](v12, "setCostDrivenDualChannelAttempts:", v13);

  id v14 = self->_networkMonitor;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 disableDualModePiggybackTimer]);
  -[APSNetworkMonitor setDisableDualModePiggybackTimer:](v14, "setDisableDualModePiggybackTimer:", v15);

  uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 keepAliveV2TimeDriftMaximum]);
  __int16 v17 = v16;
  if (v16)
  {
    -[__CFString doubleValue](v16, "doubleValue");
    self->_keepAliveV2TimeDriftMaximum = v18;
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: keepAliveV2TimeDriftMaximum = %@",  buf,  0x16u);
    }
  }

  id v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 lastIPCachingPercentage]);
  uint64_t v21 = v20;
  if (v20)
  {
    self->_lastIPCachingPercentage = (unint64_t)-[__CFString integerValue](v20, "integerValue");
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@: lastIPCachingPercentage = %@",  buf,  0x16u);
    }
  }

  id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 lastIPCachingTTLMinutesV2]);
  if (v23
    || (id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 lastIPCachingTTLMinutes])) != 0)
  {
    self->_lastIPCachingTTLSeconds = (double)(uint64_t)-[__CFString integerValue](v23, "integerValue") * 60.0;
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@:  lastIPCachingTTLMinutes = %@",  buf,  0x16u);
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 minimumIntervalFallbackEnabled]);
  unint64_t v26 = v25;
  if (v25)
  {
    objc_msgSend(v6, "setMinimumIntervalFallbackEnabled:", objc_msgSend(v25, "BOOLValue"));
    unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = [v26 BOOLValue];
      unint64_t v29 = @"NO";
      if (v28) {
        unint64_t v29 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@: minimumIntervalFallbackEnabled = %@",  buf,  0x16u);
    }
  }

  __int16 v73 = (void *)objc_claimAutoreleasedReturnValue([v7 powerOptimizationsForExpensiveNetworkingDisabled]);
  if (v73)
  {
    id v30 = [v73 BOOLValue];
    [v6 setPowerOptimizationsForExpensiveNetworkingDisabled:v30];
    unint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = @"NO";
      if ((_DWORD)v30) {
        id v32 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%@:  powerOptimizationsForExpensiveNetworkingDisabled = %@",  buf,  0x16u);
    }
  }

  __int16 v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 maxExpensiveConditionsConnectionAttempts]);
  id v34 = v33;
  if (v33)
  {
    objc_msgSend(v6, "setMaxExpensiveConditionsConnectionAttempts:", -[__CFString integerValue](v33, "integerValue"));
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@:  maxExpensiveConditionsConnectionAttempts = %@",  buf,  0x16u);
    }
  }

  __int16 v75 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 expensiveConditionsBackOffInterval]);
  if (v75)
  {
    -[__CFString doubleValue](v75, "doubleValue");
    objc_msgSend(v6, "setExpensiveConditionsBackOffInterval:");
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v75;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@:  expensiveConditionsBackOffInterval = %@",  buf,  0x16u);
    }
  }

  unint64_t v76 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 wifiKeepAliveEarlyFireConstantInterval]);
  if (-[APSCourierConnectionManager isCellularWatch](self, "isCellularWatch")
    && v76
    && (_os_feature_enabled_impl("APS", "CellularWatchNormalKAInterval") & 1) == 0)
  {
    -[__CFString doubleValue](v76, "doubleValue");
    objc_msgSend(v6, "setWifiKeepAliveEarlyFireConstantInterval:");
    __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v76;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%@:  wifiKeepAliveEarlyFireConstantInterval = %@",  buf,  0x16u);
    }
  }

  uint64_t v74 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 delayedReconnectTLSIntervalTrigger]);
  if (v74)
  {
    -[__CFString doubleValue](v74, "doubleValue");
    self->_int64_t delayedReconnectTLSIntervalTrigger = (uint64_t)v38;
    __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%@:  int64_t delayedReconnectTLSIntervalTrigger = %@",  buf,  0x16u);
    }
  }

  v68 = (__CFString *)v34;
  unsigned int v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 delayedReconnectTLSInterval]);
  id v41 = v40;
  if (v40)
  {
    -[__CFString doubleValue](v40, "doubleValue");
    self->_double delayedReconnectTLSInterval = v42;
    unsigned int v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%@:  double delayedReconnectTLSInterval = %@",  buf,  0x16u);
    }
  }

  __int16 v71 = (__CFString *)v17;
  char v44 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 highQualityThresholdConnectedTime]);
  int64_t v45 = v44;
  if (v44)
  {
    connectionHistory = self->_connectionHistory;
    -[__CFString doubleValue](v44, "doubleValue");
    -[APSConnectionHistory setHighQualityThresholdConnectedTime:]( connectionHistory,  "setHighQualityThresholdConnectedTime:");
    unsigned __int8 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%@:  highQualityThresholdConnectedTime = %@",  buf,  0x16u);
    }
  }

  id v70 = (__CFString *)v21;
  unsigned int v48 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 lowQualityThresholdConnectedTime]);
  unsigned int v49 = v48;
  if (v48)
  {
    unint64_t v50 = self->_connectionHistory;
    -[__CFString doubleValue](v48, "doubleValue");
    -[APSConnectionHistory setLowQualityThresholdConnectedTime:](v50, "setLowQualityThresholdConnectedTime:");
    unint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%@:  lowQualityThresholdConnectedTime = %@",  buf,  0x16u);
    }
  }

  v72 = v6;
  int64_t v52 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 suspendToggleHourlyLimit]);
  uint32_t v53 = v52;
  if (v52)
  {
    self->_suspendToggleHourlyLimit = (int64_t)-[__CFString integerValue](v52, "integerValue");
    char v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%@:  suspendToggleHourlyLimit = %@",  buf,  0x16u);
    }
  }

  __int16 v69 = v23;
  unsigned int v55 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 suspendToggleDailyLimit]);
  char v56 = v55;
  if (v55)
  {
    self->_suspendToggleDailyLimit = (int64_t)-[__CFString integerValue](v55, "integerValue");
    unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "%@:  suspendToggleDailyLimit = %@",  buf,  0x16u);
    }
  }

  int v58 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delayedSuspendKeepAliveInterval", v26));
  unsigned int v59 = v58;
  if (v58)
  {
    -[__CFString doubleValue](v58, "doubleValue");
    self->_delayedSuspendKeepAliveInterval = v60;
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%@:  delayedSuspendKeepAliveInterval = %@",  buf,  0x16u);
    }
  }

  uint64_t v62 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 filterMessageTimeout]);
  v63 = v62;
  if (v62)
  {
    -[__CFString doubleValue](v62, "doubleValue");
    if (v64 == 0.0) {
      double v64 = 30.0;
    }
    self->_double filterMessageTimeout = v64;
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v78 = self;
      __int16 v79 = 2112;
      __int16 v80 = v63;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%@:  double filterMessageTimeout = %@", buf, 0x16u);
    }
  }

  id v66 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
  [v66 courierConnectionManager:self receivedServerBag:v7];
}

- (void)courierConnection:(id)a3 hasDeterminedServerHostname:(id)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_10003CEE4(a5);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Connecting to courier %@ with connection: %@ onInterface: %@",  (uint8_t *)&v13,  0x2Au);
  }

  -[APSCourierConnectionManager _startConnectionEstablishTimerOnInterface:]( self,  "_startConnectionEstablishTimerOnInterface:",  a5);
}

- (void)courierConnectionHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 secureHandshakeEnabled:(BOOL)a6 onInterface:(int64_t)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 serverHostnameForInterface:a7]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 serverIPAddressForInterface:a7]);
    if (v9) {
      __int16 v17 = @"YES";
    }
    else {
      __int16 v17 = @"NO";
    }
    unsigned int v27 = v8;
    if ((_DWORD)v8) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    id v19 = sub_10003CEE4(a7);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138413826;
    unint64_t v29 = self;
    __int16 v30 = 2112;
    unint64_t v31 = v15;
    __int16 v32 = 2112;
    __int16 v33 = v16;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    __int16 v37 = v17;
    __int16 v38 = 2112;
    __int16 v39 = v18;
    uint64_t v8 = v27;
    __int16 v40 = 2112;
    id v41 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Connected to courier %@ (%@) connection: %@ usingPackedFormat %@ secureHandshakeEnabled %@ onInterface: %@",  buf,  0x48u);
  }

  -[APSCourierConnectionManager setConnectionStatistics:onInterface:]( self,  "setConnectionStatistics:onInterface:",  v13,  a7);
  self->_secureHandshakeEnabled[a7] = v8;
  uint64_t v21 = objc_alloc_init(&OBJC_CLASS___APSCourierConnectionProtocolConnection);
  -[APSCourierConnectionProtocolConnection setConnectionManager:](v21, "setConnectionManager:", self);
  -[APSCourierConnectionProtocolConnection setInterface:](v21, "setInterface:", a7);
  -[APSCourierConnectionProtocolConnection setSecureHandshakeEnabled:](v21, "setSecureHandshakeEnabled:", v8);
  __int16 v22 = &(&self->super.isa)[a7];
  Class v23 = v22[12];
  v22[12] = (Class)v21;
  __int16 v24 = v21;

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
  [v25 courierConnectionManager:self openedNewProtocolConnection:v24];

  -[APSCourierConnectionManager clearConsecutiveConnectionFailureReasonOnInterface:]( self,  "clearConsecutiveConnectionFailureReasonOnInterface:",  a7);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

  -[APSCourierConnectionManager setConnectionTime:forInterface:](self, "setConnectionTime:forInterface:", v26, a7);
}

- (void)courierConnection:(id)a3 keepAliveResponseTimerFiredOnInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_10003CEE4(a4);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unint64_t v10 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentLinkQualityString]);
    int v18 = 138413058;
    id v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = v10;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Keep-alive response timer fired onInterface %@. Keep-alive failed. Connected on %lu interfaces. Current link quality: %@",  (uint8_t *)&v18,  0x2Au);
  }

  -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:]( self,  "_clearKeepAliveResponseTimerOnInterface:",  a4);
  unsigned __int8 v13 = [v6 keepAliveV2SupportedOnInterface:a4];

  if ((v13 & 1) == 0)
  {
    -[APSCourierConnectionManager _submitKeepAliveFailedAWDonInterface:]( self,  "_submitKeepAliveFailedAWDonInterface:",  a4);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for KeepAliveFailed finished",  (uint8_t *)&v18,  0xCu);
    }
  }

  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected",  (uint8_t *)&v18,  0xCu);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a4)));
  +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  a4,  v16,  16LL);
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected finished",  (uint8_t *)&v18,  0xCu);
  }

  -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  a4,  0LL,  16LL);
}

- (void)courierConnection:(id)a3 connectionEstablishTimerFiredOnInterface:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name", a3));
  id v7 = sub_10003CEE4(a4);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v7);
  APSAlert(@"Didn't connect in time. %@ %@");

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", v6, v17));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_10003CEE4(a4);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    unint64_t v11 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentLinkQualityString]);
    *(_DWORD *)buf = 138413058;
    id v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    unint64_t v23 = v11;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Connection establish timer fired. Connection failed onInterface %@. Connected on %lu interfaces. Current link quality: %@",  buf,  0x2Au);
  }

  -[APSCourierConnectionManager _clearConnectionEstablishTimerOnInterface:]( self,  "_clearConnectionEstablishTimerOnInterface:",  a4);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected",  buf,  0xCu);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a4)));
  +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  a4,  v15,  17LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected finished",  buf,  0xCu);
  }

  -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  a4,  0LL,  17LL);
}

- (void)courierConnection:(id)a3 failedToForceKeepAliveProxyOnInterface:(int64_t)a4
{
}

- (void)courierConnection:(id)a3 failedToObtainKeepAliveProxyOnInterface:(int64_t)a4
{
}

- (void)courierConnection:(id)a3 failedToFindKeepAliveProxyOnInterface:(int64_t)a4
{
}

- (void)_handleKeepAliveAckMessage:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_10003CEE4(a4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v19 = 138412802;
    __int16 v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Received successful keep-alive ack on interface %@: %@",  (uint8_t *)&v19,  0x20u);
  }

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnection objectForKey:onInterface:]( self->_courierConnection,  "objectForKey:onInterface:",  @"keepAliveSent",  a4));
  if (v11) {
    [v10 timeIntervalSinceDate:v11];
  }
  else {
    double v12 = 0.0;
  }
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  v13,  @"keepAliveAckTime",  a4);
  -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:]( self,  "_clearKeepAliveResponseTimerOnInterface:",  a4);
  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", a4))
  {
    if (a4 == 1)
    {
      networkMonitor = self->_networkMonitor;
      -[APSCourierConnection currentKeepAliveIntervalOnInterface:]( self->_courierConnection,  "currentKeepAliveIntervalOnInterface:",  1LL);
      -[APSNetworkMonitor setCurrentWiFiKeepAliveInterval:growAttempts:]( networkMonitor,  "setCurrentWiFiKeepAliveInterval:growAttempts:",  -[APSCourierConnection countOfGrowthActionsOnInterface:]( self->_courierConnection,  "countOfGrowthActionsOnInterface:",  1LL),  v15);
    }
  }

  else
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = sub_10003CEE4(a4);
      int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v19 = 138412546;
      __int16 v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ received keepAlive for interface %@ that is no longer connected, ignoring.",  (uint8_t *)&v19,  0x16u);
    }
  }
}

- (unint64_t)courierConnection:(id)a3 dataReceived:(id)a4 onInterface:(int64_t)a5 withGeneration:(unint64_t)a6 isWakingMessage:(BOOL)a7
{
  BOOL v110 = a7;
  id v107 = a3;
  id v10 = a4;
  unint64_t v113 = a5;
  id v11 = sub_10003CEE4(a5);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APSCourier(tcpStream:dataReceived:)-%@",  v12));

  v104 = -[APSPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:holdDuration:",  v106,  202LL,  2.0);
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 length];
    id v15 = sub_10003CEE4(a5);
    id v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(v15);
    unint64_t v17 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    id v162 = v14;
    __int16 v163 = 2112;
    v164 = v16;
    __int16 v165 = 2048;
    unint64_t v166 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Outstanding data received: %@ (length %lu) onInterface: %@. Connected on %lu interfaces.",  buf,  0x34u);
  }

  unint64_t v18 = 0LL;
  do
  {
    char v156 = 0;
    id v154 = 0LL;
    v155 = 0LL;
    unsigned int v19 = -[APSCourierConnection parseMessage:parameters:isInvalid:lengthParsed:onInterface:]( self->_courierConnection,  "parseMessage:parameters:isInvalid:lengthParsed:onInterface:",  v10,  &v154,  &v156,  &v155,  v113);
    id v20 = v154;
    v18 += (unint64_t)v155;
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = "no";
      if (v19) {
        __int16 v23 = "yes";
      }
      else {
        __int16 v23 = "no";
      }
      if (v156) {
        __int16 v22 = "yes";
      }
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2080;
      id v162 = (id)v22;
      __int16 v163 = 2048;
      v164 = v155;
      __int16 v165 = 2112;
      unint64_t v166 = (unint64_t)v20;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: Stream processing: complete %s, invalid %s, length parsed %lu, parameters %@",  buf,  0x34u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager protocolConnectionForInterface:]( self,  "protocolConnectionForInterface:",  v113));
    if (v19)
    {
      uint64_t v150 = 0LL;
      v151 = &v150;
      uint64_t v152 = 0x2020000000LL;
      char v153 = 0;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolCommand"]);
      unsigned int v26 = [v25 intValue];

      switch(v26)
      {
        case 1u:
        case 8u:
          char v111 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolServerTime"]);
          if (v111)
          {
            [v111 doubleValue];
            unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  v27 / 1000.0));
            unint64_t v29 = v28;
            if (&_TMSetAuthenticatedSourceTime)
            {
              uint64_t v30 = type metadata for ;
              if (type metadata for )
              {
                [v28 timeIntervalSinceReferenceDate];
                TMSetAuthenticatedSourceTime(v30);
              }
            }

            unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager serverTimeTracker](self, "serverTimeTracker"));
            objc_msgSend(v31, "updateServerTimeWithTimeInMilliseconds:", objc_msgSend(v111, "unsignedLongLongValue"));
          }

          *((void *)&v112 + 1) = objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolMessageSize"]);
          *(void *)&__int128 v112 = objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolLargeMessageSize"]);
          -[APSCourierConnectionManager setMaxMessageSize:forInterface:]( self,  "setMaxMessageSize:forInterface:",  *((void *)&v112 + 1),  v113);
          -[APSCourierConnectionManager setMaxLargeMessageSize:forInterface:]( self,  "setMaxLargeMessageSize:forInterface:",  (void)v112,  v113);
          if (v112 != 0)
          {
            __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = *((void *)&v112 + 1);
              *(_WORD *)&buf[22] = 2112;
              id v162 = (id)v112;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@: Received message sizes {standard: %@, large: %@}",  buf,  0x20u);
            }
          }

          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolMinKeepAliveInterval"]);
          __int16 v34 = (NSNumber *)[v33 copy];
          serverMinKeepAliveInterval = self->_serverMinKeepAliveInterval;
          self->_serverMinKeepAliveInterval = v34;

          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolExpectedKeepAliveInterval"]);
          __int16 v37 = (NSNumber *)[v36 copy];
          serverExpectedKeepAliveInterval = self->_serverExpectedKeepAliveInterval;
          self->_serverExpectedKeepAliveInterval = v37;

          __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolMaxKeepAliveInterval"]);
          __int16 v40 = (NSNumber *)[v39 copy];
          serverMaxKeepAliveInterval = self->_serverMaxKeepAliveInterval;
          self->_serverMaxKeepAliveInterval = v40;

          double v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v108 = v10;
            unsigned int v43 = self->_serverExpectedKeepAliveInterval;
            char v44 = self->_serverMinKeepAliveInterval;
            int64_t v45 = self->_serverMaxKeepAliveInterval;
            id v46 = sub_10003CEE4(v113);
            unsigned __int8 v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v44;
            *(_WORD *)&buf[22] = 2112;
            id v162 = v43;
            __int16 v163 = 2112;
            v164 = v45;
            __int16 v165 = 2112;
            unint64_t v166 = (unint64_t)v47;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%@: Setting server keep alive stats. {Min: %@, Expected: %@, Max: %@, Interface:%@}",  buf,  0x34u);

            id v10 = v108;
          }

          id v109 = (NSString *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolGeoRegion"]);
          if (v109 != self->_latestGeoRegion)
          {
            unsigned int v48 = (NSString *)-[NSString copy](v109, "copy");
            latestGeoRegion = self->_latestGeoRegion;
            self->_latestGeoRegion = v48;
          }

          unsigned int v50 = -[APSCourierConnectionManager _handleRedirectMessage:onInterface:]( self,  "_handleRedirectMessage:onInterface:",  v20,  v113);
          [v107 clearConnectionEstablishTimerOnInterface:v113];
          unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager outgoingConnectMessageQueue]( self,  "outgoingConnectMessageQueue"));
          id v52 = sub_10003CEE4(v113);
          uint32_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
          if (v50) {
            id v54 = 0LL;
          }
          else {
            id v54 = v20;
          }
          [v51 handleResponseForPendingItem:v54 error:0 onInterface:v53];

          *((_BYTE *)v151 + 24) = 1;
          unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolDualChannelSupport"]);
          id v56 = [v55 BOOLValue];

          unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            int v58 = @"NO";
            if ((_DWORD)v56) {
              int v58 = @"YES";
            }
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v58;
            _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "%@: Setting dualChannelSupport: %@",  buf,  0x16u);
          }

          unsigned int v59 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager networkMonitor](self, "networkMonitor"));
          [v59 setServerSupportsDualMode:v56];

          self->_unint64_t consecutiveConnectionFailureCount = 0LL;
          self->_consecutiveTLSConnectionFailureCount = 0LL;
          if ((v50 & 1) == 0)
          {
            if (!self->_symptomReporter)
            {
              double v60 = objc_alloc_init(&OBJC_CLASS___APSSymptomReporter);
              symptomReporter = self->_symptomReporter;
              self->_symptomReporter = v60;
            }

            uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"APSProtocolClientIPAddress"]);
            id v63 = [v62 copy];

            double v64 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
            id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 interfaceNameForInterface:v113]);

            -[APSSymptomReporter reportConnectionSuccessOnConnectionType:]( self->_symptomReporter,  "reportConnectionSuccessOnConnectionType:",  v113 != 0);
            if (v63) {
              -[APSSymptomReporter reportClientIPAddress:forInterfaceOfName:]( self->_symptomReporter,  "reportClientIPAddress:forInterfaceOfName:",  v63,  v65);
            }
          }

          goto LABEL_76;
        case 3u:
        case 0xAu:
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000LL;
          LOBYTE(v162) = 0;
          v140[0] = _NSConcreteStackBlock;
          v140[1] = 3221225472LL;
          v140[2] = sub_100091138;
          v140[3] = &unk_100120038;
          id v70 = v20;
          id v141 = v70;
          id v71 = v24;
          unint64_t v144 = a6;
          BOOL v145 = v110;
          id v142 = v71;
          v143 = buf;
          [v71 enumerateDataRecipient:v140];
          if (!*(_BYTE *)(*(void *)&buf[8] + 24LL))
          {
            v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v157 = 138412546;
              v158 = self;
              __int16 v159 = 2048;
              uint64_t v160 = 2LL;
              _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "%@: Sending acknowledgement message with response %ld",  v157,  0x16u);
            }

            __int16 v73 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKey:@"APSProtocolToken"]);
            uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKey:@"APSProtocolMessageID"]);
            -[APSCourierConnectionManager sendMessageAcknowledgeMessageWithResponse:messageId:token:onInterface:]( self,  "sendMessageAcknowledgeMessageWithResponse:messageId:token:onInterface:",  2LL,  v74,  v73,  v113);
          }

          *((_BYTE *)v151 + 24) = 1;
          -[APSCourierConnectionManager notePush](self, "notePush");

          _Block_object_dispose(buf, 8);
          -[APSCourierConnectionManager _resetKeepAliveOnInterface:](self, "_resetKeepAliveOnInterface:", v113);
          goto LABEL_76;
        case 6u:
        case 0xDu:
          -[APSCourierConnectionManager _handleKeepAliveResponseMessage:onInterface:didWake:]( self,  "_handleKeepAliveResponseMessage:onInterface:didWake:",  v20,  v113,  v110);
          goto LABEL_75;
        case 7u:
          v146[0] = _NSConcreteStackBlock;
          v146[1] = 3221225472LL;
          v146[2] = sub_100091100;
          v146[3] = &unk_100120010;
          id v95 = v24;
          id v147 = v95;
          id v148 = v20;
          v149 = &v150;
          [v95 enumerateDataRecipient:v146];

          goto LABEL_76;
        case 9u:
          unint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "Received filter message response.",  buf,  2u);
          }

          -[APSCourierConnectionManager _clearFilterMessageTimerOnInterface:]( self,  "_clearFilterMessageTimerOnInterface:",  v113);
          id v88 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingFilterQueue](self, "outgoingFilterQueue"));
          id v89 = sub_10003CEE4(v113);
          v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
          [v88 handleResponseForPendingItem:v20 error:0 onInterface:v90];

          goto LABEL_75;
        case 0xBu:
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingSendMessageQueue](self, "outgoingSendMessageQueue"));
          id v82 = sub_10003CEE4(v113);
          id v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          [v81 handleResponseForPendingItem:v20 error:0 onInterface:v83];

          goto LABEL_75;
        case 0xFu:
          -[APSCourierConnectionManager _handleFlushMessage:onInterface:]( self,  "_handleFlushMessage:onInterface:",  v20,  v113);
          goto LABEL_75;
        case 0x10u:
          __int16 v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "%@: Received flush response.",  buf,  0xCu);
          }

          goto LABEL_75;
        case 0x12u:
          __int16 v75 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager tokenGenerateResponseQueue](self, "tokenGenerateResponseQueue"));
          id v76 = sub_10003CEE4(v113);
          __int16 v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
          [v75 handleResponseForPendingItem:v20 error:0 onInterface:v77];

          goto LABEL_75;
        case 0x16u:
          -[APSCourierConnectionManager _handleKeepAliveAckMessage:onInterface:]( self,  "_handleKeepAliveAckMessage:onInterface:",  v20,  v113);
          goto LABEL_75;
        case 0x17u:
          -[APSCourierConnectionManager _handleRedirectMessage:onInterface:]( self,  "_handleRedirectMessage:onInterface:",  v20,  v113);
          goto LABEL_75;
        case 0x18u:
          v136[0] = _NSConcreteStackBlock;
          v136[1] = 3221225472LL;
          v136[2] = sub_1000911A0;
          v136[3] = &unk_100120010;
          id v84 = v24;
          id v137 = v84;
          id v138 = v20;
          v139 = &v150;
          [v84 enumerateDataRecipient:v136];

          goto LABEL_76;
        case 0x19u:
          v132[0] = _NSConcreteStackBlock;
          v132[1] = 3221225472LL;
          v132[2] = sub_1000911D8;
          v132[3] = &unk_100120010;
          id v86 = v24;
          id v133 = v86;
          id v134 = v20;
          v135 = &v150;
          [v86 enumerateDataRecipient:v132];

          goto LABEL_76;
        case 0x1Du:
          v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "Received pubsub subscription response",  buf,  2u);
          }

          v128[0] = _NSConcreteStackBlock;
          v128[1] = 3221225472LL;
          v128[2] = sub_100091210;
          v128[3] = &unk_100120010;
          id v129 = v20;
          id v130 = v24;
          __int16 v131 = &v150;
          [v130 enumerateDataRecipient:v128];

          goto LABEL_76;
        case 0x1Eu:
          v124[0] = _NSConcreteStackBlock;
          v124[1] = 3221225472LL;
          v124[2] = sub_100091270;
          v124[3] = &unk_100120010;
          id v125 = v20;
          id v126 = v24;
          __int16 v127 = &v150;
          [v126 enumerateDataRecipient:v124];

          goto LABEL_76;
        case 0x20u:
          id v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEFAULT,  "Received presence tracking response.",  buf,  2u);
          }

          v120[0] = _NSConcreteStackBlock;
          v120[1] = 3221225472LL;
          v120[2] = sub_1000912D0;
          v120[3] = &unk_100120010;
          id v97 = v24;
          id v121 = v97;
          id v122 = v20;
          v123 = &v150;
          [v97 enumerateDataRecipient:v120];

          goto LABEL_76;
        case 0x21u:
          __int16 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Received server initiated filter update request.",  buf,  2u);
          }

          v116[0] = _NSConcreteStackBlock;
          v116[1] = 3221225472LL;
          v116[2] = sub_100091308;
          v116[3] = &unk_100120010;
          id v79 = v24;
          id v117 = v79;
          id v118 = v20;
          v119 = &v150;
          [v79 enumerateDataRecipient:v116];

          goto LABEL_76;
        case 0x22u:
          -[APSCourierConnectionManager _handleDelayKeepAliveCancelMessageOnInterface:]( self,  "_handleDelayKeepAliveCancelMessageOnInterface:",  v113);
LABEL_75:
          *((_BYTE *)v151 + 24) = 1;
LABEL_76:
          if (!*((_BYTE *)v151 + 24))
          {
            BOOL v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              id v98 = sub_10003CEE4(v113);
              uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v20;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v99;
              _os_log_error_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "Incoming message was not handled! {parameters: %@, interface: %@}",  buf,  0x16u);
            }
          }

          _Block_object_dispose(&v150, 8);
          break;
        default:
          id v100 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"missing protocol command enum",  0LL));
          objc_exception_throw(v100);
          __break(1u);
          JUMPOUT(0x100090E3CLL);
      }
    }

    else if (v156)
    {
      id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_FAULT,  "%@: Received invalid message data: %@",  buf,  0x16u);
      }

      BOOL v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for ConnectionDisconnected",  buf,  0xCu);
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:]( self,  "_linkQualityForInterface:",  v113)));
      +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  v113,  v68,  18LL);
      __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for ConnectionDisconnected finished",  buf,  0xCu);
      }

      -[APSCourierConnectionManager _handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:]( self,  "_handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  v113,  0LL,  18LL);
    }

    v92 = v155;
    if (v155)
    {
      v93 = (char *)[v10 length];
      uint64_t v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subdataWithRange:", v92, v93 - (char *)v155));

      id v10 = (id)v94;
    }
  }

  while ((v19 & 1) != 0);
  dispatch_time_t v101 = dispatch_time(0LL, 2000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = nullsub_5;
  block[3] = &unk_10011E4F0;
  v115 = v104;
  v102 = v104;
  dispatch_after(v101, &_dispatch_main_q, block);

  return v18;
}

- (id)consecutiveConnectionFailureReasonOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_consecutiveConnectionFailureReason[a3];
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10003CEE4(a3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    double v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to return consecutiveConnectionFailureReason on invalid interface %@",  (uint8_t *)&v9,  0x16u);
  }

  return 0LL;
}

- (void)setConnectionFailure:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 2)
  {
    consecutiveConnectionFailureReason = self->_consecutiveConnectionFailureReason;
    __int16 v11 = consecutiveConnectionFailureReason[a4];
    if (!v11)
    {
      double v12 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
      unsigned __int8 v13 = consecutiveConnectionFailureReason[a4];
      consecutiveConnectionFailureReason[a4] = v12;

      __int16 v11 = consecutiveConnectionFailureReason[a4];
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
    -[NSCountedSet addObject:](v11, "addObject:", v14);
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_10003CEE4(a4);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v15 = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ asked to add error %@ to consecutiveConnectionFailureReason on invalid interface %@",  (uint8_t *)&v15,  0x20u);
    }
  }
}

- (void)clearConsecutiveConnectionFailureReasonOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    id v8 = &(&self->super.isa)[a3];
    Class v9 = v8[8];
    v8[8] = 0LL;
  }

  else
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_10003CEE4(a3);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v10 = 138412546;
      __int16 v11 = self;
      __int16 v12 = 2112;
      unsigned __int8 v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to clear consecutiveConnectionFailureReason on invalid interface %@",  (uint8_t *)&v10,  0x16u);
    }
  }

- (BOOL)_handleRedirectMessage:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolServerMetadata"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolRedirectReason"]);

  if (v7)
  {
    Class v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      unsigned __int8 v13 = self;
      __int16 v14 = 2112;
      int v15 = v7;
      __int16 v16 = 2112;
      __int16 v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Received courier redirect host '%@' with reason: '%@'",  (uint8_t *)&v12,  0x20u);
    }

    -[APSCourierConnection setUsingCachedIPAddress:onInterface:]( self->_courierConnection,  "setUsingCachedIPAddress:onInterface:",  0LL,  a4);
    -[APSCourierConnection setRedirectHost:](self->_courierConnection, "setRedirectHost:", v7);
    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a4)));
    +[APSMetricLogger connectionDisconnected:linkQuality:reason:]( &OBJC_CLASS___APSMetricLogger,  "connectionDisconnected:linkQuality:reason:",  a4,  v10,  9LL);
    -[APSCourierConnectionManager _disconnectStreamForInterface:withReason:]( self,  "_disconnectStreamForInterface:withReason:",  a4,  9LL);
    -[APSCourierConnection incrementRedirectCount](self->_courierConnection, "incrementRedirectCount");
    -[APSCourierConnectionManager _adjustConnectionWithInterfacePreference:]( self,  "_adjustConnectionWithInterfacePreference:",  a4);
    -[APSCourierConnection setRedirectHost:](self->_courierConnection, "setRedirectHost:", 0LL);
  }

  return v7 != 0LL;
}

- (void)_submitKeepAliveFailedAWDonInterface:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for KeepAliveFailed",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for KeepAliveFailed returned",  (uint8_t *)&v7,  0xCu);
  }

  -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  0LL,  @"keepAliveSent",  a3);
  -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  0LL,  @"keepAliveAckTime",  a3);
}

- (void)setConnectionStatistics:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 2)
  {
    int v10 = &(&self->super.isa)[a4];
    Class v11 = v10[3];
    v10[3] = 0LL;

    Class v12 = v10[5];
    v10[5] = 0LL;

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"tcp_handshake"]);
    __int16 v14 = (objc_class *)[v13 copy];
    Class v15 = v10[1];
    v10[1] = v14;

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"dns"]);
    __int16 v17 = (objc_class *)[v16 copy];
    Class v18 = v10[3];
    v10[3] = v17;

    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"tls"]);
    __int16 v19 = (objc_class *)[v7 copy];
    Class v20 = v10[5];
    v10[5] = v19;
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_10003CEE4(a4);
      Class v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v21 = 138412802;
      __int16 v22 = self;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      unsigned int v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "%@ asked to add connection statictis %@ on invalid interface %@",  (uint8_t *)&v21,  0x20u);
    }
  }
}

- (void)_handleConnectionSuspendedOnInterface:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    if (!-[APSCourierConnection isSuspendedOnInterface:](self->_courierConnection, "isSuspendedOnInterface:"))
    {
      -[APSCourierConnectionManager _clearPostSuspensionFlushState](self, "_clearPostSuspensionFlushState");
      -[APSCourierConnection setIsSuspended:onInterface:]( self->_courierConnection,  "setIsSuspended:onInterface:",  1LL,  0LL);
      -[APSCourierConnection setIsConnected:onInterface:withDisconnectReason:]( self->_courierConnection,  "setIsConnected:onInterface:withDisconnectReason:",  0LL,  0LL,  1030LL);
      -[APSCourierConnection stopManagerOnInterface:](self->_courierConnection, "stopManagerOnInterface:", 0LL);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100091BEC;
      v7[3] = &unk_10011FFA0;
      id v8 = (id)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager protocolConnectionForInterface:]( self,  "protocolConnectionForInterface:",  0LL));
      id v6 = v8;
      [v6 enumerateStateListeners:v7];
    }
  }

- (void)_handleConnectionRecoverFromSuspensionOnInterface:(int64_t)a3
{
  if (!a3 && -[APSCourierConnection isSuspendedOnInterface:](self->_courierConnection, "isSuspendedOnInterface:"))
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Cellular interface is recovering from suspension",  (uint8_t *)&v16,  2u);
    }

    -[APSCourierConnection setIsSuspended:onInterface:]( self->_courierConnection,  "setIsSuspended:onInterface:",  0LL,  0LL);
    -[APSCourierConnection setIsConnected:onInterface:]( self->_courierConnection,  "setIsConnected:onInterface:",  1LL,  0LL);
    if (self->_delayedSuspendKeepAliveInterval <= 0.0) {
      goto LABEL_9;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager hourlySuspendToggleRateLimiter](self, "hourlySuspendToggleRateLimiter"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager dailySuspendToggleRateLimiter](self, "dailySuspendToggleRateLimiter"));
    if ([v5 isUnderLimit] && (objc_msgSend(v6, "isUnderLimit") & 1) != 0)
    {
      [v5 note];
      [v6 note];

LABEL_9:
      -[APSCourierConnectionManager _handleConnectionAfterSuspensionRecoveryOnInterface:withKeepAlive:]( self,  "_handleConnectionAfterSuspensionRecoveryOnInterface:withKeepAlive:",  0LL,  1LL);
      return;
    }

    self->_pendingPostSuspensionWWANFlush = 1;
    int v7 = objc_alloc(&OBJC_CLASS___PCPersistentTimer);
    double delayedSuspendKeepAliveInterval = self->_delayedSuspendKeepAliveInterval;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    uint64_t v10 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( v7,  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  @"APSCourier",  self,  "_delayedSuspendKeepAliveTimerFired:",  v9,  delayedSuspendKeepAliveInterval);
    delayedSuspendKeepAliveTimer = self->_delayedSuspendKeepAliveTimer;
    self->_delayedSuspendKeepAliveTimer = v10;

    -[PCPersistentTimer setMinimumEarlyFireProportion:]( self->_delayedSuspendKeepAliveTimer,  "setMinimumEarlyFireProportion:",  1.0);
    Class v12 = self->_delayedSuspendKeepAliveTimer;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    -[PCPersistentTimer scheduleInRunLoop:](v12, "scheduleInRunLoop:", v13);

    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = self->_delayedSuspendKeepAliveInterval;
      int v16 = 138413058;
      __int16 v17 = self;
      __int16 v18 = 2048;
      double v19 = v15;
      __int16 v20 = 2112;
      int v21 = v5;
      __int16 v22 = 2112;
      __int16 v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ cellular interface suspension toggles are over the limit! {delay: %f, hourly: %@, daily: %@}",  (uint8_t *)&v16,  0x2Au);
    }
  }

- (void)_delayedSuspendKeepAliveTimerFired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: _delayedSuspendKeepAliveTimerFired! Connecting now.",  (uint8_t *)&v8,  0xCu);
  }

  -[APSCourierConnectionManager _clearPostSuspensionFlushState](self, "_clearPostSuspensionFlushState");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  id v7 = [v6 integerValue];
  -[APSCourierConnectionManager _handleConnectionAfterSuspensionRecoveryOnInterface:withKeepAlive:]( self,  "_handleConnectionAfterSuspensionRecoveryOnInterface:withKeepAlive:",  v7,  1LL);
}

- (void)_handleConnectionAfterSuspensionRecoveryOnInterface:(int64_t)a3 withKeepAlive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"NO";
    if (v4) {
      int v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v13 = self;
    __int16 v14 = 2112;
    double v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: _handleConnectionAfterSuspensionRecoveryOnInterface {withKeepAlive: %@}",  buf,  0x16u);
  }

  if (-[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces") >= 2) {
    -[APSNetworkMonitor openedSecondChannel](self->_networkMonitor, "openedSecondChannel");
  }
  if (v4) {
    -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  a3,  0LL,  2LL);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000920D4;
  v10[3] = &unk_10011FFA0;
  id v11 = (id)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager protocolConnectionForInterface:]( self,  "protocolConnectionForInterface:",  a3));
  id v9 = v11;
  [v9 enumerateStateListeners:v10];
}

- (void)_resetServerKeepAliveStatsOnInterface:(int64_t)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[APSCourierConnectionManager _adjustConnection](self, "_adjustConnection");
  }

- (void)_invokeInFailureHandlingContext:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  -[APSCourierConnectionManager setHandlingFailure:](self, "setHandlingFailure:", 1LL);
  if (v4) {
    v4[2]();
  }
  -[APSCourierConnectionManager setHandlingFailure:](self, "setHandlingFailure:", 0LL);
}

- (void)_performFlushWithPaddingLength:(unint64_t)a3
{
  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", 1LL))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_10003CEE4(1uLL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v11 = 138412802;
      Class v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2112;
      int v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ Sending flush message with padding length %lu  onInterface %@",  (uint8_t *)&v11,  0x20u);
    }

    -[APSCourierConnection sendFlushMessageWithWantPaddingLength:paddingLength:onInterface:]( self->_courierConnection,  "sendFlushMessageWithWantPaddingLength:paddingLength:onInterface:",  a3,  a3,  1LL);
  }

  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", 0LL))
  {
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = sub_10003CEE4(0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412802;
      Class v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2112;
      int v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Sending flush message with padding length %lu  onInterface %@",  (uint8_t *)&v11,  0x20u);
    }

    -[APSCourierConnection sendFlushMessageWithWantPaddingLength:paddingLength:onInterface:]( self->_courierConnection,  "sendFlushMessageWithWantPaddingLength:paddingLength:onInterface:",  a3,  a3,  0LL);
  }

- (void)_handleFlushMessage:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolFlushWantPadding"]);
  id v8 = [v7 unsignedIntegerValue];

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_10003CEE4(a4);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v13 = 138413058;
    unint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2048;
    id v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Received flush message %@ with paddingLength %lu onInterface: %@",  (uint8_t *)&v13,  0x2Au);
  }

  if (v8)
  {
    Class v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      unint64_t v14 = self;
      __int16 v15 = 2048;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ Sending flush response message with padding length %lu",  (uint8_t *)&v13,  0x16u);
    }

    -[APSCourierConnection sendFlushResponseMessageWithPaddingLength:onInterface:]( self->_courierConnection,  "sendFlushResponseMessageWithPaddingLength:onInterface:",  v8,  a4);
  }
}

- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3
{
}

- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3 withDelay:(double)a4
{
  if (a3 < 2)
  {
    double v9 = a4;
    delayedKeepAlivePowerAssertion = self->_delayedKeepAlivePowerAssertion;
    if (delayedKeepAlivePowerAssertion)
    {
      self->_delayedKeepAlivePowerAssertion = 0LL;
    }

    uint64_t v11 = APSBundleIdentifier;
    Class v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
    id v13 = sub_10003CEE4(a3);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-delayed-keepalive-%@-%@",  v11,  v12,  v14));

    __int16 v15 = -[APSPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:holdDuration:",  v19,  203LL,  60.0);
    id v16 = self->_delayedKeepAlivePowerAssertion;
    self->_delayedKeepAlivePowerAssertion = v15;

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__delayedPerformKeepAliveOnInterface:",  v17);

    if (v9 <= 0.0) {
      double v9 = 2.0;
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[APSCourierConnectionManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "__delayedPerformKeepAliveOnInterface:",  v18,  v9);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = sub_10003CEE4(a3);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138412546;
      int v21 = self;
      __int16 v22 = 2112;
      __int16 v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ asked to perform delayed keep alive with invalid interface %@",  buf,  0x16u);
    }
  }

- (void)__delayedPerformKeepAliveOnInterface:(id)a3
{
  id v4 = [a3 integerValue];
  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", v4)) {
    -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  v4,  0LL,  2LL);
  }
  delayedKeepAlivePowerAssertion = self->_delayedKeepAlivePowerAssertion;
  self->_delayedKeepAlivePowerAssertion = 0LL;
}

- (void)_handleDelayKeepAliveCancelMessageOnInterface:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received cancel keep alive command. Canceling delayed keep alive timer and requesting keep alive now.",  v8,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__delayedPerformKeepAliveOnInterface:",  v6);

  if (self->_delayedKeepAlivePowerAssertion)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[APSCourierConnectionManager __delayedPerformKeepAliveOnInterface:]( self,  "__delayedPerformKeepAliveOnInterface:",  v7);
  }

- (void)_performKeepAliveOnInterface:(int64_t)a3 shortInterval:(BOOL)a4 withAction:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:"))
  {
    -[APSConnectionHistory adjustQualityOfConnectionOnInterface:]( self->_connectionHistory,  "adjustQualityOfConnectionOnInterface:",  a3);
    BOOL v9 = -[APSCourierConnectionManager useServerKeepAliveStatsOnInterface:]( self,  "useServerKeepAliveStatsOnInterface:",  a3);
    if (v9)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ using server stats for keep alive interval",  buf,  0xCu);
      }

      courierConnection = self->_courierConnection;
      -[NSNumber doubleValue](self->_serverMaxKeepAliveInterval, "doubleValue");
      -[APSCourierConnection setServerStatsMaxKeepAlive:onInterface:]( courierConnection,  "setServerStatsMaxKeepAlive:onInterface:",  a3);
      Class v12 = self->_courierConnection;
      -[NSNumber doubleValue](self->_serverMinKeepAliveInterval, "doubleValue");
      -[APSCourierConnection setServerStatsMinKeepAlive:onInterface:]( v12,  "setServerStatsMinKeepAlive:onInterface:",  a3);
      id v13 = self->_courierConnection;
      -[NSNumber doubleValue](self->_serverExpectedKeepAliveInterval, "doubleValue");
      -[APSCourierConnection setServerStatsExpectedKeepAlive:onInterface:]( v13,  "setServerStatsExpectedKeepAlive:onInterface:",  a3);
      -[APSCourierConnection setUsingServerStatsAggressively:onInterface:]( self->_courierConnection,  "setUsingServerStatsAggressively:onInterface:",  (id)-[APSConnectionHistory connectionQualityOnInterface:]( self->_connectionHistory,  "connectionQualityOnInterface:",  a3) == (id)2,  a3);
    }

    else
    {
      -[APSCourierConnectionManager _resetServerKeepAliveStatsOnInterface:]( self,  "_resetServerKeepAliveStatsOnInterface:",  a3);
    }

    -[APSCourierConnection currentKeepAliveIntervalOnInterface:]( self->_courierConnection,  "currentKeepAliveIntervalOnInterface:",  a3);
    unint64_t v15 = llround(v14 / 60.0);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnection currentKeepAliveStateOnInterface:]( self->_courierConnection,  "currentKeepAliveStateOnInterface:",  a3));
    if (-[APSCourierConnection keepAliveV2SupportedOnInterface:]( self->_courierConnection,  "keepAliveV2SupportedOnInterface:",  a3))
    {
      -[APSCourierConnection setKeepAliveGracePeriod:onInterface:]( self->_courierConnection,  "setKeepAliveGracePeriod:onInterface:",  a3,  self->_keepAliveV2TimeDriftMaximum);
      -[APSCourierConnection resumeManagerWithAction:onInterface:]( self->_courierConnection,  "resumeManagerWithAction:onInterface:",  v5,  a3);
      -[APSCourierConnection currentKeepAliveIntervalOnInterface:]( self->_courierConnection,  "currentKeepAliveIntervalOnInterface:",  a3);
      unint64_t v18 = llround(v17);
    }

    else
    {
      unint64_t v18 = 0LL;
    }

    id v19 = -[APSKeepAliveMetadata initWithUsingWWAN:keepAliveInterval:delayedResponseInterval:usingServerStats:keepAliveState:]( objc_alloc(&OBJC_CLASS___APSKeepAliveMetadata),  "initWithUsingWWAN:keepAliveInterval:delayedResponseInterval:usingServerStats:keepAliveState:",  a3 == 0,  v15,  v18,  v9,  v16);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = v6;
      int v21 = v19;
      __int16 v22 = v16;
      __int16 v23 = self->_courierConnection;
      id v24 = sub_10003CEE4(a3);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      unint64_t v26 = -[APSCourierConnection countConnectedInterfaces](self->_courierConnection, "countConnectedInterfaces");
      double v27 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcPersistentInterfaceManager](self, "pcPersistentInterfaceManager"));
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 currentLinkQualityString]);
      *(_DWORD *)buf = 138413314;
      id v46 = self;
      __int16 v47 = 2112;
      unsigned int v48 = v23;
      id v16 = v22;
      id v19 = v21;
      uint64_t v6 = v41;
      __int16 v49 = 2112;
      unsigned int v50 = v25;
      __int16 v51 = 2048;
      unint64_t v52 = v26;
      __int16 v53 = 2112;
      id v54 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@: Sending keep alive message via conn: %@ onInterface: %@. Connected on %lu interfaces. Current link quality: %@",  buf,  0x34u);
    }

    -[APSCourierConnection sendKeepAliveMessageWithMetadata:onInterface:]( self->_courierConnection,  "sendKeepAliveMessageWithMetadata:onInterface:",  v19,  a3);
    -[APSCourierConnectionManager _startKeepAliveResponseTimerOnInterface:shortInterval:]( self,  "_startKeepAliveResponseTimerOnInterface:shortInterval:",  a3,  v6);
    uint64_t v29 = -[APSCourierConnection nwInterfaceTypeForInterface:]( self->_courierConnection,  "nwInterfaceTypeForInterface:",  a3);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%@: Sending keep alive note to Core Telephony.",  buf,  0xCu);
    }

    unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager ctClient](self, "ctClient"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100092E08;
    v42[3] = &unk_100120060;
    v42[4] = self;
    [v31 triggerKeepaliveWakeupEvent:v29 completion:v42];

    -[APSCourierConnection currentKeepAliveIntervalOnInterface:]( self->_courierConnection,  "currentKeepAliveIntervalOnInterface:",  a3);
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", llround(v32)));
    __int16 v34 = self->_courierConnection;
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[APSCourierConnection setObject:forKey:onInterface:]( v34,  "setObject:forKey:onInterface:",  v35,  @"keepAliveSent",  a3);

    -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  v33,  @"lastKeepAliveInterval",  a3);
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnection currentGrowthStageOnInterface:]( self->_courierConnection,  "currentGrowthStageOnInterface:",  a3)));
    -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  v36,  @"growthStage",  a3);
    __int16 v37 = &off_10012B6F8;
    if (!a3) {
      __int16 v37 = &off_10012B6E0;
    }
    v44[0] = v37;
    v43[0] = @"ConnectionType";
    v43[1] = @"Environment";
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[APSEnvironment environmentType](self->_environment, "environmentType")));
    v44[1] = v38;
    v43[2] = @"LinkQuality";
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a3)));
    v44[2] = v39;
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  3LL));

    APSPowerLog(@"DidSendKeepAlive", v40);
    if (!a3 && self->_pendingPostSuspensionWWANFlush)
    {
      -[APSCourierConnectionManager _handleConnectionAfterSuspensionRecoveryOnInterface:withKeepAlive:]( self,  "_handleConnectionAfterSuspensionRecoveryOnInterface:withKeepAlive:",  0LL,  0LL);
      -[APSCourierConnectionManager _clearPostSuspensionFlushState](self, "_clearPostSuspensionFlushState");
    }
  }

- (void)_startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4
{
  BOOL v4 = a4;
  -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:]( self,  "_clearKeepAliveResponseTimerOnInterface:");
  -[APSCourierConnection startKeepAliveResponseTimerOnInterface:shortInterval:]( self->_courierConnection,  "startKeepAliveResponseTimerOnInterface:shortInterval:",  a3,  v4);
}

- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4 shortInterval:(BOOL)a5 onInterface:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v12 = v11;
  double v13 = v11 - self->_lastClientRequestedKeepaliveTime;
  courierConnection = self->_courierConnection;
  if (a6 == 3)
  {
    unsigned int v15 = -[APSCourierConnection isConnected](courierConnection, "isConnected");
    unsigned __int8 v16 = -[APSCourierConnection hasOpenConnection](self->_courierConnection, "hasOpenConnection");
    double v17 = self->_courierConnection;
    id v18 = -[APSCourierConnection preferredInterface](v17, "preferredInterface");
    id v19 = v17;
  }

  else
  {
    unsigned int v15 = -[APSCourierConnection isConnectedOnInterface:](courierConnection, "isConnectedOnInterface:", a6);
    unsigned __int8 v16 = -[APSCourierConnection hasOpenConnectionOnInterface:]( self->_courierConnection,  "hasOpenConnectionOnInterface:",  a6);
    id v19 = self->_courierConnection;
    id v18 = (id)a6;
  }

  unsigned int v20 = -[APSCourierConnection hasKeepAliveResponseTimerOnInterface:](v19, "hasKeepAliveResponseTimerOnInterface:", v18);
  if (v13 < 0.0 || v13 >= 60.0)
  {
    if (((v15 ^ 1 | v20) & 1) != 0)
    {
      if ((v16 & 1) != 0)
      {
        __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = self->_courierConnection;
          if (-[APSCourierConnection hasConnectionEstablishTimerOnInterface:]( v23,  "hasConnectionEstablishTimerOnInterface:",  a6))
          {
            id v24 = @"YES";
          }

          else
          {
            id v24 = @"NO";
          }

          unsigned int v25 = -[APSCourierConnection hasKeepAliveResponseTimerOnInterface:]( self->_courierConnection,  "hasKeepAliveResponseTimerOnInterface:",  a6);
          int v31 = 138413058;
          if (v25) {
            unint64_t v26 = @"YES";
          }
          else {
            unint64_t v26 = @"NO";
          }
          double v32 = self;
          __int16 v33 = 2112;
          __int16 v34 = v23;
          __int16 v35 = 2112;
          __int16 v36 = v24;
          __int16 v37 = 2112;
          __int16 v38 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ ignoring request to keepAlive/reconnect conn: %@ connectTimer: %@ keepAliveTimer: %@",  (uint8_t *)&v31,  0x2Au);
        }

        return;
      }

      if (!v8) {
        return;
      }
      -[APSCourierConnectionManager _adjustConnectionWithInterfacePreference:]( self,  "_adjustConnectionWithInterfacePreference:",  a6);
      uint64_t v30 = self->_courierConnection;
      if (a6 == 3)
      {
        if (!-[APSCourierConnection hasOpenConnection](v30, "hasOpenConnection")) {
          return;
        }
      }

      else if (!-[APSCourierConnection hasOpenConnectionOnInterface:](v30, "hasOpenConnectionOnInterface:", a6))
      {
        return;
      }
    }

    else
    {
      if (!v9) {
        return;
      }
      if (a6 == 3) {
        a6 = -[APSCourierConnection preferredInterface](self->_courierConnection, "preferredInterface");
      }
      -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  a6,  v7,  2LL);
    }

    self->_lastClientRequestedKeepaliveTime = v12;
    return;
  }

  double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v28 = @"NO";
    if (v9) {
      uint64_t v29 = @"YES";
    }
    else {
      uint64_t v29 = @"NO";
    }
    int v31 = 138412802;
    double v32 = self;
    __int16 v33 = 2112;
    __int16 v34 = (void *)v29;
    if (v8) {
      unsigned int v28 = @"YES";
    }
    __int16 v35 = 2112;
    __int16 v36 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@ throttling call to _requestKeepAlive:%@ orConnection:%@",  (uint8_t *)&v31,  0x20u);
  }
}

- (void)requestConnectionIfNeeded
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ requestConnectionIfNeeded",  (uint8_t *)&v4,  0xCu);
  }

  -[APSCourierConnectionManager _requestKeepAlive:orConnection:](self, "_requestKeepAlive:orConnection:", 0LL, 1LL);
}

- (void)performKeepAlive
{
}

- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4
{
}

- (void)_resetKeepAliveOnInterface:(int64_t)a3
{
  if (-[APSCourierConnection keepAliveV2SupportedOnInterface:]( self->_courierConnection,  "keepAliveV2SupportedOnInterface:"))
  {
    -[APSCourierConnectionManager _delayedPerformKeepAliveOnInterface:]( self,  "_delayedPerformKeepAliveOnInterface:",  a3);
  }

  else
  {
    -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:]( self,  "_clearKeepAliveResponseTimerOnInterface:",  a3);
    -[APSCourierConnection updateConnectionManagerKeepAliveIntervalOnInterface:]( self->_courierConnection,  "updateConnectionManagerKeepAliveIntervalOnInterface:",  a3);
  }

- (void)_handleKeepAliveResponseMessage:(id)a3 onInterface:(int64_t)a4 didWake:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:]( self,  "_clearKeepAliveResponseTimerOnInterface:",  a4);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolKeepAliveResponse"]);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_10003CEE4(a4);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138413058;
    __int16 v37 = self;
    __int16 v38 = 2112;
    __int16 v39 = v9;
    __int16 v40 = 2112;
    unsigned int v41 = v12;
    __int16 v42 = 2112;
    id v43 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Received keep-alive response %@ on interface %@: %@",  buf,  0x2Au);
  }

  if (!-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", a4))
  {
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = sub_10003CEE4(a4);
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138412546;
      __int16 v37 = self;
      __int16 v38 = 2112;
      __int16 v39 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ received keepAlive for interface %@ that is no longer connected, ignoring.",  buf,  0x16u);
    }

    goto LABEL_31;
  }

  if (!v9)
  {
    if (!-[APSCourierConnection keepAliveV2SupportedOnInterface:]( self->_courierConnection,  "keepAliveV2SupportedOnInterface:",  a4))
    {
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnection objectForKey:onInterface:]( self->_courierConnection,  "objectForKey:onInterface:",  @"keepAliveSent",  a4));
      if (v24) {
        -[os_log_s timeIntervalSinceDate:](v21, "timeIntervalSinceDate:", v24);
      }
      else {
        double v25 = 0.0;
      }
      int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25));
      -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  v31,  @"keepAliveAckTime",  a4);
      -[APSCourierConnection resumeManagerWithAction:onInterface:]( self->_courierConnection,  "resumeManagerWithAction:onInterface:",  0LL,  a4);
      if (a4 == 1)
      {
        networkMonitor = self->_networkMonitor;
        -[APSCourierConnection currentKeepAliveIntervalOnInterface:]( self->_courierConnection,  "currentKeepAliveIntervalOnInterface:",  1LL);
        -[APSNetworkMonitor setCurrentWiFiKeepAliveInterval:growAttempts:]( networkMonitor,  "setCurrentWiFiKeepAliveInterval:growAttempts:",  -[APSCourierConnection countOfGrowthActionsOnInterface:]( self->_courierConnection,  "countOfGrowthActionsOnInterface:",  1LL),  v33);
      }

      if (!-[APSCourierConnection lastKeepAliveActionOnInterface:]( self->_courierConnection,  "lastKeepAliveActionOnInterface:",  a4)) {
        -[APSCourierConnectionManager _submitKeepAliveSucceededAWDonInterface:]( self,  "_submitKeepAliveSucceededAWDonInterface:",  a4);
      }

      goto LABEL_31;
    }

    -[APSCourierConnection setKeepAliveV2Supported:onInterface:]( self->_courierConnection,  "setKeepAliveV2Supported:onInterface:",  0LL,  a4);
    goto LABEL_23;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolKeepAliveResponse"]);
  unsigned int v14 = [v13 intValue];

  switch(v14)
  {
    case 2u:
      unint64_t v26 = self;
      int64_t v27 = a4;
      uint64_t v28 = 1LL;
LABEL_24:
      -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( v26,  "_performKeepAliveOnInterface:shortInterval:withAction:",  v27,  0LL,  v28);
      break;
    case 1u:
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"APSProtocolKeepAliveDelayKeepAliveDurationKey"]);
      double v30 = (double)([v29 unsignedIntValue] / 0x3E8);

      -[APSCourierConnectionManager _delayedPerformKeepAliveOnInterface:withDelay:]( self,  "_delayedPerformKeepAliveOnInterface:withDelay:",  a4,  v30);
      break;
    case 0u:
      -[APSCourierConnectionManager _submitKeepAliveSucceededAWDonInterface:]( self,  "_submitKeepAliveSucceededAWDonInterface:",  a4);
      -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  a4,  0LL,  0LL);
      if (a4 == 1)
      {
        unsigned int v15 = self->_networkMonitor;
        -[APSCourierConnection currentKeepAliveIntervalOnInterface:]( self->_courierConnection,  "currentKeepAliveIntervalOnInterface:",  1LL);
        -[APSNetworkMonitor setCurrentWiFiKeepAliveInterval:growAttempts:]( v15,  "setCurrentWiFiKeepAliveInterval:growAttempts:",  -[APSCourierConnection countOfGrowthActionsOnInterface:]( self->_courierConnection,  "countOfGrowthActionsOnInterface:",  1LL),  v16);
      }

      double v17 = &off_10012B6F8;
      if (!a4) {
        double v17 = &off_10012B6E0;
      }
      v35[0] = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[APSEnvironment environmentType]( self->_environment,  "environmentType",  @"ConnectionType",  @"Environment")));
      v35[1] = v18;
      v34[2] = @"LinkQuality";
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[APSCourierConnectionManager _linkQualityForInterface:](self, "_linkQualityForInterface:", a4)));
      v35[2] = v19;
      v34[3] = @"DidWake";
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
      v35[3] = v20;
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  4LL));

      APSPowerLog(@"DidReceiveKeepAlive", v21);
LABEL_31:

      break;
    default:
      if (v14 - 3 <= 1)
      {
        -[APSCourierConnection setKeepAliveV2Supported:onInterface:]( self->_courierConnection,  "setKeepAliveV2Supported:onInterface:",  0LL,  a4);
        -[APSCourierConnection setKeepAliveGracePeriod:onInterface:]( self->_courierConnection,  "setKeepAliveGracePeriod:onInterface:",  a4,  0.0);
LABEL_23:
        unint64_t v26 = self;
        int64_t v27 = a4;
        uint64_t v28 = 2LL;
        goto LABEL_24;
      }

      break;
  }
}

- (void)_submitKeepAliveSucceededAWDonInterface:(int64_t)a3
{
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Calling into AWD for KeepAliveSucceeded",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: AWD for KeepAliveSucceeded returned",  (uint8_t *)&v9,  0xCu);
  }

  -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  0LL,  @"keepAliveSent",  a3);
  -[APSCourierConnection setObject:forKey:onInterface:]( self->_courierConnection,  "setObject:forKey:onInterface:",  0LL,  @"keepAliveAckTime",  a3);
  courierConnection = self->_courierConnection;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[APSCourierConnection setObject:forKey:onInterface:]( courierConnection,  "setObject:forKey:onInterface:",  v8,  @"timeSinceLastKeepAliveSucceeded",  a3);
}

- (void)updateKeepAliveInterval:(double)a3
{
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    BOOL v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Updating keep alive delay interval to %f",  (uint8_t *)&v6,  0x16u);
  }

  self->_double delayedSuspendKeepAliveInterval = a3;
}

- (void)networkMonitor:(id)a3 evaluateDualModeState:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"NO";
    if (v4) {
      BOOL v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    double v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Received delegate call: shouldUseDualMode is set to %@",  (uint8_t *)&v9,  0x16u);
  }

  if (-[APSCourierConnection isConnected](self->_courierConnection, "isConnected"))
  {
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ resetting consecutive failures because we have at least one connection",  (uint8_t *)&v9,  0xCu);
    }

    self->_unint64_t consecutiveConnectionFailureCount = 0LL;
    self->_consecutiveTLSConnectionFailureCount = 0LL;
  }

  -[APSCourierConnection setIsDualChannelAllowed:](self->_courierConnection, "setIsDualChannelAllowed:", v4);
  -[APSCourierConnectionManager _adjustConnection](self, "_adjustConnection");
}

- (void)networkMonitorWiFiBecameAssociated:(id)a3
{
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Received networkMonitorWiFiBecameAssociated",  (uint8_t *)&v5,  0xCu);
  }

  -[APSCourierConnectionManager _adjustConnection](self, "_adjustConnection");
}

- (void)networkMonitor:(id)a3 enableWiFiAssertionForPiggybackConnection:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"Disabling";
    if (v4) {
      BOOL v7 = @"Enabling";
    }
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: %@ WiFi assertion for piggyback connection",  (uint8_t *)&v8,  0x16u);
  }

  -[APSCourierConnection setEnableNonCellularOnConnectionManager:]( self->_courierConnection,  "setEnableNonCellularOnConnectionManager:",  v4);
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![v6 interfaceIdentifier])
  {
    unsigned int v7 = [v6 isPoorLinkQuality];
    unsigned __int8 v8 = +[PCInterfaceMonitor isPoorLinkQuality:]( &OBJC_CLASS___PCInterfaceMonitor,  "isPoorLinkQuality:",  v4);
    if (v7)
    {
      if ((v8 & 1) == 0
        && -[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", 1LL))
      {
        APSAlert(@"WiFi poorLQ keepAlive sent");
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          __int16 v11 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ WiFi poorLQ keepAlive sent",  (uint8_t *)&v10,  0xCu);
        }

        -[APSCourierConnectionManager _requestKeepAlive:orConnection:shortInterval:onInterface:]( self,  "_requestKeepAlive:orConnection:shortInterval:onInterface:",  1LL,  0LL,  0LL,  1LL);
      }
    }
  }

  -[APSCourierConnectionManager _dumpLogsForInconsistencyIfNecessary](self, "_dumpLogsForInconsistencyIfNecessary");
}

- (void)interfaceRadioHotnessChanged:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 isRadioHot];
    unsigned int v7 = @"NO";
    *(_DWORD *)buf = 138412802;
    unsigned int v14 = self;
    __int16 v15 = 2112;
    if (v6) {
      unsigned int v7 = @"YES";
    }
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ %@ interface radio hotness changed to %@",  buf,  0x20u);
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  BOOL v9 = v8 != v4;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100093FD0;
  v11[3] = &unk_10011FFA0;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager protocolConnectionForInterface:]( self,  "protocolConnectionForInterface:",  v9));
  id v10 = v12;
  [v10 enumerateStateListeners:v11];
}

- (unint64_t)serverTimeInNanoSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager serverTimeTracker](self, "serverTimeTracker"));
  id v3 = [v2 serverTimeInNanoSeconds];

  return (unint64_t)v3;
}

- (id)dnsResolutionTimeMillisecondsOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_dnsResolutionTimeMilliseconds[a3];
  }
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10003CEE4(a3);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to return dnsResolutionTimeMilliseconds on invalid interface %@",  (uint8_t *)&v9,  0x16u);
  }

  return 0LL;
}

- (id)tlsHandshakeTimeMillisecondsOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_tlsHandshakeTimeMilliseconds[a3];
  }
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10003CEE4(a3);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to return tlsHandshakeTimeMilliseconds on invalid interface %@",  (uint8_t *)&v9,  0x16u);
  }

  return 0LL;
}

- (id)tcpHandshakeTimeMillisecondsOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_tcpHandshakeTimeMilliseconds[a3];
  }
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_10003CEE4(a3);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ asked to return tcpHandshakeTimeMilliseconds on invalid interface %@",  (uint8_t *)&v9,  0x16u);
  }

  return 0LL;
}

- (void)forceAdjustConnections
{
}

- (void)adjustConnectionsIfNeeded
{
  if (-[APSCourierConnectionManager handlingFailure](self, "handlingFailure"))
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      int v5 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ mid-failure handling, ignoring adjustConnectionsIfNeeded call",  (uint8_t *)&v4,  0xCu);
    }
  }

  else
  {
    -[APSCourierConnectionManager _adjustConnection](self, "_adjustConnection");
  }

- (void)performKeepAliveOnInterface:(int64_t)a3
{
  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:", 1LL))
  {
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_10003CEE4(a3);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v8 = 138412546;
      int v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ force performing keep alive on %@ interface",  (uint8_t *)&v8,  0x16u);
    }

    -[APSCourierConnectionManager _performKeepAliveOnInterface:shortInterval:withAction:]( self,  "_performKeepAliveOnInterface:shortInterval:withAction:",  a3,  0LL,  2LL);
  }

- (void)sendFlushOnAllConnectionshWithPaddingLength:(unint64_t)a3
{
}

- (BOOL)isConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (int64_t)preferredInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  id v3 = [v2 preferredInterface];

  return (int64_t)v3;
}

- (BOOL)hasOpenConnection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 hasOpenConnection];

  return v3;
}

- (unint64_t)countConnectedInterfaces
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  id v3 = [v2 countConnectedInterfaces];

  return (unint64_t)v3;
}

- (unint64_t)countOpenConnections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  id v3 = [v2 countOpenConnections];

  return (unint64_t)v3;
}

- (id)currentKeepAliveStateOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentKeepAliveStateOnInterface:a3]);

  return v5;
}

- (BOOL)didPushCauseWake
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 didPushCauseWake];

  return v3;
}

- (id)tcpInfoDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tcpInfoDescription]);

  return v3;
}

- (BOOL)isConnectedOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a3) = [v4 isConnectedOnInterface:a3];

  return a3;
}

- (BOOL)isSuspendedOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a3) = [v4 isSuspendedOnInterface:a3];

  return a3;
}

- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a3) = [v4 hasOpenConnectionOnInterface:a3];

  return a3;
}

- (void)holdPowerAssertionUntilStreamsQuiesce
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v2 holdPowerAssertionUntilStreamsQuiesce];
}

- (id)serverIPAddressForInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serverIPAddressForInterface:a3]);

  return v5;
}

- (id)serverHostnameForInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serverHostnameForInterface:a3]);

  return v5;
}

- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v8 sendSetActiveState:v7 forInterval:v6 onInterface:a5];
}

- (id)_sendOutgoingMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 onInterface:(int64_t)a7 ultraConstrainedAllowed:(BOOL)a8 withCompletion:(id)a9
{
  id v15 = a3;
  id v60 = a4;
  id v61 = a5;
  id v62 = a6;
  id v16 = a9;
  if ([v15 payloadFormat] == (id)1)
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v17,  200LL,  0LL,  0LL));
  }

  else
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v17,  0LL,  0LL));
  }

  id v19 = (void *)v18;

  if (v19)
  {
    objc_msgSend(v15, "setPayloadLength:", objc_msgSend(v19, "length"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager maxLargeMessageSizeForInterface:]( self,  "maxLargeMessageSizeForInterface:",  a7));
    if (v20
      && (id v21 = [v19 length],
          v22 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager maxLargeMessageSizeForInterface:]( self,  "maxLargeMessageSizeForInterface:",  a7)),  id v23 = [v22 unsignedIntegerValue],  v22,  v20,  v21 > v23))
    {
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [v15 messageID];
        id v26 = [v19 length];
        int64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager maxLargeMessageSizeForInterface:]( self,  "maxLargeMessageSizeForInterface:",  a7));
        *(_DWORD *)buf = 138413058;
        v68 = self;
        __int16 v69 = 2048;
        id v70 = v25;
        __int16 v71 = 2048;
        id v72 = v26;
        __int16 v73 = 2048;
        id v74 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: Dropping outgoing message %lu because its length of %lu bytes is larger than %lu bytes",  buf,  0x2Au);
      }

      uint64_t v28 = APSError(2LL, @"Message too large");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    }

    else
    {
      double v30 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager pcInterfaceMonitorOnInterface:]( self,  "pcInterfaceMonitorOnInterface:",  a7));
      unsigned int v31 = [v30 isInternetReachable];

      double v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
      unsigned int v33 = [v32 isConnectedOnInterface:a7];

      if (((v33 ^ 1 | v31) & 1) != 0)
      {
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager pcInterfaceMonitorOnInterface:]( self,  "pcInterfaceMonitorOnInterface:",  a7));
        BOOL v35 = [v34 interfaceConstraint] != (id)1 || a8;

        __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        if (v35)
        {
          if (v37)
          {
            id v58 = [v15 messageID];
            id v38 = sub_10003CEE4(a7);
            __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            id v57 = [v19 length];
            __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
            id v56 = [v40 countConnectedInterfaces];
            unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue( -[APSCourierConnectionManager pcPersistentInterfaceManager]( self,  "pcPersistentInterfaceManager"));
            unsigned int v59 = (void *)objc_claimAutoreleasedReturnValue([v41 currentLinkQualityString]);
            *(_DWORD *)buf = 138413570;
            v68 = self;
            __int16 v69 = 2048;
            id v70 = v58;
            __int16 v71 = 2112;
            id v72 = v39;
            __int16 v73 = 2048;
            id v74 = v57;
            __int16 v75 = 2048;
            id v76 = v56;
            __int16 v77 = 2112;
            __int16 v78 = v59;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@: Sending outgoing message %lu onInterface: %@. Size of %lu. Connected on %lu interfaces. Current link quality: %@",  buf,  0x3Eu);
          }

          unsigned int v42 = -[APSCourierConnectionManager sendMessageWithTopicHash:identifier:payload:token:isPlistFormat:lastRTT:onInterface:withCompletion:]( self,  "sendMessageWithTopicHash:identifier:payload:token:isPlistFormat:lastRTT:onInterface:withCompletion:",  v60,  [v15 identifier],  v19,  v62,  objc_msgSend(v15, "payloadFormat") == (id)1,  v61,  a7,  v16);
          id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog networking](&OBJC_CLASS___APSLog, "networking"));
          BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);

          if (v44)
          {
            int64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog networking](&OBJC_CLASS___APSLog, "networking"));
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
              sub_1000BFE98(self, v45);
            }
          }

          -[APSCourierConnectionManager notePush](self, "notePush");
          if (v42)
          {

            uint64_t v29 = 0LL;
          }

          else
          {
            uint64_t v52 = APSError(2LL, @"Message can't be encoded");
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v52);
          }
        }

        else
        {
          if (v37)
          {
            *(_DWORD *)buf = 138412546;
            v68 = self;
            __int16 v69 = 2048;
            id v70 = [v15 messageID];
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@ Trying to send outgoing message %lu but only connected on ultra constrained",  buf,  0x16u);
          }

          uint64_t v51 = APSError(5LL, @"Ultra constrained disallowed");
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v51);
        }
      }

      else
      {
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          id v47 = [v15 messageID];
          id v48 = sub_10003CEE4(a7);
          __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          *(_DWORD *)buf = 138412802;
          v68 = self;
          __int16 v69 = 2048;
          id v70 = v47;
          __int16 v71 = 2112;
          id v72 = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%@ Trying to send outgoing message %lu but connected interface %@ is not reachable",  buf,  0x20u);
        }

        -[APSCourierConnectionManager disconnectStreamForInterface:withReason:]( self,  "disconnectStreamForInterface:withReason:",  a7,  10LL);
        -[APSCourierConnectionManager adjustConnectionsIfNeeded](self, "adjustConnectionsIfNeeded");
        uint64_t v50 = APSError(5LL, @"Internet is not reachable");
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v50);
      }
    }
  }

  else
  {
    __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v63 = 138412546;
      double v64 = self;
      __int16 v65 = 2048;
      id v66 = [v15 messageID];
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%@: Dropping outgoing message %lu because it could not be encoded in JSON",  v63,  0x16u);
    }

    uint64_t v54 = APSError(2LL, @"Message could not be encoded in JSON");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v54);
  }

  return v29;
}

- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v15 sendMessageTracingAckWithTopicHash:v14 tracingUUID:v13 status:v8 token:v12 onInterface:a7];
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9 onInterface:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager tokenGenerateResponseQueue](self, "tokenGenerateResponseQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100095100;
  v24[3] = &unk_100120088;
  v24[4] = self;
  id v25 = v16;
  unsigned __int16 v31 = a5;
  unsigned int v30 = a6;
  id v26 = v17;
  id v27 = v18;
  int64_t v28 = a8;
  int64_t v29 = a10;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  [v20 enqueueSendBlock:v24 completionBlock:v19];
}

- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v12 sendPubSubChannelListWithMetadata:v11 baseToken:v10 messageID:v7 onInterface:a6];
}

- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v15 sendActivityTrackingRequestWithMessageID:a3 pushToken:v14 salt:a5 trackingFlag:v10 timestamp:a7 onInterface:a8];
}

- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a4) = [v6 generationMatches:a3 forInterface:a4];

  return a4;
}

- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v12 sendMessageAcknowledgeMessageWithResponse:a3 messageId:v11 token:v10 onInterface:a6];
}

- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v4 currentKeepAliveIntervalOnInterface:a3];
  double v6 = v5;

  return v6;
}

- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9 withCompletion:(id)a10
{
  BOOL v11 = a7;
  id v25 = a10;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a8) = [v21 sendMessageWithTopicHash:v20 identifier:a4 payload:v19 token:v18 isPlistFormat:v11 lastRTT:v17 onInterface:a9];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingSendMessageQueue](self, "outgoingSendMessageQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000954D4;
  v28[3] = &unk_1001200A8;
  v28[4] = a9;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000954DC;
  v26[3] = &unk_1001200D0;
  id v27 = v25;
  id v23 = v25;
  [v22 enqueueSendBlock:v28 completionBlock:v26];

  return (char)a8;
}

- (BOOL)isAttemptingToReconnect
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 hasConnectionEstablishTimer];

  return v3;
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v9 sendTaskControlMessageWithMetadata:v8 messageId:a4 onInterface:a5];
}

- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 expectsResponse:(BOOL)a10 onInterface:(int64_t)a11 withCompletion:(id)a12
{
  id v26 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  if (a10)
  {
    -[APSCourierConnectionManager _startFilterMessageTimerOnInterface:]( self,  "_startFilterMessageTimerOnInterface:",  a11);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingFilterQueue](self, "outgoingFilterQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100095740;
    v27[3] = &unk_1001200F8;
    v27[4] = self;
    id v28 = v26;
    id v29 = v18;
    id v30 = v19;
    id v31 = v20;
    id v32 = v21;
    id v33 = v22;
    unint64_t v34 = a9;
    int64_t v35 = a11;
    [v24 enqueueSendBlock:v27 completionBlock:v23];
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    [v25 sendFilterMessageWithEnabledHashes:v26 ignoredHashes:v18 opportunisticHashes:v19 nonWakingHashes:v20 pausedHashes:v21 token:v22 version:a9 onInterface:a11];
  }
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 interface:(int64_t)a5 activeInterval:(unsigned int)a6 presenceFlags:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 withCompletion:(id)a13 onInterface:(int64_t)a14
{
  id v18 = a3;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a13;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingConnectMessageQueue](self, "outgoingConnectMessageQueue"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10009591C;
  v32[3] = &unk_100120120;
  v32[4] = self;
  id v33 = v18;
  int v40 = a4;
  unsigned int v41 = a7;
  unsigned int v42 = a6;
  id v34 = v19;
  id v35 = v20;
  id v36 = v21;
  id v37 = v22;
  unsigned __int8 v43 = a12;
  int64_t v38 = a5;
  int64_t v39 = a14;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  [v24 enqueueSendBlock:v32 completionBlock:v23];
}

- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 withCompletion:(id)a17 onInterface:(int64_t)a18
{
  id v24 = a3;
  id v25 = a7;
  id v26 = a8;
  id v27 = a9;
  id v28 = a10;
  id v29 = a11;
  id v30 = a16;
  id v31 = a17;
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingConnectMessageQueue](self, "outgoingConnectMessageQueue"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100095B70;
  void v43[3] = &unk_100120148;
  v43[4] = self;
  id v44 = v24;
  id v50 = v30;
  int64_t v51 = a4;
  unsigned int v56 = a5;
  unsigned int v57 = a6;
  id v45 = v25;
  id v46 = v26;
  id v47 = v27;
  id v48 = v28;
  unsigned __int8 v58 = a12;
  double v52 = a13;
  double v53 = a14;
  double v54 = a15;
  id v49 = v29;
  int64_t v55 = a18;
  id v33 = v30;
  id v34 = v29;
  id v35 = v28;
  id v36 = v27;
  id v37 = v26;
  id v38 = v25;
  id v39 = v24;
  [v32 enqueueSendBlock:v43 completionBlock:v31];
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 withCompletion:(id)a12 onInterface:(int64_t)a13
{
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager outgoingConnectMessageQueue](self, "outgoingConnectMessageQueue"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100095D80;
  v33[3] = &unk_100120170;
  void v33[4] = self;
  id v34 = v18;
  int v41 = a4;
  unsigned int v42 = a5;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v38 = v22;
  unsigned __int8 v43 = a11;
  id v39 = v23;
  int64_t v40 = a13;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  [v25 enqueueSendBlock:v33 completionBlock:v24];
}

- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a3) = [v4 isKeepAliveProxyConfiguredOnInterface:a3];

  return a3;
}

- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 isKeepAliveProxyConfiguredOnAnyInterface];

  return v3;
}

- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  LOBYTE(a3) = [v4 keepAliveV2SupportedOnInterface:a3];

  return a3;
}

- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v6 setKeepAliveV2Supported:v5 onInterface:a4];
}

- (unsigned)redirectCount
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 redirectCount];

  return v3;
}

- (BOOL)allowedToHaveMultipleOpenInterfaces
{
  return -[APSNetworkMonitor shouldUseDualMode](self->_networkMonitor, "shouldUseDualMode");
}

- (void)setServerSupportsDualMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager networkMonitor](self, "networkMonitor"));
  [v4 setServerSupportsDualMode:v3];
}

- (void)stopManagerOnInterface:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v4 stopManagerOnInterface:a3];
}

- (void)recalculateCriticalReliability
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
  unsigned int v5 = [v4 courierConnectionManagerClientsWantsCriticalReliability];

  if (self->_enableCriticalReliability != v5)
  {
    self->_enableCriticalReliability = v5;
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v7 = "enabled";
      }
      else {
        uint64_t v7 = "disabled";
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
      *(_DWORD *)buf = 138412802;
      id v15 = self;
      __int16 v16 = 2080;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Critical reliability for is now %s for '%@'",  buf,  0x20u);
    }

    -[APSNetworkMonitor setCriticalReliability:]( self->_networkMonitor,  "setCriticalReliability:",  self->_enableCriticalReliability);
    criticalReliabilityPowerAssertion = self->_criticalReliabilityPowerAssertion;
    if (v5)
    {
      if (criticalReliabilityPowerAssertion)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v13 handleFailureInMethod:a2 object:self file:@"APSCourierConnectionManager.m" lineNumber:2832 description:@"power assertion already exists"];
      }

      criticalReliabilityTimer = (PCPersistentTimer *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-criticalreliability",  APSBundleIdentifier));
      BOOL v11 = -[APSPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:holdDuration:",  criticalReliabilityTimer,  204LL,  600.0);
      id v12 = self->_criticalReliabilityPowerAssertion;
      self->_criticalReliabilityPowerAssertion = v11;
    }

    else
    {
      self->_criticalReliabilityPowerAssertion = 0LL;

      -[PCPersistentTimer invalidate](self->_criticalReliabilityTimer, "invalidate");
      criticalReliabilityTimer = self->_criticalReliabilityTimer;
      self->_criticalReliabilityTimer = 0LL;
    }
  }

- (void)triggerCriticalReliability
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    BOOL v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ _criticalReliabilityFlushTimerFired",  (uint8_t *)&v10,  0xCu);
  }

  -[NSTimer invalidate](self->_criticalFlushTimer, "invalidate");
  criticalFlushTimer = self->_criticalFlushTimer;
  self->_criticalFlushTimer = 0LL;

  -[APSCourierConnectionManager sendFlushOnAllConnectionshWithPaddingLength:]( self,  "sendFlushOnAllConnectionshWithPaddingLength:",  2LL);
  if (self->_enableCriticalReliability)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:9.0]);

    uint64_t v7 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( objc_alloc(&OBJC_CLASS___NSTimer),  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v6,  self,  "triggerCriticalReliability",  0LL,  0LL,  0.0);
    id v8 = self->_criticalFlushTimer;
    self->_criticalFlushTimer = v7;

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v9 addTimer:self->_criticalFlushTimer forMode:NSDefaultRunLoopMode];
  }

- (void)refreshCriticalReliability
{
}

- (void)refreshCriticalReliabilityTimerWithShortKeepAlive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    int v17 = 138412546;
    __int16 v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ _refreshCriticalReliabilityTimerWithShortKeepAlive %@",  (uint8_t *)&v17,  0x16u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  if ([v7 preferredInterface] == (id)1)
  {
    uint64_t v8 = 1LL;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
    uint64_t v8 = (uint64_t)[v9 courierConnectionManagerClientsHaveEagerMessages];
  }

  -[APSCourierConnectionManager _requestKeepAlive:orConnection:shortInterval:onInterface:]( self,  "_requestKeepAlive:orConnection:shortInterval:onInterface:",  v8,  1LL,  v3,  3LL);
  -[PCPersistentTimer invalidate](self->_criticalReliabilityTimer, "invalidate");
  criticalReliabilityTimer = self->_criticalReliabilityTimer;
  self->_criticalReliabilityTimer = 0LL;

  if (self->_enableCriticalReliability)
  {
    BOOL v11 = objc_alloc(&OBJC_CLASS___PCPersistentTimer);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    [v12 minimumKeepAliveInterval];
    id v13 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( v11,  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  @"criticalreliability",  self,  "_criticalReliabilityTimerFired",  0LL);
    id v14 = self->_criticalReliabilityTimer;
    self->_criticalReliabilityTimer = v13;

    -[PCPersistentTimer setDisableSystemWaking:](self->_criticalReliabilityTimer, "setDisableSystemWaking:", 1LL);
    -[PCPersistentTimer setMinimumEarlyFireProportion:]( self->_criticalReliabilityTimer,  "setMinimumEarlyFireProportion:",  1.0);
    id v15 = self->_criticalReliabilityTimer;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    -[PCPersistentTimer scheduleInRunLoop:](v15, "scheduleInRunLoop:", v16);
  }

- (void)setKeepAliveConfiguration:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v4 setKeepAliveConfiguration:a3];
}

- (void)_criticalReliabilityTimerFired
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ _criticalReliabilityTimerFired",  (uint8_t *)&v4,  0xCu);
  }

  -[APSCourierConnectionManager refreshCriticalReliabilityTimerWithShortKeepAlive:]( self,  "refreshCriticalReliabilityTimerWithShortKeepAlive:",  0LL);
}

- (void)notePush
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  int v4 = [v3 linkQuality];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
  char v6 = objc_opt_respondsToSelector(v5, "currentRAT");

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager pcInterfaceMonitorWWAN](self, "pcInterfaceMonitorWWAN"));
    int v8 = [v7 currentRAT];

    if (v4 != -2 && v8 != -2 && v8 != -1)
    {
      self->_lastPushLQ = v4;
      if (self->_lastPushRAT != v8) {
        self->_lastPushRAT = v8;
      }
    }
  }

  unint64_t v9 = +[APSNetworkMonitor powerCostForPushOnRAT:withLinkQuality:]( &OBJC_CLASS___APSNetworkMonitor,  "powerCostForPushOnRAT:withLinkQuality:",  self->_lastPushRAT,  self->_lastPushLQ);
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager networkMonitor](self, "networkMonitor"));
  [v10 notePushWithCost:v9];
}

- (BOOL)isPiggybacking
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager networkMonitor](self, "networkMonitor"));
  unsigned __int8 v3 = [v2 isPiggybacking];

  return v3;
}

- (BOOL)isKeepAliveProxyConfiguredOnAnyConnection
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned __int8 v3 = [v2 isKeepAliveProxyConfiguredOnAnyInterface];

  return v3;
}

- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v4 sendMessageTransportAcknowledgeMessageOnInterface:a3];
}

- (void)prepareForSleep
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  [v3 stopManagers];

  if (-[APSCourierConnectionManager _neededToSwitchToKeepAliveProxyInterface]( self,  "_neededToSwitchToKeepAliveProxyInterface"))
  {
    -[APSCourierConnectionManager _switchToKeepAliveProxyInterface](self, "_switchToKeepAliveProxyInterface");
  }

- (void)prepareForDarkWake
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForDarkWake", (uint8_t *)&v7, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  if ([v4 hasOpenConnection])
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned __int8 v6 = [v5 isConnected];

    if ((v6 & 1) == 0) {
      -[APSNoOpPowerAssertion hold](self->_waitForConnectionAttemptsPowerAssertion, "hold");
    }
  }

  else
  {
  }

  -[APSCourierConnectionManager performKeepAlive](self, "performKeepAlive");
}

- (void)prepareForFullWake
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForFullWake", (uint8_t *)&v11, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned int v5 = [v4 isConnected];

  if (v5
    || (unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection")),
        int v7 = [v6 hasOpenConnection],
        v6,
        (v7 & 1) != 0))
  {
  }

  else
  {
    self->_interfacePreference = 0;
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  if ([v8 hasOpenConnection])
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned __int8 v10 = [v9 isConnected];

    if ((v10 & 1) == 0) {
      -[APSNoOpPowerAssertion hold](self->_waitForConnectionAttemptsPowerAssertion, "hold");
    }
  }

  else
  {
  }

  -[APSCourierConnectionManager performKeepAlive](self, "performKeepAlive");
}

- (void)_startResetInterfacePreferenceTimer
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 1024;
    int v9 = 90;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: Scheduling reset of interface preference in %d seconds",  (uint8_t *)&v6,  0x12u);
  }

  id v4 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_resetInterfacePreferenceTimerFired:",  0LL,  0LL,  90.0));
  resetInterfacePreferenceTimer = self->_resetInterfacePreferenceTimer;
  self->_resetInterfacePreferenceTimer = v4;

  -[NSTimer setTolerance:](self->_resetInterfacePreferenceTimer, "setTolerance:", 9.0);
}

- (void)_clearResetInterfacePreferenceTimer
{
  resetInterfacePreferenceTimer = self->_resetInterfacePreferenceTimer;
  if (resetInterfacePreferenceTimer)
  {
    -[NSTimer invalidate](resetInterfacePreferenceTimer, "invalidate");
    id v4 = self->_resetInterfacePreferenceTimer;
    self->_resetInterfacePreferenceTimer = 0LL;
  }

- (void)_resetInterfacePreferenceTimerFired:(id)a3
{
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Timer fired to reset the interface",  (uint8_t *)&v8,  0xCu);
  }

  -[APSCourierConnectionManager _clearResetInterfacePreferenceTimer](self, "_clearResetInterfacePreferenceTimer");
  if (self->_interfacePreference)
  {
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Switching to preferred interface",  (uint8_t *)&v8,  0xCu);
    }

    -[APSCourierConnectionManager _useInteractivePowerAssertionIfNeededWithReason:]( self,  "_useInteractivePowerAssertionIfNeededWithReason:",  @"switching to preferred interface");
    self->_interfacePreference = 0;
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned int v7 = [v6 isConnected];

    if (v7) {
      -[APSCourierConnectionManager disconnectAllStreamsWithReason:](self, "disconnectAllStreamsWithReason:", 103LL);
    }
    -[APSCourierConnectionManager adjustConnectionsIfNeeded](self, "adjustConnectionsIfNeeded");
  }

- (void)_useInteractivePowerAssertionIfNeededWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned int v6 = [v5 isConnected];

  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager delegate](self, "delegate"));
    unsigned int v8 = [v7 courierConnectionManagerClientsHaveInteractivePushDuringSleepEnabled];

    if (v8)
    {
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        int v11 = self;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Enabling interactive power assertions due to %@",  (uint8_t *)&v10,  0x16u);
      }

      +[APSPowerAssertion_NoHold setUseInteractivePowerAssertion:]( &OBJC_CLASS___APSPowerAssertion,  "setUseInteractivePowerAssertion:",  1LL);
    }
  }
}

- (BOOL)_neededToSwitchToKeepAliveProxyInterface
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned int v4 = [v3 isConnectedOnInterface:1];

  if (!v4)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned int v8 = [v7 isConnectedOnInterface:0];

    if (!v8) {
      return 0;
    }
    if (!+[APSTCPStream isKeepAliveProxyFeatureEnabled](&OBJC_CLASS___APSTCPStream, "isKeepAliveProxyFeatureEnabled")) {
      return 0;
    }
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned int v10 = [v9 isKeepAliveProxyConfiguredOnInterface:0];

    if (!v10) {
      return 0;
    }
    return +[APSTCPStream isKeepAliveProxySupportedOnSomeInterface]( &OBJC_CLASS___APSTCPStream,  "isKeepAliveProxySupportedOnSomeInterface");
  }

  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled](&OBJC_CLASS___APSTCPStream, "isKeepAliveProxyFeatureEnabled"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned __int8 v6 = [v5 isKeepAliveProxyConfiguredOnInterface:1];

    if ((v6 & 1) != 0) {
      return +[APSTCPStream isKeepAliveProxySupportedOnSomeInterface]( &OBJC_CLASS___APSTCPStream,  "isKeepAliveProxySupportedOnSomeInterface");
    }
  }

  return 0;
}

- (void)_switchToKeepAliveProxyInterface
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: Switching interfaces to enable keep alive proxy",  (uint8_t *)&v4,  0xCu);
  }

  -[APSCourierConnectionManager _clearResetInterfacePreferenceTimer](self, "_clearResetInterfacePreferenceTimer");
  -[APSNoOpPowerAssertion hold](self->_waitForConnectionAttemptsPowerAssertion, "hold");
  -[APSCourierConnectionManager disconnectAllStreamsWithReason:](self, "disconnectAllStreamsWithReason:", 104LL);
  self->_interfacePreference = 10;
  -[APSCourierConnectionManager adjustConnectionsIfNeeded](self, "adjustConnectionsIfNeeded");
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager environment](self, "environment"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; %@>",
                   v3,
                   self,
                   v5));

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  id v6 = [v5 countConnectedInterfaces];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 connectionDebugInfo]);
  uint64_t v9 = APSPrettyPrintCollection(v8, 1LL, 0LL, 0LL);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p, domain=%@, connectedInterfaces=%lu, connectionInfo=%@>",  v3,  self,  v4,  v6,  v10));

  return (NSString *)v11;
}

- (id)aps_prettyDescription
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionDebugInfo]);

  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionTimeForInterface:](self, "connectionTimeForInterface:", v6));
    v30[0] = @"keepAlive";
    -[APSCourierConnectionManager currentKeepAliveIntervalOnInterface:]( self,  "currentKeepAliveIntervalOnInterface:",  v6);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.0f", v10));
    v31[0] = v11;
    v30[1] = @"connected";
    if (v9)
    {
      [v9 doubleValue];
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue( +[APSDatePrinter dateStringFromInterval:]( &OBJC_CLASS___APSDatePrinter,  "dateStringFromInterval:"));
      __int16 v12 = v2;
    }

    else
    {
      __int16 v12 = @"N/A";
    }

    v31[1] = v12;
    void v30[2] = @"connection";
    id v13 = sub_10003CEE4(v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v14]);
    v31[2] = v15;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
    id v17 = sub_10003CEE4(v6);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, v18);

    if (v9) {
    char v7 = 0;
    }
    unint64_t v6 = 1LL;
  }

  while ((v8 & 1) != 0);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  id v21 = [v20 countConnectedInterfaces];
  uint64_t v22 = APSPrettyPrintCollection(v5, 1LL, 0LL, 0LL);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager serverTimeTracker](self, "serverTimeTracker"));
  uint64_t v25 = APSPrettyPrintObject(v24, 2LL);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<domain=%@, connectedInterfaces=%lu, info=%@, serverTime=%@>",  v19,  v21,  v23,  v26));

  return v27;
}

- (id)JSONDebugState
{
  id v2 = self;
  v32[0] = @"connection status";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isConnected]));
  v33[0] = v4;
  v32[1] = @"enabled";
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v2->_enabled));
  v33[1] = v5;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
  id v29 = [v6 mutableCopy];

  unint64_t v7 = 0LL;
  char v8 = 1;
  id v27 = v2;
  do
  {
    char v9 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](v2, "courierConnection"));
    unsigned int v11 = [v10 isConnectedOnInterface:v7];

    if (v11)
    {
      v30[0] = @"serverHostName";
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](v2, "courierConnection"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 serverHostnameForInterface:v7]);
      v31[0] = v28;
      v30[1] = @"serverPort";
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](v2, "courierConnection"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serverPortForInterface:v7]);
      v31[1] = v14;
      void v30[2] = @"serverIP";
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](v2, "courierConnection"));
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serverAddressForInterface:v7]);
      v31[2] = v16;
      void v30[3] = @"connectionTime";
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionTimeForInterface:](v2, "connectionTimeForInterface:", v7));
      void v31[3] = v17;
      v30[4] = @"keepAliveInterval";
      -[APSCourierConnectionManager currentKeepAliveIntervalOnInterface:]( v2,  "currentKeepAliveIntervalOnInterface:",  v7);
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.0f", v18));
      v31[4] = v19;
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  5LL));
      id v21 = sub_10003CEE4(v7);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      [v29 setObject:v20 forKeyedSubscript:v22];

      id v2 = v27;
    }

    else
    {
      id v23 = sub_10003CEE4(v7);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v23);
      [v29 setObject:&__NSDictionary0__struct forKeyedSubscript:v12];
    }

    char v8 = 0;
    unint64_t v7 = 1LL;
  }

  while ((v9 & 1) != 0);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[APSTCPStream isKeepAliveProxyFeatureEnabled]( &OBJC_CLASS___APSTCPStream,  "isKeepAliveProxyFeatureEnabled")));
  [v29 setObject:v24 forKeyedSubscript:@"keepAliveProxyingEnabled"];

  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled](&OBJC_CLASS___APSTCPStream, "isKeepAliveProxyFeatureEnabled"))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[APSCourierConnectionManager _requestKeepAliveProxy](v27, "_requestKeepAliveProxy")));
    [v29 setObject:v25 forKeyedSubscript:@"didRequestKeepAliveProxying"];
  }

  return v29;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v25 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  objc_msgSend(v25, "appendDescription:BOOLValue:", @"connection status", objc_msgSend(v4, "isConnected"));

  [v25 pushIndent];
  [v25 appendDescription:@"enabled" BOOLValue:self->_enabled];
  [v25 pushIndent];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  objc_msgSend( v25,  "appendDescription:BOOLValue:",  @"noncellular connected",  objc_msgSend(v5, "isConnectedOnInterface:", 1));

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned int v7 = [v6 isConnectedOnInterface:1];

  if (v7)
  {
    [v25 pushIndent];
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serverHostnameForInterface:1]);
    [v25 appendDescription:@"server hostname" stringValue:v9];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serverPortForInterface:1]);
    objc_msgSend( v25,  "appendDescription:unsignedIntegerValue:",  @"server port",  objc_msgSend(v11, "unsignedLongLongValue"));

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serverAddressForInterface:1]);
    [v25 appendDescription:@"server ip" stringValue:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionTimeForInterface:](self, "connectionTimeForInterface:", 1LL));
    [v14 doubleValue];
    objc_msgSend(v25, "appendDescription:timeIntervalValue:", @"connection time");

    [v25 popIndent];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  objc_msgSend( v25,  "appendDescription:BOOLValue:",  @"wwan connected",  objc_msgSend(v15, "isConnectedOnInterface:", 0));

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
  unsigned int v17 = [v16 isConnectedOnInterface:0];

  if (v17)
  {
    [v25 pushIndent];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serverHostnameForInterface:0]);
    [v25 appendDescription:@"server hostname" stringValue:v19];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 serverPortForInterface:0]);
    objc_msgSend( v25,  "appendDescription:unsignedIntegerValue:",  @"server port",  objc_msgSend(v21, "unsignedLongLongValue"));

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager courierConnection](self, "courierConnection"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 serverAddressForInterface:0]);
    [v25 appendDescription:@"server ip" stringValue:v23];

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionManager connectionTimeForInterface:](self, "connectionTimeForInterface:", 0LL));
    [v24 doubleValue];
    objc_msgSend(v25, "appendDescription:timeIntervalValue:", @"connection time");

    [v25 popIndent];
  }

  if (self->_consecutiveConnectionFailureCount)
  {
    objc_msgSend(v25, "appendDescription:unsignedIntegerValue:", @"consecutive connection failures");
    if (self->_lastConnectionAttempt) {
      objc_msgSend(v25, "appendDescription:dateValue:", @"last connection attempt");
    }
  }

  [v25 popIndent];
  objc_msgSend( v25,  "appendDescription:enabledValue:",  @"keep alive proxying",  +[APSTCPStream isKeepAliveProxyFeatureEnabled](APSTCPStream, "isKeepAliveProxyFeatureEnabled"));
  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled](&OBJC_CLASS___APSTCPStream, "isKeepAliveProxyFeatureEnabled")) {
    objc_msgSend( v25,  "appendDescription:BOOLValue:",  @"request keep alive proxying",  -[APSCourierConnectionManager _requestKeepAliveProxy](self, "_requestKeepAliveProxy"));
  }
  [v25 popIndent];
}

- (id)connectionTimeForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    uint64_t v3 = self->_connectionTime[a3];
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3;
}

- (void)setConnectionTime:(id)a3 forInterface:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 1)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_connectionTime[a4], a3);
    id v7 = v8;
  }
}

- (id)maxMessageSizeForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    int v4 = self->_maxMessageSizes[a3];
    if (v4) {
      uint64_t v3 = v4;
    }
    else {
      uint64_t v3 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[APSEnvironment messageSize](self->_environment, "messageSize")));
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)setMaxMessageSize:(id)a3 forInterface:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 1)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_maxMessageSizes[a4], a3);
    id v7 = v8;
  }
}

- (id)maxLargeMessageSizeForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    int v4 = self->_maxLargeMessageSizes[a3];
    if (v4) {
      uint64_t v3 = v4;
    }
    else {
      uint64_t v3 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[APSEnvironment largeMessageSize](self->_environment, "largeMessageSize")));
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)setMaxLargeMessageSize:(id)a3 forInterface:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 1)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_maxLargeMessageSizes[a4], a3);
    id v7 = v8;
  }
}

- (int64_t)interfaceConstraintForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[APSCourierConnection interfaceConstraintForInterface:]( self->_courierConnection,  "interfaceConstraintForInterface:");
  }
  else {
    return 0LL;
  }
}

- (APSCourierConnectionManagerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (APSCourierConnection)courierConnection
{
  return self->_courierConnection;
}

- (void)setCourierConnection:(id)a3
{
}

- (PCCarrierBundleHelper)carrierBundleHelper
{
  return self->_carrierBundleHelper;
}

- (void)setCarrierBundleHelper:(id)a3
{
}

- (unint64_t)consecutiveConnectionFailureCount
{
  return self->_consecutiveConnectionFailureCount;
}

- (void)setConsecutiveConnectionFailureCount:(unint64_t)a3
{
  self->_unint64_t consecutiveConnectionFailureCount = a3;
}

- (unint64_t)consecutiveTLSConnectionFailureCount
{
  return self->_consecutiveTLSConnectionFailureCount;
}

- (void)setConsecutiveTLSConnectionFailureCount:(unint64_t)a3
{
  self->_consecutiveTLSConnectionFailureCount = a3;
}

- (PCPersistentTimer)delayedReconnectTimer
{
  return self->_delayedReconnectTimer;
}

- (void)setDelayedReconnectTimer:(id)a3
{
}

- (NSDate)lastConnectionAttempt
{
  return self->_lastConnectionAttempt;
}

- (void)setLastConnectionAttempt:(id)a3
{
}

- (APSNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (unint64_t)cmaType
{
  return self->_cmaType;
}

- (void)setCmaType:(unint64_t)a3
{
  self->_unint64_t cmaType = a3;
}

- (unint64_t)lastIPCachingPercentage
{
  return self->_lastIPCachingPercentage;
}

- (void)setLastIPCachingPercentage:(unint64_t)a3
{
  self->_lastIPCachingPercentage = a3;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (int)interfacePreference
{
  return self->_interfacePreference;
}

- (void)setInterfacePreference:(int)a3
{
  self->_interfacePreference = a3;
}

- (double)lastIPCachingTTLSeconds
{
  return self->_lastIPCachingTTLSeconds;
}

- (void)setLastIPCachingTTLSeconds:(double)a3
{
  self->_lastIPCachingTTLSeconds = a3;
}

- (NSTimer)resetInterfacePreferenceTimer
{
  return self->_resetInterfacePreferenceTimer;
}

- (void)setResetInterfacePreferenceTimer:(id)a3
{
}

- (BOOL)enableCriticalReliability
{
  return self->_enableCriticalReliability;
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  self->_enableCriticalReliability = a3;
}

- (PCPersistentTimer)pendingMessageReconnectTimer
{
  return self->_pendingMessageReconnectTimer;
}

- (void)setPendingMessageReconnectTimer:(id)a3
{
}

- (APSConnectionRetryStateManaging)connectionRetryManager
{
  return self->_connectionRetryManager;
}

- (void)setConnectionRetryManager:(id)a3
{
}

- (double)delayedReconnectTLSInterval
{
  return self->_delayedReconnectTLSInterval;
}

- (void)setDelayedReconnectTLSInterval:(double)a3
{
  self->_double delayedReconnectTLSInterval = a3;
}

- (int64_t)delayedReconnectTLSIntervalTrigger
{
  return self->_delayedReconnectTLSIntervalTrigger;
}

- (void)setDelayedReconnectTLSIntervalTrigger:(int64_t)a3
{
  self->_int64_t delayedReconnectTLSIntervalTrigger = a3;
}

- (PCPersistentTimer)delayedSuspendKeepAliveTimer
{
  return self->_delayedSuspendKeepAliveTimer;
}

- (void)setDelayedSuspendKeepAliveTimer:(id)a3
{
}

- (BOOL)pendingPostSuspensionWWANFlush
{
  return self->_pendingPostSuspensionWWANFlush;
}

- (void)setPendingPostSuspensionWWANFlush:(BOOL)a3
{
  self->_pendingPostSuspensionWWANFlush = a3;
}

- (BOOL)remainsConnectedWhenWWANSuspends
{
  return self->_remainsConnectedWhenWWANSuspends;
}

- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3
{
  self->_remainsConnectedWhenWWANSuspends = a3;
}

- (double)startedDarkWake
{
  return self->_startedDarkWake;
}

- (void)setStartedDarkWake:(double)a3
{
  self->_startedDarkWake = a3;
}

- (unint64_t)findKeepAliveProxyInterfaceFailureCount
{
  return self->_findKeepAliveProxyInterfaceFailureCount;
}

- (void)setFindKeepAliveProxyInterfaceFailureCount:(unint64_t)a3
{
  self->_findKeepAliveProxyInterfaceFailureCount = a3;
}

- (unint64_t)forceKeepAliveProxyInterfaceFailureCount
{
  return self->_forceKeepAliveProxyInterfaceFailureCount;
}

- (void)setForceKeepAliveProxyInterfaceFailureCount:(unint64_t)a3
{
  self->_forceKeepAliveProxyInterfaceFailureCount = a3;
}

- (unint64_t)obtainKeepAliveProxyFailureCount
{
  return self->_obtainKeepAliveProxyFailureCount;
}

- (void)setObtainKeepAliveProxyFailureCount:(unint64_t)a3
{
  self->_obtainKeepAliveProxyFailureCount = a3;
}

- (APSConnectionHistory)connectionHistory
{
  return self->_connectionHistory;
}

- (void)setConnectionHistory:(id)a3
{
}

- (NSNumber)serverMaxKeepAliveInterval
{
  return self->_serverMaxKeepAliveInterval;
}

- (void)setServerMaxKeepAliveInterval:(id)a3
{
}

- (NSNumber)serverExpectedKeepAliveInterval
{
  return self->_serverExpectedKeepAliveInterval;
}

- (void)setServerExpectedKeepAliveInterval:(id)a3
{
}

- (NSNumber)serverMinKeepAliveInterval
{
  return self->_serverMinKeepAliveInterval;
}

- (void)setServerMinKeepAliveInterval:(id)a3
{
}

- (double)delayedSuspendKeepAliveInterval
{
  return self->_delayedSuspendKeepAliveInterval;
}

- (void)setDelayedSuspendKeepAliveInterval:(double)a3
{
  self->_double delayedSuspendKeepAliveInterval = a3;
}

- (APSRateLimiter)suspendToggleHourlyLimiter
{
  return self->_suspendToggleHourlyLimiter;
}

- (void)setSuspendToggleHourlyLimiter:(id)a3
{
}

- (APSRateLimiter)suspendToggleDailyLimiter
{
  return self->_suspendToggleDailyLimiter;
}

- (void)setSuspendToggleDailyLimiter:(id)a3
{
}

- (int64_t)suspendToggleHourlyLimit
{
  return self->_suspendToggleHourlyLimit;
}

- (void)setSuspendToggleHourlyLimit:(int64_t)a3
{
  self->_suspendToggleHourlyLimit = a3;
}

- (int64_t)suspendToggleDailyLimit
{
  return self->_suspendToggleDailyLimit;
}

- (void)setSuspendToggleDailyLimit:(int64_t)a3
{
  self->_suspendToggleDailyLimit = a3;
}

- (double)keepAliveV2TimeDriftMaximum
{
  return self->_keepAliveV2TimeDriftMaximum;
}

- (void)setKeepAliveV2TimeDriftMaximum:(double)a3
{
  self->_keepAliveV2TimeDriftMaximum = a3;
}

- (double)lastClientRequestedKeepaliveTime
{
  return self->_lastClientRequestedKeepaliveTime;
}

- (void)setLastClientRequestedKeepaliveTime:(double)a3
{
  self->_lastClientRequestedKeepaliveTime = a3;
}

- (APSPowerAssertion)delayedKeepAlivePowerAssertion
{
  return self->_delayedKeepAlivePowerAssertion;
}

- (void)setDelayedKeepAlivePowerAssertion:(id)a3
{
}

- (NSString)latestGeoRegion
{
  return self->_latestGeoRegion;
}

- (void)setLatestGeoRegion:(id)a3
{
}

- (double)filterMessageTimeout
{
  return self->_filterMessageTimeout;
}

- (void)setFilterMessageTimeout:(double)a3
{
  self->_double filterMessageTimeout = a3;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (APSSymptomReporter)symptomReporter
{
  return self->_symptomReporter;
}

- (void)setSymptomReporter:(id)a3
{
}

- (__SecIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(__SecIdentity *)a3
{
  self->_clientIdentity = a3;
}

- (void)setShouldUseInternet:(BOOL)a3
{
  self->_shouldUseInternet = a3;
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (BOOL)handlingFailure
{
  return self->_handlingFailure;
}

- (void)setHandlingFailure:(BOOL)a3
{
  self->_handlingFailure = a3;
}

- (NSTimer)criticalFlushTimer
{
  return self->_criticalFlushTimer;
}

- (void)setCriticalFlushTimer:(id)a3
{
}

- (PCPersistentTimer)criticalReliabilityTimer
{
  return self->_criticalReliabilityTimer;
}

- (void)setCriticalReliabilityTimer:(id)a3
{
}

- (APSPowerAssertion)criticalReliabilityPowerAssertion
{
  return self->_criticalReliabilityPowerAssertion;
}

- (void)setCriticalReliabilityPowerAssertion:(id)a3
{
}

- (APSNoOpPowerAssertion)waitForConnectionAttemptsPowerAssertion
{
  return self->_waitForConnectionAttemptsPowerAssertion;
}

- (void)setWaitForConnectionAttemptsPowerAssertion:(id)a3
{
}

- (APSReachabilityHandler)reachabilityHandler
{
  return self->_reachabilityHandler;
}

- (void)setReachabilityHandler:(id)a3
{
}

- (APSServerTimeTracker)serverTimeTracker
{
  return self->_serverTimeTracker;
}

- (void)setServerTimeTracker:(id)a3
{
}

- (APSOutgoingQueue)outgoingSendMessageQueue
{
  return self->_outgoingSendMessageQueue;
}

- (void)setOutgoingSendMessageQueue:(id)a3
{
}

- (APSOutgoingQueue)outgoingConnectMessageQueue
{
  return self->_outgoingConnectMessageQueue;
}

- (void)setOutgoingConnectMessageQueue:(id)a3
{
}

- (APSOutgoingQueue)tokenGenerateResponseQueue
{
  return self->_tokenGenerateResponseQueue;
}

- (void)setTokenGenerateResponseQueue:(id)a3
{
}

- (APSOutgoingQueue)outgoingFilterQueue
{
  return self->_outgoingFilterQueue;
}

- (void)setOutgoingFilterQueue:(id)a3
{
}

- (int)lastPushRAT
{
  return self->_lastPushRAT;
}

- (void)setLastPushRAT:(int)a3
{
  self->_lastPushRAT = a3;
}

- (int)lastPushLQ
{
  return self->_lastPushLQ;
}

- (void)setLastPushLQ:(int)a3
{
  self->_lastPushLQ = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 0LL; i != -2; --i)
    objc_storeStrong((id *)&self->_filterMessageTimer[i + 1], 0LL);
  for (uint64_t j = 0LL; j != -2; --j)
    objc_storeStrong((id *)&self->_maxLargeMessageSizes[j + 1], 0LL);
  for (uint64_t k = 0LL; k != -2; --k)
    objc_storeStrong((id *)&self->_maxMessageSizes[k + 1], 0LL);
  for (uint64_t m = 0LL; m != -2; --m)
    objc_storeStrong((id *)&self->_protocolConnections[m + 1], 0LL);
  for (uint64_t n = 0LL; n != -2; --n)
    objc_storeStrong((id *)&self->_connectionTime[n + 1], 0LL);
  for (iuint64_t i = 0LL; ii != -2; --ii)
    objc_storeStrong((id *)&self->_consecutiveConnectionFailureReason[ii + 1], 0LL);
  for (juint64_t j = 6LL; jj != 4; --jj)
    objc_storeStrong((id *)&(&self->super.isa)[jj], 0LL);
  do
    objc_storeStrong((id *)&(&self->super.isa)[jj--], 0LL);
  while (jj != 2);
  do
    objc_storeStrong((id *)&(&self->super.isa)[jj--], 0LL);
  while (jj * 8);
}

@end