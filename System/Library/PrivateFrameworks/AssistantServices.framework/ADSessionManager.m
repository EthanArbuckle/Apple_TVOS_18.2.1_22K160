@interface ADSessionManager
- (ADSessionManagerDelegate)delegate;
- (ADSessionManagerIntercepting)interceptor;
- (BOOL)_allowWhitelistedCommands:(id)a3;
- (BOOL)_evaluateResultObjects;
- (BOOL)_filterUnsupportedCommands:(id)a3 inGroup:(id)a4 onSession:(id)a5;
- (BOOL)_hasAtleastOneActiveSessionBesides:(id)a3;
- (BOOL)_haveUsefulness:(id)a3 usefulnessScore:(id *)a4;
- (BOOL)_isDestructive:(id)a3;
- (BOOL)_reverseMapSessionRequestIdToADRequestId:(id)a3 forSession:(id)a4;
- (BOOL)assistantSessionShouldAttemptRetry:(id)a3;
- (BOOL)assistantSessionShouldLogVisibleRequestFailure:(id)a3 forError:(id)a4;
- (BOOL)assistantSessionShouldPrewarmConnetion:(id)a3;
- (BOOL)assistantSessionShouldRestartConnectionOnWiFi:(id)a3;
- (BOOL)hasActiveSessionForSendingMetrics;
- (BOOL)hasClient;
- (BOOL)hasSessionRequiringServerConnection;
- (id)_getActiveEnvironmentName;
- (id)_hostNameToEnvironmentName:(id)a3;
- (id)_keyForRequestId:(id)a3 forSession:(id)a4;
- (id)_languageCode;
- (id)_mapADRequestIdToSessionRequestId:(id)a3 forSession:(id)a4;
- (id)_rapportMessageTypeToHostName:(id)a3;
- (id)_saConnectionMode;
- (id)acquireAssertionForReason:(id)a3;
- (id)aggregator;
- (id)assistantSessionCommandsToRestoreStateOnNewConnection:(id)a3;
- (id)initOnQueue:(id)a3 account:(id)a4 instanceContext:(id)a5;
- (id)sessionRequestIdForRefId:(id)a3;
- (int)_preferredSessionType;
- (unsigned)_resultObjectsHoldTime;
- (void)_addSession:(id)a3;
- (void)_cancelOtherSessionRequests:(id)a3 forRefId:(id)a4;
- (void)_cancelSynchronously:(BOOL)a3;
- (void)_clearSessions;
- (void)_cloudPreferencesDidSync:(id)a3;
- (void)_convertEmbeddedRequestIds:(id)a3 originalCommand:(id)a4 session:(id)a5;
- (void)_enabledBitsChanged:(id)a3;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_languageCodeDidChange:(id)a3;
- (void)_logCommandToMetrics:(id)a3 forSession:(id)a4 outbound:(BOOL)a5;
- (void)_logContextForWinningSession:(id)a3 forReason:(id)a4 forRemoteSessionScore:(int64_t)a5 forLocalSessionScore:(int64_t)a6;
- (void)_logMetricsForSessionFailure:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)_pickDefaultWinnerWithDroppingSession:(id)a3;
- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4;
- (void)_purgeRequestMaps;
- (void)_queueResultObject:(id)a3 forSession:(id)a4;
- (void)_registerForCompanionMessages;
- (void)_registerForPossibleSessionDestroyingNotifications;
- (void)_registerForSleepNotification;
- (void)_resetResultObjectsTimer;
- (void)_resetSessionOnRequestBoundaryIfNeeded;
- (void)_resetSessionsAndMakeQuiet:(BOOL)a3;
- (void)_resetWinningState;
- (void)_resetWinningStateAndPurgeRequestMaps;
- (void)_resultObjectsTimerFired:(id)a3;
- (void)_sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5 doSendPreProcessing:(BOOL)a6 doSendPostProcessing:(BOOL)a7;
- (void)_setRequestId:(id)a3;
- (void)_sharedAssistantdIdentifierDidChange:(id)a3;
- (void)_startResultObjectsTimer;
- (void)_startSession:(int)a3 makeQuiet:(BOOL)a4;
- (void)_startSessions:(BOOL)a3;
- (void)_unregisterForPossibleSessionDestroyingNotifications;
- (void)_unregisterForSleepNotification;
- (void)_updateRemoraHostname:(id)a3 messageType:(id)a4;
- (void)_updateSharedUserIdentifiers;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)assistantSession:(id)a3 beginSessionRetryPreferringWWAN:(BOOL)a4;
- (void)assistantSession:(id)a3 cannotHandleRequest:(id)a4 error:(id)a5;
- (void)assistantSession:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5;
- (void)assistantSession:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4;
- (void)assistantSession:(id)a3 didOpenConnectionWithPolicyId:(id)a4 routeId:(id)a5 connectionDelay:(double)a6;
- (void)assistantSession:(id)a3 receivedCommand:(id)a4;
- (void)assistantSession:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5;
- (void)assistantSession:(id)a3 receivedIntermediateError:(id)a4;
- (void)assistantSession:(id)a3 willRetryOnError:(id)a4;
- (void)assistantSessionConnectionDidClose:(id)a3;
- (void)assistantSessionConnectionDidReset:(id)a3;
- (void)assistantSessionDidCreateAssistant:(id)a3;
- (void)assistantSessionDidDestroyAssistant:(id)a3;
- (void)assistantSessionRetryingRequest:(id)a3;
- (void)assistantSessionWillStartConnection:(id)a3;
- (void)barrier:(id)a3;
- (void)beginUpdatingAssistantData;
- (void)cancel;
- (void)cancelSynchronously;
- (void)dealloc;
- (void)delegateDidHandleCommand:(id)a3;
- (void)endRetryableRequestForCommand:(id)a3;
- (void)getConnectionMetrics:(id)a3;
- (void)getSNConnectionMetrics:(id)a3;
- (void)handleCommand:(id)a3;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)preheatAndMakeQuiet:(BOOL)a3;
- (void)preheatSessions;
- (void)refreshValidationData;
- (void)relinquishAssertion:(id)a3;
- (void)resetRetryManager;
- (void)resetSessionsAtNextRequestBoundary;
- (void)resetSessionsAtNextRequestBoundaryWithCompletion:(id)a3;
- (void)resetSessionsIfRequiredBasedOnOrchestrationMode:(BOOL)a3;
- (void)resetWinningState;
- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5;
- (void)sendRawCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5;
- (void)sendRemoteGizmoDeviceToServer:(id)a3;
- (void)setAWDRequestRecordMetrics:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasActiveRequest:(BOOL)a3;
- (void)setHasClient:(BOOL)a3;
- (void)setHubAccount:(id)a3;
- (void)setInterceptor:(id)a3;
- (void)setRequestId:(id)a3;
- (void)startRetry;
- (void)updateConnectionDidDropAggdMetrics;
- (void)updateConnectionDidFailAggdMetrics;
- (void)updateConnectionSetConnectionType:(unsigned int)a3;
- (void)updateForCallIsLikelyDueToRequest:(BOOL)a3;
- (void)updateForCallState:(BOOL)a3;
@end

@implementation ADSessionManager

- (id)initOnQueue:(id)a3 account:(id)a4 instanceContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ADSessionManager;
  v12 = -[ADSessionManager init](&v24, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v13->_instanceContext, a5);
    v13->_sharedUserIdentifierState = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v13 selector:"_languageCodeDidChange:" name:@"ADPreferencesLanguageCodeDidChangeNotification" object:0];
    [v14 addObserver:v13 selector:"_sharedAssistantdIdentifierDidChange:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
    [v14 addObserver:v13 selector:"_cloudPreferencesDidSync:" name:@"ADCloudKitManagerPreferencesDidSyncNotification" object:0];
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    sessions = v13->_sessions;
    v13->_sessions = v15;

    v13->_state = 0LL;
    int v19 = AFDeviceSupportsFullSiriUOD(v17, v18);
    v13->_preferredRemoteSessionType = v19;
    v20 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ADSessionManager initOnQueue:account:instanceContext:]";
      __int16 v27 = 1024;
      int v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s _preferredRemoteSessionType = %u",  buf,  0x12u);
    }

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    assertions = v13->_assertions;
    v13->_assertions = v21;

    -[ADSessionManager _registerForCompanionMessages](v13, "_registerForCompanionMessages");
  }

  return v13;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"ADPreferencesLanguageCodeDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADCloudKitManagerPreferencesDidSyncNotification" object:0];
  -[ADSessionManager _unregisterForPossibleSessionDestroyingNotifications]( self,  "_unregisterForPossibleSessionDestroyingNotifications");
  -[ADSessionManager _unregisterForSleepNotification](self, "_unregisterForSleepNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
  [v4 setOrchestratorRequestId:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
  [v5 setNetId:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
  [v6 setNetIdAvailable:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
  [v7 setOrchestratorRequestId:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
  [v8 setNetId:0];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
  [v9 setNetIdAvailable:0];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADSessionManager;
  -[ADSessionManager dealloc](&v10, "dealloc");
}

- (void)_startSessions:(BOOL)a3
{
  BOOL v3 = a3;
  -[ADSessionManager _registerForPossibleSessionDestroyingNotifications]( self,  "_registerForPossibleSessionDestroyingNotifications");
  int64_t state = self->_state;
  if (!state)
  {
    -[ADSessionManager _resetWinningStateAndPurgeRequestMaps](self, "_resetWinningStateAndPurgeRequestMaps");
    self->_int64_t state = 2LL;
    -[ADSessionManager _startSession:makeQuiet:]( self,  "_startSession:makeQuiet:",  self->_preferredRemoteSessionType,  v3);
    int64_t state = self->_state;
  }

  if (state == 1)
  {
    self->_int64_t state = 2LL;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    v6 = self->_sessions;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v28,  16LL);
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v19;
      *(void *)&__int128 v8 = 136315650LL;
      __int128 v17 = v8;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v12, "sessionIsActive", v17, (void)v18) & 1) == 0
            && ([v12 sessionIsAttemptingTryOrRetry] & 1) == 0)
          {
            v13 = (void *)AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
            {
              v14 = v13;
              v15 = (void *)objc_claimAutoreleasedReturnValue([v12 _adSessionTypeString]);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionId]);
              *(_DWORD *)buf = v17;
              v23 = "-[ADSessionManager _startSessions:]";
              __int16 v24 = 2112;
              v25 = v15;
              __int16 v26 = 2112;
              __int16 v27 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Resetting %@ session with Id %@",  buf,  0x20u);
            }

            [v12 resetConnection];
          }
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v28,  16LL);
      }

      while (v9);
    }
  }

