@interface SATVTapToSetupManager
- (ACAccountStore)store;
- (BOOL)hasGameCenterAccount;
- (BOOL)hasICloudAccount;
- (BOOL)hasStoreAccount;
- (BOOL)isRunning;
- (BOOL)isSetupInfoTransactionInProgress;
- (HMDeviceSetupOperationHandler)homeKitSetupHandler;
- (NSOperationQueue)connectionQueue;
- (NSString)recommendedNetworkPassword;
- (NSString)recommendedNetworkSSID;
- (SATVTapToSetupActivatorHookDelegate)activatorHookDelegate;
- (SATVTapToSetupManager)init;
- (SATVTapToSetupManagerDelegate)userInterfaceDelegate;
- (SFDeviceSetupAppleTVService)setupService;
- (TRDeviceSetupServer)server;
- (TRNearbyDeviceAdvertiser)advertiser;
- (TRSession)activeSession;
- (TVSKTapToSetupDeviceInfo)deviceInfo;
- (TVSWiFiNetworkConnectionOperation)connectionOperation;
- (TVSiCloudAccountManager)iCloudAccountManager;
- (double)startTimeout;
- (id)_asnPaidSetting;
- (id)accountsToAuthenticateForDeviceSetupServer:(id)a3;
- (id)connectionCompletionHandler;
- (id)deviceSetupServer:(id)a3 localizedAuthenticationMessageForAccount:(unint64_t)a4;
- (int)setupCompleted;
- (int64_t)_serviceTypeForAccountService:(unint64_t)a3;
- (void)_authenticateAccount:(id)a3 forServiceType:(int64_t)a4 withCompanionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7;
- (void)_authenticateAccount:(id)a3 forServiceType:(int64_t)a4 withPassword:(id)a5 completion:(id)a6;
- (void)_authenticateAccount:(unint64_t)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)_authenticateGameCenterAccountWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_authenticateGameCenterWithAuthenticationResults:(id)a3 completionHandler:(id)a4;
- (void)_authenticateHomeSharingAccountWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_authenticateHomeSharingWithAuthenticationResults:(id)a3 completionHandler:(id)a4;
- (void)_authenticateStoreWithAuthenticationResults:(id)a3 completionHandler:(id)a4;
- (void)_authenticateWithAccountService:(unint64_t)a3 usingAuthenticationResults:(id)a4 completion:(id)a5;
- (void)_authenticateWithAccountServices:(id)a3 usingAuthenticationResults:(id)a4 completion:(id)a5;
- (void)_authenticateiCloudAccountWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_authenticateiCloudWithAuthenticationResults:(id)a3 completionHandler:(id)a4;
- (void)_authenticateiTunesAccountWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_cancelConnectionOperation;
- (void)_checkTarget:(id)a3 forSelector:(SEL)a4 performBlockOnMainThread:(id)a5;
- (void)_completedCompanionAuthenticationRequest:(id)a3 unauthenticatedAccountServices:(id)a4 withResponseHandler:(id)a5;
- (void)_completedProxyAuthenticationRequest:(id)a3 unauthenticatedAccountServices:(id)a4 withResponseHandler:(id)a5;
- (void)_connectToNetworkWithRecommendedSSID:(id)a3 password:(id)a4 completionHandler:(id)a5;
- (void)_didFailSetupWithError:(id)a3;
- (void)_didFailToStartSetupWithError:(id)a3;
- (void)_didFinishNetworkConnectionAttemptWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleActivationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleCompanionAuthenticateWithRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleSetupServiceProgressEvent:(unsigned int)a3 info:(id)a4;
- (void)_handleSetupServiceStartSession:(id)a3;
- (void)_performIDMSAuthenticationWithAccountID:(id)a3 password:(id)a4 serviceType:(int64_t)a5 completion:(id)a6;
- (void)_promptForASNSettingWithCompletion:(id)a3;
- (void)_resetSetupInfoTransaction;
- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4;
- (void)_setAsnPaidSetting:(id)a3;
- (void)_setupSession:(id)a3;
- (void)dealloc;
- (void)deviceSetupServer:(id)a3 authenticateAccount:(unint64_t)a4 withInfo:(id)a5 completionHandler:(id)a6;
- (void)deviceSetupServer:(id)a3 connectToNetworkWithRecommendedSSID:(id)a4 password:(id)a5 completionHandler:(id)a6;
- (void)deviceSetupServer:(id)a3 didBeginSetupWithDeviceName:(id)a4;
- (void)deviceSetupServer:(id)a3 didFailSetupWithError:(id)a4;
- (void)deviceSetupServer:(id)a3 didReceiveSetupInfo:(id)a4;
- (void)deviceSetupServer:(id)a3 willRequestAuthenticationForAccount:(unint64_t)a4;
- (void)deviceSetupServerDidFinishSetup:(id)a3;
- (void)deviceSetupServerDidPromptToBeginSetup:(id)a3;
- (void)didCompleteSetup;
- (void)didFailSetupWithErrorCode:(int64_t)a3;
- (void)nearbyDeviceAdvertiser:(id)a3 didReceiveConnectionRequestFromDevice:(id)a4 requestHandler:(id)a5;
- (void)nearbyDeviceAdvertiserDidStartAdvertising:(id)a3;
- (void)operation:(id)a3 didConnectToNetwork:(id)a4;
- (void)operation:(id)a3 didFailToConnectToNetwork:(id)a4 error:(id)a5;
- (void)operation:(id)a3 didFailToFindNetworkWithName:(id)a4 error:(id)a5;
- (void)operation:(id)a3 didRequestPasswordForNetwork:(id)a4 completion:(id)a5;
- (void)operation:(id)a3 stateDidChange:(unint64_t)a4;
- (void)setActivatorHookDelegate:(id)a3;
- (void)setActiveSession:(id)a3;
- (void)setAdvertiser:(id)a3;
- (void)setConnectionCompletionHandler:(id)a3;
- (void)setConnectionOperation:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setHasGameCenterAccount:(BOOL)a3;
- (void)setHasICloudAccount:(BOOL)a3;
- (void)setHasStoreAccount:(BOOL)a3;
- (void)setHomeKitSetupHandler:(id)a3;
- (void)setICloudAccountManager:(id)a3;
- (void)setRecommendedNetworkPassword:(id)a3;
- (void)setRecommendedNetworkSSID:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setServer:(id)a3;
- (void)setSetupCompleted:(int)a3;
- (void)setSetupInfoTransactionInProgress:(BOOL)a3;
- (void)setSetupService:(id)a3;
- (void)setStartTimeout:(double)a3;
- (void)setStore:(id)a3;
- (void)setUserInterfaceDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)updateAdvertisingState:(BOOL)a3;
@end

@implementation SATVTapToSetupManager

