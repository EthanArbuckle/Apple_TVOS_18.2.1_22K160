@interface ADSessionRemoteServer
+ (void)_getReportSymptomsBasedNetworkQualityMetrics:(id)a3;
- (BOOL)_authenticationDisabled;
- (BOOL)_connectionErrorIsRedirect:(id)a3;
- (BOOL)_connectionErrorIsTimeout:(id)a3;
- (BOOL)_connectionErrorSuggestsConnectionPolicyReset:(id)a3;
- (BOOL)_connectionIsWWAN;
- (BOOL)_persistValidationData:(id)a3 withExpiration:(id)a4;
- (BOOL)_shouldRetry;
- (BOOL)_versionForCachedValidationDataMatchesCurrentVersion;
- (BOOL)sessionIsAttemptingTryOrRetry;
- (BOOL)supportsSync;
- (id)_authDataToSign;
- (id)_authenticator;
- (id)_cachedServerCertificate;
- (id)_cachedValidationData;
- (id)_connectionInfoWithPreferWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (id)_connectionURL;
- (id)_connectionURLHostname;
- (id)_generateAnalyticsContextWithError:(id)a3;
- (id)_hubAccount;
- (id)_networkManager;
- (id)_retryManager;
- (id)_serverConnection;
- (id)_siriNetworkManager;
- (id)_siriNetworkServerConnection;
- (id)connection;
- (id)currentConnectionPreCachedMetrics;
- (id)currentSNConnectionPreCachedMetrics;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10;
- (id)siriNetworkConnection;
- (void)_adjustAceHeaderTimeout:(BOOL)a3;
- (void)_assistantFailedForReason:(id)a3 error:(id)a4;
- (void)_authenticationFailed;
- (void)_cancelSynchronously:(BOOL)a3;
- (void)_companionServiceStateDidChange:(id)a3;
- (void)_connectionOpened;
- (void)_continueAuthWithCertificateData:(id)a3;
- (void)_continueAuthentication;
- (void)_continueSessionInitWithValidationData:(id)a3;
- (void)_createAssistant;
- (void)_eagerAuthDidComplete;
- (void)_forceFastDormancy;
- (void)_handleAceObject:(id)a3;
- (void)_homeContextDidChange:(id)a3;
- (void)_homeInfoDidChange:(id)a3;
- (void)_informDelegateOfError:(id)a3;
- (void)_multiUsersDidChange:(id)a3;
- (void)_probeSessionIfIdle;
- (void)_reallyRetryPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 causedByError:(id)a7 forceReconnect:(BOOL)a8 useSecondary:(BOOL)a9;
- (void)_recheckForWiFiTransition;
- (void)_releaseDormancySuspension;
- (void)_resetConnectionPolicyBlacklisting;
- (void)_resetServerConnection;
- (void)_resetServerConnectionSynchronously:(BOOL)a3 completion:(id)a4;
- (void)_retrieveAndSendHomeContext;
- (void)_retryForFailedConnection:(id)a3 withType:(id)a4 onError:(id)a5;
- (void)_retrySiriNetworkForFailedConnection:(id)a3 siriNetworkAnalysisInfo:(id)a4 onError:(id)a5;
- (void)_retryWithParameters:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 causedByError:(id)a6 useSecondary:(BOOL)a7;
- (void)_saAssistantCreated:(id)a3;
- (void)_saAssistantDestroyed:(id)a3;
- (void)_saAssistantLoaded:(id)a3;
- (void)_saAssistantNotFound:(id)a3;
- (void)_saAssistantNotReady:(id)a3;
- (void)_saCommandFailed:(id)a3;
- (void)_saCreateSessionInfoResponse:(id)a3;
- (void)_saGetSessionCertificateResponse:(id)a3;
- (void)_saSessionValidationFailed:(id)a3;
- (void)_saSetConnectionHeader:(id)a3;
- (void)_sendCreateSessionInfoRequestWithData:(id)a3;
- (void)_sendGetSessionCertificateData;
- (void)_sendHomeContext:(id)a3;
- (void)_sendLoadAssistantWithAccount:(id)a3 validationData:(id)a4;
- (void)_sendMultiUserInfo;
- (void)_sendServerCommand:(id)a3;
- (void)_sendServerCommandLogErrorForCommand:(id)a3 withContext:(id)a4;
- (void)_sendServerCommands:(id)a3;
- (void)_sendSetRemoteDevicesWithAccount:(id)a3;
- (void)_sendSetRemoteDevicesWithAccount:(id)a3 multiUserInfo:(id)a4;
- (void)_sendSidekickHubDeviceInfo;
- (void)_sendUserProfiles;
- (void)_setCachedServerCertificate:(id)a3;
- (void)_setCachedValidationData:(id)a3 withDuration:(double)a4;
- (void)_sidekickDeviceIdentifierDidChange:(id)a3;
- (void)_siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5;
- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7;
- (void)_startConnection;
- (void)_startConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (void)_startSession;
- (void)_startSiriCoreConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (void)_startSiriNetworkConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (void)_triggerABCForEmptyLocale;
- (void)_updateConnectionPolicyFailureCount:(id)a3;
- (void)assistantDataManagerDictationHIPAAMDMStatusDidChange;
- (void)barrier:(id)a3;
- (void)beginRetryableRequest:(id)a3;
- (void)dealloc;
- (void)delegateDidHandleCommand:(id)a3 didRecognizeSpeech:(BOOL)a4;
- (void)didCloseConnection:(id)a3;
- (void)didEncounterError:(id)a3 error:(id)a4 analysisInfo:(id)a5;
- (void)didEncounterIntermediateError:(id)a3 error:(id)a4;
- (void)didOpenConnectionType:(id)a3 type:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7;
- (void)didReceiveAceObject:(id)a3 object:(id)a4;
- (void)didReceiveObject:(id)a3 object:(id)a4;
- (void)doSendPreProcessing:(id)a3;
- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4;
- (void)getConnectionMetrics:(id)a3;
- (void)getSNConnectionMetrics:(id)a3;
- (void)networkManagerLostNonWWANConnectivity:(id)a3;
- (void)networkManagerNetworkUnreachable:(id)a3;
- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3;
- (void)refreshValidationData;
- (void)resetRetryManager;
- (void)retryNakedCommandsIfNeeded;
- (void)sendRemoteGizmoDeviceToServer:(id)a3;
- (void)setCoreSiriConnection:(id)a3;
- (void)setHasActiveRequest:(BOOL)a3;
- (void)siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5;
- (void)siriConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)siriConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7;
- (void)siriConnection:(id)a3 didReceiveAceObject:(id)a4;
- (void)siriConnection:(id)a3 willStartWithConnectionType:(id)a4;
- (void)siriConnectionDidClose:(id)a3;
- (void)startRetry;
- (void)willStartConnection:(id)a3 type:(id)a4;
- (void)willStartConnection:(id)a3 with:(id)a4;
@end

@implementation ADSessionRemoteServer

- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10
{
  id v17 = a3;
  id obj = a5;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v44 = a10;
  v45 = v17;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServer;
  id v23 = -[ADSession initOnQueue:withAccount:hubAccount:](&v46, "initOnQueue:withAccount:hubAccount:", v17, a4, v18);
  if (v23)
  {
    id v24 = v22;
    id v25 = v21;
    id v26 = v20;
    int v27 = sub_10005F480();
    *((_BYTE *)v23 + 520) = v27;
    v28 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v29 = @"NO";
      if (v27) {
        v29 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      v48 = "-[ADSessionRemoteServer initOnQueue:withAccount:hubAccount:languageCode:connectionMode:sharedUserIdentifier:"
            "loggingSharedUserIdentifier:instanceContext:]";
      __int16 v49 = 2112;
      v50 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s SIRI_NETWORK_ENABLEMENT Experiment Activated: %@",  buf,  0x16u);
    }

    [v23 setState:0];
    [v23 setLanguageCode:v19];
    id v20 = v26;
    [v23 setConnectionMode:v26];
    id v21 = v25;
    [v23 setSharedUserIdentifier:v25];
    id v22 = v24;
    [v23 setLoggingSharedUserIdentifier:v24];
    objc_storeStrong((id *)v23 + 63, a10);
    objc_storeStrong((id *)v23 + 30, a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerInfo locallyPairedPeerInfo](&OBJC_CLASS___ADPeerInfo, "locallyPairedPeerInfo"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 productType]);
    v32 = (void *)*((void *)v23 + 42);
    *((void *)v23 + 42) = v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue([v30 buildVersion]);
    v34 = (void *)*((void *)v23 + 43);
    *((void *)v23 + 43) = v33;

    objc_storeStrong((id *)v23 + 64, obj);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 productTypePrefix]);
    v37 = (void *)*((void *)v23 + 44);
    *((void *)v23 + 44) = v36;

    *((_BYTE *)v23 + 360) = AFIsNano(v38);
    *((void *)v23 + 46) = 0x401C000000000000LL;
    dispatch_group_t v39 = dispatch_group_create();
    v40 = (void *)*((void *)v23 + 61);
    *((void *)v23 + 61) = v39;

    [v23 setCanHandleRequest:1];
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v41 addObserver:v23 selector:"_homeInfoDidChange:" name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    [v41 addObserver:v23 selector:"_homeContextDidChange:" name:@"ADHomeInfoHomeContextDidChangeNotification" object:0];
    [v41 addObserver:v23 selector:"_sidekickDeviceIdentifierDidChange:" name:@"ADHomeInfoSidekickDeviceIdentifierDidChangeNotification" object:0];
    [v41 addObserver:v23 selector:"_companionServiceStateDidChange:" name:@"ADCompanionServiceReadyStateDidChangeNotification" object:0];
    [v41 addObserver:v23 selector:"_multiUsersDidChange:" name:@"ADMultiUsersDidChangeNotification" object:0];
  }

  return v23;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ADSessionRemoteServer dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_dormancySuspendAssertion)
  {
    if (self->_siriNetworkEnablementExperimentActivated) {
      p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    }
    else {
      p_dormancySuspendAssertion = self->_dormancySuspendAssertion;
    }
    v5 = (id *)&OBJC_CLASS___SiriCoreNetworkManager_ptr;
    if (self->_siriNetworkEnablementExperimentActivated) {
      v5 = (id *)&OBJC_CLASS___SNNetworkManager_ptr;
    }
    [*v5 releaseDormancySuspendAssertion:p_dormancySuspendAssertion];
    self->_dormancySuspendAssertion = 0LL;
  }

  if (self->_siriNetworkEnablementExperimentActivated)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkManager](self, "_siriNetworkManager"));
    [v6 releaseWiFiAssertion];

    -[SNConnection setDelegate:](self->_siriNetworkServerConnection, "setDelegate:", 0LL);
    -[SNConnection cancelSynchronously:isOnConnectionQueue:completion:]( self->_siriNetworkServerConnection,  "cancelSynchronously:isOnConnectionQueue:completion:",  0LL,  0LL,  0LL);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _networkManager](self, "_networkManager"));
    [v7 releaseWiFiAssertion];

    -[SiriCoreSiriConnection setDelegate:](self->_serverConnection, "setDelegate:", 0LL);
    -[SiriCoreSiriConnection cancelSynchronously:onQueue:completion:]( self->_serverConnection,  "cancelSynchronously:onQueue:completion:",  0LL,  0LL,  0LL);
  }

  commandMap = self->_commandMap;
  if (commandMap)
  {
    CFRelease(commandMap);
    self->_commandMap = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 removeObserver:self];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServer;
  -[ADSession dealloc](&v10, "dealloc");
}

- (BOOL)supportsSync
{
  return 1;
}

- (void)setCoreSiriConnection:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B6AB8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_retryManager
{
  retryManager = self->_retryManager;
  if (!retryManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADRetryManager);
    v5 = self->_retryManager;
    self->_retryManager = v4;

    retryManager = self->_retryManager;
  }

  return retryManager;
}

- (void)retryNakedCommandsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nakedObjectsToRetry]);

  if (v4)
  {
    id v5 = [v4 count];
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      id v8 = "-[ADSessionRemoteServer retryNakedCommandsIfNeeded]";
      __int16 v9 = 2048;
      id v10 = v5;
      __int16 v11 = 2112;
      v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Retrying %lu naked commands %@",  (uint8_t *)&v7,  0x20u);
    }

    if (v5) {
      -[ADSession sendCommands:opportunistically:](self, "sendCommands:opportunistically:", v4, 0LL);
    }
  }
}

- (void)beginRetryableRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  [v5 beginRetryableRequest:v4];
}

- (id)_connectionURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hostname]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"/ace"]);
  if (AFIsInternalInstall(v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 redirectForServerURLString:v4]);

    if (v6)
    {
      int v7 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315650;
        v12 = "-[ADSessionRemoteServer _connectionURL]";
        __int16 v13 = 2112;
        v14 = v4;
        __int16 v15 = 2112;
        v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Redirecting %@ to %@",  (uint8_t *)&v11,  0x20u);
      }

      id v8 = v6;

      id v4 = v8;
    }
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  return v9;
}

- (id)_connectionURLHostname
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hostname]);

  if (AFIsInternalInstall(v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 redirectForServerURLString:v3]);

    if (v6)
    {
      int v7 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315650;
        int v11 = "-[ADSessionRemoteServer _connectionURLHostname]";
        __int16 v12 = 2112;
        __int16 v13 = v3;
        __int16 v14 = 2112;
        __int16 v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Redirecting %@ to %@",  (uint8_t *)&v10,  0x20u);
      }

      id v8 = v6;

      v3 = v8;
    }
  }

  return v3;
}

- (void)_startConnection
{
  if (!-[ADSession state](self, "state")) {
    kdebug_trace(722470260LL, 0LL, 0LL, 0LL, 0LL);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  [v3 assistantSessionWillStartConnection:self];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002B6A00;
  v6[3] = &unk_1004F98F0;
  v6[4] = self;
  uint64_t v4 = objc_retainBlock(v6);
  if (self->_siriNetworkEnablementExperimentActivated) {
    id v5 = (id *)&OBJC_CLASS___SNNetworkManager_ptr;
  }
  else {
    id v5 = (id *)&OBJC_CLASS___SiriCoreNetworkManager_ptr;
  }
  [*v5 acquireDormancySuspendAssertion:&self->_dormancySuspendAssertion];
  ((void (*)(void *, void, void))v4[2])(v4, 0LL, 0LL);
}

- (id)_serverConnection
{
  if (!self->_serverConnection)
  {
    uint64_t v4 = (NSURL *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _connectionURL](self, "_connectionURL"));
    currentConnectionURL = self->_currentConnectionURL;
    self->_currentConnectionURL = v4;

    id v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _connectionURLHostname](self, "_connectionURLHostname"));
    currentConnectionHostname = self->_currentConnectionHostname;
    self->_currentConnectionHostname = v6;

    id v8 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      peerType = self->_peerType;
      peerVersion = self->_peerVersion;
      int v28 = 136315650;
      v29 = "-[ADSessionRemoteServer _serverConnection]";
      __int16 v30 = 2112;
      uint64_t v31 = peerType;
      __int16 v32 = 2112;
      uint64_t v33 = peerVersion;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s peer type %@ peer version %@",  (uint8_t *)&v28,  0x20u);
    }

    int v11 = objc_alloc(&OBJC_CLASS___SiriCoreSiriConnection);
    __int16 v12 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);

    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("SiriCoreSiriConnection", v16, v12);
    id v18 = -[SiriCoreSiriConnection initWithQueue:](v11, "initWithQueue:", v17);
    serverConnection = self->_serverConnection;
    self->_serverConnection = v18;

    -[SiriCoreSiriConnection setPeerType:](self->_serverConnection, "setPeerType:", self->_peerType);
    -[SiriCoreSiriConnection setPeerVersion:](self->_serverConnection, "setPeerVersion:", self->_peerVersion);
    -[SiriCoreSiriConnection setPeerProviderClass:]( self->_serverConnection,  "setPeerProviderClass:",  objc_opt_class(&OBJC_CLASS___ADPeerConnectionProvider));
    if (AFIsInternalInstall( -[SiriCoreSiriConnection setProductTypePrefix:]( self->_serverConnection,  "setProductTypePrefix:",  self->_productTypePrefix))) {
      -[SiriCoreSiriConnection setDeviceIsInWalkaboutExperimentGroup:]( self->_serverConnection,  "setDeviceIsInWalkaboutExperimentGroup:",  byte_1005780A0);
    }
    -[SiriCoreSiriConnection setUsesProxyConnection:]( self->_serverConnection,  "setUsesProxyConnection:",  AFIsNano( -[SiriCoreSiriConnection setSiriConnectionUsesPeerManagedSync:]( self->_serverConnection,  "setSiriConnectionUsesPeerManagedSync:",  self->_siriConnectionUsesPeerManagedSync)));
    -[SiriCoreSiriConnection setUrl:](self->_serverConnection, "setUrl:", self->_currentConnectionURL);
    -[SiriCoreSiriConnection setDelegate:](self->_serverConnection, "setDelegate:", self);
    id v20 = self->_serverConnection;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assistantIdentifier]);
    -[SiriCoreSiriConnection setAssistantIdentifier:](v20, "setAssistantIdentifier:", v22);

    id v23 = self->_serverConnection;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 peerAssistantIdentifier]);
    -[SiriCoreSiriConnection setPeerAssistantIdentifier:](v23, "setPeerAssistantIdentifier:", v25);

    if (self->_hasActiveRequest)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
      unsigned int v27 = [v26 assistantSessionShouldPrewarmConnetion:self];

      if (v27) {
        -[SiriCoreSiriConnection setSendPings:](self->_serverConnection, "setSendPings:", 1LL);
      }
    }
  }

  return self->_serverConnection;
}