- (void)_startSession:(int)a3 makeQuiet:(BOOL)a4
{
  v6 = +[ADSession sessionClassForType:](&OBJC_CLASS___ADSession, "sessionClassForType:", *(void *)&a3);
  -[ADSessionManager _updateSharedUserIdentifiers](self, "_updateSharedUserIdentifiers");
  id v7 = objc_alloc(v6);
  queue = self->_queue;
  account = self->_account;
  hubAccount = self->_hubAccount;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _languageCode](self, "_languageCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _saConnectionMode](self, "_saConnectionMode"));
  id v13 = [v7 initOnQueue:queue withAccount:account hubAccount:hubAccount languageCode:v11 connectionMode:v12 sharedUserIdentifier:self->_sharedUserIdentifier loggingSharedUserIdentifie r:self->_loggingSharedUserIdentifier instanceContext:self->_instanceContext];

  [v13 setDelegate:self];
  if (!a4)
  {
    [v13 eagerlyFetchAssistantData];
    [v13 preheatAndMakeQuiet:0];
  }

  -[NSMutableArray addObject:](self->_sessions, "addObject:", v13);
  -[ADSessionManager setAWDRequestRecordMetrics:](self, "setAWDRequestRecordMetrics:", self->_awdRequestRecord);
  v14 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionId]);
    id v17 = -[NSMutableArray count](self->_sessions, "count");
    *(_DWORD *)buf = 136315650;
    __int128 v19 = "-[ADSessionManager _startSession:makeQuiet:]";
    __int16 v20 = 2112;
    __int128 v21 = v16;
    __int16 v22 = 2048;
    id v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Started a session with id %@, count = %tu",  buf,  0x20u);
  }
}

- (void)preheatAndMakeQuiet:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_state > 1)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    v4 = self->_sessions;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        __int128 v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "preheatAndMakeQuiet:", v3, (void)v9);
          __int128 v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    -[ADSessionManager _startSessions:](self, "_startSessions:", a3);
  }

- (void)preheatSessions
{
}

- (void)beginUpdatingAssistantData
{
  if (self->_state <= 1) {
    -[ADSessionManager _startSessions:](self, "_startSessions:", 0LL);
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  BOOL v3 = self->_sessions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "beginUpdatingAssistantData", (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (void)_cancelSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[NSMutableArray copy](self->_sessions, "copy");
  -[NSMutableArray removeAllObjects](self->_sessions, "removeAllObjects");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v10);
        if (v3) {
          [v11 cancelSynchronously];
        }
        else {
          objc_msgSend(v11, "cancel", (void)v12);
        }
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  -[ADSessionManager _unregisterForPossibleSessionDestroyingNotifications]( self,  "_unregisterForPossibleSessionDestroyingNotifications");
}

- (void)cancel
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D9420;
  v4[3] = &unk_1004FAF58;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelSynchronously
{
  self->_int64_t state = 0LL;
}

- (void)_resetSessionsAndMakeQuiet:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[ADSessionManager _resetSessionsAndMakeQuiet:]";
    __int16 v24 = 1024;
    BOOL v25 = v3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Starting sessions and make quiet: %d",  buf,  0x12u);
  }

  self->_preferredSessionType = self->_preferredRemoteSessionType;
  if (!self->_state)
  {
    -[ADSessionManager _startSessions:](self, "_startSessions:", v3);
    return;
  }

  -[ADSessionManager _resetWinningStateAndPurgeRequestMaps](self, "_resetWinningStateAndPurgeRequestMaps");
  id v6 = -[NSMutableArray copy](self->_sessions, "copy");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    char v11 = 1;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned int v14 = objc_msgSend(v13, "sessionType", (void)v17);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _languageCode](self, "_languageCode"));
        [v13 setLanguageCode:v15];

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _saConnectionMode](self, "_saConnectionMode"));
        [v13 setConnectionMode:v16];

        [v13 resetConnection];
        v11 &= v14 > 1;
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);

    if ((v11 & 1) == 0) {
      goto LABEL_16;
    }
  }

  else
  {
  }

  -[ADSessionManager _startSession:makeQuiet:]( self,  "_startSession:makeQuiet:",  self->_preferredRemoteSessionType,  v3,  (void)v17);
LABEL_16:
}

- (void)resetSessionsAtNextRequestBoundary
{
}

- (void)resetSessionsAtNextRequestBoundaryWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_hasActiveRequest || -[NSMutableSet count](self->_assertions, "count"))
  {
    id v5 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      char v11 = "-[ADSessionManager resetSessionsAtNextRequestBoundaryWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Pending until request is over",  (uint8_t *)&v10,  0xCu);
    }

    self->_needsResetOnRequestBoundary = 1;
    if (v4)
    {
      if (self->_sessionResetOnRequestBoundaryCompletion)
      {
        v4[2](v4);
      }

      else
      {
        id v6 = objc_retainBlock(v4);
        id sessionResetOnRequestBoundaryCompletion = self->_sessionResetOnRequestBoundaryCompletion;
        self->_id sessionResetOnRequestBoundaryCompletion = v6;
      }
    }
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      char v11 = "-[ADSessionManager resetSessionsAtNextRequestBoundaryWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Resetting immediately", (uint8_t *)&v10, 0xCu);
    }

    self->_needsResetOnRequestBoundary = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v9 logEventWithType:925 context:0];

    if (v4) {
      v4[2](v4);
    }
    -[ADSessionManager _resetSessionsAndMakeQuiet:](self, "_resetSessionsAndMakeQuiet:", self->_sessions == 0LL);
  }
}

- (void)startRetry
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = self->_sessions;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        objc_msgSend(v7, "prepareForRetry", (void)v8);
        [v7 startRetry];
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v4);
  }
}

- (void)resetRetryManager
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_sessions;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "resetRetryManager", (void)v7);
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (void)endRetryableRequestForCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  v16 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  __int128 v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[ADSessionManager endRetryableRequestForCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v8 = self->_sessions;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionManager _mapADRequestIdToSessionRequestId:forSession:]( self,  "_mapADRequestIdToSessionRequestId:forSession:",  v5,  v13));
        if (v6) {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionManager _mapADRequestIdToSessionRequestId:forSession:]( self,  "_mapADRequestIdToSessionRequestId:forSession:",  v6,  v13));
        }
        else {
          __int128 v15 = 0LL;
        }
        [v13 endRetryableRequestForCommandAceId:v14 refId:v15];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v10);
  }
}

- (void)_purgeRequestMaps
{
  id v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADSessionManager _purgeRequestMaps]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[NSMutableDictionary removeAllObjects](self->_proxiedIdMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_reverseProxiedIdMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sessionOriginatedCommandTable, "removeAllObjects");
}

- (id)_languageCode
{
  languageCode = self->_languageCode;
  if (!languageCode)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
    id v6 = self->_languageCode;
    self->_languageCode = v5;

    languageCode = self->_languageCode;
  }

  return languageCode;
}

- (void)_updateSharedUserIdentifiers
{
  if (self->_sharedUserIdentifier) {
    return;
  }
  if (self->_sharedUserIdentifierState == 1) {
    return;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  int v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 sharedUserIdentifier]);
  sharedUserIdentifier = self->_sharedUserIdentifier;
  self->_sharedUserIdentifier = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  __int128 v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 loggingSharedUserIdentifier]);
  loggingSharedUserIdentifier = self->_loggingSharedUserIdentifier;
  self->_loggingSharedUserIdentifier = v7;

  self->_int64_t sharedUserIdentifierState = 1LL;
  if ((AFSupportsMultiUser(v9, v10) & 1) != 0) {
    return;
  }
  int64_t sharedUserIdentifierState = self->_sharedUserIdentifierState;
  if (!self->_sharedUserIdentifier || !self->_loggingSharedUserIdentifier)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    unsigned int v13 = [v12 preferencesHaveBeenSynchronized];

    if (v13)
    {
      unsigned int v14 = self->_sharedUserIdentifier;
      if (v14)
      {
        __int128 v15 = v14;
        v16 = self->_sharedUserIdentifier;
        self->_sharedUserIdentifier = v15;
      }

      else
      {
        v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        __int128 v19 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString UUIDString](v16, "UUIDString"));
        __int128 v20 = self->_sharedUserIdentifier;
        self->_sharedUserIdentifier = v19;
      }

      __int128 v21 = self->_loggingSharedUserIdentifier;
      if (v21)
      {
        __int16 v22 = v21;
        id v23 = self->_loggingSharedUserIdentifier;
        self->_loggingSharedUserIdentifier = v22;
      }

      else
      {
        id v23 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        __int16 v24 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString UUIDString](v23, "UUIDString"));
        BOOL v25 = self->_loggingSharedUserIdentifier;
        self->_loggingSharedUserIdentifier = v24;
      }

      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      [v26 setSharedUserIdentifier:self->_sharedUserIdentifier loggingSharedUserIdentifier:self->_loggingSharedUserIdentifier];

      goto LABEL_17;
    }
  }

  if (sharedUserIdentifierState)
  {
LABEL_17:
    __int16 v27 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v28 = self->_sharedUserIdentifier;
      int v30 = 136315395;
      v31 = "-[ADSessionManager _updateSharedUserIdentifiers]";
      __int16 v32 = 2113;
      v33 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s Created new sharedUserId %{private}@",  (uint8_t *)&v30,  0x16u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];

    return;
  }

  __int128 v17 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    __int128 v18 = self->_sharedUserIdentifier;
    int v30 = 136315395;
    v31 = "-[ADSessionManager _updateSharedUserIdentifiers]";
    __int16 v32 = 2113;
    v33 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Unchanged sharedUserId %{private}@",  (uint8_t *)&v30,  0x16u);
  }

- (void)setHubAccount:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D9414;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_sharedAssistantdIdentifierDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADSessionManager _sharedAssistantdIdentifierDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D93C8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cloudPreferencesDidSync:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADSessionManager _cloudPreferencesDidSync:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D93B4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_saConnectionMode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_ad_connectionModeFromEnabledState"));
  connectionMode = self->_connectionMode;
  self->_connectionMode = v4;

  return self->_connectionMode;
}

- (void)_registerForPossibleSessionDestroyingNotifications
{
  if (!self->_isRegisteredForSessionDestroyingNotifications)
  {
    self->_isRegisteredForSessionDestroyingNotifications = 1;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"_enabledBitsChanged:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
  }

- (void)_unregisterForPossibleSessionDestroyingNotifications
{
  if (self->_isRegisteredForSessionDestroyingNotifications)
  {
    self->_isRegisteredForSessionDestroyingNotifications = 0;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
  }

- (void)_enabledBitsChanged:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADSessionManager _enabledBitsChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D931C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_languageCodeDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADSessionManager _languageCodeDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D922C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  if ((v4 >> 4) <= 1)
  {
    id v8 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"can sleep";
      if (a3 == -536870272) {
        uint64_t v9 = @"will sleep";
      }
      int v12 = 136315394;
      unsigned int v13 = "-[ADSessionManager _powerChangedMessageType:notificationID:]";
      __int16 v14 = 2112;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Canceling connection due to power change notification %@",  (uint8_t *)&v12,  0x16u);
    }

    if (self->_state >= 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 33LL));
      [WeakRetained assistantSessionManager:self receivedError:v11 isRetryableError:0];
    }

    IOAllowPowerChange(self->_ioConnect, a4);
  }

