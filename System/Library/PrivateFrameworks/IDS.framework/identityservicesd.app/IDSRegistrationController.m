@interface IDSRegistrationController
+ (BOOL)_isPhoneNumberAuthenticationDuringBuddyAllowed;
+ (BOOL)canCompleteRegistration;
+ (BOOL)canStartRegistrationForAccountType:(int)a3;
+ (BOOL)isBuddyBlockingRegistration;
+ (BOOL)isBuddyShowing;
+ (BOOL)systemSupportsPhoneNumberRegistration;
+ (BOOL)systemSupportsRegistrationInfo:(id)a3;
+ (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5;
+ (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4;
+ (BOOL)validSIMStateForRegistration;
+ (IDSRegistrationController)sharedInstance;
+ (id)registeredPhoneNumbers;
+ (void)initialize;
- (BOOL)_performCorrectServerRequestForDeviceIDRegistration:(id)a3;
- (BOOL)_performCorrectServerRequestForTemporaryPhoneRegistration:(id)a3 sentAuthentication:(BOOL *)a4 sentIDSAction:(BOOL *)a5;
- (BOOL)_pnrOngoing;
- (BOOL)_sendIDSAuthenticationForRegistration:(id)a3;
- (BOOL)_sendIDSAuthenticationOrRegistrationIfNeeded:(id)a3;
- (BOOL)_shouldSubmitRegistrationCompletedMetricForRegistration:(id)a3;
- (BOOL)displayingAddNumberPrompt;
- (BOOL)registerInfo:(id)a3;
- (BOOL)registerInfo:(id)a3 requireSilentAuth:(BOOL)a4;
- (BOOL)registrationSupportedForRegistration:(id)a3;
- (BOOL)systemSupportsPhoneNumberRegistration;
- (BOOL)systemSupportsRegistrationInfo:(id)a3;
- (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5;
- (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4;
- (BOOL)unregisterInfo:(id)a3;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSRateLimiter)simDeactivationRequestRateLimiter;
- (IDSRegistrationController)init;
- (IDSRegistrationController)initWithUserStore:(id)a3;
- (IDSUserStore)userStore;
- (NSArray)activeRegistrations;
- (NSArray)activeRegistrationsToRegister;
- (NSArray)trackedRegistrations;
- (double)simDeactivationInfoRateLimitInterval;
- (id)_phoneUserWithCredentials;
- (id)_provisionedTemporaryUser;
- (id)activeRegistrationsMatchingUserID:(id)a3;
- (id)activeRegistrationsOfType:(int)a3;
- (int64_t)simDeactivationInfoRateLimitCount;
- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4;
- (void)_alertForHomeNumberIfNeededForSIMIdentifier:(id)a3 withPhoneNumber:(id)a4;
- (void)_captureDiagnosticsForFailedRegistration:(id)a3 registrationError:(int64_t)a4;
- (void)_ensureProfileQueriesAreReadyForRegistratration:(id)a3;
- (void)_notifyAllRegistrationSuccess:(id)a3;
- (void)_notifyDeregistrationStarting:(id)a3;
- (void)_notifyHomeNumberSuccessForUser:(id)a3;
- (void)_notifyNeedsNewRegistration;
- (void)_notifyRegistrationFailure:(id)a3 error:(int64_t)a4 info:(id)a5;
- (void)_notifyRegistrationStarting:(id)a3;
- (void)_notifyRegistrationSuccess:(id)a3;
- (void)_notifyRegistrationUpdated:(id)a3;
- (void)_postHomeNumberNotificationBeforeAlertForIdentifier:(id)a3 forcefully:(BOOL)a4;
- (void)_submitRegistrationCompletedMetricWithRegistration:(id)a3 success:(BOOL)a4 registrationError:(int64_t)a5;
- (void)_systemConfigurationPrefsChanged;
- (void)_updateNotifyState;
- (void)addListener:(id)a3;
- (void)cancelActionsForRegistrationInfo:(id)a3;
- (void)center:(id)a3 allSucceededRegistrations:(id)a4;
- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedCurrentEmailsRequest:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedIDSAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedIdentification:(id)a4 error:(int64_t)a5;
- (void)center:(id)a3 failedRegistration:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 succeededAuthentication:(id)a4;
- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5;
- (void)center:(id)a3 succeededIDSAuthentication:(id)a4;
- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6;
- (void)center:(id)a3 succeededInitialRegionQuery:(id)a4;
- (void)center:(id)a3 succeededLinkHandlesConfirmation:(id)a4 emailAddress:(id)a5;
- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8;
- (void)center:(id)a3 succeededRegistration:(id)a4;
- (void)centerNeedsNewIdentification:(id)a3;
- (void)dealloc;
- (void)noteManateeAvailabilityTime;
- (void)noteiCloudSignInTime;
- (void)removeListener:(id)a3;
- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5;
- (void)reportMessage:(id)a3 toURI:(id)a4 registration:(id)a5;
- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4 registration:(id)a5;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8 registration:(id)a9;
- (void)setDisplayingAddNumberPrompt:(BOOL)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setSimDeactivationRequestRateLimiter:(id)a3;
- (void)setUserStore:(id)a3;
- (void)startTrackingActiveRegistration:(id)a3;
- (void)startTrackingRegistration:(id)a3;
- (void)stopTrackingActiveRegistration:(id)a3;
- (void)stopTrackingRegistration:(id)a3;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation IDSRegistrationController

+ (void)initialize
{
  uint64_t v2 = objc_opt_class(a1, a2);
  if (v2 == objc_opt_class(&OBJC_CLASS___IDSRegistrationController, v3)) {
    +[IDSRegistrationKeyManager setupKeys](&OBJC_CLASS___IDSRegistrationKeyManager, "setupKeys");
  }
}

+ (BOOL)isBuddyShowing
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  char v3 = [v2 isSetup] ^ 1;

  return v3;
}

+ (BOOL)isBuddyBlockingRegistration
{
  if ((_os_feature_enabled_impl("IDS", "RegisterDuringBuddy") & 1) != 0) {
    return 0;
  }
  else {
    return [a1 isBuddyShowing];
  }
}

+ (BOOL)canStartRegistrationForAccountType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (_os_feature_enabled_impl("IDS", "RegisterDuringBuddy"))
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RegisterDuringBuddy feature flag set to YES.  Allowing registration.",  (uint8_t *)&v19,  2u);
    }

    LOBYTE(v6) = 1;
  }

  else
  {
    unsigned int v7 = [a1 isBuddyBlockingRegistration];
    int v6 = v7 ^ 1;
    unsigned int v8 = [a1 _isPhoneNumberAuthenticationDuringBuddyAllowed];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    unsigned int v10 = [v9 isCurrentDeviceTinkerConfiguredWatch];

    if ((_DWORD)v3 == 1)
    {
      v6 |= v10;
    }

    else if (!(_DWORD)v3)
    {
      v6 |= v8;
    }

    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      uint64_t v12 = _StringForIDSAccountType(v3);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v13;
      int v19 = 138413314;
      if (v7) {
        v15 = @"NO";
      }
      else {
        v15 = @"YES";
      }
      v20 = v11;
      if (v8) {
        v16 = @"YES";
      }
      else {
        v16 = @"NO";
      }
      __int16 v21 = 2112;
      if (v10) {
        v17 = @"YES";
      }
      else {
        v17 = @"NO";
      }
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      v24 = v15;
      __int16 v25 = 2112;
      v26 = v16;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checked whether system setup dependencies are complete { haveDependenciesCompleted: %@, accountType: %@, hasSetu pCompleted: %@, isPhoneNumberAuthenticationDuringSetupAllowed: %@, isAppleIDRegistrationDuringSetupAllowed: %@ }",  (uint8_t *)&v19,  0x34u);
    }
  }

  return v6;
}

+ (BOOL)canCompleteRegistration
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 activePairedDeviceHasPairingType:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDependencyProvider systemMonitorAdapter]( &OBJC_CLASS___IDSDependencyProvider,  "systemMonitorAdapter"));
  unsigned __int8 v5 = [v4 isUnderFirstDataProtectionLock];

  if ((v5 & 1) == 0 && (v3 & 1) == 0) {
    unsigned __int8 v5 = +[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration");
  }
  return v5 ^ 1;
}

+ (BOOL)_isPhoneNumberAuthenticationDuringBuddyAllowed
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"setup-phone-auth-enabled"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (BOOL)validSIMStateForRegistration
{
  if (!+[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration")) {
    return 1;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  unsigned __int8 v3 = [v2 isAnySIMUsable];

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      unsigned __int8 v6 = " SIM State says cannot register";
      unsigned int v7 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }

+ (id)registeredPhoneNumbers
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 trackedRegistrations]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005FF44;
  v8[3] = &unk_1008F7970;
  unsigned int v9 = v2;
  uint64_t v5 = v2;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = -[NSMutableSet copy](v5, "copy");
  return v6;
}

+ (IDSRegistrationController)sharedInstance
{
  if (qword_1009BE908 != -1) {
    dispatch_once(&qword_1009BE908, &stru_1008F82F8);
  }
  return (IDSRegistrationController *)(id)qword_1009BE910;
}

