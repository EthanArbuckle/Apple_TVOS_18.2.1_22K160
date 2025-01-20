@interface APSUserCourier
- (APSClientIdentityProvider)clientIdentityProvider;
- (APSDebugOverrides)debugOverrides;
- (APSEnvironment)environment;
- (APSFilterVersionStateMachine)filterVersionStateMachine;
- (APSProtocolConnection)preferredProtocolConnection;
- (APSProtocolConnectionEstablisher)protocolConnectionEstablisher;
- (APSSystemTokenStorage)systemTokenStorage;
- (APSUser)courierUser;
- (APSUserAppIDManager)userAppIDManager;
- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 delegate:(id)a9 withConnectionEstablisher:(id)a10;
- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 filterVersionStateMachine:(id)a9 debugOverrides:(id)a10 delegate:(id)a11 withConnectionEstablisher:(id)a12 tokenStore:(id)a13 tokenRequestQueue:(id)a14;
- (APSUserCourierDelegate)delegate;
- (BOOL)_hasListeningTopics;
- (BOOL)_isIdentityAvailable;
- (BOOL)_isInteractivePushDuringSleepEnabledForConnectionServer:(id)a3;
- (BOOL)_isResponseForProxyDevice:(id)a3;
- (BOOL)_processPendingProxyPresences;
- (BOOL)_processPotentialIdentityChanged;
- (BOOL)_requestKeepAliveProxy;
- (BOOL)_useShortKeepAliveInterval;
- (BOOL)_wakeCausedByTopic:(id)a3 interface:(id)a4 priorityVal:(unint64_t)a5 inAllowlist:(BOOL)a6;
- (BOOL)connectionDelegateHasConnectedUser:(id)a3;
- (BOOL)connectionDelegateIsConnectedToService:(id)a3;
- (BOOL)enabled;
- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3;
- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3 forClient:(id)a4;
- (BOOL)hasConnectedInterface;
- (BOOL)hasConnectedInterfaceForIdentifier:(id)a3;
- (BOOL)hasConnectedInterfaceOfType:(int64_t)a3;
- (BOOL)hasEagerMessages;
- (BOOL)hasFilterChanged;
- (BOOL)hasOutOfDateFilterOnProtocolConnection:(id)a3;
- (BOOL)hasProtocolConnectionInterfaceOfType:(int64_t)a3;
- (BOOL)hasReasonToConnect;
- (BOOL)isCellularWatch;
- (BOOL)isConnectableRightNow;
- (BOOL)isConnectedOnUltraConstrainedInterface;
- (BOOL)isConnectedToService;
- (BOOL)isIdle;
- (BOOL)isInteractivePushDuringSleepEnabled;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)locallyDisabledFilterOptimization;
- (BOOL)protocolConnectionHasSentActivityTrackingSalt:(id)a3;
- (BOOL)serverDisabledFilterOptimization;
- (BOOL)shouldDropPubSubMessageWithData:(id)a3 forTopic:(id)a4;
- (BOOL)shouldForceShortTimeouts;
- (BOOL)shouldHandleIncomingPush:(id)a3 forProtocolConnection:(id)a4;
- (BOOL)shouldOnlySendFilterOnPreferredInterface;
- (BOOL)shouldRun;
- (BOOL)shouldUseInternet;
- (BOOL)wantsCriticalReliability;
- (BOOL)willBeAbleToConnect;
- (NSArray)certificates;
- (NSData)nonce;
- (NSData)publicToken;
- (NSData)signature;
- (NSDate)lastPresence;
- (NSMutableArray)connectionServers;
- (NSMutableArray)subscriptionRequests;
- (NSMutableDictionary)protocolConnectionByIdentifier;
- (NSMutableDictionary)stateByConnectionIdentifier;
- (NSNumber)currentMessageID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ifname;
- (NSString)latestGeoRegion;
- (id)JSONDebugState;
- (id)_copyParsedPayload:(id)a3;
- (id)_findActiveClientWithToken:(id)a3;
- (id)_findClientWithToken:(id)a3;
- (id)_findConnectedClientWithToken:(id)a3 onProtocolConnection:(id)a4;
- (id)_getCurrentTokens;
- (id)_getNextMessageID;
- (id)_proxyManager;
- (id)_topicsByHashFromTopicStateDictionary:(id)a3;
- (id)_ultraConstrainedTopicsFromTopicDictionary:(id)a3;
- (id)allRegisteredChannelsForTopic:(id)a3;
- (id)aps_prettyDescription;
- (id)connectedInterfaceForIdentifier:(id)a3;
- (id)connection:(id)a3 createURLTokenForToken:(id)a4;
- (id)connectionForConnectionPortName:(id)a3;
- (id)copyOperatorName;
- (id)getConnectionTypeFromProtocolConnection:(id)a3;
- (id)stateForProtocolConnection:(id)a3;
- (id)topicManager;
- (id)updateChannelForIncomingMessageWithData:(id)a3 forTopic:(id)a4;
- (id)urlPrefix;
- (id)verboseDescription;
- (int)_protoSubscriptionFailureToReadableFailure:(int)a3;
- (int)_protoUpdateFailureToReadableFailure:(int)a3;
- (int64_t)countOfConnectedInterface;
- (unint64_t)_countActiveClients;
- (unint64_t)_countConnectedClients;
- (unint64_t)getNextTaskMessageId;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (unint64_t)overallCourierStatus;
- (unsigned)disconnectReason;
- (void)__dumpLogsForInconsistencyIfNecessary;
- (void)__performIdleCheck;
- (void)__processStoredIncomingMessagesForConnection:(id)a3;
- (void)_adjustIsConnectedToService;
- (void)_cancelRequest:(id)a3;
- (void)_clearCachedSigNonceCert;
- (void)_clearPendingProxyPresence;
- (void)_clearTopicsForGuestUser;
- (void)_deleteClientIdentityRequestingReplacement;
- (void)_didFinishAssertingAllPresences:(id)a3;
- (void)_disconnectTokenWithReason:(unsigned int)a3 onProtocolConnection:(id)a4;
- (void)_dumpLogsForInconsistencyIfNecessary;
- (void)_enqueueMessage:(id)a3 forOriginator:(id)a4;
- (void)_finishDisconnectForInterface:(id)a3;
- (void)_forceReconnectionsWithReason:(unsigned int)a3;
- (void)_generateSalt;
- (void)_handleAppTokenGenerateResponse:(id)a3 onProtocolConnection:(id)a4;
- (void)_handleChannelUpdateCommand:(id)a3;
- (void)_handleConnectedMessage:(id)a3 onProtocolConnection:(id)a4;
- (void)_handleLostPushTokens;
- (void)_handleMessageMessage:(id)a3 onProtocolConnection:(id)a4 withGeneration:(unint64_t)a5 isWakingMessage:(BOOL)a6 fromAgent:(BOOL)a7;
- (void)_handleOutgoingMessageAcknowledgment:(id)a3 onProtocolConnection:(id)a4;
- (void)_handlePresenceOffline:(id)a3;
- (void)_handlePresenceTrackingResponse:(id)a3 onProtocolConnection:(id)a4;
- (void)_handlePubSubChannelListRequestonProtocolConnection:(id)a3;
- (void)_handlePubSubRequest:(id)a3 unsubscriptionChannels:(id)a4 token:(id)a5;
- (void)_handlePubSubSubscriptionResponse:(id)a3 fromAgent:(BOOL)a4 onProtocolConnection:(id)a5;
- (void)_handlePubSubUpdateMessage:(id)a3 onProtocolConnection:(id)a4;
- (void)_handleSubscriptionUpdateCommand:(id)a3 token:(id)a4 protocolConnection:(id)a5;
- (void)_logTopics;
- (void)_notifyForIncomingMessage:(id)a3;
- (void)_notifyForIncomingMessage:(id)a3 forConnection:(id)a4;
- (void)_performIdleCheck;
- (void)_processInvalidIdentity;
- (void)_processShouldRunChangeIfNecessary;
- (void)_processShouldUseInternetChangeIfNecessary;
- (void)_processStoredIncomingMessages;
- (void)_processStoredIncomingMessagesForConnection:(id)a3;
- (void)_recreateCacheDictionaries;
- (void)_registerAppTokenCleanup;
- (void)_removePendingRequestsForProtocolConnection:(id)a3;
- (void)_requestClientPubSubChannelList:(id)a3 onProtocolConnection:(id)a4;
- (void)_requestToSendFilterOnTopicManager:(id)a3 change:(id)a4;
- (void)_resetCheckpointForIgnoredTopics:(id)a3;
- (void)_retryRequestAfterDelay:(id)a3;
- (void)_retryRequestAfterDelay:(id)a3 withDelay:(double)a4;
- (void)_sendActiveStateMessageWithSendAllBlueListMessages:(BOOL)a3;
- (void)_sendClientFilter:(id)a3 onProtocolConnection:(id)a4;
- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withChange:(id)a4;
- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withReason:(unint64_t)a4;
- (void)_sendOutgoingMessage:(id)a3 onProtocolConnection:(id)a4;
- (void)_sendPresenceMessageOnProtocolConnection:(id)a3 serverTime:(id)a4;
- (void)_sendProxyChannelList:(id)a3 onConnectionType:(int64_t)a4;
- (void)_sendPubsubConnectMessageOnProtocolConnection:(id)a3 token:(id)a4;
- (void)_sendQueuedOutgoingMessages;
- (void)_triggerAutoBugCaptureForInvalidPresence:(id)a3;
- (void)_triggerAutoBugCaptureIfMessageIsRetried:(id)a3;
- (void)_tryConnectingOrDisconnectingTokens;
- (void)_useInteractivePowerAssertionIfNeededForConnectionServer:(id)a3 withReason:(id)a4;
- (void)_writePubSubMessagetoConnection:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6;
- (void)addConnection:(id)a3;
- (void)addTaskServer:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)attemptToRollSalt;
- (void)beginTrackingProtocolConnection:(id)a3;
- (void)canUseProxyChanged;
- (void)client:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7;
- (void)client:(id)a3 requestPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8;
- (void)client:(id)a3 requestSendOutgoingMessage:(id)a4;
- (void)client:(id)a3 requestTokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9;
- (void)client:(id)a3 sendPubSubChannelList:(id)a4 token:(id)a5;
- (void)clientBecameInactive:(id)a3;
- (void)clientIdentityDidBecomeAvailable;
- (void)clientIdentityDidBecomeUnavailable;
- (void)connection:(id)a3 didInvalidateTokenForInfo:(id)a4;
- (void)connection:(id)a3 didReceiveCancellationForOutgoingMessageWithID:(unint64_t)a4;
- (void)connection:(id)a3 didReceiveFakeMessageToSend:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessageReceiptWithTopic:(id)a4 tracingUUID:(id)a5;
- (void)connection:(id)a3 didReceiveOutgoingMessageToSend:(id)a4;
- (void)connection:(id)a3 didReceiveSubscribeToChannels:(id)a4 forTopic:(id)a5;
- (void)connection:(id)a3 didReceiveUnsubscribeToChannels:(id)a4 forTopic:(id)a5;
- (void)connection:(id)a3 didRequestCurrentTokenForInfo:(id)a4;
- (void)connection:(id)a3 didRequestTokenForInfo:(id)a4;
- (void)connection:(id)a3 handleAckIncomingMessageWithGuid:(id)a4 topic:(id)a5 tracingUUID:(id)a6;
- (void)connection:(id)a3 setKeepAliveConfiguration:(unint64_t)a4;
- (void)connection:(id)a3 subscribeToPreviouslyIgnoredTopics:(id)a4;
- (void)connectionChangedCriticalReliability:(id)a3;
- (void)connectionChangedTrackActivityPresence:(id)a3;
- (void)connectionDidClientDisconnect:(id)a3;
- (void)connectionDidOpenonProtocolConnection:(id)a3 secureHandshakeEnabled:(BOOL)a4;
- (void)connectionTopicsChanged:(id)a3;
- (void)connectionWasClosed:(id)a3;
- (void)connectionWasOpened:(id)a3;
- (void)dealloc;
- (void)didRecoverFromSuspensionOnProtocolConnection:(id)a3;
- (void)didSuspendProtocolConnection:(id)a3;
- (void)enumerateAllProtocolConnections:(id)a3;
- (void)enumerateConnectedProtocolConnections:(id)a3;
- (void)enumerateConnectedProtocolConnectionsOfType:(int64_t)a3 block:(id)a4;
- (void)flush;
- (void)generateCertWithServerTime:(id)a3 completionBlock:(id)a4;
- (void)getClientIdentityForcingRefresh:(BOOL)a3 withCompletion:(id)a4;
- (void)handleDisconnectForInterface:(id)a3 connectionState:(int64_t)a4 withReason:(unsigned int)a5;
- (void)handleIgnoredTopics:(id)a3;
- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10;
- (void)invalidateDeviceIdentity;
- (void)logStateWithReason:(id)a3;
- (void)logout;
- (void)markProtocolConnectionDisconnectedForActivityTracking:(id)a3;
- (void)outgoingDataAboutToSendForProtocolConnection:(id)a3;
- (void)outgoingMessageQueue:(id)a3 lateAcknowledgmentForCriticalOutgoingMessage:(id)a4;
- (void)outgoingMessageQueue:(id)a3 requestCriticalMessageFlushWithPaddingLength:(unint64_t)a4;
- (void)outgoingMessageQueue:(id)a3 requestToSendLowPriorityMessages:(id)a4;
- (void)outgoingMessageQueueShortMessageTimeoutExceeded:(id)a3;
- (void)performAppTokenCleanup;
- (void)periodicSignalFired;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)prepareForSleep;
- (void)processIsPowerEfficientToSendChange;
- (void)protocolConnection:(id)a3 didDisconnectWithConnectionState:(int64_t)a4 reason:(unsigned int)a5;
- (void)protocolConnection:(id)a3 receivedFilterUpdateWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedMessageWithParameters:(id)a4 generation:(unint64_t)a5 isWaking:(BOOL)a6;
- (void)protocolConnection:(id)a3 receivedNoStorageWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedOfflinePresencekWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedPresenceTrackingRequestWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedPubSubChannelListWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedPubSubChannelUpdateWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedTaskControlWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedTaskNotificationWithParameters:(id)a4;
- (void)pushTokenBecameInvalidForClient:(id)a3;
- (void)recalculateTrackActivityPresence;
- (void)receivedConnectedResponseWithParameters:(id)a3 onProtocolConnection:(id)a4;
- (void)receivedFilterResponseWithParameters:(id)a3 onProtocolConnection:(id)a4;
- (void)refreshCertNonceAndSignatureWithServerTime:(id)a3 withCompletion:(id)a4;
- (void)removeConnectionForConnectionPortName:(id)a3;
- (void)removeTaskServer:(id)a3;
- (void)requestFilterForClient:(id)a3;
- (void)rollTokenAndReconnect;
- (void)rollTokensForAllBAAEnvironments;
- (void)saveToken:(id)a3 forInfo:(id)a4 connection:(id)a5;
- (void)sendFailuresToClient:(id)a3 pushTopic:(id)a4;
- (void)sendPresenceTrackingRequestOnProtocolConnection:(id)a3;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4;
- (void)setCertificates:(id)a3;
- (void)setClientIdentityProvider:(id)a3;
- (void)setConnectionServers:(id)a3;
- (void)setCourierUser:(id)a3;
- (void)setCurrentMessageID:(id)a3;
- (void)setDebugOverrides:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnectReason:(unsigned int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilterVersionStateMachine:(id)a3;
- (void)setHasFilterChanged:(BOOL)a3;
- (void)setIsConnectedToService:(BOOL)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setLastPresence:(id)a3;
- (void)setLocallyDisabledFilterOptimization:(BOOL)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setProtocolConnectionByIdentifier:(id)a3;
- (void)setProtocolConnectionEstablisher:(id)a3;
- (void)setPublicToken:(id)a3 fromServer:(BOOL)a4;
- (void)setServerDisabledFilterOptimization:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setStateByConnectionIdentifier:(id)a3;
- (void)setSubscriptionRequests:(id)a3;
- (void)setSymptomReporter:(id)a3;
- (void)setSystemTokenStorage:(id)a3;
- (void)setUserAppIDManager:(id)a3;
- (void)subscribeToChannels:(id)a3 forTopic:(id)a4 token:(id)a5;
- (void)subscribeToPreviouslyIgnoredTopics:(id)a3;
- (void)systemDidLock;
- (void)systemDidUnlock;
- (void)topicManagerRequestToSendFilter:(id)a3 change:(id)a4;
- (void)ttlCollection:(id)a3 itemsDidExpire:(id)a4 withStates:(id)a5;
- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4 token:(id)a5;
- (void)updateForReceivedConfig:(id)a3;
@end

@implementation APSUserCourier

- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 delegate:(id)a9 withConnectionEstablisher:(id)a10
{
  id v16 = a3;
  id v34 = a10;
  id v33 = a9;
  id v32 = a8;
  id v31 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v20 = -[APSTokenStore initWithEnvironment:allowInMemoryCache:]( objc_alloc(&OBJC_CLASS___APSTokenStore),  "initWithEnvironment:allowInMemoryCache:",  v16,  0LL);
  v21 = objc_alloc_init(&OBJC_CLASS___APSOutgoingQueue);
  else {
    v22 = 0LL;
  }
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[APSDefaultsDebugOverrides overrideFilterVersion](v22, "overrideFilterVersion"));
  v30 = (void *)v23;
  if (v23)
  {
    v24 = (void *)v23;
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      __int16 v37 = 2112;
      v38 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: Overriding filter version {filterVersionOverride: %@}",  buf,  0x16u);
    }

    v26 = -[APSFilterVersionStateMachine initWithInitialVersion:]( [APSFilterVersionStateMachine alloc],  "initWithInitialVersion:",  [v24 unsignedLongLongValue]);
  }

  else
  {
    v26 = objc_alloc_init(&OBJC_CLASS___APSFilterVersionStateMachine);
  }

  v27 = v26;
  v29 = -[APSUserCourier initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:filterVersionStateMachine:debugOverrides:delegate:withConnectionEstablisher:tokenStore:tokenRequestQueue:]( self,  "initWithEnvironment:courierUser:userPreferences:clientIdentityProvider:userAppIDManager:systemTokenStorage:fil terVersionStateMachine:debugOverrides:delegate:withConnectionEstablisher:tokenStore:tokenRequestQueue:",  v16,  v19,  v18,  v17,  v31,  v32,  v26,  v22,  v33,  v34,  v20,  v21);

  return v29;
}

- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 filterVersionStateMachine:(id)a9 debugOverrides:(id)a10 delegate:(id)a11 withConnectionEstablisher:(id)a12 tokenStore:(id)a13 tokenRequestQueue:(id)a14
{
  id v19 = a3;
  id v96 = a4;
  id v92 = a5;
  id v82 = a6;
  id v95 = a6;
  id v20 = a7;
  id v84 = a7;
  id v93 = a8;
  id v85 = a9;
  id v91 = a10;
  id v94 = a11;
  id v86 = a12;
  id v87 = a13;
  id v88 = a14;
  v102.receiver = self;
  v102.super_class = (Class)&OBJC_CLASS___APSUserCourier;
  v21 = -[APSUserCourier init](&v102, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_environment, a3);
    objc_storeStrong((id *)&v22->_courierUser, a4);
    objc_storeStrong((id *)&v22->_filterVersionStateMachine, a9);
    else {
      unsigned __int8 v23 = 1;
    }
    v22->_BOOL locallyDisabledFilterOptimization = v23;
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v19 domain]);
      v26 = (void *)v25;
      v27 = @"YES";
      BOOL locallyDisabledFilterOptimization = v22->_locallyDisabledFilterOptimization;
      *(_DWORD *)buf = 138413058;
      if (!locallyDisabledFilterOptimization) {
        v27 = @"NO";
      }
      v104 = (const __CFString *)v22;
      __int16 v105 = 2112;
      uint64_t v106 = v25;
      __int16 v107 = 2112;
      id v108 = v96;
      __int16 v109 = 2112;
      v110 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: Initializing a courier with environment %@ user %@ {_locallyDisabledFilterOptimization: %@}",  buf,  0x2Au);
    }

    objc_storeWeak((id *)&v22->_delegate, v94);
    objc_storeStrong((id *)&v22->_userAppIDManager, v20);
    v29 = objc_alloc(&OBJC_CLASS___APSKeychainTopicSaltStore);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    v90 = -[APSKeychainTopicSaltStore initWithEnvironment:multiUserMode:]( v29,  "initWithEnvironment:multiUserMode:",  v19,  v30);

    id v31 = -[APSTopicHasher initWithTopicSaltStore:]( objc_alloc(&OBJC_CLASS___APSTopicHasher),  "initWithTopicSaltStore:",  v90);
    topicHasher = v22->_topicHasher;
    v22->_topicHasher = v31;

    objc_storeStrong((id *)&v22->_tokenStore, a13);
    if (!qword_10014E810) {
      objc_storeStrong((id *)&qword_10014E810, v22);
    }
    objc_storeStrong((id *)&v22->_debugOverrides, a10);
    id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    connectionServers = v22->_connectionServers;
    v22->_connectionServers = v33;

    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connectionPortNamesToConnections = v22->_connectionPortNamesToConnections;
    v22->_connectionPortNamesToConnections = v35;

    __int16 v37 = -[APSOutgoingMessageQueue initWithDelegate:environment:]( objc_alloc(&OBJC_CLASS___APSOutgoingMessageQueue),  "initWithDelegate:environment:",  v22,  v22->_environment);
    outgoingMessageQueue = v22->_outgoingMessageQueue;
    v22->_outgoingMessageQueue = v37;

    objc_storeStrong((id *)&v22->_tokenRequestQueue, a14);
    v22->_slowReceiveThreshold = 60.0;
    v39 = -[APSPushHistory initWithEnvironment:]( objc_alloc(&OBJC_CLASS___APSPushHistory),  "initWithEnvironment:",  v22->_environment);
    pushHistory = v22->_pushHistory;
    v22->_pushHistory = v39;

    v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    protocolConnectionByIdentifier = v22->_protocolConnectionByIdentifier;
    v22->_protocolConnectionByIdentifier = v41;

    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    stateByConnectionIdentifier = v22->_stateByConnectionIdentifier;
    v22->_stateByConnectionIdentifier = v43;

    objc_storeStrong((id *)&v22->_protocolConnectionEstablisher, a12);
    objc_storeStrong((id *)&v22->_systemTokenStorage, a8);
    uint64_t v45 = objc_claimAutoreleasedReturnValue([v93 tokenForEnvironment:v19]);
    cachedPublicToken = v22->_cachedPublicToken;
    v22->_cachedPublicToken = (NSData *)v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance"));
    [v47 setActive:1];

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance"));
    [v48 setWatchesSystemLockState:1];

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance"));
    [v49 addListener:v22];

    uint64_t v50 = objc_claimAutoreleasedReturnValue(+[CUTWeakReference weakRefWithObject:](&OBJC_CLASS___CUTWeakReference, "weakRefWithObject:", v22));
    weakSelf = v22->_weakSelf;
    v22->_weakSelf = (CUTWeakReference *)v50;

    if (sub_100077B08())
    {
      v52 = -[APSTTLCollection initWithQueue:ttlInSeconds:]( objc_alloc(&OBJC_CLASS___APSTTLCollection),  "initWithQueue:ttlInSeconds:",  &_dispatch_main_q,  60.0);
      tracingEnabledAcksCollection = v22->_tracingEnabledAcksCollection;
      v22->_tracingEnabledAcksCollection = v52;

      -[APSTTLCollection setDelegate:](v22->_tracingEnabledAcksCollection, "setDelegate:", v22);
    }

    v54 = -[APSTopicManager initWithEnvironment:topicHasher:user:userPreferences:ultraConstrainedProvider:delegate:]( objc_alloc(&OBJC_CLASS___APSTopicManager),  "initWithEnvironment:topicHasher:user:userPreferences:ultraConstrainedProvider:delegate:",  v19,  v22->_topicHasher,  v96,  v92,  v22,  v22);
    topicManager = v22->_topicManager;
    v22->_topicManager = v54;

    v56 = objc_alloc_init(&OBJC_CLASS___APSWakeMetricTracker);
    wakeMetricTracker = v22->_wakeMetricTracker;
    v22->_wakeMetricTracker = v56;

    v58 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    topicsToCauseWake = v22->_topicsToCauseWake;
    v22->_topicsToCauseWake = v58;

    v60 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    offendingTopics = v22->_offendingTopics;
    v22->_offendingTopics = v60;

    v62 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    inhibitedTopics = v22->_inhibitedTopics;
    v22->_inhibitedTopics = v62;

    v64 = -[APSOutgoingMessageQueue initWithDelegate:environment:]( objc_alloc(&OBJC_CLASS___APSOutgoingMessageQueue),  "initWithDelegate:environment:",  v22,  v19);
    v65 = v22->_outgoingMessageQueue;
    v22->_outgoingMessageQueue = v64;

    v22->_disconnectReason = 0;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](v22->_environment, "domain"));
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-waitingformessages-%@",  APSBundleIdentifier,  v66));

    v68 = -[APSNoOpPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSNoOpPowerAssertion),  "initWithName:category:holdDuration:",  v67,  200LL,  20.0);
    waitForStoredMessagesToArrivePowerAssertion = v22->_waitForStoredMessagesToArrivePowerAssertion;
    v22->_waitForStoredMessagesToArrivePowerAssertion = v68;

    objc_initWeak(&location, v22);
    objc_storeStrong((id *)&v22->_clientIdentityProvider, v82);
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = sub_100021B1C;
    v99[3] = &unk_10011E6C0;
    objc_copyWeak(&v100, &location);
    [v95 setIdentityAvailabilityDidChangeBlock:v99];
    if (sub_1000784BC() && [v96 isDefaultUser])
    {
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472LL;
      v97[2] = sub_100021B4C;
      v97[3] = &unk_10011E4F0;
      v98 = v22;
      [v95 setBaaIdentityRefreshedBlock:v97];
    }

    -[APSUserCourier getClientIdentityForcingRefresh:withCompletion:]( v22,  "getClientIdentityForcingRefresh:withCompletion:",  0LL,  0LL);
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    unsigned int v71 = [v70 isMultiUser];

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    unsigned int v73 = [v72 isLoggedInUser];

    v74 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserFS sharedInstance](&OBJC_CLASS___APSMultiUserFS, "sharedInstance"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 systemPath]);

    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = @"NO";
      if (v71) {
        v78 = @"YES";
      }
      else {
        v78 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      v104 = v78;
      __int16 v105 = 2112;
      if (v73) {
        v77 = @"YES";
      }
      uint64_t v106 = (uint64_t)v77;
      __int16 v107 = 2112;
      id v108 = v75;
      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "APSD is under multi user mode: %@, with a logged in user: %@, systemPath: %@",  buf,  0x20u);
    }

    v79 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeTaskServers = v22->_activeTaskServers;
    v22->_activeTaskServers = v79;

    v22->_nextTaskMessageId = 1LL;
    -[APSUserCourier _registerAppTokenCleanup](v22, "_registerAppTokenCleanup");

    objc_destroyWeak(&v100);
    objc_destroyWeak(&location);
  }

  return v22;
}

- (void)dealloc
{
  weakSelf = self->_weakSelf;
  self->_weakSelf = 0LL;

  -[APSTopicManager setDelegate:](self->_topicManager, "setDelegate:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance"));
  [v4 removeListener:self];

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v9) setDelegate:0];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v7);
  }

  -[PCPersistentTimer invalidate](self->_pendingMessageReconnectTimer, "invalidate");
  -[PCPersistentTimer invalidate](self->_delayedReconnectTimer, "invalidate");
  if ((APSUserCourier *)qword_10014E810 == self)
  {
    qword_10014E810 = 0LL;
  }

  activeTaskServers = self->_activeTaskServers;
  self->_activeTaskServers = 0LL;

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v11 = self->_proxyClients;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v15)));
        [v16 setDelegate:0];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    }

    while (v13);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___APSUserCourier;
  -[APSUserCourier dealloc](&v17, "dealloc");
}

- (id)_proxyManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained proxyManager]);

  return v3;
}

- (id)topicManager
{
  return self->_topicManager;
}

- (id)copyOperatorName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PCCarrierBundleHelper helper](&OBJC_CLASS___PCCarrierBundleHelper, "helper"));
  id v3 = [v2 copyValueForKey:APSCarrierNameKey error:0];

  return v3;
}

- (id)_getCurrentTokens
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }

  return v3;
}

- (unint64_t)overallCourierStatus
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 3LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100021F04;
  v4[3] = &unk_10011E6E8;
  v4[4] = self;
  v4[5] = &v5;
  -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_adjustIsConnectedToService
{
  if (-[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface"))
  {
    BOOL v3 = 1LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    BOOL v3 = [v4 countConnectedInterfaces] != 0;
  }

  -[APSUserCourier setIsConnectedToService:](self, "setIsConnectedToService:", v3);
}

- (void)setIsConnectedToService:(BOOL)a3
{
  if (self->_isConnectedToService != a3)
  {
    BOOL v4 = a3;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"NO";
      if (v4) {
        id v6 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      __int128 v19 = self;
      __int16 v20 = 2112;
      __int128 v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ setting isConnectedToService %@",  buf,  0x16u);
    }

    self->_isConnectedToService = v4;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) handleConnectionStatusChanged:self->_isConnectedToService];
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained courierConnectionStatusDidChange:self];

  -[APSUserCourier attemptToRollSalt](self, "attemptToRollSalt");
}