- (void)_registerForSleepNotification
{
  if (!self->_ioConnect)
  {
    id v3 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      id v6 = "-[ADSessionManager _registerForSleepNotification]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
    }

    io_connect_t v4 = IORegisterForSystemPower( self,  &self->_ioNotificationPortRef,  (IOServiceInterestCallback)j__objc_msgSend__powerChangedMessageType_notificationID_,  &self->_ioNotifier);
    self->_ioConnect = v4;
    if (v4 + 1 >= 2) {
      IONotificationPortSetDispatchQueue(self->_ioNotificationPortRef, (dispatch_queue_t)self->_queue);
    }
    else {
      self->_ioConnect = 0;
    }
  }

- (void)_unregisterForSleepNotification
{
  if (self->_ioConnect)
  {
    IOReturn v3 = IODeregisterForSystemPower(&self->_ioNotifier);
    if (v3)
    {
      IOReturn v4 = v3;
      int v5 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        __int128 v7 = "-[ADSessionManager _unregisterForSleepNotification]";
        __int16 v8 = 1026;
        IOReturn v9 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Error deregistering for power notifications %{public}d",  (uint8_t *)&v6,  0x12u);
      }
    }

    else
    {
      self->_ioNotifier = 0;
      IONotificationPortDestroy(self->_ioNotificationPortRef);
      self->_ioNotificationPortRef = 0LL;
      IOServiceClose(self->_ioConnect);
      self->_ioConnect = 0;
    }
  }

- (void)updateForCallState:(BOOL)a3
{
  if (self->_callInProcess != a3) {
    self->_callInProcess = a3;
  }
}

- (void)updateForCallIsLikelyDueToRequest:(BOOL)a3
{
  if (a3)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    IOReturn v3 = self->_sessions;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        __int128 v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setDormant:", 1, (void)v8);
          __int128 v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      }

      while (v5);
    }
  }

- (int)_preferredSessionType
{
  return self->_preferredRemoteSessionType;
}

- (BOOL)_evaluateResultObjects
{
  v2 = self;
  int preferredSessionType = self->_preferredSessionType;
  v54 = (char *)-[NSMutableArray count](self->_sessions, "count");
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v4 = v2->_sessions;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v66,  v85,  16LL);
  if (!v5)
  {

    id v23 = 0LL;
    __int128 v10 = 0LL;
    goto LABEL_54;
  }

  id v6 = v5;
  v55 = v2;
  id v7 = 0LL;
  id v60 = 0LL;
  v61 = 0LL;
  id v8 = 0LL;
  __int128 v9 = 0LL;
  __int128 v10 = 0LL;
  v57 = 0LL;
  obj = v4;
  uint64_t v11 = *(void *)v67;
  int v56 = preferredSessionType;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v67 != v11) {
        objc_enumerationMutation(obj);
      }
      unsigned int v13 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
      if ([v13 hasUsefulnessScore])
      {
        id v14 = [v13 usefulnessScore];
        if ((uint64_t)v8 <= (uint64_t)v14)
        {
          id v15 = v7;
          v16 = v9;
          __int128 v17 = v10;
          id v18 = v13;

          id v8 = v14;
          v57 = v18;
          __int128 v10 = v17;
          __int128 v9 = v16;
          id v7 = v15;
          int preferredSessionType = v56;
        }

        ++v61;
        if ([v13 sessionType])
        {
          unsigned int v19 = [v13 sessionType];
          if (v19 == 1) {
            id v7 = v14;
          }
          id v20 = v60;
          if (v19 != 1) {
            id v20 = v14;
          }
          id v60 = v20;
        }

        else
        {
          id v7 = v14;
        }
      }

      if ([v13 sessionType] == preferredSessionType)
      {
        id v21 = v13;

        __int128 v10 = v21;
      }

      if ([v13 hasResultObjects])
      {
        id v22 = v13;

        __int128 v9 = v22;
      }
    }

    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v85,  16LL);
  }

  while (v6);

  id v53 = v7;
  if (v7 != v60 || !v10 || ![v10 hasResultObjects])
  {
    v2 = v55;
    id v23 = v57;
    if (v57)
    {
      int v24 = 0;
      BOOL v25 = 0LL;
      goto LABEL_28;
    }

    if (!v55->_timerFiredOnce)
    {
      id v23 = 0LL;
      goto LABEL_55;
    }

    id v23 = v9;
    if (v23)
    {
      BOOL v25 = @"timerFiredAndSomeSessionHadResults";
      int v24 = 1;
      goto LABEL_28;
    }

- (unsigned)_resultObjectsHoldTime
{
  unsigned int serverDrivenResultsHoldTime = self->_serverDrivenResultsHoldTime;
  if (!serverDrivenResultsHoldTime) {
    unsigned int serverDrivenResultsHoldTime = 500;
  }
  if (self->_preferredSessionType >= 2u) {
    unsigned int v3 = 1000;
  }
  else {
    unsigned int v3 = serverDrivenResultsHoldTime;
  }
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[ADSessionManager _resultObjectsHoldTime]";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s holdTime is %d", (uint8_t *)&v6, 0x12u);
  }

  return v3;
}

- (void)_startResultObjectsTimer
{
  unsigned int v3 = -[ADSessionManager _resultObjectsHoldTime](self, "_resultObjectsHoldTime");
  id v4 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  uint64_t v5 = 1000000LL * v3;
  dispatch_time_t v6 = dispatch_time(0LL, v5);
  dispatch_source_set_timer(v4, v6, v5, 0LL);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000D91E4;
  handler[3] = &unk_1004FBF48;
  id v7 = v4;
  uint64_t v11 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  resultObjectsEvaluationTimer = self->_resultObjectsEvaluationTimer;
  self->_resultObjectsEvaluationTimer = (OS_dispatch_source *)v7;
  unsigned int v9 = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_resultObjectsTimerFired:(id)a3
{
  id v4 = (OS_dispatch_source *)a3;
  uint64_t v5 = v4;
  if (self->_resultObjectsEvaluationTimer == v4)
  {
    self->_resultObjectsEvaluationTimer = 0LL;

    self->_timerFiredOnce = 1;
    if (-[ADSessionManager _evaluateResultObjects](self, "_evaluateResultObjects"))
    {
      dispatch_time_t v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315138;
        __int16 v8 = "-[ADSessionManager _resultObjectsTimerFired:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Restarting timer as there is no winning session yet",  (uint8_t *)&v7,  0xCu);
      }

      -[ADSessionManager _startResultObjectsTimer](self, "_startResultObjectsTimer");
    }
  }
}

- (void)_resetResultObjectsTimer
{
  resultObjectsEvaluationTimer = self->_resultObjectsEvaluationTimer;
  if (resultObjectsEvaluationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)resultObjectsEvaluationTimer);
    id v4 = self->_resultObjectsEvaluationTimer;
    self->_resultObjectsEvaluationTimer = 0LL;
  }

- (void)_queueResultObject:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  [v6 queueResultObjects:a3];
  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    id v14 = @"sessionType";
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _adSessionTypeString]);
    id v15 = v8;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    [v7 logEventWithType:923 context:v9];
  }

  if ([v6 sessionType] == self->_preferredSessionType)
  {
    __int128 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      unsigned int v13 = "-[ADSessionManager _queueResultObject:forSession:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s We have results from preferred session. Evaluate.",  (uint8_t *)&v12,  0xCu);
    }

    -[ADSessionManager _resetResultObjectsTimer](self, "_resetResultObjectsTimer");
    self->_BOOL isQueuingResultsForDelayedEvaluation = 1;
    if (-[ADSessionManager _evaluateResultObjects](self, "_evaluateResultObjects")) {
      -[ADSessionManager _startResultObjectsTimer](self, "_startResultObjectsTimer");
    }
  }

  else if (!self->_isQueuingResultsForDelayedEvaluation)
  {
    self->_BOOL isQueuingResultsForDelayedEvaluation = 1;
    -[ADSessionManager _startResultObjectsTimer](self, "_startResultObjectsTimer");
    uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      unsigned int v13 = "-[ADSessionManager _queueResultObject:forSession:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Started queueing result objects",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (BOOL)_isDestructive:(id)a3
{
  id v3 = a3;
  if (qword_100577CB0 != -1) {
    dispatch_once(&qword_100577CB0, &stru_1004F0598);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 refId]);

  if (v4)
  {
    if ((objc_opt_respondsToSelector(v3, "mutatingCommand") & 1) != 0) {
      LODWORD(v4) = [v3 mutatingCommand];
    }
    else {
      LODWORD(v4) = 0;
    }
    uint64_t v5 = qword_100577CB8;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 encodedClassName]);
    LOBYTE(v5) = [(id)v5 containsObject:v6];

    if ((v5 & 1) != 0 || (_DWORD)v4)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 groupIdentifier]);
      unsigned __int8 v8 = [v7 isEqualToString:SASGroupIdentifier];

      if ((v8 & 1) != 0
        || (uint64_t v9 = qword_100577CC0,
            __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 encodedClassName]),
            LOBYTE(v9) = [(id)v9 containsObject:v10],
            v10,
            (v9 & 1) != 0))
      {
        LODWORD(v4) = 0;
      }

      else
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
        LODWORD(v4) = 1;
        [v11 networkActivityStart:5 activate:1];

        int v12 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkActivityTracing sharedInstance]( &OBJC_CLASS___SNNetworkActivityTracing,  "sharedInstance"));
        [v12 networkActivityStart:5 activate:1 completion:0];
      }
    }

    unsigned int v13 = (void *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 encodedClassName]);
      int v17 = 136315650;
      id v18 = "-[ADSessionManager _isDestructive:]";
      __int16 v19 = 2112;
      id v20 = v15;
      __int16 v21 = 1024;
      int v22 = (int)v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Command is %@ and %d",  (uint8_t *)&v17,  0x1Cu);
    }
  }

  return (char)v4;
}

- (BOOL)_haveUsefulness:(id)a3 usefulnessScore:(id *)a4
{
  id v5 = a3;
  char v6 = objc_opt_respondsToSelector(v5, "usefulnessScore");
  char v7 = v6;
  if (a4 && (v6 & 1) != 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v5 usefulnessScore]);
  }

  return v7 & 1;
}

- (void)_cancelOtherSessionRequests:(id)a3 forRefId:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  if (v24)
  {
    id v23 = v6;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionId]);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    unsigned __int8 v8 = self->_sessions;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v35,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionId]);
          unsigned __int8 v15 = [v7 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionManager _keyForRequestId:forSession:]( self,  "_keyForRequestId:forSession:",  v24,  v13));
            if (v16)
            {
              int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_proxiedIdMap, "valueForKey:", v16));
              id v18 = (os_log_s *)AFSiriLogContextSession;
              if (v17)
              {
                if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  id v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
                  __int16 v31 = 2112;
                  id v32 = v24;
                  __int16 v33 = 2112;
                  v34 = v17;
                  _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s (refId %@) causing us to cancel other session request (refId %@)",  buf,  0x20u);
                }

                [v13 cancelSessionRequest:v17];
                id v19 = [v13 dequeueResultObjects];
              }

              else if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                id v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
                __int16 v31 = 2112;
                id v32 = v24;
                _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Out of band destructive commands with %@ refId",  buf,  0x16u);
              }
            }

            else
            {
              id v20 = (os_log_s *)AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                id v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
                __int16 v31 = 2112;
                id v32 = v24;
                _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Cannot remap to other sessions with refId %@",  buf,  0x16u);
              }
            }
          }
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v35,  16LL);
      }

      while (v10);
    }

    winningSessionId = self->_winningSessionId;
    self->_winningSessionId = (NSString *)v7;

    id v6 = v23;
  }

  else
  {
    int v22 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Destructive command with no RefId. File bug.",  buf,  0xCu);
    }
  }
}