- (SATVTapToSetupManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SATVTapToSetupManager;
  v2 = -[SATVTapToSetupManager init](&v16, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TRDeviceSetupServer);
    server = v2->_server;
    v2->_server = v3;

    -[TRDeviceSetupServer setDelegate:](v2->_server, "setDelegate:", v2);
    v5 = objc_alloc_init(&OBJC_CLASS___HMDeviceSetupOperationHandler);
    homeKitSetupHandler = v2->_homeKitSetupHandler;
    v2->_homeKitSetupHandler = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_connectionQueue, "setMaxConcurrentOperationCount:", 1LL);
    v9 = (objc_class *)objc_opt_class(v2);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@.connectionQueue",  v11));
    -[NSOperationQueue setName:](v2->_connectionQueue, "setName:", v12);

    v13 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
    iCloudAccountManager = v2->_iCloudAccountManager;
    v2->_iCloudAccountManager = v13;
  }

  return v2;
}

- (void)dealloc
{
  setupService = self->_setupService;
  self->_setupService = 0LL;

  -[TRDeviceSetupServer setDelegate:](self->_server, "setDelegate:", 0LL);
  server = self->_server;
  self->_server = 0LL;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0LL;

  -[SATVTapToSetupManager _cancelConnectionOperation](self, "_cancelConnectionOperation");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVTapToSetupManager;
  -[SATVTapToSetupManager dealloc](&v6, "dealloc");
}

- (void)start
{
  unsigned __int8 v3 = -[SATVTapToSetupManager isRunning](self, "isRunning");
  id v4 = sub_10004E254();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000779F0();
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Starting Touch Remote Server",  (uint8_t *)buf,  2u);
    }

    -[TRDeviceSetupServer start](self->_server, "start");
    if (!self->_setupService)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___SFDeviceSetupAppleTVService);
      setupService = self->_setupService;
      self->_setupService = v7;

      objc_initWeak(buf, self);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10004E294;
      v9[3] = &unk_1000CA7B0;
      objc_copyWeak(&v10, buf);
      -[SFDeviceSetupAppleTVService setProgressHandler:](self->_setupService, "setProgressHandler:", v9);
      -[SFDeviceSetupAppleTVService activate](self->_setupService, "activate");
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }

    -[SATVTapToSetupManager setRunning:](self, "setRunning:", 1LL);
    -[SATVTapToSetupManager updateAdvertisingState:](self, "updateAdvertisingState:", 1LL);
  }

- (void)stop
{
  unsigned int v3 = -[SATVTapToSetupManager isRunning](self, "isRunning");
  id v4 = sub_10004E254();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Stopping Touch Remote Server", (uint8_t *)v8, 2u);
    }

    -[SFDeviceSetupAppleTVService invalidate](self->_setupService, "invalidate");
    setupService = self->_setupService;
    self->_setupService = 0LL;

    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionCompletionHandler](self, "connectionCompletionHandler"));
    -[SATVTapToSetupManager setConnectionCompletionHandler:](self, "setConnectionCompletionHandler:", 0LL);
    if (v6) {
      (*((void (**)(os_log_s *, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
    -[TRDeviceSetupServer cancelActiveSetup](self->_server, "cancelActiveSetup");
    -[TRDeviceSetupServer stop](self->_server, "stop");
    -[SATVTapToSetupManager _cancelConnectionOperation](self, "_cancelConnectionOperation");
    -[SATVTapToSetupManager setSetupInfoTransactionInProgress:](self, "setSetupInfoTransactionInProgress:", 0LL);
    -[SATVTapToSetupManager setDeviceInfo:](self, "setDeviceInfo:", 0LL);
    -[SATVTapToSetupManager setRunning:](self, "setRunning:", 0LL);
    -[SATVTapToSetupManager updateAdvertisingState:](self, "updateAdvertisingState:", 0LL);
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_100077A1C();
  }
}

- (void)_connectToNetworkWithRecommendedSSID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable"))
  {
    id v11 = sub_10004E254();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Setup already connected to the internet. No need to connect to WiFi",  buf,  2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_activatorHookDelegate);
    if (WeakRetained)
    {
      id v14 = sub_10004E254();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Activator hook is set. Waiting for it to finish.",  buf,  2u);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10004E780;
      v27[3] = &unk_1000C9938;
      id v28 = v10;
      [WeakRetained tapToSetupManager:self readyToActivateWithCompletionHandler:v27];
    }

    else
    {
      (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1LL, 0LL);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:shouldConnectToNetworkWithName:") & 1) == 0) {
      goto LABEL_12;
    }
    id v16 = sub_10004E254();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100077A48();
    }

    if (![WeakRetained tapToSetupManager:self shouldConnectToNetworkWithName:v8])
    {
      id v25 = sub_10004E254();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Delegate declined connection attempt to %@",  buf,  0xCu);
      }

      if (v10) {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      }
    }

    else
    {
LABEL_12:
      id v18 = sub_10004E254();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Attempting to connect to WiFi network %@",  buf,  0xCu);
      }

      -[SATVTapToSetupManager setConnectionCompletionHandler:](self, "setConnectionCompletionHandler:", v10);
      -[SATVTapToSetupManager setRecommendedNetworkSSID:](self, "setRecommendedNetworkSSID:", v8);
      -[SATVTapToSetupManager setRecommendedNetworkPassword:](self, "setRecommendedNetworkPassword:", v9);
      v20 = -[TVSWiFiNetworkConnectionOperation initWithNetworkName:]( objc_alloc(&OBJC_CLASS___TVSWiFiNetworkConnectionOperation),  "initWithNetworkName:",  v8);
      -[SATVTapToSetupManager setConnectionOperation:](self, "setConnectionOperation:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionOperation](self, "connectionOperation"));
      [v21 setQualityOfService:25];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionOperation](self, "connectionOperation"));
      [v22 setDelegate:self];

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionQueue](self, "connectionQueue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionOperation](self, "connectionOperation"));
      [v23 addOperation:v24];
    }
  }
}

- (void)deviceSetupServerDidPromptToBeginSetup:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManagerDidPromptToBeginSetup:") & 1) != 0)
  {
    id v5 = sub_10004E254();
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 134218242;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Informing the delegate that setup has been prompted to begin. %p %@",  (uint8_t *)&v7,  0x16u);
    }

    [WeakRetained tapToSetupManagerDidPromptToBeginSetup:self];
  }

  -[SATVTapToSetupManager updateAdvertisingState:](self, "updateAdvertisingState:", 0LL);
}