- (id)_siriNetworkServerConnection
{
  siriNetworkServerConnection = self->_siriNetworkServerConnection;
  if (!siriNetworkServerConnection)
  {
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _connectionURLHostname](self, "_connectionURLHostname"));
    currentConnectionHostname = self->_currentConnectionHostname;
    self->_currentConnectionHostname = v4;

    id v6 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      peerType = self->_peerType;
      peerVersion = self->_peerVersion;
      int v22 = 136315650;
      id v23 = "-[ADSessionRemoteServer _siriNetworkServerConnection]";
      __int16 v24 = 2112;
      id v25 = peerType;
      __int16 v26 = 2112;
      unsigned int v27 = peerVersion;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s peer type %@ peer version %@",  (uint8_t *)&v22,  0x20u);
    }

    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]( self,  "_connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:",  0LL,  0LL,  0LL,  0LL,  0LL));
    int v10 = objc_alloc(&OBJC_CLASS___SNConnection);
    int v11 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_attr_t v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_attr_t v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);

    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("SiriNetworkConnection", v15, v11);
    dispatch_queue_t v17 = -[SNConnection initWithConnectionInfo:connectionQueue:]( v10,  "initWithConnectionInfo:connectionQueue:",  v9,  v16);
    id v18 = self->_siriNetworkServerConnection;
    self->_siriNetworkServerConnection = v17;

    -[SNConnection setDelegate:](self->_siriNetworkServerConnection, "setDelegate:", self);
    if (self->_hasActiveRequest)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
      unsigned int v20 = [v19 assistantSessionShouldPrewarmConnetion:self];

      if (v20) {
        -[SNConnection setSendPings:](self->_siriNetworkServerConnection, "setSendPings:", 1LL);
      }
    }

    siriNetworkServerConnection = self->_siriNetworkServerConnection;
  }

  return siriNetworkServerConnection;
}

- (id)_connectionInfoWithPreferWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v73 = a3;
  BOOL v74 = a4;
  id v10 = a5;
  int v11 = (void *)objc_opt_new(&OBJC_CLASS___SNConnectionInfo);
  dispatch_queue_attr_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _connectionURLHostname](self, "_connectionURLHostname"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 connectionPolicy]);
  dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 connectionPolicyDate]);
  dispatch_queue_attr_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 connectionPolicyHostname]);
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 aceHost]);
  [v11 setAceHost:v16];

  BOOL v77 = v8;
  v76 = (void *)v13;
  v78 = v15;
  BOOL v75 = v7;
  if (([v12 needsDestruction] & 1) == 0
    && ![v12 needsCreation])
  {
    if (!v13 || !v14 || !v15)
    {
      if (v13)
      {
        id v21 = v14;
        if (v14)
        {
          if (v78) {
            goto LABEL_8;
          }
          v53 = (os_log_s *)AFSiriLogContextSession;
          if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315138;
          v82 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          v54 = "%s Connection policy has no hostname; ignoring it";
        }

        else
        {
          v53 = (os_log_s *)AFSiriLogContextSession;
          if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315138;
          v82 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          v54 = "%s Connection policy has no expiration date; ignoring it";
        }
      }

      else
      {
        id v21 = v14;
        v53 = (os_log_s *)AFSiriLogContextSession;
        if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        *(_DWORD *)buf = 136315138;
        v82 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        v54 = "%s No custom connection policy; using default";
      }

      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, v54, buf, 0xCu);
      goto LABEL_8;
    }

    id v49 = [[SAConnectionPolicy alloc] initWithDictionary:v13];
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 timeToLive]);
    v72 = v50;
    if (v50)
    {
      [v50 doubleValue];
      double v52 = fmin(v51, 604800.0);
    }

    else
    {
      double v52 = 604800.0;
    }

    v55 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:v52]);
    -[__CFString timeIntervalSinceNow](v55, "timeIntervalSinceNow");
    if (v56 >= 0.0)
    {
      if ((-[__CFString isEqualToString:](v15, "isEqualToString:", v79) & 1) != 0)
      {
        if (v49)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v69 = v58;
          v71 = (void *)objc_claimAutoreleasedReturnValue([v12 connectionPolicyFirstFailureDate]);
          if (v71)
          {
            objc_msgSend(v58, "timeIntervalSinceDate:", v71, v58);
            if (v59 >= 86400.0)
            {
              v60 = (os_log_s *)AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v82 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
                _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "%s Connection policy blacklisting timed out",  buf,  0xCu);
              }

              -[ADSessionRemoteServer _resetConnectionPolicyBlacklisting](self, "_resetConnectionPolicyBlacklisting");
            }
          }

          v61 = v14;
          id v62 = objc_msgSend(v12, "hasConnectionPolicyFailed", v69);
          v63 = (os_log_s *)AFSiriLogContextSession;
          BOOL v64 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG);
          if ((_DWORD)v62)
          {
            if (v64)
            {
              *(_DWORD *)buf = 136315138;
              v82 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "%s Not using connection policy",  buf,  0xCu);
            }

            v65 = v11;
            id v66 = 0LL;
          }

          else
          {
            if (v64)
            {
              *(_DWORD *)buf = 136315138;
              v82 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "%s Connection policy in use",  buf,  0xCu);
            }

            v65 = v11;
            id v66 = v49;
          }

          [v65 setConnectionPolicy:v66];
          [v11 setImposePolicyBan:v62];

          dispatch_queue_attr_t v14 = v61;
          goto LABEL_52;
        }

- (void)_resetServerConnection
{
}

- (void)_resetServerConnectionSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[ADSession setState:](self, "setState:", 0LL);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1002B6380;
  v34[3] = &unk_1004F9918;
  BOOL v36 = v4;
  id v7 = v6;
  v34[4] = self;
  id v35 = v7;
  BOOL v8 = objc_retainBlock(v34);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1002B64AC;
  v31[3] = &unk_1004F9940;
  BOOL v33 = v4;
  __int16 v9 = (void (**)(void))v7;
  v31[4] = self;
  id v32 = v9;
  id v10 = objc_retainBlock(v31);
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    uint64_t v11 = 32LL;
    siriNetworkServerConnection = self->_siriNetworkServerConnection;
    if (siriNetworkServerConnection)
    {
      -[SNConnection setDelegate:](siriNetworkServerConnection, "setDelegate:", 0LL);
      uint64_t v13 = self->_siriNetworkServerConnection;
      if (self->_isAttemptingRetry || self->_waitingForDelayedRetry)
      {
        ((void (*)(void *, SNConnection *, void))v10[2])(v10, v13, 0LL);
LABEL_10:
        Class v15 = (&self->super.super.isa)[v11];
        (&self->super.super.isa)[v11] = 0LL;

        goto LABEL_13;
      }

      objc_initWeak(&location, self);
      dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1002B66E0;
      v22[3] = &unk_1004F9990;
      unsigned int v20 = &v25;
      objc_copyWeak(&v25, &location);
      v22[4] = self;
      __int16 v24 = v10;
      id v23 = v13;
      -[SNConnection getSNConnectionMetrics:completion:](v23, "getSNConnectionMetrics:completion:", v4, v22);

      id v21 = v24;
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v11 = 31LL;
    serverConnection = self->_serverConnection;
    if (serverConnection)
    {
      -[SiriCoreSiriConnection setDelegate:](serverConnection, "setDelegate:", 0LL);
      uint64_t v13 = self->_serverConnection;
      if (self->_isAttemptingRetry || self->_waitingForDelayedRetry)
      {
        ((void (*)(void *, SNConnection *, void))v8[2])(v8, v13, 0LL);
        goto LABEL_10;
      }

      objc_initWeak(&location, self);
      dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1002B65D8;
      v26[3] = &unk_1004F9968;
      unsigned int v20 = &v29;
      objc_copyWeak(&v29, &location);
      v26[4] = self;
      int v28 = v8;
      unsigned int v27 = v13;
      -[SNConnection getConnectionMetricsSynchronously:completion:]( v27,  "getConnectionMetricsSynchronously:completion:",  v4,  v26);

      id v21 = v28;
LABEL_16:

      objc_destroyWeak(v20);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
  }

  if (v9) {
    v9[2](v9);
  }
LABEL_13:
  -[ADSession _setCurrentConnectionType:](self, "_setCurrentConnectionType:", 0LL);
  -[ADSession _setSNCurrentConnectionType:](self, "_setSNCurrentConnectionType:", 0LL);
  currentConnectionURL = self->_currentConnectionURL;
  self->_currentConnectionURL = 0LL;

  currentConnectionHostname = self->_currentConnectionHostname;
  self->_currentConnectionHostname = 0LL;

  self->_prefersWWAN = 0;
  self->_skipPeer = 0;
  skipPeerError = self->_skipPeerError;
  self->_skipPeerError = 0LL;

  self->_forceReconnect = 0;
  -[ADAuthenticator reset](self->_authenticator, "reset");
  self->_badCachedCertRetryCounter = 0LL;
  self->_certificateFailureCounter = 0LL;
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  [v19 assistantSessionConnectionDidReset:self];
}

- (BOOL)_connectionIsWWAN
{
  if (self->_siriNetworkEnablementExperimentActivated) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentSNConnectionType](self, "_currentSNConnectionType"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentConnectionType](self, "_currentConnectionType"));
  }
  v3 = v2;
  unsigned __int8 v4 = [v2 isWWAN];

  return v4;
}

- (id)_networkManager
{
  return +[SiriCoreNetworkManager sharedInstance](&OBJC_CLASS___SiriCoreNetworkManager, "sharedInstance");
}

- (id)_siriNetworkManager
{
  return +[SNNetworkManager sharedInstance](&OBJC_CLASS___SNNetworkManager, "sharedInstance");
}

- (void)setHasActiveRequest:(BOOL)a3
{
  if (self->_hasActiveRequest == a3) {
    goto LABEL_22;
  }
  self->_BOOL hasActiveRequest = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  unsigned int v6 = [v5 assistantSessionShouldPrewarmConnetion:self];

  if (self->_siriNetworkEnablementExperimentActivated) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkServerConnection](self, "_siriNetworkServerConnection"));
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _serverConnection](self, "_serverConnection"));
  }
  BOOL v8 = v7;
  if (self->_hasActiveRequest) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = 0LL;
  }
  [v7 setSendPings:v9];

  BOOL hasActiveRequest = self->_hasActiveRequest;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v11 systemUptime];
  if (!hasActiveRequest)
  {
    self->_requestEndTime = v12;

    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      dispatch_queue_t v17 = (id *)&OBJC_CLASS___SNNetworkManager_ptr;
      id v18 = &self->_dormancySuspendAssertion;
    }

    else
    {
      id v18 = (void **)*p_dormancySuspendAssertion;
      dispatch_queue_t v17 = (id *)&OBJC_CLASS___SiriCoreNetworkManager_ptr;
    }

    [*v17 releaseDormancySuspendAssertion:v18];
    void *p_dormancySuspendAssertion = 0LL;
    if (self->_checkForWiFiTransitionOnRequestEnd)
    {
      self->_checkForWiFiTransitionOnRequestEnd = 0;
      -[ADSessionRemoteServer _recheckForWiFiTransition](self, "_recheckForWiFiTransition");
    }

    -[ADSession _setRequestId:](self, "_setRequestId:", 0LL);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    [v19 networkActivityStop:5 withReason:1 andError:0];

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    [v20 networkActivityStop:6 withReason:1 andError:0];

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    [v21 networkActivityStop:5 withReason:1 andError:0 completion:0];

    Class v15 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    [v15 networkActivityStop:6 withReason:1 andError:0 completion:0];
    goto LABEL_20;
  }

  self->_requestStartTime = v12;

  -[ADSession setDormant:](self, "setDormant:", 0LL);
  if (v6)
  {
    if (self->_siriNetworkEnablementExperimentActivated) {
      uint64_t v13 = (id *)&OBJC_CLASS___SNNetworkManager_ptr;
    }
    else {
      uint64_t v13 = (id *)&OBJC_CLASS___SiriCoreNetworkManager_ptr;
    }
    [*v13 acquireDormancySuspendAssertion:&self->_dormancySuspendAssertion];
    dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    [v14 networkActivityStart:1 activate:1];

    Class v15 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    [v15 networkActivityStart:1 activate:1 completion:0];
LABEL_20:
  }

  self->_isRequestRetry = 0;
  -[ADSession setCanHandleRequest:](self, "setCanHandleRequest:", 1LL);
  pairedWatchUniqueId = self->_pairedWatchUniqueId;
  self->_pairedWatchUniqueId = 0LL;

LABEL_22:
  if (!a3)
  {
    -[ADSession _clearSendBuffer](self, "_clearSendBuffer");
    -[ADRetryManager clearNakedObjects](self->_retryManager, "clearNakedObjects");
  }

- (void)_startConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  if (self->_siriNetworkEnablementExperimentActivated) {
    -[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]( self,  "_startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:",  a3,  a4,  a5,  a6,  a7);
  }
  else {
    -[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]( self,  "_startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:",  a3,  a4,  a5,  a6,  a7);
  }
}

- (void)_startSiriCoreConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a5;
  uint64_t v13 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Starting connection.", buf, 0xCu);
  }

  dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  Class v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hostname]);

  if ([v15 length])
  {
    -[ADSession _requestForAssistantData](self, "_requestForAssistantData");
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _networkManager](self, "_networkManager"));
    dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 host]);
    [v16 startMonitoringNetworkForHost:v18];

    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _serverConnection](self, "_serverConnection"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 aceHost]);
    [v19 setAceHost:v21];

    double v59 = (void *)objc_claimAutoreleasedReturnValue([v20 connectionPolicy]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v20 connectionPolicyDate]);
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 connectionPolicyHostname]);
    if (([v20 needsDestruction] & 1) != 0
      || [v20 needsCreation])
    {
      int v22 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        id v23 = v22;
        unsigned int v24 = [v20 needsDestruction];
        id v25 = @"needs creation";
        if (v24) {
          id v25 = @"is being destroyed";
        }
        *(_DWORD *)buf = 136315394;
        id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        __int16 v63 = 2112;
        BOOL v64 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Account %@ use default connection policy and clear our dns settings.",  buf,  0x16u);
      }

      -[ADSessionRemoteServer _resetConnectionPolicyBlacklisting](self, "_resetConnectionPolicyBlacklisting");
      goto LABEL_11;
    }

    if (v59 && v58 && v57)
    {
      id v56 = [[SAConnectionPolicy alloc] initWithDictionary:v59];
      v34 = (void *)objc_claimAutoreleasedReturnValue([v56 timeToLive]);
      v53 = v34;
      if (v34)
      {
        [v34 doubleValue];
        double v36 = fmin(v35, 604800.0);
      }

      else
      {
        double v36 = 604800.0;
      }

      dispatch_group_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue([v58 dateByAddingTimeInterval:v36]);
      -[__CFString timeIntervalSinceNow](v39, "timeIntervalSinceNow");
      if (v40 < 0.0)
      {
        log = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          __int16 v63 = 2112;
          BOOL v64 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s Connection policy expired at %@; ignoring it",
            buf,
            0x16u);
        }

        -[ADSessionRemoteServer _resetConnectionPolicyBlacklisting](self, "_resetConnectionPolicyBlacklisting");
        id v56 = 0LL;
      }

      os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue([v20 hostname]);
      double v52 = v39;
      if ((-[__CFString isEqualToString:](v57, "isEqualToString:") & 1) != 0)
      {
        if (v56)
        {
          os_log_t v50 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v49 = (void *)objc_claimAutoreleasedReturnValue([v20 connectionPolicyFirstFailureDate]);
          if (v49)
          {
            -[os_log_s timeIntervalSinceDate:](v50, "timeIntervalSinceDate:", v49);
            if (v41 >= 86400.0)
            {
              v42 = (os_log_s *)AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:"
                      "forceReconnect:]";
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%s Connection policy blacklisting timed out",  buf,  0xCu);
              }

              -[ADSessionRemoteServer _resetConnectionPolicyBlacklisting](self, "_resetConnectionPolicyBlacklisting");
            }
          }

          unsigned int v43 = [v20 hasConnectionPolicyFailed];
          id v47 = (os_log_s *)AFSiriLogContextSession;
          BOOL v44 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG);
          unsigned int v48 = v43;
          if (v43)
          {
            if (v44)
            {
              *(_DWORD *)buf = 136315138;
              id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%s Not using connection policy",  buf,  0xCu);
            }

            objc_msgSend(v19, "setConnectionPolicy:", 0, v47);
            v45 = v56;
          }

          else
          {
            if (v44)
            {
              *(_DWORD *)buf = 136315138;
              id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%s Connection policy in use",  buf,  0xCu);
            }

            v45 = v56;
            objc_msgSend(v19, "setConnectionPolicy:", v56, v47);
          }

          [v19 setImposePolicyBan:v48];

