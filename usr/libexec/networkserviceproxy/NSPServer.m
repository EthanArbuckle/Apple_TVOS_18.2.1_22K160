@interface NSPServer
- (BOOL)canIgnoreInvalidCertsOnInternalBuild;
- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4;
- (BOOL)isSubscriberUnlimited;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)networkDiscoveredProxyInTrustedProxyList:(id)a3;
- (BOOL)subscriberTierIsProhibited:(id)a3;
- (BOOL)usesDefaultConfigurationServer;
- (NSPServer)init;
- (id)getSavedPrivateCloudComputeEnvironment;
- (void)authInfoChanged:(id)a3;
- (void)badTokenInfoForProxy:(id)a3;
- (void)checkPrivacyProxyConnectivityOnInterface:(id)a3 proxyConnectivityCheckType:(unint64_t)a4 completionHandler:(id)a5;
- (void)cloudSubscriptionChanged:(BOOL)a3 configManager:(id)a4;
- (void)configDisabled:(id)a3;
- (void)configEnabled:(id)a3;
- (void)configEpochChanged:(id)a3;
- (void)configFetched:(id)a3;
- (void)configUpdated:(id)a3;
- (void)configurationRestart:(id)a3;
- (void)didUpdateCountryPlusTimezone:(id)a3;
- (void)didUpdateGeohash:(id)a3;
- (void)didUpdateSignificantLocation;
- (void)disableCellularNetwork:(id)a3;
- (void)disableInterface:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)disableWiFiNetwork:(id)a3;
- (void)effectiveUserTierChanged:(id)a3;
- (void)geohashSettingsChanged:(id)a3;
- (void)handleDNSAgentErrorReport:(id)a3 error:(int)a4;
- (void)multiHopProxyAgentRegistered:(BOOL)a3;
- (void)networkDiscoveredProxyPaths:(id)a3 registeredForAgentUUID:(id)a4;
- (void)networkSignatureChanged;
- (void)obliviousHopAgentRegisteredForHostname:(id)a3 processes:(id)a4 agentUUID:(id)a5;
- (void)obliviousHopAgentUnregisteredForHostname:(id)a3 agentUUID:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)policiesUpdated:(id)a3 policy:(id)a4 resolverInfoChanged:(BOOL)a5;
- (void)preferredProxyAgentRegistered:(id)a3 agentUUID:(id)a4 domainFilter:(id)a5;
- (void)preferredProxyAgentUnregistered:(id)a3;
- (void)privateAccessTokensEnabledChanged:(id)a3;
- (void)proxiedContentMaps:(id)a3 registeredForAgentUUID:(id)a4;
- (void)proxiedContentMapsUnregisteredForAgentUUID:(id)a3;
- (void)proxyConnectivityActive;
- (void)proxyConnectivityNetworkOutage;
- (void)proxyConnectivityOutage;
- (void)proxyInfoChanged:(id)a3;
- (void)proxyTokenFetchDisabled:(id)a3;
- (void)proxyTokenFetchEnabled:(id)a3;
- (void)refreshProxyInfo:(unint64_t)a3;
- (void)reportActivityForApp:(id)a3 path:(id)a4;
- (void)reportPrivacyProxySuccessOnInterface:(id)a3;
- (void)requestAccessTokenWithCompletionHandler:(id)a3;
- (void)resumePrivacyProxy:(id)a3;
- (void)singleHopProxyAgentRegistered:(BOOL)a3;
- (void)suspendPrivacyProxyTemporarily:(id)a3;
- (void)tokenFetchActive;
- (void)tokenFetchOutage;
- (void)tokenIssuanceAllowed;
- (void)tokenIssuanceLimitReached;
- (void)updateSavedPrivateCloudComputeEnvironment:(id)a3;
- (void)userPreferredTierChanged:(id)a3;
- (void)userTierChanged:(id)a3;
@end

@implementation NSPServer

- (NSPServer)init
{
  v71.receiver = self;
  v71.super_class = (Class)&OBJC_CLASS___NSPServer;
  id v2 = -[NSPServer init](&v71, "init");
  if (!v2)
  {
LABEL_21:
    v29 = (NSPServer *)v2;
    goto LABEL_22;
  }

  v3 = objc_alloc_init(&OBJC_CLASS___NSPServerFlowDivert);
  v4 = (void *)*((void *)v2 + 33);
  *((void *)v2 + 33) = v3;

  if (!*((void *)v2 + 33))
  {
    uint64_t v58 = nplog_obj(v5, v6, v7);
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_FAULT,  "%s called with null _serverFlowDivert",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_31;
  }

  v8 = objc_alloc_init(&OBJC_CLASS___NSPDNSProxy);
  v9 = (void *)*((void *)v2 + 46);
  *((void *)v2 + 46) = v8;

  if (!*((void *)v2 + 46))
  {
    uint64_t v60 = nplog_obj(v10, v11, v12);
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_FAULT,  "%s called with null _dnsProxy",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_31;
  }

  uint64_t v13 = NPGetInternalQueue(v10);
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v14);
  v16 = (void *)*((void *)v2 + 30);
  *((void *)v2 + 30) = v15;

  if (!*((void *)v2 + 30))
  {
    uint64_t v61 = nplog_obj(v17, v18, v19);
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_FAULT,  "%s called with null _termSource",  (uint8_t *)&buf,  0xCu);
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NSPServerCommands));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  uint64_t v11 = (NWPathEvaluator *)a4;
  id v12 = a5;
  if (self) {
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }
  else {
    primaryPhysicalInterfaceEvaluator = 0LL;
  }
  v14 = primaryPhysicalInterfaceEvaluator;
  if (v14 != v11 || ![v10 isEqualToString:@"path"])
  {

    goto LABEL_8;
  }

  if (a6 != self)
  {
LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___NSPServer;
    -[NSPServer observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
    goto LABEL_9;
  }

  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_100057300;
  v19[4] = sub_100057310;
  id v20 = (id)os_transaction_create("com.apple.networkserviceproxy.handlePathChange");
  id v15 = sub_1000572E4(self);
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066C5C;
  block[3] = &unk_1000F9428;
  block[4] = self;
  block[5] = v19;
  dispatch_async(v16, block);

  _Block_object_dispose(v19, 8);
LABEL_9:
}

- (void)configFetched:(id)a3
{
  if (self)
  {
    if (self->_configOutage)
    {
      self->_configOutage = 0;
      id v4 = (id)objc_claimAutoreleasedReturnValue( -[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy]( self->_configurationManager,  "mergeProxyTrafficStateWithCurrentPolicy",  a3));
      -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  self->_configurationManager,  v4,  1LL);
      sub_1000679B4((uint64_t)self);
    }
  }