- (void)setPublicToken:(id)a3 fromServer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSData *)a3;
  uint64_t v7 = self->_cachedPublicToken;
  id v8 = v7;
  if (v7 != v6 && (!v7 || !-[NSData isEqualToData:](v6, "isEqualToData:", v7)))
  {
    if (self->_cachedPublicToken) {
      BOOL v9 = v6 == 0LL;
    }
    else {
      BOOL v9 = 0;
    }
    if (v8) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v6 != 0LL;
    }
    uint64_t v11 = v4 | v9;
    if ((_DWORD)v11 == 1)
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v13 = @"NO";
        if (v4) {
          __int128 v14 = @"YES";
        }
        else {
          __int128 v14 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v35 = self;
        __int16 v36 = 2112;
        if (v9) {
          __int128 v13 = @"YES";
        }
        __int16 v37 = v14;
        __int16 v38 = 2112;
        v39 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ Nuking app-specific tokens. FromServer %@  lostToken %@",  buf,  0x20u);
      }

      tokenStore = self->_tokenStore;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
      -[APSTokenStore deleteAppTokensForUser:](tokenStore, "deleteAppTokensForUser:", v16);

      objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v18 = -[NSData length](v6, "length");
        __int128 v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSData debugDescription](v6, "debugDescription"));
        *(_DWORD *)buf = 138412802;
        v35 = self;
        __int16 v36 = 2048;
        __int16 v37 = v18;
        __int16 v38 = 2112;
        v39 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@ Updating device push token in the keychain to [length = %lu, token = %@]",  buf,  0x20u);
      }

      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier systemTokenStorage](self, "systemTokenStorage"));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
      [v20 setToken:v6 forEnvironment:v21];
    }

    __int128 v22 = (NSData *)-[NSData copy](v6, "copy");
    cachedPublicToken = self->_cachedPublicToken;
    self->_cachedPublicToken = v22;

    if (v10) {
      -[APSUserCourier _requestToSendFilterOnTopicManager:change:]( self,  "_requestToSendFilterOnTopicManager:change:",  self->_topicManager,  0LL);
    }
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
    id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)i) setPublicToken:v6 needsAck:v11];
        }

        id v26 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v26);
    }

    if (v9) {
      -[APSUserCourier _handleLostPushTokens](self, "_handleLostPushTokens");
    }
  }
}

- (unint64_t)messageSize
{
  return -[APSEnvironment messageSize](self->_environment, "messageSize");
}

- (void)setMessageSize:(unint64_t)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v5 = self->_proxyClients;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v9)));
        [v10 setMessageSize:a3];

        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v7);
  }

  if (-[APSEnvironment messageSize](self->_environment, "messageSize") != a3)
  {
    -[APSEnvironment setMessageSize:](self->_environment, "setMessageSize:", a3);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        __int128 v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setMessageSize:a3];
          __int128 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }

      while (v13);
    }
  }

- (unint64_t)largeMessageSize
{
  unint64_t v3 = -[APSEnvironment largeMessageSize](self->_environment, "largeMessageSize");
  unint64_t result = -[APSUserCourier messageSize](self, "messageSize");
  if (v3 > result) {
    return v3;
  }
  return result;
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v5 = self->_proxyClients;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v9)));
        [v10 setLargeMessageSize:a3];

        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v7);
  }

  if (-[APSEnvironment largeMessageSize](self->_environment, "largeMessageSize") != a3)
  {
    -[APSEnvironment setLargeMessageSize:](self->_environment, "setLargeMessageSize:", a3);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        __int128 v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setLargeMessageSize:a3];
          __int128 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }

      while (v13);
    }
  }

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager logString](self->_topicManager, "logString"));
      int v8 = 138412802;
      BOOL v9 = self;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ setEnabled %@   %@", (uint8_t *)&v8, 0x20u);
    }

    -[APSUserCourier _processStoredIncomingMessages](self, "_processStoredIncomingMessages");
    -[APSUserCourier _processStoredOutgoingMessages](self, "_processStoredOutgoingMessages");
    -[APSUserCourier _processShouldRunChangeIfNecessary](self, "_processShouldRunChangeIfNecessary");
  }

- (BOOL)shouldRun
{
  self->_shouldRun = self->_enabled;
  unint64_t v3 = -[APSUserCourier _countActiveClients](self, "_countActiveClients");
  if (self->_shouldRun)
  {
    unint64_t v4 = v3;
    BOOL result = -[APSUserCourier _hasListeningTopics](self, "_hasListeningTopics");
    if (v4) {
      BOOL result = 1;
    }
  }

  else
  {
    BOOL result = 0;
  }

  self->_shouldRun = result;
  return result;
}

- (BOOL)shouldUseInternet
{
  BOOL v3 = -[APSUserCourier shouldRun](self, "shouldRun");
  if (v3) {
    LOBYTE(v3) = !-[APSUserCourier hasProtocolConnectionInterfaceOfType:]( self,  "hasProtocolConnectionInterfaceOfType:",  2LL);
  }
  self->_shouldUseInternet = v3;
  return v3;
}

- (BOOL)isCellularWatch
{
  return 0;
}

- (BOOL)_useShortKeepAliveInterval
{
  if (qword_10014E820 != -1) {
    dispatch_once(&qword_10014E820, &stru_10011E708);
  }
  return byte_10014E818;
}

- (BOOL)hasEagerMessages
{
  return -[APSOutgoingMessageQueue hasEagerMessages](self->_outgoingMessageQueue, "hasEagerMessages");
}

- (BOOL)wantsCriticalReliability
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) enableCriticalReliability])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)isIdle
{
  return 0;
}

- (BOOL)isInteractivePushDuringSleepEnabled
{
  if (!-[APSUserCourier _requestKeepAliveProxy](self, "_requestKeepAliveProxy")
    || !-[APSUserCourier isConnectableRightNow](self, "isConnectableRightNow"))
  {
    return 0;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
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
        if (-[APSUserCourier _isInteractivePushDuringSleepEnabledForConnectionServer:]( self,  "_isInteractivePushDuringSleepEnabledForConnectionServer:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i)))
        {
          BOOL v8 = 1;
          goto LABEL_14;
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
LABEL_14:

  return v8;
}

- (BOOL)isKeepAliveProxyConfigured
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isConnectableRightNow
{
  BOOL v3 = -[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable");
  if (v3) {
    LOBYTE(v3) = -[APSUserCourier shouldUseInternet](self, "shouldUseInternet");
  }
  return v3;
}

- (BOOL)hasReasonToConnect
{
  BOOL v3 = -[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable");
  if (v3) {
    LOBYTE(v3) = -[APSUserCourier shouldRun](self, "shouldRun");
  }
  return v3;
}

- (BOOL)_hasListeningTopics
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = -[APSTopicManager hasListeningTopics](self->_topicManager, "hasListeningTopics");
    id v5 = @"NO";
    if (v4) {
      id v5 = @"YES";
    }
    int v7 = 138412546;
    BOOL v8 = self;
    __int16 v9 = 2112;
    __int128 v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ _hasListeningTopics %@",  (uint8_t *)&v7,  0x16u);
  }

  return -[APSTopicManager hasListeningTopics](self->_topicManager, "hasListeningTopics");
}

- (NSData)publicToken
{
  cachedPublicToken = self->_cachedPublicToken;
  if (!cachedPublicToken)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier systemTokenStorage](self, "systemTokenStorage"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
    uint64_t v6 = (NSData *)objc_claimAutoreleasedReturnValue([v4 tokenForEnvironment:v5]);
    int v7 = self->_cachedPublicToken;
    self->_cachedPublicToken = v6;

    -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", self->_cachedPublicToken, 0LL);
    cachedPublicToken = self->_cachedPublicToken;
  }

  return cachedPublicToken;
}

- (BOOL)_isInteractivePushDuringSleepEnabledForConnectionServer:(id)a3
{
  return 0;
}

- (BOOL)_requestKeepAliveProxy
{
  return 0;
}

- (BOOL)willBeAbleToConnect
{
  if (-[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable"))
  {
    LOBYTE(v2) = 1;
  }

  else
  {
    BOOL v2 = +[APSSimulatorSupport isSimulator](&OBJC_CLASS___APSSimulatorSupport, "isSimulator");
    if (v2) {
      LOBYTE(v2) = +[APSSimulatorSupport isHardwareSupported](&OBJC_CLASS___APSSimulatorSupport, "isHardwareSupported");
    }
  }

  return v2;
}

- (void)logStateWithReason:(id)a3
{
  unsigned int v4 = (__CFString *)a3;
  id v5 = v4;
  uint64_t v6 = @"STATEDUMP";
  if (v4) {
    uint64_t v6 = v4;
  }
  int v7 = v6;
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courierOversized](&OBJC_CLASS___APSLog, "courierOversized"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier verboseDescription](self, "verboseDescription"));
    int v10 = 138412546;
    __int128 v11 = v7;
    __int16 v12 = 2112;
    __int128 v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)verboseDescription
{
  __int128 v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  id v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v6);
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
        v28[0] = v9;
        int v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);
        v28[1] = v11;
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v12, v7);

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v4);
  }

  uint64_t v13 = APSPrettyPrintCollection(v23, 1LL, 0LL, 2LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = APSPrettyPrintObject(self->_filterVersionStateMachine, 2LL);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_proxyClients, "allValues"));
  uint64_t v18 = APSPrettyPrintCollection(v17, 1LL, 0LL, 2LL);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ protocol connections: %@ filter version state: %@ proxy clients: %@",  self,  v14,  v16,  v19));

  return v20;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p %@ %@>",  v3,  self,  v5,  v7));

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  uint64_t v15 = objc_opt_class(self, a2);
  courierUser = self->_courierUser;
  unint64_t v4 = -[APSUserCourier _countActiveClients](self, "_countActiveClients");
  if (-[APSUserCourier shouldUseInternet](self, "shouldUseInternet")) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
  if (-[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable")) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  uint64_t v10 = APSPrettyPrintCollection(v9, 1LL, 1LL, 1LL);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager logString](self->_topicManager, "logString"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: user=%@, activeClients=%lu, shouldUseInternet=%@, publicToken=%@, isIdentityAvailable=%@, connectionServers=%@, deviceTopicManager=%@>",  v15,  self,  courierUser,  v4,  v5,  v7,  v8,  v11,  v12));

  return (NSString *)v13;
}

- (id)aps_prettyDescription
{
  __int16 v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  v35 = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pubSubName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allRegisteredChannelsForEnvironment:v4 userName:v6]);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 channelID]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 channelTopic]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@, topic=%@, checkpoint=%llu>",  v14,  v15,  [v13 checkpoint]));
        -[NSMutableArray addObject:](v36, "addObject:", v16);
      }

      id v10 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v10);
  }

  id v34 = v8;

  uint64_t v17 = APSPrettyPrintObject(v35->_courierUser, 2LL);
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v35->_proxyClients, "allValues"));
  uint64_t v18 = APSPrettyPrintCollection(v33, 1LL, 1LL, 2LL);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v18);
  __int128 v19 = @"NO";
  if (-[APSUserCourier shouldUseInternet](v35, "shouldUseInternet")) {
    __int128 v20 = @"YES";
  }
  else {
    __int128 v20 = @"NO";
  }
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](v35, "publicToken"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 debugDescription]);
  if (-[APSUserCourier _isIdentityAvailable](v35, "_isIdentityAvailable")) {
    __int128 v19 = @"YES";
  }
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](v35, "connectionServers"));
  uint64_t v24 = APSPrettyPrintCollection(v23, 1LL, 1LL, 2LL);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager logString](v35->_topicManager, "logString"));
  uint64_t v27 = APSPrettyPrintCollection(v36, 1LL, 0LL, 0LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<user=%@, activeClients=%@, shouldUseInternet=%@, publicToken=%@, isIdentityAvailable=%@, connectionServers=%@, deviceTopicManager=%@, channels=%@>",  v32,  v31,  v20,  v22,  v19,  v25,  v26,  v28));

  return v29;
}

- (id)JSONDebugState
{
  v54[0] = @"enabled";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_enabled));
  v54[1] = @"connectedToService";
  v55[0] = v3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isConnectedToService));
  v55[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  2LL));
  id v6 = [v5 mutableCopy];

  lastReceivedTopic = self->_lastReceivedTopic;
  if (lastReceivedTopic)
  {
    [v6 setObject:lastReceivedTopic forKeyedSubscript:@"lastReceivedTopic"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_lastReceivedTopicTime));
    [v6 setObject:v8 forKeyedSubscript:@"lastReceivedTopicTime"];
  }

  if (self->_lastClientRequestedKeepaliveTime != 0.0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v6 setObject:v9 forKeyedSubscript:@"lastKeepaliveRequestTime"];

    -[NSDate timeIntervalSinceReferenceDate](self->_timeSinceLastKeepAlive, "timeIntervalSinceReferenceDate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v6 setObject:v10 forKeyedSubscript:@"lastKeepaliveResponseTime"];
  }

  __int128 v40 = v6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  __int128 v39 = self;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pubSubName]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 allRegisteredChannelsForEnvironment:v12 userName:v14]);

  __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(obj);
        }
        __int128 v21 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 channelTopic]);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v22));

        if (!v23)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 channelTopic]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v24, v25);
        }

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v21 channelTopic]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v26));
        v51[0] = @"channel";
        v28 = (void *)objc_claimAutoreleasedReturnValue([v21 channelID]);
        v51[1] = @"checkpoint";
        v52[0] = v28;
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v21 checkpoint]));
        v52[1] = v29;
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));
        [v27 addObject:v30];
      }

      id v18 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }

    while (v18);
  }

  [v40 setObject:v16 forKeyedSubscript:@"channels"];
  __int128 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](v39, "connectionServers"));
  id v33 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v43;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(v32);
        }
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * (void)j) JSONDebugState]);
        -[NSMutableArray addObject:](v31, "addObject:", v37);
      }

      id v34 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }

    while (v34);
  }

  [v40 setObject:v31 forKeyedSubscript:@"connectionServers"];
  return v40;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  if (self->_isConnectedToService)
  {
    uint64_t v5 = @"Connected";
  }

  else if (self->_enabled)
  {
    if (self->_disconnectingStream)
    {
      uint64_t v5 = @"Disconnecting";
    }

    else if (-[APSUserCourier _hasListeningTopics](self, "_hasListeningTopics"))
    {
      if (-[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable")) {
        uint64_t v5 = @"Unknown";
      }
      else {
        uint64_t v5 = @"Not connected because the device identity is not available";
      }
    }

    else
    {
      uint64_t v5 = @"Not connected because there are no eligible topics";
    }
  }

  else
  {
    uint64_t v5 = @"Disabled";
  }

  [v4 appendDescription:@"courier status" stringValue:v5];
  [v4 pushIndent];
  [v4 appendDescription:@"enabled" BOOLValue:self->_enabled];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  objc_msgSend( v4,  "appendDescription:BOOLValue:",  @"stream connected",  objc_msgSend(v6, "countOpenConnections") != 0);

  objc_msgSend( v4,  "appendDescription:BOOLValue:",  @"stream connected",  -[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface"));
  [v4 appendDescription:@"connected to service" BOOLValue:self->_isConnectedToService];
  [v4 pushIndent];
  if (self->_successfulConnectionCount >= 1) {
    objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"successful connections");
  }
  [v4 popIndent];
  if (self->_lastReceivedTopic)
  {
    objc_msgSend(v4, "appendDescription:stringValue:", @"last received topic");
    [v4 appendDescription:@"last received topic time" timeIntervalValue:self->_lastReceivedTopicTime];
  }

  if (self->_lastClientRequestedKeepaliveTime != 0.0)
  {
    objc_msgSend(v4, "appendDescription:timeIntervalValue:", @"last keepalive request time");
    [v4 appendDescription:@"last keepalive response time" dateValue:self->_timeSinceLastKeepAlive];
  }

  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled](&OBJC_CLASS___APSTCPStream, "isKeepAliveProxyFeatureEnabled")
    && -[APSUserCourier _requestKeepAliveProxy](self, "_requestKeepAliveProxy"))
  {
    if (self->_lastReceivedTopicToCauseWake)
    {
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      uint64_t v7 = self->_topicsToCauseWake;
      id v8 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v86,  v96,  16LL);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = 0LL;
        uint64_t v11 = *(void *)v87;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v87 != v11) {
              objc_enumerationMutation(v7);
            }
            v10 += -[NSCountedSet countForObject:]( self->_topicsToCauseWake,  "countForObject:",  *(void *)(*((void *)&v86 + 1) + 8LL * (void)i));
          }

          id v9 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v86,  v96,  16LL);
        }

        while (v9);
      }

      else
      {
        uint64_t v10 = 0LL;
      }

      [v4 appendDescription:@"total push wakes" unsignedIntegerValue:v10];
      [v4 pushIndent];
      [v4 appendDescription:@"last push wake topic" stringValue:self->_lastReceivedTopicToCauseWake];
      [v4 appendDescription:@"last push wake time" timeIntervalValue:self->_lastReceivedTopicToCauseWakeTime];
      objc_msgSend( v4,  "appendDescription:unsignedIntegerValue:",  @"push wake topics",  -[NSCountedSet count](self->_topicsToCauseWake, "count"));
      [v4 pushIndent];
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      uint64_t v13 = self->_topicsToCauseWake;
      id v14 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v82,  v95,  16LL);
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v83;
        do
        {
          for (j = 0LL; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v83 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v82 + 1) + 8LL * (void)j);
            [v4 appendDescription:@"push wake topic" stringValue:v18];
            [v4 pushIndent];
            objc_msgSend( v4,  "appendDescription:unsignedIntegerValue:",  @"push wakes",  -[NSCountedSet countForObject:](self->_topicsToCauseWake, "countForObject:", v18));
            if (-[NSCountedSet containsObject:](self->_offendingTopics, "containsObject:", v18)) {
              objc_msgSend( v4,  "appendDescription:unsignedIntegerValue:",  @"offending messages",  -[NSCountedSet countForObject:](self->_offendingTopics, "countForObject:", v18));
            }
            [v4 popIndent];
          }

          id v15 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v82,  v95,  16LL);
        }

        while (v15);
      }

      [v4 popIndent];
      [v4 popIndent];
    }

    [v4 pushIndent];
    if (self->_findKeepAliveProxyInterfaceFailureCount) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"interface available failures");
    }
    if (self->_forceKeepAliveProxyInterfaceFailureCount) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"interface switch failures");
    }
    if (self->_obtainKeepAliveProxyFailureCount) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"proxy request failures");
    }
    [v4 popIndent];
  }

  if (-[APSUserCourier isInteractivePushDuringSleepEnabled](self, "isInteractivePushDuringSleepEnabled")) {
    objc_msgSend( v4,  "appendDescription:BOOLValue:",  @"interactive push",  -[APSUserCourier isInteractivePushDuringSleepEnabled](self, "isInteractivePushDuringSleepEnabled"));
  }
  if (-[NSCountedSet count](self->_inhibitedTopics, "count"))
  {
    objc_msgSend( v4,  "appendDescription:unsignedIntegerValue:",  @"inhibited topics",  -[NSCountedSet count](self->_inhibitedTopics, "count"));
    [v4 pushIndent];
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    uint64_t v19 = self->_inhibitedTopics;
    id v20 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v78,  v94,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v79;
      do
      {
        for (k = 0LL; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v79 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v78 + 1) + 8LL * (void)k);
          [v4 appendDescription:@"inhibited topic" stringValue:v24];
          [v4 pushIndent];
          objc_msgSend( v4,  "appendDescription:unsignedIntegerValue:",  @"inhibited messages",  -[NSCountedSet countForObject:](self->_inhibitedTopics, "countForObject:", v24));
          [v4 popIndent];
        }

        id v21 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v78,  v94,  16LL);
      }

      while (v21);
    }

    [v4 popIndent];
  }

  -[APSOutgoingMessageQueue appendPrettyStatusToStatusPrinter:]( self->_outgoingMessageQueue,  "appendPrettyStatusToStatusPrinter:",  v4);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pubSubName]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v25 allRegisteredChannelsForEnvironment:v26 userName:v28]);

  objc_msgSend(v4, "appendDescription:unsignedLongLongValue:", @"subscribed channels", objc_msgSend(v29, "count"));
  [v4 pushIndent];
  __int128 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id obj = v29;
  id v31 = [obj countByEnumeratingWithState:&v74 objects:v93 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v75;
    do
    {
      for (m = 0LL; m != v32; m = (char *)m + 1)
      {
        if (*(void *)v75 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)m);
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 channelTopic]);
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v36));

        if (!v37)
        {
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v35 channelTopic]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v38, v39);
        }

        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v35 channelTopic]);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v40));
        [v41 addObject:v35];
      }

      id v32 = [obj countByEnumeratingWithState:&v74 objects:v93 count:16];
    }

    while (v32);
  }

  v57 = self;

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  v61 = v30;
  id v60 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v70,  v92,  16LL);
  if (v60)
  {
    uint64_t v59 = *(void *)v71;
    do
    {
      for (n = 0LL; n != v60; n = (char *)n + 1)
      {
        if (*(void *)v71 != v59) {
          objc_enumerationMutation(v61);
        }
        uint64_t v43 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)n);
        [v4 pushIndent];
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v61, "objectForKeyedSubscript:", v43));
        objc_msgSend(v4, "appendDescription:unsignedLongLongValue:", v43, objc_msgSend(v44, "count"));
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v45 = v44;
        id v46 = [v45 countByEnumeratingWithState:&v66 objects:v91 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v67;
          do
          {
            for (ii = 0LL; ii != v47; ii = (char *)ii + 1)
            {
              if (*(void *)v67 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)ii);
              [v4 pushIndent];
              v51 = (void *)objc_claimAutoreleasedReturnValue([v50 channelID]);
              [v4 appendDescription:@"channel" stringValue:v51];

              [v4 pushIndent];
              objc_msgSend( v4,  "appendDescription:unsignedLongLongValue:",  @"checkpoint",  objc_msgSend(v50, "checkpoint"));
              [v4 popIndent];
              [v4 popIndent];
            }

            id v47 = [v45 countByEnumeratingWithState:&v66 objects:v91 count:16];
          }

          while (v47);
        }

        [v4 popIndent];
      }

      id v60 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v70,  v92,  16LL);
    }

    while (v60);
  }

  [v4 popIndent];
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](v57, "connectionServers"));
  id v53 = [v52 countByEnumeratingWithState:&v62 objects:v90 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v63;
    do
    {
      for (jj = 0LL; jj != v54; jj = (char *)jj + 1)
      {
        if (*(void *)v63 != v55) {
          objc_enumerationMutation(v52);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * (void)jj) appendPrettyStatusToStatusPrinter:v4];
      }

      id v54 = [v52 countByEnumeratingWithState:&v62 objects:v90 count:16];
    }

    while (v54);
  }

  [v4 popIndent];
}

- (void)setSymptomReporter:(id)a3
{
}

- (void)_triggerAutoBugCaptureIfMessageIsRetried:(id)a3
{
  id v4 = a3;
  if (sub_100077B08())
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 topic]);
    unsigned int v6 = [v5 isEqualToString:@"com.apple.madrid"];

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"rc"]);
      int v9 = [v8 intValue];

      if (v9 >= 1)
      {
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"U"]);
          __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"rc"]);
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 1024;
          unsigned int v20 = [v12 intValue];
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "triggering ABC for message with guid %@ retry count %d",  buf,  0x12u);
        }

        if (!self->_symptomReporter)
        {
          uint64_t v13 = objc_alloc_init(&OBJC_CLASS___APSSymptomReporter);
          symptomReporter = self->_symptomReporter;
          self->_symptomReporter = v13;
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"rc"]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"RetryCount%d",  [v15 intValue]));

        -[APSSymptomReporter reportSymptomToAutoBugCapture:subType:]( self->_symptomReporter,  "reportSymptomToAutoBugCapture:subType:",  @"RetriedMessage",  v16);
      }
    }
  }
}

- (void)_dumpLogsForInconsistencyIfNecessary
{
  if ((APSUserCourier *)qword_10014E810 == self)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__dumpLogsForInconsistencyIfNecessary",  0LL);
    -[APSUserCourier performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "__dumpLogsForInconsistencyIfNecessary",  0LL,  1.0);
  }

- (void)__dumpLogsForInconsistencyIfNecessary
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&qword_10014E830 > 7200.0)
  {
    id v4 = (void *)qword_10014E828;
    qword_10014E828 = 0LL;
  }

  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    uint64_t v7 = qword_10014E838;
    qword_10014E838 = 0LL;
    uint64_t v19 = 0LL;
    unsigned int v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    char v22 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100024BCC;
    v18[3] = &unk_10011E730;
    v18[4] = &v19;
    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  1LL,  v18);
    if (*((_BYTE *)v20 + 24))
    {
      qword_10014E838 = *(void *)&Current;
      id v8 = @"APSD - WiFi LQ is OFF but wifi reachability is YES";
    }

    else
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      LOBYTE(v24) = 0;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100024C2C;
      v17[3] = &unk_10011E730;
      v17[4] = buf;
      -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  0LL,  v17);
      if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
      {
        qword_10014E838 = *(void *)&Current;
        id v8 = @"APSD - WWAN LQ is OFF but WWAN reachability is YES";
      }

      else
      {
        id v8 = 0LL;
      }

      _Block_object_dispose(buf, 8);
    }

    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = qword_10014E838;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "__dumpLogsForInconsistencyIfNecessary - lastBecameInconsistentTime %f  sBecameInconsistentTime %f  logDumpReason %@",  buf,  0x20u);
    }

    double v10 = 1.0;
    if (*(double *)&v7 > 1.0)
    {
      double v10 = *(double *)&qword_10014E838 - *(double *)&v7;
      if (*(double *)&qword_10014E838 - *(double *)&v7 > 60.0)
      {
        BOOL v11 = v8 != 0LL;
LABEL_18:
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[PCSimpleTimer lastSystemWakeDate](&OBJC_CLASS___PCSimpleTimer, "lastSystemWakeDate", v10));
        [v12 timeIntervalSinceReferenceDate];
        BOOL v14 = v13 <= *(double *)&v7;

        if (v8) {
          BOOL v15 = v11;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15 && v14 && ([(id)qword_10014E828 isEqualToString:v8] & 1) == 0)
        {
          uint64_t v16 = (void *)qword_10014E828;
          qword_10014E828 = (uint64_t)v8;

          qword_10014E830 = *(void *)&Current;
        }

        _Block_object_dispose(&v19, 8);
        return;
      }

      if (v8)
      {
        BOOL v11 = 0;
        qword_10014E838 = v7;
        goto LABEL_18;
      }
    }

    BOOL v11 = 0;
    goto LABEL_18;
  }

- (void)_logTopics
{
  uint64_t v3 = objc_autoreleasePoolPush();
  if (+[APSLog shouldPowerLogEvent:]( &OBJC_CLASS___APSLog,  "shouldPowerLogEvent:",  @"Courier Topics Changed"))
  {
    uint64_t v43 = v3;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v5));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"Environment");

    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
    id v46 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v69;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v69 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v7;
          id v8 = *(void **)(*((void *)&v68 + 1) + 8 * v7);
          context = objc_autoreleasePoolPush();
          int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          double v10 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          BOOL v11 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          uint64_t v50 = v8;
          v51 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 enabledTopics]);
          id v13 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v65;
            uint64_t v16 = &stru_100123240;
            do
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v65 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[NSMutableString appendFormat:]( v9,  "appendFormat:",  @"%@%@",  v16,  *(void *)(*((void *)&v64 + 1) + 8LL * (void)i));
                uint64_t v16 = @", ";
              }

              id v14 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
              uint64_t v16 = @", ";
            }

            while (v14);
          }

          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v50 ignoredTopics]);
          id v19 = [v18 countByEnumeratingWithState:&v60 objects:v74 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v61;
            char v22 = &stru_100123240;
            do
            {
              for (j = 0LL; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v61 != v21) {
                  objc_enumerationMutation(v18);
                }
                -[NSMutableString appendFormat:]( v10,  "appendFormat:",  @"%@%@",  v22,  *(void *)(*((void *)&v60 + 1) + 8LL * (void)j));
                char v22 = @", ";
              }

              id v20 = [v18 countByEnumeratingWithState:&v60 objects:v74 count:16];
              char v22 = @", ";
            }

            while (v20);
          }

          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v50 opportunisticTopics]);
          id v25 = [v24 countByEnumeratingWithState:&v56 objects:v73 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v57;
            v28 = &stru_100123240;
            do
            {
              for (k = 0LL; k != v26; k = (char *)k + 1)
              {
                if (*(void *)v57 != v27) {
                  objc_enumerationMutation(v24);
                }
                -[NSMutableString appendFormat:]( v11,  "appendFormat:",  @"%@%@",  v28,  *(void *)(*((void *)&v56 + 1) + 8LL * (void)k));
                v28 = @", ";
              }

              id v26 = [v24 countByEnumeratingWithState:&v56 objects:v73 count:16];
              v28 = @", ";
            }

            while (v26);
          }

          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v50 nonWakingTopics]);
          id v31 = [v30 countByEnumeratingWithState:&v52 objects:v72 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v53;
            id v34 = &stru_100123240;
            do
            {
              for (m = 0LL; m != v32; m = (char *)m + 1)
              {
                if (*(void *)v53 != v33) {
                  objc_enumerationMutation(v30);
                }
                -[NSMutableString appendFormat:]( v51,  "appendFormat:",  @"%@%@",  v34,  *(void *)(*((void *)&v52 + 1) + 8LL * (void)m));
                id v34 = @", ";
              }

              id v32 = [v30 countByEnumeratingWithState:&v52 objects:v72 count:16];
              id v34 = @", ";
            }

            while (v32);
          }

          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v50 processName]);
          id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(enabledTopics)",  v36));

          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, v47);
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v50 processName]);
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(ignoredTopics)",  v37));

          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v38);
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v50 processName]);
          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(opportunisticTopics)",  v39));

          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v50 processName]);
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(nonWakingTopics)",  v41));

          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v51, v42);
          objc_autoreleasePoolPop(context);
          uint64_t v7 = v49 + 1;
        }

        while ((id)(v49 + 1) != v46);
        id v46 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      }

      while (v46);
    }

    APSPowerLog(@"Courier Topics Changed", v4);
    uint64_t v3 = v43;
  }

  objc_autoreleasePoolPop(v3);
}