LABEL_64:
          goto LABEL_11;
        }
      }

      else
      {
        double v51 = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          __int16 v63 = 2112;
          BOOL v64 = v57;
          __int16 v65 = 2112;
          os_log_t v66 = loga;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "%s Connection policy hostname %@ does not match account hostname %@; ignoring policy",
            buf,
            0x20u);
        }
      }

      objc_super v46 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "%s Connection policy not in use",  buf,  0xCu);
      }

      [v19 setConnectionPolicy:0];
      goto LABEL_64;
    }

    if (v59)
    {
      if (v58)
      {
        if (v57) {
          goto LABEL_11;
        }
        v37 = (os_log_s *)AFSiriLogContextSession;
        if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 136315138;
        id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        uint64_t v38 = "%s Connection policy has no hostname; ignoring it";
        goto LABEL_59;
      }

      v37 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        uint64_t v38 = "%s Connection policy has no expiration date; ignoring it";
        goto LABEL_59;
      }
    }

    else
    {
      v37 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        uint64_t v38 = "%s No custom connection policy; using default";
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 0xCu);
      }
    }

- (void)_startSiriNetworkConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a5;
  uint64_t v13 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v41 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Starting connection.", buf, 0xCu);
  }

  dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _connectionURLHostname](self, "_connectionURLHostname"));
  if ([v14 length])
  {
    -[ADSession _requestForAssistantData](self, "_requestForAssistantData");
    Class v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 host]);

    dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkManager](self, "_siriNetworkManager"));
    [v17 startMonitoringNetworkForHost:v16];

    id v18 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      double v41 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
      __int16 v42 = 2112;
      unsigned int v43 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Starting monitoring %@", buf, 0x16u);
    }

    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]( self,  "_connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:",  v10,  v9,  v12,  v8,  v7));
    unsigned int v20 = objc_alloc(&OBJC_CLASS___SNConnection);
    id v21 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_UNSPECIFIED, 0);
    id v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);

    dispatch_queue_t v26 = dispatch_queue_create_with_target_V2("SiriNetworkConnection", v25, v21);
    unsigned int v27 = -[SNConnection initWithConnectionInfo:connectionQueue:]( v20,  "initWithConnectionInfo:connectionQueue:",  v19,  v26);
    siriNetworkServerConnection = self->_siriNetworkServerConnection;
    self->_siriNetworkServerConnection = v27;

    -[SNConnection setDelegate:](self->_siriNetworkServerConnection, "setDelegate:", self);
    if (self->_hasActiveRequest)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
      unsigned int v30 = [v29 assistantSessionShouldPrewarmConnetion:self];

      if (v30) {
        -[SNConnection setSendPings:](self->_siriNetworkServerConnection, "setSendPings:", 1LL);
      }
    }

    id v31 = -[SNConnection start](self->_siriNetworkServerConnection, "start");
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v32 logEventWithType:912 context:0];

    if (!-[ADSessionRemoteServer _authenticationDisabled](self, "_authenticationDisabled"))
    {
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _cachedValidationData](self, "_cachedValidationData"));
      if (!v33 || (BOOL forceValidationRefresh = self->_forceValidationRefresh, v33, forceValidationRefresh))
      {
        double v35 = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          double v41 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "%s No cached validation data beginning eager auth",  buf,  0xCu);
        }

        double v36 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _cachedServerCertificate](self, "_cachedServerCertificate"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_1002B62E8;
        v39[3] = &unk_1004F98F0;
        v39[4] = self;
        [v37 prepareWithCertificateData:v36 completion:v39];
      }
    }

    -[ADSession setState:](self, "setState:", 3LL);
  }

  else
  {
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 25LL));
    -[ADSessionRemoteServer _informDelegateOfError:](self, "_informDelegateOfError:", v16);
    uint64_t v38 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v41 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s Hostname invalid in configuration",  buf,  0xCu);
    }
  }
}

- (void)_cancelSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkManager](self, "_siriNetworkManager"));
    [v5 releaseWiFiAssertion];

    unsigned int v6 = &OBJC_CLASS___SNNetworkManager;
    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
  }

  else
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _networkManager](self, "_networkManager"));
    [v8 releaseWiFiAssertion];

    unsigned int v6 = &OBJC_CLASS___SiriCoreNetworkManager;
    p_dormancySuspendAssertion = self->_dormancySuspendAssertion;
  }

  [v6 releaseDormancySuspendAssertion:p_dormancySuspendAssertion];
  self->_dormancySuspendAssertion = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServer;
  -[ADSession _cancelSynchronously:](&v10, "_cancelSynchronously:", v3);
  retryManager = self->_retryManager;
  self->_retryManager = 0LL;
}

- (void)siriConnection:(id)a3 willStartWithConnectionType:(id)a4
{
  id v5 = a4;
  unsigned int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[ADSessionRemoteServer siriConnection:willStartWithConnectionType:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s connectionType=%@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002B6298;
  v9[3] = &unk_1004FD968;
  id v10 = v5;
  uint64_t v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)siriConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  objc_msgSend(v16, "logConnectionOpenWithConnectionType:", objc_msgSend(v13, "diagnosticConnectionType"));

  if ((objc_opt_respondsToSelector(v12, "connectionPolicy") & 1) != 0)
  {
    dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 connectionPolicy]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 policyId]);

    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentConnectionType](self, "_currentConnectionType"));
    unsigned int v20 = [v19 isEdge];

    if (v20) {
      -[ADSessionRemoteServer _adjustAceHeaderTimeout:](self, "_adjustAceHeaderTimeout:", 1LL);
    }
  }

  else
  {
    id v18 = 0LL;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B614C;
  block[3] = &unk_1004F99B8;
  block[4] = self;
  id v37 = v12;
  id v22 = v13;
  id v38 = v22;
  id v23 = v18;
  id v39 = v23;
  id v24 = v14;
  double v42 = a6;
  id v40 = v24;
  id v41 = v15;
  id v25 = v15;
  id v26 = v12;
  dispatch_async(queue, block);
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1002B61D0;
  v31[3] = &unk_1004F99E0;
  id v32 = v23;
  id v33 = v24;
  double v35 = a6;
  id v34 = v22;
  id v28 = v22;
  id v29 = v24;
  id v30 = v23;
  [v27 logEventWithType:901 contextProvider:v31];
}

- (void)siriConnection:(id)a3 didReceiveAceObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B6064;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)siriConnectionDidClose:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B5E48;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002B5E38;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5
{
}

- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7
{
  id v12 = (SiriCoreSiriConnection *)a3;
  id v13 = (SNConnection *)a4;
  id v14 = (NSString *)a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    if (self->_siriNetworkServerConnection == v13)
    {
      id v17 = (void *)AFSiriLogContextSession;
      BOOL v18 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR);
      if (v18)
      {
        unsigned int v19 = v17;
        id v98 = v15;
        unsigned int v20 = v12;
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 connectionURL]);
        else {
          id v22 = @"NO";
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 connectionType]);
        *(_DWORD *)buf = 136316418;
        v113 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siri"
               "NetworkAnalysisInfo:]";
        __int16 v114 = 2114;
        v115 = v13;
        __int16 v116 = 2114;
        v117 = v14;
        __int16 v118 = 2112;
        v119 = v21;
        __int16 v120 = 2112;
        v121 = v22;
        __int16 v122 = 2112;
        v123 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s SiriNetwork %{public}@ %{public}@, URL (%@), WWAN Prefered (%@), connection Type (%@)",  buf,  0x3Eu);

        id v12 = v20;
        id v15 = v98;
      }

      goto LABEL_10;
    }
  }

  else if (self->_serverConnection == v12)
  {
    id v24 = (void *)AFSiriLogContextSession;
    BOOL v18 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      os_log_t loga = v24;
      v94 = v12;
      v95 = (void *)objc_claimAutoreleasedReturnValue([v15 connectionURL]);
      else {
        v96 = @"NO";
      }
      v97 = (void *)objc_claimAutoreleasedReturnValue([v15 connectionType]);
      *(_DWORD *)buf = 136316418;
      v113 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siriNe"
             "tworkAnalysisInfo:]";
      __int16 v114 = 2114;
      v115 = v94;
      __int16 v116 = 2114;
      v117 = v14;
      __int16 v118 = 2112;
      v119 = v95;
      __int16 v120 = 2112;
      v121 = v96;
      __int16 v122 = 2112;
      v123 = v97;
      _os_log_error_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_ERROR,  "%s SiriCore %{public}@ %{public}@, URL (%@), WWAN Prefered (%@), connection Type (%@)",  buf,  0x3Eu);

      id v12 = v94;
    }

- (void)siriConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B5B3C;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    -[ADSessionRemoteServer _generateAWDMetricsForConnectionError:](self, "_generateAWDMetricsForConnectionError:", v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
    char v8 = objc_opt_respondsToSelector(v7, "assistantSession:receivedIntermediateError:");

    if ((v8 & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
      [v9 assistantSession:self receivedIntermediateError:v6];
    }
  }
}

- (void)willStartConnection:(id)a3 type:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADSessionRemoteServer willStartConnection:type:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s connectionType=%@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002B5AEC;
  v9[3] = &unk_1004FD968;
  id v10 = v5;
  uint64_t v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)willStartConnection:(id)a3 with:(id)a4
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSessionRemoteServer willStartConnection:with:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

- (void)didOpenConnectionType:(id)a3 type:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7
{
  id v12 = (SNConnection *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  objc_msgSend(v16, "logConnectionOpenWithConnectionType:", objc_msgSend(v13, "diagnosticConnectionType"));

  if (self->_siriNetworkServerConnection == v12)
  {
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[SNConnection connectionInfo](v12, "connectionInfo"));
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 connectionPolicy]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v19 policyId]);

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentConnectionType](self, "_currentConnectionType"));
    LODWORD(v19) = [v20 isEdge];

    if ((_DWORD)v19) {
      -[ADSessionRemoteServer _adjustAceHeaderTimeout:](self, "_adjustAceHeaderTimeout:", 1LL);
    }
  }

  else
  {
    id v17 = 0LL;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B59A4;
  block[3] = &unk_1004F99B8;
  block[4] = self;
  id v37 = v12;
  id v22 = v13;
  id v38 = v22;
  id v23 = v17;
  id v39 = v23;
  id v24 = v14;
  double v42 = a6;
  id v40 = v24;
  id v41 = v15;
  id v25 = v15;
  id v26 = v12;
  dispatch_async(queue, block);
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1002B5A28;
  v31[3] = &unk_1004F99E0;
  id v32 = v23;
  id v33 = v24;
  double v35 = a6;
  id v34 = v22;
  id v28 = v22;
  id v29 = v24;
  id v30 = v23;
  [v27 logEventWithType:901 contextProvider:v31];
}

- (void)didReceiveObject:(id)a3 object:(id)a4
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSessionRemoteServer didReceiveObject:object:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

- (void)didReceiveAceObject:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B58BC;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)didCloseConnection:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B5698;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)didEncounterError:(id)a3 error:(id)a4 analysisInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002B5680;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)didEncounterIntermediateError:(id)a3 error:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002B5670;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (BOOL)_shouldRetry
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  double v5 = v4;

  BOOL v6 = (self->_hasActiveRequest || -[ADSession state](self, "state") <= 10)
    && v5 - self->_requestStartTime < 20.0
    && v5 - self->_lastRetryTimeOnQueue >= 2.0;
  id v7 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    if (self->_hasActiveRequest) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    id v9 = v7;
    if (-[ADSession state](self, "state") >= 11) {
      id v10 = @"NO";
    }
    else {
      id v10 = @"YES";
    }
    if (v5 - self->_requestStartTime >= 20.0) {
      uint64_t v11 = @"NO";
    }
    else {
      uint64_t v11 = @"YES";
    }
    double v12 = v5 - self->_lastRetryTimeOnQueue;
    int v16 = 136316674;
    id v17 = "-[ADSessionRemoteServer _shouldRetry]";
    __int16 v18 = 2112;
    unsigned int v19 = v8;
    if (v12 < 2.0) {
      id v13 = @"NO";
    }
    else {
      id v13 = @"YES";
    }
    __int16 v20 = 2112;
    if (v6) {
      id v14 = @"YES";
    }
    else {
      id v14 = @"NO";
    }
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    unsigned int v27 = @"YES";
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Has Active Request: %@, Session active: %@, RapidRetryTimeLimit: %@, DampedRapidRetryBackoff: %@, Network prese nt: %@, Should Retry: %@",  (uint8_t *)&v16,  0x48u);
  }

  return v6;
}

- (void)_updateConnectionPolicyFailureCount:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionPolicy]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
    uint64_t v8 = (uint64_t)[v7 connectionPolicyFailureCount];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    unsigned int v10 = [v9 isEqualToString:SiriCoreSiriConnectionErrorDomain];

    if (v10)
    {
      switch(__ROR8__([v4 code], 1))
      {
        case 0LL:
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
          double v12 = v11;
          id v13 = &SiriCoreSiriConnectionHTTPErrorStatusCodeKey;
          goto LABEL_10;
        case 2LL:
        case 7LL:
          goto LABEL_14;
        case 8LL:
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:NSUnderlyingErrorKey]);

          if (!v23 || (objc_msgSend(v23, "ad_isNetworkDownError") & 1) == 0)
          {
            if (v8)
            {
              ++v8;
            }

            else
            {
              __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v7 setConnectionPolicyFirstFailureDate:v24];

              uint64_t v8 = 1LL;
            }
          }

          -[ADSessionRemoteServer _adjustAceHeaderTimeout:](self, "_adjustAceHeaderTimeout:", 0LL);

          goto LABEL_27;
        default:
          goto LABEL_27;
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    unsigned int v15 = [v14 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain];

    if (v15)
    {
      id v16 = [v4 code];
      if (v16 != (id)6)
      {
        if (v16 == (id)5)
        {
          if ((objc_msgSend(v4, "ad_isNetworkDownError") & 1) == 0)
          {
            if (v8)
            {
              ++v8;
            }

            else
            {
              __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v7 setConnectionPolicyFirstFailureDate:v26];

              uint64_t v8 = 1LL;
            }
          }

          -[ADSessionRemoteServer _adjustAceHeaderTimeout:](self, "_adjustAceHeaderTimeout:", 0LL);
          if (!v8) {
            goto LABEL_31;
          }
          goto LABEL_28;
        }

        if (v16) {
          goto LABEL_27;
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
        double v12 = v11;
        id v13 = &SiriNetworkBackgroundConnectionHTTPErrorStatusCodeKey;
LABEL_10:
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:*v13]);
        unsigned int v18 = [v17 intValue];

        if (v18 != 503)
        {
LABEL_27:
          if (v8) {
            goto LABEL_28;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
    }

    else
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      unsigned int v20 = [v19 isEqualToString:SiriNetworkNetworkConnectionErrorDomain];

      if (!v20 || [v4 code] != (id)2) {
        goto LABEL_27;
      }
    }