- (IDSRegistrationController)init
{
  return -[IDSRegistrationController initWithUserStore:](self, "initWithUserStore:", 0LL);
}

- (IDSUserStore)userStore
{
  userStore = self->_userStore;
  if (userStore)
  {
    unsigned __int8 v3 = userStore;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 registrationConductor]);
    unsigned __int8 v3 = (IDSUserStore *)objc_claimAutoreleasedReturnValue([v5 userStore]);
  }

  return v3;
}

- (IDSRegistrationController)initWithUserStore:(id)a3
{
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___IDSRegistrationController;
  id v6 = -[IDSRegistrationController init](&v39, "init");
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userStore, a3);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 deviceName]);
    deviceName = v7->_deviceName;
    v7->_deviceName = (NSString *)v9;

    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceInformationString]);
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Registration controller starting up (%@)",  (uint8_t *)&buf,  0xCu);
    }

    memset(&buf, 0, sizeof(buf));
    SCDynamicStoreRef v14 = SCDynamicStoreCreate( kCFAllocatorDefault,  @"com.apple.IDSRegistrationController",  (SCDynamicStoreCallBack)sub_1000603F4,  &buf);
    if (v14)
    {
      v15 = v14;
      CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(kCFAllocatorDefault);
      CFStringRef v40 = ComputerName;
      v17 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v40,  1LL));
      if (ComputerName) {
        CFRelease(ComputerName);
      }
      uint64_t v18 = SCDynamicStoreSetNotificationKeys(v15, v17, 0LL);
      if (!(_DWORD)v18)
      {
        int v20 = SCError();
        SCErrorString(v20);
        uint64_t v18 = _IMWarn(@"%s: Unable to create preferences handle: %s");
      }

      uint64_t v21 = im_primary_queue(v18, v19);
      uint64_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
      SCDynamicStoreSetDispatchQueue(v15, v22);
    }

    else
    {
      _IMWarn(@"Failed to create dynamic store");
    }

    __int16 v23 = objc_alloc_init(&OBJC_CLASS___IDSKeychainWrapper);
    keychainWrapper = v7->_keychainWrapper;
    v7->_keychainWrapper = v23;

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
    [v25 addListener:v7];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
    [v26 addListener:v7];

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
    [v27 addListener:v7];

    if (_IDSRunningInDaemon(v28, v29))
    {
      v31 = (const char *)IMUserScopedNotification("kScreenSharingChangedNotification", v30);
      notify_register_check(v31, &v7->_screenSharingToken);
      v33 = (const char *)IMUserScopedNotification("kiMessageChangedNotification", v32);
      notify_register_check(v33, &v7->_iMessageToken);
      v35 = (const char *)IMUserScopedNotification("kFaceTimeChangedNotification", v34);
      notify_register_check(v35, &v7->_faceTimeToken);
      v37 = (const char *)IMUserScopedNotification("kCallingChangedNotification", v36);
      notify_register_check(v37, &v7->_callingToken);
      -[IDSRegistrationController _updateNotifyState](v7, "_updateNotifyState");
    }
  }

  return v7;
}

- (void)dealloc
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:0 object:0];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
  [v4 removeListener:self];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v5 removeListener:self];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
  [v6 removeListener:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSRegistrationController;
  -[IDSRegistrationController dealloc](&v7, "dealloc");
}

- (BOOL)registrationSupportedForRegistration:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance", a3));
  unsigned int v4 = [v3 isExpired];

  if (v4)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "*** Lockdown state is expired, not allowing registration",  (uint8_t *)&v11,  2u);
    }

    LOBYTE(v7) = 0;
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unsigned int v7 = [v8 registrationSupported];

    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"NO";
      if (v7) {
        uint64_t v9 = @"YES";
      }
      int v11 = 138412290;
      __int16 v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Returning device support registration supported: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  return v7;
}

+ (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if ((_DWORD)v6 != 3 && (_DWORD)v6 != 1)
  {
    if ((_DWORD)v6)
    {
      unsigned __int8 v9 = 1;
      goto LABEL_9;
    }

    if (v5) {
      uint64_t v6 = 2LL;
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  unsigned __int8 v9 = [a1 systemSupportsServiceType:v8 registrationType:v6];
LABEL_9:

  return v9;
}

+ (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4
{
  id v5 = a3;
  if ((a4 - 2) >= 2)
  {
    if (a4 == 1)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      unsigned __int8 v10 = [v9 supportsAppleIDIdentification];

      if ((v10 & 1) == 0)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          unsigned int v7 = "System does not support Apple ID identification";
          id v8 = buf;
          goto LABEL_24;
        }

        goto LABEL_25;
      }
    }

    else
    {
      if (a4)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_1006968E0(a4, v6);
        }
        goto LABEL_25;
      }

      if (!+[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration"))
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v29 = 0;
          unsigned int v7 = "System does not support SMS identification";
          id v8 = (uint8_t *)&v29;
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
          goto LABEL_25;
        }

        goto LABEL_25;
      }
    }
  }

  if (!IDSIsFaceTimeRegistrationServiceType(v5))
  {
    if (IDSIsCallingRegistrationServiceType(v5))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      unsigned __int8 v14 = [v13 callingSupported];

      if ((v14 & 1) == 0)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = 0;
          unsigned int v7 = "System does not support Calling";
          id v8 = (uint8_t *)&v26;
          goto LABEL_24;
        }

        goto LABEL_25;
      }
    }

    else if (IDSIsMultiwayRegistrationServiceType(v5))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      unsigned __int8 v16 = [v15 multiwaySupported];

      if ((v16 & 1) == 0)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v25 = 0;
          unsigned int v7 = "System does not support Multiway";
          id v8 = (uint8_t *)&v25;
          goto LABEL_24;
        }

        goto LABEL_25;
      }
    }

    else if (IDSIsiMessageRegistrationServiceType(v5))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      unsigned __int8 v19 = [v18 iMessageSupported];

      if ((v19 & 1) == 0)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        __int16 v24 = 0;
        unsigned int v7 = "System does not support iMessage";
        id v8 = (uint8_t *)&v24;
        goto LABEL_24;
      }
    }

    else
    {
      if (!IDSIsAlloyRegistrationServiceType(v5))
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_100696954((uint64_t)v5, v6);
        }
        goto LABEL_25;
      }

      int v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      unsigned __int8 v21 = [v20 identityServicesSupported];

      if ((v21 & 1) == 0)
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        __int16 v23 = 0;
        unsigned int v7 = "System does not support IDS";
        id v8 = (uint8_t *)&v23;
        goto LABEL_24;
      }
    }

+ (BOOL)systemSupportsRegistrationInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
  unsigned __int8 v6 = objc_msgSend( a1,  "systemSupportsServiceType:registrationType:",  v5,  objc_msgSend(v4, "registrationType"));
  if ((v6 & 1) == 0)
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "We can't register this: %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  return v6;
}

+ (BOOL)systemSupportsPhoneNumberRegistration
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v3 = [v2 deviceType];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  unsigned __int8 v5 = [v4 isCurrentDeviceTinkerConfiguredWatch];

  if (v3 == (id)6) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if (v3 == (id)2) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  char v9 = [v8 supportsIdentification] & v7;

  return v9;
}

- (BOOL)systemSupportsPhoneNumberRegistration
{
  return objc_msgSend((id)objc_opt_class(self, a2), "systemSupportsPhoneNumberRegistration");
}

- (BOOL)systemSupportsServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  LOBYTE(v5) = objc_msgSend( (id)objc_opt_class(self, v9),  "systemSupportsServiceType:accountType:isTemporary:",  v8,  v6,  v5);

  return v5;
}

- (BOOL)systemSupportsServiceType:(id)a3 registrationType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  LOBYTE(v4) = objc_msgSend( (id)objc_opt_class(self, v7),  "systemSupportsServiceType:registrationType:",  v6,  v4);

  return v4;
}

- (BOOL)systemSupportsRegistrationInfo:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(self, v5), "systemSupportsRegistrationInfo:", v4);

  return (char)self;
}

- (BOOL)registerInfo:(id)a3
{
  return -[IDSRegistrationController registerInfo:requireSilentAuth:](self, "registerInfo:requireSilentAuth:", a3, 0LL);
}