- (void)_pickDefaultWinnerWithDroppingSession:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 sessionId]);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  obj = self->_sessions;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v47,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v39;
    id location = (id *)&self->_winningSessionId;
    uint64_t v27 = *(void *)v39;
    __int128 v28 = v4;
    do
    {
      unsigned __int8 v8 = 0LL;
      id v29 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionId", location));
        if ([v4 isEqualToString:v10])
        {
          id v11 = [v9 dequeueResultObjects];
        }

        else
        {
          __int16 v33 = v8;
          int v12 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            unsigned int v13 = v12;
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionId]);
            *(_DWORD *)buf = 136315394;
            v44 = "-[ADSessionManager _pickDefaultWinnerWithDroppingSession:]";
            __int16 v45 = 2112;
            v46 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Session %@ wins by default.",  buf,  0x16u);
          }

          id v32 = v10;
          objc_storeStrong(location, v10);
          __int16 v31 = v9;
          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 dequeueResultObjects]);
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v35;
            do
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
                __int16 v21 = (void *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  int v22 = v21;
                  id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 encodedClassName]);
                  *(_DWORD *)buf = 136315394;
                  v44 = "-[ADSessionManager _pickDefaultWinnerWithDroppingSession:]";
                  __int16 v45 = 2112;
                  v46 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Command %@", buf, 0x16u);
                }

                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                [WeakRetained assistantSessionManager:self receivedCommand:v20];
              }

              id v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }

            while (v17);
          }

          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v31 _adSessionTypeString]);
          -[ADSessionManager _logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:]( self,  "_logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:",  v25,  @"sessionCannotHandleRequest",  0LL,  0LL);

          uint64_t v7 = v27;
          id v4 = v28;
          id v6 = v29;
          id v10 = v32;
          unsigned __int8 v8 = v33;
        }

        unsigned __int8 v8 = (char *)v8 + 1;
      }

      while (v8 != v6);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v47,  16LL);
    }

    while (v6);
  }
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[ADSessionManager adviseSessionArbiterToContinueWithPreviousWinner:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s shouldContinue is %d",  (uint8_t *)&v6,  0x12u);
  }

  if (self->_continueWithPreviousWinner != v3) {
    self->_continueWithPreviousWinner = v3;
  }
}

- (BOOL)hasActiveSessionForSendingMetrics
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v3 = self->_sessions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unsigned int v9 = objc_msgSend(v8, "canHandleRequest", (void)v15);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionId]);
        if (v9
          && ((winningSessionId = self->_winningSessionId) == 0LL
           || -[NSString isEqualToString:](winningSessionId, "isEqualToString:", v10))
          && [v8 sessionIsActive])
        {
          unsigned __int8 v12 = [v8 sessionIsWaitingForAssistantData];

          if ((v12 & 1) == 0)
          {
            BOOL v13 = 1;
            goto LABEL_16;
          }
        }

        else
        {
        }
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v5);
  }

  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (void)resetWinningState
{
  self->_continueWithPreviousWinner = 0;
  -[ADSessionManager _resetWinningState](self, "_resetWinningState");
}

- (void)_resetWinningStateAndPurgeRequestMaps
{
}

- (void)resetSessionsIfRequiredBasedOnOrchestrationMode:(BOOL)a3
{
  int v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unsigned int v9 = "-[ADSessionManager resetSessionsIfRequiredBasedOnOrchestrationMode:]";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Are we running full understanding on device for siri session: %d",  (uint8_t *)&v8,  0x12u);
  }

  int preferredRemoteSessionType = self->_preferredRemoteSessionType;
  if (preferredRemoteSessionType != v3)
  {
    uint64_t v7 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      unsigned int v9 = "-[ADSessionManager resetSessionsIfRequiredBasedOnOrchestrationMode:]";
      __int16 v10 = 1024;
      int v11 = preferredRemoteSessionType;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Changing from session type=%d to session type=%d",  (uint8_t *)&v8,  0x18u);
    }

    self->_int preferredRemoteSessionType = v3;
    -[ADSessionManager cancelSynchronously](self, "cancelSynchronously");
    -[ADSessionManager preheatSessions](self, "preheatSessions");
  }

- (void)sendRemoteGizmoDeviceToServer:(id)a3
{
  id v4 = a3;
  if (self->_state <= 1) {
    -[ADSessionManager _startSessions:](self, "_startSessions:", 0LL);
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = self->_sessions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned int v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "sendRemoteGizmoDeviceToServer:",  v4,  (void)v10);
        unsigned int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (BOOL)assistantSessionShouldPrewarmConnetion:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interceptor);
  char v4 = [WeakRetained isInterceptingCommands] ^ 1;

  return v4;
}

- (void)assistantSessionWillStartConnection:(id)a3
{
  char v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADSessionManager assistantSessionWillStartConnection:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Session will start connection",  (uint8_t *)&v6,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManagerRequestsObservingCallState:self];
}

- (void)assistantSession:(id)a3 didOpenConnectionWithPolicyId:(id)a4 routeId:(id)a5 connectionDelay:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int128 v12 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    __int128 v13 = v12;
    *(_DWORD *)buf = 136315394;
    id v29 = "-[ADSessionManager assistantSession:didOpenConnectionWithPolicyId:routeId:connectionDelay:]";
    __int16 v30 = 1024;
    unsigned int v31 = [v9 sessionType];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Session did open connection with type %d",  buf,  0x12u);
  }

  if (self->_state <= 2)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v14 = self->_sessions;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v15)
    {
      id v16 = v15;
      __int128 v17 = 0LL;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v14);
          }
          v17 += objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)i),  "sessionIsActive",  (void)v23);
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      }

      while (v16);

      if (v17 && v17 == -[NSMutableArray count](self->_sessions, "count"))
      {
        id v20 = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v29 = "-[ADSessionManager assistantSession:didOpenConnectionWithPolicyId:routeId:connectionDelay:]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s All sessions active now.", buf, 0xCu);
        }

        self->_int64_t state = 3LL;
      }
    }

    else
    {
    }

    -[ADSessionManager _registerForSleepNotification](self, "_registerForSleepNotification", (void)v23);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assistantSessionManagerConnectionDidBecomeActive:self];
  }

  lastSessionError = self->_lastSessionError;
  self->_lastSessionError = 0LL;
}

- (void)assistantSession:(id)a3 receivedCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[ADSessionManager _reverseMapSessionRequestIdToADRequestId:forSession:]( self,  "_reverseMapSessionRequestIdToADRequestId:forSession:",  v7,  v6);
  if (!self->_requestId) {
    goto LABEL_20;
  }
  if (-[ADSessionManager _isDestructive:](self, "_isDestructive:", v7))
  {
    -[ADSessionManager _logCommandToMetrics:forSession:outbound:]( self,  "_logCommandToMetrics:forSession:outbound:",  v7,  v6,  0LL);
    p_winningSessionId = &self->_winningSessionId;
    if (!self->_winningSessionId)
    {
      if ((unint64_t)-[NSMutableArray count](self->_sessions, "count") >= 2)
      {
        id v24 = 0LL;
        unsigned int v9 = -[ADSessionManager _haveUsefulness:usefulnessScore:](self, "_haveUsefulness:usefulnessScore:", v7, &v24);
        id WeakRetained = (SACommandFailed *)v24;
        if (v9) {
          [v6 setOrUpdateUsefulnessScore:WeakRetained];
        }
        -[ADSessionManager _queueResultObject:forSession:](self, "_queueResultObject:forSession:", v7, v6);
        goto LABEL_21;
      }

      uint64_t v18 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v19 = v18;
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionId]);
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedClassName]);
        *(_DWORD *)buf = 136315650;
        __int128 v26 = "-[ADSessionManager assistantSession:receivedCommand:]";
        __int16 v27 = 2112;
        __int128 v28 = v20;
        __int16 v29 = 2112;
        __int16 v30 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Session %@ wins with command %@",  buf,  0x20u);
      }

      int v22 = (void *)objc_claimAutoreleasedReturnValue([v6 _adSessionTypeString]);
      -[ADSessionManager _logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:]( self,  "_logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:",  v22,  @"defaultSessionHasResults",  0LL,  0LL);

      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 refId]);
      -[ADSessionManager _cancelOtherSessionRequests:forRefId:](self, "_cancelOtherSessionRequests:forRefId:", v6, v23);

LABEL_20:
      id WeakRetained = (SACommandFailed *)objc_loadWeakRetained((id *)&self->_delegate);
      -[SACommandFailed assistantSessionManager:receivedCommand:]( WeakRetained,  "assistantSessionManager:receivedCommand:",  self,  v7);
LABEL_21:

      goto LABEL_22;
    }
  }

  else
  {
    p_winningSessionId = &self->_winningSessionId;
    if (!self->_winningSessionId) {
      goto LABEL_20;
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedClassName]);
  unsigned int v12 = -[ADSessionManager _allowWhitelistedCommands:](self, "_allowWhitelistedCommands:", v11);

  if (v12) {
    goto LABEL_20;
  }
  __int128 v13 = *p_winningSessionId;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionId]);
  LODWORD(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

  if ((_DWORD)v13) {
    goto LABEL_20;
  }
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v26 = "-[ADSessionManager assistantSession:receivedCommand:]";
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Dropping command not from winning session.",  buf,  0xCu);
  }

  if (objc_msgSend(v7, "ad_requiresResponse"))
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v26 = "-[ADSessionManager assistantSession:receivedCommand:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Sending CommandFailed as command required response.",  buf,  0xCu);
    }

    id WeakRetained = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Session Lost");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);
    -[SACommandFailed setRefId:](WeakRetained, "setRefId:", v17);

    -[ADSessionManager sendCommand:opportunistically:logEvent:]( self,  "sendCommand:opportunistically:logEvent:",  WeakRetained,  0LL,  0LL);
    goto LABEL_21;
  }

- (void)assistantSession:(id)a3 cannotHandleRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 refId]);
  if (v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", v11, v8));
    if (v12) {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_reverseProxiedIdMap, "valueForKey:", v12));
    }
    else {
      __int128 v13 = 0LL;
    }
  }

  else
  {
    __int128 v13 = 0LL;
    unsigned int v12 = 0LL;
  }

  if (![v13 isEqualToString:self->_requestId])
  {
    id WeakRetained = (NSError *)objc_loadWeakRetained((id *)&self->_delegate);
    -[NSError assistantSessionManager:receivedCommand:]( WeakRetained,  "assistantSessionManager:receivedCommand:",  self,  v9);
    goto LABEL_19;
  }

  [v8 setHasActiveRequest:0];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionId]);
  unsigned int v15 = [v14 isEqualToString:self->_winningSessionId];

  if (!v15)
  {
    if (-[ADSessionManager _hasAtleastOneActiveSessionBesides:](self, "_hasAtleastOneActiveSessionBesides:", v8))
    {
      -[ADSessionManager _pickDefaultWinnerWithDroppingSession:](self, "_pickDefaultWinnerWithDroppingSession:", v8);
      [v8 setCanHandleRequest:0];
      goto LABEL_20;
    }

    uint64_t v18 = (NSError *)v10;
    if (!v18)
    {
      lastSessionError = self->_lastSessionError;
      if (lastSessionError) {
        id v20 = lastSessionError;
      }
      else {
        id v20 = (NSError *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 2001LL));
      }
      uint64_t v18 = v20;
    }

    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 _adSessionTypeString]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000D909C;
    v22[3] = &unk_1004FD968;
    v22[4] = self;
    __int128 v23 = v18;
    id WeakRetained = v18;
    -[ADSessionManager _logMetricsForSessionFailure:withError:completion:]( self,  "_logMetricsForSessionFailure:withError:completion:",  v21,  WeakRetained,  v22);