- (void)deviceSetupServer:(id)a3 didBeginSetupWithDeviceName:(id)a4
{
  id v5 = a4;
  if (-[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress"))
  {
    id v6 = sub_10004E254();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100077B34();
    }
  }

  else
  {
    int v7 = -[TVSKTapToSetupDeviceInfo initWithRawDeviceInfo:]( objc_alloc(&OBJC_CLASS___TVSKTapToSetupDeviceInfo),  "initWithRawDeviceInfo:",  0LL);
    -[SATVTapToSetupManager setDeviceInfo:](self, "setDeviceInfo:", v7);
    -[SATVTapToSetupManager setSetupInfoTransactionInProgress:](self, "setSetupInfoTransactionInProgress:", 1LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:didBeginSetupWithDeviceName:isNewFlow:") & 1) != 0)
    {
      id v9 = sub_10004E254();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218242;
        id v12 = WeakRetained;
        __int16 v13 = 2112;
        id v14 = WeakRetained;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Informing the delegate that setup began. %p %@",  (uint8_t *)&v11,  0x16u);
      }

      [WeakRetained tapToSetupManager:self didBeginSetupWithDeviceName:v5 isNewFlow:0];
    }
  }
}

- (void)deviceSetupServer:(id)a3 connectToNetworkWithRecommendedSSID:(id)a4 password:(id)a5 completionHandler:(id)a6
{
}

- (id)accountsToAuthenticateForDeviceSetupServer:(id)a3
{
  return &off_1000D1070;
}

- (id)deviceSetupServer:(id)a3 localizedAuthenticationMessageForAccount:(unint64_t)a4
{
  id v5 = a3;
  if (a4 - 1 > 3)
  {
    int v7 = 0LL;
  }

  else
  {
    id v6 = sub_10000D7CC(off_1000CABE8[a4 - 1], @"Localizable");
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v7;
}

- (void)deviceSetupServer:(id)a3 willRequestAuthenticationForAccount:(unint64_t)a4
{
  if (-[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress", a3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:willAttemptAuthenticationForAccount:") & 1) != 0)
    {
      id v7 = sub_10004E254();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = TRStringFromSetupAccountType(a4);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        int v12 = 138543874;
        __int16 v13 = v10;
        __int16 v14 = 2048;
        id v15 = WeakRetained;
        __int16 v16 = 2112;
        id v17 = WeakRetained;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Informing the delegate that we will attempt authentication for account type %{public}@. %p %@",  (uint8_t *)&v12,  0x20u);
      }

      [WeakRetained tapToSetupManager:self willAttemptAuthenticationForAccount:a4];
    }
  }

  else
  {
    id v11 = sub_10004E254();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_DEBUG)) {
      sub_100077B60();
    }
  }
}

- (void)deviceSetupServer:(id)a3 authenticateAccount:(unint64_t)a4 withInfo:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned __int8 v13 = -[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress");
  id v14 = sub_10004E254();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  __int16 v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = TRStringFromSetupAccountType(a4);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Attempting authentication for account type %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004EE24;
    v19[3] = &unk_1000CA7D8;
    objc_copyWeak(v21, (id *)buf);
    v21[1] = (id)a4;
    id v20 = v12;
    -[SATVTapToSetupManager _authenticateAccount:withInfo:completionHandler:]( self,  "_authenticateAccount:withInfo:completionHandler:",  a4,  v11,  v19);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100077B60();
    }
  }
}

- (void)deviceSetupServer:(id)a3 didReceiveSetupInfo:(id)a4
{
  id v5 = a4;
  if (-[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:didReceiveSetupInfo:") & 1) != 0)
    {
      id v7 = sub_10004E254();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Informing the delegate that we received setup info",  v10,  2u);
      }

      [WeakRetained tapToSetupManager:self didReceiveSetupInfo:v5];
    }
  }

  else
  {
    id v9 = sub_10004E254();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_DEBUG)) {
      sub_100077B60();
    }
  }
}

- (void)deviceSetupServerDidFinishSetup:(id)a3
{
  if (-[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress", a3))
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager deviceInfo](self, "deviceInfo"));
    -[SATVTapToSetupManager _resetSetupInfoTransaction](self, "_resetSetupInfoTransaction");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManagerDidFinishSetup:deviceInfo:") & 1) != 0)
    {
      id v6 = sub_10004E254();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Informing the delegate that setup finished",  v9,  2u);
      }

      [WeakRetained tapToSetupManagerDidFinishSetup:self deviceInfo:v4];
    }
  }

  else
  {
    id v8 = sub_10004E254();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100077B60();
    }
  }
}

- (void)deviceSetupServer:(id)a3 didFailSetupWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_10004E254();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100077B8C();
  }

  -[SATVTapToSetupManager _didFailSetupWithError:](self, "_didFailSetupWithError:", v5);
}

- (void)operation:(id)a3 didFailToFindNetworkWithName:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10004E254();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100077C1C((uint64_t)v7, v8, v10);
  }

  -[SATVTapToSetupManager _didFinishNetworkConnectionAttemptWithSuccess:error:]( self,  "_didFinishNetworkConnectionAttemptWithSuccess:error:",  0LL,  v8);
}

- (void)operation:(id)a3 didRequestPasswordForNetwork:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = (void (**)(id, void *))a5;
    id v7 = sub_10004E254();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100077CD4();
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager recommendedNetworkPassword](self, "recommendedNetworkPassword"));
    v6[2](v6, v9);
  }

- (void)operation:(id)a3 didConnectToNetwork:(id)a4
{
  id v5 = a4;
  id v6 = sub_10004E254();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 networkName]);
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Did connect to network. {networkName=%@}",  (uint8_t *)&v9,  0xCu);
  }

  -[SATVTapToSetupManager _didFinishNetworkConnectionAttemptWithSuccess:error:]( self,  "_didFinishNetworkConnectionAttemptWithSuccess:error:",  1LL,  0LL);
}

- (void)operation:(id)a3 didFailToConnectToNetwork:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10004E254();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100077D00(v7, v8, v10);
  }

  -[SATVTapToSetupManager _didFinishNetworkConnectionAttemptWithSuccess:error:]( self,  "_didFinishNetworkConnectionAttemptWithSuccess:error:",  0LL,  v8);
}

- (void)operation:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6 = sub_10004E254();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    unint64_t v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Network state did change. {newState=%lu}",  (uint8_t *)&v12,  0xCu);
  }

  if (a4 - 1 > 4) {
    unint64_t v8 = 0LL;
  }
  else {
    unint64_t v8 = qword_1000C4650[a4 - 1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:networkConnectionStateDidChange:") & 1) != 0)
  {
    id v10 = sub_10004E254();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      unint64_t v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Informing the delegate that the connection state changed to %lu",  (uint8_t *)&v12,  0xCu);
    }

    [WeakRetained tapToSetupManager:self networkConnectionStateDidChange:v8];
  }
}

- (void)_didFinishNetworkConnectionAttemptWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SATVTapToSetupManager connectionCompletionHandler]( self,  "connectionCompletionHandler"));
  -[SATVTapToSetupManager setConnectionCompletionHandler:](self, "setConnectionCompletionHandler:", 0LL);
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Network connection successfully connected",  buf,  2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_activatorHookDelegate);
    if (WeakRetained)
    {
      id v12 = sub_10004E254();
      unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Activator hook is set. Waiting for it to finish.",  buf,  2u);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10004F788;
      v14[3] = &unk_1000C9938;
      id v15 = v7;
      [WeakRetained tapToSetupManager:self readyToActivateWithCompletionHandler:v14];
    }

    else
    {
      v7[2](v7, 1LL, 0LL);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100077DC4();
    }

    if (v7) {
      v7[2](v7, 0LL, 0LL);
    }
  }
}