- (void)configEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Privacy proxy configuration enabled",  (uint8_t *)&buf,  2u);
  }

  if (self)
  {
    self->_isRunning = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager currentConfiguration](self->_configurationManager, "currentConfiguration"));
    objc_storeStrong((id *)&self->_configuration, v9);

    id Property = objc_getProperty(self, v10, 264LL, 1);
  }

  else
  {

    id Property = 0LL;
  }

  sub_10009D77C((uint64_t)Property, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  unsigned __int8 v15 = [v14 addPoliciesForProbing];

  if ((v15 & 1) == 0)
  {
    uint64_t v19 = nplog_obj(v16, v17, v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "failed to add probing policies",  (uint8_t *)&buf,  2u);
    }
  }

  v21 = objc_alloc(&OBJC_CLASS___NSPServerODoH);
  if (self) {
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }
  else {
    primaryPhysicalInterfaceEvaluator = 0LL;
  }
  v23 = primaryPhysicalInterfaceEvaluator;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](v23, "path"));
  if (self) {
    toggleStats = self->_toggleStats;
  }
  else {
    toggleStats = 0LL;
  }
  xpc_connection_t v26 = sub_10004D9BC((id *)&v21->super.isa, self, v24, toggleStats);
  sub_100068D08((uint64_t)self, v26);

  v27 = objc_alloc(&OBJC_CLASS___NSPServiceStatusManager);
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  v29 = configuration;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v29, "userTier"));
  uint64_t v31 = [v30 unsignedIntValue];
  if (!self)
  {
    id v141 = -[NSPServiceStatusManager initFromPreferencesWithUserTier:effectiveUserTier:delegate:]( v27,  "initFromPreferencesWithUserTier:effectiveUserTier:delegate:",  v31,  [0 effectiveUserTier],  0);
    sub_100023DC4(0LL, v141);

    [0 proxyTokenFetchEnabled:v4];
    goto LABEL_51;
  }

  id v32 = -[NSPServiceStatusManager initFromPreferencesWithUserTier:effectiveUserTier:delegate:]( v27,  "initFromPreferencesWithUserTier:effectiveUserTier:delegate:",  v31,  -[NSPConfigurationManager effectiveUserTier](self->_configurationManager, "effectiveUserTier"),  self);
  sub_100023DC4((uint64_t)self, v32);

  if (self->_proxyOutage) {
    sub_10006EAB8((uint64_t)self, 1LL, v33);
  }
  if (self->_proxyNetworkOutage) {
    sub_10006EB68((uint64_t)self, 1LL, v33);
  }
  if (self->_odohOutageRestoreDate) {
    sub_10006DEFC((uint64_t)self, 1LL, v33);
  }
  if (self->_odohAuthOutageRestoreDate) {
    sub_10006DCB0((uint64_t)self, 1LL, v33);
  }
  if (self->_captiveOutage)
  {
    v34 = self->_primaryInterface;
    if (v34)
    {
      v35 = v34;
      v36 = self->_primaryPhysicalInterfaceEvaluator;
      if (v36)
      {
        v37 = v36;
        int v38 = sub_1000670A8((uint64_t)self);

        if (v38)
        {
          uint64_t v42 = nplog_obj(v39, v40, v41);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = self;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%@ Primary interface changed to non Wi-Fi, reporting service active ...",  (uint8_t *)&buf,  0xCu);
          }

          sub_10006714C((uint64_t)self, 0LL, v44);
          goto LABEL_35;
        }
      }

      else
      {
      }
    }

    if (self->_captiveOutage && sub_100073E7C((uint64_t)self))
    {
      sub_100073E3C((uint64_t)self);
      uint64_t v46 = NPGetInternalQueue(v45);
      v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v46);
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      v157 = sub_100075B6C;
      v158 = &unk_1000F9450;
      v159 = self;
      dispatch_async(v47, &buf);
    }
  }

- (void)configDisabled:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Privacy proxy configuration disabled", v21, 2u);
  }

  sub_10000E02C((uint64_t)self, 0LL);
  if (self)
  {
    self->_isRunning = 0;
    *(_WORD *)&self->_captiveOutage = 0;
    *(_DWORD *)&self->_systemIncompatible = 0;
    self->_proxyNetworkOutage = 0;
    objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0LL);
    proxyOutageRestoreTimer = self->_proxyOutageRestoreTimer;
    if (proxyOutageRestoreTimer)
    {
      dispatch_source_cancel((dispatch_source_t)proxyOutageRestoreTimer);
      objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0LL);
    }

    sub_100069734((uint64_t)self);
    -[NSPServiceStatusManager reportServiceDisabledShouldReport:]( self->_serviceStatusManager,  "reportServiceDisabledShouldReport:",  0LL);
    +[NSPServiceStatusManager removeFromPreferences](&OBJC_CLASS___NSPServiceStatusManager, "removeFromPreferences");
    objc_storeStrong((id *)&self->_serviceStatusManager, 0LL);
    id Property = objc_getProperty(self, v10, 264LL, 1);
  }

  else
  {
    sub_100069734(0LL);
    [0 reportServiceDisabledShouldReport:0];
    +[NSPServiceStatusManager removeFromPreferences](&OBJC_CLASS___NSPServiceStatusManager, "removeFromPreferences");
    id Property = 0LL;
  }

  sub_10009D6E8((uint64_t)Property, 1);
  sub_1000649CC((uint64_t)self);
  -[NSPServer proxyTokenFetchDisabled:](self, "proxyTokenFetchDisabled:", v4);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v12 remove:1];

  if (self) {
    odohManager = self->_odohManager;
  }
  else {
    odohManager = 0LL;
  }
  sub_10004E178(odohManager, v13, v14);
  sub_100068D08((uint64_t)self, 0LL);
  sub_1000511B4((uint64_t)&OBJC_CLASS___NSPServerODoH);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyLocationMonitor sharedMonitor]( &OBJC_CLASS___NSPPrivacyProxyLocationMonitor,  "sharedMonitor"));
  [v16 stop];

  sub_1000697AC((uint64_t)self, v17, v18);
  sub_100069848((uint64_t)self);
  +[NSPDeviceIdentityCertificate removeFromPreferences]( &OBJC_CLASS___NSPDeviceIdentityCertificate,  "removeFromPreferences");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPDeviceIdentityCertificate sharedDeviceIdentity]( &OBJC_CLASS___NSPDeviceIdentityCertificate,  "sharedDeviceIdentity"));
  [v19 resetDeviceIdentityInfo];

  if (self)
  {
    CNPluginMonitorStop();
    sub_100069890((uint64_t)self);
    sub_100069960((uint64_t)self);
    sub_10006999C((uint64_t)&OBJC_CLASS___NSPServer);
    sub_100069A48((uint64_t)self);
    if (self->_userActivityNotificationHandle) {
      IOPMUnregisterNotification();
    }
    -[NSPToggleStats resetStats](self->_toggleStats, "resetStats");
    toggleStatsTimer = self->_toggleStatsTimer;
    if (toggleStatsTimer)
    {
      dispatch_source_cancel((dispatch_source_t)toggleStatsTimer);
      objc_storeStrong((id *)&self->_toggleStatsTimer, 0LL);
    }
  }

  else
  {
    sub_10006999C((uint64_t)&OBJC_CLASS___NSPServer);
    [0 resetStats];
  }

- (void)configurationRestart:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "server configuration reset", v9, 2u);
  }

  -[NSPServer configDisabled:](self, "configDisabled:", v4);
  -[NSPServer configEnabled:](self, "configEnabled:", v4);
}

- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4
{
  if (self) {
    self = (NSPServer *)self->_configuration;
  }
  return -[NSPServer fetchDateIsWithinStart:end:](self, "fetchDateIsWithinStart:end:", a3, a4);
}

- (BOOL)subscriberTierIsProhibited:(id)a3
{
  return 0;
}

- (void)suspendPrivacyProxyTemporarily:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Privacy proxy suspended temporarily", v11, 2u);
  }

  if (self)
  {
    self->_isRunning = 0;
    id Property = objc_getProperty(self, v9, 264LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  sub_10009D6E8((uint64_t)Property, 1);
  sub_1000649CC((uint64_t)self);
  -[NSPServer proxyTokenFetchDisabled:](self, "proxyTokenFetchDisabled:", v4);
}

- (void)resumePrivacyProxy:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "resume privacy proxy", v12, 2u);
  }

  if (self)
  {
    self->_isRunning = 1;
    id Property = objc_getProperty(self, v9, 264LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  sub_10009D77C((uint64_t)Property, (uint64_t)v9, v10);
  -[NSPServer proxyTokenFetchEnabled:](self, "proxyTokenFetchEnabled:", v4);
}

- (void)proxyTokenFetchEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Proxy token fetch enabled", v9, 2u);
  }

  -[NSPServer authInfoChanged:](self, "authInfoChanged:", v4);
  -[NSPServer proxyInfoChanged:](self, "proxyInfoChanged:", v4);
}