- (BOOL)registerInfo:(id)a3 requireSilentAuth:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v89 = _os_activity_create( (void *)&_mh_execute_header,  "Registration controller register",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v89, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInformationString]);
    *(_DWORD *)SCDynamicStoreContext buf = 138412546;
    unint64_t v92 = (unint64_t)v5;
    __int16 v93 = 2112;
    v94 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Registration request: %@  (Environment: %@)",  buf,  0x16u);
  }

  if (-[IDSRegistrationController registrationSupportedForRegistration:]( self,  "registrationSupportedForRegistration:",  v5))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 pushToken]);
    BOOL v10 = v9 == 0LL;

    if (v10)
    {
      unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCDynamicStoreContext buf = 138412290;
        unint64_t v92 = (unint64_t)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cannot register, invalid push token: %@",  buf,  0xCu);
      }

      uint64_t v18 = 14LL;
      goto LABEL_21;
    }

    if (-[IDSRegistrationController systemSupportsRegistrationInfo:](self, "systemSupportsRegistrationInfo:", v5))
    {
      if (![v5 registrationType]
        && !+[IMUserDefaults bypassRegistrationControlStatusCheck]( &OBJC_CLASS___IMUserDefaults,  "bypassRegistrationControlStatusCheck"))
      {
        int v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDRegistrationControl sharedInstance]( &OBJC_CLASS___IDSDRegistrationControl,  "sharedInstance"));
        unint64_t v12 = (unint64_t)[v11 registrationStateForRegistrationType:0 error:0];

        if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 134217984;
            unint64_t v92 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cannot register, phone number registration or authentication are disabled { controlStatus: %lld }",  buf,  0xCu);
          }

          -[IDSRegistrationController _notifyRegistrationFailure:error:info:]( self,  "_notifyRegistrationFailure:error:info:",  v5,  39LL,  0LL);
          goto LABEL_22;
        }
      }

      __int16 v87 = 0;
      [v5 setRunningSimpleAuthentication:0];
      switch([v5 registrationType])
      {
        case 0u:
          unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            unint64_t v92 = (unint64_t)v5;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Request to register sms identified info: %@",  buf,  0xCu);
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationToken]);
          if (v22) {
            goto LABEL_32;
          }
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v5 migrationContext]);
          BOOL v24 = v23 == 0LL;

          if (!v24)
          {
            __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)SCDynamicStoreContext buf = 138412290;
              unint64_t v92 = (unint64_t)v5;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "We can try to migrate this guy: %@",  buf,  0xCu);
            }

            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v5 migrationContext]);
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"signature"]);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v27 _FTStringFromBaseData]);

            [v5 setAuthenticationToken:v22];
LABEL_32:
          }

          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 mainID]);
          if ([v28 length])
          {
            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationToken]);
            if (v29)
            {

LABEL_69:
              v54 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationToken]);
              BOOL v55 = v54 == 0LL;

LABEL_80:
              v81 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationToken]);
              if ([v5 registrationType] == 1)
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationCert]);
                if (v57)
                {
                  v58 = (void *)objc_claimAutoreleasedReturnValue([v5 regionID]);
                  if ([v58 length])
                  {
                    v59 = (void *)objc_claimAutoreleasedReturnValue([v5 regionBasePhoneNumber]);
                    BOOL v60 = [v59 length] == 0;

                    if (!v60) {
                      goto LABEL_103;
                    }
                  }

                  else
                  {
                  }

                  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                    unint64_t v92 = (unint64_t)v5;
                    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "This registration is missing region information, despite being already authenticated, let's fix that: %@",  buf,  0xCu);
                  }

                  __int128 v85 = 0u;
                  __int128 v86 = 0u;
                  __int128 v83 = 0u;
                  __int128 v84 = 0u;
                  v62 = self->_trackedRegistrations;
                  id v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v83,  v90,  16LL);
                  if (v63)
                  {
                    uint64_t v64 = *(void *)v84;
                    do
                    {
                      for (i = 0LL; i != v63; i = (char *)i + 1)
                      {
                        if (*(void *)v84 != v64) {
                          objc_enumerationMutation(v62);
                        }
                        id v66 = *(id *)(*((void *)&v83 + 1) + 8LL * (void)i);
                        if (v66 != v5
                          && [*(id *)(*((void *)&v83 + 1) + 8 * (void)i) registrationType] == 1)
                        {
                          v67 = (void *)objc_claimAutoreleasedReturnValue([v66 regionID]);
                          if (v67)
                          {
                            v68 = (void *)objc_claimAutoreleasedReturnValue([v66 regionBasePhoneNumber]);
                            BOOL v69 = v68 == 0LL;

                            if (!v69)
                            {
                              v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                                unint64_t v92 = (unint64_t)v66;
                                _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "  => We found a good one we can pull from, let's fix ourselves using that: %@",  buf,  0xCu);
                              }

                              v71 = (void *)objc_claimAutoreleasedReturnValue([v66 regionID]);
                              [v5 setRegionID:v71];

                              v72 = (void *)objc_claimAutoreleasedReturnValue([v66 regionBasePhoneNumber]);
                              [v5 setRegionBasePhoneNumber:v72];

                              [v5 saveToKeychain];
                            }
                          }
                        }
                      }

                      id v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v83,  v90,  16LL);
                    }

                    while (v63);
                  }
                }
              }

- (BOOL)unregisterInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = IMGetEnvironmentName();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    unsigned __int8 v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Request to unregister: %@  (Environment: %@)",  (uint8_t *)&v11,  0x16u);
  }

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing registration info from keychain",  (uint8_t *)&v11,  2u);
  }

  [v4 removeFromKeychain];
  [v4 setRegistrationStatus:0];
  [v4 setRunningSimpleAuthentication:0];
  [v4 setRegistrationCert:0];
  -[IDSRegistrationController stopTrackingActiveRegistration:](self, "stopTrackingActiveRegistration:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v9 sendDeregistration:v4];

  -[IDSRegistrationController _notifyDeregistrationStarting:](self, "_notifyDeregistrationStarting:", v4);
  return 1;
}

- (void)cancelActionsForRegistrationInfo:(id)a3
{
  id v6 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v3 cancelActionsForRegistrationInfo:v6];

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
  [v4 cancelActionsForRegistrationInfo:v6];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
  [v5 cancelActionsForRegistrationInfo:v6];

  [v6 setRunningSimpleAuthentication:0];
}

- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4 registration:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v10 reportSpamWithMessages:v9 selfURI:v8 registration:v7];
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8 registration:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v20 reportiMessageUnknownSender:v19 messageID:v18 isBlackholed:v12 isJunked:v11 messageServerTimestamp:v17 selfURI:v16 registration:v15];
}

- (void)reportMessage:(id)a3 toURI:(id)a4 registration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));
  uint64_t v11 = kIDSGeneralReportingTypeKey;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kIDSGeneralReportingTypeKey]);

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0) {
    goto LABEL_4;
  }
  id v15 = [v12 unsignedIntegerValue];
  [v10 removeObjectForKey:v11];
  if (v15 == (id)1)
  {
    uint64_t v17 = kIDSGeneralSpamReportRecipientURIKey;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kIDSGeneralSpamReportRecipientURIKey]);

    if (v18) {
      [v10 removeObjectForKey:v17];
    }
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
    [v16 reportUnknownSenderMessage:v10 selfURI:v7 registration:v8];
    goto LABEL_5;
  }

  if (!v15)
  {
LABEL_4:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
    [v16 reportSpamMessage:v10 selfURI:v7 registration:v8];
LABEL_5:

    goto LABEL_6;
  }

  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    id v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Invalid reporting type provided, we shouldn't be here... { reportingType: %lu }",  (uint8_t *)&v20,  0xCu);
  }

LABEL_6:
}

- (void)reportClientEvent:(id)a3 registration:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v10 reportClientEvent:v9 registration:v8 completion:v7];
}

- (BOOL)_performCorrectServerRequestForDeviceIDRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 authenticationCert]);
  if (v5
    && (id v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uris]),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending IDS registration for registration with existing auth cert: %@",  (uint8_t *)&v15,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
    [v10 sendRegistration:v4];

    BOOL v11 = 1;
  }

  else
  {
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uris]);
      int v15 = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Sending IDS authentication for registration without cert or handles: %@ registration: %@",  (uint8_t *)&v15,  0x16u);
    }

    BOOL v11 = -[IDSRegistrationController _sendIDSAuthenticationForRegistration:]( self,  "_sendIDSAuthenticationForRegistration:",  v4);
  }

  return v11;
}

