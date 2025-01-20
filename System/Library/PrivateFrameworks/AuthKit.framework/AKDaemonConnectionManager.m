@interface AKDaemonConnectionManager
+ (id)sharedInstance;
- (AAFService)fidoDaemonService;
- (AAFService)inheritanceDaemonService;
- (AAFService)signInWithAppleDaemonService;
- (AAFService)walrusDaemonService;
- (AKAuthorizationEndorserRapportClient)authorizationEndorserRapportClient;
- (AKDaemonConnectionManager)init;
- (BOOL)_isDeviceScreenUnlockNotification:(id)a3;
- (BOOL)_isPasscodeChangeNotification:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAllowClient:(id)a3 logging:(id *)a4;
- (NSXPCListener)anisetteServiceListener;
- (NSXPCListener)authServiceListener;
- (NSXPCListener)authorizationServiceListener;
- (NSXPCListener)custodianServiceListener;
- (NSXPCListener)privateEmailServiceListener;
- (id)passwordResetPresenter;
- (void)_beginObservingLanguageChangeNotfication;
- (void)_beginObservingRegulatoryEligibilityChangeNotification;
- (void)_checkKeybagUnlockState;
- (void)_checkScreenUnlockStateFromNotificationDictionary:(id)a3;
- (void)_exitForSIGTERM;
- (void)_monitorXPCEvents;
- (void)_setupServices;
- (void)_startListeningForMessagesFromPairedDevice;
- (void)_startMonitoringPushEvents;
- (void)_stopObservingLanguageChangeNotification;
- (void)_stopObservingRegulatoryEligibilityChangeNotification;
- (void)_updateRestrictedSharingMode;
- (void)dealloc;
- (void)setAnisetteServiceListener:(id)a3;
- (void)setAuthServiceListener:(id)a3;
- (void)setAuthorizationEndorserRapportClient:(id)a3;
- (void)setAuthorizationServiceListener:(id)a3;
- (void)setCustodianServiceListener:(id)a3;
- (void)setFidoDaemonService:(id)a3;
- (void)setInheritanceDaemonService:(id)a3;
- (void)setPrivateEmailServiceListener:(id)a3;
- (void)setSignInWithAppleDaemonService:(id)a3;
- (void)setWalrusDaemonService:(id)a3;
- (void)start;
- (void)startForTesting;
@end

@implementation AKDaemonConnectionManager

+ (id)sharedInstance
{
  if (qword_10020F548 != -1) {
    dispatch_once(&qword_10020F548, &stru_1001CA2B8);
  }
  return (id)qword_10020F540;
}

- (void)dealloc
{
  authServiceListener = self->_authServiceListener;
  if (authServiceListener)
  {
    -[NSXPCListener invalidate](authServiceListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_authServiceListener, "setDelegate:", 0LL);
    v4 = self->_authServiceListener;
    self->_authServiceListener = 0LL;
  }

  anisetteServiceListener = self->_anisetteServiceListener;
  if (anisetteServiceListener)
  {
    -[NSXPCListener invalidate](anisetteServiceListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_anisetteServiceListener, "setDelegate:", 0LL);
    v6 = self->_anisetteServiceListener;
    self->_anisetteServiceListener = 0LL;
  }

  authorizationServiceListener = self->_authorizationServiceListener;
  if (authorizationServiceListener)
  {
    -[NSXPCListener invalidate](authorizationServiceListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_authorizationServiceListener, "setDelegate:", 0LL);
    v8 = self->_authorizationServiceListener;
    self->_authorizationServiceListener = 0LL;
  }

  authorizationEndorserRapportClient = self->_authorizationEndorserRapportClient;
  if (authorizationEndorserRapportClient)
  {
    -[AKAuthorizationEndorserRapportClient setDelegate:](authorizationEndorserRapportClient, "setDelegate:", 0LL);
    v10 = self->_authorizationEndorserRapportClient;
    self->_authorizationEndorserRapportClient = 0LL;
  }

  walrusDaemonService = self->_walrusDaemonService;
  if (walrusDaemonService)
  {
    self->_walrusDaemonService = 0LL;
  }

  -[AKDaemonConnectionManager _stopObservingLanguageChangeNotification]( self,  "_stopObservingLanguageChangeNotification");
  -[AKDaemonConnectionManager _stopObservingSharingModePolicyChangeNotfication]( self,  "_stopObservingSharingModePolicyChangeNotfication");
  -[AKDaemonConnectionManager _stopObservingRegulatoryEligibilityChangeNotification]( self,  "_stopObservingRegulatoryEligibilityChangeNotification");
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKDaemonConnectionManager;
  -[AKDaemonConnectionManager dealloc](&v12, "dealloc");
}