- (void)proxyTokenFetchDisabled:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Proxy token fetch disabled", v11, 2u);
  }

  sub_10000C7E4((uint64_t)self, 0LL);
  if (self)
  {
    uint64_t v6 = self->_serviceStatusManager;
    configuration = self->_configuration;
  }

  else
  {
    uint64_t v6 = 0LL;
    configuration = 0LL;
  }

  v8 = configuration;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v8, "proxyConfiguration"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 regionId]);
  -[NSPServiceStatusManager reportUnsupportedRegion:](v6, "reportUnsupportedRegion:", v10);
}

- (void)userTierChanged:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "user tier changed", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](configuration, "userTier"));
  id v8 = [v7 unsignedIntegerValue];

  if (v8 != (id)2)
  {
    +[NSPServiceStatusManager removeFromPreferences](&OBJC_CLASS___NSPServiceStatusManager, "removeFromPreferences");
    v29 = objc_alloc(&OBJC_CLASS___NSPServiceStatusManager);
    if (self) {
      configurationManager = self->_configurationManager;
    }
    else {
      configurationManager = 0LL;
    }
    v24 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:]( v29,  "initWithUserTier:effectiveUserTier:delegate:",  1LL,  -[NSPConfigurationManager effectiveUserTier](configurationManager, "effectiveUserTier"),  self);
    sub_100023DC4((uint64_t)self, v24);
    goto LABEL_31;
  }

  if (self)
  {
    if (self->_isMPTCPConverterProxy)
    {
      uint64_t v12 = nplog_obj(v9, v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "stopping proxying TCP socket flows to MPTCP converter proxy",  v32,  2u);
      }

      sub_10006A0F4(self, v14);
    }

    unsigned __int8 v15 = objc_alloc(&OBJC_CLASS___NSPServiceStatusManager);
    uint64_t v16 = self->_configurationManager;
  }

  else
  {
    unsigned __int8 v15 = objc_alloc(&OBJC_CLASS___NSPServiceStatusManager);
    uint64_t v16 = 0LL;
  }

  uint64_t v17 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:]( v15,  "initWithUserTier:effectiveUserTier:delegate:",  2LL,  -[NSPConfigurationManager effectiveUserTier](v16, "effectiveUserTier"),  self);
  sub_100023DC4((uint64_t)self, v17);

  if (self) {
    uint64_t v18 = self->_configuration;
  }
  else {
    uint64_t v18 = 0LL;
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v18, "proxyConfiguration"));

  if (v19)
  {
    if (self) {
      id v20 = self->_configurationManager;
    }
    else {
      id v20 = 0LL;
    }
    if (!-[NSPConfigurationManager configurationSubscriberPoliciesCount](v20, "configurationSubscriberPoliciesCount"))
    {
      if (self)
      {
        v24 = self->_serviceStatusManager;
        uint64_t v31 = self->_configuration;
      }

      else
      {
        v24 = 0LL;
        uint64_t v31 = 0LL;
      }

      xpc_connection_t v26 = v31;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v26, "proxyConfiguration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 regionId]);
      -[NSPServiceStatusManager reportSubscriberUnsupportedRegion:](v24, "reportSubscriberUnsupportedRegion:", v28);
      goto LABEL_30;
    }

    if (self) {
      v21 = self->_configuration;
    }
    else {
      v21 = 0LL;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v21, "proxyConfiguration"));
    unsigned __int8 v23 = [v22 enabled];

    if ((v23 & 1) == 0)
    {
      if (self)
      {
        v24 = self->_serviceStatusManager;
        v25 = self->_configuration;
      }

      else
      {
        v24 = 0LL;
        v25 = 0LL;
      }

      xpc_connection_t v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v26, "proxyConfiguration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 regionId]);
      -[NSPServiceStatusManager reportUnsupportedRegion:](v24, "reportUnsupportedRegion:", v28);
LABEL_30:

LABEL_31:
    }
  }

  sub_10006A1A8((uint64_t)self);
  sub_10006A2F8((uint64_t)self);
}

- (void)userPreferredTierChanged:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "user preferred tier changed", v11, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](configuration, "userPreferredTier"));
  unsigned int v8 = [v7 unsignedIntValue];

  BOOL v9 = v8 == 2;
  if (self)
  {
    -[NSPPrivacyProxyAgentManager sendRTCReportForPrivacyProxyToggleState:]( self->_privacyProxyAgentManager,  "sendRTCReportForPrivacyProxyToggleState:",  v9);
    toggleStats = self->_toggleStats;
  }

  else
  {
    [0 sendRTCReportForPrivacyProxyToggleState:v9];
    toggleStats = 0LL;
  }

  if (v8 == 2) {
    -[NSPToggleStats sendToggleOnStats](toggleStats, "sendToggleOnStats");
  }
  else {
    -[NSPToggleStats sendToggleOffStats](toggleStats, "sendToggleOffStats");
  }
}

- (void)effectiveUserTierChanged:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_connection_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "effective user tier changed", v26, 2u);
  }

  if (self)
  {
    uint64_t v6 = self->_serviceStatusManager;
    uint64_t v7 = self->_configurationManager;
    -[NSPServiceStatusManager handleEffectiveUserTierChange:]( v6,  "handleEffectiveUserTierChange:",  -[NSPConfigurationManager effectiveUserTier](v7, "effectiveUserTier"));

    configuration = self->_configuration;
  }

  else
  {
    objc_msgSend(0, "handleEffectiveUserTierChange:", objc_msgSend(0, "effectiveUserTier"));

    configuration = 0LL;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](configuration, "proxyConfiguration"));

  if (v9)
  {
    uint64_t v10 = self ? self->_configurationManager : 0LL;
    if ((id)-[NSPConfigurationManager effectiveUserTier](v10, "effectiveUserTier") == (id)1)
    {
      if (self) {
        uint64_t v11 = self->_configuration;
      }
      else {
        uint64_t v11 = 0LL;
      }
      uint64_t v12 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager userTier](v12, "userTier"));
      if ([v13 unsignedIntegerValue] != (id)2) {
        goto LABEL_18;
      }
      if (self) {
        configurationManager = self->_configurationManager;
      }
      else {
        configurationManager = 0LL;
      }
      unint64_t v15 = -[NSPConfigurationManager configurationSubscriberPoliciesCount]( configurationManager,  "configurationSubscriberPoliciesCount");

      if (!v15)
      {
        if (self)
        {
          uint64_t v12 = self->_serviceStatusManager;
          uint64_t v16 = self->_configuration;
        }

        else
        {
          uint64_t v12 = 0LL;
          uint64_t v16 = 0LL;
        }

        uint64_t v17 = v16;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v17, "proxyConfiguration"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 regionId]);
        -[NSPServiceStatusManager reportSubscriberUnsupportedRegion:](v12, "reportSubscriberUnsupportedRegion:", v18);

LABEL_18:
      }
    }
  }

  if (self) {
    uint64_t v19 = self->_configurationManager;
  }
  else {
    uint64_t v19 = 0LL;
  }
  id v20 = -[NSPConfigurationManager effectiveUserTier](v19, "effectiveUserTier");
  id v21 = v20;
  if (self)
  {
    -[NSPPrivacyProxyAgentManager handleTierChange:](self->_privacyProxyAgentManager, "handleTierChange:", v20 == (id)2);
    if (v21 == (id)2 && self->_captiveOutage)
    {
      objc_storeStrong((id *)&self->_captiveEvaluatedSSID, 0LL);
      sub_10006AA24((uint64_t)self);
      return;
    }

    v22 = self->_configurationManager;
    unsigned __int8 v23 = self->_configurationManager;
  }

  else
  {
    [0 handleTierChange:v20 == (id)2];
    v22 = 0LL;
    unsigned __int8 v23 = 0LL;
  }

  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy]( v24,  "mergeProxyTrafficStateWithCurrentPolicy"));
  -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  v22,  v25,  1LL);
}