- (void)addConnection:(id)a3
{
  id v4 = a3;
  -[APSUserCourier _useInteractivePowerAssertionIfNeededForConnectionServer:withReason:]( self,  "_useInteractivePowerAssertionIfNeededForConnectionServer:withReason:",  v4,  @"adding interactive");
  if (v4) {
    -[NSMutableArray addObject:](self->_connectionServers, "addObject:", v4);
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  -[APSUserCourier _recreateCacheDictionaries](self, "_recreateCacheDictionaries");
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ adding connectionserver %@, setting publicToken:%@",  (uint8_t *)&v7,  0x20u);
  }

  [v4 setPublicToken:v5 needsAck:0];
  objc_msgSend(v4, "setMessageSize:", -[APSUserCourier messageSize](self, "messageSize"));
  objc_msgSend(v4, "setLargeMessageSize:", -[APSUserCourier largeMessageSize](self, "largeMessageSize"));
}

- (id)connectionForConnectionPortName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_connectionPortNamesToConnections, "objectForKey:", a3);
}

- (void)removeConnectionForConnectionPortName:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_connectionPortNamesToConnections, "objectForKey:", a3));
  if (v4)
  {
    id v5 = v4;
    [v4 close];
    -[APSUserCourier connectionWasClosed:](self, "connectionWasClosed:", v5);
    id v4 = v5;
  }
}

- (void)connectionTopicsChanged:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 ignoredTopics]);
  -[APSUserCourier handleIgnoredTopics:](self, "handleIgnoredTopics:", v4);

  -[APSUserCourier _recreateCacheDictionaries](self, "_recreateCacheDictionaries");
  -[APSUserCourier _processStoredIncomingMessagesForConnection:]( self,  "_processStoredIncomingMessagesForConnection:",  v5);
}

- (void)_processStoredIncomingMessagesForConnection:(id)a3
{
  if (self->_enabled)
  {
    id v4 = a3;
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__processStoredIncomingMessagesForConnection:",  v4);
    -[APSUserCourier performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "__processStoredIncomingMessagesForConnection:",  v4,  10.0);
  }

- (void)__processStoredIncomingMessagesForConnection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 incomingMessagesForTopic:0 priority:10 environment:self->_environment pushTokens:v5]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      __int16 v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[APSUserCourier _notifyForIncomingMessage:forConnection:]( self,  "_notifyForIncomingMessage:forConnection:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12),  v4,  (void)v14);
        __int16 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v10);
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: __processStoredIncomingMessageForConnection: %@",  buf,  0x16u);
  }
}

- (void)connectionWasClosed:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Removing connection server %@",  (uint8_t *)&v11,  0x16u);
  }

  [v4 setDelegate:0];
  if (v4) {
    -[NSMutableArray removeObject:](self->_connectionServers, "removeObject:", v4);
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v7 = [v6 count];

  if (!v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Removed final connection server for user %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  [v9 recalculateCriticalReliability];

  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Recalculating activity tracking following connection close: %@",  (uint8_t *)&v11,  0x16u);
  }

  -[APSUserCourier recalculateTrackActivityPresence](self, "recalculateTrackActivityPresence");
  -[APSTopicManager removeTopicsForConnectionServer:](self->_topicManager, "removeTopicsForConnectionServer:", v4);
  -[APSUserCourier _recreateCacheDictionaries](self, "_recreateCacheDictionaries");
  -[APSUserCourier _performIdleCheck](self, "_performIdleCheck");
}

- (void)connectionWasOpened:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ %@ has established new xpc connection %@",  (uint8_t *)&v7,  0x20u);
  }

  -[APSUserCourier _processStoredIncomingMessagesForConnection:]( self,  "_processStoredIncomingMessagesForConnection:",  v4);
}

- (void)_performIdleCheck
{
  dispatch_time_t v3 = dispatch_time(0LL, 2000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025A4C;
  block[3] = &unk_10011E4F0;
  block[4] = self;
  dispatch_after(v3, &_dispatch_main_q, block);
}

- (void)__performIdleCheck
{
  unint64_t v3 = -[APSUserCourier _countActiveClients](self, "_countActiveClients");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = -[NSMutableArray count](self->_connectionServers, "count");
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = v3;
    __int16 v11 = 2048;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ _performIdleCheck activeClients %lu  connections %lu",  (uint8_t *)&v7,  0x20u);
  }

  if (!v3 && !-[NSMutableArray count](self->_connectionServers, "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained courierHasNoConnections:self];
  }

  -[APSUserCourier _processShouldRunChangeIfNecessary](self, "_processShouldRunChangeIfNecessary");
}

- (BOOL)connectionDelegateIsConnectedToService:(id)a3
{
  return self->_isConnectedToService;
}

- (BOOL)connectionDelegateHasConnectedUser:(id)a3
{
  return self->_isConnectedToService && -[APSUserCourier overallCourierStatus](self, "overallCourierStatus", a3) == 0;
}

- (void)connectionChangedCriticalReliability:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  [v5 recalculateCriticalReliability];

  LODWORD(v5) = [v4 enableCriticalReliability];
  if ((_DWORD)v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    [v6 refreshCriticalReliability];

    if (qword_10014E808 != -1) {
      dispatch_once(&qword_10014E808, &stru_10011E698);
    }
    if (byte_10014E800)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
      [v7 triggerCriticalReliability];
    }
  }

- (void)connectionChangedTrackActivityPresence:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Recalculating activity tracking following connection change: %@",  (uint8_t *)&v6,  0x16u);
  }

  -[APSUserCourier recalculateTrackActivityPresence](self, "recalculateTrackActivityPresence");
}

- (void)_enqueueMessage:(id)a3 forOriginator:(id)a4
{
  id v6 = a3;
  -[APSOutgoingMessageQueue enqueueOutgoingMessage:forOriginator:]( self->_outgoingMessageQueue,  "enqueueOutgoingMessage:forOriginator:",  v6,  a4);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 messageID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    id v20 = v8;
    __int16 v21 = 2112;
    char v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Deciding when to send outgoing message %lu with topic '%@'",  buf,  0x20u);
  }

  if (-[APSUserCourier isConnectedToService](self, "isConnectedToService"))
  {
    if (-[APSUserCourier overallCourierStatus](self, "overallCourierStatus"))
    {
      unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Possibly connecting user because there is a queued outgoing message",  buf,  0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100025FB8;
      v16[3] = &unk_10011E758;
      v16[4] = self;
      -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  1LL,  v16);
    }

    else
    {
      -[APSUserCourier _sendOutgoingMessage:onProtocolConnection:]( self,  "_sendOutgoingMessage:onProtocolConnection:",  v6,  0LL);
    }
  }

  else
  {
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Possibly connecting because there is a queued outgoing message",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier delegate](self, "delegate"));
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 proxyManager]);
    unsigned int v14 = [v13 canUseProxy];

    if (v14)
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier delegate](self, "delegate"));
      [v15 kickstartProxyConnection];
    }

    else
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
      [v15 adjustConnectionsIfNeeded];
    }
  }
}

- (void)connection:(id)a3 subscribeToPreviouslyIgnoredTopics:(id)a4
{
}

- (void)connection:(id)a3 didReceiveOutgoingMessageToSend:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courierOversized](&OBJC_CLASS___APSLog, "courierOversized"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v7 messageID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    id v29 = [v7 timeout];
    else {
      unint64_t v10 = @"no";
    }
    id v11 = [v7 identifier];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    __int16 v13 = self;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    id v15 = sub_100085CF4(v12, v14);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138413826;
    id v32 = v13;
    __int16 v33 = 2048;
    id v34 = v30;
    __int16 v35 = 2112;
    __int16 v36 = v9;
    __int16 v37 = 2048;
    id v38 = v29;
    __int16 v39 = 2112;
    __int128 v40 = v10;
    __int16 v41 = 2048;
    id v42 = v11;
    __int16 v43 = 2112;
    __int128 v44 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Received outgoing message %lu to send with topic '%@', timeout %lu, critical %@, identifier %lu, and userInfo '%@'",  buf,  0x48u);

    self = v13;
  }

  [v7 setOriginator:v6];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 enabledTopics]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 opportunisticTopics]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  if ([v19 containsObject:v20])
  {

LABEL_9:
LABEL_10:
    -[APSUserCourier _enqueueMessage:forOriginator:](self, "_enqueueMessage:forOriginator:", v7, v6);
    goto LABEL_11;
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 nonWakingTopics]);
  char v22 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  unsigned __int8 v23 = [v21 containsObject:v22];

  if ((v23 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v7 messageID];
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    *(_DWORD *)buf = 138412802;
    id v32 = self;
    __int16 v33 = 2048;
    id v34 = v25;
    __int16 v35 = 2112;
    __int16 v36 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: Dropping outgoing message %lu because topic is not enabled '%@'",  buf,  0x20u);
  }

  uint64_t v27 = APSError(2LL, @"Topic not enabled");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v6, "handleResult:forSendingOutgoingMessageWithID:", v28, objc_msgSend(v7, "messageID"));

LABEL_11:
}

- (void)connection:(id)a3 didReceiveSubscribeToChannels:(id)a4 forTopic:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  -[APSUserCourier subscribeToChannels:forTopic:token:](self, "subscribeToChannels:forTopic:token:", v8, v7, v9);
}

- (void)connection:(id)a3 didReceiveUnsubscribeToChannels:(id)a4 forTopic:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  -[APSUserCourier unsubscribeFromChannels:forTopic:token:](self, "unsubscribeFromChannels:forTopic:token:", v8, v7, v9);
}

- (void)connection:(id)a3 didReceiveCancellationForOutgoingMessageWithID:(unint64_t)a4
{
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Received cancellation for outgoing message %lu",  (uint8_t *)&v7,  0x16u);
  }

  -[APSOutgoingMessageQueue cancelOutgoingMessageWithID:]( self->_outgoingMessageQueue,  "cancelOutgoingMessageWithID:",  a4);
}

- (void)connection:(id)a3 didReceiveFakeMessageToSend:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412802;
      id v47 = self;
      __int16 v48 = 2112;
      uint64_t v49 = v6;
      __int16 v50 = 2048;
      id v51 = [v5 priority];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Delivering fake message for topic '%@' priority '%lld'",  buf,  0x20u);
    }

    __int16 v9 = objc_alloc(&OBJC_CLASS___APSIncomingMessage);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v11 = -[APSIncomingMessage initWithTopic:userInfo:](v9, "initWithTopic:userInfo:", v6, v10);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 correlationIdentifier]);
    id v38 = v11;
    -[APSIncomingMessage setCorrelationIdentifier:](v11, "setCorrelationIdentifier:", v12);

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
    __int16 v36 = v6;
    if (v13) {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 timestamp]);
    }
    else {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    __int128 v16 = (void *)v14;
    -[APSIncomingMessage setTimestamp:](v11, "setTimestamp:", v14);

    -[APSIncomingMessage setPushType:](v11, "setPushType:", [v5 pushType]);
    -[APSIncomingMessage setPushFlags:](v11, "setPushFlags:", [v5 pushFlags]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v5 channelID]);
    -[APSIncomingMessage setChannelID:](v11, "setChannelID:", v17);

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int16 v35 = self;
    uint64_t v18 = self;
    id v15 = (os_log_s *)v11;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](v18, "connectionServers"));
    id v19 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v40 = *(void *)v42;
      do
      {
        __int16 v21 = 0LL;
        do
        {
          if (*(void *)v42 != v40) {
            objc_enumerationMutation(obj);
          }
          char v22 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v21);
          unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 enabledTopics]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 opportunisticTopics]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 nonWakingTopics]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
          if (([v23 containsObject:v26] & 1) == 0
            && ([v23 containsObject:@"*"] & 1) == 0)
          {
            uint64_t v27 = v5;
            v28 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
            if (([v24 containsObject:v28] & 1) == 0
              && ([v24 containsObject:@"*"] & 1) == 0)
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 topic]);
              if (![v25 containsObject:v29])
              {
                unsigned __int8 v37 = [v25 containsObject:@"*"];

                id v5 = v27;
                id v15 = (os_log_s *)v38;
                if ((v37 & 1) == 0) {
                  goto LABEL_25;
                }
                goto LABEL_22;
              }
            }

            id v5 = v27;
            id v15 = (os_log_s *)v38;
          }

LABEL_22:
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v22 publicToken]);
          -[os_log_s setToken:](v15, "setToken:", v30);

          id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = (APSUserCourier *)objc_claimAutoreleasedReturnValue(-[os_log_s token](v15, "token"));
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s topic](v15, "topic"));
            *(_DWORD *)buf = 138412546;
            id v47 = v32;
            __int16 v48 = 2112;
            uint64_t v49 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Assigning a token to the fake message. Token being assigned: %@, topic of the fake message: %@",  buf,  0x16u);
          }

LABEL_25:
          __int16 v21 = (char *)v21 + 1;
        }

        while (v20 != v21);
        id v34 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        id v20 = v34;
      }

      while (v34);
    }

    if ([v5 priority] == (id)1) {
      -[os_log_s setPriority:](v15, "setPriority:", 1LL);
    }
    -[APSUserCourier _notifyForIncomingMessage:](v35, "_notifyForIncomingMessage:", v15);
    id v6 = v36;
  }

  else if (v8)
  {
    *(_DWORD *)buf = 138412546;
    id v47 = self;
    __int16 v48 = 2112;
    uint64_t v49 = 0LL;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Received fake message with missing topic %@",  buf,  0x16u);
  }

  else
  {
    id v15 = v7;
  }
}

- (void)connection:(id)a3 handleAckIncomingMessageWithGuid:(id)a4 topic:(id)a5 tracingUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ informed that %@ acknowledges incoming message with guid %@ tracingUUID %@",  (uint8_t *)&v20,  0x2Au);
  }

  -[APSTTLCollection removeItem:withFlag:](self->_tracingEnabledAcksCollection, "removeItem:withFlag:", v13, 1LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  [v15 deleteIncomingMessageWithGUID:v11];

  if (v13)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
    if (v16)
    {
      topicHasher = self->_topicHasher;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 user]);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](topicHasher, "topicHashForTopic:user:", v12, v18));

      [v16 sendMessageTracingAckWithTopicHash:v19 topic:v12 tracingUUID:v13 status:1 token:0];
    }

    else
    {
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412802;
        __int16 v21 = self;
        __int16 v22 = 2112;
        id v23 = v12;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%@ trying to send message tracing framework ack but we currently don't have connected interface. {topic: %@; tracingUUID: %@}",
          (uint8_t *)&v20,
          0x20u);
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessageReceiptWithTopic:(id)a4 tracingUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ handling incoming message receipt. {topic:%@, tracingUUID:%@}",  (uint8_t *)&v14,  0x20u);
  }

  -[APSTTLCollection removeItem:withFlag:](self->_tracingEnabledAcksCollection, "removeItem:withFlag:", v8, 2LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
  if (v10)
  {
    topicHasher = self->_topicHasher;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](topicHasher, "topicHashForTopic:user:", v7, v12));

    [v10 sendMessageTracingAckWithTopicHash:v13 topic:v7 tracingUUID:v8 status:2 token:0];
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ trying to send message tracing application ack but we currently don't have connected interface. {topic: %@; tracingUUID: %@}",
        (uint8_t *)&v14,
        0x20u);
    }
  }
}

- (void)connection:(id)a3 setKeepAliveConfiguration:(unint64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher", a3));
  [v5 setKeepAliveConfiguration:a4];
}

- (void)connectionDidClientDisconnect:(id)a3
{
  id v4 = a3;
  if (-[APSUserCourier isIdle](self, "isIdle"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Client disconnected from %@ and courier is idle",  (uint8_t *)&v7,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained courierIsIdle:self];
  }
}

- (void)ttlCollection:(id)a3 itemsDidExpire:(id)a4 withStates:(id)a5
{
  id v12 = a5;
  if ([a4 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"tap-to-radar://new?Title=Missing%20CloudKit%20Push&Description=Missing%20both%20acks&ComponentID=297783&ComponentName=Apple%20Push%20Service&ComponentVersion=New%20Bugs&AutoDiagnostics=phone,watch&Classification=Other%20Bug&Reproducibility=Not%20Applicable"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
    unsigned __int8 v8 = [v7 unsignedIntValue];

    if ((v8 & 2) != 0)
    {
      if ((v8 & 1) != 0)
      {
LABEL_7:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APSDiagnostic sharedInstance](&OBJC_CLASS___APSDiagnostic, "sharedInstance"));
        [v11 promptTapToRadarWithURL:v6];

        goto LABEL_8;
      }

      __int16 v9 = @"tap-to-radar://new?Title=Missing%20CloudKit%20Push&Description=Missing%20app%20ack&ComponentID=297783&ComponentName=Apple%20Push%20Service&ComponentVersion=New%20Bugs&AutoDiagnostics=phone,watch&Classification=Other%20Bug&Reproducibility=Not%20Applicable";
    }

    else
    {
      __int16 v9 = @"tap-to-radar://new?Title=Missing%20CloudKit%20Push&Description=Missing%20framework%20ack&ComponentID=297783&ComponentName=Apple%20Push%20Service&ComponentVersion=New%20Bugs&AutoDiagnostics=phone,watch&Classification=Other%20Bug&Reproducibility=Not%20Applicable";
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

    id v6 = (void *)v10;
    goto LABEL_7;
  }

- (void)invalidateDeviceIdentity
{
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ invalidateDeviceIdentity",  (uint8_t *)&v4,  0xCu);
  }

  -[APSUserCourier _processInvalidIdentity](self, "_processInvalidIdentity");
}

- (void)periodicSignalFired
{
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ periodicSignalFired", buf, 0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  [v4 deleteStaleIncomingLowPriorityMessagesForEnvironment:self->_environment];

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  id v27 = (void *)v5;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 incomingMessagesForTopic:0 priority:1 environment:self->_environment pushTokens:v5]);

  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 count];
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v37 = self;
    __int16 v38 = 2048;
    id v39 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ examining %lu low priority incoming messages",  buf,  0x16u);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      id v13 = 0LL;
      id v28 = v11;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 topic]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 token]);
        topicHasher = self->_topicHasher;
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](topicHasher, "topicHashForTopic:user:", v15, v18));

        int v20 = self->_topicManager;
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager hasTopicHash:](v20, "hasTopicHash:", v19));

        if (!v21)
        {
          uint64_t v22 = v12;
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            unsigned __int8 v37 = self;
            __int16 v38 = 2112;
            id v39 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ our filter lacks %@, deleting all low priority messages for this topic.",  buf,  0x16u);
          }

          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
          environment = self->_environment;
          id v34 = v16;
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v34,  1LL));
          [v24 deleteLowPriorityIncomingMessagesForTopic:v15 environment:environment pushTokens:v26];

          uint64_t v12 = v22;
          id v11 = v28;
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v11);
  }
}

- (id)_findActiveClientWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v5 = self->_proxyClients;
    id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  (void)v16));
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 publicToken]);
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 publicToken]);
            if ([v13 isEqualToData:v4])
            {
              unsigned __int8 v14 = [v10 isActive];

              if ((v14 & 1) != 0) {
                goto LABEL_15;
              }
            }

            else
            {
            }
          }
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v7);
    }

    id v10 = 0LL;
LABEL_15:
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_findConnectedClientWithToken:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  if (v6)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id obj = self->_proxyClients;
    id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v10),  v18));
          uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 publicToken]);
          if (v12)
          {
            id v13 = (void *)v12;
            unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 publicToken]);
            if ([v14 isEqualToData:v6])
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
              unsigned __int8 v16 = [v11 isConnectedOnInterface:v15];

              if ((v16 & 1) != 0) {
                goto LABEL_15;
              }
            }

            else
            {
            }
          }

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      }

      while (v8);
    }

    uint64_t v11 = 0LL;
LABEL_15:
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)_findClientWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v5 = self->_proxyClients;
    id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8 * v9),  (void)v16));
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 publicToken]);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 publicToken]);
          unsigned __int8 v14 = [v13 isEqualToData:v4];

          if ((v14 & 1) != 0) {
            break;
          }
        }

        if (v7 == (id)++v9)
        {
          id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (unint64_t)_countActiveClients
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v3 = self->_proxyClients;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11));
        v6 += [v9 isActive];
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)_countConnectedClients
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v3 = self->_proxyClients;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11));
        v6 += [v9 isConnected];
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (void)canUseProxyChanged
{
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ canUseProxyChanged!", (uint8_t *)&v4, 0xCu);
  }

  -[APSUserCourier _processShouldUseInternetChangeIfNecessary](self, "_processShouldUseInternetChangeIfNecessary");
}

- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10
{
  __int128 v16 = (APSProxyClient *)a3;
  id v17 = a4;
  id v33 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v35 = self;
    __int16 v36 = 2112;
    unsigned __int8 v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ incoming device presence %@", buf, 0x16u);
  }

  if (v16)
  {
    proxyClients = self->_proxyClients;
    if (!proxyClients)
    {
      id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int16 v26 = self->_proxyClients;
      self->_proxyClients = v25;

      proxyClients = self->_proxyClients;
    }

    id v27 = (APSProxyClient *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](proxyClients, "objectForKey:", v16));
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v35 = self;
      __int16 v36 = 2112;
      unsigned __int8 v37 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@ received presence for client %@",  buf,  0x16u);
    }

    if (!v27)
    {
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _findClientWithToken:](self, "_findClientWithToken:", v17));
      [v32 invalidate];
      id v27 = -[APSProxyClient initWithEnvironment:guid:]( objc_alloc(&OBJC_CLASS___APSProxyClient),  "initWithEnvironment:guid:",  self->_environment,  v16);
      -[NSMutableDictionary setObject:forKey:](self->_proxyClients, "setObject:forKey:", v27, v16);
      -[APSProxyClient setMessageSize:]( v27,  "setMessageSize:",  -[APSEnvironment messageSize](self->_environment, "messageSize"));
      -[APSProxyClient setLargeMessageSize:]( v27,  "setLargeMessageSize:",  -[APSEnvironment largeMessageSize](self->_environment, "largeMessageSize"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _proxyManager](self, "_proxyManager"));
      -[APSProxyClient setProxyManager:](v27, "setProxyManager:", v29);

      -[APSProxyClient setDelegate:](v27, "setDelegate:", self);
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v35 = self;
        __int16 v36 = 2112;
        unsigned __int8 v37 = v27;
        __int16 v38 = 2112;
        id v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ made new client %@ for %@", buf, 0x20u);
      }
    }

    -[APSProxyClient incomingPresenceWithCertificate:nonce:signature:token:hwVersion:swVersion:swBuild:]( v27,  "incomingPresenceWithCertificate:nonce:signature:token:hwVersion:swVersion:swBuild:",  v20,  v21,  v22,  v17,  v33,  v18,  v19);
    unsigned __int8 v31 = -[APSUserCourier _processPendingProxyPresences](self, "_processPendingProxyPresences");
    -[APSUserCourier _processShouldRunChangeIfNecessary](self, "_processShouldRunChangeIfNecessary");
    if ((v31 & 1) == 0 && !-[APSProxyClient isInvalid](v27, "isInvalid")) {
      -[APSProxyClient noteIsConnected](v27, "noteIsConnected");
    }
  }
}

- (void)_clearPendingProxyPresence
{
  proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
  self->_proxyClientWithOutstandingPresence = 0LL;

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int v4 = self->_proxyClients;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", v10, (void)v13));
        if ([v11 isInvalid]
          && ([v11 needsToDisconnect] & 1) == 0)
        {
          if (!v7) {
            uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v7, "addObject:", v10);
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    }

    while (v6);

    if (v7)
    {
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Removing clients %@", buf, 0x16u);
      }

      -[NSMutableDictionary removeObjectsForKeys:](self->_proxyClients, "removeObjectsForKeys:", v7);
    }
  }

  else
  {

    uint64_t v7 = 0LL;
  }

  -[APSUserCourier _processPendingProxyPresences](self, "_processPendingProxyPresences", (void)v13);
}

- (BOOL)_processPendingProxyPresences
{
  if (-[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface")) {
    BOOL v3 = self->_proxyClientWithOutstandingPresence == 0LL;
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      id v5 = @"YES";
    }
    else {
      id v5 = @"NO";
    }
    unsigned int v6 = -[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface");
    proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
    if (v6) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    __int128 v70 = (uint64_t (*)(uint64_t, uint64_t))v8;
    LOWORD(v71) = 2112;
    *(void *)((char *)&v71 + 2) = proxyClientWithOutstandingPresence;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ _processPendingProxyPresences - canSendPresence? %@ hasConnectedConnection %@  outstandingClient %@",  buf,  0x2Au);
  }

  if (v3)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    __int128 v70 = sub_100028890;
    *(void *)&__int128 v71 = sub_1000288A0;
    *((void *)&v71 + 1) = 0LL;
    uint64_t v57 = 0LL;
    __int128 v58 = &v57;
    uint64_t v59 = 0x3032000000LL;
    __int128 v60 = sub_100028890;
    __int128 v61 = sub_1000288A0;
    id v62 = 0LL;
    uint64_t v51 = 0LL;
    __int128 v52 = (double *)&v51;
    uint64_t v53 = 0x3032000000LL;
    __int128 v54 = sub_100028890;
    __int128 v55 = sub_1000288A0;
    id v56 = 0LL;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000288A8;
    v50[3] = &unk_10011E780;
    v50[4] = self;
    v50[5] = &v57;
    v50[6] = &v51;
    v50[7] = buf;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v50);
    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(APSProxyClient **)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)__int128 v63 = 138412546;
        __int128 v64 = self;
        __int16 v65 = 2112;
        __int128 v66 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ client %@ needs to disconnect",  v63,  0x16u);
      }

      __int128 v11 = (void *)*((void *)v52 + 5);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) publicToken]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) hwVersion]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) swVersion]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) swBuild]);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_100028C30;
      v49[3] = &unk_10011E7A8;
      v49[4] = self;
      v49[5] = &v51;
      [v11 sendConnectMessageWithToken:v12 state:2 presenceFlags:0 hwVersion:v13 swVersion:v14 swBuild:v15 certificates:0 nonce:0 signature:0 withCompletion:v49];

      __int128 v16 = *(void **)(*(void *)&buf[8] + 40LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v52 + 5) identifier]);
      [v16 setState:3 onInterface:v17];

      objc_storeStrong((id *)&self->_proxyClientWithOutstandingPresence, *(id *)(*(void *)&buf[8] + 40LL));
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = self->_proxyClientWithOutstandingPresence;
        double v20 = v52[5];
        *(_DWORD *)__int128 v63 = 138412802;
        __int128 v64 = self;
        __int16 v65 = 2112;
        __int128 v66 = v19;
        __int16 v67 = 2114;
        double v68 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ sending presence offline for client %@ on interface %{public}@",  v63,  0x20u);
      }
    }

    else
    {
      if (!v58[5])
      {
        BOOL v21 = 0;
LABEL_38:
        _Block_object_dispose(&v51, 8);

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(buf, 8);

        return v21;
      }

      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v23 = (APSProxyClient *)v58[5];
        double v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[APSProxyClient lastPresence](v23, "lastPresence")));
        *(_DWORD *)__int128 v63 = 138412802;
        __int128 v64 = self;
        __int16 v65 = 2112;
        __int128 v66 = v23;
        __int16 v67 = 2112;
        double v68 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ client %@ needs to connect. LastPresence %@",  v63,  0x20u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] lastPresence]);
      [v25 timeIntervalSinceNow];
      double v27 = v26;

      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] certificate]);

      if (v29)
      {
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] certificate]);
        [v28 addObject:v30];
      }

      if (-[APSUserCourier locallyDisabledFilterOptimization](self, "locallyDisabledFilterOptimization")) {
        int v31 = 0;
      }
      else {
        int v31 = _os_feature_enabled_impl("APS", "SingleInterfaceFilterOptimizationProxy");
      }
      __int128 v32 = (void *)*((void *)v52 + 5);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] publicToken]);
      if (v31) {
        uint64_t v34 = 0x2000LL;
      }
      else {
        uint64_t v34 = 0LL;
      }
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] hwVersion]);
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] swVersion]);
      unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] swBuild]);
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] nonce]);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([(id)v58[5] signature]);
      v48[1] = 3221225472LL;
      v48[2] = sub_100028C48;
      v48[3] = &unk_10011E7A8;
      v48[4] = self;
      v48[5] = &v51;
      v48[0] = _NSConcreteStackBlock;
      [v32 sendConnectMessageWithToken:v33 state:1 presenceFlags:v34 hwVersion:v35 swVersion:v36 swBuild:v37 certificates:v28 nonce:v38 signature:v39 withCompletion:v48];

      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v41 = (APSProxyClient *)objc_claimAutoreleasedReturnValue([(id)v58[5] publicToken]);
        *(_DWORD *)__int128 v63 = 138412802;
        __int128 v64 = self;
        __int16 v65 = 2112;
        __int128 v66 = v41;
        __int16 v67 = 2048;
        double v68 = fabs(v27);
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%@: Sending client connect message with token '%@' presence age %f",  v63,  0x20u);
      }

      __int128 v42 = (void *)v58[5];
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v52 + 5) identifier]);
      [v42 setState:1 onInterface:v43];

      objc_storeStrong((id *)&self->_proxyClientWithOutstandingPresence, (id)v58[5]);
      __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = self->_proxyClientWithOutstandingPresence;
        double v46 = v52[5];
        *(_DWORD *)__int128 v63 = 138412802;
        __int128 v64 = self;
        __int16 v65 = 2112;
        __int128 v66 = v45;
        __int16 v67 = 2114;
        double v68 = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%@ sending presence online for client %@ on interface %{public}@",  v63,  0x20u);
      }
    }

    BOOL v21 = 1;
    goto LABEL_38;
  }

  return 0;
}