LABEL_19:
    goto LABEL_20;
  }

  id v16 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v25 = "-[ADSessionManager assistantSession:cannotHandleRequest:error:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Ignoring as the winner has been chosen already.",  buf,  0xCu);
  }

- (void)assistantSession:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_winningSessionId;
  if (!self->_hasActiveRequest
    && (![v8 sessionType] || objc_msgSend(v8, "sessionType") == 1))
  {
LABEL_13:
    if (v5 || !self->_hasActiveRequest)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assistantSessionManager:self receivedError:v9 isRetryableError:v5];
    }

    else
    {
      objc_storeStrong((id *)&self->_lastSessionError, a4);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000D9058;
      v18[3] = &unk_1004FC188;
      v18[4] = self;
      id v19 = v9;
      BOOL v20 = v5;
      -[ADSessionManager _logMetricsForSessionFailure:withError:completion:]( self,  "_logMetricsForSessionFailure:withError:completion:",  @"all",  v19,  v18);
    }

    goto LABEL_23;
  }

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionId]);
    unsigned int v12 = [v11 isEqualToString:v10];

    if (v12)
    {
      -[ADSessionManager _resetWinningState](self, "_resetWinningState");
      goto LABEL_13;
    }
  }

  if (!-[ADSessionManager _hasAtleastOneActiveSessionBesides:](self, "_hasAtleastOneActiveSessionBesides:", v8)) {
    goto LABEL_13;
  }
  __int128 v13 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v22 = "-[ADSessionManager assistantSession:receivedError:isRetryableError:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 1024;
    BOOL v26 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Session received error but other active sessions present. Ignoring error %@ %d",  buf,  0x1Cu);
  }

  id v14 = [v8 dequeueResultObjects];
  if (v5)
  {
    if (self->_requestId)
    {
      [v8 prepareForRetry];
      [v8 startRetry];
    }
  }

  else
  {
    objc_storeStrong((id *)&self->_lastSessionError, a4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 _adSessionTypeString]);
    -[ADSessionManager _logMetricsForSessionFailure:withError:completion:]( self,  "_logMetricsForSessionFailure:withError:completion:",  v16,  v9,  0LL);
  }

  if (self->_hasActiveRequest)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 assistantSessionManager:self didObserverIntermediateError:v9];
  }

- (void)assistantSession:(id)a3 receivedIntermediateError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSessionManager:self didObserverIntermediateError:v6];
}

- (BOOL)assistantSessionShouldLogVisibleRequestFailure:(id)a3 forError:(id)a4
{
  id v6 = a4;
  if (-[ADSessionManager _hasAtleastOneActiveSessionBesides:](self, "_hasAtleastOneActiveSessionBesides:", a3))
  {
    LOBYTE(v7) = 0;
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      unsigned int v12 = "-[ADSessionManager assistantSessionShouldLogVisibleRequestFailure:forError:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Session log visible request failure",  (uint8_t *)&v11,  0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v7 = [WeakRetained assistantSessionManager:self shouldLogVisibleRequestFailureForError:v6] ^ 1;
  }

  return v7;
}

- (BOOL)assistantSessionShouldRestartConnectionOnWiFi:(id)a3
{
  return self->_hasClient && !self->_callInProcess;
}

- (void)assistantSessionConnectionDidReset:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 _adSessionTypeString]);
    int v10 = 136315394;
    int v11 = "-[ADSessionManager assistantSessionConnectionDidReset:]";
    __int16 v12 = 2112;
    __int128 v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Session %@ connection did reset",  (uint8_t *)&v10,  0x16u);
  }

  if (![v4 sessionType] || objc_msgSend(v4, "sessionType") == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assistantSessionManagerSessionRemoteConnectionDidReset:self];
  }

  if (!-[ADSessionManager _hasAtleastOneActiveSessionBesides:](self, "_hasAtleastOneActiveSessionBesides:", v4))
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantSessionManagerSessionConnectionDidReset:self];
  }
}

- (BOOL)assistantSessionShouldAttemptRetry:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADSessionManager assistantSessionShouldAttemptRetry:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Session should attempt retry",  (uint8_t *)&v8,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v6 = [WeakRetained assistantSessionManagerShouldAttemptRetry:self];

  return v6;
}

- (id)assistantSessionCommandsToRestoreStateOnNewConnection:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained assistantSessionManagerCommandsToRestoreStateOnNewConnection:self]);

  return v5;
}

- (void)assistantSession:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5
{
  id v8 = a3;
  id v9 = (NSMutableDictionary *)a4;
  id v10 = a5;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", v9, v8));
  __int16 v12 = self->_requestId;
  __int128 v13 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315906;
    __int16 v23 = "-[ADSessionManager assistantSession:didChangeRequestIdFrom:toId:]";
    __int16 v24 = 2112;
    __int16 v25 = (NSMutableDictionary *)v12;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Request Id is %@ and oldSessionRequestId is %@ newSessionRequestId is %@",  (uint8_t *)&v22,  0x2Au);
  }

  if (v12)
  {
    proxiedIdMap = self->_proxiedIdMap;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", v12, v8));
    -[NSMutableDictionary setObject:forKey:](proxiedIdMap, "setObject:forKey:", v10, v15);

    -[NSMutableDictionary removeObjectForKey:](self->_reverseProxiedIdMap, "removeObjectForKey:", v11);
    reverseProxiedIdMap = self->_reverseProxiedIdMap;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", v10, v8));
    -[NSMutableDictionary setObject:forKey:](reverseProxiedIdMap, "setObject:forKey:", v12, v17);

    id v18 = [v8 dequeueResultObjects];
    id v19 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      BOOL v20 = self->_proxiedIdMap;
      __int16 v21 = self->_reverseProxiedIdMap;
      int v22 = 136315650;
      __int16 v23 = "-[ADSessionManager assistantSession:didChangeRequestIdFrom:toId:]";
      __int16 v24 = 2112;
      __int16 v25 = v20;
      __int16 v26 = 2112;
      __int16 v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Proxied map is %@ reverse Proxied map is %@",  (uint8_t *)&v22,  0x20u);
    }
  }
}

- (void)assistantSessionDidCreateAssistant:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    unsigned int v7 = "-[ADSessionManager assistantSessionDidCreateAssistant:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Session did create assistant",  (uint8_t *)&v6,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManagerDidCreateAssistant:self];
}

- (void)assistantSessionDidDestroyAssistant:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManagerDidDestroyAssistant:self];
}

- (void)assistantSession:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManager:self didLoadAssistantSyncRequested:v4];
}

- (void)assistantSession:(id)a3 willRetryOnError:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADSessionManager assistantSession:willRetryOnError:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Session will retry on error",  (uint8_t *)&v8,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManager:self willRetryOnError:v5];
}

- (void)assistantSession:(id)a3 beginSessionRetryPreferringWWAN:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 sessionType] || objc_msgSend(v6, "sessionType") == 1)
  {
    unsigned int v7 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADSessionManager assistantSession:beginSessionRetryPreferringWWAN:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Session begin retry preferring WWAN",  (uint8_t *)&v9,  0xCu);
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager aggregator](self, "aggregator"));
    [v8 beginSessionRetryPreferringWWAN:v4];
  }
}

- (void)assistantSessionRetryingRequest:(id)a3
{
  id v5 = a3;
  if (![v5 sessionType] || objc_msgSend(v5, "sessionType") == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assistantSessionManagerRetryingRequestOnRemoteSession:self];
  }
}

- (void)assistantSessionConnectionDidClose:(id)a3
{
  if (!-[ADSessionManager _hasAtleastOneActiveSessionBesides:](self, "_hasAtleastOneActiveSessionBesides:", a3)) {
    -[ADSessionManager _unregisterForSleepNotification](self, "_unregisterForSleepNotification");
  }
}

- (BOOL)_filterUnsupportedCommands:(id)a3 inGroup:(id)a4 onSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_8;
  }
  if (![v9 isEqualToString:SASyncGroupIdentifier])
  {
    if ([v10 sessionType] == 1
      && (objc_msgSend(v8, "siriCore_supportedByRemoteLimitedSession") & 1) == 0)
    {
      currentRequest = self->_currentRequest;
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___SASStartSpeech);
      if ((objc_opt_isKindOfClass(currentRequest, v14) & 1) == 0)
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___SASStartSpeech);
        unsigned __int8 isKindOfClass = objc_opt_isKindOfClass(v8, v16);
        goto LABEL_4;
      }
    }

- (BOOL)_allowWhitelistedCommands:(id)a3
{
  uint64_t v3 = qword_100577CC8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100577CC8, &stru_1004F05B8);
  }
  unsigned __int8 v5 = [(id)qword_100577CD0 containsObject:v4];

  return v5;
}

- (void)_convertEmbeddedRequestIds:(id)a3 originalCommand:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "siriCore_requestId"));
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[ADSessionManager _mapADRequestIdToSessionRequestId:forSession:]( self,  "_mapADRequestIdToSessionRequestId:forSession:",  v10,  v9));
    if (v11)
    {
      char v12 = (void *)v11;
      __int128 v13 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        unsigned int v15 = "-[ADSessionManager _convertEmbeddedRequestIds:originalCommand:session:]";
        __int16 v16 = 2112;
        id v17 = v12;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Setting RequestId to %@",  (uint8_t *)&v14,  0x16u);
      }

      objc_msgSend(v8, "siriCore_setSessionRequestId:", v12);
    }
  }
}

- (void)handleCommand:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[ADSessionManager handleCommand:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Bounce back command is %@", buf, 0x16u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = self->_sessions;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      if (-[ADSessionManager _reverseMapSessionRequestIdToADRequestId:forSession:]( self,  "_reverseMapSessionRequestIdToADRequestId:forSession:",  v4,  *(void *)(*((void *)&v12 + 1) + 8 * v10),  (void)v12))
      {
        break;
      }

      if (v8 == (id)++v10)
      {
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManager:self receivedCommand:v4];
}