- (void)authInfoChanged:(id)a3
{
  uint64_t v7 = nplog_obj(self, a2, a3);
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Auth info updated", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v10 = configuration;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v10, "proxyConfiguration"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authInfo]);
  unsigned int v13 = [v12 authType];
  if (v13)
  {
    uint64_t v14 = self ? self->_configuration : 0LL;
    v3 = v14;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v3, "proxyConfiguration"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authInfo]);
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 authURL]);
    if (v15)
    {

LABEL_15:
      if (self) {
        id v20 = self->_configuration;
      }
      else {
        id v20 = 0LL;
      }
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v20, "proxyConfiguration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 authInfo]);
      unsigned __int8 v23 = (char *)[v22 accessTokenTypesCount];

      if (v23)
      {
        v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (i = 0LL; i != v23; ++i)
        {
          if (self) {
            xpc_connection_t v26 = self->_configuration;
          }
          else {
            xpc_connection_t v26 = 0LL;
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v26, "proxyConfiguration"));
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 authInfo]);
          id v29 = [v28 accessTokenTypesAtIndex:i];

          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v29));
          -[NSMutableArray addObject:](v24, "addObject:", v30);
        }
      }

      else
      {
        v24 = 0LL;
      }

      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyTokenManager sharedTokenManager]( &OBJC_CLASS___NSPPrivacyTokenManager,  "sharedTokenManager"));
      if (self) {
        uint64_t v31 = self->_configuration;
      }
      else {
        uint64_t v31 = 0LL;
      }
      uint64_t v51 = v31;
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v51, "proxyConfiguration"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v50 authInfo]);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v49 authURL]);
      if (self) {
        id v32 = self->_configuration;
      }
      else {
        id v32 = 0LL;
      }
      v47 = v32;
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v47, "proxyConfiguration"));
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v46 authInfo]);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v45 accessTokenURL]);
      if (self) {
        uint64_t v33 = self->_configuration;
      }
      else {
        uint64_t v33 = 0LL;
      }
      v43 = v33;
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v43, "proxyConfiguration"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v42 authInfo]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 accessTokenBlockedIssuers]);
      if (self) {
        v36 = self->_configuration;
      }
      else {
        v36 = 0LL;
      }
      v37 = v36;
      int v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v37, "proxyConfiguration"));
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 authInfo]);
      id v40 = [v39 authType];
      if (self) {
        uint64_t v41 = self->_configuration;
      }
      else {
        uint64_t v41 = 0LL;
      }
      objc_msgSend( v53,  "updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authenticationType:ignoreInvalidCerts:",  v48,  v44,  v24,  v35,  v40,  -[NSPConfiguration ignoreInvalidCerts](v41, "ignoreInvalidCerts"));

      return;
    }
  }

  int v52 = v10;
  if (self) {
    uint64_t v16 = self->_configuration;
  }
  else {
    uint64_t v16 = 0LL;
  }
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v16, "proxyConfiguration"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 authInfo]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accessTokenURL]);

  if (v13)
  {
  }

  if (v19) {
    goto LABEL_15;
  }
}

- (void)proxyInfoChanged:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Proxy info updated", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](configuration, "proxyConfiguration"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 proxies]);
  id v9 = [v8 count];

  if (!v9)
  {
    sub_10000C7E4((uint64_t)self, 0LL);
    return;
  }

  if (self)
  {
    privacyProxyAgentManager = self->_privacyProxyAgentManager;
    if (privacyProxyAgentManager) {
      goto LABEL_23;
    }
    configurationManager = self->_configurationManager;
  }

  else
  {
    configurationManager = 0LL;
  }

  id v12 = -[NSPConfigurationManager effectiveUserTier](configurationManager, "effectiveUserTier");
  unsigned int v13 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyAgentManager);
  if (self)
  {
    uint64_t v14 = -[NSPPrivacyProxyAgentManager initWithDelegate:toggleStats:]( v13,  "initWithDelegate:toggleStats:",  self,  self->_toggleStats);
    objc_storeStrong((id *)&self->_privacyProxyAgentManager, v14);

    uint64_t v58 = self->_privacyProxyAgentManager;
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }

  else
  {

    uint64_t v58 = 0LL;
    primaryPhysicalInterfaceEvaluator = 0LL;
  }

  uint64_t v56 = primaryPhysicalInterfaceEvaluator;
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](v56, "path"));
  if (self) {
    uint64_t v16 = self->_configurationManager;
  }
  else {
    uint64_t v16 = 0LL;
  }
  int v52 = v16;
  unsigned int v50 = -[NSPConfigurationManager policyIncludesUnlimited](v52, "policyIncludesUnlimited");
  if (self) {
    uint64_t v17 = self->_configuration;
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = v17;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashSharingEnabledStatus](v18, "geohashSharingEnabledStatus"));
  id v20 = [v19 BOOLValue];
  if (self) {
    id v21 = self->_configuration;
  }
  else {
    id v21 = 0LL;
  }
  v22 = v21;
  unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v22, "geohashOverride"));
  if (self) {
    v24 = self->_configuration;
  }
  else {
    v24 = 0LL;
  }
  v25 = v24;
  xpc_connection_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration epoch](v25, "epoch"));
  if (self) {
    int primaryInterfaceLinkQuality = self->_primaryInterfaceLinkQuality;
  }
  else {
    int primaryInterfaceLinkQuality = 0;
  }
  LODWORD(v41) = primaryInterfaceLinkQuality;
  -[NSPPrivacyProxyAgentManager setupWithPath:subscriber:unlimited:geohashSharingEnabled:geohashOverride:configEpoch:linkQuality:]( v58,  "setupWithPath:subscriber:unlimited:geohashSharingEnabled:geohashOverride:configEpoch:linkQuality:",  v54,  v12 == (id)2,  v50,  v20,  v23,  v26,  v41);

  if (!self)
  {
    objc_msgSend( 0,  "useDefaultNetworkInterface:",  objc_msgSend(0, "usesDefaultConfigurationServer") ^ 1);
    uint64_t v59 = 0LL;
    id v29 = 0LL;
    goto LABEL_24;
  }

  v28 = self->_privacyProxyAgentManager;
  -[NSPPrivacyProxyAgentManager useDefaultNetworkInterface:]( v28,  "useDefaultNetworkInterface:",  -[NSPServer usesDefaultConfigurationServer](self, "usesDefaultConfigurationServer") ^ 1);

  privacyProxyAgentManager = self->_privacyProxyAgentManager;
LABEL_23:
  uint64_t v59 = privacyProxyAgentManager;
  id v29 = self->_configuration;
LABEL_24:
  v57 = v29;
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v57, "proxyConfiguration"));
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v55 proxies]);
  if (self) {
    v30 = self->_configuration;
  }
  else {
    v30 = 0LL;
  }
  uint64_t v51 = v30;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v51, "proxyConfiguration"));
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v49 resolvers]);
  if (self) {
    uint64_t v31 = self->_configuration;
  }
  else {
    uint64_t v31 = 0LL;
  }
  v47 = v31;
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v47, "proxyConfiguration"));
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v46 pathWeights]);
  if (self) {
    id v32 = self->_configuration;
  }
  else {
    id v32 = 0LL;
  }
  uint64_t v44 = v32;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v44, "proxyConfiguration"));
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v43 fallbackPathWeights]);
  if (self) {
    uint64_t v33 = self->_configuration;
  }
  else {
    uint64_t v33 = 0LL;
  }
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v34, "proxyConfiguration"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 obliviousConfigs]);
  if (self) {
    v37 = self->_configuration;
  }
  else {
    v37 = 0LL;
  }
  int v38 = v37;
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v38, "proxyConfiguration"));
  id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 proxiedContentMaps]);
  -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:]( v59,  "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:",  v53,  v48,  v45,  v42,  v36,  v40);
}