- (BOOL)_performCorrectServerRequestForTemporaryPhoneRegistration:(id)a3 sentAuthentication:(BOOL *)a4 sentIDSAction:(BOOL *)a5
{
  id v8 = a3;
  if (CUTIsInternalInstall() && _os_feature_enabled_impl("IDS", "HomeNumberBypassServer"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registrationConductor]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userStore]);

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 userUniqueIdentifier]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 userWithUniqueIdentifier:v12]);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 credentialForUser:v13]);
    int v15 = v14;
    if (v14 && [v14 realm] == (id)2)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 phoneAuthenticationCertificate]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dataRepresentation]);
      [v8 setAuthenticationCert:v17];

      int64_t v18 = +[IMUserDefaults homeNumberSecondsUntilExpiration]( &OBJC_CLASS___IMUserDefaults,  "homeNumberSecondsUntilExpiration");
      uint64_t v19 = 3888000LL;
      if (v18) {
        uint64_t v19 = v18;
      }
      int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v19));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 temporaryPhoneUserWithUpdatedExpirationDate:v20]);
      [v11 updateUser:v21];
    }

    int v22 = 1;
  }

  else
  {
    int v22 = 0;
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticationCert]);

  if (v23)
  {
    int v24 = 1;
    unsigned int v25 = 1;
  }

  else
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v8 authenticationToken]);
    if (v26
      && (__int16 v27 = (void *)v26,
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 profileID]),
          id v29 = [v28 length],
          v28,
          v27,
          v29))
    {
      int v24 = 0;
      unsigned int v25 = [v8 needsRenewal] ^ 1;
    }

    else
    {
      unsigned int v25 = 0;
      int v24 = 1;
    }
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v8 email]);
  id v31 = [v30 length];

  if (((v22 | v25) & 1) != 0 || !v31)
  {
    if (v23) {
      int v35 = 1;
    }
    else {
      int v35 = v22;
    }
    if (((v35 | v24) & 1) != 0)
    {
      if (v23)
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
        [v36 sendRegistration:v8];

        BOOL v34 = 1;
        if (a5) {
          *a5 = 1;
        }
      }

      else
      {
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100696A18((uint64_t)v8, v38);
        }

        BOOL v34 = 0;
      }
    }

    else
    {
      BOOL v37 = -[IDSRegistrationController _sendIDSAuthenticationForRegistration:]( self,  "_sendIDSAuthenticationForRegistration:",  v8);
      if (a5) {
        *a5 = v37;
      }
      BOOL v34 = 1;
    }
  }

  else
  {
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 138412290;
      id v41 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Sending authentication for registration for new auth token and auth cert: %@",  (uint8_t *)&v40,  0xCu);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
    BOOL v34 = 1;
    [v33 authenticateRegistration:v8 forceNewToken:1 requireSilentAuth:1];

    [v8 setNeedsRenewal:0];
    [v8 saveToKeychain];
    if (a4) {
      *a4 = 1;
    }
  }

  return v34;
}

- (void)_notifyNeedsNewRegistration
{
  id v3 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "registrationControllerNeedsNewRegistration:") & 1) != 0) {
          [v8 registrationControllerNeedsNewRegistration:self];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)_notifyRegistrationUpdated:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Ignoring registration updated, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = (os_log_s *)v6;
    id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v10, "registrationController:registrationUpdated:") & 1) != 0) {
            [v10 registrationController:self registrationUpdated:v4];
          }
        }

        id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_notifyRegistrationStarting:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Ignoring registration starting, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = (os_log_s *)v6;
    id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v10, "registrationController:registrationWillStart:") & 1) != 0) {
            [v10 registrationController:self registrationWillStart:v4];
          }
        }

        id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_notifyRegistrationFailure:(id)a3 error:(int64_t)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int16 v23 = _os_activity_create( (void *)&_mh_execute_header,  "Registration controller notify registration failure",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v23, &state);
  if ([v8 isDisabled])
  {
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ignoring registration failure, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    [v8 setRegistrationStatus:-1];
    if ([v8 registrationType] == 1)
    {
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)SCDynamicStoreContext buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removing registration info from keychain",  buf,  2u);
      }

      [v8 removeFromKeychain];
    }

    id v12 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v17, "registrationController:registrationFailed:error:info:") & 1) != 0) {
            [v17 registrationController:self registrationFailed:v8 error:a4 info:v9];
          }
        }

        id v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v14);
    }

    -[IDSRegistrationController _submitRegistrationCompletedMetricWithRegistration:success:registrationError:]( self,  "_submitRegistrationCompletedMetricWithRegistration:success:registrationError:",  v8,  0LL,  a4);
    -[IDSRegistrationController _captureDiagnosticsForFailedRegistration:registrationError:]( self,  "_captureDiagnosticsForFailedRegistration:registrationError:",  v8,  a4);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v23);
}

- (void)_notifyRegistrationSuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int128 v18 = _os_activity_create( (void *)&_mh_execute_header,  "Registration controller notify registration success",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  if ([v4 isDisabled])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Ignoring registration success, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          __int128 v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "registrationController:registrationSucceeded:") & 1) != 0) {
            [v11 registrationController:self registrationSucceeded:v4];
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }

      while (v8);
    }

    if (![v4 registrationType])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
      [v12 notePhoneNumberRegistrationReset];
    }

    -[IDSRegistrationController _submitRegistrationCompletedMetricWithRegistration:success:registrationError:]( self,  "_submitRegistrationCompletedMetricWithRegistration:success:registrationError:",  v4,  1LL,  -1LL);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v18);
}

- (void)_notifyAllRegistrationSuccess:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ([v10 isDisabled])
        {
          __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCDynamicStoreContext buf = 138412290;
            uint64_t v28 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded registration, registration is disabled: %@",  buf,  0xCu);
          }

          [v5 removeObject:v10];
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
        if ((objc_opt_respondsToSelector(v17, "registrationController:allRegistrationsSucceeded:") & 1) != 0) {
          [v17 registrationController:self allRegistrationsSucceeded:v5];
        }
      }

      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v14);
  }
}

- (void)_notifyDeregistrationStarting:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "registrationController:deregistrationWillStart:") & 1) != 0) {
          [v10 registrationController:self deregistrationWillStart:v4];
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_submitRegistrationCompletedMetricWithRegistration:(id)a3 success:(BOOL)a4 registrationError:(int64_t)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  if (-[IDSRegistrationController _shouldSubmitRegistrationCompletedMetricForRegistration:]( self,  "_shouldSubmitRegistrationCompletedMetricForRegistration:"))
  {
    id v8 = objc_alloc(&OBJC_CLASS___IDSRegistrationCompletedMetric);
    id v9 = [v15 registrationType];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceIdentifier]);
    id v11 = [v8 initWithRegistrationType:v9 serviceIdentifier:v10 wasSuccessful:v6 registrationError:a5];

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogger logger](&OBJC_CLASS___IDSAWDLogger, "logger"));
    [v12 logMetric:v11];

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRTCLogger loggerWithCategory:](&OBJC_CLASS___IDSRTCLogger, "loggerWithCategory:", 4000LL));
    [v13 logMetric:v11];

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v14 logMetric:v11];
  }
}

- (BOOL)_shouldSubmitRegistrationCompletedMetricForRegistration:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 serviceIdentifier]);
  unsigned __int8 v4 = [&off_100948760 containsObject:v3];

  return v4;
}

- (void)_captureDiagnosticsForFailedRegistration:(id)a3 registrationError:(int64_t)a4
{
  id v5 = a3;
  if (+[IDSAutoBugCapture isSupported](&OBJC_CLASS___IDSAutoBugCapture, "isSupported"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 serviceIdentifier]);
    if (![v6 isEqualToString:@"com.apple.madrid"]
      || [v5 registrationType] != 1)
    {
      goto LABEL_6;
    }

    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0x2A)
    {
      id v7 = sub_10012EB10(a4);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceIdentifier]);
      __int128 v10 = _StringForIDSRegistrationType([v5 registrationType]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@, %@, %@)",  v8,  v9,  v11));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100063E1C;
      v13[3] = &unk_1008F8320;
      id v14 = v12;
      id v6 = v12;
      +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  200LL,  v6,  v13);

LABEL_6:
    }
  }
}

- (void)center:(id)a3 succeededRegistration:(id)a4
{
  id v5 = a4;
  if (_IMWillLog(@"Registration", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Succeeded HTTP registration with info: %@",  v5));
    __int128 v21 = "-[IDSRegistrationController center:succeededRegistration:]";
    __int128 v22 = v7;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (!objc_msgSend(v5, "isDisabled", v21, v22))
  {
    if ([v5 registrationType] == 1)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 vettedEmails]);
      if (!v9) {
        goto LABEL_11;
      }
      __int128 v10 = (void *)v9;
      if (([v5 shouldRegisterUsingDSHandle] & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dsHandle]);
      id v12 = [v11 length];

      if (!v12)
      {
LABEL_11:
        __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "** Empty vetted emails, we should make sure to query them",  buf,  2u);
        }

        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
        [v10 queryValidatedEmailsForRegistration:v5 allowPasswordPrompt:0 completionBlock:0];
        goto LABEL_24;
      }
    }

    else if ([v5 registrationType] == 2)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 userUniqueIdentifier]);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v14 userWithUniqueIdentifier:v15]);

      if (([v10 finishedRegistration] & 1) == 0)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController _phoneUserWithCredentials](self, "_phoneUserWithCredentials"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 temporaryPhoneUserWithFinishedRegistration]);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
        [v18 updateUser:v17];

        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
        [v19 persistUsersImmediately];

        unsigned __int8 v20 = -[IDSRegistrationController displayingAddNumberPrompt](self, "displayingAddNumberPrompt");
        if (v16)
        {
        }

        else if ((v20 & 1) == 0 && ([v10 hasNotifiedSuccess] & 1) == 0)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_100064244;
          v23[3] = &unk_1008F5F80;
          v23[4] = self;
          id v24 = v5;
          im_dispatch_after_primary_queue(v23, 60.0);
        }
      }

      goto LABEL_24;
    }

- (void)center:(id)a3 failedRegistration:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 1024;
    int v15 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed HTTP registration with info: %@       error: %d",  (uint8_t *)&v12,  0x12u);
  }

  -[IDSRegistrationController _notifyRegistrationFailure:error:info:]( self,  "_notifyRegistrationFailure:error:info:",  v9,  a5,  v10);
}