- (AKDaemonConnectionManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AKDaemonConnectionManager;
  v2 = -[AKDaemonConnectionManager init](&v16, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
    +[AKURLBag setSharedMemorySpaceBagProvider:](&OBJC_CLASS___AKURLBag, "setSharedMemorySpaceBagProvider:", v3);
    v4 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v5 = -[NSXPCListener initWithMachServiceName:](v4, "initWithMachServiceName:", AKAppleIDAuthenticationMachService);
    authServiceListener = v2->_authServiceListener;
    v2->_authServiceListener = v5;

    v7 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v8 = -[NSXPCListener initWithMachServiceName:](v7, "initWithMachServiceName:", AKAnisetteProvisioningMachService);
    anisetteServiceListener = v2->_anisetteServiceListener;
    v2->_anisetteServiceListener = v8;

    v10 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v11 = -[NSXPCListener initWithMachServiceName:](v10, "initWithMachServiceName:", AKAuthorizationMachService);
    authorizationServiceListener = v2->_authorizationServiceListener;
    v2->_authorizationServiceListener = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___AKWalrusDaemonService);
    walrusDaemonService = v2->_walrusDaemonService;
    v2->_walrusDaemonService = (AAFService *)v13;
  }

  return v2;
}

- (id)passwordResetPresenter
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned __int8 v4 = [v3 isForgotPasswordNativeTakeoverEnabled];

  if ((v4 & 1) != 0)
  {
    passwordResetPresenter = v2->_passwordResetPresenter;
    if (!passwordResetPresenter)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___AKPasswordResetPresenter);
      v7 = v2->_passwordResetPresenter;
      v2->_passwordResetPresenter = v6;

      passwordResetPresenter = v2->_passwordResetPresenter;
    }

    v8 = passwordResetPresenter;
  }

  else
  {
    v8 = 0LL;
  }

  objc_sync_exit(v2);

  return v8;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
  [v3 start];

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationListUpdateService sharedService]( &OBJC_CLASS___AKAuthorizationListUpdateService,  "sharedService"));
  [v4 start];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKPostInstallService sharedService](&OBJC_CLASS___AKPostInstallService, "sharedService"));
  [v5 start];

  -[AKDaemonConnectionManager _setupServices](self, "_setupServices");
  -[AKDaemonConnectionManager _startListeningForMessagesFromPairedDevice]( self,  "_startListeningForMessagesFromPairedDevice");
  -[AKDaemonConnectionManager _monitorXPCEvents](self, "_monitorXPCEvents");
  -[AKDaemonConnectionManager _beginObservingLanguageChangeNotfication]( self,  "_beginObservingLanguageChangeNotfication");
  -[AKDaemonConnectionManager _beginObservingSharingModePolicyChangeNotfication]( self,  "_beginObservingSharingModePolicyChangeNotfication");
  -[AKDaemonConnectionManager _beginObservingRegulatoryEligibilityChangeNotification]( self,  "_beginObservingRegulatoryEligibilityChangeNotification");
  -[AKDaemonConnectionManager _exitForSIGTERM](self, "_exitForSIGTERM");
}

- (void)startForTesting
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
  [v3 setBagProvider:v4];

  -[AKDaemonConnectionManager _setupServices](self, "_setupServices");
}