- (BOOL)_connectionErrorIsRedirect:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v4 isEqualToString:SiriCoreSiriConnectionErrorDomain]
    && ![v3 code])
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:SiriCoreSiriConnectionHTTPErrorStatusCodeKey]);
    BOOL v5 = [v7 intValue] == 301;
  }

  else
  {
    BOOL v5 = 0;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v8 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain]
    && ![v3 code])
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:SiriNetworkBackgroundConnectionHTTPErrorStatusCodeKey]);
    BOOL v9 = [v11 intValue] == 301;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v5 || v9;
}

- (BOOL)_connectionErrorSuggestsConnectionPolicyReset:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned int v5 = [v4 isEqualToString:SiriCoreSiriConnectionErrorDomain];

  if (v5) {
    BOOL v6 = (((unint64_t)[v3 code] - 1) & 0xFFFFFFFFFFFFFFF7) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned int v8 = [v7 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain];

  if (v8 && [v3 code] == (id)1) {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_connectionErrorIsTimeout:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v4 isEqualToString:NSPOSIXErrorDomain])
  {
    BOOL v5 = [v3 code] == (id)60;
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    else {
      BOOL v5 = 0;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v7 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain])
  {
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned int v9 = [v8 isEqualToString:SiriNetworkNetworkConnectionErrorDomain];

    if (!v9) {
      goto LABEL_20;
    }
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:NSUnderlyingErrorKey]);

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  if ([v12 isEqualToString:NSPOSIXErrorDomain])
  {
    BOOL v5 = [v11 code] == (id)60;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    if ([v13 isEqualToString:kNWErrorDomainPOSIX])
    {
      BOOL v5 = [v11 code] == (id)60;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
      else {
        BOOL v5 = 0;
      }
    }
  }

LABEL_20:
  return v5;
}

- (void)startRetry
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 retryRequestId]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 latestMappedRequestId]);
  BOOL v6 = (void *)v5;
  if (!v4)
  {
    uint64_t v7 = SiriCoreUUIDStringCreate(v5);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  -[ADRetryManager setLatestMappedRequestId:](self->_retryManager, "setLatestMappedRequestId:", v4);
  if (v6)
  {
    unsigned int v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315650;
      unsigned int v18 = "-[ADSessionRemoteServer startRetry]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      __int16 v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Changing requestId from %@ to %@ ",  (uint8_t *)&v17,  0x20u);
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
    [v9 assistantSession:self didChangeRequestIdFrom:v6 toId:v4];
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
  [v10 networkActivityStart:6 activate:1];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
  [v11 networkActivityStart:6 activate:1 completion:0];

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsToRetry]);
  id v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = [v12 count];
    int v17 = 136315394;
    unsigned int v18 = "-[ADSessionRemoteServer startRetry]";
    __int16 v19 = 2048;
    id v20 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Retrying %lu objects on session failure",  (uint8_t *)&v17,  0x16u);
  }

  self->_isRequestRetry = 1;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  [v16 assistantSessionRetryingRequest:self];

  -[ADSession sendCommands:opportunistically:](self, "sendCommands:opportunistically:", v12, 0LL);
}

- (void)resetRetryManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADSessionRemoteServer resetRetryManager]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Resetting retry manager", (uint8_t *)&v4, 0xCu);
  }

  [v2 endRetryableRequestForCommand:0];
}

- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4
{
}

- (void)_informDelegateOfError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    id v20 = "-[ADSessionRemoteServer _informDelegateOfError:]";
    __int16 v21 = 2114;
    *(void *)__int16 v22 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v19, 0x16u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  [v6 setNeedsToRetryNakedObjects];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  if (![v7 shouldRetryOnConnectionFailure])
  {

    goto LABEL_8;
  }

  if (!v4)
  {
    uint64_t v9 = 1LL;
    goto LABEL_19;
  }

  unsigned __int8 v8 = objc_msgSend(v4, "ad_isRetryableSessionError");

  if ((v8 & 1) == 0)
  {
LABEL_8:
    unsigned int v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v10;
      unsigned int v12 = [v6 shouldRetryOnConnectionFailure];
      unsigned int v13 = objc_msgSend(v4, "ad_isRetryableSessionError");
      int v19 = 136315650;
      id v20 = "-[ADSessionRemoteServer _informDelegateOfError:]";
      __int16 v21 = 1024;
      *(_DWORD *)__int16 v22 = v12;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Not retrying shouldRetry %d retryableError %d",  (uint8_t *)&v19,  0x18u);
    }

    self->_isAttemptingRetry = 0;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _requestId](self, "_requestId"));

    if (!v14)
    {
      uint64_t v9 = 0LL;
      goto LABEL_20;
    }

    id v7 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _requestId](self, "_requestId"));
    [v7 setRefId:v15];

    -[ADSession _informDelegateCannotHandleRequest:error:](self, "_informDelegateCannotHandleRequest:error:", v7, v4);
    -[ADSessionRemoteServer resetRetryManager](self, "resetRetryManager");
    if (self->_siriNetworkEnablementExperimentActivated) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkManager](self, "_siriNetworkManager"));
    }
    else {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _networkManager](self, "_networkManager"));
    }
    int v17 = v16;
    [v16 releaseWiFiAssertion];

    uint64_t v9 = 0LL;
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v9 = 1LL;
LABEL_20:
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  [v18 assistantSession:self receivedError:v4 isRetryableError:v9];
}

- (BOOL)_authenticationDisabled
{
  if (self->_hasCachedAuthDisabled)
  {
    LOBYTE(v3) = self->_cachedAuthDisabled;
  }

  else
  {
    LOBYTE(v3) = 1;
    self->_hasCachedAuthDisabled = 1;
    if ((_AFPreferencesAuthenticationDisabled() & 1) == 0) {
      unsigned int v3 = !+[ADAuthenticator authenticationAvailable](&OBJC_CLASS___ADAuthenticator, "authenticationAvailable");
    }
    self->_cachedAuthDisabled = v3;
  }

  return v3;
}

- (id)_authenticator
{
  authenticator = self->_authenticator;
  if (!authenticator)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 useDeviceAuthenticationVersion]);

    BOOL v6 = -[ADAuthenticator initWithTargetQueue:authenticationStrategyVersion:]( objc_alloc(&OBJC_CLASS___ADAuthenticator),  "initWithTargetQueue:authenticationStrategyVersion:",  self->_queue,  v5);
    id v7 = self->_authenticator;
    self->_authenticator = v6;

    authenticator = self->_authenticator;
  }

  return authenticator;
}

- (BOOL)_versionForCachedValidationDataMatchesCurrentVersion
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 validationVersion]);

  id v5 = [v4 unsignedIntegerValue];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  LOBYTE(v5) = v5 == [v6 authenticationStrategyVersion];

  return (char)v5;
}

- (id)_cachedServerCertificate
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serverCertificateData]);

  if (![v4 length])
  {
    BOOL v6 = 0LL;
    goto LABEL_7;
  }

  unsigned __int8 v5 = -[ADSessionRemoteServer _versionForCachedValidationDataMatchesCurrentVersion]( self,  "_versionForCachedValidationDataMatchesCurrentVersion");
  BOOL v6 = v4;
  if ((v5 & 1) != 0)
  {
LABEL_7:
    id v9 = v6;
    goto LABEL_8;
  }

  id v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    unsigned int v12 = "-[ADSessionRemoteServer _cachedServerCertificate]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Resetting cached certificate data due to cached version not matching current version.",  (uint8_t *)&v11,  0xCu);
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  [v8 setServerCertificateData:0];

  id v9 = 0LL;
LABEL_8:

  return v9;
}

- (void)_setCachedServerCertificate:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  [v5 setServerCertificateData:v4];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 authenticationStrategyVersion]));
  [v6 setValidationVersion:v8];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  [v9 save];
}

- (id)_cachedValidationData
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 validationExpiration]);
  if (!v4)
  {
    cachedValidationDataExpiration = self->_cachedValidationDataExpiration;
    if (cachedValidationDataExpiration)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v11 = -[NSDate compare:](cachedValidationDataExpiration, "compare:", v10);

      if (v11 == (id)1)
      {
        id v7 = self->_cachedValidationData;
        -[ADSessionRemoteServer _persistValidationData:withExpiration:]( self,  "_persistValidationData:withExpiration:",  self->_cachedValidationData,  self->_cachedValidationDataExpiration);
        goto LABEL_14;
      }
    }

- (void)_setCachedValidationData:(id)a3 withDuration:(double)a4
{
  id v6 = (NSData *)a3;
  id v7 = -[NSDate initWithTimeIntervalSinceNow:](objc_alloc(&OBJC_CLASS___NSDate), "initWithTimeIntervalSinceNow:", a4);
  unsigned int v8 = -[ADSessionRemoteServer _persistValidationData:withExpiration:]( self,  "_persistValidationData:withExpiration:",  v6,  v7);
  if (v6 && v8)
  {
    id v9 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      id v15 = "-[ADSessionRemoteServer _setCachedValidationData:withDuration:]";
      __int16 v16 = 1024;
      int v17 = (int)a4;
      __int16 v18 = 2112;
      int v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Validity is valid for %d seconds %@",  (uint8_t *)&v14,  0x1Cu);
    }

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
    [v10 scheduleValidationRefreshForInterval:a4];
  }

  cachedValidationData = self->_cachedValidationData;
  self->_cachedValidationData = v6;
  unsigned int v12 = v6;

  cachedValidationDataExpiration = self->_cachedValidationDataExpiration;
  self->_cachedValidationDataExpiration = v7;
}

- (BOOL)_persistValidationData:(id)a3 withExpiration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  unsigned int v9 = [v8 setValidationDataSync:v7];

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 authenticationStrategyVersion]));
    [v8 setValidationVersion:v11];

    [v8 setValidationExpiration:v6];
    [v8 save];
  }

  else
  {
    unsigned int v12 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      id v15 = "-[ADSessionRemoteServer _persistValidationData:withExpiration:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to persist validation data",  (uint8_t *)&v14,  0xCu);
    }
  }

  return v9;
}

- (id)_authDataToSign
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantIdentifier]);

  if (v5) {
    id v6 = -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"Assistant Identifier");
  }
  if ((AFIsInternalInstall(v6) & 1) != 0 || AFPreferencesTestAccessEnabled()) {
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  &__kCFBooleanTrue,  @"9E5BD479-1D3E-400D-ADF7-ECB0A7DBFE06");
  }
  if (-[NSMutableDictionary count](v3, "count")) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  100LL,  0LL,  0LL));
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_retryWithParameters:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 causedByError:(id)a6 useSecondary:(BOOL)a7
{
  LOBYTE(v7) = a7;
  -[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByError:forceReconnect:useSecondary:]( self,  "_reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByError:forceReconnect:useSecondary:",  a3,  a4,  a5,  0LL,  a6,  0LL,  v7);
}

- (void)_reallyRetryPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 causedByError:(id)a7 forceReconnect:(BOOL)a8 useSecondary:(BOOL)a9
{
  BOOL v14 = a3;
  id v49 = a5;
  id v50 = a7;
  id v15 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v64 = "-[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByError:forceRecon"
          "nect:useSecondary:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  -[ADSession _informDelegateWillRetryOnError:](self, "_informDelegateWillRetryOnError:", v50);
  self->_isAttemptingRetry = 1;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  [v16 assistantSession:self beginSessionRetryPreferringWWAN:v14];

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _sendBuffer](self, "_sendBuffer"));
  id v18 = [v17 copy];

  -[ADSession _clearSendBuffer](self, "_clearSendBuffer");
  -[ADSession _clearLimbo](self, "_clearLimbo");
  if (a9) {
    -[ADSession _setSessionOpened](self, "_setSessionOpened");
  }
  else {
    -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
  }
  self->_prefersWWAN = v14;
  self->_skipPeer = a4;
  objc_storeStrong((id *)&self->_skipPeerError, a5);
  self->_useWiFiHint = a6;
  self->_forceReconnect = a8;
  int v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 assistantSessionCommandsToRestoreStateOnNewConnection:self]);

  unsigned int v48 = (void *)v20;
  -[ADSession sendCommands:opportunistically:](self, "sendCommands:opportunistically:", v20, 0LL);
  __int16 v21 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v18 count]);
  v53 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v18 count]);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v22 = v18;
  id v23 = [v22 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v60;
    uint64_t v55 = *(void *)v60;
    double v51 = v21;
    id v52 = v22;
    do
    {
      __int16 v26 = 0LL;
      int v27 = v53;
      id v56 = v24;
      do
      {
        if (*(void *)v60 != v25) {
          objc_enumerationMutation(v22);
        }
        __int16 v28 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v26);
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___SABaseCommand);
        if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0) {
          id v30 = [v28 mutableCopy];
        }
        else {
          id v30 = v28;
        }
        id v31 = v30;
        if ((objc_msgSend(v30, "siriCore_isProvisional") & 1) == 0)
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 aceId]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 refId]);
          if (v32)
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v21, "objectForKey:", v32));
            if (!v34)
            {
              uint64_t v35 = SiriCoreUUIDStringCreate(0LL);
              id v34 = (void *)objc_claimAutoreleasedReturnValue(v35);
              -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v34, v32);
            }

            [v31 setAceId:v34];
            uint64_t v36 = objc_opt_class(&OBJC_CLASS___SAStartRequest);
            if ((objc_opt_isKindOfClass(v31, v36) & 1) != 0
              || (uint64_t v37 = objc_opt_class(&OBJC_CLASS___SASStartSpeech), (objc_opt_isKindOfClass(v31, v37) & 1) != 0))
            {
              id v38 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472LL;
              v57[2] = sub_1002B55F4;
              v57[3] = &unk_1004F9A30;
              v57[4] = v32;
              id v39 = v34;
              id v58 = v39;
              [v38 logEventWithType:911 contextProvider:v57];

              id v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
              [v40 assistantSession:self didChangeRequestIdFrom:v32 toId:v39];

              id v41 = (void *)objc_claimAutoreleasedReturnValue(-[ADRetryManager latestMappedRequestId](self->_retryManager, "latestMappedRequestId"));
              unsigned int v42 = [v41 isEqualToString:v32];

              if (v42)
              {
                unsigned int v43 = (os_log_s *)AFSiriLogContextSession;
                if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  BOOL v64 = "-[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByEr"
                        "ror:forceReconnect:useSecondary:]";
                  __int16 v65 = 2112;
                  os_log_t v66 = v32;
                  __int16 v67 = 2112;
                  id v68 = v39;
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%s Remapping retry manager from %@ to %@",  buf,  0x20u);
                }

                -[ADRetryManager setLatestMappedRequestId:](self->_retryManager, "setLatestMappedRequestId:", v39);
              }

              BOOL v44 = (os_log_s *)AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                BOOL v64 = "-[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByErro"
                      "r:forceReconnect:useSecondary:]";
                _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "%s creating rollback request",  buf,  0xCu);
              }

              id v45 = objc_alloc_init(&OBJC_CLASS___SARollbackRequest);
              [v45 setRequestId:v32];
              int v27 = v53;
              -[NSMutableArray addObject:](v53, "addObject:", v45);

              __int16 v21 = v51;
              id v22 = v52;
              uint64_t v25 = v55;
            }

            if (v33)
            {
              objc_super v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v21, "objectForKey:", v33));
              if (!v46)
              {
                uint64_t v47 = SiriCoreUUIDStringCreate(0LL);
                objc_super v46 = (void *)objc_claimAutoreleasedReturnValue(v47);
                -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v46, v33);
              }

              [v31 setRefId:v46];

              uint64_t v25 = v55;
            }

            -[NSMutableArray addObject:](v27, "addObject:", v31);
          }

          id v24 = v56;
        }

        __int16 v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }

    while (v24);
  }

  -[ADSession sendCommands:opportunistically:](self, "sendCommands:opportunistically:", v53, 0LL);
}