- (void)_didFailSetupWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_10004E254();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100077E80();
  }

  if (-[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress")) {
    goto LABEL_4;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v10 isEqualToString:TRDeviceSetupErrorDomain])
  {
    id v11 = [v4 code];

    if (v11 == (id)-8101LL)
    {
LABEL_4:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
      if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:didFailSetupWithError:") & 1) != 0)
      {
        id v8 = sub_10004E254();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)unint64_t v13 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Informing the delegate of setup failure",  v13,  2u);
        }

        [WeakRetained tapToSetupManager:self didFailSetupWithError:v4];
      }

      -[SATVTapToSetupManager _resetSetupInfoTransaction](self, "_resetSetupInfoTransaction");
      goto LABEL_15;
    }
  }

  else
  {
  }

  id v12 = sub_10004E254();
  id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR)) {
    sub_100077E54();
  }
LABEL_15:
}

- (void)_resetSetupInfoTransaction
{
  if (-[SATVTapToSetupManager isSetupInfoTransactionInProgress](self, "isSetupInfoTransactionInProgress"))
  {
    -[SATVTapToSetupManager _cancelConnectionOperation](self, "_cancelConnectionOperation");
    -[SATVTapToSetupManager setDeviceInfo:](self, "setDeviceInfo:", 0LL);
    -[SATVTapToSetupManager setSetupInfoTransactionInProgress:](self, "setSetupInfoTransactionInProgress:", 0LL);
  }

  else
  {
    id v3 = sub_10004E254();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100077B60();
    }
  }

- (void)_cancelConnectionOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionOperation](self, "connectionOperation"));

  if (v3)
  {
    id v4 = sub_10004E254();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionOperation](self, "connectionOperation"));
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Cancelling Connection Operation %@",  (uint8_t *)&v8,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager connectionOperation](self, "connectionOperation"));
    [v7 cancel];

    -[SATVTapToSetupManager setConnectionOperation:](self, "setConnectionOperation:", 0LL);
  }

- (void)_authenticateAccount:(unint64_t)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10004E254();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TRStringFromSetupAccountType(a3);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v16 = 138543618;
    uint64_t v17 = v13;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to authenticate account type %{public}@ (enum: %lu).",  (uint8_t *)&v16,  0x16u);
  }

  switch(a3)
  {
    case 1uLL:
      -[SATVTapToSetupManager _authenticateiTunesAccountWithInfo:completionHandler:]( self,  "_authenticateiTunesAccountWithInfo:completionHandler:",  v8,  v9);
      break;
    case 2uLL:
      -[SATVTapToSetupManager _authenticateiCloudAccountWithInfo:completionHandler:]( self,  "_authenticateiCloudAccountWithInfo:completionHandler:",  v8,  v9);
      break;
    case 3uLL:
      -[SATVTapToSetupManager _authenticateHomeSharingAccountWithInfo:completionHandler:]( self,  "_authenticateHomeSharingAccountWithInfo:completionHandler:",  v8,  v9);
      break;
    case 4uLL:
      -[SATVTapToSetupManager _authenticateGameCenterAccountWithInfo:completionHandler:]( self,  "_authenticateGameCenterAccountWithInfo:completionHandler:",  v8,  v9);
      break;
    default:
      id v14 = sub_10004E254();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100077F10();
      }

      if (v9) {
        (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
      }
      break;
  }
}

- (void)_authenticateiTunesAccountWithInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = TRDeviceSetupAuthenticationKeyAccountID;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:TRDeviceSetupAuthenticationKeyAccountPassword]);

  id v11 = sub_10004E254();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting iTunes Authentication with account ID %@",  buf,  0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004FE34;
  v15[3] = &unk_1000CA828;
  id v16 = v9;
  id v17 = v6;
  id v13 = v6;
  id v14 = v9;
  -[SATVTapToSetupManager _performIDMSAuthenticationWithAccountID:password:serviceType:completion:]( self,  "_performIDMSAuthenticationWithAccountID:password:serviceType:completion:",  v14,  v10,  2LL,  v15);
}

- (void)_authenticateiCloudAccountWithInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TRDeviceSetupAuthenticationKeyAccountID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TRDeviceSetupAuthenticationKeyAccountPassword]);
  id v10 = sub_10004E254();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting iCloud Authentication with account ID %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100050454;
  v14[3] = &unk_1000CA850;
  objc_copyWeak(&v17, (id *)buf);
  id v12 = v9;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  -[SATVTapToSetupManager _performIDMSAuthenticationWithAccountID:password:serviceType:completion:]( self,  "_performIDMSAuthenticationWithAccountID:password:serviceType:completion:",  v8,  v12,  2LL,  v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)_performIDMSAuthenticationWithAccountID:(id)a3 password:(id)a4 serviceType:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "presentingControllerForTTSUManager:") & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained presentingControllerForTTSUManager:self]);
    if (v12) {
      goto LABEL_8;
    }
  }

  else
  {
    id v14 = 0LL;
    if (v12) {
      goto LABEL_8;
    }
  }

  id v15 = sub_10004E254();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    sub_1000771F0();
  }

LABEL_8:
  id v17 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  id v18 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
  [v18 setUsername:v12];

  [v18 _setPassword:v11];
  [v18 setIsUsernameEditable:0];
  [v18 setAuthenticationType:2];
  [v18 setShouldAllowAppleIDCreation:0];
  [v18 setShouldOfferSecurityUpgrade:0];
  [v18 setShouldUpdatePersistentServiceTokens:1];
  [v18 setMaximumLoginAttempts:1];
  [v18 setPresentingViewController:v14];
  [v18 setServiceType:a5];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005086C;
  v20[3] = &unk_1000CA8A0;
  id v21 = v10;
  int64_t v22 = a5;
  id v19 = v10;
  [v17 authenticateWithContext:v18 completion:v20];
}

- (void)_authenticateHomeSharingAccountWithInfo:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = TRDeviceSetupAuthenticationKeyAccountID;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:TRDeviceSetupAuthenticationKeyAccountPassword]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100050AB4;
  v12[3] = &unk_1000C9938;
  id v13 = v5;
  id v11 = v5;
  [v10 setMediaServerDiscoveryConfigurationWithMode:1 homeSharingAccountName:v8 homeSharingPassword:v9 completionHandler:v12];
}

- (void)_authenticateGameCenterAccountWithInfo:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = TRDeviceSetupAuthenticationKeyAccountID;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:TRDeviceSetupAuthenticationKeyAccountPassword]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100050BA8;
  v11[3] = &unk_1000CA8C8;
  id v12 = v5;
  id v10 = v5;
  +[GKLocalPlayer authenticateWithUsername:password:completionHandler:]( &OBJC_CLASS___GKLocalPlayer,  "authenticateWithUsername:password:completionHandler:",  v8,  v9,  v11);
}