- (void)delegateDidHandleCommand:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  if (v5)
  {
    if (self->_serverSpeechRecognitionArrived)
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___SASSpeechRecognized);
      if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      {
        id v8 = (os_log_s *)AFSiriLogContextSession;
        uint64_t v6 = 1LL;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v24 = "-[ADSessionManager delegateDidHandleCommand:]";
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Final speech recognition arrived",  buf,  0xCu);
        }

        self->_serverSpeechRecognitionArrived = 1;
      }

      else
      {
        uint64_t v6 = 0LL;
      }
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v9 = self->_sessions;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          uint64_t v15 = objc_claimAutoreleasedReturnValue( -[ADSessionManager _mapADRequestIdToSessionRequestId:forSession:]( self,  "_mapADRequestIdToSessionRequestId:forSession:",  v5,  v14,  (void)v18));
          __int16 v16 = (void *)v15;
          if (v15) {
            id v17 = (void *)v15;
          }
          else {
            id v17 = v5;
          }
          [v14 delegateDidHandleCommand:v17 didRecognizeSpeech:v6];
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v11);
    }
  }
}

- (void)_sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5 doSendPreProcessing:(BOOL)a6 doSendPostProcessing:(BOOL)a7
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000D8838;
  v19[3] = &unk_1004FAF80;
  v19[4] = self;
  BOOL v21 = a4;
  id v11 = a3;
  id v20 = v11;
  BOOL v22 = a5;
  BOOL v23 = a6;
  BOOL v24 = a7;
  uint64_t v12 = objc_retainBlock(v19);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interceptor);
  if (WeakRetained
    && (id v14 = objc_loadWeakRetained((id *)&self->_interceptor),
        unsigned int v15 = [v14 isInterceptingCommands],
        v14,
        v15))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000D8EE8;
    v16[3] = &unk_1004F57D0;
    v16[4] = self;
    __int128 v18 = v12;
    id v17 = v11;
    [WeakRetained interceptCommand:v17 completion:v16];
  }

  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (void)setCurrentRequest:(id)a3
{
  id v4 = (SABaseCommand *)a3;
  unsigned __int8 v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    currentRequest = self->_currentRequest;
    int v8 = 136315650;
    uint64_t v9 = "-[ADSessionManager setCurrentRequest:]";
    __int16 v10 = 2112;
    id v11 = currentRequest;
    __int16 v12 = 2112;
    __int128 v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = self->_currentRequest;
  self->_currentRequest = v4;
}

- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5
{
}

- (void)sendRawCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5
{
}

- (void)setHasActiveRequest:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v32 = "-[ADSessionManager setHasActiveRequest:]";
    __int16 v33 = 1024;
    BOOL v34 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }

  self->_hasActiveRequest = v3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager aggregator](self, "aggregator"));
  [v6 setHasActiveRequest:v3];

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v7 = self->_sessions;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        [v12 setHasActiveRequest:v3];
        [v12 _resetSessionRequiresServerConnection];
        [v12 _resetSessionRequiresSync];
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v9);
  }

  if (v3)
  {
    -[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded](self, "_resetSessionOnRequestBoundaryIfNeeded");
    if (self->_state == 3)
    {
LABEL_23:
      id WeakRetained = (NSMutableArray *)objc_loadWeakRetained((id *)&self->_delegate);
      -[NSMutableArray assistantSessionManagerConnectionDidBecomeActive:]( WeakRetained,  "assistantSessionManagerConnectionDidBecomeActive:",  self);
    }

    else
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id WeakRetained = self->_sessions;
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( WeakRetained,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v22;
        while (2)
        {
          for (j = 0LL; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(WeakRetained);
            }
            if (objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)j),  "sessionIsActive",  (void)v21))
            {

              goto LABEL_23;
            }
          }

          id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( WeakRetained,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
  }

  else
  {
    -[ADSessionManager _resetResultObjectsTimer](self, "_resetResultObjectsTimer");
    self->_BOOL isQueuingResultsForDelayedEvaluation = 0;
    requestId = self->_requestId;
    self->_requestId = 0LL;

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
    [v19 setOrchestratorRequestId:0];

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
    [v20 setOrchestratorRequestId:0];

    -[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded](self, "_resetSessionOnRequestBoundaryIfNeeded");
  }

- (BOOL)hasSessionRequiringServerConnection
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  BOOL v3 = self->_sessions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v28,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (objc_msgSend(v8, "sessionRequiresServerConnection", (void)v18))
        {
LABEL_15:
          __int128 v13 = (void *)AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            id v14 = v13;
            id v15 = (NSString *)objc_claimAutoreleasedReturnValue([v8 sessionId]);
            requestId = self->_requestId;
            *(_DWORD *)buf = 136315650;
            __int128 v23 = "-[ADSessionManager hasSessionRequiringServerConnection]";
            __int16 v24 = 2112;
            __int128 v25 = v15;
            __int16 v26 = 2112;
            __int128 v27 = requestId;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Session with Id %@ needs server connection (requestId = %@).",  buf,  0x20u);
          }

          LOBYTE(v11) = 1;
          return v11;
        }

        if ([v8 sessionRequiresSync])
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _requestId]);
          if (v9)
          {
          }

          else if (!self->_requestId)
          {
            goto LABEL_15;
          }
        }
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v28,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = (os_log_s *)AFSiriLogContextSession;
  BOOL v11 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v11)
  {
    __int16 v12 = self->_requestId;
    *(_DWORD *)buf = 136315394;
    __int128 v23 = "-[ADSessionManager hasSessionRequiringServerConnection]";
    __int16 v24 = 2112;
    __int128 v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s No server connection needed (requestId = %@).",  buf,  0x16u);
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_addSession:(id)a3
{
  id v4 = a3;
  sessions = self->_sessions;
  id v8 = v4;
  if (!sessions)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_sessions;
    self->_sessions = v6;

    id v4 = v8;
    sessions = self->_sessions;
  }

  -[NSMutableArray addObject:](sessions, "addObject:", v4);
}

- (void)_clearSessions
{
  sessions = self->_sessions;
  if (sessions) {
    -[NSMutableArray removeAllObjects](sessions, "removeAllObjects");
  }
}

- (void)_setRequestId:(id)a3
{
}

- (id)acquireAssertionForReason:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[ADSessionManager acquireAssertionForReason:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = -[ADSessionAssertion initWithTimestamp:reason:]( objc_alloc(&OBJC_CLASS___ADSessionAssertion),  "initWithTimestamp:reason:",  mach_absolute_time(),  v4);
  -[NSMutableSet addObject:](self->_assertions, "addObject:", v6);

  return v6;
}

- (void)relinquishAssertion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[ADSessionManager relinquishAssertion:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s assertion = %@", (uint8_t *)&v6, 0x16u);
  }

  -[NSMutableSet removeObject:](self->_assertions, "removeObject:", v4);
  -[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded](self, "_resetSessionOnRequestBoundaryIfNeeded");
}

- (void)_resetSessionOnRequestBoundaryIfNeeded
{
  if (self->_hasActiveRequest)
  {
    BOOL v3 = (os_log_s *)AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
      return;
    }
    requestId = self->_requestId;
    *(_DWORD *)buf = 136315394;
    __int16 v30 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
    __int16 v31 = 2112;
    id v32 = requestId;
    id v5 = "%s Ignored because of active request (requestId = %@).";
    int v6 = v3;
    uint32_t v7 = 22;
    goto LABEL_4;
  }

  if (-[NSMutableSet count](self->_assertions, "count"))
  {
    __int16 v8 = (void *)AFSiriLogContextSession;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
    if (v9)
    {
      assertions = self->_assertions;
      id v11 = v8;
      *(_DWORD *)buf = 136315394;
      __int16 v30 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
      __int16 v31 = 2048;
      id v32 = (NSString *)-[NSMutableSet count](assertions, "count");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Ignored because %tu assertions.", buf, 0x16u);
    }

    if (AFIsInternalInstall(v9))
    {
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int16 v12 = self->_assertions;
      id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = (os_log_s *)AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
            {
              __int128 v18 = *(NSString **)(*((void *)&v24 + 1) + 8LL * (void)v16);
              *(_DWORD *)buf = 136315394;
              __int16 v30 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
              __int16 v31 = 2112;
              id v32 = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s     %@", buf, 0x16u);
            }

            uint64_t v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
        }

        while (v14);
      }
    }
  }

  else if (self->_needsResetOnRequestBoundary)
  {
    self->_needsResetOnRequestBoundary = 0;
    __int128 v19 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Resetting Sessions at Request Boundary",  buf,  0xCu);
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v20 logEventWithType:925 context:0];

    id sessionResetOnRequestBoundaryCompletion = (void (**)(void))self->_sessionResetOnRequestBoundaryCompletion;
    if (sessionResetOnRequestBoundaryCompletion)
    {
      sessionResetOnRequestBoundaryCompletion[2]();
      id v22 = self->_sessionResetOnRequestBoundaryCompletion;
    }

    else
    {
      id v22 = 0LL;
    }

    self->_id sessionResetOnRequestBoundaryCompletion = 0LL;

    -[ADSessionManager _resetSessionsAndMakeQuiet:](self, "_resetSessionsAndMakeQuiet:", 0LL);
  }

  else
  {
    __int128 v23 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
      id v5 = "%s Ignored because there's no need.";
      int v6 = v23;
      uint32_t v7 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
    }
  }