- (void)_retryForFailedConnection:(id)a3 withType:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 prefersWWAN] & 1) != 0
    || [v9 technology] == (id)3000
    || ([v9 isWWAN] & 1) != 0)
  {
    unsigned int v27 = 0;
  }

  else
  {
    unsigned int v27 = AFHasCellularData();
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:SiriCoreSiriConnectionShouldSkipIDSOnNextAttemptKey]);
  id v13 = [v12 BOOLValue];

  if ((_DWORD)v13) {
    BOOL v14 = v10;
  }
  else {
    BOOL v14 = 0LL;
  }
  id v15 = v14;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v16 systemUptime];
  double v18 = v17;

  id v19 = [v10 code];
  BOOL v20 = v19 == (id)32;
  id v35 = [v10 code];
  double v21 = 0.0;
  if (objc_msgSend(v10, "ad_requiresDampedRetry:", &v35))
  {
    if (v35 != (id)54 || v18 - self->_lastRetryTimeOnQueue < 2.0) {
      double v21 = 2.0;
    }
    self->_lastRetryTimeOnQueue = v18;
  }

  if (v19 != (id)32)
  {
    id v22 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      double v23 = v18 - self->_requestStartTime;
      *(_DWORD *)buf = 136315906;
      uint64_t v37 = "-[ADSessionRemoteServer _retryForFailedConnection:withType:onError:]";
      __int16 v38 = 2048;
      double v39 = v23;
      __int16 v40 = 2048;
      double v41 = v18;
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Retrying after %lf seconds, now %lf error %@",  buf,  0x2Au);
    }
  }

  if (v21 == 0.0)
  {
    -[ADSessionRemoteServer _retryWithParameters:skipPeer:skipPeerError:causedByError:useSecondary:]( self,  "_retryWithParameters:skipPeer:skipPeerError:causedByError:useSecondary:",  v27,  v13,  v15,  v10,  v19 == (id)32);
  }

  else
  {
    id v24 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = "-[ADSessionRemoteServer _retryForFailedConnection:withType:onError:]";
      __int16 v38 = 2048;
      double v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Backing off for %lf seconds", buf, 0x16u);
    }

    self->_waitingForDelayedRetry = 1;
    dispatch_time_t v25 = dispatch_time(0LL, (uint64_t)(v21 * 1000000000.0));
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B53F0;
    block[3] = &unk_1004F9A58;
    block[4] = self;
    id v29 = v8;
    char v32 = v27;
    char v33 = (char)v13;
    id v30 = v15;
    id v31 = v10;
    BOOL v34 = v20;
    dispatch_after(v25, queue, block);
  }
}

- (void)_retrySiriNetworkForFailedConnection:(id)a3 siriNetworkAnalysisInfo:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = COERCE_DOUBLE(a5);
  int v11 = AFHasCellularData();
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 connectionType]);
  else {
    unsigned int v40 = v11 & ~[v12 isWWAN];
  }
  id v13 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    os_log_t log = v13;
    unsigned int v14 = [v9 wwanPreferred];
    id v15 = self;
    id v16 = v9;
    id v17 = v8;
    if (v14) {
      *(double *)&double v18 = COERCE_DOUBLE(@"YES");
    }
    else {
      *(double *)&double v18 = COERCE_DOUBLE(@"NO");
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 technologyDescription]);
    *(_DWORD *)buf = 136316674;
    id v50 = "-[ADSessionRemoteServer _retrySiriNetworkForFailedConnection:siriNetworkAnalysisInfo:onError:]";
    else {
      BOOL v20 = @"NO";
    }
    if (v11) {
      double v21 = @"YES";
    }
    else {
      double v21 = @"NO";
    }
    if (v40) {
      id v22 = @"YES";
    }
    else {
      id v22 = @"NO";
    }
    __int16 v51 = 2112;
    double v52 = v10;
    __int16 v53 = 2112;
    double v54 = *(double *)&v18;
    id v8 = v17;
    id v9 = v16;
    self = v15;
    __int16 v55 = 2112;
    double v56 = *(double *)&v19;
    __int16 v57 = 2112;
    id v58 = v20;
    __int16 v59 = 2112;
    __int128 v60 = v21;
    __int16 v61 = 2112;
    __int128 v62 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s Retry. Error: %@. WWAN Preferred: %@, Connection type: %@, isWWAN: %@, Has Cellular Data: %@, shouldPreferWWAN: %@",  buf,  0x48u);
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v10 userInfo]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:SiriNetworkBackgroundConnectionShouldSkipIDSOnNextAttemptKey]);
  id v25 = [v24 BOOLValue];

  if ((_DWORD)v25) {
    double v26 = v10;
  }
  else {
    double v26 = 0.0;
  }
  id v27 = *(id *)&v26;
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v28 systemUptime];
  double v30 = v29;

  id v31 = [*(id *)&v10 code];
  BOOL v32 = v31 == (id)10;
  id v48 = [*(id *)&v10 code];
  double v33 = 0.0;
  if (objc_msgSend(*(id *)&v10, "ad_requiresDampedRetry:", &v48))
  {
    if (!objc_msgSend(*(id *)&v10, "sn_isNetworkConnectionRetryableNow")
      || v30 - self->_lastRetryTimeOnQueue < 2.0)
    {
      double v33 = 2.0;
    }

    self->_lastRetryTimeOnQueue = v30;
  }

  if (v31 != (id)10)
  {
    BOOL v34 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      double v35 = v30 - self->_requestStartTime;
      *(_DWORD *)buf = 136315906;
      id v50 = "-[ADSessionRemoteServer _retrySiriNetworkForFailedConnection:siriNetworkAnalysisInfo:onError:]";
      __int16 v51 = 2048;
      double v52 = v35;
      __int16 v53 = 2048;
      double v54 = v30;
      __int16 v55 = 2112;
      double v56 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Retrying after %lf seconds, now %lf error %@",  buf,  0x2Au);
    }
  }

  if (v33 == 0.0)
  {
    -[ADSessionRemoteServer _retryWithParameters:skipPeer:skipPeerError:causedByError:useSecondary:]( self,  "_retryWithParameters:skipPeer:skipPeerError:causedByError:useSecondary:",  v40,  v25,  v27,  *(void *)&v10,  v31 == (id)10);
  }

  else
  {
    uint64_t v36 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v50 = "-[ADSessionRemoteServer _retrySiriNetworkForFailedConnection:siriNetworkAnalysisInfo:onError:]";
      __int16 v51 = 2048;
      double v52 = v33;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s Backing off for %lf seconds", buf, 0x16u);
    }

    self->_waitingForDelayedRetry = 1;
    dispatch_time_t v37 = dispatch_time(0LL, (uint64_t)(v33 * 1000000000.0));
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B51EC;
    block[3] = &unk_1004F9A58;
    block[4] = self;
    id v42 = v8;
    char v45 = v40;
    char v46 = (char)v25;
    id v43 = v27;
    id v44 = *(id *)&v10;
    BOOL v47 = v32;
    dispatch_after(v37, queue, block);
  }
}

- (BOOL)sessionIsAttemptingTryOrRetry
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServer;
  return -[ADSession sessionIsAttemptingTryOrRetry](&v4, "sessionIsAttemptingTryOrRetry") || self->_isAttemptingRetry;
}

- (id)connection
{
  return self->_serverConnection;
}

- (id)siriNetworkConnection
{
  return self->_siriNetworkServerConnection;
}

- (void)_authenticationFailed
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 300LL));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionRemoteServer _generateAnalyticsContextWithError:]( self,  "_generateAnalyticsContextWithError:",  v6));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v4 logEventWithType:908 context:v3 contextNoCopy:1];

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  [v5 reset];

  -[ADSession _clearLimbo](self, "_clearLimbo");
  -[ADSession _setSessionOpened](self, "_setSessionOpened");
  -[ADSessionRemoteServer _informDelegateOfError:](self, "_informDelegateOfError:", v6);
}

- (void)_continueSessionInitWithValidationData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantIdentifier]);
  -[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]( self,  "_sendLoadAssistantWithAccount:validationData:",  v5,  v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastAssistantDataAnchor]);
  uint64_t v8 = AFIsHorseman(v7);
  if ((v8 & 1) != 0 || (uint64_t v10 = AFSupportsPairedDevice(v8, v9), (_DWORD)v10) && (uint64_t v10 = AFIsNano(v10), (v10 & 1) == 0)) {
    uint64_t v10 = (uint64_t)-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:]( self,  "_sendSetRemoteDevicesWithAccount:",  v5);
  }
  if (AFSupportsMultiUser(v10, v11))
  {
    -[ADSessionRemoteServer _sendMultiUserInfo](self, "_sendMultiUserInfo");
    -[ADSessionRemoteServer _sendUserProfiles](self, "_sendUserProfiles");
  }

  if ([v5 needsDestruction])
  {
    unsigned int v12 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      unsigned int v14 = "-[ADSessionRemoteServer _continueSessionInitWithValidationData:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Assistant needs destruction, sending destroy",  (uint8_t *)&v13,  0xCu);
    }

    -[ADSession _sendDestroyAssistant](self, "_sendDestroyAssistant");
  }

  else
  {
    -[ADSession _sendAssistantDataAndPendingCommandsIfNeeded:]( self,  "_sendAssistantDataAndPendingCommandsIfNeeded:",  v7);
  }
}

- (void)_continueAuthWithCertificateData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  serverConnection = self->_serverConnection;
  siriNetworkServerConnection = self->_siriNetworkServerConnection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002B4FCC;
  v9[3] = &unk_1004F9A80;
  uint64_t v11 = serverConnection;
  unsigned int v12 = siriNetworkServerConnection;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v8 prepareWithCertificateData:v4 completion:v9];
}

- (void)_continueAuthentication
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  switch([v3 state])
  {
    case 0u:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _cachedServerCertificate](self, "_cachedServerCertificate"));
      unsigned __int8 v5 = (os_log_s *)AFSiriLogContextSession;
      BOOL v6 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v6)
        {
          int v20 = 136315138;
          double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Have cached certificate data, preparing",  (uint8_t *)&v20,  0xCu);
        }

        self->_usingCachedCertificateData = 1;
        -[ADSessionRemoteServer _continueAuthWithCertificateData:](self, "_continueAuthWithCertificateData:", v4);
      }

      else
      {
        if (v6)
        {
          int v20 = 136315138;
          double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Sending request for certificate data",  (uint8_t *)&v20,  0xCu);
        }

        self->_usingCachedCertificateData = 0;
        -[ADSessionRemoteServer _sendGetSessionCertificateData](self, "_sendGetSessionCertificateData");
      }

      goto LABEL_31;
    case 1u:
      uint64_t v7 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Authenticator is still preparing, let's wait",  (uint8_t *)&v20,  0xCu);
      }

      goto LABEL_32;
    case 2u:
      id v8 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Authenticator is prepared, but we still need session info",  (uint8_t *)&v20,  0xCu);
      }

      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 requestData]);
      -[ADSessionRemoteServer _sendCreateSessionInfoRequestWithData:]( self,  "_sendCreateSessionInfoRequestWithData:",  v4);
      goto LABEL_31;
    case 3u:
      uint64_t v9 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Authenticator is ready",  (uint8_t *)&v20,  0xCu);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authDataToSign](self, "_authDataToSign"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 signedDataForData:v10]);

      if (!v4)
      {
        if ((id)-[ADSession state](self, "state") == (id)6)
        {
          -[ADSessionRemoteServer _authenticationFailed](self, "_authenticationFailed");
          goto LABEL_31;
        }

        goto LABEL_27;
      }

      uint64_t v11 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        unsigned int v12 = v11;
        [v3 sessionInfoDuration];
        int v20 = 136315394;
        double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Setting cached authentication data with duration %lf",  (uint8_t *)&v20,  0x16u);
      }

      [v3 sessionInfoDuration];
      -[ADSessionRemoteServer _setCachedValidationData:withDuration:]( self,  "_setCachedValidationData:withDuration:",  v4);
      if ((id)-[ADSession state](self, "state") != (id)6)
      {
LABEL_27:
        id v16 = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315138;
          double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Not continuing with authentication as session is already active",  (uint8_t *)&v20,  0xCu);
        }

        goto LABEL_31;
      }

      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _pendingCommands](self, "_pendingCommands"));
      if ([v14 count])
      {

LABEL_30:
        -[ADSessionRemoteServer _continueSessionInitWithValidationData:]( self,  "_continueSessionInitWithValidationData:",  v4);
        goto LABEL_31;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
      unsigned int v18 = [v17 needsDestruction];

      if (v18) {
        goto LABEL_30;
      }
      id v19 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s We have no pending commands holding",  (uint8_t *)&v20,  0xCu);
      }

      -[ADSession setState:](self, "setState:", 7LL);
LABEL_31:

LABEL_32:
      return;
    case 4u:
      id v15 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315138;
        double v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Authenticator is unable to prepare.",  (uint8_t *)&v20,  0xCu);
      }

      -[ADSessionRemoteServer _authenticationFailed](self, "_authenticationFailed");
      goto LABEL_32;
    default:
      goto LABEL_32;
  }

- (void)refreshValidationData
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[ADSessionRemoteServer refreshValidationData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  self->_BOOL forceValidationRefresh = 1;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServer;
  -[ADSession refreshValidationData](&v7, "refreshValidationData");
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[ADSessionRemoteServer refreshValidationData]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (-[ADSession state](self, "state"))
  {
    if (-[ADSession state](self, "state") >= 7)
    {
      unsigned __int8 v5 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v9 = "-[ADSessionRemoteServer refreshValidationData]";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Session has already authenticated. Resetting authenticator to do it again.",  buf,  0xCu);
      }

      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
      [v6 reset];

      self->_badCachedCertRetryCounter = 0LL;
      self->_certificateFailureCounter = 0LL;
      -[ADSessionRemoteServer _continueAuthentication](self, "_continueAuthentication");
    }
  }

  else
  {
    -[ADSessionRemoteServer _startConnection](self, "_startConnection");
  }

- (void)_startSession
{
  if ((id)-[ADSession state](self, "state") == (id)5 && -[ADSession dormant](self, "dormant"))
  {
    unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADSessionRemoteServer _startSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Holding off on session start because we're dormant",  (uint8_t *)&v9,  0xCu);
    }

    return;
  }

  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADSessionRemoteServer _startSession]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Starting Session", (uint8_t *)&v9, 0xCu);
  }

  if (-[ADSessionRemoteServer _authenticationDisabled](self, "_authenticationDisabled"))
  {
    unsigned __int8 v5 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADSessionRemoteServer _startSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Skipping authentication. Disabled or on simulator",  (uint8_t *)&v9,  0xCu);
    }

    -[ADSessionRemoteServer _continueSessionInitWithValidationData:]( self,  "_continueSessionInitWithValidationData:",  0LL);
    return;
  }

  if (self->_forceValidationRefresh)
  {
    self->_BOOL forceValidationRefresh = 0;
LABEL_13:
    self->_usingCachedValidationData = 0;
    -[ADSession setState:](self, "setState:", 6LL);
    -[ADSessionRemoteServer _continueAuthentication](self, "_continueAuthentication");
    return;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _cachedValidationData](self, "_cachedValidationData"));
  if (!v6) {
    goto LABEL_13;
  }
  objc_super v7 = (void *)v6;
  id v8 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADSessionRemoteServer _startSession]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Using cached validation data",  (uint8_t *)&v9,  0xCu);
  }

  self->_usingCachedValidationData = 1;
  -[ADSessionRemoteServer _continueSessionInitWithValidationData:](self, "_continueSessionInitWithValidationData:", v7);
}

- (void)_connectionOpened
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "-[ADSessionRemoteServer _connectionOpened]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Connection opened", (uint8_t *)&v8, 0xCu);
  }

  -[ADSession _setSessionOpened](self, "_setSessionOpened");
  BOOL siriNetworkEnablementExperimentActivated = self->_siriNetworkEnablementExperimentActivated;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  if (siriNetworkEnablementExperimentActivated) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentSNConnectionType](self, "_currentSNConnectionType"));
  }
  else {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentConnectionType](self, "_currentConnectionType"));
  }
  objc_super v7 = v6;
  objc_msgSend(v5, "updateConnectionSetConnectionType:", objc_msgSend(v6, "aggregatorConnectionType"));

  -[ADSessionRemoteServer _startSession](self, "_startSession");
}

- (void)_eagerAuthDidComplete
{
  if (-[ADSession state](self, "state") > 3)
  {
    if (-[ADSession state](self, "state") < 7)
    {
      -[ADSessionRemoteServer _continueAuthentication](self, "_continueAuthentication");
    }

    else
    {
      id v4 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        objc_super v7 = "-[ADSessionRemoteServer _eagerAuthDidComplete]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s We've already authenticated, reset the authenticator since it's not needed anymore.",  (uint8_t *)&v6,  0xCu);
      }

      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
      [v5 reset];
    }
  }

  else
  {
    unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      objc_super v7 = "-[ADSessionRemoteServer _eagerAuthDidComplete]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Connection not opened yet, waiting",  (uint8_t *)&v6,  0xCu);
    }
  }

- (void)delegateDidHandleCommand:(id)a3 didRecognizeSpeech:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
    [v6 setLastReceivedCommand:v5];
  }