- (void)_sendClientFilter:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 topics]);
  if (v8 && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 publicToken]), v9, v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 hashesToEnabledTopics]);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _topicsByHashFromTopicStateDictionary:]( self,  "_topicsByHashFromTopicStateDictionary:",  v10));

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 hashesToIgnoredTopics]);
    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _topicsByHashFromTopicStateDictionary:]( self,  "_topicsByHashFromTopicStateDictionary:",  v12));

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 hashesToOpportunisticTopics]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _topicsByHashFromTopicStateDictionary:]( self,  "_topicsByHashFromTopicStateDictionary:",  v13));

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 hashesToNonWakingTopics]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _topicsByHashFromTopicStateDictionary:]( self,  "_topicsByHashFromTopicStateDictionary:",  v15));

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 hashesToPausedTopics]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _topicsByHashFromTopicStateDictionary:]( self,  "_topicsByHashFromTopicStateDictionary:",  v17));

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 filterVersionStateMachine]);
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v53 = 0LL;
    id v48 = [v19 versionToSendFor:v20 error:&v53];
    uint64_t v49 = (APSUserCourier *)v53;

    BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courierOversized](&OBJC_CLASS___APSLog, "courierOversized"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = APSPrettyPrintCollection(v11, 1LL, 0LL, 1LL);
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v23 = APSPrettyPrintCollection(v14, 1LL, 0LL, 1LL);
      double v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v25 = APSPrettyPrintCollection(v16, 1LL, 0LL, 1LL);
      __int128 v42 = v11;
      double v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v27 = APSPrettyPrintCollection(v18, 1LL, 0LL, 1LL);
      __int128 v44 = v18;
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      uint64_t v29 = APSPrettyPrintCollection(v50, 1LL, 0LL, 1LL);
      uint64_t v45 = v16;
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 138414338;
      __int128 v55 = self;
      __int16 v56 = 2112;
      id v57 = v6;
      __int16 v58 = 2048;
      id v59 = v48;
      __int16 v60 = 2112;
      __int128 v61 = v41;
      __int16 v62 = 2112;
      __int128 v63 = v24;
      __int16 v64 = 2112;
      __int16 v65 = v26;
      __int16 v66 = 2112;
      __int16 v67 = v28;
      __int16 v68 = 2112;
      __int128 v69 = v30;
      __int16 v70 = 2114;
      id v71 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: sending filter for client %@ with version %llu with enabled topics = %@, opportunistic topics = %@, non-waki ng topics = %@, paused topics = %@, ignored topics = %@ on interface %{public}@",  buf,  0x5Cu);

      __int128 v16 = v45;
      id v18 = v44;

      __int128 v11 = v42;
    }

    int v31 = v49;
    if (v49)
    {
      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v55 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Error fetching filter version for proxy client; disconnecting {versionError: %@}",
          buf,
          0xCu);
      }

      [v7 disconnectWithReason:6];
    }

    else
    {
      unsigned __int8 v43 = -[APSUserCourier expectsResponseForFilterMessageOnProtocolConnection:forClient:]( self,  "expectsResponseForFilterMessageOnProtocolConnection:forClient:",  v7,  v6);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v6 publicToken]);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      void v51[2] = sub_1000291F4;
      v51[3] = &unk_10011E7D0;
      v51[4] = self;
      id v35 = v7;
      id v52 = v35;
      LOBYTE(v40) = v43;
      double v46 = v16;
      id v47 = v14;
      [v35 sendFilterMessageWithEnabledTopicsByHash:v11 ignoredTopicsByHash:v50 opportunisticTopicsByHash:v14 nonWakingTopicsByHash:v16 pau sedTopicsByHash:v18 saltsByTopic:0 token:v34 version:v48 expectsResponse:v40 withCompletion:v51];

      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v6 filterVersionStateMachine]);
      unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
      [v36 noteSentWithVersion:v48 on:v37];

      if ((v43 & 1) == 0)
      {
        __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v6 filterVersionStateMachine]);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
        [v38 noteAckedWithVersion:v48 on:v39];
      }

      __int128 v16 = v46;
      __int128 v14 = v47;
      int v31 = 0LL;
    }
  }

  else
  {
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v6 publicToken]);
      *(_DWORD *)buf = 138412802;
      __int128 v55 = self;
      __int16 v56 = 2112;
      id v57 = v6;
      __int16 v58 = 2112;
      id v59 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ we don't yet have a filter for %@ (token %@).",  buf,  0x20u);
    }
  }
}

- (void)pushTokenBecameInvalidForClient:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ pushTokenBecameInvalidForClient %@",  (uint8_t *)&v6,  0x16u);
  }

  -[APSUserCourier _forceReconnectionsWithReason:](self, "_forceReconnectionsWithReason:", 1LL);
}

- (void)requestFilterForClient:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ requestFilterForClient %@", buf, 0x16u);
  }

  -[APSUserCourier setHasFilterChanged:](self, "setHasFilterChanged:", 1LL);
  if (-[APSUserCourier shouldOnlySendFilterOnPreferredInterface](self, "shouldOnlySendFilterOnPreferredInterface")
    && [v4 shouldOnlySendFilterOnPreferredInterface])
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v8 = [v4 stateOnInterface:v7];

    if (v8 == (id)2)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
      -[APSUserCourier _sendClientFilter:onProtocolConnection:](self, "_sendClientFilter:onProtocolConnection:", v4, v9);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000294BC;
    v16[3] = &unk_10011E7F8;
    v16[4] = self;
    id v17 = v4;
    id v10 = v4;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v16);
    __int128 v11 = v17;
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000295A8;
    v13[3] = &unk_10011E7F8;
    id v14 = v4;
    __int128 v15 = self;
    id v12 = v4;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v13);
    __int128 v11 = v14;
  }
}

- (void)clientBecameInactive:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ client %@ became inactive. Sending offline status if needed.",  (uint8_t *)&v6,  0x16u);
  }

  -[APSUserCourier _processPendingProxyPresences](self, "_processPendingProxyPresences");
  -[APSUserCourier _performIdleCheck](self, "_performIdleCheck");
}

- (void)client:(id)a3 requestPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = [a7 integerValue];
  id v20 = [v18 unsignedIntegerValue];

  if (-[APSUserCourier hasConnectedInterfaceOfType:](self, "hasConnectedInterfaceOfType:", v19))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000298BC;
    v22[3] = &unk_10011E820;
    id v27 = v20;
    v22[4] = self;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    id v26 = v17;
    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  v19,  v22);
  }

  else
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = self;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: ignoring a proxied push ack response that is no longer relevant. %@",  buf,  0x16u);
    }
  }
}

- (void)client:(id)a3 requestSendOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courierOversized](&OBJC_CLASS___APSLog, "courierOversized"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 messageID];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    id v11 = [v7 timeout];
    else {
      id v12 = @"no";
    }
    id v13 = [v7 identifier];
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    *(_DWORD *)buf = 138414082;
    __int128 v32 = self;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2048;
    id v36 = v9;
    __int16 v37 = 2112;
    __int16 v38 = v10;
    __int16 v39 = 2048;
    id v40 = v11;
    __int16 v41 = 2112;
    __int128 v42 = v12;
    __int16 v43 = 2048;
    id v44 = v13;
    __int16 v45 = 2112;
    double v46 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Received proxy %@ outgoing message %lu to send with topic '%@', timeout %lu, critical %@, identifier %lu, and userInfo '%@'",  buf,  0x52u);
  }

  [v7 setOriginator:v6];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 topics]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 enabledTopics]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 topics]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 opportunisticTopics]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  if ([v19 containsObject:v20])
  {

LABEL_9:
LABEL_10:
    -[APSUserCourier _enqueueMessage:forOriginator:](self, "_enqueueMessage:forOriginator:", v7, v6);
    goto LABEL_11;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 topics]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v28 nonWakingTopics]);
  __int16 v30 = self;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  unsigned __int8 v29 = [v21 containsObject:v22];

  self = v30;
  if ((v29 & 1) != 0) {
    goto LABEL_10;
  }
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v7 messageID];
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    *(_DWORD *)buf = 138412802;
    __int128 v32 = v30;
    __int16 v33 = 2048;
    id v34 = v24;
    __int16 v35 = 2112;
    id v36 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@: Dropping outgoing message %lu because topic is not enabled '%@'",  buf,  0x20u);
  }

  uint64_t v26 = APSError(2LL, @"Topic not enabled");
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v6 handleResult:v27 forSendingOutgoingMessage:v7];

LABEL_11:
}

- (void)client:(id)a3 requestTokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138414082;
    __int16 v43 = self;
    __int16 v44 = 2112;
    id v45 = v15;
    __int16 v46 = 2112;
    id v47 = v16;
    __int16 v48 = 2112;
    id v49 = v17;
    __int16 v50 = 2112;
    id v51 = v18;
    __int16 v52 = 2112;
    id v53 = v19;
    __int16 v54 = 2112;
    id v55 = v20;
    __int16 v56 = 2112;
    id v57 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@: Received proxy %@ token generate request with topicHash %@ baseToken %@ appId %@ expiration %@ vapidHash %@ type %@",  buf,  0x52u);
  }

  tokenRequestQueue = self->_tokenRequestQueue;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10002A024;
  v35[3] = &unk_10011E848;
  v35[4] = self;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  id v41 = v21;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10002A12C;
  v31[3] = &unk_10011E870;
  v31[4] = self;
  id v32 = v15;
  id v33 = v36;
  id v34 = v38;
  id v24 = v38;
  id v25 = v36;
  id v26 = v15;
  id v27 = v21;
  id v28 = v20;
  id v29 = v19;
  id v30 = v17;
  -[APSOutgoingQueue enqueueSendBlock:completionBlock:]( tokenRequestQueue,  "enqueueSendBlock:completionBlock:",  v35,  v31);
}

- (void)client:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413570;
    uint64_t v22 = self;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 1024;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: Received proxy %@ message tracing with status %u topic %@ tracingUUID %@ token %@",  (uint8_t *)&v21,  0x3Au);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
  if (v17)
  {
    topicHasher = self->_topicHasher;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](topicHasher, "topicHashForTopic:user:", v13, v19));

    [v17 sendMessageTracingAckWithTopicHash:v20 topic:v13 tracingUUID:v14 status:v10 token:v15];
  }

  else
  {
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000BCEDC();
    }
  }
}

- (void)client:(id)a3 sendPubSubChannelList:(id)a4 token:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002A508;
  v9[3] = &unk_10011E898;
  id v10 = a3;
  id v11 = self;
  id v12 = a4;
  id v7 = v12;
  id v8 = v10;
  -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v9);
}

- (void)refreshCertNonceAndSignatureWithServerTime:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier lastPresence](self, "lastPresence"));
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier lastPresence](self, "lastPresence"));
  if (v6 || !v11)
  {
  }

  else
  {

    if (fabs(v10) <= 240.0)
    {
      if (v7) {
        v7[2](v7, 1LL);
      }
      goto LABEL_16;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (+[APSSimulatorSupport isSimulator](&OBJC_CLASS___APSSimulatorSupport, "isSimulator"))
  {
    id v20 = 0LL;
    id v21 = 0LL;
    +[APSSimulatorSupport generateCerts:nonce:sig:time:]( &OBJC_CLASS___APSSimulatorSupport,  "generateCerts:nonce:sig:time:",  v12,  &v21,  &v20,  v6);
    id v13 = v21;
    id v14 = v20;
    BOOL v15 = [v12 count] && objc_msgSend(v13, "length") && objc_msgSend(v14, "length") != 0;
    -[APSUserCourier setCertificates:](self, "setCertificates:", v12);
    -[APSUserCourier setNonce:](self, "setNonce:", v13);
    -[APSUserCourier setSignature:](self, "setSignature:", v14);
    if (v7) {
      v7[2](v7, v15);
    }
  }

  else
  {
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002A89C;
    v16[3] = &unk_10011E8C0;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    -[APSUserCourier generateCertWithServerTime:completionBlock:]( self,  "generateCertWithServerTime:completionBlock:",  v6,  v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    id v14 = 0LL;
    id v13 = 0LL;
  }

LABEL_16:
}

- (void)_clearCachedSigNonceCert
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ client identity may have changed, clear cached sig/nonce/cert",  (uint8_t *)&v4,  0xCu);
  }

  -[APSUserCourier setNonce:](self, "setNonce:", 0LL);
  -[APSUserCourier setSignature:](self, "setSignature:", 0LL);
  -[APSUserCourier setCertificates:](self, "setCertificates:", 0LL);
  -[APSUserCourier setLastPresence:](self, "setLastPresence:", 0LL);
}

- (void)generateCertWithServerTime:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002AAF8;
  v8[3] = &unk_10011E8E8;
  id v9 = a3;
  double v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[APSUserCourier getClientIdentityForcingRefresh:withCompletion:]( self,  "getClientIdentityForcingRefresh:withCompletion:",  0LL,  v8);
}

- (void)getClientIdentityForcingRefresh:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002AD68;
  v9[3] = &unk_10011E910;
  id v10 = a4;
  id v6 = v10;
  id v7 = objc_retainBlock(v9);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier clientIdentityProvider](self, "clientIdentityProvider"));
  [v8 fetchClientIdentityForcingNewCert:v4 withCompletion:v7];
}

- (BOOL)_isIdentityAvailable
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier clientIdentityProvider](self, "clientIdentityProvider"));
  unsigned __int8 v3 = [v2 isIdentityAvailable];

  return v3;
}

- (void)_deleteClientIdentityRequestingReplacement
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: deleting identity", (uint8_t *)&v5, 0xCu);
  }

  -[APSUserCourier _clearCachedSigNonceCert](self, "_clearCachedSigNonceCert");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier clientIdentityProvider](self, "clientIdentityProvider"));
  [v4 deleteClientIdentityRequestingReplacement];
}

- (void)systemDidLock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002AECC;
  v2[3] = &unk_10011E758;
  v2[4] = self;
  -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  1LL,  v2);
}

- (void)systemDidUnlock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002AFF4;
  v2[3] = &unk_10011E758;
  v2[4] = self;
  -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  1LL,  v2);
}

- (void)_processInvalidIdentity
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000BCF3C(self, v3);
  }

  -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", 0LL, 1LL);
  -[APSUserCourier _deleteClientIdentityRequestingReplacement](self, "_deleteClientIdentityRequestingReplacement");
  -[APSUserCourier _forceReconnectionsWithReason:](self, "_forceReconnectionsWithReason:", 1LL);
}

- (BOOL)isConnectedOnUltraConstrainedInterface
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002B224;
  v5[3] = &unk_10011E730;
  v5[4] = &v6;
  -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v5);
  BOOL v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000BCFEC();
  }

  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processIsPowerEfficientToSendChange
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = !-[APSUserCourier hasConnectedInterfaceOfType:](self, "hasConnectedInterfaceOfType:", 0LL);
  if (!*((_BYTE *)v11 + 24))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002B3C4;
    v9[3] = &unk_10011E730;
    void v9[4] = &v10;
    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  0LL,  v9);
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002B404;
  v4[3] = &unk_10011E730;
  v4[4] = &v5;
  -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  1LL,  v4);
  if (*((_BYTE *)v11 + 24)) {
    BOOL v3 = *((_BYTE *)v6 + 24) != 0;
  }
  else {
    BOOL v3 = 0LL;
  }
  -[APSTopicManager setIsPowerEfficientToSendFilter:](self->_topicManager, "setIsPowerEfficientToSendFilter:", v3);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)_recreateCacheDictionaries
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 connectionPortName]);
        if (v9) {
          -[NSMutableDictionary setObject:forKey:](self->_connectionPortNamesToConnections, "setObject:forKey:", v8, v9);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  -[APSUserCourier _processShouldRunChangeIfNecessary](self, "_processShouldRunChangeIfNecessary");
}

- (void)_handleLostPushTokens
{
  if (!-[APSUserCourier _processPotentialIdentityChanged](self, "_processPotentialIdentityChanged"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    unsigned int v4 = [v3 isDefaultUser];

    if (v4)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        uint64_t v7 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ Client identity is still valid. Reconnect to fetch new push tokens with existing client identity.",  (uint8_t *)&v6,  0xCu);
      }

      -[APSUserCourier _forceReconnectionsWithReason:](self, "_forceReconnectionsWithReason:", 1LL);
    }
  }

- (void)_processStoredIncomingMessages
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = @"YES";
    if (!self->_enabled) {
      unsigned int v4 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v23 = self;
    __int16 v24 = 2112;
    __int16 v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ _processStoredIncomingMessages: enabled = %@",  buf,  0x16u);
  }

  if (self->_enabled)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 incomingHighPriorityMessagesForEnvironment:self->_environment pushTokens:v5]);

    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = (const __CFString *)[v7 count];
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2048;
      __int16 v25 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ processing %lu stored incoming messages",  buf,  0x16u);
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          -[APSUserCourier _notifyForIncomingMessage:]( self,  "_notifyForIncomingMessage:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i),  (void)v17);
        }

        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v12);
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
    [v15 deleteStaleIncomingLowPriorityMessagesForEnvironment:self->_environment];
  }

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", (void)v17));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v23 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ done with _processStoredIncomingMessages",  buf,  0xCu);
  }
}

- (void)_processShouldRunChangeIfNecessary
{
  BOOL shouldRun = self->_shouldRun;
  BOOL v4 = -[APSUserCourier shouldRun](self, "shouldRun");
  if (shouldRun != v4)
  {
    BOOL v5 = v4;
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (!shouldRun) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ shouldRun did change to %@",  (uint8_t *)&v9,  0x16u);
    }

    -[APSUserCourier _processShouldUseInternetChangeIfNecessary](self, "_processShouldUseInternetChangeIfNecessary");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userCourier:self hasReasonToConnectChangedTo:v5];
  }

- (void)_processShouldUseInternetChangeIfNecessary
{
  BOOL shouldUseInternet = self->_shouldUseInternet;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  [v4 adjustConnectionsIfNeeded];

  if (-[APSUserCourier shouldUseInternet](self, "shouldUseInternet") || !-[APSUserCourier shouldRun](self, "shouldRun"))
  {
    unsigned __int8 v9 = -[APSUserCourier shouldRun](self, "shouldRun");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ is no longer in proxy mode.", buf, 0xCu);
      }

      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472LL;
      __int128 v18 = sub_10002BDD8;
      __int128 v19 = &unk_10011E758;
      __int128 v20 = self;
      id v12 = &v16;
    }

    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ no longer need to run, closing proxy if connected",  buf,  0xCu);
      }

      id v12 = (void ***)&stru_10011E978;
    }

    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  2LL,  v12,  v16,  v17,  v18,  v19,  v20);
  }

  else
  {
    unsigned int v5 = -[APSUserCourier hasConnectedInterfaceOfType:](self, "hasConnectedInterfaceOfType:", 2LL);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ should not connect to the internet switching to proxy mode",  buf,  0xCu);
      }

      -[APSOutgoingQueue handleConnectionOpened](self->_tokenRequestQueue, "handleConnectionOpened");
      outgoingMessageQueue = self->_outgoingMessageQueue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10002BD18;
      v21[3] = &unk_10011E938;
      v21[4] = self;
      -[APSOutgoingMessageQueue transferOwnershipOfPendingMessagesToHandler:]( outgoingMessageQueue,  "transferOwnershipOfPendingMessagesToHandler:",  v21);
    }

    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ should not connect to the internet but no proxy available",  buf,  0xCu);
      }
    }
  }

  if (shouldUseInternet != -[APSUserCourier shouldUseInternet](self, "shouldUseInternet"))
  {
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = @"NO";
      if (!shouldUseInternet) {
        id v14 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2112;
      __int16 v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ shouldUseInternet did change to %@",  buf,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shouldUseInternetDidChange:self];
  }

- (BOOL)_processPotentialIdentityChanged
{
  if ((sub_1000784BC() & 1) == 0)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier clientIdentityProvider](self, "clientIdentityProvider"));
    unsigned int v4 = [v3 hasUnderlyingIdentityChanged];

    if (!v4) {
      return 0;
    }
  }

  -[APSUserCourier _processInvalidIdentity](self, "_processInvalidIdentity");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002BEC8;
  v6[3] = &unk_10011E9A0;
  v6[4] = self;
  -[APSUserCourier getClientIdentityForcingRefresh:withCompletion:]( self,  "getClientIdentityForcingRefresh:withCompletion:",  0LL,  v6);
  return 1;
}

- (void)rollTokenAndReconnect
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: Clearing public token and terminating connection",  (uint8_t *)&v4,  0xCu);
  }

  -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", 0LL, 1LL);
  -[APSUserCourier _forceReconnectionsWithReason:](self, "_forceReconnectionsWithReason:", 14LL);
}

- (void)rollTokensForAllBAAEnvironments
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: BAA client identity provider is noting a refresh in BAA certs, noting to daemon to roll tokens for all environments in BAA",  (uint8_t *)&v5,  0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier delegate](self, "delegate"));
  [v4 courierShouldRollBAAEnvironmentTokens:self];
}

- (void)topicManagerRequestToSendFilter:(id)a3 change:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    int v10 = 138412802;
    BOOL v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = [v9 countConnectedInterfaces];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ topicManager %@ requested to send filter. Connected on %lu interfaces.",  (uint8_t *)&v10,  0x20u);
  }

  -[APSUserCourier setHasFilterChanged:](self, "setHasFilterChanged:", 1LL);
  -[APSUserCourier _requestToSendFilterOnTopicManager:change:]( self,  "_requestToSendFilterOnTopicManager:change:",  self->_topicManager,  v7);
}

- (id)getConnectionTypeFromProtocolConnection:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  int v5 = @"wifi";
  if (v3)
  {
    id v6 = [v3 connectionType];
    id v7 = @"proxy";
    if (v6 != (id)2) {
      id v7 = @"wifi";
    }
    if (v6) {
      int v5 = v7;
    }
    else {
      int v5 = @"wwan";
    }
  }

  return (id)v5;
}

- (void)outgoingMessageQueue:(id)a3 lateAcknowledgmentForCriticalOutgoingMessage:(id)a4
{
  id v5 = a4;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v7 = v6;
  double v8 = v6 - self->_lastLateCriticalOutgoingMessageAcknowledgmentReconnectTime;
  if (v8 < 0.0 || v8 >= 60.0)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 sendInterfaceIdentifier]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    if ([v11 isAttemptingToReconnect])
    {
    }

    else
    {
      unsigned int v12 = -[APSUserCourier hasConnectedInterfaceForIdentifier:](self, "hasConnectedInterfaceForIdentifier:", v10);

      if (v12)
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412802;
          uint64_t v17 = self;
          __int16 v18 = 2048;
          id v19 = [v5 messageID];
          __int16 v20 = 2112;
          id v21 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Reconnecting because ack for critical outgoing message %lu is late. It was sent over %@.",  (uint8_t *)&v16,  0x20u);
        }

        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier connectedInterfaceForIdentifier:]( self,  "connectedInterfaceForIdentifier:",  v10));
        [v14 noteConnectionFailureWithReason:105];

        self->_lastLateCriticalOutgoingMessageAcknowledgmentReconnectTime = v7;
        goto LABEL_14;
      }
    }

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2048;
      id v19 = [v5 messageID];
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: An acknowledgement for critical outgoing message %lu is late and we are in the middle of a connection attemp t - leaving it open.",  (uint8_t *)&v16,  0x16u);
    }

LABEL_14:
  }
}

- (void)outgoingMessageQueueShortMessageTimeoutExceeded:(id)a3
{
  if (-[APSUserCourier countOfConnectedInterface](self, "countOfConnectedInterface", a3) >= 2)
  {
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      double v6 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: outgoingMessageQueueShortMessageTimeoutExceeded, disconnecting nonCellular",  (uint8_t *)&v5,  0xCu);
    }

    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  1LL,  &stru_10011E9C0);
  }

- (void)outgoingMessageQueue:(id)a3 requestCriticalMessageFlushWithPaddingLength:(unint64_t)a4
{
  id v6 = a3;
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    int v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ outgoingMessageQueueRequestCriticalMessageFlush %@ withPaddingLength %lu",  (uint8_t *)&v9,  0x20u);
  }

  if (-[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface"))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    [v8 sendFlushOnAllConnectionshWithPaddingLength:a4];
  }
}

- (void)outgoingMessageQueue:(id)a3 requestToSendLowPriorityMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ outgoingMessageQueue %@ requestToSendLowPriorityMessages %@",  buf,  0x20u);
  }

  if (self->_isConnectedToService)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          -[APSUserCourier _sendOutgoingMessage:onProtocolConnection:]( self,  "_sendOutgoingMessage:onProtocolConnection:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  0LL,  (void)v15);
        }

        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v11);
    }
  }

  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier", (void)v15));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ Done sending requested low priority messages.",  buf,  0xCu);
  }
}

- (BOOL)shouldForceShortTimeouts
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  BOOL v3 = (unint64_t)[v2 countConnectedInterfaces] > 1;

  return v3;
}

- (void)clientIdentityDidBecomeAvailable
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: Client identity is available",  (uint8_t *)&v6,  0xCu);
  }

  if (-[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable"))
  {
    -[APSUserCourier _clearCachedSigNonceCert](self, "_clearCachedSigNonceCert");
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    [v4 adjustConnectionsIfNeeded];

    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier delegate](self, "delegate"));
    [v5 courierIdentityBecameAvailable:self];
  }

- (void)clientIdentityDidBecomeUnavailable
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@: Client identity is not available",  (uint8_t *)&v5,  0xCu);
  }

  if (!-[APSUserCourier _isIdentityAvailable](self, "_isIdentityAvailable"))
  {
    -[APSUserCourier _clearCachedSigNonceCert](self, "_clearCachedSigNonceCert");
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    [v4 adjustConnectionsIfNeeded];
  }

  -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", 0LL, 1LL);
}

- (void)prepareForSleep
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForSleep", (uint8_t *)&v4, 0xCu);
  }

  self->_preparingForSleep = 1;
  -[APSWakeMetricTracker noteSystemWillSleep](self->_wakeMetricTracker, "noteSystemWillSleep");
  self->_firstPushSinceWake = 1;
  if (self->_isConnectedToService) {
    -[APSUserCourier _sendActiveStateMessageWithSendAllBlueListMessages:]( self,  "_sendActiveStateMessageWithSendAllBlueListMessages:",  0LL);
  }
}

- (void)prepareForDarkWake
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForDarkWake", (uint8_t *)&v5, 0xCu);
  }

  self->_preparingForSleep = 0;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  self->_startedDarkWake = v4;
  if (self->_isConnectedToService) {
    -[APSUserCourier _sendActiveStateMessageWithSendAllBlueListMessages:]( self,  "_sendActiveStateMessageWithSendAllBlueListMessages:",  1LL);
  }
}

- (void)prepareForFullWake
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForFullWake", (uint8_t *)&v4, 0xCu);
  }

  -[APSWakeMetricTracker noteSystemDidFullWakeWhileConnected:]( self->_wakeMetricTracker,  "noteSystemDidFullWakeWhileConnected:",  self->_isConnectedToService);
  self->_preparingForSleep = 0;
  if (self->_isConnectedToService) {
    -[APSUserCourier _sendActiveStateMessageWithSendAllBlueListMessages:]( self,  "_sendActiveStateMessageWithSendAllBlueListMessages:",  1LL);
  }
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
  [v7 sendTaskControlMessageWithMetadata:v6 messageId:a4];
}

- (void)addTaskServer:(id)a3
{
}

- (void)removeTaskServer:(id)a3
{
}

- (unint64_t)getNextTaskMessageId
{
  unint64_t nextTaskMessageId = self->_nextTaskMessageId;
  self->_unint64_t nextTaskMessageId = nextTaskMessageId + 1;
  return nextTaskMessageId;
}

- (void)logout
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemUser systemUserWithUserID:](&OBJC_CLASS___APSSystemUser, "systemUserWithUserID:", v3));

  int v5 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138412802;
    id v33 = self;
    __int16 v34 = 2112;
    __int16 v35 = v7;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Logging out user %@ from %@ environment",  buf,  0x20u);
  }

  __int16 v24 = v4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v10 = [v9 copy];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        __int128 v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5[275] courier]);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v17 = v5;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
          *(_DWORD *)buf = 138412546;
          id v33 = self;
          __int16 v34 = 2112;
          __int16 v35 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: Removing connection %@", buf, 0x16u);

          int v5 = v17;
        }

        [v15 handleConnectionStatusChanged:0];
        [v15 close];
        -[APSUserCourier connectionWasClosed:](self, "connectionWasClosed:", v15);
      }

      id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v12);
  }

  if ((id)-[APSUserCourier overallCourierStatus](self, "overallCourierStatus") == (id)3)
  {
    int v19 = 0;
    __int16 v20 = v24;
  }

  else
  {
    __int16 v20 = v24;
    if ((id)-[APSUserCourier overallCourierStatus](self, "overallCourierStatus") == (id)4)
    {
      int v19 = 0;
    }

    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10002D0B4;
      v26[3] = &unk_10011E758;
      v26[4] = self;
      -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v26);
      int v19 = 1;
    }
  }

  if ([v20 isGuestUser]
    && (id)-[APSUserCourier overallCourierStatus](self, "overallCourierStatus") != (id)3)
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5[275] courier]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
      *(_DWORD *)buf = 138412546;
      id v33 = self;
      __int16 v34 = 2112;
      __int16 v35 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: Removing obsolete token for logging out guest user %@",  buf,  0x16u);
    }

    -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", 0LL, 1LL);
  }

  if (v19)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    [v23 adjustConnectionsIfNeeded];
  }
}

- (void)flush
{
  BOOL v3 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
    *(_DWORD *)buf = 138412546;
    id v25 = self;
    __int16 v26 = 2112;
    __int128 v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Flushing user %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v7 = [v6 copy];

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v21;
    *(void *)&__int128 v10 = 138413058LL;
    __int128 v19 = v10;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        unint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v13);
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[275], "courier", v19, (void)v20));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 connectionPortName]);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 processName]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
          *(_DWORD *)buf = v19;
          id v25 = self;
          __int16 v26 = 2112;
          __int128 v27 = v16;
          __int16 v28 = 2112;
          __int128 v29 = v17;
          __int16 v30 = 2112;
          __int16 v31 = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@: Encountered unexpected connection %@/%@ for user %@",  buf,  0x2Au);

          BOOL v3 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
        }

        [v14 handleConnectionStatusChanged:0];
        [v14 close];
        -[APSUserCourier connectionWasClosed:](self, "connectionWasClosed:", v14);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }

    while (v11);
  }
}

- (void)_clearTopicsForGuestUser
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
    *(_DWORD *)buf = 138412546;
    __int128 v17 = self;
    __int16 v18 = 2112;
    __int128 v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Removing obsolete topics for guest user %@",  buf,  0x16u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setEnabledTopics:v3 ignoredTopics:v3 opportunisticTopics:v3 nonWakingTopics:v3];
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

  -[APSTopicManager removeAllTopics](self->_topicManager, "removeAllTopics");
  -[APSUserCourier _requestToSendFilterOnTopicManager:change:]( self,  "_requestToSendFilterOnTopicManager:change:",  self->_topicManager,  0LL);
}