- (void)policiesUpdated:(id)a3 policy:(id)a4 resolverInfoChanged:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = (NSPServer *)a4;
  uint64_t v10 = nplog_obj(v7, v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    v120 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "privacy proxy policies updated - %@",  buf,  0xCu);
  }

  if (v7)
  {
    id v12 = v7;
    if (!self)
    {
LABEL_13:

      goto LABEL_14;
    }

    BOOL v13 = -[NSPPrivacyProxyAgentManager isMultiHopProxyAgentRegistered]( self->_privacyProxyAgentManager,  "isMultiHopProxyAgentRegistered");
    if (!v13)
    {
      uint64_t v19 = nplog_obj(v13, v14, v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        uint64_t v18 = "defer policy installation until multiHop agents are ready";
        goto LABEL_11;
      }

- (void)configUpdated:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Configuration updated", v12, 2u);
  }

  sub_100066738((uint64_t)self);
  sub_1000691BC((id *)&self->super.isa);
  if (self)
  {
    uint64_t v6 = self->_privacyProxyAgentManager;
    -[NSPPrivacyProxyAgentManager useDefaultNetworkInterface:]( v6,  "useDefaultNetworkInterface:",  -[NSPServer usesDefaultConfigurationServer](self, "usesDefaultConfigurationServer") ^ 1);

    sub_100050234((id *)&self->_odohManager->super.isa, v7, v8);
    privacyProxyAgentManager = self->_privacyProxyAgentManager;
  }

  else
  {
    objc_msgSend( 0,  "useDefaultNetworkInterface:",  objc_msgSend(0, "usesDefaultConfigurationServer") ^ 1);
    sub_100050234(0LL, v10, v11);
    privacyProxyAgentManager = 0LL;
  }

  -[NSPPrivacyProxyAgentManager handleConfigChange](privacyProxyAgentManager, "handleConfigChange");
}

- (void)geohashSettingsChanged:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Geohash settings changed", v14, 2u);
  }

  if (self)
  {
    uint64_t v6 = self->_privacyProxyAgentManager;
    configuration = self->_configuration;
  }

  else
  {
    uint64_t v6 = 0LL;
    configuration = 0LL;
  }

  uint64_t v8 = configuration;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashSharingEnabledStatus](v8, "geohashSharingEnabledStatus"));
  id v10 = [v9 BOOLValue];
  if (self) {
    uint64_t v11 = self->_configuration;
  }
  else {
    uint64_t v11 = 0LL;
  }
  id v12 = v11;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v12, "geohashOverride"));
  -[NSPPrivacyProxyAgentManager updateGeohashSharingPreference:geohashOverride:]( v6,  "updateGeohashSharingPreference:geohashOverride:",  v10,  v13);
}

- (void)configEpochChanged:(id)a3
{
  uint64_t v4 = nplog_obj(self, a2, a3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Config epoch changed", v10, 2u);
  }

  if (self)
  {
    uint64_t v6 = self->_privacyProxyAgentManager;
    configuration = self->_configuration;
  }

  else
  {
    uint64_t v6 = 0LL;
    configuration = 0LL;
  }

  uint64_t v8 = configuration;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration epoch](v8, "epoch"));
  -[NSPPrivacyProxyAgentManager updateConfigEpoch:](v6, "updateConfigEpoch:", v9);
}

- (void)privateAccessTokensEnabledChanged:(id)a3
{
  uint64_t v3 = nplog_obj(self, a2, a3);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Private Access Tokens settings changed", v5, 2u);
  }
}

- (void)cloudSubscriptionChanged:(BOOL)a3 configManager:(id)a4
{
  if (a3)
  {
    sub_100068D18((id *)&self->super.isa);
    sub_100068E30((uint64_t *)self);
  }

  else
  {
    sub_100069848((uint64_t)self);
  }

- (void)badTokenInfoForProxy:(id)a3
{
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v6 = configuration;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configurationFetchDate](v6, "configurationFetchDate"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v8,  1LL,  2LL));

  uint64_t v13 = nplog_obj(v10, v11, v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      uint64_t v15 = self->_configuration;
    }
    else {
      uint64_t v15 = 0LL;
    }
    uint64_t v16 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration etag](v16, "etag"));
    *(_DWORD *)__int128 buf = 138412546;
    unsigned __int8 v32 = v17;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received bad token info for configuration tag[%@] with fetch date %@",  buf,  0x16u);
  }

  -[NSPServer refreshProxyInfo:](self, "refreshProxyInfo:", 6LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  if (self) {
    uint64_t v19 = self->_configuration;
  }
  else {
    uint64_t v19 = 0LL;
  }
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configurationFetchDate](v19, "configurationFetchDate"));
  [v18 timeIntervalSinceDate:v20];
  double v22 = v21;

  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSPBadTokenInfoStats);
  if (self) {
    unsigned __int8 v24 = self->_configuration;
  }
  else {
    unsigned __int8 v24 = 0LL;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v24, "userTier"));
  id v26 = [v25 intValue];
  if (v26 >= 3) {
    int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v26));
  }
  else {
    int v27 = *(&off_1000FA520 + (int)v26);
  }
  -[NSPBadTokenInfoStats setTierType:](v23, "setTierType:", v27);

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 vendor]);
  -[NSPBadTokenInfoStats setTokenProxy:](v23, "setTokenProxy:", v28);

  if (self) {
    id v29 = self->_configuration;
  }
  else {
    id v29 = 0LL;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration etag](v29, "etag"));
  -[NSPBadTokenInfoStats setConfigTag:](v23, "setConfigTag:", v30);

  -[NSPBadTokenInfoStats setConfigAgeHours:](v23, "setConfigAgeHours:", (unint64_t)(v22 / 3600.0));
  -[NSPProxyAnalytics sendAnalytics](v23, "sendAnalytics");
}

- (void)refreshProxyInfo:(unint64_t)a3
{
  uint64_t v5 = nplog_obj(self, a2, a3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ received refresh proxy information",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_100057300;
  uint64_t v13 = sub_100057310;
  id v14 = (id)os_transaction_create("com.apple.networkserviceproxy.refreshProxyInfo");
  if (self) {
    configurationManager = self->_configurationManager;
  }
  else {
    configurationManager = 0LL;
  }
  uint64_t v8 = configurationManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006CB2C;
  v9[3] = &unk_1000FA170;
  v9[4] = &buf;
  -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:]( v8,  "refreshConfigurationWithReason:completionHandler:",  a3,  v9);

  _Block_object_dispose(&buf, 8);
}

- (void)multiHopProxyAgentRegistered:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = nplog_obj(self, a2, a3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "is not";
    if (v3) {
      id v7 = "is";
    }
    int v12 = 136315138;
    uint64_t v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "multiHop proxy agent %s registered",  (uint8_t *)&v12,  0xCu);
  }

  if (v3)
  {
    if (self) {
      configurationManager = self->_configurationManager;
    }
    else {
      configurationManager = 0LL;
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy]( configurationManager,  "mergeProxyTrafficStateWithCurrentPolicy"));
    if (self) {
      uint64_t v10 = self->_configurationManager;
    }
    else {
      uint64_t v10 = 0LL;
    }
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  v10,  v9,  1LL);
  }

  else
  {
    if (self) {
      uint64_t v11 = self->_configurationManager;
    }
    else {
      uint64_t v11 = 0LL;
    }
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  v11,  0LL,  0LL);
  }