- (void)center:(id)a3 allSucceededRegistrations:(id)a4
{
  id v9 = a4;
  if (_IMWillLog(@"Registration", v5))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"All succeeded HTTP registrations: %@",  v9));
    id v7 = "-[IDSRegistrationController center:allSucceededRegistrations:]";
    id v8 = v6;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  -[IDSRegistrationController _notifyAllRegistrationSuccess:](self, "_notifyAllRegistrationSuccess:", v9, v7, v8);
}

- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  if (_IMWillLog(@"Registration", v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Succeeded SMS identification with info: %@",  v8));
    int v15 = "-[IDSRegistrationController center:succeededIdentification:phoneNumber:token:]";
    __int128 v16 = v11;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v8, "isDisabled", v15, v16))
  {
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Ignoring need for new identification, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    sub_100061C40(v8);
    if (![v8 registrationType])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController _provisionedTemporaryUser](self, "_provisionedTemporaryUser"));
      if ([v9 length]
        && v13
        && !-[IDSRegistrationController displayingAddNumberPrompt](self, "displayingAddNumberPrompt"))
      {
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 userUniqueIdentifier]);
        -[IDSRegistrationController _alertForHomeNumberIfNeededForSIMIdentifier:withPhoneNumber:]( self,  "_alertForHomeNumberIfNeededForSIMIdentifier:withPhoneNumber:",  v14,  v9);
      }
    }
  }
}

- (void)center:(id)a3 failedIdentification:(id)a4 error:(int64_t)a5
{
  id v7 = a4;
  if (_IMWillLog(@"Registration", v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed SMS identification with info: %@ error: %d",  v7,  a5));
    id v11 = "-[IDSRegistrationController center:failedIdentification:error:]";
    int v12 = v9;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v7, "isDisabled", v11, v12))
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ignoring failed identification, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    -[IDSRegistrationController _notifyRegistrationFailure:error:info:]( self,  "_notifyRegistrationFailure:error:info:",  v7,  a5,  0LL);
  }
}

- (void)centerNeedsNewIdentification:(id)a3
{
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SMS agent requested new identification", v5, 2u);
  }

  -[IDSRegistrationController _notifyNeedsNewRegistration](self, "_notifyNeedsNewRegistration");
}

- (void)center:(id)a3 succeededIDSAuthentication:(id)a4
{
  id v5 = a4;
  if (_IMWillLog(@"Registration", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Succeeded IDS Authentication with info: %@",  v5));
    id v13 = "-[IDSRegistrationController center:succeededIDSAuthentication:]";
    id v14 = v7;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v5, "isDisabled", v13, v14))
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded IDS Authentication, registration is disabled: %@",  buf,  0xCu);
    }

    goto LABEL_9;
  }

  -[IDSRegistrationController _ensureProfileQueriesAreReadyForRegistratration:]( self,  "_ensureProfileQueriesAreReadyForRegistratration:",  v5);
  -[IDSRegistrationController _sendIDSAuthenticationOrRegistrationIfNeeded:]( self,  "_sendIDSAuthenticationOrRegistrationIfNeeded:",  v5);
  if (![v5 registrationType] || objc_msgSend(v5, "registrationType") == 3)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
    -[os_log_s sendRegistration:](v8, "sendRegistration:", v5);
LABEL_9:

    goto LABEL_10;
  }

  if ([v5 registrationType] == 2)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController _phoneUserWithCredentials](self, "_phoneUserWithCredentials"));
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 phoneNumber]);
      -[IDSRegistrationController _alertForHomeNumberIfNeededForSIMIdentifier:withPhoneNumber:]( self,  "_alertForHomeNumberIfNeededForSIMIdentifier:withPhoneNumber:",  v11,  v12);
    }
  }

- (void)center:(id)a3 failedIDSAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)SCDynamicStoreContext buf = 138412802;
    *(void *)v57 = v9;
    *(_WORD *)&v57[8] = 1024;
    *(_DWORD *)&v57[10] = a5;
    __int16 v58 = 2112;
    id v59 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed IDS Authentication with info: %@ error: %d info: %@",  buf,  0x1Cu);
  }

  if ([v9 isDisabled])
  {
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      *(void *)v57 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Ignoring failed IDS Authentication, registration is disabled: %@",  buf,  0xCu);
    }

    goto LABEL_70;
  }

  unsigned int v13 = [v9 registrationType];
  if ((unint64_t)(a5 - 10) < 2)
  {
    if ([v9 registrationType])
    {
      if ([v9 registrationType] == 1)
      {
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = [v9 retries];
          *(_DWORD *)SCDynamicStoreContext buf = 67109120;
          *(_DWORD *)v57 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed, retry %d", buf, 8u);
        }

        if ((int)[v9 retries] <= 2)
        {
          objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
          unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 confirmedEmails]);
          [v9 setUris:0];
          unsigned int v21 = [v9 registrationType];
          if (a5 == 10 && v21 == 1)
          {
            int64_t v48 = 10LL;
            BOOL v49 = self;
            id v50 = v10;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            v47 = v20;
            id v22 = v20;
            id v23 = [v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v52;
              do
              {
                for (i = 0LL; i != v24; i = (char *)i + 1)
                {
                  if (*(void *)v52 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
                  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v47, v48, v49, v50));
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)SCDynamicStoreContext buf = 138412290;
                    *(void *)v57 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  " => Added confirmed emails: %@",  buf,  0xCu);
                  }

                  [v9 addCandidateEmail:v27];
                }

                id v24 = [v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
              }

              while (v24);
            }

            self = v49;
            id v10 = v50;
            unsigned __int8 v20 = v47;
            a5 = v48;
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authenticationToken", v47, v48, v49, v50));

          if (v29)
          {
            if ((uint64_t)[v9 registrationStatus] < 6)
            {
              char v30 = 0;
            }

            else
            {
              sub_100061C40(v9);
              char v30 = 1;
            }
          }

          else
          {
            [v9 setRegistrationStatus:3];
            BOOL v46 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
            char v30 = 1;
            [v46 authenticateRegistration:v9 forceNewToken:1];
          }

          goto LABEL_65;
        }

        goto LABEL_63;
      }

      if (v13 != 3) {
        goto LABEL_64;
      }
      if ((int)[v9 retries] > 2)
      {
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SCDynamicStoreContext buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Too many retries, failing", buf, 2u);
        }

LABEL_63:
        [v9 setRetries:0];
        goto LABEL_64;
      }

      objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
      BOOL v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v35 = [v9 retries];
        *(_DWORD *)SCDynamicStoreContext buf = 67109120;
        *(_DWORD *)v57 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Let's re-auth, retry %d", buf, 8u);
      }

      [v9 setRegistrationStatus:3];
      -[IDSRegistrationController registerInfo:](self, "registerInfo:", v9);
    }

    else
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v9 userUniqueIdentifier]);
      [v31 setPNRReason:6 forUserUniqueIdentifier:v32];

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
      [v33 sendRegistration:v9];
    }

    char v30 = 1;
    goto LABEL_65;
  }

  if (a5 == 37)
  {
LABEL_64:
    char v30 = 0;
LABEL_65:
    if ([v9 registrationType] == 2)
    {
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v45 = [v9 retries];
        *(_DWORD *)SCDynamicStoreContext buf = 67109378;
        *(_DWORD *)v57 = v45;
        *(_WORD *)&v57[4] = 2112;
        *(void *)&v57[6] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Home Number provision request had expired auth token, renewing {  retries: %d, registration: %@ }",  buf,  0x12u);
      }

      if ((int)[v9 retries] <= 2)
      {
        objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
        [v9 setRegistrationStatus:3];
        int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
        -[os_log_s authenticateRegistration:forceRenewal:requireSilentAuth:]( v12,  "authenticateRegistration:forceRenewal:requireSilentAuth:",  v9,  1LL,  1LL);
LABEL_70:

        goto LABEL_73;
      }
    }

    if ((v30 & 1) != 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }

  if (a5 != 18) {
    goto LABEL_72;
  }
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SCDynamicStoreContext buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "IDS Authentication failed - Login failed",  buf,  2u);
  }

  if (![v9 registrationType])
  {
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "  This was an SMS reg", buf, 2u);
    }

    BOOL v37 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v9 userUniqueIdentifier]);
    [v37 setPNRReason:6 forUserUniqueIdentifier:v38];

    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
    -[os_log_s sendRegistration:](v12, "sendRegistration:", v9);
    goto LABEL_70;
  }

  if ([v9 registrationType] == 1)
  {
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "This was an apple ID reg", buf, 2u);
    }

    if ((int)[v9 retries] <= 2)
    {
      [v9 setAuthenticationToken:0];
      objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = [v9 retries];
        *(_DWORD *)SCDynamicStoreContext buf = 67109120;
        *(_DWORD *)v57 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Let's re-auth, retry %d", buf, 8u);
      }

      [v9 setRegistrationStatus:3];
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
      -[os_log_s authenticateRegistration:forceNewToken:](v12, "authenticateRegistration:forceNewToken:", v9, 1LL);
      goto LABEL_70;
    }

    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_80;
    }
    *(_WORD *)SCDynamicStoreContext buf = 0;
    goto LABEL_79;
  }

  if (v13 != 3)
  {
LABEL_72:
    -[IDSRegistrationController _notifyRegistrationFailure:error:info:]( self,  "_notifyRegistrationFailure:error:info:",  v9,  a5,  0LL);
    goto LABEL_73;
  }

  BOOL v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SCDynamicStoreContext buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "This was a device ID reg", buf, 2u);
  }

  if ((int)[v9 retries] > 2)
  {
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
LABEL_80:

      [v9 setRetries:0];
      goto LABEL_72;
    }

    *(_WORD *)SCDynamicStoreContext buf = 0;