- (void)_useInteractivePowerAssertionIfNeededForConnectionServer:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[APSUserCourier isIdle](self, "isIdle")
    && -[APSUserCourier _isInteractivePushDuringSleepEnabledForConnectionServer:]( self,  "_isInteractivePushDuringSleepEnabledForConnectionServer:",  v6))
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412802;
      __int128 v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Enabling interactive power assertions due to %@ connection %@",  (uint8_t *)&v9,  0x20u);
    }

    +[APSPowerAssertion_NoHold setUseInteractivePowerAssertion:]( &OBJC_CLASS___APSPowerAssertion,  "setUseInteractivePowerAssertion:",  1LL);
  }
}

- (void)_tryConnectingOrDisconnectingTokens
{
  if (-[APSUserCourier isConnectableRightNow](self, "isConnectableRightNow"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10002D664;
    v3[3] = &unk_10011E758;
    v3[4] = self;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v3);
  }

- (APSProtocolConnection)preferredProtocolConnection
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v9 isPreferredInterface])
        {
          id v11 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 firstObject]);

LABEL_11:
  return (APSProtocolConnection *)v11;
}

- (int64_t)countOfConnectedInterface
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0LL;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) isConnected];
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)hasConnectedInterface
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)i) isConnected])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)hasProtocolConnectionInterfaceOfType:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) connectionType] == (id)a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasConnectedInterfaceOfType:(int64_t)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v10 isConnected] && objc_msgSend(v10, "connectionType") == (id)a3)
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)hasConnectedInterfaceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6 != 0LL;
}

- (id)connectedInterfaceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)enumerateAllProtocolConnections:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  char v15 = 0;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10), &v15);
      if (v15) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateConnectedProtocolConnections:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  char v16 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      __int128 v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
      if ([v11 isConnected])
      {
        v4[2](v4, v11, &v16);
        if (v16) {
          break;
        }
      }

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateConnectedProtocolConnectionsOfType:(int64_t)a3 block:(id)a4
{
  id v6 = (void (**)(id, void *, _BYTE *))a4;
  char v18 = 0;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier", 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      __int128 v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
      if ([v13 isConnected])
      {
        if ([v13 connectionType] == (id)a3)
        {
          v6[2](v6, v13, &v18);
          if (v18) {
            break;
          }
        }
      }

      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)beginTrackingProtocolConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    -[APSUserCourier _disconnectTokenWithReason:onProtocolConnection:]( self,  "_disconnectTokenWithReason:onProtocolConnection:",  1000LL,  v4);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      __int128 v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      id v9 = "%@ begin tracking protocol connection, clearing previous state %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0x16u);
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      __int128 v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      id v9 = "%@ begin tracking protocol connection %@";
      goto LABEL_6;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v10 setObject:v4 forKeyedSubscript:v11];

  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___APSUserCourierInterfaceState);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v13 setObject:v12 forKeyedSubscript:v14];

  -[APSUserCourier logStateWithReason:](self, "logStateWithReason:", 0LL);
  [v4 addDataListener:self];
  [v4 addStateListener:self];
  -[APSUserCourier _sendPresenceMessageOnProtocolConnection:serverTime:]( self,  "_sendPresenceMessageOnProtocolConnection:serverTime:",  v4,  0LL);
  -[APSUserCourier _processShouldUseInternetChangeIfNecessary](self, "_processShouldUseInternetChangeIfNecessary");
}

- (id)stateForProtocolConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  return v7;
}

- (void)protocolConnection:(id)a3 didDisconnectWithConnectionState:(int64_t)a4 reason:(unsigned int)a5
{
}

- (void)didRecoverFromSuspensionOnProtocolConnection:(id)a3
{
  id v4 = a3;
  -[APSUserCourier _sendQueuedOutgoingMessages](self, "_sendQueuedOutgoingMessages");
  -[APSUserCourier _adjustIsConnectedToService](self, "_adjustIsConnectedToService");
  -[APSUserCourier _sendFilterMessageOnProtocolConnection:withReason:]( self,  "_sendFilterMessageOnProtocolConnection:withReason:",  v4,  5LL);
}

- (void)didSuspendProtocolConnection:(id)a3
{
  id v8 = a3;
  if (![v8 connectionType] && (objc_msgSend(v8, "isSuspended") & 1) == 0)
  {
    outgoingMessageQueue = self->_outgoingMessageQueue;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    -[APSOutgoingMessageQueue handleConnectionClosedOnInterface:]( outgoingMessageQueue,  "handleConnectionClosedOnInterface:",  v5);

    tokenRequestQueue = self->_tokenRequestQueue;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    -[APSOutgoingQueue handleConnectionClosedOnInterface:](tokenRequestQueue, "handleConnectionClosedOnInterface:", v7);
  }
}

- (void)outgoingDataAboutToSendForProtocolConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v36 = self;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: informed of pending outgoing data checking if filters should update -- protocol connection %@",  buf,  0x16u);
  }

  unsigned __int8 v6 = -[APSUserCourier locallyDisabledFilterOptimization](self, "locallyDisabledFilterOptimization");
  if (v4 && (v6 & 1) == 0)
  {
    unsigned int v7 = -[APSUserCourier hasOutOfDateFilterOnProtocolConnection:](self, "hasOutOfDateFilterOnProtocolConnection:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    if ([v8 everSentFilterOn:v9])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v4));
      id v11 = [v10 userState];

      if (v11) {
        unsigned int v12 = 0;
      }
      else {
        unsigned int v12 = v7;
      }
      if (v12 == 1)
      {
        __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v36 = self;
          __int16 v37 = 2114;
          id v38 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Out of date filter, send now on %{public}@",  buf,  0x16u);
        }

        -[APSUserCourier _sendFilterMessageOnProtocolConnection:withReason:]( self,  "_sendFilterMessageOnProtocolConnection:withReason:",  v4,  4LL);
      }
    }

    else
    {
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = self;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_proxyClients, "allValues"));
    id v14 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v32;
      *(void *)&__int128 v15 = 138412802LL;
      __int128 v28 = v15;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(obj);
          }
          __int128 v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filterVersionStateMachine", v28));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          unsigned int v22 = [v20 isOutOfDateOn:v21];

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v19 filterVersionStateMachine]);
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          if ([v23 everSentFilterOn:v24])
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
            unsigned int v26 = [v19 isConnectedOnInterface:v25];

            if ((v22 & v26) == 1)
            {
              __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v28;
                __int16 v36 = v29;
                __int16 v37 = 2112;
                id v38 = v19;
                __int16 v39 = 2114;
                id v40 = v4;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@: Client %@ has out of date filter, send now on %{public}@",  buf,  0x20u);
              }

              -[APSUserCourier _sendClientFilter:onProtocolConnection:]( v29,  "_sendClientFilter:onProtocolConnection:",  v19,  v4);
            }
          }

          else
          {
          }
        }

        id v16 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }

      while (v16);
    }
  }
}

- (BOOL)shouldHandleIncomingPush:(id)a3 forProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41[0] = @"APSProtocolToken";
  v41[1] = @"APSProtocolPubSubToken";
  v41[2] = @"APSProtocolPubSubUpdateToken";
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v36 + 1)
                                                                                            + 8LL * (void)i)));
        if (v13)
        {
          id v14 = (void *)v13;
          goto LABEL_11;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v14 = 0LL;
LABEL_11:

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolBaseToken"]);
  id v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v14;
  }
  id v18 = v17;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
  __int128 v20 = v19;
  __int128 v34 = v7;
  if (!v14)
  {
    unsigned __int8 v25 = 0;
    id v26 = 0LL;
    char v27 = 0;
    goto LABEL_30;
  }

  if ([v20 containsObject:v14])
  {
    __int128 v21 = 0LL;
  }

  else
  {
LABEL_19:
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:]( self,  "_findConnectedClientWithToken:onProtocolConnection:",  v18,  v7,  v34));
    __int128 v23 = v22;
    if (v22) {
      id v24 = v22;
    }
    else {
      id v24 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier _findClientWithToken:](self, "_findClientWithToken:", v18));
    }
    __int128 v21 = v24;

    if (!v14)
    {
      char v27 = 0;
      id v26 = 0LL;
      unsigned __int8 v25 = 0;
      if (v21) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
  }

  if (objc_msgSend(v20, "containsObject:", v14, v34))
  {
    id v26 = 0LL;
    unsigned __int8 v25 = 0;
    char v27 = 1;
    if (!v21) {
      goto LABEL_30;
    }
LABEL_28:
    BOOL v30 = 1;
    goto LABEL_35;
  }

  tokenStore = self->_tokenStore;
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  id v35 = 0LL;
  unsigned __int8 v25 = -[APSTokenStore isMatchingTokenInKeychain:user:error:]( tokenStore,  "isMatchingTokenInKeychain:user:error:",  v14,  v29,  &v35);
  id v26 = v35;

  char v27 = 0;
  if (v21) {
    goto LABEL_28;
  }
LABEL_30:
  __int128 v21 = 0LL;
  BOOL v30 = 1;
  if ((v27 & 1) == 0 && (v25 & 1) == 0)
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolTopicHash"]);
    __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000BD07C();
    }

    __int128 v21 = 0LL;
    BOOL v30 = 0;
  }

- (void)protocolConnection:(id)a3 receivedOfflinePresencekWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedMessageWithParameters:(id)a4 generation:(unint64_t)a5 isWaking:(BOOL)a6
{
}

- (void)protocolConnection:(id)a3 receivedPubSubChannelUpdateWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedPubSubChannelListWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedNoStorageWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedTaskControlWithParameters:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"APSProtocolTaskMessageId"]);
  id v7 = [v6 unsignedIntegerValue];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = self->_activeTaskServers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getTaskWithMessageId:", v7, (void)v16));
        if (v14)
        {
          uint64_t v15 = (os_log_s *)v14;
          [v13 handleTaskControlResponseMessage:v14 message:v5];

          goto LABEL_12;
        }
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000BD0DC();
  }
LABEL_12:
}

- (void)protocolConnection:(id)a3 receivedTaskNotificationWithParameters:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"APSProtocolTaskNotificationPayload"]);
  id v7 = -[TASKNotifyRequest initWithData:](objc_alloc(&OBJC_CLASS___TASKNotifyRequest), "initWithData:", v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = self->_activeTaskServers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      unsigned int v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v12);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getTaskWithTaskId:", -[TASKNotifyRequest taskId](v7, "taskId", (void)v16)));
        if (v14)
        {
          uint64_t v15 = (os_log_s *)v14;
          [v13 handleTaskNotificationMessage:v14 message:v5];

          goto LABEL_12;
        }

        unsigned int v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000BD13C();
  }
LABEL_12:
}

- (void)protocolConnection:(id)a3 receivedPresenceTrackingRequestWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedFilterUpdateWithParameters:(id)a4
{
  id v6 = (APSUserCourier *)a3;
  id v7 = a4;
  if (-[APSUserCourier locallyDisabledFilterOptimization](self, "locallyDisabledFilterOptimization"))
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000BD19C(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_36;
  }

  if (-[APSUserCourier expectsResponseForFilterMessageOnProtocolConnection:]( self,  "expectsResponseForFilterMessageOnProtocolConnection:",  v6))
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolFilterUpdateTokenKey"]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
    __int128 v17 = v16;
    if (v8 && ([v16 containsObject:v8] & 1) != 0)
    {
      __int128 v18 = 0LL;
    }

    else
    {
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:]( self,  "_findConnectedClientWithToken:onProtocolConnection:",  v8,  v6));
      if (!v18)
      {
        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _findClientWithToken:](self, "_findClientWithToken:", v8));
        if (!v18)
        {
          __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            proxyClients = self->_proxyClients;
            int v38 = 138413058;
            __int128 v39 = self;
            __int16 v40 = 2112;
            id v41 = v8;
            __int16 v42 = 2112;
            id v43 = v17;
            __int16 v44 = 2112;
            id v45 = proxyClients;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ Filter update not for this user -- ignoring {pushToken: %@, pushTokens: %@, clients: %@}",  (uint8_t *)&v38,  0x2Au);
          }

          goto LABEL_35;
        }
      }
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"APSProtocolFilterUpdateVersionKey"]);
    id v27 = [v26 integerValue];

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"APSProtocolFilterUpdateStatusKey"]);
    __int128 v29 = (APSUserCourier *)[v28 integerValue];

    BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138413058;
      __int128 v39 = v6;
      __int16 v40 = 2112;
      id v41 = v8;
      __int16 v42 = 2048;
      id v43 = v27;
      __int16 v44 = 2048;
      id v45 = (NSMutableDictionary *)v29;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received server filter update message on protocolConnection: %@  { token: %@ server version: %ld status: %ld }",  (uint8_t *)&v38,  0x2Au);
    }

    if (v29 == (APSUserCourier *)2)
    {
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Received filter update resend filter request from server - resending filters.",  (uint8_t *)&v38,  2u);
      }

      if (!v18)
      {
        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
        -[APSUserCourier _sendFilterMessageOnProtocolConnection:withReason:]( self,  "_sendFilterMessageOnProtocolConnection:withReason:",  v18,  6LL);
        goto LABEL_35;
      }

      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier identifier](v6, "identifier"));
      id v35 = -[os_log_s stateOnInterface:](v18, "stateOnInterface:", v34);

      if (v35 == (id)2)
      {
        -[APSUserCourier _sendClientFilter:onProtocolConnection:]( self,  "_sendClientFilter:onProtocolConnection:",  v18,  v6);
        goto LABEL_35;
      }

      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v38 = 138412290;
      __int128 v39 = (APSUserCourier *)v18;
      __int128 v36 = "Received filter update resend filter request from server for disconnected client - ignoring {destinationClient: %@}";
    }

    else
    {
      if (v29 == (APSUserCourier *)1)
      {
        __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Received filter update status disabled from server - disabling filter optimization on device.",  (uint8_t *)&v38,  2u);
        }

        if (v18)
        {
          __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSUserCourier identifier](v6, "identifier"));
          -[os_log_s setFilterMode:onInterface:](v18, "setFilterMode:onInterface:", 2LL, v32);
LABEL_34:

          goto LABEL_35;
        }

        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v6));
        -[os_log_s setFilterMode:](v18, "setFilterMode:", 2LL);
LABEL_35:

        goto LABEL_36;
      }

      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v38 = 134217984;
      __int128 v39 = v29;
      __int128 v36 = "Received unknown status from server (%ld).";
    }

    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v36, (uint8_t *)&v38, 0xCu);
    goto LABEL_34;
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000BD1D0(v8, v19, v20, v21, v22, v23, v24, v25);
  }
LABEL_36:
}

- (void)receivedFilterResponseWithParameters:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolFilterResponseTokenKey"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"APSProtocolFilterResponseVersionKey"]);
  uint64_t v10 = (NSMutableDictionary *)[v9 integerValue];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"APSProtocolFilterResponseStatusKey"]);
  uint64_t v12 = (APSUserCourier *)[v11 integerValue];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier debugOverrides](self, "debugOverrides"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "overrideFilterDisableResponseForConnectionType:",  objc_msgSend(v6, "connectionType")));

  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138413570;
      __int16 v42 = self;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      __int16 v46 = v8;
      __int16 v47 = 2048;
      __int16 v48 = v10;
      __int16 v49 = 2048;
      __int16 v50 = v12;
      __int16 v51 = 2048;
      id v52 = [v14 integerValue];
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ Received filter response message on protocolConnection: %@ -- overriding  { token: %@, version: %ld, status: %ld, overrideStatus: %ld}",  buf,  0x3Eu);
    }

    uint64_t v12 = (APSUserCourier *)[v14 integerValue];
  }

  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138413314;
      __int16 v42 = self;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      __int16 v46 = v8;
      __int16 v47 = 2048;
      __int16 v48 = v10;
      __int16 v49 = 2048;
      __int16 v50 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ Received filter response message on protocolConnection: %@  { token: %@, version: %ld, status: %ld }",  buf,  0x34u);
    }
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
  __int128 v18 = v17;
  __int128 v39 = v14;
  __int16 v40 = v17;
  if (v8 && ([v17 containsObject:v8] & 1) != 0)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    [v19 noteAckedWithVersion:v10 on:v20];
    uint64_t v21 = 0LL;
    int v22 = 1;
LABEL_14:

    switch((unint64_t)v12)
    {
      case 1uLL:
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Received filter response status success from server.",  buf,  2u);
        }

        uint64_t v14 = v39;
        if (v22)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v6));
          uint64_t v25 = v24;
          uint64_t v26 = 1LL;
          goto LABEL_25;
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        __int128 v37 = v21;
        uint64_t v38 = 1LL;
        goto LABEL_38;
      case 2uLL:
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
        *(_WORD *)buf = 0;
        __int128 v28 = "Received filter response status failure from server - this shouldn't happen.";
        __int128 v29 = v27;
        uint32_t v30 = 2;
        break;
      case 3uLL:
        __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Received filter response status disabled from server - disabling filter optimization on device.",  buf,  2u);
        }

        uint64_t v14 = v39;
        if (v22)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v6));
          uint64_t v25 = v24;
          uint64_t v26 = 2LL;
LABEL_25:
          objc_msgSend(v24, "setFilterMode:", v26, v39);
        }

        else
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          __int128 v37 = v21;
          uint64_t v38 = 2LL;
LABEL_38:
          objc_msgSend(v37, "setFilterMode:onInterface:", v38, v25, v39);
        }

        __int128 v18 = v40;
        goto LABEL_44;
      case 4uLL:
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
        __int128 v33 = (APSUserCourier *)objc_claimAutoreleasedReturnValue([v32 noteInvalidWithVersion:v10]);

        __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v33)
        {
          uint64_t v14 = v39;
          __int128 v18 = v40;
          if (v35)
          {
            *(_DWORD *)buf = 138412290;
            __int16 v42 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Received filter response status invalid version from server - failed incrementing, disconnecting. {invalidError: %@}",  buf,  0xCu);
          }

          [v6 disconnectWithReason:23];
        }

        else
        {
          uint64_t v14 = v39;
          __int128 v18 = v40;
          if (v35)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Received filter response status invalid version from server - incrementing version.",  buf,  2u);
          }
        }

        goto LABEL_44;
      default:
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = 134217984;
        __int16 v42 = v12;
        __int128 v28 = "Received unknown status from server (%ld).";
        __int128 v29 = v27;
        uint32_t v30 = 12;
        break;
    }

    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
LABEL_33:

    uint64_t v14 = v39;
    __int128 v18 = v40;
    goto LABEL_44;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:]( self,  "_findConnectedClientWithToken:onProtocolConnection:",  v8,  v6,  v14));
  if (v21
    || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _findClientWithToken:](self, "_findClientWithToken:", v8))) != 0LL)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v21 filterVersionStateMachine]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    [v19 noteAckedWithVersion:v10 on:v20];
    int v22 = 0;
    goto LABEL_14;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    proxyClients = self->_proxyClients;
    *(_DWORD *)buf = 138413058;
    __int16 v42 = self;
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    __int16 v46 = v18;
    __int16 v47 = 2112;
    __int16 v48 = proxyClients;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "%@ Filter response not for this user -- ignoring {pushToken: %@, pushTokens: %@, clients: %@}",  buf,  0x2Au);
  }

- (BOOL)shouldOnlySendFilterOnPreferredInterface
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
  if ((unint64_t)[v3 count] >= 2)
  {
    unsigned __int8 v4 = -[APSUserCourier hasConnectedInterfaceOfType:](self, "hasConnectedInterfaceOfType:", 2LL);

    if ((v4 & 1) == 0
      && !-[APSUserCourier locallyDisabledFilterOptimization](self, "locallyDisabledFilterOptimization")
      && !-[APSUserCourier serverDisabledFilterOptimization](self, "serverDisabledFilterOptimization"))
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x2020000000LL;
      char v11 = 1;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10002FAB8;
      v7[3] = &unk_10011E9E8;
      v7[4] = self;
      v7[5] = &v8;
      -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v7);
      BOOL v5 = *((_BYTE *)v9 + 24) != 0;
      _Block_object_dispose(&v8, 8);
      return v5;
    }
  }

  else
  {
  }

  return 0;
}

- (BOOL)hasOutOfDateFilterOnProtocolConnection:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[APSUserCourier locallyDisabledFilterOptimization](self, "locallyDisabledFilterOptimization");
  unsigned __int8 v6 = 0;
  if (v4 && (v5 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned __int8 v6 = [v7 isOutOfDateOn:v8];
  }

  return v6;
}

- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3
{
  id v4 = a3;
  if (-[APSUserCourier locallyDisabledFilterOptimization](self, "locallyDisabledFilterOptimization"))
  {
    BOOL v5 = 0;
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v4));
    id v7 = [v6 filterMode];

    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002FD08;
    v9[3] = &unk_10011EA10;
    char v11 = self;
    uint64_t v12 = &v13;
    id v10 = v4;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v9);
    BOOL v5 = v7 != (id)2 && *((_BYTE *)v14 + 24) == 0;

    _Block_object_dispose(&v13, 8);
  }

  return v5;
}

- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[APSUserCourier expectsResponseForFilterMessageOnProtocolConnection:]( self,  "expectsResponseForFilterMessageOnProtocolConnection:",  v6))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v9 = [v7 filterModeOnInterface:v8];

    uint64_t v16 = 0LL;
    __int128 v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    char v19 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002FF18;
    v12[3] = &unk_10011EA10;
    id v13 = v6;
    uint64_t v15 = &v16;
    id v14 = v7;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v12);
    BOOL v10 = v9 != (id)2 && *((_BYTE *)v17 + 24) == 0;

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updateForReceivedConfig:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 powerOptimizationsForExpensiveNetworkingDisabled]);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 BOOLValue];
    -[APSOutgoingMessageQueue setPowerOptimizationsForExpensiveNetworkingDisabled:]( self->_outgoingMessageQueue,  "setPowerOptimizationsForExpensiveNetworkingDisabled:",  v7);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"NO";
      if ((_DWORD)v7) {
        id v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      char v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@:  powerOptimizationsForExpensiveNetworkingDisabled = %@",  buf,  0x16u);
    }
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 filterOptimizationEnabled]);
  char v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 BOOLValue];
    unsigned int v13 = -[APSUserCourier shouldOnlySendFilterOnPreferredInterface](self, "shouldOnlySendFilterOnPreferredInterface");
    self->_serverDisabledFilterOptimization = v12 ^ 1;
    unsigned int v14 = -[APSUserCourier shouldOnlySendFilterOnPreferredInterface](self, "shouldOnlySendFilterOnPreferredInterface");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = @"NO";
      if (v12) {
        uint64_t v16 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      char v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@:  filterOptimizationsEnabled = %@",  buf,  0x16u);
    }

    if (((v13 ^ 1 | v14) & 1) == 0
      && -[APSUserCourier countOfConnectedInterface](self, "countOfConnectedInterface") >= 2)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100030218;
      v17[3] = &unk_10011E758;
      v17[4] = self;
      -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v17);
    }
  }
}

- (void)connectionDidOpenonProtocolConnection:(id)a3 secureHandshakeEnabled:(BOOL)a4
{
}

- (void)_handlePresenceOffline:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"APSProtocolPresenceStatus"]);
  if ([v5 intValue] == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"APSProtocolToken"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _findClientWithToken:](self, "_findClientWithToken:", v6));
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      BOOL v10 = self;
      __int16 v11 = 2112;
      unsigned int v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Got presence offline for client %@.  Invalidating and removing any pending proxy presences.",  (uint8_t *)&v9,  0x16u);
    }

    [v7 invalidate];
    -[APSUserCourier _clearPendingProxyPresence](self, "_clearPendingProxyPresence");
  }
}

- (void)receivedConnectedResponseWithParameters:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateByConnectionIdentifier = self->_stateByConnectionIdentifier;
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( stateByConnectionIdentifier,  "objectForKeyedSubscript:",  v9));
  if ([v10 userState] == (id)1)
  {

    goto LABEL_4;
  }

  proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;

  if (proxyClientWithOutstandingPresence)
  {
LABEL_4:
    unsigned int v12 = self->_stateByConnectionIdentifier;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
    [v14 setUserState:0];

    uint64_t v15 = self->_proxyClientWithOutstandingPresence;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v17 = -[APSProxyClient stateOnInterface:](v15, "stateOnInterface:", v16);

    if (v17 == (id)3)
    {
      uint64_t v18 = self->_proxyClientWithOutstandingPresence;
      char v19 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      -[APSProxyClient setState:onInterface:](v18, "setState:onInterface:", 0LL, v19);

      __int16 v20 = self->_proxyClientWithOutstandingPresence;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      -[APSProxyClient setFilterMode:onInterface:](v20, "setFilterMode:onInterface:", 0LL, v21);

      -[APSUserCourier _clearPendingProxyPresence](self, "_clearPendingProxyPresence");
    }

    else
    {
      -[APSUserCourier _handleConnectedMessage:onProtocolConnection:]( self,  "_handleConnectedMessage:onProtocolConnection:",  v6,  v7);
    }

    goto LABEL_10;
  }

  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = self->_stateByConnectionIdentifier;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24));
    int v26 = 138412546;
    id v27 = self;
    __int16 v28 = 2048;
    id v29 = [v25 userState];
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@: Received connect message but not in a state to handle it {status: %lld}",  (uint8_t *)&v26,  0x16u);
  }

LABEL_10:
  -[APSUserCourier logStateWithReason:](self, "logStateWithReason:", 0LL);
}

- (void)_handleConnectedMessage:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = v7;
  proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
  if (proxyClientWithOutstandingPresence)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v7, "identifier"));
    BOOL v11 = (id)-[APSProxyClient stateOnInterface:](proxyClientWithOutstandingPresence, "stateOnInterface:", v10) != (id)1;
  }

  else
  {
    BOOL v11 = 1;
  }

  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = (APSUserCourier *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    *(_DWORD *)buf = 138412290;
    v119 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received connect message [%@]", buf, 0xCu);
  }

  p_proxyClientWithOutstandingPresence = &self->_proxyClientWithOutstandingPresence;

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolConnectedResponse"]);
  unsigned int v15 = [v14 intValue];

  uint64_t v16 = "APSNoOpClientIdentityProvider";
  BOOL v109 = v11;
  if (sub_100077B08())
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier debugOverrides](self, "debugOverrides"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 forcedInvalidPresences]);
    uint64_t v19 = (uint64_t)[v18 integerValue];

    uint64_t v16 = "APSNoOpClientIdentityProvider";
    if (v19 >= 1)
    {
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000BD2D4();
      }