- (void)_handleAceObject:(id)a3
{
  Value = (const char *)a3;
  double v29 = (char *)Value;
  if (self->_commandMap)
  {
    if (!Value) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
  self->_commandMap = Mutable;
  int v8 = (const void *)objc_opt_class(&OBJC_CLASS___SAGetSessionCertificateResponse);
  CFDictionarySetValue(Mutable, v8, "_saGetSessionCertificateResponse:");
  commandMap = self->_commandMap;
  id v10 = (const void *)objc_opt_class(&OBJC_CLASS___SACreateSessionInfoResponse);
  CFDictionarySetValue(commandMap, v10, "_saCreateSessionInfoResponse:");
  uint64_t v11 = self->_commandMap;
  unsigned int v12 = (const void *)objc_opt_class(&OBJC_CLASS___SASessionValidationFailed);
  CFDictionarySetValue(v11, v12, "_saSessionValidationFailed:");
  uint64_t v13 = self->_commandMap;
  unsigned int v14 = (const void *)objc_opt_class(&OBJC_CLASS___SAAssistantCreated);
  CFDictionarySetValue(v13, v14, "_saAssistantCreated:");
  id v15 = self->_commandMap;
  id v16 = (const void *)objc_opt_class(&OBJC_CLASS___SAAssistantLoaded);
  CFDictionarySetValue(v15, v16, "_saAssistantLoaded:");
  id v17 = self->_commandMap;
  unsigned int v18 = (const void *)objc_opt_class(&OBJC_CLASS___SAAssistantDestroyed);
  CFDictionarySetValue(v17, v18, "_saAssistantDestroyed:");
  id v19 = self->_commandMap;
  int v20 = (const void *)objc_opt_class(&OBJC_CLASS___SAAssistantNotFound);
  CFDictionarySetValue(v19, v20, "_saAssistantNotFound:");
  double v21 = self->_commandMap;
  __int16 v22 = (const void *)objc_opt_class(&OBJC_CLASS___SAAssistantNotReady);
  CFDictionarySetValue(v21, v22, "_saAssistantNotReady:");
  uint64_t v23 = self->_commandMap;
  id v24 = (const void *)objc_opt_class(&OBJC_CLASS___SASetConnectionHeader);
  CFDictionarySetValue(v23, v24, "_saSetConnectionHeader:");
  id v25 = self->_commandMap;
  double v26 = (const void *)objc_opt_class(&OBJC_CLASS___SAGetAssistantData);
  CFDictionarySetValue(v25, v26, "_saGetAssistantData:");
  id v27 = self->_commandMap;
  __int16 v28 = (const void *)objc_opt_class(&OBJC_CLASS___SACommandFailed);
  CFDictionarySetValue(v27, v28, "_saCommandFailed:");
  Value = v29;
  if (v29)
  {
LABEL_3:
    id v5 = self->_commandMap;
    id v6 = (const void *)objc_opt_class(Value);
    Value = (const char *)CFDictionaryGetValue(v5, v6);
  }

- (void)_saSessionValidationFailed:(id)a3
{
  id v4 = a3;
  sessionInitCommandId = self->_sessionInitCommandId;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  unsigned __int8 v7 = -[NSString isEqualToString:](sessionInitCommandId, "isEqualToString:", v6);

  int v8 = (void *)AFSiriLogContextSession;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      id v24 = v8;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 errorCode]);
      *(_DWORD *)buf = 136315394;
      double v35 = "-[ADSessionRemoteServer _saSessionValidationFailed:]";
      __int16 v36 = 2114;
      dispatch_time_t v37 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s SASessionValidationFailed %{public}@",  buf,  0x16u);
    }

    -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
    if (self->_usingCachedValidationData)
    {
      if (objc_msgSend(v4, "ad_shouldRetry"))
      {
LABEL_6:
        self->_BOOL forceValidationRefresh = 1;
        -[ADSessionRemoteServer _startConnection](self, "_startConnection");
        goto LABEL_16;
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
      if ([v10 state])
      {
      }

      else
      {
        unsigned __int8 v11 = objc_msgSend(v4, "ad_shouldRetry");

        if ((v11 & 1) != 0) {
          goto LABEL_6;
        }
      }
    }

    id v12 = objc_msgSend(v4, "ad_afErrorCode");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v12));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionRemoteServer _generateAnalyticsContextWithError:]( self,  "_generateAnalyticsContextWithError:",  v13));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1002B4EE0;
    v30[3] = &unk_1004F9A30;
    id v16 = v14;
    id v31 = v16;
    id v32 = v4;
    [v15 logEventWithType:907 contextProvider:v30];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1002B4F80;
    v28[3] = &unk_1004FD968;
    v28[4] = self;
    id v17 = v13;
    id v29 = v17;
    unsigned int v18 = objc_retainBlock(v28);
    id v19 = v18;
    if (v12 == (id)7000)
    {
      int v20 = objc_opt_new(&OBJC_CLASS___SAUIAssistantUtteranceView);
      -[SAUIAssistantUtteranceView setText:]( v20,  "setText:",  @"AppleConnect authentication is required. Please authenticate with the SiriAuthenticator app before trying your request again.");
      double v21 = objc_opt_new(&OBJC_CLASS___SAUIAddViews);
      double v33 = v20;
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
      -[SAUIAddViews setViews:](v21, "setViews:", v22);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1002B4FC0;
      v26[3] = &unk_1004FC668;
      id v27 = v19;
      [v23 handleCommand:v21 completion:v26];
    }

    else
    {
      ((void (*)(void *))v18[2])(v18);
    }
  }

  else if (v9)
  {
    *(_DWORD *)buf = 136315138;
    double v35 = "-[ADSessionRemoteServer _saSessionValidationFailed:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "%s Unexpected refid in validation failed, ignoring",  buf,  0xCu);
  }

- (void)_saGetSessionCertificateResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 certificate]);
  if ([v5 length])
  {
    -[ADSessionRemoteServer _setCachedServerCertificate:](self, "_setCachedServerCertificate:", v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
    [v6 reset];

    -[ADSessionRemoteServer _continueAuthentication](self, "_continueAuthentication");
  }

  else
  {
    unsigned __int8 v7 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      BOOL v9 = "-[ADSessionRemoteServer _saGetSessionCertificateResponse:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s No certificate data in response trying anyway %@",  (uint8_t *)&v8,  0x16u);
    }

    -[ADSessionRemoteServer _continueSessionInitWithValidationData:]( self,  "_continueSessionInitWithValidationData:",  0LL);
  }
}

- (void)_saCreateSessionInfoResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  unsigned __int8 v6 = [v5 isEqualToString:self->_createSessionInfoRequestId];

  if ((v6 & 1) == 0)
  {
    id v12 = (os_log_s *)AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v17 = 136315138;
    unsigned int v18 = "-[ADSessionRemoteServer _saCreateSessionInfoResponse:]";
    uint64_t v13 = "%s Old session info response ignored";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, 0xCu);
    goto LABEL_16;
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionInfo]);

  if (!v7)
  {
    id v12 = (os_log_s *)AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v17 = 136315138;
    unsigned int v18 = "-[ADSessionRemoteServer _saCreateSessionInfoResponse:]";
    uint64_t v13 = "%s No valid sessionInfo returned";
    goto LABEL_9;
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionInfo]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 validityDuration]);
  double v10 = (double)(int)[v9 intValue];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  [v11 setSessionInfo:v8 duration:v10];
  if ((id)-[ADSession state](self, "state") == (id)6)
  {
    -[ADSessionRemoteServer _continueAuthentication](self, "_continueAuthentication");
  }

  else
  {
    unsigned int v14 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      unsigned int v18 = "-[ADSessionRemoteServer _saCreateSessionInfoResponse:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Saving new validity info since we're not currently authenticating",  (uint8_t *)&v17,  0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authDataToSign](self, "_authDataToSign"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 signedDataForData:v15]);

    if (v16) {
      -[ADSessionRemoteServer _setCachedValidationData:withDuration:]( self,  "_setCachedValidationData:withDuration:",  v16,  v10);
    }
  }

LABEL_16:
}

- (void)_saAssistantCreated:(id)a3
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSessionRemoteServer _saAssistantCreated:]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Assistant created response ignored",  (uint8_t *)&v4,  0xCu);
  }

- (void)_saAssistantLoaded:(id)a3
{
  id v4 = a3;
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 version]);
  unsigned __int8 v6 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v29 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Assistant Loaded Version: %@", buf, 0x16u);
  }

  sessionInitCommandId = self->_sessionInitCommandId;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  LOBYTE(sessionInitCommandId) = -[NSString isEqualToString:](sessionInitCommandId, "isEqualToString:", v8);

  if ((sessionInitCommandId & 1) == 0)
  {
    BOOL v9 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Assistant Loaded refId does not match our saved assistant command",  buf,  0xCu);
    }
  }

  if ((id)-[ADSession state](self, "state") == (id)10)
  {
    double v10 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Waiting on a pending destruction, doing nothing",  buf,  0xCu);
    }
  }

  else
  {
    if (self->_isAttemptingRetry) {
      self->_isAttemptingRetry = 0;
    }
    -[ADSession setState:](self, "setState:", 11LL);
    id v11 = self->_sessionInitCommandId;
    self->_sessionInitCommandId = 0LL;

    -[ADSession _setAssistantDataAnchorIfNeeded:](self, "_setAssistantDataAnchorIfNeeded:", v4);
    -[ADSessionRemoteServer _retrieveAndSendHomeContext](self, "_retrieveAndSendHomeContext");
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADSession _adSessionTypeString](self, "_adSessionTypeString"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
    unsigned int v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 aceHost]);

    id v15 = @"remote";
    if (v12) {
      id v15 = v12;
    }
    __int16 v22 = @"sessionType";
    uint64_t v23 = @"version";
    id v16 = &stru_1004FECA0;
    if (v5) {
      int v17 = v5;
    }
    else {
      int v17 = &stru_1004FECA0;
    }
    id v25 = v15;
    double v26 = v17;
    id v24 = @"localACEHost";
    if (v14) {
      id v16 = v14;
    }
    id v27 = v16;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v22,  3LL));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFAnalytics sharedAnalytics]( &OBJC_CLASS___AFAnalytics,  "sharedAnalytics",  v22,  v23,  v24,  v25,  v26));
    [v19 logEventWithType:924 context:v18];

    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    [v20 networkActivityStop:2 withReason:2 andError:0];

    double v21 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    [v21 networkActivityStop:2 withReason:2 andError:0 completion:0];
  }
}

- (void)_saAssistantDestroyed:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[ADSessionRemoteServer _saAssistantDestroyed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Assistant Destroyed", (uint8_t *)&v11, 0xCu);
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  [v6 clearAssistantData];
  [v6 save];
  unsigned __int8 v7 = objc_alloc_init(&OBJC_CLASS___ADAnalyticsFBFDeliveryInfrastructure);
  -[ADAnalyticsFBFDeliveryInfrastructure deliverLogViewerIdentifier:](v7, "deliverLogViewerIdentifier:", 0LL);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
  [v8 assistantSessionDidDestroyAssistant:self];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  [v9 unscheduleDestroyJob];

  -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
  if (self->_hasActiveRequest)
  {
    double v10 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADSessionRemoteServer _saAssistantDestroyed:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Restarting connection because destroy came in during active request",  (uint8_t *)&v11,  0xCu);
    }

    -[ADSessionRemoteServer _startConnection](self, "_startConnection");
  }
}

- (void)_saAssistantNotFound:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account", a3));
  if ([v4 needsDestruction])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
    [v5 unscheduleDestroyJob];
  }

  unsigned __int8 v6 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v7 = v6;
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantIdentifier]);
    int v9 = 136315394;
    double v10 = "-[ADSessionRemoteServer _saAssistantNotFound:]";
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Couldn't find the requested assistant %@; creating a new one",
      (uint8_t *)&v9,
      0x16u);
  }

  [v4 clearAssistantData];
  [v4 save];
  -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
  -[ADSessionRemoteServer _startConnection](self, "_startConnection");
}

- (void)_saAssistantNotReady:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v20 = "-[ADSessionRemoteServer _saAssistantNotReady:]";
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Assistant not ready.", buf, 0xCu);
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  6LL,  @"Assistant not ready",  0LL));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionRemoteServer _generateAnalyticsContextWithError:]( self,  "_generateAnalyticsContextWithError:",  v6));
  -[ADSession _clearLimbo](self, "_clearLimbo");
  -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1002B4E40;
  id v16 = &unk_1004F9A30;
  id v17 = v7;
  id v18 = v4;
  id v9 = v4;
  id v10 = v7;
  [v8 logEventWithType:910 contextProvider:&v13];

  -[ADSessionRemoteServer _informDelegateOfError:](self, "_informDelegateOfError:", v6, v13, v14, v15, v16);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
  [v11 networkActivityStop:2 withReason:4 andError:v6];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
  [v12 networkActivityStop:2 withReason:4 andError:v6 completion:0];
}

- (void)_saSetConnectionHeader:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  unsigned __int8 v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 aceHost]);
  unsigned __int8 v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 aceHostHeader]);
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v7) & 1) == 0)
  {
    int v8 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v27 = "-[ADSessionRemoteServer _saSetConnectionHeader:]";
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s local ACEHost:%@ setConnectionHeader ACEHost:%@",  buf,  0x20u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    id v10 = &stru_1004FECA0;
    v22[0] = @"Local";
    v22[1] = @"SAConnectionHeader";
    if (v6) {
      __int16 v11 = v6;
    }
    else {
      __int16 v11 = &stru_1004FECA0;
    }
    if (v7) {
      id v10 = v7;
    }
    v23[0] = v11;
    v23[1] = v10;
    id v24 = @"ACEHost";
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
    id v25 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    [v9 logEventWithType:926 context:v13];
  }

  [v5 setAceHost:v7];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionPolicy]);
  id v15 = v14;
  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 dictionary]);
    [v5 setConnectionPolicy:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 setConnectionPolicyDate:v17];

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 hostname]);
    [v5 setConnectionPolicyHostname:v18];
  }

  else
  {
    [v5 setConnectionPolicy:0];
    [v5 setConnectionPolicyDate:0];
    [v5 setConnectionPolicyHostname:0];
  }

  [v5 save];
  if ([v4 reconnectNow])
  {
    BOOL useWiFiHint = self->_useWiFiHint;
    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 16LL));
    LOBYTE(v21) = 0;
    -[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByError:forceReconnect:useSecondary:]( self,  "_reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByError:forceReconnect:useSecondary:",  0LL,  0LL,  0LL,  useWiFiHint,  v20,  1LL,  v21);
  }
}

- (void)_assistantFailedForReason:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_loadRetryStartTime == 0.0)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v8 systemUptime];
    self->_loadRetryStartTime = v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v10 systemUptime];
  double v12 = v11 - self->_loadRetryStartTime;

  uint64_t v13 = (os_log_s *)AFSiriLogContextSession;
  if (v12 >= 20.0)
  {
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[ADSessionRemoteServer _assistantFailedForReason:error:]";
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Assistant failure (%{public}@). Limit reached, returning error",  buf,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  3LL,  v6,  v7));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionRemoteServer _generateAnalyticsContextWithError:]( self,  "_generateAnalyticsContextWithError:",  v16));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v18 logEventWithType:909 context:v17 contextNoCopy:1];

    -[ADSession _clearLimbo](self, "_clearLimbo");
    -[ADSession setState:](self, "setState:", 4LL);
    -[ADSessionRemoteServer _informDelegateOfError:](self, "_informDelegateOfError:", v16);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    [v19 networkActivityStop:2 withReason:4 andError:v16];

    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    [v20 networkActivityStop:2 withReason:4 andError:v16 completion:0];
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[ADSessionRemoteServer _assistantFailedForReason:error:]";
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2048;
      double v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Failed loading/creating assistant %@ elapsed time %lf",  buf,  0x20u);
    }

    -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
    -[ADSession setState:](self, "setState:", 2LL);
    dispatch_time_t v14 = dispatch_time(0LL, 0LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002B4D80;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_after(v14, queue, block);
  }
}