- (void)updateAdvertisingState:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_advertiser)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___TRNearbyDeviceAdvertiser);
    advertiser = self->_advertiser;
    self->_advertiser = v5;
  }

  id v7 = self->_advertiser;
  if (v3)
  {
    -[TRNearbyDeviceAdvertiser setDelegate:](v7, "setDelegate:", self);
    -[TRNearbyDeviceAdvertiser startAdvertisingWithService:](self->_advertiser, "startAdvertisingWithService:", 1LL);
  }

  else
  {
    -[TRNearbyDeviceAdvertiser stopAdvertising](v7, "stopAdvertising", a3);
  }

- (void)nearbyDeviceAdvertiserDidStartAdvertising:(id)a3
{
}

- (void)_checkTarget:(id)a3 forSelector:(SEL)a4 performBlockOnMainThread:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((objc_opt_respondsToSelector(v7, a4) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100050D40;
  v12[3] = &unk_1000C9AC0;
  id v13 = v9;
  id v14 = v8;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(&_dispatch_main_q, v12);
}

- (void)nearbyDeviceAdvertiser:(id)a3 didReceiveConnectionRequestFromDevice:(id)a4 requestHandler:(id)a5
{
  id v7 = a4;
  if (self->_activeSession)
  {
    id v8 = (void (*)(void))*((void *)a5 + 2);
    id v9 = (TRSession *)a5;
    v8();
  }

  else
  {
    server = self->_server;
    id v11 = (void (**)(id, uint64_t, id))a5;
    -[TRDeviceSetupServer cancelActiveSetup](server, "cancelActiveSetup");
    -[TRDeviceSetupServer stop](self->_server, "stop");
    -[SFDeviceSetupAppleTVService invalidate](self->_setupService, "invalidate");
    setupService = self->_setupService;
    self->_setupService = 0LL;

    id v9 = -[TRSession initWithNearbyDevice:](objc_alloc(&OBJC_CLASS___TRSession), "initWithNearbyDevice:", v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100050E58;
    v13[3] = &unk_1000C9468;
    v13[4] = self;
    -[TRSession setDisconnectHandler:](v9, "setDisconnectHandler:", v13);
    -[SATVTapToSetupManager _setupSession:](self, "_setupSession:", v9);
    v11[2](v11, 1LL, v9);
  }
}

- (void)_setupSession:(id)a3
{
  id v5 = a3;
  [v5 setRequestHandler:&stru_1000CA908 forRequestClass:objc_opt_class(TRHandshakeRequest)];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100051340;
  v29[3] = &unk_1000CA930;
  v29[4] = self;
  [v5 setRequestHandler:v29 forRequestClass:objc_opt_class(TRSetupConfigurationRequest)];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100051350;
  v28[3] = &unk_1000CA930;
  v28[4] = self;
  [v5 setRequestHandler:v28 forRequestClass:objc_opt_class(TRSetupActivationRequest)];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100051360;
  v27[3] = &unk_1000CA930;
  void v27[4] = self;
  [v5 setRequestHandler:v27 forRequestClass:objc_opt_class(TRSetupNetworkRequest)];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100051370;
  v26[3] = &unk_1000CA930;
  v26[4] = self;
  [v5 setRequestHandler:v26 forRequestClass:objc_opt_class(TRSetupCompanionAuthenticationRequest)];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100051380;
  v25[3] = &unk_1000CA930;
  v25[4] = self;
  [v5 setRequestHandler:v25 forRequestClass:objc_opt_class(TRSetupProxyDeviceRequest)];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100051390;
  v24[3] = &unk_1000CA930;
  v24[4] = self;
  [v5 setRequestHandler:v24 forRequestClass:objc_opt_class(TRSetupProxyAuthenticationRequest)];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000513A0;
  v23[3] = &unk_1000CA930;
  v23[4] = self;
  [v5 setRequestHandler:v23 forRequestClass:objc_opt_class(TRSetupCompletionRequest)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager homeKitSetupHandler](self, "homeKitSetupHandler"));
  [v6 registerMessageHandlersForSession:v5];

  objc_storeStrong((id *)&self->_activeSession, a3);
  self->_setupCompleted = -1;
  id v7 = (ACAccountStore *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  store = self->_store;
  self->_store = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](self->_store, "aa_primaryAppleAccount"));
  self->_hasICloudAccount = v9 != 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_activeiTunesAccount](self->_store, "ams_activeiTunesAccount"));
  self->_hasStoreAccount = v10 != 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( self->_store,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifierGameCenter));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountsWithAccountType:](self->_store, "accountsWithAccountType:", v11));
  if ((unint64_t)[v12 count] >= 2)
  {
    id v13 = NSStringFromSelector("creationDate");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v14,  0LL));

    v38 = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingDescriptors:v16]);

    id v12 = (void *)v17;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  self->_hasGameCenterAccount = v18 != 0LL;
  id v19 = sub_10004E254();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v31 = v9;
    __int16 v32 = 2112;
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v18;
    __int16 v36 = 2112;
    id v37 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Setting up configuration server session. {iCloud=%@, store=%@, gameCenter=%@, session=%@)",  buf,  0x2Au);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000513B0;
  v22[3] = &unk_1000CA428;
  v22[4] = self;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v21,  "tapToSetupManagerDidPromptToBeginSetup:",  v22);
}

- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void, id))a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___TRSetupCompletionResponse);
  self->_setupCompleted = [v9 completedSuccessfully];
  v6[2](v6, 0LL, v7);

  else {
    -[SATVTapToSetupManager didFailSetupWithErrorCode:]( self,  "didFailSetupWithErrorCode:",  [v9 errorCode]);
  }
  -[TRSession setDisconnectHandler:](self->_activeSession, "setDisconnectHandler:", 0LL);
  -[TRSession disconnect](self->_activeSession, "disconnect");
  activeSession = self->_activeSession;
  self->_activeSession = 0LL;
}

- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceName]);
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting configuration from device named: %@.",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100051688;
  id v19 = &unk_1000CA478;
  id v20 = self;
  id v12 = v6;
  id v21 = v12;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v11,  "tapToSetupManager:didBeginSetupWithDeviceName:isNewFlow:",  &v16);

  id v13 = objc_alloc_init(&OBJC_CLASS___TRSetupConfigurationResponse);
  objc_msgSend( v13,  "setNeedsNetwork:",  +[TVSNetworkUtilities internetAvailable]( TVSNetworkUtilities,  "internetAvailable",  v16,  v17,  v18,  v19,  v20) ^ 1);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v15 = v14;
  if (!self->_hasICloudAccount) {
    [v14 addObject:&off_1000D0D48];
  }
  if (!self->_hasStoreAccount) {
    [v15 addObject:&off_1000D0D30];
  }
  if (!self->_hasGameCenterAccount) {
    [v15 addObject:&off_1000D0D60];
  }
  [v13 setUnauthenticatedAccountServices:v15];
  v7[2](v7, 0LL, v13);
}