LABEL_24:
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolServerTimeForBadNonce"]);
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier debugOverrides](self, "debugOverrides"));
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 forcedInvalidPresences]);
      id v34 = [v33 integerValue];

      if (v34 == (id)1)
      {
        BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v119 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@: Debug override to treat presence as invalid with no server time",  buf,  0xCu);
        }

        uint64_t v36 = 0LL;
      }

      else
      {
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier debugOverrides](self, "debugOverrides"));
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 forcedInvalidPresences]);
        id v40 = [v39 integerValue];

        if (v40 != (id)2)
        {
          BOOL v11 = v109;
LABEL_48:
          -[APSUserCourier _triggerAutoBugCaptureForInvalidPresence:]( self,  "_triggerAutoBugCaptureForInvalidPresence:",  v6);
          if (!v11)
          {
            id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v56 = self->_proxyClientWithOutstandingPresence;
              *(_DWORD *)buf = 138412546;
              v119 = self;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v56;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%@ Deactivating client after invalid presence attempt %@",  buf,  0x16u);
            }

            -[APSProxyClient invalidate](*p_proxyClientWithOutstandingPresence, "invalidate");
            id v57 = *p_proxyClientWithOutstandingPresence;
            __int16 v58 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v8, "identifier"));
            -[APSProxyClient setState:onInterface:](v57, "setState:onInterface:", 0LL, v58);

            id v59 = *p_proxyClientWithOutstandingPresence;
            __int16 v60 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v8, "identifier"));
            -[APSProxyClient setFilterMode:onInterface:](v59, "setFilterMode:onInterface:", 0LL, v60);

            __int128 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            __int16 v62 = v61;
            if (v31)
            {
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v63 = self->_proxyClientWithOutstandingPresence;
                *(_DWORD *)buf = 138412546;
                v119 = self;
                __int16 v120 = 2112;
                uint64_t v121 = (uint64_t)v63;
                _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "%@ invalid presence seems to be due to an expired nonce. Telling client %@.",  buf,  0x16u);
              }

              __int16 v64 = *p_proxyClientWithOutstandingPresence;
              __int16 v65 = v31;
              uint64_t v66 = 0LL;
            }

            else
            {
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
                sub_1000BD270();
              }

              __int16 v64 = *p_proxyClientWithOutstandingPresence;
              __int16 v65 = 0LL;
              uint64_t v66 = 1LL;
            }

            -[APSProxyClient handleExpiredNonceWithServerTime:shouldRollToken:]( v64,  "handleExpiredNonceWithServerTime:shouldRollToken:",  v65,  v66);
            -[APSUserCourier _clearPendingProxyPresence](self, "_clearPendingProxyPresence");
            -[APSUserCourier _performIdleCheck](self, "_performIdleCheck");
            goto LABEL_103;
          }

          __int16 v51 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v8));
          [v51 setUserState:3];

          if (v31)
          {
            id v52 = self;
            id v53 = v8;
            __int16 v54 = v31;
          }

          else
          {
            __int16 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
              sub_1000BD204();
            }

            -[__CFString noteInvalidPresence](v8, "noteInvalidPresence");
            __int16 v68 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
            unsigned int v69 = [v68 isDefaultUser];

            if (v69)
            {
              -[APSUserCourier _processInvalidIdentity](self, "_processInvalidIdentity");
LABEL_103:

              goto LABEL_109;
            }

            -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", 0LL, 1LL);
            id v52 = self;
            id v53 = v8;
            __int16 v54 = 0LL;
          }

          -[APSUserCourier _sendPresenceMessageOnProtocolConnection:serverTime:]( v52,  "_sendPresenceMessageOnProtocolConnection:serverTime:",  v53,  v54);
          goto LABEL_103;
        }

        id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v41 timeIntervalSince1970];
        uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v42 * 1000.0));

        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v119 = self;
          __int16 v120 = 2112;
          uint64_t v121 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v31,  OS_LOG_TYPE_DEFAULT,  "%@: Debug override to treat presence as invalid with server time, using current time %@",  buf,  0x16u);
        }
      }

      BOOL v11 = v109;

      __int128 v31 = (void *)v36;
      goto LABEL_48;
    }
  }

  if (v15 == 2) {
    goto LABEL_24;
  }
  if (!v15)
  {
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        int v22 = @"YES";
      }
      else {
        int v22 = @"NO";
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
      uint64_t v24 = (__CFString *)[v23 countConnectedInterfaces];
      *(_DWORD *)buf = 138413058;
      v119 = self;
      __int16 v120 = 2112;
      uint64_t v121 = (uint64_t)v22;
      BOOL v11 = v109;
      __int16 v122 = 2112;
      v123 = v8;
      __int16 v124 = 2048;
      v125 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: Connected response ok for user courier token? %@ on interface: %@ - connected on %lu interfaces",  buf,  0x2Au);
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolFilterOptimizationSupport"]);
    unsigned int v26 = [v25 BOOLValue];

    unsigned __int8 v27 = -[APSUserCourier serverDisabledFilterOptimization](self, "serverDisabledFilterOptimization");
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if ((v27 & 1) != 0)
    {
      if (v29)
      {
        uint32_t v30 = @"NO";
        *(_DWORD *)buf = 138413058;
        v119 = self;
        __int16 v120 = 2112;
        if (v26) {
          uint32_t v30 = @"YES";
        }
        uint64_t v121 = (uint64_t)v30;
        __int16 v122 = 2112;
        v123 = @"YES";
        __int16 v124 = 2112;
        v125 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: Ignoring response for filterOptimizationSupport: %@:, using config state: %@ on %@",  buf,  0x2Au);
      }
    }

    else
    {
      if (v29)
      {
        __int16 v43 = @"NO";
        *(_DWORD *)buf = 138412802;
        v119 = self;
        __int16 v120 = 2112;
        if (v26) {
          __int16 v43 = @"YES";
        }
        uint64_t v121 = (uint64_t)v43;
        __int16 v122 = 2112;
        v123 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: Setting filterOptimizationSupport: %@ on %@",  buf,  0x20u);
      }

      if (!v26)
      {
        uint64_t v44 = 2LL;
        if (!v11)
        {
LABEL_77:
          __int128 v88 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolToken"]);
          if (v88)
          {
            __int128 v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v119 = self;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v88;
              _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "%@: Received public token '%@'",  buf,  0x16u);
            }

            if (v11)
            {
              -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", v88, 1LL);
            }

            else
            {
              v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
              {
                id v91 = self->_proxyClientWithOutstandingPresence;
                *(_DWORD *)buf = 138412546;
                v119 = self;
                __int16 v120 = 2112;
                uint64_t v121 = (uint64_t)v91;
                _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "%@: setting new token on client %@",  buf,  0x16u);
              }

              -[APSProxyClient setPublicToken:](*p_proxyClientWithOutstandingPresence, "setPublicToken:", v88);
            }
          }

          id v92 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"APSProtocolServerMetadata"]);
          if (v92)
          {
            id v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v119 = self;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v92;
              _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "%@: Received metadata '%@'",  buf,  0x16u);
            }
          }

          id v94 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString maxMessageSize](v8, "maxMessageSize"));
          if (v94)
          {
            id v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v119 = self;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v94;
              _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "%@: Received message size %@",  buf,  0x16u);
            }

            -[APSUserCourier setMessageSize:](self, "setMessageSize:", [v94 unsignedIntegerValue]);
          }

          id v96 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString maxLargeMessageSize](v8, "maxLargeMessageSize"));
          if (v96)
          {
            id v97 = v6;
            v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v119 = self;
              __int16 v120 = 2112;
              uint64_t v121 = (uint64_t)v96;
              _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "%@: Received large message size %@",  buf,  0x16u);
            }

            -[APSUserCourier setLargeMessageSize:]( self,  "setLargeMessageSize:",  [v96 unsignedIntegerValue]);
            id v6 = v97;
            BOOL v11 = v109;
          }

          if (v11)
          {
            -[APSUserCourier _didFinishAssertingAllPresences:](self, "_didFinishAssertingAllPresences:", v8);
          }

          else
          {
            v110 = v88;
            uint64_t v99 = v44;
            id v100 = *p_proxyClientWithOutstandingPresence;
            if (*p_proxyClientWithOutstandingPresence)
            {
              v101 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v8, "identifier"));
              -[APSProxyClient setState:onInterface:](v100, "setState:onInterface:", 2LL, v101);

              objc_super v102 = self->_proxyClientWithOutstandingPresence;
              v103 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v8, "identifier"));
              -[APSProxyClient setFilterMode:onInterface:](v102, "setFilterMode:onInterface:", v99, v103);

              -[APSUserCourier _sendClientFilter:onProtocolConnection:]( self,  "_sendClientFilter:onProtocolConnection:",  self->_proxyClientWithOutstandingPresence,  v8);
              -[APSUserCourier _requestClientPubSubChannelList:onProtocolConnection:]( self,  "_requestClientPubSubChannelList:onProtocolConnection:",  self->_proxyClientWithOutstandingPresence,  v8);
              -[APSUserCourier _sendQueuedOutgoingMessages](self, "_sendQueuedOutgoingMessages");
              -[APSUserCourier _clearPendingProxyPresence](self, "_clearPendingProxyPresence");
            }

            else
            {
              v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                sub_1000BD350();
              }
            }

            __int128 v88 = v110;
          }

          uint64_t v16 = "APSNoOpClientIdentityProvider";
          goto LABEL_109;
        }

- (void)_triggerAutoBugCaptureForInvalidPresence:(id)a3
{
  id v4 = a3;
  if (sub_100077B08())
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSDebugOverrides forcedInvalidPresences](self->_debugOverrides, "forcedInvalidPresences"));
    id v6 = [v5 integerValue];

    if ((uint64_t)v6 <= 0)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "triggering ABC for invalid presence",  buf,  2u);
      }

      if (!self->_symptomReporter)
      {
        uint64_t v8 = objc_alloc_init(&OBJC_CLASS___APSSymptomReporter);
        symptomReporter = self->_symptomReporter;
        self->_symptomReporter = v8;
      }

      else {
        BOOL v10 = @"NO";
      }
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"APSProtocolServerTimeForBadNonce"]);
      if (v11) {
        unsigned int v12 = @"YES";
      }
      else {
        unsigned int v12 = @"NO";
      }
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Using BAA? %@, Contains server time? %@",  v10,  v12));

      -[APSSymptomReporter reportSymptomToAutoBugCapture:subType:]( self->_symptomReporter,  "reportSymptomToAutoBugCapture:subType:",  @"InvalidPresence",  v13);
    }
  }
}

- (void)_forceReconnectionsWithReason:(unsigned int)a3
{
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ Forcing reconnections on all interfaces",  buf,  0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100031A60;
  v7[3] = &unk_10011EA30;
  unsigned int v8 = a3;
  -[APSUserCourier enumerateAllProtocolConnections:](self, "enumerateAllProtocolConnections:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
  [v6 forceAdjustConnections];
}

- (void)_notifyForIncomingMessage:(id)a3
{
}

- (void)_notifyForIncomingMessage:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
    *(_DWORD *)buf = 138412802;
    double v42 = self;
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    __int16 v46 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ _notifyForIncomingMessage %@ with guid %@",  buf,  0x20u);
  }

  if (v7)
  {
    id v40 = v7;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  }

  __int16 v28 = self;
  BOOL v29 = v7;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v10;
  id v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    char v31 = 0;
    uint64_t v33 = *(void *)v36;
    id v30 = v6;
    do
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v11);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 enabledTopics]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 opportunisticTopics]);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 nonWakingTopics]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 publicToken]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
        unsigned int v18 = [v16 isEqual:v17];

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
        if ([v13 containsObject:v19])
        {
          unsigned int v20 = 1;
        }

        else
        {
          uint64_t v21 = v6;
          int v22 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
          if ([v15 containsObject:v22])
          {
            unsigned int v20 = 1;
          }

          else
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 topic]);
            if (([v14 containsObject:v23] & 1) != 0
              || ([v13 containsObject:@"*"] & 1) != 0
              || ([v14 containsObject:@"*"] & 1) != 0)
            {
              unsigned int v20 = 1;
            }

            else
            {
              unsigned int v20 = [v15 containsObject:@"*"];
            }
          }

          id v6 = v30;
        }

        if ((v18 & v20) == 1)
        {
          [v12 handleReceivedMessage:v6];
          char v31 = 1;
        }

        BOOL v11 = (char *)v11 + 1;
      }

      while (v34 != v11);
      id v24 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      id v34 = v24;
    }

    while (v24);
  }

  else
  {
    char v31 = 0;
  }

  if (!v29 && (v31 & 1) == 0)
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
      *(_DWORD *)buf = 138412802;
      double v42 = v28;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      __int16 v46 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@ found no listeners for message %@ with topic %@. Cleaning up message.",  buf,  0x20u);
    }

    unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
    -[APSUserCourier connection:handleAckIncomingMessageWithGuid:topic:tracingUUID:]( v28,  "connection:handleAckIncomingMessageWithGuid:topic:tracingUUID:",  0LL,  v27,  0LL,  0LL);
  }
}

- (BOOL)_wakeCausedByTopic:(id)a3 interface:(id)a4 priorityVal:(unint64_t)a5 inAllowlist:(BOOL)a6
{
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[PCPersistentTimer lastSystemWakeDate](&OBJC_CLASS___PCPersistentTimer, "lastSystemWakeDate", a3, a4));
  int v9 = (void *)v8;
  BOOL v10 = a5 == 5 && a6;
  if (a5 == 10) {
    BOOL v10 = 1;
  }
  if (a5) {
    char v11 = v10;
  }
  else {
    char v11 = 1;
  }
  if (v8)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v12 timeIntervalSinceDate:v9];
    double v14 = v13;

    BOOL v15 = v14 >= 0.0;
    if (v14 >= 2.0) {
      BOOL v15 = 0;
    }
    BOOL v16 = v11 & v15;
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_handleMessageMessage:(id)a3 onProtocolConnection:(id)a4 withGeneration:(unint64_t)a5 isWakingMessage:(BOOL)a6 fromAgent:(BOOL)a7
{
  BOOL v148 = a7;
  BOOL v7 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolToken"]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolBaseToken"]);
  double v14 = (void *)v13;
  if (v13) {
    BOOL v15 = (void *)v13;
  }
  else {
    BOOL v15 = (void *)v12;
  }
  id v16 = v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getCurrentTokens](self, "_getCurrentTokens"));
  unsigned int v18 = v17;
  v164 = v11;
  v165 = self;
  v163 = v17;
  if ((!v14 || [v17 containsObject:v14])
    && (!v12 || ([v18 containsObject:v12] & 1) != 0))
  {
    BOOL v130 = v7;
    uint64_t v19 = 0LL;
    goto LABEL_25;
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue( -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:]( self,  "_findConnectedClientWithToken:onProtocolConnection:",  v16,  v11));
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138413314;
    v179 = self;
    __int16 v180 = 2112;
    *(void *)v181 = v21;
    *(_WORD *)&v181[8] = 2112;
    uint64_t v182 = (uint64_t)v14;
    __int16 v183 = 2112;
    uint64_t v184 = v12;
    __int16 v185 = 2112;
    v186 = v163;
    uint64_t v23 = "%@ incoming message is for a proxy client %@ baseToken %@  destToken %@  publicTokens %@";
    id v24 = v22;
    uint32_t v25 = 52;
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _findClientWithToken:](self, "_findClientWithToken:", v16));
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138413058;
    v179 = self;
    __int16 v180 = 2112;
    *(void *)v181 = v14;
    *(_WORD *)&v181[8] = 2112;
    uint64_t v182 = v12;
    __int16 v183 = 2112;
    uint64_t v184 = (uint64_t)v163;
    uint64_t v23 = "%@ incoming message is for proxy client that is *not* connected. baseToken %@  destToken %@  publicTokens %@";
    id v24 = v22;
    uint32_t v25 = 42;
  }

  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_15:

  if (v148)
  {
    BOOL v130 = v7;
    uint64_t v19 = v21;
    goto LABEL_25;
  }

  uint64_t v19 = v21;
  if (!v21)
  {
    BOOL v130 = v7;
LABEL_25:
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolTopicHash"]);
    v162 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolPayload"]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageID"]);
    v144 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageCorrelationIdentifier"]);
    if (v34) {
      uint64_t v155 = *(unsigned int *)[v34 bytes];
    }
    else {
      uint64_t v155 = 0LL;
    }
    v159 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageTimestamp"]);
    v143 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageExpiry"]);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageStorageFlags"]);
    v158 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessagePriority"]);
    v157 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageAPNFlags"]);
    v147 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessageTracingUUID"]);
    v156 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessagePushType"]);
    v161 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"APSProtocolMessagePubSubInfo"]);
    v137 = v35;
    unsigned int v36 = [v35 unsignedIntValue];
    wakeMetricTracker = self->_wakeMetricTracker;
    unsigned int v142 = v36;
    v135 = v34;
    if ((v36 & 1) != 0) {
      -[APSWakeMetricTracker noteReceivedStoredMessage](wakeMetricTracker, "noteReceivedStoredMessage");
    }
    else {
      -[APSWakeMetricTracker noteReceivedLiveMessage](wakeMetricTracker, "noteReceivedLiveMessage");
    }
    __int128 v38 = self->_topicManager;
    uint64_t v39 = objc_claimAutoreleasedReturnValue(-[APSTopicManager hasEnabledTopicHash:](v38, "hasEnabledTopicHash:", v33));
    uint64_t v40 = v39;
    v140 = (void *)v12;
    id v141 = v10;
    v138 = (void *)v33;
    v139 = v14;
    id v145 = v16;
    v152 = v19;
    v136 = v38;
    if (v39)
    {
      uint64_t v129 = 1LL;
      id v41 = (void *)v39;
    }

    else
    {
      uint64_t v42 = objc_claimAutoreleasedReturnValue(-[APSTopicManager hasOpportunisticTopicHash:](v38, "hasOpportunisticTopicHash:", v33));
      if (v42)
      {
        __int16 v43 = (void *)v42;
        uint64_t v44 = 2LL;
      }

      else
      {
        uint64_t v45 = objc_claimAutoreleasedReturnValue(-[APSTopicManager hasNonWakingTopicHash:](v38, "hasNonWakingTopicHash:", v33));
        if (v45)
        {
          __int16 v43 = (void *)v45;
          uint64_t v44 = 4LL;
        }

        else
        {
          uint64_t v46 = objc_claimAutoreleasedReturnValue(-[APSTopicManager hasPausedTopicHash:](v38, "hasPausedTopicHash:", v33));
          if (!v46)
          {
            uint64_t v122 = objc_claimAutoreleasedReturnValue(-[APSTopicManager hasIgnoredTopicHash:](v38, "hasIgnoredTopicHash:", v33));
            if (v122)
            {
              v123 = (void *)v122;
              v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              v154 = v123;
              if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
                sub_1000BD530();
              }
              v150 = 0LL;
              v160 = 0LL;
              v132 = 0LL;
              v134 = 0LL;
              uint64_t v124 = 6LL;
            }

            else
            {
              uint64_t v125 = objc_claimAutoreleasedReturnValue(-[APSTopicManager hasRecentlyRemovedTopicHash:](v38, "hasRecentlyRemovedTopicHash:", v33));
              v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              BOOL v126 = os_log_type_enabled(v146, OS_LOG_TYPE_ERROR);
              if (v125)
              {
                v150 = (void *)v125;
                if (v126) {
                  sub_1000BD4D0();
                }
              }

              else
              {
                if (v126) {
                  sub_1000BD470();
                }
                v150 = 0LL;
              }

              v160 = 0LL;
              v154 = 0LL;
              v132 = 0LL;
              v134 = 0LL;
              uint64_t v124 = 7LL;
            }

            uint64_t v131 = v124;
            unint64_t v107 = a5;
            id v108 = v135;
            uint64_t v106 = v155;
            goto LABEL_133;
          }

          __int16 v43 = (void *)v46;
          uint64_t v44 = 5LL;
        }
      }

      uint64_t v129 = v44;
      id v41 = v43;
    }

    unsigned int v133 = -[APSUserCourier _wakeCausedByTopic:interface:priorityVal:inAllowlist:]( self,  "_wakeCausedByTopic:interface:priorityVal:inAllowlist:",  v41,  v11,  [v158 unsignedIntegerValue],  v40 != 0);
    if (v12) {
      unsigned int v47 = [v163 containsObject:v12];
    }
    else {
      unsigned int v47 = 0;
    }
    [v159 doubleValue];
    v146 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  v48 / 1000000000.0));
    pushHistory = self->_pushHistory;
    if (v47)
    {
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(-[APSPushHistory timestampForTopic:token:](pushHistory, "timestampForTopic:token:", v41, v12));
      if (!v50 || [v159 compare:v50])
      {
        id v153 = 0LL;
        char v51 = 0;
        int v52 = 0;
LABEL_74:

        unsigned __int8 v63 = [v157 unsignedLongValue];
        if ((v51 & 1) == 0 && (v63 & 1) != 0)
        {
          __int16 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v179 = self;
            __int16 v180 = 2112;
            *(void *)v181 = v12;
            *(_WORD *)&v181[8] = 2112;
            uint64_t v182 = (uint64_t)v41;
            _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "%@: Received push for token %@ topic %@ which was removed but the token is valid unexpectedly! Delivering message to the client anyways.",  buf,  0x20u);
          }

          symptomReporter = self->_symptomReporter;
          if (!symptomReporter)
          {
            uint64_t v66 = objc_alloc_init(&OBJC_CLASS___APSSymptomReporter);
            __int16 v67 = self->_symptomReporter;
            self->_symptomReporter = v66;

            symptomReporter = self->_symptomReporter;
          }

          -[APSSymptomReporter reportSymptomToAutoBugCapture:subType:]( symptomReporter,  "reportSymptomToAutoBugCapture:subType:",  @"PerAppToken",  @"RemovedTokenIsUnexpectedlyValid");
        }

        unsigned __int8 v68 = -[APSUserCourier shouldDropPubSubMessageWithData:forTopic:]( self,  "shouldDropPubSubMessageWithData:forTopic:",  v161,  v41);
        BOOL v69 = v153 == 0LL;
        if (v153) {
          char v70 = 1;
        }
        else {
          char v70 = v51;
        }
        uint64_t v71 = 2LL;
        if (v153) {
          uint64_t v71 = 11LL;
        }
        v160 = v41;
        if ((v70 & 1) != 0)
        {
          uint64_t v131 = v71;
          v132 = 0LL;
          __int128 v72 = 0LL;
LABEL_88:
          uint64_t v73 = v155;
LABEL_129:
          v134 = v72;
          id v94 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v73));
          id v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[APSIncomingMessage priority](v72, "priority")));
          id v11 = v164;
          id v97 = (void *)objc_claimAutoreleasedReturnValue([v164 serverHostname]);
          v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v97));

          v98 = (void *)objc_claimAutoreleasedReturnValue([v164 serverIPAddress]);
          v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v98));

          v149 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier getConnectionTypeFromProtocolConnection:]( v165,  "getConnectionTypeFromProtocolConnection:",  v164));
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v69));
          id v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v164 linkQuality]));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v149,  @"ConnectionType");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v99,  @"IsDropped");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v100,  @"LinkQuality");
          v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v129));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v101,  @"FilterList");

          objc_super v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v142 & 3) != 0));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v102,  @"StorageFlag");

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v95,  @"MessageIdentifier");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v96,  @"Priority");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v128,  @"ServerHostname");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v127,  @"ServerIP");
          -[NSMutableDictionary setObject:forKeyedSubscript:](v94, "setObject:forKeyedSubscript:", v160, @"Topic");
          v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v162 length]));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v94, "setObject:forKeyedSubscript:", v103, @"Size");

          v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v130));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v104,  @"IsWakingMessage");

          if (v156) {
            __int16 v105 = v156;
          }
          else {
            __int16 v105 = &off_10012B4A0;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v94,  "setObject:forKeyedSubscript:",  v105,  @"PushType");
          APSPowerLog(@"Message Received", v94);

          uint64_t v106 = v155;
          self = v165;

          v150 = 0LL;
          v154 = 0LL;
          unint64_t v107 = a5;
          uint64_t v19 = v152;
          id v108 = v135;
LABEL_133:

          v170[0] = _NSConcreteStackBlock;
          v170[1] = 3221225472LL;
          v170[2] = sub_100033550;
          v170[3] = &unk_10011EA58;
          v170[4] = self;
          uint64_t v174 = v131;
          id v109 = v108;
          id v171 = v109;
          uint64_t v175 = v106;
          id v172 = v11;
          unint64_t v176 = v107;
          v110 = self;
          v111 = v134;
          v173 = v111;
          v112 = objc_retainBlock(v170);
          v113 = v112;
          if (v111)
          {
            v114 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier updateChannelForIncomingMessageWithData:forTopic:]( self,  "updateChannelForIncomingMessageWithData:forTopic:",  v161,  v160));
            -[APSIncomingMessage setChannelID:](v111, "setChannelID:", v114);
            v166[0] = _NSConcreteStackBlock;
            v166[1] = 3221225472LL;
            v166[2] = sub_1000337F0;
            v166[3] = &unk_10011EA80;
            id v169 = v113;
            v115 = v111;
            v167 = v115;
            v168 = self;
            v116 = objc_retainBlock(v166);
            id v117 = sub_10009D754();
            v118 = (void *)objc_claimAutoreleasedReturnValue(v117);

            if (v118)
            {
              v119 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
              [v119 storeIncomingMessage:v115 environment:v110->_environment completionBlock:v116];
            }

            else
            {
              __int16 v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
              v119 = (void *)objc_claimAutoreleasedReturnValue([v120 UUIDString]);

              uint64_t v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v179 = v165;
                __int16 v180 = 2112;
                *(void *)v181 = v119;
                _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "%@: Calling completion block for incoming message %@",  buf,  0x16u);
              }

              ((void (*)(void *, void *))v116[2])(v116, v119);
            }

            unsigned int v26 = v140;
            id v10 = v141;

            id v11 = v164;
            uint64_t v19 = v152;
          }

          else
          {
            ((void (*)(void *))v112[2])(v112);
            unsigned int v26 = v140;
            id v10 = v141;
          }

          double v14 = v139;
          id v16 = v145;
          __int128 v32 = v163;
          goto LABEL_142;
        }

        if (v52)
        {
          id v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_1000BD3B0();
          }

          uint64_t v73 = v155;
          if (v161)
          {
            __int128 v75 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier updateChannelForIncomingMessageWithData:forTopic:]( self,  "updateChannelForIncomingMessageWithData:forTopic:",  v161,  v41));
            __int128 v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v179 = self;
              __int16 v180 = 2112;
              *(void *)v181 = v75;
              _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "%@: Updated checkpoint on channel %@ for ignored message.",  buf,  0x16u);
            }
          }

          __int128 v72 = 0LL;
          v132 = 0LL;
          BOOL v69 = 1LL;
          uint64_t v77 = 7LL;
        }

        else
        {
          if ((v68 & 1) != 0)
          {
            __int128 v72 = 0LL;
            BOOL v69 = 1LL;
            uint64_t v131 = 7LL;
            v132 = 0LL;
            goto LABEL_88;
          }

          -[APSPushHistory receivedPushWithTopic:token:payload:timestamp:]( self->_pushHistory,  "receivedPushWithTopic:token:payload:timestamp:",  v41,  v12,  v162,  v159);
          id v78 = -[APSUserCourier _copyParsedPayload:](self, "_copyParsedPayload:", v162);
          __int128 v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courierOversized](&OBJC_CLASS___APSLog, "courierOversized"));
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            id v80 = sub_100085CF4(v78, v41);
            uint64_t v81 = objc_claimAutoreleasedReturnValue(v80);
            uint64_t v82 = v12;
            __int128 v83 = (void *)v81;
            *(_DWORD *)buf = 138413826;
            __int128 v84 = @"NO";
            v179 = self;
            if (v47) {
              __int128 v85 = @"YES";
            }
            else {
              __int128 v85 = @"NO";
            }
            __int16 v180 = 2112;
            *(void *)v181 = v41;
            if (v148) {
              __int128 v84 = @"YES";
            }
            *(_WORD *)&v181[8] = 2112;
            uint64_t v182 = (uint64_t)v11;
            __int16 v183 = 2112;
            uint64_t v184 = v81;
            __int16 v185 = 2112;
            v186 = v158;
            __int16 v187 = 2112;
            v188 = v85;
            __int16 v189 = 2112;
            v190 = v84;
            _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "%@: Received message for enabled topic '%@' onInterface: %@ with payload '%@' with priority %@ for device token: %@ isProxyMessage: %@",  buf,  0x48u);

            uint64_t v12 = v82;
          }

          if (v78)
          {
            v132 = v78;
            id v86 = -[APSIncomingMessage initWithTopic:userInfo:]( objc_alloc(&OBJC_CLASS___APSIncomingMessage),  "initWithTopic:userInfo:",  v41,  v78);
            uint64_t v73 = v155;
            -[APSIncomingMessage setIdentifier:](v86, "setIdentifier:", v155);
            -[APSIncomingMessage setFromStorage:](v86, "setFromStorage:", v142 & 1);
            -[APSIncomingMessage setLastMessageFromStorage:](v86, "setLastMessageFromStorage:", (v142 >> 1) & 1);
            -[APSIncomingMessage setCorrelationIdentifier:](v86, "setCorrelationIdentifier:", v144);
            -[APSIncomingMessage setTracingEnabled:]( v86,  "setTracingEnabled:",  ((unint64_t)[v157 unsignedLongValue] >> 1) & 1);
            -[APSIncomingMessage setTracingUUID:](v86, "setTracingUUID:", v147);
            -[APSIncomingMessage setExpirationDate:](v86, "setExpirationDate:", v143);
            __int128 v87 = v11;
            __int128 v72 = v86;
            -[APSIncomingMessage setIncomingInterface:]( v86,  "setIncomingInterface:",  sub_10006F7E0((uint64_t)[v87 connectionType]));
            if ((v142 & 2) != 0)
            {
              --self->_usersPotentiallyWithMessages;
              __int128 v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                int64_t usersPotentiallyWithMessages = self->_usersPotentiallyWithMessages;
                *(_DWORD *)buf = 138412802;
                v179 = self;
                __int16 v180 = 1024;
                *(_DWORD *)v181 = usersPotentiallyWithMessages;
                *(_WORD *)&v181[4] = 1024;
                *(_DWORD *)&v181[6] = v142;
                _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "%@: Received LastFromStorage flag in message, users potentially with messages = %d, flags = 0x%02x",  buf,  0x18u);
              }

              if (!self->_usersPotentiallyWithMessages) {
                -[APSNoOpPowerAssertion clear](self->_waitForStoredMessagesToArrivePowerAssertion, "clear");
              }
            }

            -[APSIncomingMessage setTimestamp:](v86, "setTimestamp:", v146);
            -[APSIncomingMessage setToken:](v86, "setToken:", v145);
            -[APSIncomingMessage setPerAppToken:](v86, "setPerAppToken:", v12);
            if (v156) {
              uint64_t v90 = [v156 unsignedShortValue];
            }
            else {
              uint64_t v90 = 0LL;
            }
            -[APSIncomingMessage setPushType:](v86, "setPushType:", v90);
            if (v158) {
              -[APSIncomingMessage setPriority:](v86, "setPriority:", [v158 unsignedIntegerValue]);
            }
            -[APSIncomingMessage setPushFlags:](v86, "setPushFlags:", 0LL);
            if (v133) {
              -[APSIncomingMessage setPushFlags:]( v86,  "setPushFlags:",  -[APSIncomingMessage pushFlags](v86, "pushFlags") | 1);
            }
            id v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog PUSHTRACE](&OBJC_CLASS___APSLog, "PUSHTRACE"));
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v179 = self;
              __int16 v180 = 2112;
              *(void *)v181 = v147;
              _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "%@: Push has been read from stream and parsed. UUID: %@",  buf,  0x16u);
            }

            -[APSUserCourier _triggerAutoBugCaptureIfMessageIsRetried:]( self,  "_triggerAutoBugCaptureIfMessageIsRetried:",  v86);
            BOOL v69 = 0LL;
            uint64_t v131 = 0LL;
            goto LABEL_129;
          }

          id v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          uint64_t v73 = v155;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT)) {
            sub_1000BD410();
          }

          BOOL v69 = 0LL;
          __int128 v72 = 0LL;
          v132 = 0LL;
          uint64_t v77 = 3LL;
        }

        uint64_t v131 = v77;
        goto LABEL_129;
      }

      __int16 v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v179 = self;
        __int16 v180 = 2112;
        *(void *)v181 = v12;
        *(_WORD *)&v181[8] = 2112;
        uint64_t v182 = (uint64_t)v41;
        __int16 v183 = 2112;
        uint64_t v184 = (uint64_t)v159;
        _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "%@ Received duplicate push for token %@ and topic %@ - message timestamp %@",  buf,  0x2Au);
      }

      goto LABEL_60;
    }

    if (-[APSPushHistory hasPayload:forTopic:tokens:](pushHistory, "hasPayload:forTopic:tokens:", v162, v41, v163))
    {
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v179 = self;
        __int16 v180 = 2112;
        *(void *)v181 = v12;
        *(_WORD *)&v181[8] = 2112;
        uint64_t v182 = (uint64_t)v41;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v50,  OS_LOG_TYPE_DEFAULT,  "%@ Received duplicate push for per-app token %@ and topic %@. We already received a message with this payload hash for the device token.",  buf,  0x20u);
      }