- (void)_saCommandFailed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  int64_t v6 = -[ADSession state](self, "state");
  id v7 = [v4 errorCode];
  id v8 = (id)SAConnectionTerminatedErrorCode;
  if (v7 == (id)SAConnectionTerminatedErrorCode)
  {
    double v9 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[ADSessionRemoteServer _saCommandFailed:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v14, 0x16u);
    }

    -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
  }

  if (-[NSString isEqualToString:](self->_sessionInitCommandId, "isEqualToString:", v5))
  {
    if ((unint64_t)(v6 - 8) <= 2)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 reason]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ad_error"));
      -[ADSessionRemoteServer _assistantFailedForReason:error:](self, "_assistantFailedForReason:error:", v10, v11);
    }
  }

  else if (-[ADSession _refIdIsLimboId:](self, "_refIdIsLimboId:", v5))
  {
    double v12 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      id v15 = "-[ADSessionRemoteServer _saCommandFailed:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Ignoring command failed for limbo id %@",  (uint8_t *)&v14,  0x16u);
    }

    -[ADSession _removeLimboId:](self, "_removeLimboId:", v5);
  }

  else
  {
    -[ADSession _passObjectToDelegate:](self, "_passObjectToDelegate:", v4);
  }

  if (v7 == v8)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ad_error"));
    -[ADSessionRemoteServer _informDelegateOfError:](self, "_informDelegateOfError:", v13);
  }
}

- (void)doSendPreProcessing:(id)a3
{
  id v7 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SAClearContext);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
    [v5 clearNakedObjects];
  }

  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _retryManager](self, "_retryManager"));
  [v6 appendSessionObjectToRequest:v7];
}

- (void)_sendServerCommandLogErrorForCommand:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002B4C74;
  v10[3] = &unk_1004F9A30;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 logEventWithType:1201 contextProvider:v10];
}

- (void)_sendServerCommand:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "siriCore_invokeThunk");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);

  if (!v5)
  {
    uint64_t v7 = SiriCoreUUIDStringCreate(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v4 setAceId:v8];
  }

  id v9 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v27 = "-[ADSessionRemoteServer _sendServerCommand:]";
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    Class v10 = NSClassFromString(@"SiriCoreSpeechPacket");
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      id v11 = (void *)objc_opt_new(&OBJC_CLASS___SNSpeechPacket);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
      [v11 setAceId:v12];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
      [v11 setRefId:v13];

      int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 packets]);
      [v11 setPackets:v14];

      objc_msgSend(v11, "setPacketNumber:", objc_msgSend(v4, "packetNumber"));
      id v15 = v11;
    }

    else
    {
      id v15 = 0LL;
      id v11 = v4;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkServerConnection](self, "_siriNetworkServerConnection"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    void v22[2] = sub_1002B482C;
    v22[3] = &unk_1004F9AD0;
    id v23 = v4;
    __int16 v24 = self;
    objc_copyWeak(&v25, (id *)buf);
    [v17 sendCommand:v11 completion:v22];

    objc_destroyWeak(&v25);
  }

  else
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _serverConnection](self, "_serverConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002B49F4;
    v18[3] = &unk_1004F9AD0;
    id v19 = v4;
    int v20 = self;
    objc_copyWeak(&v21, (id *)buf);
    [v16 sendCommand:v19 errorHandler:v18];

    objc_destroyWeak(&v21);
    id v15 = v19;
  }

  objc_msgSend(v4, "siriCore_logDiagnostics");
  objc_destroyWeak((id *)buf);
}

- (void)_sendServerCommands:(id)a3
{
  id v36 = a3;
  dispatch_time_t v37 = self;
  objc_initWeak(&location, self);
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v5 = v36;
    id v6 = [v5 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v47;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v47 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          objc_msgSend(v9, "siriCore_invokeThunk", v36);
          Class v10 = (void *)objc_claimAutoreleasedReturnValue([v9 aceId]);
          BOOL v11 = v10 == 0LL;

          if (v11)
          {
            uint64_t v13 = SiriCoreUUIDStringCreate(v12);
            int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            [v9 setAceId:v14];
          }

          Class v15 = NSClassFromString(@"SiriCoreSpeechPacket");
          char isKindOfClass = objc_opt_isKindOfClass(v9, v15);
          id v17 = (void *)objc_opt_new(&OBJC_CLASS___SNSpeechPacket);
          id v18 = v9;
          if ((isKindOfClass & 1) != 0)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aceId", v9));
            [v17 setAceId:v19];

            int v20 = (void *)objc_claimAutoreleasedReturnValue([v9 refId]);
            [v17 setRefId:v20];

            id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 packets]);
            [v17 setPackets:v21];

            objc_msgSend(v17, "setPacketNumber:", objc_msgSend(v9, "packetNumber"));
            id v18 = v17;
          }

          -[NSMutableArray addObject:](v4, "addObject:", v18);
          __int16 v22 = (os_log_s *)AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v53 = "-[ADSessionRemoteServer _sendServerCommands:]";
            __int16 v54 = 2112;
            __int16 v55 = v9;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }

      while (v6);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _siriNetworkServerConnection](v37, "_siriNetworkServerConnection"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1002B43CC;
    v44[3] = &unk_1004F9AF8;
    v44[4] = v37;
    objc_copyWeak(&v45, &location);
    [v23 sendCommands:v4 completion:v44];

    objc_destroyWeak(&v45);
  }

  else
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v24 = v36;
    id v25 = [v24 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v41;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v24);
          }
          __int16 v28 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
          objc_msgSend(v28, "siriCore_invokeThunk", v36);
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 aceId]);
          BOOL v30 = v29 == 0LL;

          if (v30)
          {
            uint64_t v32 = SiriCoreUUIDStringCreate(v31);
            double v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            [v28 setAceId:v33];
          }

          BOOL v34 = (os_log_s *)AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v53 = "-[ADSessionRemoteServer _sendServerCommands:]";
            __int16 v54 = 2112;
            __int16 v55 = v28;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
          }
        }

        id v25 = [v24 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }

      while (v25);
    }

    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _serverConnection](v37, "_serverConnection"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1002B45A0;
    v38[3] = &unk_1004F9B20;
    v38[4] = v37;
    objc_copyWeak(&v39, &location);
    [v35 sendCommands:v24 errorHandler:v38];

    objc_destroyWeak(&v39);
  }

  objc_destroyWeak(&location);
}

- (void)_sendGetSessionCertificateData
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    Class v10 = "-[ADSessionRemoteServer _sendGetSessionCertificateData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___SAGetSessionCertificate);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[ADAuthenticator authenticationStrategyVersion]( self->_authenticator,  "authenticationStrategyVersion")));
  -[SAGetSessionCertificate setDeviceAuthVersion:](v4, "setDeviceAuthVersion:", v5);

  -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v4);
  if ((id)-[ADSession state](self, "state") != (id)11)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAGetSessionCertificate aceId](v4, "aceId"));
    uint64_t v7 = (NSString *)[v6 copy];
    sessionInitCommandId = self->_sessionInitCommandId;
    self->_sessionInitCommandId = v7;
  }
}

- (void)_sendCreateSessionInfoRequestWithData:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    Class v15 = "-[ADSessionRemoteServer _sendCreateSessionInfoRequestWithData:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___SACreateSessionInfoRequest);
  [v6 setSessionInfoRequest:v4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[ADAuthenticator authenticationStrategyVersion]( self->_authenticator,  "authenticationStrategyVersion")));
  [v6 setDeviceAuthVersion:v7];

  -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v6);
  if ((id)-[ADSession state](self, "state") != (id)11)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    int v9 = (NSString *)[v8 copy];
    sessionInitCommandId = self->_sessionInitCommandId;
    self->_sessionInitCommandId = v9;
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
  uint64_t v12 = (NSString *)[v11 copy];
  createSessionInfoRequestId = self->_createSessionInfoRequestId;
  self->_createSessionInfoRequestId = v12;
}

- (void)_triggerABCForEmptyLocale
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[ADSessionRemoteServer _triggerABCForEmptyLocale]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Reporting missing LoadAssistant locale to ABC",  buf,  0xCu);
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ADSession _requestId](self, "_requestId"));
  id v5 = (void *)v4;
  if (v4)
  {
    Class v10 = @"refID";
    uint64_t v11 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    id v6 = &__NSDictionary0__struct;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v9 = [v8 processIdentifier];
  [v7 reportIssueForType:@"LoadAssistant" subType:@"null_locale" context:v6 processIdentifier:v9 walkboutStatus:byte_1005780A0];
}

- (id)_hubAccount
{
  hubAccount = self->_hubAccount;
  if (!hubAccount)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    id v5 = (ADAccount *)objc_claimAutoreleasedReturnValue([v4 _hubAccount]);
    id v6 = self->_hubAccount;
    self->_hubAccount = v5;

    hubAccount = self->_hubAccount;
  }

  return hubAccount;
}

- (void)_sendLoadAssistantWithAccount:(id)a3 validationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession languageCode](self, "languageCode"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession connectionMode](self, "connectionMode"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 assistantIdentifier]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 loggingAssistantIdentifier]);
  id v68 = v6;
  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 speechIdentifier]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ADSession sharedUserIdentifier](self, "sharedUserIdentifier"));
  BOOL v74 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession loggingSharedUserIdentifier](self, "loggingSharedUserIdentifier"));
  uint64_t v15 = _AFPreferencesSiriDataSharingOptInStatus(v74, v14);
  id v16 = sub_10010D8F4(v15);
  BOOL v73 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider sharedInstance]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "sharedInstance"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v17 ephemeralIdForDefaultUser]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v66 = [v18 longLivedIdentifierUploadingEnabled];

  v70 = (void *)v13;
  if (![v8 length])
  {
    -[ADSessionRemoteServer _triggerABCForEmptyLocale](self, "_triggerABCForEmptyLocale");
    id v19 = AFDefaultLanguageCode;

    id v8 = v19;
  }

  int v20 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315907;
    v80 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
    __int16 v81 = 2113;
    uint64_t v82 = v10;
    __int16 v83 = 2113;
    v84 = v12;
    __int16 v85 = 2112;
    unsigned int v86 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s assistantId: %{private}@ speechId: %{private}@ with language %@",  buf,  0x2Au);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
  [v21 networkActivityStart:2 activate:1];

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
  [v22 networkActivityStart:2 activate:1 completion:0];

  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v69 = v7;
    id v23 = v8;
    id v24 = v12;
    uint64_t v25 = v11;
    uint64_t v26 = v10;
    double v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _hubAccount](self, "_hubAccount"));
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 assistantIdentifier]);
    id v29 = SAConnectionModeSideKickValue;

    BOOL v30 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v80 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
      __int16 v81 = 2113;
      uint64_t v82 = (uint64_t)v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s hubAssistantId: %{private}@", buf, 0x16u);
    }

    id v9 = v29;
    uint64_t v10 = v26;
    uint64_t v31 = (void *)v25;
    uint64_t v12 = v24;
    id v8 = v23;
    id v7 = v69;
  }

  else
  {
    __int16 v28 = 0LL;
    uint64_t v31 = (void *)v11;
  }

  id v32 = objc_alloc_init(&OBJC_CLASS___SALoadAssistant);
  [v32 setHubAssistantId:v28];
  [v32 setSessionValidationData:v7];

  [v32 setAssistantId:v10];
  __int16 v67 = v31;
  [v32 setLoggableAssistantId:v31];
  id v33 = [v32 setSpeechId:v12];
  else {
    double v35 = v70;
  }
  [v32 setSharedUserId:v35];
  [v32 setLoggableSharedUserId:v74];
  [v32 setLanguage:v8];
  [v32 setConnectionMode:v9];
  v71 = (const __CFString *)v10;
  if (self->_siriNetworkEnablementExperimentActivated) {
    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[ADSession _saSNConnectionType](self, "_saSNConnectionType"));
  }
  else {
    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[ADSession _saConnectionType](self, "_saConnectionType"));
  }
  dispatch_time_t v37 = (void *)v36;
  [v32 setConnectionType:v36];

  objc_msgSend(v32, "setGmDevice:", AFDeviceSupportsGM(objc_msgSend(v32, "setDataSharingOptInStatus:", v73)));
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 singleUserCompanionACEHost]);
  [v32 setLastKnownAceHostOfCompanion:v39];

  uint64_t v40 = _AFPreferencesSyncFromWatchEnabled();
  if (!(_DWORD)v40 || AFIsHorseman(v40))
  {
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v68 peerAssistantIdentifier]);
    [v32 setLinkedAssistantId:v41];

    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v68 peerSpeechIdentifier]);
    [v32 setLinkedSpeechId:v42];
  }

  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v43 authenticationStrategyVersion]));
  [v32 setDeviceAuthVersion:v44];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_100577A08);
  id v45 = (id)qword_100577A00;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100577A08);
  [v32 setExperiments:v45];

  if (v72)
  {
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v72 UUIDString]);
    [v32 setEphemeralUserId:v46];
  }

  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v66 ^ 1));
  [v32 setRpiEnabled:v47];

  -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v32);
  __int128 v48 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    __int128 v49 = v48;
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v32 dictionary]);
    *(_DWORD *)buf = 136315394;
    v80 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
    __int16 v81 = 2112;
    uint64_t v82 = (uint64_t)v50;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v32 aceId]);
  double v52 = (NSString *)[v51 copy];
  sessionInitCommandId = self->_sessionInitCommandId;
  self->_sessionInitCommandId = v52;

  -[ADSession setState:](self, "setState:", 9LL);
  __int16 v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ADSession _adSessionTypeString](self, "_adSessionTypeString"));
  if ((AFIsInternalInstall(v54) & 1) != 0
    || (__int16 v55 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences")),
        unsigned int v56 = [v55 shouldLogForQA],
        v55,
        v56))
  {
    __int16 v57 = @"remote";
    if (v54) {
      __int16 v57 = v54;
    }
    v77[0] = @"sessionType";
    v77[1] = @"assistantId";
    id v58 = &stru_1004FECA0;
    __int16 v59 = (__CFString *)v71;
    if (v71) {
      __int128 v60 = v71;
    }
    else {
      __int128 v60 = &stru_1004FECA0;
    }
    v78[0] = v57;
    v78[1] = v60;
    v77[2] = @"speechId";
    if (v12) {
      id v58 = v12;
    }
    v78[2] = v58;
    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  3LL));
  }

  else
  {
    if (v54) {
      __int128 v62 = v54;
    }
    else {
      __int128 v62 = @"remote";
    }
    BOOL v75 = @"sessionType";
    BOOL v76 = v62;
    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
    __int16 v59 = (__CFString *)v71;
  }

  unint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v63 logEventWithType:920 context:v61];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  __int16 v65 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v65, &stru_1004F9B40);
}

- (void)_sendSetRemoteDevicesWithAccount:(id)a3 multiUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v115 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___SASetRemoteDevices);
  uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = AFSupportsMultiUser(v10, v11);
  p_superclass = (__objc2_class **)(&OBJC_CLASS___ADAnnounceIncomingCallRequest + 8);
  v97 = v10;
  if ((_DWORD)v12)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 infoForThisDevice]);

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 peerAssistantIdentifier]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 companionIdentifier]);

    if (!v17 && v19)
    {
      int v20 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v115 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Getting assistantID from ADDeviceCircleManager",  buf,  0xCu);
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v21 assistantIdForDeviceWithIdsDeviceUniqueIdentifier:v19]);
    }

    v93 = v19;
    id v98 = (void *)v17;
    if (v17)
    {
      v84 = v16;
      id v86 = v9;
      v88 = self;
      v91 = v6;
      os_log_t log = (os_log_t)objc_alloc_init(&OBJC_CLASS___SARemoteDevice);
      -[os_log_s setAssistantId:](log, "setAssistantId:", v17);
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      id v89 = v7;
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 homeMembers]);
      id v23 = [v22 countByEnumeratingWithState:&v109 objects:v127 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v110;
        uint64_t v26 = SAHomeMemberInfoAttributeOWNERValue;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v110 != v25) {
              objc_enumerationMutation(v22);
            }
            __int16 v28 = *(void **)(*((void *)&v109 + 1) + 8LL * (void)i);
            __int128 v105 = 0u;
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            __int128 v108 = 0u;
            id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "attributes", v84));
            id v30 = [v29 countByEnumeratingWithState:&v105 objects:v126 count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v106;
              while (2)
              {
                for (j = 0LL; j != v31; j = (char *)j + 1)
                {
                  if (*(void *)v106 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  if ([*(id *)(*((void *)&v105 + 1) + 8 * (void)j) isEqualToString:v26])
                  {
                    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v28 companionAssistantId]);
                    unsigned __int8 v35 = [v34 isEqualToString:v98];

                    if ((v35 & 1) == 0)
                    {
                      uint64_t v36 = (void *)AFSiriLogContextSession;
                      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                      {
                        dispatch_time_t v37 = v36;
                        __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v28 companionAssistantId]);
                        *(_DWORD *)buf = 136315650;
                        v115 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
                        __int16 v116 = 2112;
                        v117 = v98;
                        __int16 v118 = 2112;
                        v119 = v38;
                        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%s assistant id mismatch\tpeerAssistantID:%@\tprimary multiuser assistantID:%@",  buf,  0x20u);
                      }

                      id v39 = (void *)objc_claimAutoreleasedReturnValue([v28 companionAssistantId]);

                      if (v39)
                      {
                        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v28 companionAssistantId]);
                        -[os_log_s setAssistantId:](log, "setAssistantId:", v40);
                      }
                    }

                    goto LABEL_29;
                  }
                }

                id v31 = [v29 countByEnumeratingWithState:&v105 objects:v126 count:16];
                if (v31) {
                  continue;
                }
                break;
              }
            }