- (void)singleHopProxyAgentRegistered:(BOOL)a3
{
  if (a3)
  {
    if (self)
    {
      sub_10004E25C((uint64_t)self->_odohManager);
      odohManager = self->_odohManager;
    }

    else
    {
      sub_10004E25C(0LL);
      odohManager = 0LL;
    }

    sub_10004F17C((uint64_t)odohManager);
  }

- (void)obliviousHopAgentRegisteredForHostname:(id)a3 processes:(id)a4 agentUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 count];
  uint64_t v13 = nplog_obj(v10, v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v15)
    {
      int v20 = 138412802;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v8;
      uint64_t v16 = "Adding policies for oblivious agent for %@ (%@), limited to %@";
      uint64_t v17 = v14;
      uint32_t v18 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, v18);
    }
  }

  else if (v15)
  {
    int v20 = 138412546;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v9;
    uint64_t v16 = "Adding policies for oblivious agent for %@ (%@)";
    uint64_t v17 = v14;
    uint32_t v18 = 22;
    goto LABEL_6;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v19 addObliviousProxyAgent:v9 processes:v8 hostname:v7];
}

- (void)obliviousHopAgentUnregisteredForHostname:(id)a3 agentUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = nplog_obj(v6, v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Removing policies for oblivious agent for %@ (%@)",  (uint8_t *)&v12,  0x16u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v11 removeObliviousProxyAgent:v6 forHostname:v5 apply:1];
}

- (void)proxiedContentMaps:(id)a3 registeredForAgentUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v9 = nplog_obj(v6, v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding policies for proxied content for %@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v11 addProxiedContentAgent:v5 maps:v6];
}

- (void)networkDiscoveredProxyPaths:(id)a3 registeredForAgentUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v9 = nplog_obj(v6, v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding policy for network discovered agent for %@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v11 addNetworkDiscoveryProxyAgent:v5 with:v6];
}

- (void)proxiedContentMapsUnregisteredForAgentUUID:(id)a3
{
  id v3 = a3;
  uint64_t v6 = nplog_obj(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing policies for proxied content for %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v8 removeProxiedContentAgent:v3 apply:1];
}

- (void)tokenIssuanceLimitReached
{
  if (!self || !self->_fraudAlert)
  {
    uint64_t v4 = nplog_obj(self, a2, v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting fraud alert", v7, 2u);
    }

    if (self)
    {
      self->_fraudAlert = 1;
      configurationManager = self->_configurationManager;
    }

    else
    {
      configurationManager = 0LL;
    }

    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  configurationManager,  0LL,  0LL);
    sub_1000679B4((uint64_t)self);
  }

  sub_100066738((uint64_t)self);
}

- (void)tokenIssuanceAllowed
{
  if (self && self->_fraudAlert)
  {
    uint64_t v4 = nplog_obj(self, a2, v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting token issuance allowed", v7, 2u);
    }

    self->_fraudAlert = 0;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy]( self->_configurationManager,  "mergeProxyTrafficStateWithCurrentPolicy"));
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  self->_configurationManager,  v6,  1LL);
    sub_1000679B4((uint64_t)self);
  }

- (void)checkPrivacyProxyConnectivityOnInterface:(id)a3 proxyConnectivityCheckType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 interfaceName]);
  uint64_t v13 = nplog_obj(v10, v11, v12);
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%@ received check proxy connectivity for interface %@",  buf,  0x16u);
  }

  id v15 = 0LL;
  uint64_t v16 = 4LL;
  uint64_t v17 = 5LL;
  switch(a4)
  {
    case 1uLL:
      goto LABEL_15;
    case 2uLL:
      if (self) {
        privacyProxyAgentManager = self->_privacyProxyAgentManager;
      }
      else {
        privacyProxyAgentManager = 0LL;
      }
      __int16 v22 = privacyProxyAgentManager;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager lastProxyOutageReason](v22, "lastProxyOutageReason"));

      uint64_t v17 = 3LL;
      if (!v10) {
        goto LABEL_24;
      }
      goto LABEL_16;
    case 3uLL:
      id v15 = 0LL;
      uint64_t v17 = 10LL;
      goto LABEL_15;
    case 4uLL:
    case 5uLL:
      goto LABEL_4;
    case 6uLL:
      id v15 = 0LL;
      uint64_t v17 = 12LL;
      if (!v10) {
        goto LABEL_24;
      }
      goto LABEL_16;
    default:
      uint64_t v16 = 0LL;
      uint64_t v17 = 0LL;
      id v15 = 0LL;
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
LABEL_4:
        if (self) {
          odohManager = self->_odohManager;
        }
        else {
          odohManager = 0LL;
        }
        uint64_t v19 = odohManager;
        int v20 = sub_1000509A8(v19);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v20);

        uint64_t v17 = v16;
        if (!v10) {
          goto LABEL_24;
        }
      }

      else
      {
LABEL_15:
        if (!v10)
        {
LABEL_24:
          if (self) {
            configuration = self->_configuration;
          }
          else {
            configuration = 0LL;
          }
          v30 = configuration;
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration etag](v30, "etag"));

          *(void *)__int128 buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000LL;
          uint64_t v46 = sub_100057300;
          uint64_t v47 = sub_100057310;
          id v48 = (id)os_transaction_create("com.apple.networkserviceproxy.checkPrivacyProxyConnectivity");
          objc_initWeak(&location, self);
          if (self) {
            configurationManager = self->_configurationManager;
          }
          else {
            configurationManager = 0LL;
          }
          __int16 v33 = configurationManager;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_10006D7D0;
          v35[3] = &unk_1000FA198;
          objc_copyWeak(v43, &location);
          id v36 = v10;
          id v34 = v31;
          v43[1] = (id)a4;
          id v37 = v34;
          uint64_t v38 = self;
          id v39 = v8;
          id v40 = v15;
          id v41 = v9;
          uint64_t v42 = buf;
          -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:]( v33,  "refreshConfigurationWithReason:completionHandler:",  v17,  v35);

          objc_destroyWeak(v43);
          objc_destroyWeak(&location);
          _Block_object_dispose(buf, 8);

          goto LABEL_29;
        }
      }

- (void)handleDNSAgentErrorReport:(id)a3 error:(int)a4
{
  if (self) {
    self = (NSPServer *)self->_privacyProxyAgentManager;
  }
  -[NSPServer sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:]( self,  "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:tokenServer:",  1002LL,  *(void *)&a4,  a3,  0LL,  0LL,  0LL);
}

- (void)reportPrivacyProxySuccessOnInterface:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
  uint64_t v8 = nplog_obj(v5, v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v54 = self;
    __int16 v55 = 2112;
    uint64_t v56 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ reported proxy success on interface %@",  buf,  0x16u);
  }

  if (v5)
  {
    if (self)
    {
      interfacesBeingChecked = self->_interfacesBeingChecked;
    }

    else
    {
      unsigned __int8 v44 = [0 containsObject:v5];
      interfacesBeingChecked = 0LL;
      if ((v44 & 1) == 0)
      {
        if ([v4 type] == (id)1 || objc_msgSend(v4, "type") == (id)2) {
          goto LABEL_60;
        }
        id v45 = v4;
LABEL_59:

        goto LABEL_60;
      }
    }

    -[NSMutableSet removeObject:](interfacesBeingChecked, "removeObject:", v5);
  }

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  if (self) {
    self = (NSPServer *)self->_serviceStatusManager;
  }
  -[NSPServer reportActivityForApp:path:](self, "reportActivityForApp:path:", a3, a4);
}