- (id)_copyParsedPayload:(id)a3
{
  id v3 = a3;
  id v4 = objc_autoreleasePoolPush();
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  v18,  0LL));
  if (v5)
  {
    id v7 = 0LL;
    uint64_t v8 = (void *)v5;
  }

  else
  {
    id v17 = 0LL;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v3,  0LL,  &v17));
    id v7 = v17;
    if (!v9)
    {
      uint64_t v8 = 0LL;
      goto LABEL_8;
    }

    uint64_t v8 = (void *)v9;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
LABEL_8:
    if (!v7) {
      goto LABEL_16;
    }

    for (i = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          ;
          -[NSMutableString appendString:](i, "appendString:", @"; "))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      -[NSMutableString appendString:](i, "appendString:", v12);

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 objectForKey:NSUnderlyingErrorKey]);

      if (!v14) {
        break;
      }
      id v7 = (id)v14;
    }

    id v7 = 0LL;
    uint64_t v8 = 0LL;
    if (!i) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  i = (NSMutableString *)@"Top level object was not a dictionary";
LABEL_13:
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000BD590();
  }

  uint64_t v8 = 0LL;
LABEL_16:
  objc_autoreleasePoolPop(v4);

  return v8;
}

- (void)_handleOutgoingMessageAcknowledgment:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"APSProtocolAckTimestampKey"]);
  id v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"APSProtocolDeliveryStatus"]);
  id v11 = [v10 integerValue];

  switch((unint64_t)v11)
  {
    case 0uLL:
      uint64_t v12 = @"Message acknowledged by server";
      uint64_t v13 = 0LL;
      break;
    case 1uLL:
      uint64_t v12 = @"Server is busy";
      goto LABEL_7;
    case 3uLL:
      uint64_t v12 = @"Server rejected message as invalid";
      uint64_t v13 = 2LL;
      break;
    case 5uLL:
      uint64_t v12 = @"Server is undergoing maintenance";
LABEL_7:
      uint64_t v13 = 6LL;
      break;
    default:
      uint64_t v12 = @"Server rejected message (%ld)";
      uint64_t v13 = 1LL;
      break;
  }

  uint64_t v14 = APSError(v13, v12);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v22 = self;
    __int16 v23 = 2048;
    id v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: Received ack for outgoing message with delivery status %ld",  buf,  0x16u);
  }

  outgoingMessageQueue = self->_outgoingMessageQueue;
  id v18 = [v6 linkQuality];
  id v19 = [v6 connectionType];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  -[APSOutgoingMessageQueue handleAcknowledgmentForOutgoingMessageWithResult:ackTimestamp:linkQuality:connectionType:onInterface:]( outgoingMessageQueue,  "handleAcknowledgmentForOutgoingMessageWithResult:ackTimestamp:linkQuality:connectionType:onInterface:",  v15,  v9,  v18,  v19,  v20);
}

- (void)handleDisconnectForInterface:(id)a3 connectionState:(int64_t)a4 withReason:(unsigned int)a5
{
  id v7 = (APSProxyClient *)a3;
  -[APSUserCourier _removePendingRequestsForProtocolConnection:]( self,  "_removePendingRequestsForProtocolConnection:",  v7);
  -[APSUserCourier markProtocolConnectionDisconnectedForActivityTracking:]( self,  "markProtocolConnectionDisconnectedForActivityTracking:",  v7);
  -[APSUserCourier _reportAPSConnectivity](self, "_reportAPSConnectivity");
  if (self->_proxyClientWithOutstandingPresence)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
      *(_DWORD *)buf = 138412546;
      double v48 = self;
      __int16 v49 = 2112;
      __int16 v50 = proxyClientWithOutstandingPresence;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ clearing pending proxy presence for client %@ if necessary.",  buf,  0x16u);
    }

    uint64_t v10 = self->_proxyClientWithOutstandingPresence;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
    unint64_t v12 = -[APSProxyClient stateOnInterface:](v10, "stateOnInterface:", v11);

    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = self->_proxyClientWithOutstandingPresence;
        *(_DWORD *)buf = 138413058;
        double v48 = self;
        __int16 v49 = 2112;
        __int16 v50 = v14;
        __int16 v51 = 2048;
        unint64_t v52 = v12;
        __int16 v53 = 2112;
        uint64_t v54 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ client %@ has state %lu onInterface %@",  buf,  0x2Au);
      }

      -[APSUserCourier _clearPendingProxyPresence](self, "_clearPendingProxyPresence");
    }
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  BOOL v15 = self->_proxyClients;
  id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_proxyClients,  "objectForKey:",  *(void *)(*((void *)&v42 + 1) + 8LL * (void)i)));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
        [v20 setState:0 onInterface:v21];

        int v22 = self->_proxyClientWithOutstandingPresence;
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
        -[APSProxyClient setFilterMode:onInterface:](v22, "setFilterMode:onInterface:", 0LL, v23);
      }

      id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
    }

    while (v17);
  }

  -[APSUserCourier _adjustIsConnectedToService](self, "_adjustIsConnectedToService");
  if ((unint64_t)(a4 - 1) <= 1) {
    -[APSUserCourier _disconnectTokenWithReason:onProtocolConnection:]( self,  "_disconnectTokenWithReason:onProtocolConnection:",  a5,  v7);
  }
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
  uint32_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
  unsigned int v26 = [v24 hasUnAckedVersionOn:v25];

  if (v26)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100034234;
    v39[3] = &unk_10011E7F8;
    uint64_t v40 = v7;
    id v41 = self;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v39);
  }

  unsigned __int8 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v48 = self;
    __int16 v49 = 2112;
    __int16 v50 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@ clearing tracking of protocol connection %@",  buf,  0x16u);
  }

  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionByIdentifier](self, "protocolConnectionByIdentifier"));
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
  [v28 setObject:0 forKeyedSubscript:v29];

  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
  char v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
  [v30 setObject:0 forKeyedSubscript:v31];

  if (a4 == 2)
  {
    if (-[APSProxyClient connectionType](v7, "connectionType") == (id)2)
    {
      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v48 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ Removing all pending messages due to a proxy disconnect.",  buf,  0xCu);
      }

      -[APSOutgoingMessageQueue transferOwnershipOfPendingMessagesToHandler:]( self->_outgoingMessageQueue,  "transferOwnershipOfPendingMessagesToHandler:",  &stru_10011EAC0);
    }

    else
    {
      outgoingMessageQueue = self->_outgoingMessageQueue;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
      -[APSOutgoingMessageQueue handleConnectionClosedOnInterface:]( outgoingMessageQueue,  "handleConnectionClosedOnInterface:",  v34);
    }

    if (-[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface"))
    {
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v48 = self;
        __int16 v49 = 2112;
        __int16 v50 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@ Resending any pending messages that had been sent over our now dead interface %@",  buf,  0x16u);
      }

      -[APSUserCourier _sendQueuedOutgoingMessages](self, "_sendQueuedOutgoingMessages");
    }

    tokenRequestQueue = self->_tokenRequestQueue;
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[APSProxyClient identifier](v7, "identifier"));
    -[APSOutgoingQueue handleConnectionClosedOnInterface:](tokenRequestQueue, "handleConnectionClosedOnInterface:", v37);
  }

  -[APSUserCourier logStateWithReason:](self, "logStateWithReason:", 0LL);
  -[APSUserCourier _processShouldUseInternetChangeIfNecessary](self, "_processShouldUseInternetChangeIfNecessary");
}

- (void)_didFinishAssertingAllPresences:(id)a3
{
  id v4 = a3;
  [v4 noteConnected];
  -[APSUserCourier _reportAPSConnectivity](self, "_reportAPSConnectivity");
  outgoingMessageQueue = self->_outgoingMessageQueue;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[APSOutgoingMessageQueue handleConnectionOpenedOnInterface:]( outgoingMessageQueue,  "handleConnectionOpenedOnInterface:",  v6);

  -[APSOutgoingQueue handleConnectionOpened](self->_tokenRequestQueue, "handleConnectionOpened");
  id v7 = self->_topicManager;
  LODWORD(v6) = -[APSTopicManager pendingServerUpdate](v7, "pendingServerUpdate");
  -[APSUserCourier _sendFilterMessageOnProtocolConnection:withReason:]( self,  "_sendFilterMessageOnProtocolConnection:withReason:",  v4,  0LL);
  if ((_DWORD)v6)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: There was a pending update, should send filter on all interfaces",  buf,  0xCu);
    }

    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    BOOL v15 = sub_1000345EC;
    id v16 = &unk_10011E7F8;
    id v17 = v4;
    uint64_t v18 = self;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", &v13);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken", v13, v14, v15, v16));
  -[APSUserCourier _sendPubsubConnectMessageOnProtocolConnection:token:]( self,  "_sendPubsubConnectMessageOnProtocolConnection:token:",  v4,  v9);

  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Sending presence tracking message following connect.",  buf,  0xCu);
  }

  -[APSUserCourier sendPresenceTrackingRequestOnProtocolConnection:]( self,  "sendPresenceTrackingRequestOnProtocolConnection:",  v4);
  -[APSUserCourier _adjustIsConnectedToService](self, "_adjustIsConnectedToService");
  -[APSUserCourier _sendQueuedOutgoingMessages](self, "_sendQueuedOutgoingMessages");
  [v4 connectionSetupComplete];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    cachedPublicToken = self->_cachedPublicToken;
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = (APSUserCourier *)cachedPublicToken;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Done asserting all presences. systemToken is: %@",  buf,  0xCu);
  }
}

- (void)_sendPresenceMessageOnProtocolConnection:(id)a3 serverTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  unsigned int v10 = [v9 isDefaultUser];

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    id v14 = [v8 length];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescription]);
    courierUser = self->_courierUser;
    *(_DWORD *)buf = 138413570;
    char v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v13;
    __int16 v34 = 2048;
    id v35 = v14;
    __int16 v36 = 2112;
    __int128 v37 = v15;
    __int16 v38 = 2114;
    id v39 = v6;
    __int16 v40 = 2112;
    id v41 = courierUser;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ Sending presence message for %@ with token [length = %lu, token = %@] on interface: %{public}@ user: %@",  buf,  0x3Eu);
  }

  int v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  id v24 = sub_100034884;
  uint32_t v25 = &unk_10011EAE8;
  unsigned int v26 = self;
  id v17 = v6;
  id v27 = v17;
  id v28 = v8;
  LOBYTE(v29) = v10;
  id v18 = v8;
  id v19 = objc_retainBlock(&v22);
  uint64_t v20 = v19;
  if (v10)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier stateForProtocolConnection:]( self,  "stateForProtocolConnection:",  v17,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29));
    [v21 setUserState:2];

    -[APSUserCourier refreshCertNonceAndSignatureWithServerTime:withCompletion:]( self,  "refreshCertNonceAndSignatureWithServerTime:withCompletion:",  v7,  v20);
  }

  else
  {
    ((void (*)(void ***, uint64_t))v19[2])(v19, 1LL);
  }
}

- (void)_requestToSendFilterOnTopicManager:(id)a3 change:(id)a4
{
  id v5 = a4;
  -[APSUserCourier _logTopics](self, "_logTopics");
  if (-[APSUserCourier shouldOnlySendFilterOnPreferredInterface](self, "shouldOnlySendFilterOnPreferredInterface"))
  {
    [v5 setReason:3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
    -[APSUserCourier _sendFilterMessageOnProtocolConnection:withChange:]( self,  "_sendFilterMessageOnProtocolConnection:withChange:",  v6,  v5);
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100034CBC;
    v7[3] = &unk_10011E7F8;
    id v8 = v5;
    id v9 = self;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v7);
  }
}

- (id)_topicsByHashFromTopicStateDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v15));
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topicName]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = -[NSMutableDictionary copy](v4, "copy");
  return v13;
}

- (id)_ultraConstrainedTopicsFromTopicDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v10);
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier topicManager](self, "topicManager", (void)v18));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
        unsigned int v14 = [v12 hasUltraConstrainedPermissionForTopic:v13];

        if (v14)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, v11);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  id v16 = -[NSMutableDictionary copy](v5, "copy");
  return v16;
}

- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___APSFilterChange);
  -[APSFilterChange setReason:](v7, "setReason:", a4);
  -[APSUserCourier _sendFilterMessageOnProtocolConnection:withChange:]( self,  "_sendFilterMessageOnProtocolConnection:withChange:",  v6,  v7);
}

- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier topicManager](self, "topicManager"));

  if (v8)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier topicManager](self, "topicManager"));
      unsigned int v11 = [v10 hasListeningTopics];

      if (v11)
      {
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier topicManager](self, "topicManager"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000352DC;
        v15[3] = &unk_10011EB10;
        v15[4] = self;
        id v16 = v6;
        id v17 = v7;
        id v9 = v9;
        id v18 = v9;
        [v12 performFilterBlock:v15];
      }

      else
      {
        unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v20 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ asked to send filter but we have no listening topics!",  buf,  0xCu);
        }

        -[APSUserCourier _processShouldRunChangeIfNecessary](self, "_processShouldRunChangeIfNecessary");
      }
    }

    else
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int128 v20 = self;
        __int16 v21 = 2080;
        int v22 = "-[APSUserCourier _sendFilterMessageOnProtocolConnection:withChange:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ %s called with an empty token",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v20 = (APSUserCourier *)"-[APSUserCourier _sendFilterMessageOnProtocolConnection:withChange:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%s called with a null topic manager",  buf,  0xCu);
    }
  }
}

- (void)_disconnectTokenWithReason:(unsigned int)a3 onProtocolConnection:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
    *(_DWORD *)buf = 138412802;
    __int128 v20 = self;
    __int16 v21 = 2112;
    int v22 = v8;
    __int16 v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Disconnect token %@ with reason %u",  buf,  0x1Cu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v6));
  uint64_t v10 = v9;
  if (self->_isConnectedToService)
  {
    if (![v9 userState])
    {
      [v10 setUserState:4];
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      [v11 clearInfoFor:v12];

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
        *(_DWORD *)buf = 138412802;
        __int128 v20 = self;
        __int16 v21 = 2112;
        int v22 = v14;
        __int16 v23 = 2112;
        id v24 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Sending disconnect message for user %@ with token '%@'",  buf,  0x20u);
      }

      -[APSUserCourier setDisconnectReason:](self, "setDisconnectReason:", v4);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100035C20;
      v17[3] = &unk_10011E7D0;
      v17[4] = self;
      id v18 = v6;
      [v18 sendConnectMessageWithToken:v16 state:2 presenceFlags:0 hwVersion:0 swVersion:0 swBuild:0 certificates:0 nonce:0 signature:0 withCompletion:v17];
    }
  }

  else
  {
    -[APSUserCourier _finishDisconnectForInterface:](self, "_finishDisconnectForInterface:", v6);
  }
}

- (void)_finishDisconnectForInterface:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v4));
  [v5 setUserState:3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier filterVersionStateMachine](self, "filterVersionStateMachine"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v6 clearInfoFor:v7];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      unint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) handleConnectionStatusChanged:0];
        unint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v10);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemUser systemUserWithUserID:](&OBJC_CLASS___APSSystemUser, "systemUserWithUserID:", v13));

  if ([v14 isGuestUser] && objc_msgSend(v14, "isLoggedOut"))
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
      *(_DWORD *)buf = 138412546;
      int v22 = self;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: Removing obsolete token for logged out guest user %@",  buf,  0x16u);
    }

    -[APSUserCourier setPublicToken:fromServer:](self, "setPublicToken:fromServer:", 0LL, 1LL);
  }
}

- (void)_sendActiveStateMessageWithSendAllBlueListMessages:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Sending active interval message with send all messages '%@'",  buf,  0x16u);
  }

  if (v3) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = 10;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100035F84;
  v8[3] = &unk_10011EA30;
  int v9 = v7;
  -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v8);
}

- (void)_sendOutgoingMessage:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
  }
  id v10 = v9;
  topicHasher = self->_topicHasher;
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](topicHasher, "topicHashForTopic:user:", v12, v13));

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  if ([v15 isDefaultUser])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___APSProxyClient, v17);
    char isKindOfClass = objc_opt_isKindOfClass(v16, v18);

    if ((isKindOfClass & 1) == 0)
    {
      __int128 v20 = 0LL;
      goto LABEL_12;
    }
  }

  else
  {
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 publicToken]);
  __int16 v23 = v22;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  }
  __int128 v20 = v24;

LABEL_12:
  if (!-[APSUserCourier protocolConnectionHasSentActivityTrackingSalt:]( self,  "protocolConnectionHasSentActivityTrackingSalt:",  v10))
  {
    uint32_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = self;
      __int16 v58 = 2112;
      id v59 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@ Sending activity tracking salt on %@ because we havne't sent it yet",  buf,  0x16u);
    }

    -[APSUserCourier sendPresenceTrackingRequestOnProtocolConnection:]( self,  "sendPresenceTrackingRequestOnProtocolConnection:",  v10);
  }

  if (_os_feature_enabled_impl("APS", "EmperorPenguin"))
  {
    topicManager = self->_topicManager;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
    BOOL v28 = -[APSTopicManager hasUltraConstrainedPermissionForTopic:]( topicManager,  "hasUltraConstrainedPermissionForTopic:",  v27);
  }

  else
  {
    BOOL v28 = 0LL;
  }

  outgoingMessageQueue = self->_outgoingMessageQueue;
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  char v31 = (void *)objc_claimAutoreleasedReturnValue( -[APSOutgoingMessageQueue lastReversePushRTTMillisecondsOnInterface:]( outgoingMessageQueue,  "lastReversePushRTTMillisecondsOnInterface:",  v30));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  void v51[2] = sub_100036500;
  v51[3] = &unk_10011EB38;
  v51[4] = self;
  id v32 = v6;
  id v52 = v32;
  id v33 = v10;
  id v53 = v33;
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 sendMessage:v32 topicHash:v14 lastRTT:v31 token:v20 ultraConstrainedAllowed:v28 withCompletion:v51]);

  if (v34)
  {
    if ([v34 code] == (id)2) {
      -[APSOutgoingMessageQueue handleErrorSendingOutgoingMessage:error:]( self->_outgoingMessageQueue,  "handleErrorSendingOutgoingMessage:error:",  v32,  v34);
    }
  }

  else
  {
    id v35 = self->_outgoingMessageQueue;
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v33 identifier]);
    -[APSOutgoingMessageQueue handleSentOutgoingMessage:onInterface:]( v35,  "handleSentOutgoingMessage:onInterface:",  v32,  v36);

    double v48 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier getConnectionTypeFromProtocolConnection:]( self,  "getConnectionTypeFromProtocolConnection:",  v33));
    __int16 v49 = v20;
    v55[0] = v48;
    v54[0] = @"ConnectionType";
    v54[1] = @"ServerHostname";
    unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v33 serverHostname]);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v47));
    v55[1] = v46;
    void v54[2] = @"ServerIP";
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v33 serverIPAddress]);
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v45));
    void v55[2] = v44;
    v54[3] = @"LinkQuality";
    __int16 v50 = v8;
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v33 linkQuality]));
    v55[3] = v37;
    v54[4] = @"MessageIdentifier";
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v32 identifier]));
    v55[4] = v38;
    v54[5] = @"Topic";
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v32 topic]);
    v55[5] = v39;
    v54[6] = @"Priority";
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v32 priority]));
    v55[6] = v40;
    v54[7] = @"Size";
    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v32 payloadLength]));
    v55[7] = v41;
    __int128 v42 = v14;
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  8LL));

    id v8 = v50;
    __int128 v20 = v49;

    APSPowerLog(@"Message Sent", v43);
    unsigned int v14 = v42;
  }
}

- (void)_sendQueuedOutgoingMessages
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[APSOutgoingMessageQueue outgoingMessagesToSend]( self->_outgoingMessageQueue,  "outgoingMessagesToSend"));
  if ([v3 count])
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_courierUser, "name"));
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Sending queued messages for user %@",  buf,  0x16u);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v17 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 originator]);
          unsigned int v13 = [v12 isConnected];

          if (v13)
          {
            -[APSUserCourier _sendOutgoingMessage:onProtocolConnection:]( self,  "_sendOutgoingMessage:onProtocolConnection:",  v11,  0LL);
          }

          else
          {
            unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [v11 messageID];
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 originator]);
              *(_DWORD *)buf = 138412802;
              __int16 v23 = self;
              __int16 v24 = 2048;
              id v25 = v15;
              __int16 v26 = 2112;
              id v27 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Tried to send outgoing message %lu but it's not connected yet, {Originator:%@}",  buf,  0x20u);
            }
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }

      while (v8);
    }

    BOOL v3 = v17;
  }
}

- (APSUserCourierDelegate)delegate
{
  return (APSUserCourierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isConnectedToService
{
  return self->_isConnectedToService;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
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

- (NSDate)lastPresence
{
  return self->_lastPresence;
}

- (void)setLastPresence:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSMutableArray)connectionServers
{
  return self->_connectionServers;
}

- (void)setConnectionServers:(id)a3
{
}

- (NSString)ifname
{
  return self->_ifname;
}

- (NSString)latestGeoRegion
{
  return self->_latestGeoRegion;
}

- (NSNumber)currentMessageID
{
  return self->_currentMessageID;
}

- (void)setCurrentMessageID:(id)a3
{
}

- (NSMutableArray)subscriptionRequests
{
  return self->_subscriptionRequests;
}

- (void)setSubscriptionRequests:(id)a3
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

- (BOOL)hasFilterChanged
{
  return self->_hasFilterChanged;
}

- (void)setHasFilterChanged:(BOOL)a3
{
  self->_hasFilterChanged = a3;
}

- (BOOL)locallyDisabledFilterOptimization
{
  return self->_locallyDisabledFilterOptimization;
}

- (void)setLocallyDisabledFilterOptimization:(BOOL)a3
{
  self->_BOOL locallyDisabledFilterOptimization = a3;
}

- (BOOL)serverDisabledFilterOptimization
{
  return self->_serverDisabledFilterOptimization;
}

- (void)setServerDisabledFilterOptimization:(BOOL)a3
{
  self->_serverDisabledFilterOptimization = a3;
}

- (APSClientIdentityProvider)clientIdentityProvider
{
  return self->_clientIdentityProvider;
}

- (void)setClientIdentityProvider:(id)a3
{
}

- (APSSystemTokenStorage)systemTokenStorage
{
  return self->_systemTokenStorage;
}

- (void)setSystemTokenStorage:(id)a3
{
}

- (APSFilterVersionStateMachine)filterVersionStateMachine
{
  return self->_filterVersionStateMachine;
}

- (void)setFilterVersionStateMachine:(id)a3
{
}

- (APSDebugOverrides)debugOverrides
{
  return self->_debugOverrides;
}

- (void)setDebugOverrides:(id)a3
{
}

- (NSMutableDictionary)protocolConnectionByIdentifier
{
  return self->_protocolConnectionByIdentifier;
}

- (void)setProtocolConnectionByIdentifier:(id)a3
{
}

- (APSUser)courierUser
{
  return self->_courierUser;
}

- (void)setCourierUser:(id)a3
{
}

- (APSUserAppIDManager)userAppIDManager
{
  return self->_userAppIDManager;
}

- (void)setUserAppIDManager:(id)a3
{
}

- (NSMutableDictionary)stateByConnectionIdentifier
{
  return self->_stateByConnectionIdentifier;
}

- (void)setStateByConnectionIdentifier:(id)a3
{
}

- (APSProtocolConnectionEstablisher)protocolConnectionEstablisher
{
  return self->_protocolConnectionEstablisher;
}

- (void)setProtocolConnectionEstablisher:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

- (void)recalculateTrackActivityPresence
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Recalculating activity presence", buf, 0xCu);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(char **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v9 trackActivityPresence])
        {
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v23 = self;
            __int16 v24 = 2112;
            id v25 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Connection %@ requesting activity presence tracking",  buf,  0x16u);
          }

          BOOL v10 = 1;
          goto LABEL_15;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 0;
LABEL_15:

  if (self->_trackActivityPresence != v10)
  {
    self->_trackActivityPresence = v10;
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        unsigned int v13 = "enabled";
      }
      else {
        unsigned int v13 = "disabled";
      }
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
      *(_DWORD *)buf = 138412802;
      __int16 v23 = self;
      __int16 v24 = 2080;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Tracking activity presence is now %s for '%@'",  buf,  0x20u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100036F44;
    v17[3] = &unk_10011E758;
    v17[4] = self;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v17);
    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
      -[APSUserCourier sendPresenceTrackingRequestOnProtocolConnection:]( self,  "sendPresenceTrackingRequestOnProtocolConnection:",  v15);
    }

    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100036F7C;
      v16[3] = &unk_10011E758;
      void v16[4] = self;
      -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v16);
    }
  }

- (void)sendPresenceTrackingRequestOnProtocolConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
    unint64_t activityPresenceSalt = self->_activityPresenceSalt;
    if (!activityPresenceSalt)
    {
      -[APSUserCourier _generateSalt](self, "_generateSalt");
      unint64_t activityPresenceSalt = self->_activityPresenceSalt;
    }

    BOOL trackActivityPresence = self->_trackActivityPresence;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier protocolConnectionEstablisher](self, "protocolConnectionEstablisher"));
    unint64_t v9 = (unint64_t)[v8 serverTimeInNanoSeconds] / 0xF4240;

    uint64_t v10 = arc4random_uniform(0xFFFFFFFE) + 1;
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134218498;
      uint64_t v21 = v10;
      __int16 v22 = 2048;
      BOOL v23 = trackActivityPresence;
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending presence tracking request with ID:%lu and flag:%lu on interface %{public}@",  (uint8_t *)&v20,  0x20u);
    }

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v4));
    [v12 setTrackingState:1];

    [v4 sendActivityTrackingRequestWithMessageID:v10 pushToken:v5 salt:activityPresenceSalt trackingFlag:trackActivityPresence timestamp:v9];
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000BD650(v5, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)markProtocolConnectionDisconnectedForActivityTracking:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    [v7 setTrackingState:0];
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000BD684((os_log_s *)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (BOOL)protocolConnectionHasSentActivityTrackingSalt:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier stateByConnectionIdentifier](self, "stateByConnectionIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  BOOL v8 = [v7 trackingState] == (id)1;

  return v8;
}

- (void)attemptToRollSalt
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    uint64_t v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Attempting to roll activity presence salt. Self:%@",  (uint8_t *)&v20,  0xCu);
  }

  if (!-[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[APSConfiguration configurationForEnvironment:connectionType:]( APSConfiguration,  "configurationForEnvironment:connectionType:",  v5,  [v6 connectionType]));

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 minPresenceSaltRotationInterval]);
    id v8 = [v7 unsignedIntegerValue];

    uint64_t v9 = self->_lastActivityPresenceSaltRoll;
    if (v9)
    {
      uint64_t v10 = 60LL * (void)v8;
      if (!v8) {
        uint64_t v10 = 86400LL;
      }
      double v11 = (double)(unint64_t)v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v12 timeIntervalSinceDate:v9];
      double v14 = v13;

      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14 < v11)
      {
        if (v16)
        {
          int v20 = 134218240;
          uint64_t v21 = (APSUserCourier *)v14;
          __int16 v22 = 2048;
          unint64_t v23 = (unint64_t)v11;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "It has not been long enough since the last roll. Time:%lu -- Min Interval:%lu",  (uint8_t *)&v20,  0x16u);
        }

        goto LABEL_19;
      }

      if (v16)
      {
        int v20 = 134218240;
        uint64_t v21 = (APSUserCourier *)v14;
        __int16 v22 = 2048;
        unint64_t v23 = (unint64_t)v11;
        uint64_t v17 = "It has been long enough since our last roll. Time:%lu -- Min Interval:%lu";
        uint64_t v18 = v15;
        uint32_t v19 = 22;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
      }
    }

    else
    {
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        uint64_t v17 = "We don't have a last salt roll time--rolling";
        uint64_t v18 = v15;
        uint32_t v19 = 2;
        goto LABEL_14;
      }
    }

    -[APSUserCourier _generateSalt](self, "_generateSalt");
LABEL_19:

    goto LABEL_20;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Can not roll salt while courier is connected",  (uint8_t *)&v20,  2u);
  }

- (void)_generateSalt
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Generating new presence salt", buf, 2u);
  }

  arc4random_buf(&__buf, 8uLL);
  self->_unint64_t activityPresenceSalt = __buf;
  id v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  lastActivityPresenceSaltRoll = self->_lastActivityPresenceSaltRoll;
  self->_lastActivityPresenceSaltRoll = v4;
}

- (void)_handlePresenceTrackingResponse:(id)a3 onProtocolConnection:(id)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"APSProtocolPresenceActivityMessageIDKey"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"APSProtocolPresenceActivityPushTokenKey"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"APSProtocolPresenceActivityStatusKey"]);

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog activityTracking](&OBJC_CLASS___APSLog, "activityTracking"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    double v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received presence tracking response message for token %@.  Status: %@. MessageID: %@",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)_registerAppTokenCleanup
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registering for App Token Cleanup",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000381D0;
  handler[3] = &unk_10011EBA8;
  objc_copyWeak(&v5, buf);
  xpc_activity_register("com.apple.aps.activity.apptokencleanup", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)performAppTokenCleanup
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    *(_DWORD *)buf = 138412546;
    id v59 = self;
    __int16 v60 = 2112;
    uint64_t v61 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@:Performing app token cleanup at %@",  buf,  0x16u);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v52;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v5;
        id v6 = *(void **)(*((void *)&v51 + 1) + 8 * v5);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 enabledTopics]);
        id v8 = [v7 mutableCopy];

        int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 ignoredTopics]);
        id v10 = [v9 mutableCopy];
        [v8 addObjectsFromArray:v10];

        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 opportunisticTopics]);
        id v12 = [v11 mutableCopy];
        [v8 addObjectsFromArray:v12];

        __int128 v42 = v6;
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 nonWakingTopics]);
        id v14 = [v13 mutableCopy];
        [v8 addObjectsFromArray:v14];

        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v38 = v8;
        id v40 = [v38 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v40)
        {
          uint64_t v39 = *(void *)v48;
          do
          {
            uint64_t v15 = 0LL;
            do
            {
              if (*(void *)v48 != v39) {
                objc_enumerationMutation(v38);
              }
              uint64_t v41 = v15;
              uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * v15);
              tokenStore = self->_tokenStore;
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
              uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore tokenInfoArrayForTopic:user:]( tokenStore,  "tokenInfoArrayForTopic:user:",  v16,  v18));

              __int128 v45 = 0u;
              __int128 v46 = 0u;
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              id v20 = v19;
              id v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v44;
                do
                {
                  for (i = 0LL; i != v22; i = (char *)i + 1)
                  {
                    if (*(void *)v44 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    id v25 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
                    uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 expirationDate]);
                    if (v26)
                    {
                      id v27 = (void *)v26;
                      BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v25 expirationDate]);
                      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                      id v30 = [v28 compare:v29];

                      if (v30 == (id)-1LL)
                      {
                        char v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
                        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v59 = self;
                          __int16 v60 = 2112;
                          uint64_t v61 = v25;
                          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%@: Purging token for info %@",  buf,  0x16u);
                        }

                        id v32 = self->_tokenStore;
                        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
                        -[APSTokenStore setToken:forInfo:user:](v32, "setToken:forInfo:user:", 0LL, v25, v33);

                        -[APSUserCourier connection:didInvalidateTokenForInfo:]( self,  "connection:didInvalidateTokenForInfo:",  v42,  v25);
                      }
                    }
                  }

                  id v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
                }

                while (v22);
              }

              uint64_t v15 = v41 + 1;
            }

            while ((id)(v41 + 1) != v40);
            id v40 = [v38 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }

          while (v40);
        }

        uint64_t v5 = v37 + 1;
      }

      while ((id)(v37 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v36);
  }
}