- (void)_sendSetRemoteDevicesWithAccount:(id)a3
{
}

- (void)sendRemoteGizmoDeviceToServer:(id)a3
{
  p_pairedWatchUniqueId = (id *)&self->_pairedWatchUniqueId;
  id v7 = a3;
  if ((objc_msgSend(*p_pairedWatchUniqueId, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pairedWatchUniqueId, a3);
    if (*p_pairedWatchUniqueId)
    {
      if (-[ADSession state](self, "state") >= 9)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
        -[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:](self, "_sendSetRemoteDevicesWithAccount:", v6);
      }
    }
  }
}

- (void)_sendMultiUserInfo
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 multiUserSAObject]);

  if (v5)
  {
    -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v5);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
    -[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]( self,  "_sendSetRemoteDevicesWithAccount:multiUserInfo:",  v4,  v5);
  }
}

- (void)_sendUserProfiles
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADUserProfileService sharedService](&OBJC_CLASS___ADUserProfileService, "sharedService"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 getUserProfileAceCommand]);

  -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v4);
}

- (void)_sendHomeContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)AFSiriLogContextSession;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 entities]);
      id v9 = sub_1002B41C8(v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 currentHomes]);
      id v12 = sub_1002B41C8(v11);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 136315650;
      uint64_t v15 = "-[ADSessionRemoteServer _sendHomeContext:]";
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s entities %@ \ncurrentHomes %@",  (uint8_t *)&v14,  0x20u);
    }

    -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v4);
  }

  else if (v6)
  {
    int v14 = 136315138;
    uint64_t v15 = "-[ADSessionRemoteServer _sendHomeContext:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "%s No homeContext to send",  (uint8_t *)&v14,  0xCu);
  }
}

- (void)_retrieveAndSendHomeContext
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002B4134;
  v4[3] = &unk_1004F9B68;
  v4[4] = self;
  [v3 getHomeContext:v4];
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(&OBJC_CLASS___ADSessionBarrier);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B4010;
  v7[3] = &unk_1004F9B90;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  BOOL v6 = -[ADSessionBarrier initWithThunk:barrier:](v5, "initWithThunk:barrier:", v7, v4);
  -[ADSession sendCommand:opportunistically:](self, "sendCommand:opportunistically:", v6, 1LL);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_homeInfoDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B3F44;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_homeContextDidChange:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002B3E50;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_sidekickDeviceIdentifierDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B3D78;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_companionServiceStateDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B3CAC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_multiUsersDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B3BF4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B3A74;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)networkManagerLostNonWWANConnectivity:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B39A8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_recheckForWiFiTransition
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADSessionRemoteServer _recheckForWiFiTransition]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  if ((id)-[ADSession state](self, "state") == (id)11
    && -[ADSessionRemoteServer _connectionIsWWAN](self, "_connectionIsWWAN"))
  {
    id v4 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADSessionRemoteServer _recheckForWiFiTransition]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Asking delegate if we should restart on wifi",  (uint8_t *)&v8,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
    unsigned int v6 = [v5 assistantSessionShouldRestartConnectionOnWiFi:self];

    if (v6)
    {
      id v7 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315138;
        id v9 = "-[ADSessionRemoteServer _recheckForWiFiTransition]";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Switching to WiFi on request end",  (uint8_t *)&v8,  0xCu);
      }

      -[ADSessionRemoteServer _resetServerConnection](self, "_resetServerConnection");
      -[ADSessionRemoteServer _startConnection](self, "_startConnection");
    }
  }

- (void)networkManagerNetworkUnreachable:(id)a3
{
  uint64_t v3 = AFIsNano(self);
  if ((_DWORD)v3)
  {
    uint64_t v4 = AFIsNano(v3);
    if ((_DWORD)v4)
    {
      id v5 = +[ADSharedPeerStreamConnection sharedPeerStreamConnectionWithServiceIdentifier:listener:]( &OBJC_CLASS___ADSharedPeerStreamConnection,  "sharedPeerStreamConnectionWithServiceIdentifier:listener:",  @"com.apple.private.alloy.siri.proxy",  AFIsNano(v4) ^ 1);
      id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      [v6 preheat];
    }
  }

- (void)_forceFastDormancy
{
  if (self->_siriNetworkEnablementExperimentActivated) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkManager sharedInstance](&OBJC_CLASS___SNNetworkManager, "sharedInstance"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _networkManager](self, "_networkManager"));
  }
  id v3 = v2;
  [v2 forceFastDormancy];
}

- (void)_releaseDormancySuspension
{
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    -[SNConnection setSendPings:](self->_siriNetworkServerConnection, "setSendPings:", 0LL);
    id v3 = &OBJC_CLASS___SNNetworkManager;
    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    id v5 = p_dormancySuspendAssertion;
  }

  else
  {
    -[SiriCoreSiriConnection setSendPings:](self->_serverConnection, "setSendPings:", 0LL);
    id v3 = &OBJC_CLASS___SiriCoreNetworkManager;
    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    id v5 = *p_dormancySuspendAssertion;
  }

  [v3 releaseDormancySuspendAssertion:v5];
  void *p_dormancySuspendAssertion = 0LL;
}

- (void)_resetConnectionPolicyBlacklisting
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  [v2 setConnectionPolicyFailureCount:0];
  [v2 setConnectionPolicyFirstFailureDate:0];
}

- (void)_adjustAceHeaderTimeout:(BOOL)a3
{
  double v3 = -1.0;
  if (a3) {
    double v3 = 1.0;
  }
  double v4 = self->_aceHeaderTimeout + v3;
  self->_aceHeaderTimeout = v4;
  double v5 = 8.0;
  if (v4 > 8.0 || (double v5 = 5.0, v4 < 5.0)) {
    self->_aceHeaderTimeout = v5;
  }
}

- (void)_createAssistant
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v13 assistantIdentifier]);
  if (!v3)
  {
    [v13 clearAssistantData];
    [v13 updateAssistantIdentifiers];
  }

  [v13 setNeedsCreation:0];
  [v13 save];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authenticator](self, "_authenticator"));
  if ([v4 state] == 3)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _authDataToSign](self, "_authDataToSign"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 signedDataForData:v5]);

    [v4 sessionInfoDuration];
    -[ADSessionRemoteServer _setCachedValidationData:withDuration:](self, "_setCachedValidationData:withDuration:", v6);
  }

  else
  {
    -[ADSessionRemoteServer _setCachedValidationData:withDuration:]( self,  "_setCachedValidationData:withDuration:",  0LL,  0.0);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v7 setTLSSessionTicketsFlushPending:0];

  if (!v3)
  {
    else {
      int v8 = 0LL;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v9 speechIdUpdatedForEndpointUUID:v8];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession delegate](self, "delegate"));
    [v10 assistantSessionDidCreateAssistant:self];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v12, &stru_1004F9BB0);
  }
}

- (void)_probeSessionIfIdle
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  double v5 = v4;

  if (v5 - self->_requestEndTime > 55.0)
  {
    id v6 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADSessionRemoteServer _probeSessionIfIdle]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Probing the connection", (uint8_t *)&v8, 0xCu);
    }

    if (self->_siriNetworkEnablementExperimentActivated) {
      id v7 = &OBJC_IVAR___ADSessionRemoteServer__siriNetworkServerConnection;
    }
    else {
      id v7 = &OBJC_IVAR___ADSessionRemoteServer__serverConnection;
    }
    [*(id *)((char *)&self->super.super.isa + *v7) probeConnection];
  }

- (id)_generateAnalyticsContextWithError:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v6 = -[ADSession state](self, "state");
  if (v6 > 0xB) {
    id v7 = @"unknown";
  }
  else {
    id v7 = *(&off_1004F6E78 + v6);
  }
  int v8 = v7;
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, @"sessionState");
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentSNConnectionType](self, "_currentSNConnectionType"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 technologyDescription]);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _currentConnectionType](self, "_currentConnectionType"));
    uint64_t Description = SiriCoreConnectionTechnologyGetDescription([v9 technology]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(Description);
  }

  id v12 = (void *)v10;

  if (v12) {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, @"connectionType");
  }
  currentConnectionURL = self->_currentConnectionURL;
  if (currentConnectionURL)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](currentConnectionURL, "absoluteString"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, @"connectionURL");
  }

  currentConnectionHostname = self->_currentConnectionHostname;
  if (currentConnectionHostname) {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", currentConnectionHostname, @"connectionURL");
  }
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession connectionMode](self, "connectionMode"));

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession connectionMode](self, "connectionMode"));
    id v18 = [v17 copy];
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v18, @"connectionMode");
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession languageCode](self, "languageCode"));

  if (v19)
  {
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession languageCode](self, "languageCode"));
    id v21 = [v20 copy];
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v21, @"languageCode");
  }

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ADSession dormant](self, "dormant")));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v22, @"dormant");

  if (v4)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v24 = v23;
    if (v23)
    {
      id v25 = [v23 copy];
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v25, @"errorDomain");
    }

    id v58 = v24;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v26, @"errorCode");

    double v27 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSUnderlyingErrorKey]);

    if (v28)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
      id v30 = v29;
      if (v29)
      {
        id v31 = [v29 copy];
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v31, @"underlyingErrorDomain");
      }

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 code]));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v32, @"underlyingErrorCode");
    }

    uint64_t v57 = v28;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v34 = SiriCoreSiriConnectionHTTPErrorStatusCodeKey;
    unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:SiriCoreSiriConnectionHTTPErrorStatusCodeKey]);

    if (v35)
    {
      __int16 v55 = v12;
      uint64_t v56 = v8;
      uint64_t v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      BOOL siriNetworkEnablementExperimentActivated = self->_siriNetworkEnablementExperimentActivated;
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v35 stringValue]);
      if (siriNetworkEnablementExperimentActivated) {
        uint64_t v39 = SiriNetworkBackgroundConnectionHTTPErrorStatusCodeKey;
      }
      else {
        uint64_t v39 = v34;
      }
      -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v38, v39);

      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:NSLocalizedDescriptionKey]);

      if (v41)
      {
        id v42 = [v41 copy];
        -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v42, NSLocalizedDescriptionKey);
      }

      BOOL v43 = self->_siriNetworkEnablementExperimentActivated;
      unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v45 = v44;
      uint64_t v46 = SiriCoreSiriConnectionHTTPRedirectValueKey;
      uint64_t v47 = SiriNetworkBackgroundConnectionHTTPRedirectValueKey;
      if (v43) {
        uint64_t v48 = SiriNetworkBackgroundConnectionHTTPRedirectValueKey;
      }
      else {
        uint64_t v48 = SiriCoreSiriConnectionHTTPRedirectValueKey;
      }
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v48]);

      if (v49)
      {
        BOOL v50 = self->_siriNetworkEnablementExperimentActivated;
        id v51 = [v49 copy];
        if (v50) {
          uint64_t v52 = v47;
        }
        else {
          uint64_t v52 = v46;
        }
        -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v51, v52);
      }

      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v36, @"userInfo");

      id v12 = v55;
      int v8 = v56;
    }
  }

  id v53 = -[NSMutableDictionary copy](v5, "copy");

  return v53;
}

- (void)_sendSidekickHubDeviceInfo
{
  double v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[ADSessionRemoteServer _sendSidekickHubDeviceInfo]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v16, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAccessoryInfo]);

  id v6 = objc_alloc_init(&OBJC_CLASS___SASidekickHubDeviceInfo);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer _hubAccount](self, "_hubAccount"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 speechIdentifier]);
  [v6 setHubUserId:v8];

  uint64_t v11 = AFProductType(v9, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v6 setHubDeviceType:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantIdentifier]);
  [v6 setAccessoryIdentifier:v13];

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 manufacturer]);
  [v6 setSidekickBrand:v14];

  [v6 setSidekickDeviceType:@"HomeKitAccessory"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AFPreferences sharedPreferencesWithInstanceContext:]( &OBJC_CLASS___AFPreferences,  "sharedPreferencesWithInstanceContext:",  self->_instanceContext));
  objc_msgSend(v6, "setMediaPlaybackEnabled:", objc_msgSend(v15, "mediaPlaybackEnabled"));

  -[ADSessionRemoteServer _sendServerCommand:](self, "_sendServerCommand:", v6);
}

- (void)assistantDataManagerDictationHIPAAMDMStatusDidChange
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B396C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getConnectionMetrics:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }

    else
    {
      v18[0] = 0LL;
      v18[1] = v18;
      v18[2] = 0x3032000000LL;
      v18[3] = sub_1002B35CC;
      void v18[4] = sub_1002B35DC;
      id v19 = 0LL;
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x3032000000LL;
      v16[3] = sub_1002B35CC;
      v16[4] = sub_1002B35DC;
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      serverConnection = self->_serverConnection;
      uint64_t v17 = v6;
      if (serverConnection)
      {
        dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
        int v8 = self->_serverConnection;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1002B3808;
        v15[3] = &unk_1004F9C00;
        v15[4] = self;
        void v15[5] = v16;
        -[SiriCoreSiriConnection getConnectionMetricsSynchronously:completion:]( v8,  "getConnectionMetricsSynchronously:completion:",  0LL,  v15);
      }

      metricsGroup = self->_metricsGroup;
      queue = (dispatch_queue_s *)self->_queue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1002B3894;
      v11[3] = &unk_1004F9C28;
      id v13 = v16;
      v11[4] = self;
      int v14 = v18;
      id v12 = v5;
      dispatch_group_notify((dispatch_group_t)metricsGroup, queue, v11);

      _Block_object_dispose(v16, 8);
      _Block_object_dispose(v18, 8);
    }
  }
}

- (void)getSNConnectionMetrics:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      v18[0] = 0LL;
      v18[1] = v18;
      v18[2] = 0x3032000000LL;
      v18[3] = sub_1002B35CC;
      void v18[4] = sub_1002B35DC;
      id v19 = 0LL;
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x3032000000LL;
      v16[3] = sub_1002B35CC;
      v16[4] = sub_1002B35DC;
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      siriNetworkServerConnection = self->_siriNetworkServerConnection;
      uint64_t v17 = v6;
      if (siriNetworkServerConnection)
      {
        dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
        int v8 = self->_siriNetworkServerConnection;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1002B35E4;
        v15[3] = &unk_1004F9C50;
        void v15[5] = v16;
        void v15[6] = v18;
        v15[4] = self;
        -[SNConnection getSNConnectionMetrics:completion:](v8, "getSNConnectionMetrics:completion:", 0LL, v15);
      }

      metricsGroup = self->_metricsGroup;
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002B3730;
      block[3] = &unk_1004F9C28;
      id v13 = v16;
      block[4] = self;
      int v14 = v18;
      id v12 = v5;
      dispatch_group_notify((dispatch_group_t)metricsGroup, queue, block);

      _Block_object_dispose(v16, 8);
      _Block_object_dispose(v18, 8);
    }

    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
  }
}

- (id)currentConnectionPreCachedMetrics
{
  metricsCache = self->_metricsCache;
  if (metricsCache)
  {
    id v4 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      int v8 = "-[ADSessionRemoteServer currentConnectionPreCachedMetrics]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Using precached metrics",  (uint8_t *)&v7,  0xCu);
      metricsCache = self->_metricsCache;
    }

    id v5 = -[NSMutableArray copy](metricsCache, "copy");
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)currentSNConnectionPreCachedMetrics
{
  snMetricsCache = self->_snMetricsCache;
  if (snMetricsCache)
  {
    id v4 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      int v8 = "-[ADSessionRemoteServer currentSNConnectionPreCachedMetrics]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Using precached SNMetrics",  (uint8_t *)&v7,  0xCu);
      snMetricsCache = self->_snMetricsCache;
    }

    id v5 = -[NSMutableArray copy](snMetricsCache, "copy");
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (void)_getReportSymptomsBasedNetworkQualityMetrics:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreNetworkManager sharedInstance](&OBJC_CLASS___SiriCoreNetworkManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002B6B5C;
  v6[3] = &unk_1004F9BD8;
  id v7 = v3;
  id v5 = v3;
  [v4 getQualityReport:v6];
}

@end