- (void)_setupServices
{
  uint64_t v3 = _AKLogSystem(self);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10013D854((uint64_t)self);
  }

  -[NSXPCListener setDelegate:](self->_authServiceListener, "setDelegate:", self);
  uint64_t v5 = _AKLogSystem(-[NSXPCListener resume](self->_authServiceListener, "resume"));
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013D7D8((uint64_t)self);
  }

  -[NSXPCListener setDelegate:](self->_anisetteServiceListener, "setDelegate:", self);
  uint64_t v7 = _AKLogSystem(-[NSXPCListener resume](self->_anisetteServiceListener, "resume"));
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10013D75C((uint64_t)self);
  }

  -[NSXPCListener setDelegate:](self->_authorizationServiceListener, "setDelegate:", self);
  uint64_t v9 = _AKLogSystem(-[NSXPCListener resume](self->_authorizationServiceListener, "resume"));
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10013D6E0((uint64_t)self);
  }

  -[AAFService startup](self->_walrusDaemonService, "startup");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = -[AKClient initWithConnection:](objc_alloc(&OBJC_CLASS___AKClient), "initWithConnection:", v7);
  uint64_t v9 = v8;
  if (self->_authorizationServiceListener == v6)
  {
    v11 = 0LL;
LABEL_5:
    if (self->_authServiceListener == v6)
    {
      v15 = objc_alloc(&OBJC_CLASS___AKAppleIDAuthenticationService);
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKDaemonConnectionManager passwordResetPresenter](self, "passwordResetPresenter"));
      v14 = -[AKAppleIDAuthenticationService initWithClient:passwordResetPresenter:]( v15,  "initWithClient:passwordResetPresenter:",  v9,  v16);

      [v7 setExportedObject:v14];
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDAuthenticationDaemonInterface XPCInterface]( &OBJC_CLASS___AKAppleIDAuthenticationDaemonInterface,  "XPCInterface"));
      [v7 setExportedInterface:v17];

      v18 = &OBJC_CLASS___AKAppleIDAuthenticationClientInterface;
    }

    else if (self->_anisetteServiceListener == v6)
    {
      uint64_t v19 = _AKTrafficLogSubsystem(v8);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_10013D8D0();
      }

      v14 = -[AKAnisetteProvisioningService initWithClient:]( objc_alloc(&OBJC_CLASS___AKAnisetteProvisioningService),  "initWithClient:",  v9);
      [v7 setExportedObject:v14];
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnisetteProvisioningDaemonInterface XPCInterface]( &OBJC_CLASS___AKAnisetteProvisioningDaemonInterface,  "XPCInterface"));
      [v7 setExportedInterface:v21];

      v18 = &OBJC_CLASS___AKAnisetteProvisioningClientInterface;
    }

    else
    {
      if (self->_authorizationServiceListener != v6)
      {
        uint64_t v13 = _AKLogSystem(v8);
        v14 = (AKAnisetteProvisioningService *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
          sub_10013D934();
        }
        goto LABEL_16;
      }

      v14 = -[AKAuthorizationDaemonService initWithClient:]( objc_alloc(&OBJC_CLASS___AKAuthorizationDaemonService),  "initWithClient:",  v9);
      [v7 setExportedObject:v14];
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationDaemonInterface XPCInterface]( &OBJC_CLASS___AKAuthorizationDaemonInterface,  "XPCInterface"));
      [v7 setExportedInterface:v22];

      v18 = &OBJC_CLASS___AKAuthorizationClientInterface;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v18 XPCInterface]);
    [v7 setRemoteObjectInterface:v23];

LABEL_16:
    [v7 resume];
    BOOL v12 = 1;
    goto LABEL_17;
  }

  id v25 = 0LL;
  unsigned int v10 = -[AKDaemonConnectionManager shouldAllowClient:logging:](self, "shouldAllowClient:logging:", v8, &v25);
  v8 = (AKClient *)v25;
  v11 = v8;
  if (v10) {
    goto LABEL_5;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)shouldAllowClient:(id)a3 logging:(id *)a4
{
  id v5 = a3;
  if ([v5 hasWriteAccess])
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New connection from client %@ with the AK write entitlment.",  v5);
  }

  else if ([v5 hasInternalAccess])
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New connection from client %@ (internal).",  v5);
  }

  else if ([v5 hasPrivateAccess])
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New connection from client %@ (private).",  v5);
  }

  else if ([v5 hasPublicAccess])
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New connection from client %@ (public).",  v5);
  }

  else if ([v5 hasSiwaEntitlement])
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New connection from client %@ (beleverde).",  v5);
  }

  else
  {
    if (![v5 hasPrivateSignedAccess])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rejecting connection from client %@ because it is not entitled.",  v5));
      BOOL v8 = 0;
      if (!a4) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New connection from client %@ because of internal code signing.",  v5);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = 1;
  if (a4) {
LABEL_14:
  }
    *a4 = v7;
LABEL_15:

  return v8;
}

- (void)_startMonitoringPushEvents
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  [v10 addObject:v2];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKFollowUpManagerFactory sharedAuthKitFollowupPushDelegate]( &OBJC_CLASS___AKFollowUpManagerFactory,  "sharedAuthKitFollowupPushDelegate"));
  [v10 addObject:v3];

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListController sharedController](&OBJC_CLASS___AKDeviceListController, "sharedController"));
  [v10 addObject:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
  [v10 addObject:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
  [v10 addObject:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserConfigController sharedController](&OBJC_CLASS___AKUserConfigController, "sharedController"));
  [v10 addObject:v7];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKSignOutManager sharedManager](&OBJC_CLASS___AKSignOutManager, "sharedManager"));
  [v10 addObject:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKAppleIDPushHelperService sharedService](&OBJC_CLASS___AKAppleIDPushHelperService, "sharedService"));
  [v9 startWithDelegates:v10];
}