- (void)tokenFetchOutage
{
  if (!self || !self->_tokenOutage)
  {
    uint64_t v4 = nplog_obj(self, a2, v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting token fetch outage", v7, 2u);
    }

    if (self)
    {
      self->_tokenOutage = 1;
      configurationManager = self->_configurationManager;
    }

    else
    {
      configurationManager = 0LL;
    }

    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  configurationManager,  0LL,  0LL);
    sub_1000679B4((uint64_t)self);
  }

- (void)tokenFetchActive
{
  if (self && self->_tokenOutage)
  {
    uint64_t v4 = nplog_obj(self, a2, v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting token fetch active", v7, 2u);
    }

    self->_tokenOutage = 0;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy]( self->_configurationManager,  "mergeProxyTrafficStateWithCurrentPolicy"));
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  self->_configurationManager,  v6,  1LL);
    sub_1000679B4((uint64_t)self);
  }

- (void)proxyConnectivityOutage
{
}

- (void)proxyConnectivityNetworkOutage
{
}

- (void)proxyConnectivityActive
{
  if (self && (self->_proxyOutage || self->_proxyNetworkOutage))
  {
    uint64_t v4 = nplog_obj(self, a2, v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restore proxy connectivity", v8, 2u);
    }

    proxyOutageRestoreTimer = self->_proxyOutageRestoreTimer;
    *(_WORD *)&self->_proxyOutage = 0;
    if (proxyOutageRestoreTimer)
    {
      dispatch_source_cancel((dispatch_source_t)proxyOutageRestoreTimer);
      objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0LL);
    }

    objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy]( self->_configurationManager,  "mergeProxyTrafficStateWithCurrentPolicy"));
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:]( self,  "policiesUpdated:policy:resolverInfoChanged:",  self->_configurationManager,  v7,  1LL);
    sub_100066738((uint64_t)self);
    -[NSPPrivacyProxyAgentManager resetProxyErrors](self->_privacyProxyAgentManager, "resetProxyErrors");
    sub_1000679B4((uint64_t)self);
  }

- (void)preferredProxyAgentRegistered:(id)a3 agentUUID:(id)a4 domainFilter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfiguration preferredPathRoutingEnabledStatus]( configuration,  "preferredPathRoutingEnabledStatus"));
  unsigned __int8 v13 = [v12 BOOLValue];

  uint64_t v17 = nplog_obj(v14, v15, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v19)
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Adding policies for preferred agent %@ / %@",  (uint8_t *)&v20,  0x16u);
    }

    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
    -[os_log_s addPreferredProxy:agentUUID:withDomainFilter:]( v18,  "addPreferredProxy:agentUUID:withDomainFilter:",  v8,  v9,  v10);
  }

  else if (v19)
  {
    int v20 = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Skipping adding policies preferred agent %@ / %@, feature disabled",  (uint8_t *)&v20,  0x16u);
  }
}

- (void)preferredProxyAgentUnregistered:(id)a3
{
  id v3 = a3;
  uint64_t v6 = nplog_obj(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing policies for preferred agent %@",  (uint8_t *)&v9,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v8 removePreferredProxy:v3 apply:1];
}

- (BOOL)networkDiscoveredProxyInTrustedProxyList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 port]);

    if (v6)
    {
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      if (self) {
        configuration = self->_configuration;
      }
      else {
        configuration = 0LL;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](configuration, "proxyConfiguration"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 trustedNetworkDiscoveredProxies]);

      id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v33;
        unsigned __int8 v13 = @":";
        uint64_t v14 = &AnalyticsSendEventLazy_ptr;
        do
        {
          uint64_t v15 = 0LL;
          id v31 = v11;
          do
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v32 + 1) + 8 * (void)v15) componentsSeparatedByString:v13]);
            if ((unint64_t)[v16 count] >= 2)
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);
              uint64_t v18 = objc_opt_class(v14[147]);
              char isKindOfClass = objc_opt_isKindOfClass(v17, v18);

              if ((isKindOfClass & 1) != 0)
              {
                int v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);
                id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:1]);
                __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v21 integerValue]));

                id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
                if ([v23 isEqualToString:v20])
                {
                  uint64_t v24 = v12;
                  char v25 = v13;
                  uint64_t v26 = v9;
                  id v27 = v4;
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v4 port]);

                  BOOL v29 = v28 == v22;
                  id v4 = v27;
                  int v9 = v26;
                  unsigned __int8 v13 = v25;
                  uint64_t v12 = v24;
                  id v11 = v31;
                  if (v29)
                  {

                    LOBYTE(v5) = 1;
                    goto LABEL_22;
                  }
                }

                else
                {
                }

                uint64_t v14 = &AnalyticsSendEventLazy_ptr;
              }
            }

            uint64_t v15 = (char *)v15 + 1;
          }

          while (v11 != v15);
          id v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }

        while (v11);
      }

      LOBYTE(v5) = 0;
LABEL_22:
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)canIgnoreInvalidCertsOnInternalBuild
{
  id v2 = -[NSPConfiguration initFromPreferences](objc_alloc(&OBJC_CLASS___NSPConfiguration), "initFromPreferences");
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)usesDefaultConfigurationServer
{
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0LL;
  }
  id v4 = configuration;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v4, "configServerHost"));
  if ([v5 isEqualToString:@"mask-api.icloud.com"])
  {
    if (self) {
      configurationManager = self->_configurationManager;
    }
    else {
      configurationManager = 0LL;
    }
    unsigned int v7 = !-[NSPConfigurationManager environmentUsesNonDefaultServer]( configurationManager,  "environmentUsesNonDefaultServer");
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)didUpdateSignificantLocation
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = sub_100057300;
  v6[4] = sub_100057310;
  id v7 = (id)os_transaction_create("com.apple.networkserviceproxy.didUpdateSignificantLocation");
  if (self) {
    configurationManager = self->_configurationManager;
  }
  else {
    configurationManager = 0LL;
  }
  id v4 = configurationManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000720DC;
  v5[3] = &unk_1000FA170;
  v5[4] = v6;
  -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:]( v4,  "refreshConfigurationWithReason:completionHandler:",  7LL,  v5);

  _Block_object_dispose(v6, 8);
}

- (void)didUpdateCountryPlusTimezone:(id)a3
{
  id v5 = a3;
  uint64_t v8 = nplog_obj(v5, v6, v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ country+timezone updated to [%@]",  (uint8_t *)&v10,  0x16u);
  }

  if (self) {
    objc_storeStrong((id *)&self->_lastCountryPlusTimezone, a3);
  }
  sub_1000679B4((uint64_t)self);
}

- (void)didUpdateGeohash:(id)a3
{
  id v5 = a3;
  uint64_t v8 = nplog_obj(v5, v6, v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ Geohash updated to [%@]",  (uint8_t *)&v10,  0x16u);
  }

  if (self) {
    objc_storeStrong((id *)&self->_lastGeohash, a3);
  }
  sub_1000679B4((uint64_t)self);
}

- (BOOL)isSubscriberUnlimited
{
  if (self) {
    self = (NSPServer *)self->_configurationManager;
  }
  return -[NSPServer policyIncludesUnlimited](self, "policyIncludesUnlimited");
}

- (void)requestAccessTokenWithCompletionHandler:(id)a3
{
}