LABEL_79:
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Too many retries, failing", buf, 2u);
    goto LABEL_80;
  }

  objc_msgSend(v9, "setRetries:", objc_msgSend(v9, "retries") + 1);
  int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v41 = [v9 retries];
    *(_DWORD *)SCDynamicStoreContext buf = 67109120;
    *(_DWORD *)v57 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Let's re-auth, retry %d", buf, 8u);
  }

  [v9 setRegistrationStatus:3];
  -[IDSRegistrationController registerInfo:](self, "registerInfo:", v9);
LABEL_73:
}

- (BOOL)_sendIDSAuthenticationOrRegistrationIfNeeded:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 registrationType];
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 vettedEmails]);

    if (!v6)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCDynamicStoreContext buf = 138412290;
        id v26 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "We still have no vetted email response for: %@   waiting....",  buf,  0xCu);
      }
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 regionID]);

    if (!v8)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        goto LABEL_27;
      }

      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v26 = v4;
      id v14 = "We still have no default profile response for: %@   waiting....";
      int v15 = (os_log_s *)v13;
      uint32_t v16 = 12;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      goto LABEL_26;
    }

    if (!v6)
    {
LABEL_27:
      unsigned __int8 v10 = 0;
      goto LABEL_28;
    }
  }

  if ((uint64_t)[v4 registrationStatus] <= 5)
  {
    [v4 setRegistrationStatus:6];
    unsigned int v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    unsigned int v21 = sub_100065620;
    id v22 = &unk_1008F5F80;
    id v23 = v4;
    id v24 = self;
    im_dispatch_after_primary_queue(&v19, 1.0);
  }

  if (v5 || ([v4 runningSimpleAuthentication] & 1) == 0)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v19, v20, v21, v22));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We already have a region ID, skipping query",  buf,  2u);
    }

    int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
    if (v12)
    {

LABEL_22:
      unsigned __int8 v10 = sub_100061C40(v4);
      goto LABEL_28;
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationCert]);

    if (v17) {
      goto LABEL_22;
    }
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)SCDynamicStoreContext buf = 0;
    id v14 = "We were told that we're done authentication here, but we have no token... not doing anything";
    int v15 = (os_log_s *)v13;
    uint32_t v16 = 2;
    goto LABEL_25;
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SCDynamicStoreContext buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "This was just a simple auth, we're done here",  buf,  2u);
  }

  unsigned __int8 v10 = 1;
LABEL_28:

  return v10;
}

- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (_IMWillLog(@"Registration", v9))
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Succeeded Validated Email Query info: %@    Emails: %@",  v7,  v8));
    int v15 = "-[IDSRegistrationController center:succeededCurrentEmailsRequest:emailInfo:]";
    uint32_t v16 = v10;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v7, "isDisabled", v15, v16))
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded current emails request, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 vettedEmails]);

    if (!v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
      [v7 setVettedEmails:v13];
    }

    if ((uint64_t)[v7 registrationStatus] < 8
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticationCert]),
          v14,
          !v14))
    {
      -[IDSRegistrationController _sendIDSAuthenticationOrRegistrationIfNeeded:]( self,  "_sendIDSAuthenticationOrRegistrationIfNeeded:",  v7);
    }
  }
}

- (void)center:(id)a3 failedCurrentEmailsRequest:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v10 = a4;
  id v7 = a6;
  if (_IMWillLog(@"Registration", v8))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed Validated Email Query info: %@  Info: %@",  v10,  v7));
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }
}

- (void)_ensureProfileQueriesAreReadyForRegistratration:(id)a3
{
  id v4 = a3;
  if ([v4 registrationType] == 1)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 vettedEmails]);

    if (!v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationCert]);

      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          LOWORD(v15) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  " * Empty vetted emails, sending off handles gathering",  (uint8_t *)&v15,  2u);
        }

        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
        [v9 queryValidatedEmailsForRegistration:v4 allowPasswordPrompt:1 completionBlock:0];
      }

      else
      {
        if (v8)
        {
          LOWORD(v15) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  " **** missing auth cert, can't send vetted email request",  (uint8_t *)&v15,  2u);
        }

        -[IDSRegistrationController _sendIDSAuthenticationForRegistration:]( self,  "_sendIDSAuthenticationForRegistration:",  v4);
      }
    }
  }

  if ([v4 registrationType] == 1
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 regionID]),
        id v11 = [v10 length],
        v10,
        !v11))
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Empty region ID, querying initial region",  (uint8_t *)&v15,  2u);
    }

    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
    [v12 queryInitialInvitationContextForRegistration:v4];
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 regionID]);
      int v15 = 138412290;
      uint32_t v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Non empty region ID: %@",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (BOOL)_sendIDSAuthenticationForRegistration:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ((uint64_t)[v3 registrationStatus] >= 6)
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
      [v5 buildValidationCredentialsIfNeeded];
    }

    if ([v4 registrationType] == 2
      && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationCert]), v6, v6))
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        int v12 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not reprovisioning temporary phone because we already have an auth cert for %@",  (uint8_t *)&v11,  0xCu);
      }

      unsigned __int8 v8 = 0;
    }

    else
    {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        int v12 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Registration Controller - sending IDS authentication: %@",  (uint8_t *)&v11,  0xCu);
      }

      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
      unsigned __int8 v8 = -[os_log_s authenticateRegistration:](v7, "authenticateRegistration:", v4);
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)center:(id)a3 succeededInitialRegionQuery:(id)a4
{
  id v5 = a4;
  if (_IMWillLog(@"Registration", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Succeeded Initial Region Query info: %@",  v5));
    id v10 = "-[IDSRegistrationController center:succeededInitialRegionQuery:]";
    int v11 = v7;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v5, "isDisabled", v10, v11))
  {
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded initial region query, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 regionID]);

    if (!v9) {
      [v5 setRegionID:&stru_100912B50];
    }
    if ((uint64_t)[v5 registrationStatus] <= 7) {
      -[IDSRegistrationController _sendIDSAuthenticationOrRegistrationIfNeeded:]( self,  "_sendIDSAuthenticationOrRegistrationIfNeeded:",  v5);
    }
  }
}

- (void)center:(id)a3 succeededAuthentication:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Registration Controller - succeeded authentication: %@",  (uint8_t *)&v8,  0xCu);
  }

  if ([v5 isDisabled])
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded authentication, registration is disabled: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    -[IDSRegistrationController _sendIDSAuthenticationForRegistration:]( self,  "_sendIDSAuthenticationForRegistration:",  v5);
  }
}

- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint32_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = @"NO";
    int v19 = 138413314;
    id v20 = v12;
    __int16 v21 = 2112;
    if (v8) {
      unsigned int v17 = @"YES";
    }
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Registration Controller - succeeded region validation - registration info: %@   regionID: %@  phoneNumber: %@  ext raContext: %@  verified: %@",  (uint8_t *)&v19,  0x34u);
  }

  if ([v12 isDisabled])
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded region validation, registration is disabled: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (_IMWillLog(@"Registration", v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"registration info: %@   error: %d  info: %@",  v9,  a5,  v10));
    id v18 = "-[IDSRegistrationController center:failedAuthentication:error:info:]";
    int v19 = v12;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v9, "isDisabled", v18, v19))
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v21 = v9;
      id v14 = "Ignoring failed authentication, registration is disabled: %@";
      id v15 = v13;
      uint32_t v16 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  if (+[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration"))
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      id v14 = "System not setup, ignoring auth failure and not proceeding";
      id v15 = v13;
      uint32_t v16 = 2;
      goto LABEL_9;
    }

- (void)center:(id)a3 succeededLinkHandlesConfirmation:(id)a4 emailAddress:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (_IMWillLog(@"Registration", v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"succeeded email confirmation: %@",  v7));
    uint64_t v11 = "-[IDSRegistrationController center:succeededLinkHandlesConfirmation:emailAddress:]";
    id v12 = v9;
    _IMAlwaysLog(0LL, @"Registration", @"%s (%@)");
  }

  if (objc_msgSend(v6, "isDisabled", v11, v12))
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCDynamicStoreContext buf = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ignoring succeeded link handles confirmation, registration is disabled: %@",  buf,  0xCu);
    }
  }

  else
  {
    sub_100061C40(v6);
  }
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray nonRetainingArray](&OBJC_CLASS___NSMutableArray, "nonRetainingArray"));
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }

    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }
}