- (void)_monitorXPCEvents
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100093D88;
  handler[3] = &unk_1001C7880;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, handler);
  xpc_set_event_stream_handler("com.apple.rapport.matching", &_dispatch_main_q, &stru_1001CA318);

  uint64_t v3 = _AKLogSystem(v2);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registered for XPC events", v5, 2u);
  }
}

- (BOOL)_isPasscodeChangeNotification:(id)a3
{
  return [a3 isEqual:MCPasscodeChangedNotification];
}

- (BOOL)_isDeviceScreenUnlockNotification:(id)a3
{
  uint64_t v3 = kSBSLockStateNotifyKey;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  LOBYTE(v3) = [v4 isEqual:v5];

  return v3;
}

- (void)_checkScreenUnlockStateFromNotificationDictionary:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "_State");
  uint64_t v4 = _AKLogSystem(uint64);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  uint64));
    int v7 = 138412290;
    BOOL v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Lockscreen state: %@ ", (uint8_t *)&v7, 0xCu);
  }

  if (!uint64) {
    +[AKAppleIDCheckInHelperService setCheckInAllowedForAllAccountsToValue:]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "setCheckInAllowedForAllAccountsToValue:",  1LL);
  }
}

- (void)_checkKeybagUnlockState
{
  uint64_t v2 = _AKLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking lock state", v6, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned int v5 = [v4 isUnlocked];

  if (v5) {
    +[AKAppleIDCheckInHelperService setCheckInAllowedForAllAccountsToValue:]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "setCheckInAllowedForAllAccountsToValue:",  1LL);
  }
}

- (void)_startListeningForMessagesFromPairedDevice
{
  uint64_t v2 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v2)
  {
    uint64_t v3 = _AKLogSystem(v2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      unsigned int v5 = "We are running in recovery. Leaving IDS alone.";
      v6 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  int v7 = getenv("__AKSYNCBUBBLE");
  if (v7)
  {
    uint64_t v8 = _AKLogSystem(v7);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v5 = "We are running in the sync bubble. Leaving IDS alone.";
      v6 = buf;
      goto LABEL_7;
    }

- (void)_beginObservingLanguageChangeNotfication
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100094428,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0LL);
}

- (void)_exitForSIGTERM
{
  object = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  dispatch_source_set_event_handler(object, &stru_1001CA338);
  dispatch_resume(object);
}

- (void)_beginObservingRegulatoryEligibilityChangeNotification
{
  uint64_t v3 = _AKLogSystem(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Begin observing eligibility status change.",  v6,  2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000945FC,  @"com.apple.os-eligibility-domain.change",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingRegulatoryEligibilityChangeNotification
{
  uint64_t v3 = _AKLogSystem(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Stop observing eligibility status change.",  v6,  2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.os-eligibility-domain.change", 0LL);
}

- (void)_updateRestrictedSharingMode
{
  uint64_t v2 = _AKLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating current sharing mode.", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  [v4 _setCurrentSharingMode];
}

- (NSXPCListener)anisetteServiceListener
{
  return self->_anisetteServiceListener;
}

- (void)setAnisetteServiceListener:(id)a3
{
}

- (NSXPCListener)authServiceListener
{
  return self->_authServiceListener;
}

- (void)setAuthServiceListener:(id)a3
{
}

- (NSXPCListener)authorizationServiceListener
{
  return self->_authorizationServiceListener;
}

- (void)setAuthorizationServiceListener:(id)a3
{
}

- (NSXPCListener)custodianServiceListener
{
  return self->_custodianServiceListener;
}

- (void)setCustodianServiceListener:(id)a3
{
}

- (NSXPCListener)privateEmailServiceListener
{
  return self->_privateEmailServiceListener;
}

- (void)setPrivateEmailServiceListener:(id)a3
{
}

- (AKAuthorizationEndorserRapportClient)authorizationEndorserRapportClient
{
  return self->_authorizationEndorserRapportClient;
}

- (void)setAuthorizationEndorserRapportClient:(id)a3
{
}

- (AAFService)inheritanceDaemonService
{
  return self->_inheritanceDaemonService;
}

- (void)setInheritanceDaemonService:(id)a3
{
}

- (AAFService)fidoDaemonService
{
  return self->_fidoDaemonService;
}

- (void)setFidoDaemonService:(id)a3
{
}

- (AAFService)walrusDaemonService
{
  return self->_walrusDaemonService;
}

- (void)setWalrusDaemonService:(id)a3
{
}

- (AAFService)signInWithAppleDaemonService
{
  return self->_signInWithAppleDaemonService;
}

- (void)setSignInWithAppleDaemonService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end