- (void)_handleActivationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Handling activation request: %@.", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_activatorHookDelegate);
  if (WeakRetained)
  {
    id v11 = sub_10004E254();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Activator hook is set. Waiting for it to finish.",  buf,  2u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100051898;
    v14[3] = &unk_1000C9938;
    id v15 = v7;
    [WeakRetained tapToSetupManager:self readyToActivateWithCompletionHandler:v14];
    id v13 = v15;
  }

  else
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___TRSetupActivationResponse);
    objc_msgSend(v13, "setActivated:", +[TVSDevice isActivated](TVSDevice, "isActivated"));
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v13);
  }
}

- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Responding to network request: %@.", buf, 0xCu);
  }

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100051B0C;
  id v18 = &unk_1000CA980;
  id v19 = self;
  id v10 = v7;
  id v20 = v10;
  id v11 = objc_retainBlock(&v15);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkSSID", v15, v16, v17, v18, v19));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 networkSSID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 networkPassword]);
    -[SATVTapToSetupManager _connectToNetworkWithRecommendedSSID:password:completionHandler:]( self,  "_connectToNetworkWithRecommendedSSID:password:completionHandler:",  v13,  v14,  v11);
  }

  else
  {
    ((void (*)(void ***, id, void))v11[2])( v11,  +[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable"),  0LL);
  }
}

- (void)_handleSetupServiceProgressEvent:(unsigned int)a3 info:(id)a4
{
  id v6 = a4;
  if ((int)a3 > 31)
  {
    switch(a3)
    {
      case ' ':
        id v19 = sub_10004E254();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int setupCompleted = self->_setupCompleted;
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = setupCompleted;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "SetupService: session ended {completed=%{BOOL}d}",  buf,  8u);
        }

        -[TRSession setDisconnectHandler:](self->_activeSession, "setDisconnectHandler:", 0LL);
        -[TRSession disconnect](self->_activeSession, "disconnect");
        activeSession = self->_activeSession;
        self->_activeSession = 0LL;

        if (self->_setupCompleted < 0) {
          -[SATVTapToSetupManager didFailSetupWithErrorCode:](self, "didFailSetupWithErrorCode:", -9104LL);
        }
        goto LABEL_31;
      case '(':
        id v23 = sub_10004E254();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "SetupService: PreAuth=%@", buf, 0xCu);
        }

        id v9 = (TVSKTapToSetupDeviceInfo *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_1000520A4;
        v27[3] = &unk_1000CA478;
        void v27[4] = self;
        id v28 = v6;
        -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v9,  "tapToSetupManager:didReceivePreAuthInfo:",  v27);
        id v14 = v28;
        break;
      case 'P':
        id v9 = -[TVSKTapToSetupDeviceInfo initWithRawDeviceInfo:]( objc_alloc(&OBJC_CLASS___TVSKTapToSetupDeviceInfo),  "initWithRawDeviceInfo:",  v6);
        -[SATVTapToSetupManager setDeviceInfo:](self, "setDeviceInfo:", v9);
        id v10 = sub_10004E254();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager deviceInfo](self, "deviceInfo"));
          *(_DWORD *)buf = 138412546;
          id v30 = v6;
          __int16 v31 = 2112;
          __int16 v32 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "SetupService: info=%@, deviceInfo=%@",  buf,  0x16u);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_1000520B0;
        v25[3] = &unk_1000CA478;
        v25[4] = self;
        id v26 = v6;
        -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v13,  "tapToSetupManager:didReceiveSetupInfo:",  v25);

        id v14 = v26;
        break;
      default:
        goto LABEL_31;
    }

LABEL_30:
    goto LABEL_31;
  }

  switch(a3)
  {
    case 0x14u:
      id v15 = sub_10004E254();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SetupService: session final", buf, 2u);
      }

      break;
    case 0x1Eu:
      id v17 = sub_10004E254();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100078198();
      }

      if (self->_activeSession) {
        break;
      }
      id v9 = (TVSKTapToSetupDeviceInfo *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"eo"]);
      -[SATVTapToSetupManager _didFailToStartSetupWithError:](self, "_didFailToStartSetupWithError:", v9);
      goto LABEL_30;
    case 0x1Fu:
      id v7 = sub_10004E254();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SetupService: session started", buf, 2u);
      }

      id v9 = (TVSKTapToSetupDeviceInfo *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trSession"]);
      if (v9) {
        -[SATVTapToSetupManager _handleSetupServiceStartSession:](self, "_handleSetupServiceStartSession:", v9);
      }
      goto LABEL_30;
  }

- (void)_handleSetupServiceStartSession:(id)a3
{
  id v4 = a3;
  if (self->_activeSession)
  {
    id v5 = sub_10004E254();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "SetupService: ignoring new session with already active session",  v7,  2u);
    }
  }

  else
  {
    -[TRDeviceSetupServer cancelActiveSetup](self->_server, "cancelActiveSetup");
    -[TRDeviceSetupServer stop](self->_server, "stop");
    -[SATVTapToSetupManager _setupSession:](self, "_setupSession:", v4);
  }
}

- (void)_handleCompanionAuthenticateWithRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Handle companion authenticating with request: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 targetedAccountServices]);
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100052330;
  v16[3] = &unk_1000CA9F8;
  objc_copyWeak(&v21, (id *)buf);
  v16[4] = self;
  id v12 = v6;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  id v14 = v7;
  id v20 = v14;
  id v15 = v10;
  id v19 = v15;
  -[SATVTapToSetupManager _saveRemoteVerifiedAccount:completion:]( self,  "_saveRemoteVerifiedAccount:completion:",  v15,  v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)_completedCompanionAuthenticationRequest:(id)a3 unauthenticatedAccountServices:(id)a4 withResponseHandler:(id)a5
{
  id v6 = (void (**)(id, void, id))a5;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___TRSetupAuthenticationResponse);
  [v8 setUnauthenticatedAccountServices:v7];

  v6[2](v6, 0LL, v8);
}

- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4
{
  id v4 = (void (**)(id, void, id))a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  [v6 setLinkType:3];
  id v5 = objc_alloc_init(&OBJC_CLASS___TRSetupProxyDeviceResponse);
  [v5 setProxyDevice:v6];
  v4[2](v4, 0LL, v5);
}

- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Handling proxy authentication request: %@.",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 rawPassword]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 targetedAccountServices]);
  objc_msgSend(v10, "_aa_setRawPassword:", v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100052928;
  v18[3] = &unk_1000CAA70;
  v18[4] = self;
  id v19 = v6;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v7;
  id v13 = v11;
  id v14 = v10;
  id v15 = v7;
  id v16 = v12;
  id v17 = v6;
  -[SATVTapToSetupManager _saveRemoteVerifiedAccount:completion:]( self,  "_saveRemoteVerifiedAccount:completion:",  v14,  v18);
}