- (void)removeListener:(id)a3
{
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {
    handlers = self->_handlers;
    self->_handlers = 0LL;
  }

- (void)_updateNotifyState
{
  if (_IDSRunningInDaemon(self, a2))
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    BOOL v37 = self;
    obj = self->_trackedRegistrations;
    id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v53,  16LL);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v42;
      uint64_t v38 = kIDSServiceDefaultsSentinelAlias;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceType", v37));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uris]);
          uint64_t v40 = v7;
          uint64_t v14 = v8;
          uint64_t v15 = v6;
          id v16 = v4;
          uint64_t v17 = v5;
          uint64_t v18 = v9;
          id v19 = [v13 count];

          BOOL v20 = v19 == (id)1;
          uint64_t v9 = v18;
          uint64_t v5 = v17;
          id v4 = v16;
          uint64_t v6 = v15;
          uint64_t v8 = v14;
          uint64_t v7 = v40;
          if (!v20
            || (id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 uris]),
                id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndex:0]),
                v21,
                id v23 = [v22 caseInsensitiveCompare:v38],
                v22,
                v23))
          {
LABEL_11:
            uint64_t v6 = IDSIsFaceTimeRegistrationServiceType(v12) | v6;
            uint64_t v7 = IDSIsiMessageRegistrationServiceType(v12) | v7;
            uint64_t v5 = IDSIsCallingRegistrationServiceType(v12) | v5;
            uint64_t v8 = IDSIsScreenSharingRegistrationServiceType(v12) | v8;
          }
        }

        id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v53,  16LL);
      }

      while (v4);
    }

    else
    {
      LOBYTE(v5) = 0;
      LOBYTE(v6) = 0;
      LOBYTE(v7) = 0;
      LOBYTE(v8) = 0;
    }

    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = @"NO";
      if ((v5 & 1) != 0) {
        id v26 = @"YES";
      }
      else {
        id v26 = @"NO";
      }
      if ((v6 & 1) != 0) {
        __int16 v27 = @"YES";
      }
      else {
        __int16 v27 = @"NO";
      }
      *(_DWORD *)SCDynamicStoreContext buf = 138413058;
      BOOL v46 = v26;
      if ((v7 & 1) != 0) {
        uint64_t v28 = @"YES";
      }
      else {
        uint64_t v28 = @"NO";
      }
      __int16 v47 = 2112;
      int64_t v48 = v27;
      __int16 v49 = 2112;
      id v50 = v28;
      if ((v8 & 1) != 0) {
        __int16 v25 = @"YES";
      }
      __int16 v51 = 2112;
      __int128 v52 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Calculated states for _updateNotifyState {foundCalling: %@, foundFaceTime: %@, foundiMessage:%@, foundScreenSharing: %@}",  buf,  0x2Au);
    }

    notify_set_state(v37->_iMessageToken, v7 & 1);
    char v30 = (const char *)IMUserScopedNotification("kiMessageChangedNotification", v29);
    notify_post(v30);
    notify_set_state(v37->_screenSharingToken, v8 & 1);
    uint64_t v32 = (const char *)IMUserScopedNotification("kScreenSharingChangedNotification", v31);
    notify_post(v32);
    notify_set_state(v37->_faceTimeToken, v6 & 1);
    BOOL v34 = (const char *)IMUserScopedNotification("kFaceTimeChangedNotification", v33);
    notify_post(v34);
    notify_set_state(v37->_callingToken, v5 & 1);
    uint64_t v36 = (const char *)IMUserScopedNotification("kCallingChangedNotification", v35);
    notify_post(v36);
  }

- (void)startTrackingRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Adding registration to list of tracked registrations: %@",  (uint8_t *)&v11,  0xCu);
  }

  if (v4)
  {
    if (-[NSMutableArray containsObject:](self->_trackedRegistrations, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_trackedRegistrations, "removeObject:", v4);
    }

    else
    {
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "  => Adding registration: %@",  (uint8_t *)&v11,  0xCu);
      }

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
      [v7 updateHeartbeat];
    }

    trackedRegistrations = self->_trackedRegistrations;
    if (!trackedRegistrations)
    {
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v10 = self->_trackedRegistrations;
      self->_trackedRegistrations = v9;

      trackedRegistrations = self->_trackedRegistrations;
    }

    -[NSMutableArray addObject:](trackedRegistrations, "addObject:", v4);
    -[IDSRegistrationController _updateNotifyState](self, "_updateNotifyState");
  }
}

- (void)stopTrackingRegistration:(id)a3
{
  id v4 = a3;
  if (v4 && -[NSMutableArray containsObject:](self->_trackedRegistrations, "containsObject:", v4))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing registration from list of tracked registrations: %@",  (uint8_t *)&v8,  0xCu);
    }

    -[NSMutableArray removeObject:](self->_trackedRegistrations, "removeObject:", v4);
    if (!-[NSMutableArray count](self->_trackedRegistrations, "count"))
    {
      trackedRegistrations = self->_trackedRegistrations;
      self->_trackedRegistrations = 0LL;
    }

    -[IDSRegistrationController _updateNotifyState](self, "_updateNotifyState");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
    [v7 updateHeartbeat];
  }
}

- (void)startTrackingActiveRegistration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Adding registration to list of active registrations: %@",  (uint8_t *)&v10,  0xCu);
  }

  if (v4)
  {
    if (-[NSMutableArray containsObject:](self->_activeRegistrations, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_activeRegistrations, "removeObject:", v4);
    }

    else
    {
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "  => Adding registration: %@",  (uint8_t *)&v10,  0xCu);
      }
    }

    activeRegistrations = self->_activeRegistrations;
    if (!activeRegistrations)
    {
      int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v9 = self->_activeRegistrations;
      self->_activeRegistrations = v8;

      activeRegistrations = self->_activeRegistrations;
    }

    -[NSMutableArray addObject:](activeRegistrations, "addObject:", v4);
  }
}

- (void)stopTrackingActiveRegistration:(id)a3
{
  id v4 = a3;
  if (v4
    && -[NSMutableArray containsObjectIdenticalTo:]( self->_activeRegistrations,  "containsObjectIdenticalTo:",  v4))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing registration from list of active registrations: %@",  (uint8_t *)&v7,  0xCu);
    }

    -[NSMutableArray removeObjectIdenticalTo:](self->_activeRegistrations, "removeObjectIdenticalTo:", v4);
    if (!-[NSMutableArray count](self->_activeRegistrations, "count"))
    {
      activeRegistrations = self->_activeRegistrations;
      self->_activeRegistrations = 0LL;
    }
  }
}

- (id)activeRegistrationsMatchingUserID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_im_normalizedURIString"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController activeRegistrations](self, "activeRegistrations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100066E38;
  v9[3] = &unk_1008F8348;
  id v10 = v4;
  id v6 = v4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imArrayByApplyingBlock:", v9));

  return v7;
}

- (id)activeRegistrationsOfType:(int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController activeRegistrations](self, "activeRegistrations"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100066F24;
  v7[3] = &unk_1008F8368;
  int v8 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "__imArrayByApplyingBlock:", v7));

  return v5;
}

- (NSArray)activeRegistrationsToRegister
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController activeRegistrations](self, "activeRegistrations"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "__imArrayByApplyingBlock:", &stru_1008F8388));

  return (NSArray *)v3;
}

- (void)_systemConfigurationPrefsChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 deviceName]);

  if (self->_deviceName != v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      *(_DWORD *)SCDynamicStoreContext buf = 138412546;
      uint64_t v31 = deviceName;
      __int16 v32 = 2112;
      uint64_t v33 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device name changed from %@ to %@",  buf,  0x16u);
    }

    objc_storeStrong((id *)&self->_deviceName, v4);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = -[NSMutableArray _copyForEnumerating](self->_trackedRegistrations, "_copyForEnumerating");
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v27;
    *(void *)&__int128 v9 = 138412802LL;
    __int128 v25 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceName", v25));
        unsigned __int8 v15 = [v14 isEqualToString:v4];

        if ((v15 & 1) == 0)
        {
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue([v13 deviceName]);
            *(_DWORD *)SCDynamicStoreContext buf = v25;
            uint64_t v31 = v17;
            __int16 v32 = 2112;
            uint64_t v33 = v4;
            __int16 v34 = 2112;
            uint64_t v35 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Device name was updated from %@ to %@  (Registration: %@)",  buf,  0x20u);
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
          unsigned int v19 = [v18 isUnderFirstDataProtectionLock];

          BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v21)
            {
              *(_WORD *)SCDynamicStoreContext buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "  => Deferring registration for device name change, we're locked",  buf,  2u);
            }

            deferredRegisters = self->_deferredRegisters;
            if (!deferredRegisters)
            {
              id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              id v24 = self->_deferredRegisters;
              self->_deferredRegisters = v23;

              deferredRegisters = self->_deferredRegisters;
            }

            -[NSMutableSet addObject:](deferredRegisters, "addObject:", v13);
          }

          else
          {
            if (v21)
            {
              *(_WORD *)SCDynamicStoreContext buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "  => Sending registration for device name change",  buf,  2u);
            }

            -[IDSRegistrationController registerInfo:](self, "registerInfo:", v13);
          }
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }

    while (v10);
  }
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = -[NSMutableSet count](self->_deferredRegisters, "count");
    *(_DWORD *)SCDynamicStoreContext buf = 67109120;
    LODWORD(v21) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "First unlock, checking deferred registrations: %d",  buf,  8u);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_deferredRegisters, "allObjects"));
  id v6 = [v5 _copyForEnumerating];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v15 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v15));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCDynamicStoreContext buf = v15;
          uint64_t v21 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "  => Sending deferred registration: %@",  buf,  0xCu);
        }

        -[IDSRegistrationController registerInfo:](self, "registerInfo:", v12);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v9);
  }

  deferredRegisters = self->_deferredRegisters;
  self->_deferredRegisters = 0LL;
}