- (void)setRequestId:(id)a3
{
  p_requestId = &self->_requestId;
  v55 = (NSString *)a3;
  if (*p_requestId != v55)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
    unsigned __int8 v7 = [v6 isNetIdAvailable];

    if ((v7 & 1) == 0)
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
      [v8 resetNetId];

      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
      [v9 increaseSequenceNumber];
    }

    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
    unsigned __int8 v11 = [v10 isNetIdAvailable];

    if ((v11 & 1) == 0)
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
      [v12 resetNetId];

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
      [v13 increaseSequenceNumber];
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
    [v14 setOrchestratorRequestId:v55];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
    [v15 setOrchestratorRequestId:v55];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
    [v16 logRequestLinkBetweenOrchestratorAndNetworkComponent];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
    [v17 logRequestLinkBetweenOrchestratorAndNetworkComponent];

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics]( &OBJC_CLASS___SiriCoreNetworkingAnalytics,  "sharedSiriCoreNetworkingAnalytics"));
    [v18 setNetIdAvailable:0];

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkAnalytics sharedSNNetworkAnalytics]( &OBJC_CLASS___SNNetworkAnalytics,  "sharedSNNetworkAnalytics"));
    [v19 setNetIdAvailable:0];

    v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)&self->_requestId, a3);
    if (!self->_proxiedIdMap)
    {
      __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      proxiedIdMap = self->_proxiedIdMap;
      self->_proxiedIdMap = v20;
    }

    if (!self->_reverseProxiedIdMap)
    {
      id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      reverseProxiedIdMap = self->_reverseProxiedIdMap;
      self->_reverseProxiedIdMap = v22;
    }

    sessionOriginatedCommandTable = self->_sessionOriginatedCommandTable;
    if (sessionOriginatedCommandTable) {
      -[NSMutableDictionary removeAllObjects](sessionOriginatedCommandTable, "removeAllObjects");
    }
    if (*p_requestId)
    {
      -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v55, @"originalRequestId");
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      obj = self->_sessions;
      id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  v75,  16LL);
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v61;
        do
        {
          __int128 v28 = 0LL;
          do
          {
            if (*(void *)v61 != v27) {
              objc_enumerationMutation(obj);
            }
            id v29 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)v28);
            uint64_t v30 = SiriCoreUUIDStringCreate(v25);
            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            [v29 _setRequestId:v31];
            id v32 = self->_proxiedIdMap;
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionManager _keyForRequestId:forSession:]( self,  "_keyForRequestId:forSession:",  v55,  v29));
            -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v31, v33);

            BOOL v34 = self->_reverseProxiedIdMap;
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionManager _keyForRequestId:forSession:]( self,  "_keyForRequestId:forSession:",  v31,  v29));
            -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v55, v35);

            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v29 _adSessionTypeString]);
            __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@SessionProxyId",  v36));

            -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v31, v37);
            id v38 = [v29 dequeueResultObjects];
            [v29 setHasActiveRequest:1];
            __int128 v39 = (void *)AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v40 = v39;
              __int128 v41 = (NSString *)objc_claimAutoreleasedReturnValue([v29 _adSessionTypeString]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionId]);
              *(_DWORD *)buf = 136316162;
              __int128 v66 = "-[ADSessionManager setRequestId:]";
              __int16 v67 = 2112;
              __int128 v68 = v55;
              __int16 v69 = 2112;
              v70 = v41;
              __int16 v71 = 2112;
              __int16 v72 = v42;
              __int16 v73 = 2112;
              __int16 v74 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s Request Id %@ for %@ session with Id %@ has proxied request Id %@",  buf,  0x34u);
            }

            __int128 v28 = (char *)v28 + 1;
          }

          while (v26 != v28);
          id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v60,  v75,  16LL);
          id v26 = v25;
        }

        while (v25);
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v43 logEventWithType:918 context:v54];
    }

    -[ADSessionManager _resetWinningState](self, "_resetWinningState");
    winningSessionId = self->_winningSessionId;
    if (winningSessionId)
    {
      __int16 v45 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v66 = "-[ADSessionManager setRequestId:]";
        __int16 v67 = 2112;
        __int128 v68 = winningSessionId;
        __int16 v69 = 2112;
        v70 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s Previous winner session %@ reused for current request %@",  buf,  0x20u);
      }

      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      v46 = self->_sessions;
      id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v56,  v64,  16LL);
      if (v47)
      {
        uint64_t v48 = *(void *)v57;
        while (2)
        {
          for (i = 0LL; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v57 != v48) {
              objc_enumerationMutation(v46);
            }
            v50 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
            int v51 = self->_winningSessionId;
            v52 = (void *)objc_claimAutoreleasedReturnValue([v50 sessionId]);
            LODWORD(v51) = -[NSString isEqualToString:](v51, "isEqualToString:", v52);

            if ((_DWORD)v51)
            {
              id v47 = (id)objc_claimAutoreleasedReturnValue([v50 _adSessionTypeString]);
              goto LABEL_36;
            }
          }

          id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v56,  v64,  16LL);
          if (v47) {
            continue;
          }
          break;
        }
      }

- (id)sessionRequestIdForRefId:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_sessions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = objc_claimAutoreleasedReturnValue( -[ADSessionManager _keyForRequestId:forSession:]( self,  "_keyForRequestId:forSession:",  v4,  *(void *)(*((void *)&v14 + 1) + 8 * v9),  (void)v14));
      if (v10)
      {
        unsigned __int8 v11 = (void *)v10;
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_proxiedIdMap, "valueForKey:", v10));

        if (v12) {
          break;
        }
      }

      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    __int16 v12 = 0LL;
  }

  return v12;
}

- (void)_registerForCompanionMessages
{
  uint64_t v3 = AFIsInternalInstall(self);
  if ((_DWORD)v3)
  {
    if (AFIsHorseman(v3, v4))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v5 setMessageHandler:self forMessageType:@"com.apple.siridebug.command.set.tvos.siri.hostname.prod"];

      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v6 setMessageHandler:self forMessageType:@"com.apple.siridebug.command.set.tvos.siri.hostname.carry"];

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v7 setMessageHandler:self forMessageType:@"com.apple.siridebug.command.set.tvos.siri.hostname.seed"];

      id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v8 setMessageHandler:self forMessageType:@"com.apple.siridebug.command.get.tvos.siri.hostname"];
    }
  }

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D86E8;
  block[3] = &unk_1004FCBB0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a6;
  uint64_t v14 = AFIsInternalInstall(v13);
  if ((_DWORD)v14 && (AFIsHorseman(v14, v15) & 1) != 0)
  {
    id v16 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      instanceContext = self->_instanceContext;
      if (!instanceContext)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]"));
        [v43 handleFailureInFunction:v44, @"ADSessionManager.m", 1733, @"Invalid parameter not satisfying: %@", @"_instanceContext != nil" file lineNumber description];

        instanceContext = self->_instanceContext;
      }

      unsigned int v18 = -[AFInstanceContext isEndpoint](instanceContext, "isEndpoint");
      *(_DWORD *)buf = 136316162;
      v54 = "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int128 v19 = @"Hub";
      __int16 v55 = 2112;
      id v56 = v10;
      if (v18) {
        __int128 v19 = @"Remora";
      }
      __int16 v57 = 2112;
      id v58 = v11;
      __int16 v59 = 2112;
      id v60 = v12;
      __int16 v61 = 2112;
      __int128 v62 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Received message %@ of type %@ from device %@. Handling device is %@",  buf,  0x34u);
    }

    if (![v11 isEqualToString:@"com.apple.siridebug.command.get.tvos.siri.hostname"])
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _rapportMessageTypeToHostName:](self, "_rapportMessageTypeToHostName:", v11));
      if (v21)
      {
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount hostname](self->_account, "hostname"));
        unsigned __int8 v25 = [v21 isEqualToString:v24];

        id v26 = (os_log_s *)AFSiriLogContextSession;
        BOOL v27 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
        if ((v25 & 1) != 0)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136315138;
            v54 = "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Ignoring hostname override.",  buf,  0xCu);
          }
        }

        else
        {
          if (v27)
          {
            account = self->_account;
            __int16 v31 = v26;
            id v32 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount hostname](account, "hostname"));
            *(_DWORD *)buf = 136315650;
            v54 = "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
            __int16 v55 = 2112;
            id v56 = v32;
            __int16 v57 = 2112;
            id v58 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s Overriding hostname %@->%@",  buf,  0x20u);
          }

          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
          [v33 setServerOverride:v21];

          -[ADAccount clearAssistantDataDuringForcedRedirect](self->_account, "clearAssistantDataDuringForcedRedirect");
          -[ADAccount save](self->_account, "save");
          BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));

          if (!v34)
          {
            id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]"));
            [v47 handleFailureInFunction:v48, @"ADSessionManager.m", 1759, @"Invalid parameter not satisfying: %@", @"[AFInstanceContext currentContext] != nil" file lineNumber description];
          }

          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
          unsigned __int8 v36 = [v35 isEndpoint];

          if ((v36 & 1) == 0) {
            -[ADSessionManager _updateRemoraHostname:messageType:](self, "_updateRemoraHostname:messageType:", v10, v11);
          }
        }

        if (!v13) {
          goto LABEL_38;
        }
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _getActiveEnvironmentName](self, "_getActiveEnvironmentName"));
        v49 = @"hostname";
        v50 = v22;
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
        v13[2](v13, v37, 0LL);

        id v38 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
        if (!v38)
        {
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]"));
          [v45 handleFailureInFunction:v46, @"ADSessionManager.m", 1772, @"Invalid parameter not satisfying: %@", @"[AFInstanceContext currentContext] != nil" file lineNumber description];
        }

        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
        unsigned __int8 v40 = [v39 isEndpoint];

        if ((v40 & 1) == 0)
        {
          dispatch_time_t v41 = dispatch_time(0LL, 2000000000LL);
          dispatch_after(v41, &_dispatch_main_q, &stru_1004F05D8);
        }

        goto LABEL_37;
      }

      __int128 v28 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
        __int16 v55 = 2112;
        id v56 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Received message from unknown message type: %@",  buf,  0x16u);
        if (!v13) {
          goto LABEL_38;
        }
      }

      else if (!v13)
      {
LABEL_38:

        goto LABEL_39;
      }

      uint64_t v29 = 1004LL;
      goto LABEL_36;
    }

    if (v13)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[ADSessionManager _getActiveEnvironmentName](self, "_getActiveEnvironmentName"));
      id v21 = (void *)v20;
      if (v20)
      {
        int v51 = @"hostname";
        uint64_t v52 = v20;
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
        v13[2](v13, v22, 0LL);
LABEL_37:

        goto LABEL_38;
      }

      v42 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s Invalid Environment", buf, 0xCu);
      }

      uint64_t v29 = 25LL;
LABEL_36:
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v29));
      ((void (**)(id, void *, void *))v13)[2](v13, 0LL, v22);
      goto LABEL_37;
    }
  }

  else
  {
    id v23 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "-[ADSessionManager _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2112;
      id v58 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Ignore rapport message %@ of type %@",  buf,  0x20u);
    }
  }

- (void)_updateRemoraHostname:(id)a3 messageType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_group_t v7 = dispatch_group_create();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000D82A4;
  v14[3] = &unk_1004F0600;
  uint64_t v9 = v7;
  uint64_t v15 = v9;
  id v10 = v5;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  [v8 fetchActiveAccessoryIdsWithCompletion:v14];

  dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_group_wait(v9, v12))
  {
    id v13 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v19 = "-[ADSessionManager _updateRemoraHostname:messageType:]";
      __int16 v20 = 2048;
      uint64_t v21 = 0x4014000000000000LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Operation timed out after waiting %f secs",  buf,  0x16u);
    }
  }
}

- (id)_getActiveEnvironmentName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeAccountIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount accountForIdentifier:](&OBJC_CLASS___ADAccount, "accountForIdentifier:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hostname]);

  dispatch_group_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _hostNameToEnvironmentName:](self, "_hostNameToEnvironmentName:", v6));
  id v8 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "-[ADSessionManager _getActiveEnvironmentName]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s fetched active hostname %@. Resolved environment %@",  (uint8_t *)&v10,  0x20u);
  }

  return v7;
}

- (id)_rapportMessageTypeToHostName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.siridebug.command.set.tvos.siri.hostname.prod"])
  {
    uint64_t v4 = off_1004F0620;
  }

  else if ([v3 isEqualToString:@"com.apple.siridebug.command.set.tvos.siri.hostname.carry"])
  {
    uint64_t v4 = off_1004F0628;
  }

  else
  {
    if (![v3 isEqualToString:@"com.apple.siridebug.command.set.tvos.siri.hostname.seed"])
    {
      id v5 = 0LL;
      goto LABEL_8;
    }

    uint64_t v4 = &off_1004F0630;
  }

  id v5 = *v4;
LABEL_8:

  return v5;
}

- (id)_hostNameToEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"https://guzzoni.apple.com"])
  {
    uint64_t v4 = @"Prod";
  }

  else if ([v3 isEqualToString:@"https://seed.siri.apple.com"])
  {
    uint64_t v4 = @"Seed";
  }

  else if ([v3 isEqualToString:@"https://carry.siri.apple.com"])
  {
    uint64_t v4 = @"Carry";
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (id)v4;
}