- (void)networkSignatureChanged
{
  if (self)
  {
    sub_1000743C4((uint64_t)self);
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](self->_configuration, "proxyConfiguration"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dnsProbe]);

    if (v4)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](self->_primaryPhysicalInterfaceEvaluator, "path"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 interface]);

      int v10 = (nw_interface *)objc_claimAutoreleasedReturnValue([v9 cInterface]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](self->_primaryPhysicalInterfaceEvaluator, "path"));
      id v12 = [v11 status];

      if (v12 == (id)1)
      {
        if (v10)
        {
          nw_endpoint_t host = nw_endpoint_create_host((const char *)[v4 UTF8String], "443");
          uint64_t v14 = nw_parameters_create();
          nw_parameters_require_interface(v14, v10);
          uint64_t v15 = (OS_nw_resolver *)nw_resolver_create_with_endpoint(host, v14);
          dnsProbeResolver = self->_dnsProbeResolver;
          self->_dnsProbeResolver = v15;

          objc_initWeak(&location, self);
          uint64_t v17 = self->_dnsProbeResolver;
          uint64_t v18 = NPGetInternalQueue(v17);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_100074404;
          v21[3] = &unk_1000FA460;
          objc_copyWeak(v23, &location);
          __int16 v22 = v10;
          nw_resolver_set_update_handler(v17, v19, v21);

          objc_destroyWeak(v23);
          objc_destroyWeak(&location);
        }
      }
    }

    else
    {
      uint64_t v20 = nplog_obj(v5, v6, v7);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21[0]) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEBUG,  "No DNS probe configured, ignoring",  (uint8_t *)v21,  2u);
      }
    }
  }

- (void)disableWiFiNetwork:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Saving preference to disable on Wi-Fi network: %@",  buf,  0xCu);
  }

  if (self) {
    wifiInterface = self->_wifiInterface;
  }
  else {
    wifiInterface = 0LL;
  }
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](wifiInterface, "currentKnownNetworkProfile"));
  [v10 setPrivacyProxyEnabled:0];
  if (self) {
    id v11 = self->_wifiInterface;
  }
  else {
    id v11 = 0LL;
  }
  id v21 = 0LL;
  id v12 = v11;
  -[CWFInterface updateKnownNetworkProfile:properties:error:]( v12,  "updateKnownNetworkProfile:properties:error:",  v10,  0LL,  &v21);
  id v13 = v21;

  if (v13)
  {
    uint64_t v17 = nplog_obj(v14, v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to save preference to disable on Wi-Fi network %@: %@",  buf,  0x16u);
    }
  }

  if (self) {
    serviceStatusManager = self->_serviceStatusManager;
  }
  else {
    serviceStatusManager = 0LL;
  }
  -[NSPServiceStatusManager reportDisabledOnWiFiName:](serviceStatusManager, "reportDisabledOnWiFiName:", v4);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPPrivacyProxyPolicyHandler sharedHandler]( &OBJC_CLASS___NSPPrivacyProxyPolicyHandler,  "sharedHandler"));
  [v20 wifiDisabled:1];
}

- (void)disableCellularNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v6 = nplog_obj(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Saving preference to disable on cellular network: %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)disableInterface:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v8 = (__CFError *)a3;
  id v9 = a4;
  uint64_t v12 = nplog_obj(v9, v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    CFErrorRef v75 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Saving preference to disable on interface %@",  buf,  0xCu);
  }

  uint64_t v14 = v8;
  uint64_t v15 = v14;
  if (!self)
  {

    serviceStatusManager = 0LL;
    goto LABEL_32;
  }

  SCPreferencesRef v16 = SCPreferencesCreateWithAuthorization( kCFAllocatorDefault,  @"networkserviceproxy",  0LL,  kSCPreferencesUseEntitlementAuthorization);
  if (!v16)
  {
    uint64_t v37 = nplog_obj(0LL, v17, v18);
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v66 = v9;
      CFErrorRef Error = SCCopyLastError();
      *(_DWORD *)__int128 buf = 138412290;
      CFErrorRef v75 = Error;
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failed to create SCPreferences: %@",  buf,  0xCu);

      id v9 = v66;
    }

    goto LABEL_31;
  }

  BOOL v19 = v16;
  uint64_t v20 = v15;
  id v21 = SCNetworkSetCopyCurrent(v19);
  if (!v21)
  {
    uint64_t v39 = nplog_obj(0LL, v22, v23);
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v68 = v9;
      CFErrorRef v69 = SCCopyLastError();
      *(_DWORD *)__int128 buf = 138412290;
      CFErrorRef v75 = v69;
      _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to get current set: %@",  buf,  0xCu);

      id v9 = v68;
    }

    goto LABEL_26;
  }

  __int16 v24 = v21;
  id v25 = SCNetworkSetCopyServices(v21);
  if (!v25)
  {
    uint64_t v41 = nplog_obj(0LL, v26, v27);
    unsigned int v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v70 = v9;
      CFErrorRef v71 = SCCopyLastError();
      *(_DWORD *)__int128 buf = 138412290;
      CFErrorRef v75 = v71;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to copy services: %@", buf, 0xCu);

      id v9 = v70;
    }

    CFRelease(v24);
LABEL_26:

    goto LABEL_27;
  }

  uint64_t v28 = v25;
  unsigned int v73 = v5;
  CFIndex Count = CFArrayGetCount(v25);
  if (Count < 1)
  {
    __int128 v34 = 0LL;
    goto LABEL_34;
  }

  CFIndex v30 = Count;
  id v72 = v9;
  CFIndex v31 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v28, v31);
    if (!SCNetworkServiceGetEnabled(ValueAtIndex)) {
      goto LABEL_14;
    }
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface) {
      goto LABEL_14;
    }
    __int128 v34 = Interface;
    CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(BSDName);
    if (v36)
    {
    }

LABEL_14:
    if (v30 == ++v31)
    {
      __int128 v34 = 0LL;
      goto LABEL_16;
    }
  }

  CFRetain(v34);

LABEL_16:
  id v9 = v72;
LABEL_34:
  CFRelease(v24);
  CFRelease(v28);

  uint64_t v5 = v73;
  if (!v34)
  {
LABEL_27:
    uint64_t v46 = nplog_obj(v43, v44, v45);
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Failed to get interface from preferences",  buf,  2u);
    }

    goto LABEL_29;
  }

  uint64_t v50 = SCNetworkInterfaceSetDisablePrivateRelay(v34, 1LL);
  if ((_DWORD)v50)
  {
    CFRelease(v34);
    uint64_t v53 = SCPreferencesCommitChanges(v19);
    if ((_DWORD)v53)
    {
      uint64_t v56 = SCPreferencesApplyChanges(v19);
      if (!(_DWORD)v56)
      {
        uint64_t v59 = nplog_obj(v56, v57, v58);
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          id v60 = v9;
          CFErrorRef v61 = SCCopyLastError();
          *(_DWORD *)__int128 buf = 138412290;
          CFErrorRef v75 = v61;
          uint64_t v62 = "Failed to apply SCPreferences: %@";
          goto LABEL_45;
        }

        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v65 = nplog_obj(v53, v54, v55);
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v60 = v9;
        CFErrorRef v61 = SCCopyLastError();
        *(_DWORD *)__int128 buf = 138412290;
        CFErrorRef v75 = v61;
        uint64_t v62 = "Failed to commit SCPreferences: %@";
LABEL_45:
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v62, buf, 0xCu);

        id v9 = v60;
      }

- (id)getSavedPrivateCloudComputeEnvironment
{
  if (self) {
    self = (NSPServer *)self->_privateCloudComputeEnvironment;
  }
  return self;
}

- (void)updateSavedPrivateCloudComputeEnvironment:(id)a3
{
  id v5 = a3;
  if (self) {
    privateCloudComputeEnvironment = self->_privateCloudComputeEnvironment;
  }
  else {
    privateCloudComputeEnvironment = 0LL;
  }
  uint64_t v7 = privateCloudComputeEnvironment;
  unint64_t v10 = (unint64_t)v5;
  unint64_t v8 = v7;
  id v9 = (void *)v8;
  if (!(v10 | v8) || v10 && v8 && [(id)v10 isEqual:v8])
  {
  }

  else
  {

    if (self) {
      objc_storeStrong((id *)&self->_privateCloudComputeEnvironment, a3);
    }
    sub_1000679B4((uint64_t)self);
  }
}

- (void).cxx_destruct
{
}

@end