- (void)saveToken:(id)a3 forInfo:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ Adding token %@ into keychain for %@, %@",  (uint8_t *)&v13,  0x2Au);
  }

  tokenStore = self->_tokenStore;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  -[APSTokenStore setToken:forInfo:user:](tokenStore, "setToken:forInfo:user:", v7, v8, v12);
}

- (void)connection:(id)a3 didRequestTokenForInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int128 v48 = self;
    __int16 v49 = 2112;
    id v50 = v6;
    __int16 v51 = 2112;
    id v52 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Received request from %@ to generate token for info %@",  buf,  0x20u);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  id v10 = [v9 length];

  if (v10)
  {
    tokenStore = self->_tokenStore;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    id v46 = 0LL;
    int v13 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore tokenForInfo:user:persistedInfo:]( tokenStore,  "tokenForInfo:user:persistedInfo:",  v7,  v12,  &v46));
    id v14 = v46;

    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
    [v7 setBaseToken:v15];

    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
      *(_DWORD *)buf = 138413314;
      __int128 v48 = self;
      __int16 v49 = 2112;
      id v50 = v17;
      __int16 v51 = 2112;
      id v52 = v13;
      __int16 v53 = 2112;
      id v54 = v7;
      __int16 v55 = 2112;
      id v56 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ found cached token for topic: %@, token: %@ for info %@ persisted info %@",  buf,  0x34u);
    }

    if (v13)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 baseToken]);
      if (v18)
      {
        __int16 v19 = (void *)v18;
        unsigned int v20 = [v14 isEqual:v7];

        if (v20)
        {
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            __int128 v48 = self;
            __int16 v49 = 2112;
            id v50 = v13;
            __int16 v51 = 2112;
            id v52 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ handleReceivedToken: %@ forInfo %@",  buf,  0x20u);
          }

          [v6 handleReceivedToken:v13 forInfo:v7];
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 baseToken]);

          if (!v22) {
            -[APSUserCourier saveToken:forInfo:connection:](self, "saveToken:forInfo:connection:", v13, v7, v6);
          }
          goto LABEL_24;
        }
      }

      if (v14)
      {
        uint64_t v23 = objc_claimAutoreleasedReturnValue([v14 baseToken]);
        if (v23)
        {
          __int16 v24 = (void *)v23;
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 baseToken]);
          unsigned __int8 v26 = [v25 isEqualToData:self->_cachedPublicToken];

          if ((v26 & 1) == 0)
          {
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              __int128 v48 = self;
              __int16 v49 = 2112;
              id v50 = v7;
              __int16 v51 = 2112;
              id v52 = v14;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "%@ Found persisted token info, but the system token didn't match! TokenInfo %@ persisted TokenInfo %@",  buf,  0x20u);
            }

            BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v48 = self;
              __int16 v49 = 2112;
              id v50 = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@ Requesting a new token for info %@",  buf,  0x16u);
            }
          }
        }
      }

      if ([v7 type]) {
        -[APSUserCourier connection:didInvalidateTokenForInfo:](self, "connection:didInvalidateTokenForInfo:", v6, v7);
      }
    }

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100038F4C;
    v42[3] = &unk_10011EBD0;
    id v29 = v7;
    id v43 = v29;
    __int128 v44 = self;
    id v30 = v6;
    id v45 = v30;
    char v31 = objc_retainBlock(v42);
    tokenRequestQueue = self->_tokenRequestQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100039064;
    v38[3] = &unk_10011EBF8;
    id v39 = v29;
    id v40 = self;
    id v41 = v30;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000395C0;
    v34[3] = &unk_10011EC20;
    v34[4] = self;
    id v35 = v39;
    id v37 = v31;
    id v36 = v41;
    id v33 = v31;
    -[APSOutgoingQueue enqueueSendBlock:completionBlock:]( tokenRequestQueue,  "enqueueSendBlock:completionBlock:",  v38,  v34);

LABEL_24:
  }
}

- (void)connection:(id)a3 didRequestCurrentTokenForInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unsigned int v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Received request from %@ to fetch current token for info %@",  buf,  0x20u);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  id v10 = [v9 length];

  if (v10)
  {
    tokenStore = self->_tokenStore;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    id v18 = 0LL;
    int v13 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore tokenForInfo:user:persistedInfo:]( tokenStore,  "tokenForInfo:user:persistedInfo:",  v7,  v12,  &v18));
    id v14 = v18;

    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
      *(_DWORD *)buf = 138413058;
      unsigned int v20 = self;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ found cached token for topic: %@, token: %@ for info %@",  buf,  0x2Au);
    }

    if (v13)
    {
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        unsigned int v20 = self;
        __int16 v21 = 2112;
        id v22 = v13;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@ handleReceivedToken: %@ forInfo %@",  buf,  0x20u);
      }

      [v6 handleReceivedToken:v13 forInfo:v14];
    }
  }
}

- (void)connection:(id)a3 didInvalidateTokenForInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ asked by %@ to invalidate extended app token for info %@",  (uint8_t *)&v25,  0x20u);
  }

  if (![v7 type])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier userAppIDManager](self, "userAppIDManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment name](self->_environment, "name"));
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    [v9 removeAppIdForEnvironmentName:v10 topic:v11 identifier:v12];
  }

  tokenStore = self->_tokenStore;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  -[APSTokenStore setToken:forInfo:user:](tokenStore, "setToken:forInfo:user:", 0LL, v7, v14);

  __int16 v15 = self->_tokenStore;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore tokensForTopic:user:error:](v15, "tokensForTopic:user:error:", v16, v17, 0LL));
  id v19 = [v18 count];

  unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (v21)
    {
      __int16 v23 = (APSUserCourier *)objc_claimAutoreleasedReturnValue([v7 topic]);
      int v25 = 138412290;
      id v26 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "No tokens use salt anymore. Clearing salt for topic %@",  (uint8_t *)&v25,  0xCu);
    }

    topicHasher = self->_topicHasher;
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 topic]);
    id v22 = (APSUserCourier *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    -[APSTopicHasher clearSaltForTopic:user:](topicHasher, "clearSaltForTopic:user:", v20, v22);
    goto LABEL_11;
  }

  if (v21)
  {
    id v22 = (APSUserCourier *)objc_claimAutoreleasedReturnValue([v7 topic]);
    int v25 = 138412290;
    id v26 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Still existing tokens for topic %@. Not clearing salt.",  (uint8_t *)&v25,  0xCu);
LABEL_11:
  }
}

- (id)connection:(id)a3 createURLTokenForToken:(id)a4
{
  id v5 = a4;
  id v6 = sub_100077B98(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier urlPrefix](self, "urlPrefix"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:v7]);
  id v10 = [[APSURLToken alloc] initWithTokenURL:v9 token:v5];

  return v10;
}

- (id)urlPrefix
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier preferredProtocolConnection](self, "preferredProtocolConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[APSConfiguration configurationForEnvironment:connectionType:]( APSConfiguration,  "configurationForEnvironment:connectionType:",  v3,  [v4 connectionType]));
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 urlTokenPrefix]);

  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    unsigned int v9 = [v8 isEqualToString:APSEnvironmentProduction];

    if (v9) {
      id v6 = @"https://web.push.apple.com/";
    }
    else {
      id v6 = @"https://web.sandbox.push.apple.com/";
    }
  }

  return v6;
}

- (void)_handleAppTokenGenerateResponse:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Received app token generate response %@",  (uint8_t *)&v11,  0x16u);
  }

  tokenRequestQueue = self->_tokenRequestQueue;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  -[APSOutgoingQueue handleResponseForPendingItem:error:onInterface:]( tokenRequestQueue,  "handleResponseForPendingItem:error:onInterface:",  v6,  0LL,  v10);
}

  ;
}

- (void)subscribeToChannels:(id)a3 forTopic:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v30 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        id v13 = objc_msgSend( objc_alloc((Class)CUTWeakLinkClass(@"PKPublicChannel", @"PushKit")),  "initWithDictionary:",  *(void *)(*((void *)&v31 + 1) + 8 * (void)i));
        [v13 setChannelTopic:v9];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
        [v13 setEnvironment:v15];

        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pubSubName]);
        [v13 setTokenName:v17];

        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Incoming pubsub subscription for %@",  buf,  0xCu);
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v13 channelID]);
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v13 environment]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 tokenName]);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( [v19 lookupChannelWithChannelID:v20 andPushTopic:v9 environment:v21 userName:v22]);

        if (v23)
        {
          v36[0] = @"channelID";
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 channelID]);
          v36[1] = @"reason";
          v37[0] = v24;
          v37[1] = &off_10012B710;
          int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));

          id v35 = v25;
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v35,  1LL));
          -[APSUserCourier sendFailuresToClient:pushTopic:](self, "sendFailuresToClient:pushTopic:", v26, v9);
        }

        else
        {
          [v19 storeChannel:v13];
          [v28 addObject:v13];
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }

    while (v11);
  }

  -[APSUserCourier _handlePubSubRequest:unsubscriptionChannels:token:]( self,  "_handlePubSubRequest:unsubscriptionChannels:token:",  v28,  0LL,  v27);
}

- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v25 = a5;
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v8;
  id v29 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v32;
    id v30 = v9;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        id v11 = objc_msgSend( objc_alloc((Class)CUTWeakLinkClass(@"PKPublicChannel", @"PushKit")),  "initWithDictionary:",  *(void *)(*((void *)&v31 + 1) + 8 * (void)i));
        [v11 setChannelTopic:v9];
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Incoming pubsub unsubscribe request for %@",  buf,  0xCu);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 channelID]);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pubSubName]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue( [v13 lookupChannelWithChannelID:v14 andPushTopic:v9 environment:v16 userName:v18]);

        if (v19)
        {
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v11 channelID]);
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pubSubName]);
          [v13 deleteChannelID:v20 forTopic:v30 environment:v22 userName:v24];

          [v27 addObject:v11];
        }

        id v9 = v30;
      }

      id v29 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v29);
  }

  -[APSUserCourier _handlePubSubRequest:unsubscriptionChannels:token:]( self,  "_handlePubSubRequest:unsubscriptionChannels:token:",  0LL,  v27,  v25);
}

- (void)_handlePubSubRequest:(id)a3 unsubscriptionChannels:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    id v24 = v9;
    id v26 = objc_msgSend(v8, "mutableCopy", v10);
    id v11 = self->_topicManager;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          topicHasher = self->_topicHasher;
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 channelTopic]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicHashForTopic:user:](topicHasher, "topicHashForTopic:user:", v18, v19));

          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicManager hasIgnoredTopicHash:](v11, "hasIgnoredTopicHash:", v20));
          if (v21) {
            [v26 removeObject:v16];
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v13);
    }

    id v22 = v26;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10009A5A4;
    v27[3] = &unk_100120198;
    v27[4] = self;
    id v28 = v22;
    id v9 = v24;
    id v29 = v24;
    id v10 = v23;
    id v30 = v23;
    id v8 = v22;
    -[APSUserCourier enumerateConnectedProtocolConnections:](self, "enumerateConnectedProtocolConnections:", v27);
  }
}

- (void)_retryRequestAfterDelay:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[APSConfiguration configurationForEnvironment:connectionType:]( APSConfiguration,  "configurationForEnvironment:connectionType:",  v5,  [v4 connectionType]));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 pubSubDefaultTimeout]);
  id v7 = [v6 unsignedIntegerValue];
  if (v7) {
    double v8 = (double)(unint64_t)v7;
  }
  else {
    double v8 = 30.0;
  }

  -[APSUserCourier _retryRequestAfterDelay:withDelay:](self, "_retryRequestAfterDelay:withDelay:", v4, v8);
}

- (void)_retryRequestAfterDelay:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    if (-[APSUserCourier hasConnectedInterfaceOfType:](self, "hasConnectedInterfaceOfType:", 2LL))
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device is in proxy mode, do not retry pubsub request",  buf,  2u);
      }
    }

    else if ([v6 retryCount])
    {
      objc_msgSend(v6, "setRetryCount:", (char *)objc_msgSend(v6, "retryCount") - 1);
      dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
      [v6 setTimeoutSource:v8];

      id v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 timeoutSource]);
      dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0LL);

      objc_initWeak((id *)buf, v6);
      objc_initWeak(&location, self);
      id v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 timeoutSource]);
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472LL;
      id v18 = sub_10009AB60;
      id v19 = &unk_1001201C0;
      objc_copyWeak(&v21, (id *)buf);
      objc_copyWeak(&v22, &location);
      id v12 = v6;
      id v20 = v12;
      dispatch_source_set_event_handler(v11, &v16);

      id v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeoutSource", v16, v17, v18, v19));
      dispatch_resume(v13);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PubSub request %@ has exceeded its retry limit.  Abandoning.",  buf,  0xCu);
      }

      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier subscriptionRequests](self, "subscriptionRequests"));
      [v15 removeObject:v6];
    }
  }
}

- (id)allRegisteredChannelsForTopic:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pubSubName]);
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 allRegisteredChannelsForTopic:v4 environment:v7 userName:v9]);

  return v10;
}

- (void)_sendPubsubConnectMessageOnProtocolConnection:(id)a3 token:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
  dispatch_source_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pubSubName]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 allRegisteredChannelsForEnvironment:v11 userName:v8]);

  if (v12 && [v12 count])
  {
    id v13 = objc_alloc(&OBJC_CLASS___APSPubSubRequest);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier _getNextMessageID](self, "_getNextMessageID"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 tokenName]);
    uint64_t v17 = -[APSPubSubRequest initWithSubscriptionChannels:unsubscriptionChannels:messageID:userName:token:subscriptionType:connectionType:retryCount:]( v13,  "initWithSubscriptionChannels:unsubscriptionChannels:messageID:userName:token:subscriptionType:connectionType:retryCount:",  v12,  0,  v14,  v16,  v6,  1,  [v23 connectionType],  3);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSPubSubRequest messageID](v17, "messageID"));
    id v19 = [v18 unsignedIntValue];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier subscriptionRequests](self, "subscriptionRequests"));
    if (!v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      -[APSUserCourier setSubscriptionRequests:](self, "setSubscriptionRequests:", v21);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier subscriptionRequests](self, "subscriptionRequests"));
    [v22 addObject:v17];

    -[APSUserCourier _writePubSubMessagetoConnection:messageID:token:connectionType:]( self,  "_writePubSubMessagetoConnection:messageID:token:connectionType:",  v17,  v19,  v6,  -[APSPubSubRequest connectionType](v17, "connectionType"));
    -[APSUserCourier _retryRequestAfterDelay:](self, "_retryRequestAfterDelay:", v17);
  }
}

- (void)_writePubSubMessagetoConnection:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);

  if (v13)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009B088;
    v14[3] = &unk_1001201E8;
    id v15 = v10;
    id v16 = self;
    int64_t v19 = a6;
    id v17 = v12;
    id v18 = v11;
    unsigned int v20 = a4;
    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( self,  "enumerateConnectedProtocolConnectionsOfType:block:",  a6,  v14);
  }
}

- (void)_removePendingRequestsForProtocolConnection:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier subscriptionRequests](self, "subscriptionRequests", 0LL));
  id v6 = [v5 mutableCopy];

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
        if (v4)
        {
          id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          id v12 = [v11 connectionType];
          if (v12 == [v4 connectionType])
          {
            -[APSUserCourier _cancelRequest:](self, "_cancelRequest:", v11);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier subscriptionRequests](self, "subscriptionRequests"));
            [v13 removeObject:v11];
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)_handlePubSubSubscriptionResponse:(id)a3 fromAgent:(BOOL)a4 onProtocolConnection:(id)a5
{
  id v7 = a3;
  id v62 = a5;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolPubSubToken"]);
  __int16 v64 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolPubSubTimeout"]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolPubSubStatus"]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolPubSubMessageID"]);
  unsigned __int8 v63 = v7;
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"APSProtocolPubSubPayload"]);
  unsigned __int8 v68 = (void *)v10;
  __int16 v65 = (void *)v9;
  uint64_t v66 = (void *)v8;
  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v9 != 0)
  {
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier subscriptionRequests](self, "subscriptionRequests"));
    __int128 v15 = (os_log_s *)[v14 countByEnumeratingWithState:&v85 objects:v101 count:16];
    __int128 v16 = v15;
    if (v15)
    {
      uint64_t v17 = *(void *)v86;
      while (2)
      {
        id v18 = 0LL;
        do
        {
          if (*(void *)v86 != v17) {
            objc_enumerationMutation(v14);
          }
          int64_t v19 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)v18);
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 messageID]);
          unsigned int v21 = [v20 isEqualToNumber:v68];

          if (v21)
          {
            __int128 v16 = v19;
            goto LABEL_21;
          }

          id v18 = (os_log_s *)((char *)v18 + 1);
        }

        while (v16 != v18);
        __int128 v16 = (os_log_s *)[v14 countByEnumeratingWithState:&v85 objects:v101 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

- (BOOL)_isResponseForProxyDevice:(id)a3
{
  uint64_t v10 = 0LL;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009BEA8;
  v6[3] = &unk_100120210;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  uint64_t v9 = &v10;
  -[APSUserCourier enumerateConnectedProtocolConnections:](v7, "enumerateConnectedProtocolConnections:", v6);
  char v4 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (int)_protoSubscriptionFailureToReadableFailure:(int)a3
{
  if (a3) {
    return -1;
  }
  else {
    return 0;
  }
}

- (void)sendFailuresToClient:(id)a3 pushTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier connectionServers](self, "connectionServers"));
  id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    goto LABEL_16;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(obj);
      }
      char v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 enabledTopics]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 opportunisticTopics]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 nonWakingTopics]);
      if (([v14 containsObject:v7] & 1) != 0
        || ([v16 containsObject:v7] & 1) != 0
        || ([v15 containsObject:v7] & 1) != 0
        || ([v14 containsObject:@"*"] & 1) != 0
        || ([v15 containsObject:@"*"] & 1) != 0
        || [v16 containsObject:@"*"])
      {
        [v13 handleChannelSubscriptionFailures:v6 forTopic:v7];
        char v10 = 1;
      }
    }

    id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  }

  while (v9);
  if ((v10 & 1) == 0)
  {
LABEL_16:
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000C0210();
    }
  }
}

- (void)handleIgnoredTopics:(id)a3
{
  id v4 = a3;
  -[APSUserCourier _resetCheckpointForIgnoredTopics:](self, "_resetCheckpointForIgnoredTopics:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects", 0));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      char v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier allRegisteredChannelsForTopic:]( self,  "allRegisteredChannelsForTopic:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10)));
        [v5 addObjectsFromArray:v11];

        char v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
    -[APSUserCourier _handlePubSubRequest:unsubscriptionChannels:token:]( self,  "_handlePubSubRequest:unsubscriptionChannels:token:",  0LL,  v5,  v12);
  }
}

- (void)_resetCheckpointForIgnoredTopics:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pubSubName]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 allRegisteredChannelsForTopic:v10 environment:v12 userName:v14]);

        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            for (j = 0LL; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              __int128 v21 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)j);
              [v21 resetCheckpoint];
              [v5 updateChannel:v21];
            }

            id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v18);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v7);
  }
}

- (void)subscribeToPreviouslyIgnoredTopics:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects", 0));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[APSUserCourier allRegisteredChannelsForTopic:]( self,  "allRegisteredChannelsForTopic:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10)));
        [v5 addObjectsFromArray:v11];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
    -[APSUserCourier _handlePubSubRequest:unsubscriptionChannels:token:]( self,  "_handlePubSubRequest:unsubscriptionChannels:token:",  v5,  0LL,  v12);
  }
}

- (id)_getNextMessageID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier currentMessageID](self, "currentMessageID"));

  if (!v3) {
    -[APSUserCourier setCurrentMessageID:](self, "setCurrentMessageID:", &off_10012B728);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier currentMessageID](self, "currentMessageID"));
  uint64_t v5 = [v4 unsignedIntValue];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5 + 1));
  -[APSUserCourier setCurrentMessageID:](self, "setCurrentMessageID:", v6);

  return -[APSUserCourier currentMessageID](self, "currentMessageID");
}

- (void)_handlePubSubUpdateMessage:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"APSProtocolPubSubUpdatePayload"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"APSProtocolPubSubUpdateToken"]);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
  uint64_t v11 = v10;
  if (v8) {
    BOOL v12 = v9 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000C0270();
    }
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received pubsub update message for token %@",  (uint8_t *)&v17,  0xCu);
    }

    if (-[APSUserCourier _isResponseForProxyDevice:](self, "_isResponseForProxyDevice:", v9))
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:]( self,  "_findConnectedClientWithToken:onProtocolConnection:",  v9,  v7));
      -[os_log_s sendPubSubUpdateMessage:forConnectionType:]( v11,  "sendPubSubUpdateMessage:forConnectionType:",  v6,  [v7 connectionType]);
    }

    else
    {
      uint64_t v11 = -[PSChannelSubscriptionsUpdatePayload initWithData:]( objc_alloc(&OBJC_CLASS___PSChannelSubscriptionsUpdatePayload),  "initWithData:",  v8);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s subscriptionUpdates](v11, "subscriptionUpdates"));
      id v15 = [v14 count];

      if (v15)
      {
        -[APSUserCourier _handleSubscriptionUpdateCommand:token:protocolConnection:]( self,  "_handleSubscriptionUpdateCommand:token:protocolConnection:",  v11,  v9,  v7);
      }

      else
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s appChannelUpdates](v11, "appChannelUpdates"));

        if (v16) {
          -[APSUserCourier _handleChannelUpdateCommand:](self, "_handleChannelUpdateCommand:", v11);
        }
      }
    }
  }
}

- (void)_handleSubscriptionUpdateCommand:(id)a3 token:(id)a4 protocolConnection:(id)a5
{
  id v21 = a4;
  id v8 = a5;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 subscriptionUpdates]);
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v23;
    *(void *)&__int128 v11 = 138412290LL;
    __int128 v20 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)i), "subscriptionsStatus", v20))
        {
          v28[0] = @"Environment";
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 environmentType]));
          v29[0] = v16;
          v29[1] = &off_10012B740;
          v28[1] = @"MessageType";
          void v28[2] = @"ConnectionType";
          int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 connectionType]));
          v29[2] = v17;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));

          APSPubSubPowerLog(v18);
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            __int128 v27 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ Resending full subscription list in response to an incoming command 30.",  buf,  0xCu);
          }

          -[APSUserCourier _sendPubsubConnectMessageOnProtocolConnection:token:]( self,  "_sendPubsubConnectMessageOnProtocolConnection:token:",  v8,  v21);
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v12);
  }
}

- (void)_handleChannelUpdateCommand:(id)a3
{
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a3 appChannelUpdates]);
  id v31 = [obj countByEnumeratingWithState:&v42 objects:v57 count:16];
  if (v31)
  {
    id v4 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
    uint64_t v30 = *(void *)v43;
    uint64_t v35 = self;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v5;
        id v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appId]);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v34 = (id)objc_claimAutoreleasedReturnValue([v6 channelUpdates]);
        id v37 = [v34 countByEnumeratingWithState:&v38 objects:v56 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v39 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 channelId]);
              __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);

              unsigned int v12 = [v9 channelStatus];
              if (v12 == 1)
              {
                __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4[275] pubSub]);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  id v23 = [v9 checkpoint];
                  *(_DWORD *)buf = 138413058;
                  __int128 v47 = self;
                  __int16 v48 = 2112;
                  __int16 v49 = v11;
                  __int16 v50 = 2048;
                  id v51 = v23;
                  __int16 v52 = 2112;
                  __int16 v53 = v7;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ Channel %@ was told to fastforward the checkpoint to %llu for topic %@",  buf,  0x2Au);
                }

                id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
                id v24 = objc_alloc((Class)CUTWeakLinkClass(@"PKPublicChannel", @"PushKit"));
                __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 name]);
                __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pubSubName]);
                id v17 = objc_msgSend( v24,  "initWithChannelID:channelTopic:environment:tokenName:checkpoint:",  v11,  v7,  v26,  v28,  objc_msgSend(v9, "checkpoint"));

                [v15 updateChannel:v17];
                id v4 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
              }

              else
              {
                if (v12) {
                  goto LABEL_20;
                }
                uint64_t v13 = -[APSUserCourier _protoUpdateFailureToReadableFailure:]( self,  "_protoUpdateFailureToReadableFailure:",  [v9 channelStatus]);
                v54[0] = @"channelID";
                v54[1] = @"reason";
                v55[0] = v11;
                __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
                v55[1] = v14;
                id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  2LL));

                [v33 addObject:v15];
                __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4[275] pubSub]);
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  __int128 v47 = self;
                  __int16 v48 = 2112;
                  __int16 v49 = v11;
                  __int16 v50 = 2112;
                  id v51 = v7;
                  __int16 v52 = 1024;
                  LODWORD(v53) = v13;
                  _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ The channel %@ on topic %@ does not exist %u Removing subscription...",  buf,  0x26u);
                }

                id v17 = (id)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
                id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
                id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pubSubName]);
                [v17 deleteChannelID:v11 forTopic:v7 environment:v19 userName:v21];
              }

              self = v35;
LABEL_20:
            }

            id v37 = [v34 countByEnumeratingWithState:&v38 objects:v56 count:16];
          }

          while (v37);
        }

        if ([v33 count]) {
          -[APSUserCourier sendFailuresToClient:pushTopic:](self, "sendFailuresToClient:pushTopic:", v33, v7);
        }

        uint64_t v5 = v32 + 1;
      }

      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v42 objects:v57 count:16];
    }

    while (v31);
  }
}

- (int)_protoUpdateFailureToReadableFailure:(int)a3
{
  if (a3) {
    return -1;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldDropPubSubMessageWithData:(id)a3 forTopic:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = -[PSChannelSubscriptionsPushMetadata initWithData:]( objc_alloc(&OBJC_CLASS___PSChannelSubscriptionsPushMetadata),  "initWithData:",  v7);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscriptionsPushMetadata channelId](v8, "channelId"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pubSubName]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( [v11 lookupChannelWithChannelID:v10 andPushTopic:v6 environment:v13 userName:v15]);

    if (v16)
    {
      id v17 = -[PSChannelSubscriptionsPushMetadata checkpoint](v8, "checkpoint");
      if ([v16 checkpoint] <= v17)
      {
        BOOL v19 = 0;
        goto LABEL_11;
      }

      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000C0330();
      }
    }

    else
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000C02D0();
      }
    }

    BOOL v19 = 1;
LABEL_11:

    return v19;
  }

  return 0;
}

- (id)updateChannelForIncomingMessageWithData:(id)a3 forTopic:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = -[PSChannelSubscriptionsPushMetadata initWithData:]( objc_alloc(&OBJC_CLASS___PSChannelSubscriptionsPushMetadata),  "initWithData:",  v7);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PSChannelSubscriptionsPushMetadata channelId](v8, "channelId"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);

    id v11 = -[PSChannelSubscriptionsPushMetadata checkpoint](v8, "checkpoint");
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[APSMessageStore sharedInstance](&OBJC_CLASS___APSMessageStore, "sharedInstance"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier environment](self, "environment"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSUserCourier courierUser](self, "courierUser"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pubSubName]);
    id v20 = v6;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( [v12 lookupChannelWithChannelID:v10 andPushTopic:v6 environment:v14 userName:v16]);

    if (!v17)
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pubSub](&OBJC_CLASS___APSLog, "pubSub"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int128 v22 = self;
        __int16 v23 = 2112;
        id v24 = v20;
        __int16 v25 = 2112;
        __int128 v26 = v10;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "%@ We received a pubsub update for a topic we dont have a subscription for!  topic: %@ channelID: %@",  buf,  0x20u);
      }
    }

    [v17 setCheckpoint:v11];
    [v12 updateChannel:v17];

    id v6 = v20;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_sendProxyChannelList:(id)a3 onConnectionType:(int64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009D56C;
  v6[3] = &unk_10011E7F8;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:]( v7,  "enumerateConnectedProtocolConnectionsOfType:block:",  a4,  v6);
}

- (void)_requestClientPubSubChannelList:(id)a3 onProtocolConnection:(id)a4
{
  id v5 = a3;
  objc_msgSend(v5, "sendPubSubChannelListRequestForConnectionType:", objc_msgSend(a4, "connectionType"));
}

- (void)_handlePubSubChannelListRequestonProtocolConnection:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSUserCourier publicToken](self, "publicToken"));
  -[APSUserCourier _sendPubsubConnectMessageOnProtocolConnection:token:]( self,  "_sendPubsubConnectMessageOnProtocolConnection:token:",  v4,  v5);
}

- (void)_cancelRequest:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 timeoutSource]);

  if (v3)
  {
    id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v5 timeoutSource]);
    dispatch_source_cancel(v4);
  }
}

@end