- (id)aggregator
{
  aggregator = self->_aggregator;
  if (!aggregator)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___AFAggregator);
    id v5 = self->_aggregator;
    self->_aggregator = v4;

    aggregator = self->_aggregator;
  }

  return aggregator;
}

- (void)updateConnectionDidDropAggdMetrics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionManager aggregator](self, "aggregator"));
  [v2 connectionDidDrop];
}

- (void)updateConnectionDidFailAggdMetrics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionManager aggregator](self, "aggregator"));
  [v2 connectionDidFail];
}

- (void)updateConnectionSetConnectionType:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionManager aggregator](self, "aggregator"));
  [v4 setConnectionType:a3];
}

- (void)getConnectionMetrics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = self->_sessions;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (![v11 sessionType] || objc_msgSend(v11, "sessionType") == 1)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472LL;
            v12[2] = sub_1000D8174;
            v12[3] = &unk_1004FC770;
            id v13 = v5;
            __int16 v14 = v11;
            id v15 = v4;
            [v11 getConnectionMetrics:v12];

            goto LABEL_13;
          }
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v8) {
          continue;
        }
        break;
      }
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
LABEL_13:
  }
}

- (void)getSNConnectionMetrics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = self->_sessions;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (![v11 sessionType] || objc_msgSend(v11, "sessionType") == 1)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472LL;
            v12[2] = sub_1000D8044;
            v12[3] = &unk_1004FC770;
            id v13 = v5;
            __int16 v14 = v11;
            id v15 = v4;
            [v11 getSNConnectionMetrics:v12];

            goto LABEL_13;
          }
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v8) {
          continue;
        }
        break;
      }
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
LABEL_13:
  }
}

- (void)_logCommandToMetrics:(id)a3 forSession:(id)a4 outbound:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend(v8, "ad_shouldLogToMetrics"))
  {
    uint64_t v10 = mach_absolute_time();
    if (v5) {
      uint64_t v11 = 1200LL;
    }
    else {
      uint64_t v11 = 1100LL;
    }
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 aceId]);
    id v13 = [v12 copy];

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
    id v15 = [v14 copy];

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ad_deferredMetricsContext"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000D7EFC;
    v47[3] = &unk_1004F0640;
    uint64_t v52 = v10;
    id v18 = v13;
    id v48 = v18;
    id v46 = v15;
    id v49 = v46;
    id v50 = v9;
    id v45 = v16;
    id v51 = v45;
    [(id)v17 logEventWithType:v11 machAbsoluteTime:v10 contextProvider:v47 contextProvidingQueue:0];

    currentRequest = self->_currentRequest;
    requestId = self->_requestId;
    id v21 = v8;
    id v22 = currentRequest;
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___SASStartSpeechDictation);
    LOBYTE(v17) = objc_opt_isKindOfClass(v22, v23);

    if ((v17 & 1) != 0
      || (uint64_t v24 = objc_opt_class(&OBJC_CLASS___SASStartSpeechDictation),
          uint64_t isKindOfClass = objc_opt_isKindOfClass(v21, v24),
          !requestId)
      || (isKindOfClass & 1) != 0)
    {
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }

    if (AFIsHorseman(isKindOfClass, v26))
    {
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v21 encodedClassName]);
      if (([v27 isEqual:@"ExecuteOnRemoteRequest"] & 1) == 0
        && ![v27 isEqual:@"StartHandoffRequest"])
      {
        unsigned __int8 v42 = [v27 isEqual:@"InitiateHandoffOnCompanion"];

        if ((v42 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_13;
      }
    }

LABEL_13:
    __int128 v28 = self->_requestId;
    id v21 = (id)objc_claimAutoreleasedReturnValue([v21 encodedClassName]);
    uint64_t v29 = v28;
    id v30 = v18;
    id v31 = sub_1000D7FD8(v29);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (v32)
    {
      v44 = v29;
      if (v5) {
        uint64_t v33 = 4LL;
      }
      else {
        uint64_t v33 = 3LL;
      }
      id v34 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHClientEvent);
      id v35 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHClientEventMetadata);
      [v35 setRequestId:v32];
      [v34 setEventMetadata:v35];
      v43 = v32;
      id v36 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHAceCommandContext);
      id v37 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHAceCommandStarted);
      [v37 setAceCommandType:v33];
      [v37 setAceCommandName:v21];
      [v36 setStartedOrChanged:v37];
      id v38 = sub_1000D7FD8(v30);
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      [v36 setAceId:v39];

      [v34 setAceCommandContext:v36];
      unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
      [v40 emitMessage:v34];

      uint64_t v29 = v44;
      id v32 = v43;
    }

    else
    {
      dispatch_time_t v41 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "_EmitAceCommandStartedEvent";
        __int16 v55 = 2112;
        id v56 = v29;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s The requestId=%@ is malformed, unable to log SELF command",  buf,  0x16u);
      }
    }

    goto LABEL_21;
  }

- (void)_logMetricsForSessionFailure:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000D7708;
  v26[3] = &unk_1004F9A30;
  id v12 = v8;
  id v27 = v12;
  id v13 = v9;
  id v28 = v13;
  [v11 logEventWithType:921 contextProvider:v26 contextProvidingQueue:0];

  if (([v12 isEqualToString:@"local"] & 1) != 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        unsigned __int8 v15 = [WeakRetained assistantSessionManager:self shouldLogVisibleRequestFailureForError:v13],  WeakRetained,  (v15 & 1) == 0))
  {
    if (v10) {
      v10[2](v10);
    }
  }

  else
  {
    __int128 v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000D77DC;
    v24[3] = &unk_1004FDAA8;
    uint64_t v17 = v16;
    unsigned __int8 v25 = v17;
    -[ADSessionManager getConnectionMetrics:](self, "getConnectionMetrics:", v24);
    dispatch_group_enter(v17);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000D7BCC;
    v22[3] = &unk_1004FDAA8;
    uint64_t v23 = v17;
    id v18 = v17;
    -[ADSessionManager getSNConnectionMetrics:](self, "getSNConnectionMetrics:", v22);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D7E60;
    block[3] = &unk_1004FC838;
    id v21 = v10;
    dispatch_group_notify(v18, queue, block);
  }
}

- (void)setAWDRequestRecordMetrics:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_awdRequestRecord, a3);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = self->_sessions;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "setAWDRequestRecord:", v5, (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 1;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = self->_sessions;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
  __int128 v13 = v4;
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v9);
        dispatch_group_enter(v5);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000D7650;
        v17[3] = &unk_1004F0690;
        v17[4] = self;
        __int128 v19 = v24;
        id v18 = v5;
        [v10 barrier:v17];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v20,  v26,  16LL);
    }

    while (v7);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D76D4;
  block[3] = &unk_1004FC1D8;
  id v15 = v13;
  __int128 v16 = v24;
  id v12 = v13;
  dispatch_group_notify(v5, queue, block);

  _Block_object_dispose(v24, 8);
}

- (BOOL)hasClient
{
  return self->_hasClient;
}

- (void)setHasClient:(BOOL)a3
{
  self->_hasClient = a3;
}

- (void)refreshValidationData
{
  if (self->_state <= 1) {
    -[ADSessionManager _startSessions:](self, "_startSessions:", 0LL);
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = self->_sessions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "refreshValidationData", (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (BOOL)_hasAtleastOneActiveSessionBesides:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = self->_sessions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        __int128 v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionId", (void)v17));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionId]);
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0
          && (([v9 sessionIsActive] & 1) != 0
           || [v9 sessionIsAttemptingTryOrRetry]))
        {
          __int128 v13 = (void *)AFSiriLogContextSession;
          LOBYTE(v6) = 1;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            __int128 v14 = v13;
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 _adSessionTypeString]);
            *(_DWORD *)buf = 136315394;
            __int128 v22 = "-[ADSessionManager _hasAtleastOneActiveSessionBesides:]";
            __int16 v23 = 2112;
            uint64_t v24 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Session %@ is active or is in active retry",  buf,  0x16u);
          }

          goto LABEL_14;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_keyForRequestId:(id)a3 forSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSString);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionId]);

  __int128 v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@.%@", v6, v8);
  return v9;
}

- (id)_mapADRequestIdToSessionRequestId:(id)a3 forSession:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", a3, a4));
  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_proxiedIdMap, "valueForKey:", v5));
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)_reverseMapSessionRequestIdToADRequestId:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  if (!v8)
  {
    BOOL v11 = 0;
    __int128 v9 = 0LL;
LABEL_7:
    __int128 v10 = 0LL;
    goto LABEL_9;
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", v8, v7));
  if (!v9)
  {
    BOOL v11 = 0;
    goto LABEL_7;
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_reverseProxiedIdMap, "valueForKey:", v9));
  if (v10)
  {
    [v6 setRefId:v10];
    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

- (void)_resetWinningState
{
  if (!self->_continueWithPreviousWinner)
  {
    id v3 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      winningSessionId = self->_winningSessionId;
      int v8 = 136315394;
      __int128 v9 = "-[ADSessionManager _resetWinningState]";
      __int16 v10 = 2112;
      BOOL v11 = winningSessionId;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Reset winning session Id %@",  (uint8_t *)&v8,  0x16u);
    }

    id v5 = self->_winningSessionId;
    self->_winningSessionId = 0LL;
  }

  -[ADSessionManager _resetResultObjectsTimer](self, "_resetResultObjectsTimer");
  *(_WORD *)&self->_BOOL isQueuingResultsForDelayedEvaluation = 0;
  savedSasSpeechRecognized = self->_savedSasSpeechRecognized;
  self->_savedSasSpeechRecognized = 0LL;

  savedSasSpeechFailure = self->_savedSasSpeechFailure;
  self->_savedSasSpeechFailure = 0LL;

  self->_savedSasSpeechRecognizedSubmitted = 0;
  self->_serverSpeechRecognitionArrived = 0;
}

- (void)_logContextForWinningSession:(id)a3 forReason:(id)a4 forRemoteSessionScore:(int64_t)a5 forLocalSessionScore:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = v10;
  if (!v9)
  {
    __int128 v18 = (os_log_s *)AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136315138;
    __int128 v21 = "-[ADSessionManager _logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:]";
    __int128 v19 = "%s sessionType is not defined";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v20, 0xCu);
    goto LABEL_7;
  }

  if (!v10)
  {
    __int128 v18 = (os_log_s *)AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136315138;
    __int128 v21 = "-[ADSessionManager _logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:]";
    __int128 v19 = "%s winningReason is not defined";
    goto LABEL_9;
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v12 setObject:v9 forKey:@"sessionType"];
  [v12 setObject:v11 forKey:@"reason"];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
  [v12 setObject:v14 forKey:@"remoteSessionScore"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
  [v12 setObject:v16 forKey:@"localSessionScore"];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v17 logEventWithType:919 context:v12];

LABEL_7:
}

- (ADSessionManagerDelegate)delegate
{
  return (ADSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (ADSessionManagerIntercepting)interceptor
{
  return (ADSessionManagerIntercepting *)objc_loadWeakRetained((id *)&self->_interceptor);
}

- (void)setInterceptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end