- (void)_postHomeNumberNotificationBeforeAlertForIdentifier:(id)a3 forcefully:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController _phoneUserWithCredentials](self, "_phoneUserWithCredentials"));
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userWithUniqueIdentifier:v6]);

  if (v7) {
    unsigned __int8 v10 = 1;
  }
  else {
    unsigned __int8 v10 = -[IDSRegistrationController displayingAddNumberPrompt](self, "displayingAddNumberPrompt");
  }
  else {
    unsigned __int8 v11 = 1;
  }
  unsigned int v12 = -[IDSRegistrationController _pnrOngoing](self, "_pnrOngoing");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = -[IDSRegistrationController displayingAddNumberPrompt](self, "displayingAddNumberPrompt");
    __int128 v15 = @"NO";
    *(_DWORD *)SCDynamicStoreContext buf = 138413314;
    if (v14) {
      __int128 v16 = @"YES";
    }
    else {
      __int128 v16 = @"NO";
    }
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    if (v4) {
      __int128 v17 = @"YES";
    }
    else {
      __int128 v17 = @"NO";
    }
    id v23 = v17;
    __int16 v24 = 2112;
    if (v12) {
      __int128 v15 = @"YES";
    }
    __int128 v25 = v15;
    __int16 v26 = 2112;
    __int128 v27 = v7;
    __int16 v28 = 2112;
    __int128 v29 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Attempting to post Home Number notification before alert { displayingAddNumberPrompt: %@, bypassOngoingPNR: %@, on goingPNR: %@, phoneUser: %@, tempUser: %@ }",  buf,  0x34u);
  }

  if (((v10 | v11) & 1) != 0 || (v12 & ~v4 & 1) != 0)
  {
    if (((v10 | v11) & 1) == 0)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100067738;
      v18[3] = &unk_1008F5F80;
      v18[4] = self;
      id v19 = v6;
      im_dispatch_after_primary_queue(v18, 60.0);
    }
  }

  else
  {
    -[IDSRegistrationController _notifyHomeNumberSuccessForUser:](self, "_notifyHomeNumberSuccessForUser:", v9);
  }
}

- (BOOL)_pnrOngoing
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance",  0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 validators]);

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= ((unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * (void)i) status] & 0xFFFFFFFFFFFFFFFELL) == 2;
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (id)_provisionedTemporaryUser
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 usersWithRealm:2]);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (objc_msgSend(v7, "hasBeenProvisioned", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (id)_phoneUserWithCredentials
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 usersWithRealm:0]);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "credentialForUser:", v7, (void)v10));

        if (v8)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)_notifyHomeNumberSuccessForUser:(id)a3
{
  id v4 = a3;
  +[IDSTemporaryPhoneAlertManager presentSuccessAlertForUser:]( &OBJC_CLASS___IDSTemporaryPhoneAlertManager,  "presentSuccessAlertForUser:",  v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 temporaryPhoneUserWithNotifiedSuccess]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationController userStore](self, "userStore"));
  [v5 updateUser:v6];
}

- (void)_alertForHomeNumberIfNeededForSIMIdentifier:(id)a3 withPhoneNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length]
    && !-[IDSRegistrationController displayingAddNumberPrompt](self, "displayingAddNumberPrompt"))
  {
    __int128 v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v8));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = IMLocalizedStringFromTableInBundle( @"Add New Phone Number",  @"IDSLocalizable",  v10,  @"Home number add alert title; Add New Phone Number");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSTemporaryPhoneAlertManager serviceString]( &OBJC_CLASS___IDSTemporaryPhoneAlertManager,  "serviceString"));
    uint64_t v14 = IMLocalizedStringFromTableInBundle( @"Would you like to add the phone number %@ to use with %@?",  @"IDSLocalizable",  v10,  @"Home number add alert message; Would you like to add the phone number %@ to use with iMessage and FaceTime?");
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = IMFormattedNumberForUnformattedNumber(v7, 3LL);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v17, v13));

    uint64_t v19 = IMLocalizedStringFromTableInBundle( @"Add Number",  @"IDSLocalizable",  v10,  @"Home number add alert button");
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = IMLocalizedStringFromTableInBundle( @"Not Now",  @"IDSLocalizable",  v10,  @"Home number add alert cancel button");
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)SCDynamicStoreContext buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Displaying should add phone number alert",  buf,  2u);
    }

    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"HomeNumberAdd",  v12,  v18,  v20,  0LL,  v22));
    if (v24)
    {
      -[IDSRegistrationController setDisplayingAddNumberPrompt:](self, "setDisplayingAddNumberPrompt:", 1LL);
      char v30 = v22;
      __int128 v25 = v20;
      __int16 v26 = v18;
      __int128 v27 = v13;
      __int16 v28 = v12;
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotificationCenter sharedInstance]( &OBJC_CLASS___IMUserNotificationCenter,  "sharedInstance"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100067DF8;
      v31[3] = &unk_1008F83B0;
      id v32 = v6;
      uint64_t v33 = self;
      [v29 addUserNotification:v24 listener:0 completionHandler:v31];

      __int128 v12 = v28;
      __int128 v13 = v27;
      __int128 v18 = v26;
      BOOL v20 = v25;
      __int16 v22 = v30;
    }
  }
}

- (int64_t)simDeactivationInfoRateLimitCount
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"sim-deactivation-rate-limit-count"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    int64_t v6 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v6 = 5LL;
  }

  return v6;
}

- (double)simDeactivationInfoRateLimitInterval
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"sim-deactivation-rate-limit-time"]);

  double v5 = 86400.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      double v5 = v7;
    }
  }

  return v5;
}

- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationController simDeactivationRequestRateLimiter]( self,  "simDeactivationRequestRateLimiter"));

  if (!v8)
  {
    __int128 v9 = objc_alloc(&OBJC_CLASS___IDSRateLimiter);
    int64_t v10 = -[IDSRegistrationController simDeactivationInfoRateLimitCount](self, "simDeactivationInfoRateLimitCount");
    -[IDSRegistrationController simDeactivationInfoRateLimitInterval](self, "simDeactivationInfoRateLimitInterval");
    uint64_t v11 = -[IDSRateLimiter initWithLimit:timeLimit:](v9, "initWithLimit:timeLimit:", v10);
    -[IDSRegistrationController setSimDeactivationRequestRateLimiter:]( self,  "setSimDeactivationRequestRateLimiter:",  v11);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 SIMIdentifier]);
  __int128 v13 = (void *)v12;
  uint64_t v14 = @"SIM";
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  __int128 v15 = v14;

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationController simDeactivationRequestRateLimiter]( self,  "simDeactivationRequestRateLimiter"));
  unsigned int v17 = [v16 underLimitForItem:v15];

  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v6 SIMIdentifier]);
      int v23 = 138412290;
      __int16 v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sending SIM deactivation request for label ID %@",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationController simDeactivationRequestRateLimiter]( self,  "simDeactivationRequestRateLimiter"));
    [v21 noteItem:v15];

    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
    -[os_log_s sendDeactivationRequestWithSIM:Info:](v18, "sendDeactivationRequestWithSIM:Info:", v6, v7);
  }

  else if (v19)
  {
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationController simDeactivationRequestRateLimiter]( self,  "simDeactivationRequestRateLimiter"));
    int v23 = 138412290;
    __int16 v24 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Too many SIM deactivation events. Not sending request %@",  (uint8_t *)&v23,  0xCu);
  }
}

- (void)noteiCloudSignInTime
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  [v2 noteiCloudSignInTime];
}

- (void)noteManateeAvailabilityTime
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  [v2 noteManateeAvailableTime];
}

- (NSArray)trackedRegistrations
{
  return &self->_trackedRegistrations->super;
}

- (NSArray)activeRegistrations
{
  return &self->_activeRegistrations->super;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (void)setUserStore:(id)a3
{
}

- (BOOL)displayingAddNumberPrompt
{
  return self->_displayingAddNumberPrompt;
}

- (void)setDisplayingAddNumberPrompt:(BOOL)a3
{
  self->_displayingAddNumberPrompt = a3;
}

- (IDSRateLimiter)simDeactivationRequestRateLimiter
{
  return self->_simDeactivationRequestRateLimiter;
}

- (void)setSimDeactivationRequestRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end