- (void)_completedProxyAuthenticationRequest:(id)a3 unauthenticatedAccountServices:(id)a4 withResponseHandler:(id)a5
{
  id v6 = (void (**)(id, void, id))a5;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___TRSetupAuthenticationResponse);
  [v8 setUnauthenticatedAccountServices:v7];

  v6[2](v6, 0LL, v8);
}

- (void)didCompleteSetup
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100052C34;
  v4[3] = &unk_1000CA428;
  v4[4] = self;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v3,  "tapToSetupManagerDidFinishSetup:deviceInfo:",  v4);
}

- (void)didFailSetupWithErrorCode:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100052D60;
  v6[3] = &unk_1000CAA98;
  v6[4] = self;
  v6[5] = a3;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v5,  "tapToSetupManager:didFailSetupWithError:",  v6);
}

- (void)_didFailToStartSetupWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100052EFC;
  v7[3] = &unk_1000CA478;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v5,  "tapToSetupManager:didFailToStartSetupWithError:",  v7);
}

- (int64_t)_serviceTypeForAccountService:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0LL;
  }
  else {
    return qword_1000C4678[a3 - 1];
  }
}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  store = self->_store;
  if (store)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 accountType]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( store,  "accountTypeWithAccountTypeIdentifier:",  v11));

    [v6 setAccountType:v12];
    [v6 _setObjectID:0];
    [v6 markAllPropertiesDirty];
    id v13 = self->_store;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100053110;
    v14[3] = &unk_1000CAAC0;
    id v16 = v8;
    id v15 = v6;
    -[ACAccountStore saveVerifiedAccount:withCompletionHandler:]( v13,  "saveVerifiedAccount:withCompletionHandler:",  v15,  v14);
  }

  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_authenticateAccount:(id)a3 forServiceType:(int64_t)a4 withCompanionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  [v13 linkType];
  id v17 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);

  [v17 setUsername:v15];
  [v17 setIsUsernameEditable:0];
  [v17 setShouldAllowAppleIDCreation:0];
  [v17 setServiceType:a4];
  [v17 setAuthenticationType:1];
  [v17 setShouldUpdatePersistentServiceTokens:1];
  [v17 setCompanionDevice:v13];

  [v17 setAnisetteDataProvider:v12];
  [v17 _setProxyingForApp:1];
  id v16 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  [v16 authenticateWithContext:v17 completion:v11];
}

- (void)_authenticateAccount:(id)a3 forServiceType:(int64_t)a4 withPassword:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v14 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);

  [v14 setUsername:v12];
  [v14 _setPassword:v10];

  [v14 setIsUsernameEditable:0];
  [v14 setShouldAllowAppleIDCreation:0];
  [v14 setServiceType:a4];
  [v14 setAuthenticationType:1];
  [v14 setShouldUpdatePersistentServiceTokens:1];
  [v14 _setProxyingForApp:1];
  id v13 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  [v13 authenticateWithContext:v14 completion:v9];
}

- (void)_authenticateWithAccountServices:(id)a3 usingAuthenticationResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
    id v12 = [v11 unsignedIntegerValue];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000535BC;
    v13[3] = &unk_1000CAAE8;
    id v18 = v12;
    id v14 = v9;
    id v15 = v8;
    id v16 = self;
    id v17 = v10;
    -[SATVTapToSetupManager _authenticateWithAccountService:usingAuthenticationResults:completion:]( self,  "_authenticateWithAccountService:usingAuthenticationResults:completion:",  v12,  v14,  v13);
  }

  else
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v8, 0LL);
  }
}

- (void)_authenticateWithAccountService:(unint64_t)a3 usingAuthenticationResults:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  switch(a3)
  {
    case 3uLL:
      -[SATVTapToSetupManager _authenticateGameCenterWithAuthenticationResults:completionHandler:]( self,  "_authenticateGameCenterWithAuthenticationResults:completionHandler:",  v8,  v9);
      break;
    case 2uLL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100053878;
      v12[3] = &unk_1000CAB10;
      void v12[4] = self;
      id v13 = v8;
      id v14 = v9;
      -[SATVTapToSetupManager _authenticateStoreWithAuthenticationResults:completionHandler:]( self,  "_authenticateStoreWithAuthenticationResults:completionHandler:",  v13,  v12);

      break;
    case 1uLL:
      -[SATVTapToSetupManager _authenticateiCloudWithAuthenticationResults:completionHandler:]( self,  "_authenticateiCloudWithAuthenticationResults:completionHandler:",  v8,  v9);
      break;
    default:
      id v10 = sub_10004E254();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100078478(a3, v11);
      }

      (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
      break;
  }
}

- (void)_authenticateStoreWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Authenticating iTunes account",  (uint8_t *)&buf,  2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:AKAuthenticationUsernameKey]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 objectForKey:AKAuthenticationAlternateDSIDKey]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:AKAuthenticationPasswordKey]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100053CAC;
  v35[3] = &unk_1000CA478;
  v35[4] = self;
  id v14 = v10;
  id v36 = v14;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v13,  "tapToSetupManager:didBeginConfigurationPhase:withMetadata:",  v35);

  id v15 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v15 setAuthenticationType:1];
  [v15 setCanMakeAccountActive:1];
  id v16 = [[AMSAuthenticateTask alloc] initWithAccount:0 options:v15];
  [v16 setUsername:v14];
  v24 = (void *)v11;
  [v16 setAltDSID:v11];
  [v16 setPassword:v12];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 performAuthentication]);
  objc_initWeak(&buf, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100053CBC;
  v31[3] = &unk_1000CAB38;
  objc_copyWeak(&v33, &buf);
  id v18 = v7;
  id v32 = v18;
  id v19 = objc_retainBlock(v31);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100053D50;
  v28[3] = &unk_1000CA800;
  id v20 = v14;
  id v29 = v20;
  id v21 = v19;
  id v30 = v21;
  [v17 addSuccessBlock:v28];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100053FFC;
  v25[3] = &unk_1000CAB60;
  id v22 = v18;
  id v27 = v22;
  id v23 = v20;
  id v26 = v23;
  [v17 addErrorBlock:v25];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&buf);
}

- (void)_promptForASNSettingWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager _asnPaidSetting](self, "_asnPaidSetting"));

  if (!v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_activeiTunesAccount"));

    if (!v9)
    {
      id v14 = sub_10004E254();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100078664();
      }

      v4[2](v4);
      goto LABEL_21;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "tapToSetupManager:shouldPresentPasswordSettingPromptForAccount:") & 1) != 0
      && ([WeakRetained tapToSetupManager:self shouldPresentPasswordSettingPromptForAccount:v9] & 1) == 0)
    {
      id v21 = sub_10004E254();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 134217984;
        id v26 = v9;
        id v18 = "Delegate does not want us to present the ASN prompt. {activeAccount=%p}";
        id v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
    }

    else
    {
      if ((objc_opt_respondsToSelector(WeakRetained, "presentingControllerForTTSUManager:") & 1) != 0)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue([WeakRetained presentingControllerForTTSUManager:self]);
        if (v11)
        {
          id v12 = (void *)v11;
          id v13 = objc_alloc_init(&OBJC_CLASS___TVCSPasswordSettingPromptViewController);
          [v13 configureWithAccount:v9];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_1000544A4;
          v24[3] = &unk_1000CAB88;
          v24[4] = self;
          [v13 setDidSelect:v24];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_1000544B0;
          v22[3] = &unk_1000C9A00;
          id v23 = v4;
          [v12 presentViewController:v13 animated:1 completion:v22];

LABEL_20:
LABEL_21:

          goto LABEL_22;
        }
      }

      id v16 = sub_10004E254();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id buf = 134217984;
        id v26 = v9;
        id v18 = "Presenting controller is nil. Ignoring ASN prompt. {activeAccount=%p}";
        id v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_INFO;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, 0xCu);
      }
    }

    v4[2](v4);
    goto LABEL_20;
  }

  id v6 = sub_10004E254();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Ignoring ASN Prompt since device already has a setting for it.",  buf,  2u);
  }

  v4[2](v4);
LABEL_22:
}

- (id)_asnPaidSetting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);
  id v4 = (char *)[v3 paidPurchasesPasswordSetting];

  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
  }
  return v5;
}

- (void)_setAsnPaidSetting:(id)a3
{
  id v3 = a3;
  if (!v3) {
    sub_100078690();
  }
  id v8 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);

  id v6 = [v8 integerValue];
  [v5 setPaidPurchasesPasswordSetting:v6];
  id v7 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  [v7 setValue:@"true" forRequestParameter:@"setup"];
  [v5 updateAccountPasswordSettingsWithRequestProperties:v7 completionBlock:&stru_1000CABA8];
}

- (void)_authenticateiCloudWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Authenticating iCloud account", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AKAuthenticationUsernameKey]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AKAuthenticationPasswordKey]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000547BC;
  v18[3] = &unk_1000CA478;
  v18[4] = self;
  id v19 = v10;
  id v13 = v10;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v12,  "tapToSetupManager:didBeginConfigurationPhase:withMetadata:",  v18);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager iCloudAccountManager](self, "iCloudAccountManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000547CC;
  v16[3] = &unk_1000C9898;
  id v17 = v6;
  id v15 = v6;
  [v14 signInWithUsername:v13 password:v11 completion:v16];
}

- (void)_authenticateGameCenterWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10004E254();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Authenticating Game Center account", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AKAuthenticationUsernameKey]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AKAuthenticationPasswordKey]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100054984;
  v17[3] = &unk_1000CA478;
  v17[4] = self;
  id v18 = v10;
  id v13 = v10;
  -[SATVTapToSetupManager _checkTarget:forSelector:performBlockOnMainThread:]( self,  "_checkTarget:forSelector:performBlockOnMainThread:",  v12,  "tapToSetupManager:didBeginConfigurationPhase:withMetadata:",  v17);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100054994;
  v15[3] = &unk_1000CA8C8;
  id v16 = v6;
  id v14 = v6;
  +[GKLocalPlayer authenticateWithUsername:password:completionHandler:]( &OBJC_CLASS___GKLocalPlayer,  "authenticateWithUsername:password:completionHandler:",  v13,  v11,  v15);
}

- (void)_authenticateHomeSharingWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_10004E254();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Authenticating Home Sharing account", buf, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:AKAuthenticationUsernameKey]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:AKAuthenticationPasswordKey]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100054B30;
  v13[3] = &unk_1000C9938;
  id v14 = v5;
  id v12 = v5;
  [v11 setMediaServerDiscoveryConfigurationWithMode:1 homeSharingAccountName:v9 homeSharingPassword:v10 completionHandler:v13];
}

- (SATVTapToSetupManagerDelegate)userInterfaceDelegate
{
  return (SATVTapToSetupManagerDelegate *)objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
}

- (void)setUserInterfaceDelegate:(id)a3
{
}

- (SATVTapToSetupActivatorHookDelegate)activatorHookDelegate
{
  return (SATVTapToSetupActivatorHookDelegate *)objc_loadWeakRetained((id *)&self->_activatorHookDelegate);
}

- (void)setActivatorHookDelegate:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (double)startTimeout
{
  return self->_startTimeout;
}

- (void)setStartTimeout:(double)a3
{
  self->_startTimeout = a3;
}

- (BOOL)isSetupInfoTransactionInProgress
{
  return self->_setupInfoTransactionInProgress;
}

- (void)setSetupInfoTransactionInProgress:(BOOL)a3
{
  self->_setupInfoTransactionInProgress = a3;
}

- (id)connectionCompletionHandler
{
  return self->_connectionCompletionHandler;
}

- (void)setConnectionCompletionHandler:(id)a3
{
}

- (NSString)recommendedNetworkSSID
{
  return self->_recommendedNetworkSSID;
}

- (void)setRecommendedNetworkSSID:(id)a3
{
}

- (NSString)recommendedNetworkPassword
{
  return self->_recommendedNetworkPassword;
}

- (void)setRecommendedNetworkPassword:(id)a3
{
}

- (TVSWiFiNetworkConnectionOperation)connectionOperation
{
  return self->_connectionOperation;
}

- (void)setConnectionOperation:(id)a3
{
}

- (NSOperationQueue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (TRDeviceSetupServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (HMDeviceSetupOperationHandler)homeKitSetupHandler
{
  return self->_homeKitSetupHandler;
}

- (void)setHomeKitSetupHandler:(id)a3
{
}

- (TRNearbyDeviceAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
}

- (TRSession)activeSession
{
  return self->_activeSession;
}

- (void)setActiveSession:(id)a3
{
}

- (SFDeviceSetupAppleTVService)setupService
{
  return self->_setupService;
}

- (void)setSetupService:(id)a3
{
}

- (int)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(int)a3
{
  self->_int setupCompleted = a3;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (BOOL)hasICloudAccount
{
  return self->_hasICloudAccount;
}

- (void)setHasICloudAccount:(BOOL)a3
{
  self->_hasICloudAccount = a3;
}

- (BOOL)hasStoreAccount
{
  return self->_hasStoreAccount;
}

- (void)setHasStoreAccount:(BOOL)a3
{
  self->_hasStoreAccount = a3;
}

- (BOOL)hasGameCenterAccount
{
  return self->_hasGameCenterAccount;
}

- (void)setHasGameCenterAccount:(BOOL)a3
{
  self->_hasGameCenterAccount = a3;
}

- (TVSiCloudAccountManager)iCloudAccountManager
{
  return self->_iCloudAccountManager;
}

- (void)setICloudAccountManager:(id)a3
{
}

- (TVSKTapToSetupDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end