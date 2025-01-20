@interface PHInCallUtilities
+ (__CFPhoneNumber)newPhoneNumberRefForDestinationID:(id)a3 useNetworkCountryCode:(BOOL)a4;
+ (id)formattedPhoneNumberFromString:(id)a3;
+ (id)sharedInstance;
+ (id)wifiSettingsURL;
+ (void)performBlockWithSharedInstanceOverride:(id)a3 block:(id)a4;
+ (void)setSharedInstanceOverride:(id)a3;
+ (void)unsetSharedInstanceOverride;
- (BOOL)canSendText;
- (BOOL)faceTimeAudioIsAvailable;
- (BOOL)faceTimeAudioIsSupported;
- (BOOL)faceTimeVideoIsAvailable;
- (BOOL)faceTimeVideoIsSupported;
- (BOOL)hasStatusBarSuppressionReasons;
- (BOOL)isIPadIdiom;
- (BOOL)isInLostMode;
- (BOOL)isLockScreenMessagingAllowed;
- (BOOL)isLockToEndCallEnabled;
- (BOOL)isSMSRestricted;
- (BOOL)isSetupAssistantRunning;
- (BOOL)requestedVCPresentationWithStatusBar;
- (NSMutableSet)inCallStatusBarSuppressionReasons;
- (PHInCallUtilities)init;
- (void)dealloc;
- (void)requestPasscodeUnlockWithCompletion:(id)a3;
- (void)setInCallStatusBarSuppressionReasons:(id)a3;
- (void)setRequestedVCPresentationWithStatusBar:(BOOL)a3 withReasonLog:(id)a4;
- (void)startAllowingRingingCallStatusIndicator;
- (void)startSuppressingInCallStatusBarForReason:(id)a3;
- (void)stopAllowingRingingCallStatusIndicator;
- (void)stopSuppressingInCallStatusBar;
- (void)stopSuppressingInCallStatusBarForReason:(id)a3;
- (void)updateInCallStatusBarSuppression;
@end

@implementation PHInCallUtilities

+ (id)sharedInstance
{
  if (qword_1001168C8 != -1) {
    dispatch_once(&qword_1001168C8, &stru_1000F6A70);
  }
  if (qword_1001168C0) {
    return (id)qword_1001168C0;
  }
  else {
    return (id)qword_1001168B8;
  }
}

+ (void)setSharedInstanceOverride:(id)a3
{
}

+ (void)unsetSharedInstanceOverride
{
}

+ (void)performBlockWithSharedInstanceOverride:(id)a3 block:(id)a4
{
  v6 = (void (**)(void))a4;
  [a1 setSharedInstanceOverride:a3];
  if (v6) {
    v6[2]();
  }
  [a1 unsetSharedInstanceOverride];
}

+ (__CFPhoneNumber)newPhoneNumberRefForDestinationID:(id)a3 useNetworkCountryCode:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 destinationIdIsPhoneNumber])
  {
    if (v4 && (uint64_t v6 = TUNetworkCountryCode(), (v7 = objc_claimAutoreleasedReturnValue(v6)) != 0))
    {
      v8 = (void *)v7;
      uint64_t v9 = TUNetworkCountryCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    }

    else
    {
      uint64_t v12 = TUHomeCountryCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }

    v11 = 0LL;
    if (v5 && v10) {
      v11 = (__CFPhoneNumber *)CFPhoneNumberCreate(kCFAllocatorDefault, v5, v10);
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

+ (id)formattedPhoneNumberFromString:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PHInCallUtilities newPhoneNumberRefForDestinationID:useNetworkCountryCode:]( &OBJC_CLASS___PHInCallUtilities,  "newPhoneNumberRefForDestinationID:useNetworkCountryCode:",  v3,  1LL);
  String = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    String = (void *)CFPhoneNumberCreateString(kCFAllocatorDefault, v4, 5LL);

    CFRelease(v6);
  }

  return String;
}

+ (id)wifiSettingsURL
{
  return +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=WIFI");
}

- (PHInCallUtilities)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PHInCallUtilities;
  v2 = -[PHInCallUtilities init](&v11, "init");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[PHInCallUtilities setInCallStatusBarSuppressionReasons:](v2, "setInCallStatusBarSuppressionReasons:", v3);

    -[PHInCallUtilities updateInCallStatusBarSuppression](v2, "updateInCallStatusBarSuppression");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
    [v4 addListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:2];

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
    [v5 addListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100007D54,  @"com.apple.mobilephone.LockScreenMessagingChanged",  0LL,  CFNotificationSuspensionBehaviorDrop);
    if (!qword_1001168D0)
    {
      uint64_t v7 = (void **)CUTWeakLinkSymbol("kLostModeChangedNotification", @"FindMyDevice");
      if (v7) {
        v8 = *v7;
      }
      else {
        v8 = 0LL;
      }
      objc_storeStrong((id *)&qword_1001168D0, v8);
    }

    uint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v9,  v2,  (CFNotificationCallback)sub_100007DC0,  (CFStringRef)qword_1001168D0,  0LL,  CFNotificationSuspensionBehaviorDrop);
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  [v3 removeListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:2];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  [v4 removeListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PHInCallUtilities;
  -[PHInCallUtilities dealloc](&v7, "dealloc");
}

- (void)startSuppressingInCallStatusBarForReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
    [v7 addObject:v4];

    id v8 = sub_100011210();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "added reason: %@, reasons: %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  -[PHInCallUtilities updateInCallStatusBarSuppression](self, "updateInCallStatusBarSuppression");
}

- (void)stopSuppressingInCallStatusBarForReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
    [v7 removeObject:v4];

    id v8 = sub_100011210();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "removed reason: %@, reasons: %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  -[PHInCallUtilities updateInCallStatusBarSuppression](self, "updateInCallStatusBarSuppression");
}

- (void)stopSuppressingInCallStatusBar
{
  id v3 = sub_100011210();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "removing all status bar suppression reasons: %@",  (uint8_t *)&v7,  0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  [v6 removeAllObjects];

  -[PHInCallUtilities updateInCallStatusBarSuppression](self, "updateInCallStatusBarSuppression");
}

- (void)startAllowingRingingCallStatusIndicator
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  [v2 shouldAllowRingingCallStatusIndicator:1];
}

- (void)stopAllowingRingingCallStatusIndicator
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  [v2 shouldAllowRingingCallStatusIndicator:0];
}

- (BOOL)hasStatusBarSuppressionReasons
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallUtilities inCallStatusBarSuppressionReasons](self, "inCallStatusBarSuppressionReasons"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)updateInCallStatusBarSuppression
{
  BOOL v2 = -[PHInCallUtilities hasStatusBarSuppressionReasons](self, "hasStatusBarSuppressionReasons");
  if (dword_100111E30 != v2)
  {
    BOOL v3 = v2;
    id v4 = sub_100011210();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = @"NO";
      if (v3) {
        unsigned int v6 = @"YES";
      }
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting PIP presence token to %@",  (uint8_t *)&v8,  0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    [v7 shouldSuppressInCallStatusBar:v3];

    dword_100111E30 = v3;
  }

- (void)requestPasscodeUnlockWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1LL);
  }
}

- (BOOL)isInLostMode
{
  if ((byte_1001168D8 & 1) == 0)
  {
    id v2 = objc_msgSend((id)CUTWeakLinkClass(@"FMDFMIPManager", @"FindMyDevice"), "sharedInstance");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    byte_1001168D9 = [v3 lostModeIsActive];

    byte_1001168D8 = 1;
  }

  return byte_1001168D9;
}

- (BOOL)isLockScreenMessagingAllowed
{
  if ((byte_1001168DA & 1) == 0)
  {
    id v2 = (void *)TUBundleIdentifierMobilePhoneApplication;
    CFPreferencesAppSynchronize(TUBundleIdentifierMobilePhoneApplication);
    id v3 = sub_100011280(@"LockScreenMessaging", v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    unsigned __int8 v5 = [v4 BOOLValue];
    if (v4) {
      char v6 = v5;
    }
    else {
      char v6 = 1;
    }
    byte_1001168DB = v6;
    byte_1001168DA = 1;
  }

  return byte_1001168DB;
}

- (BOOL)faceTimeVideoIsSupported
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v3 = [v2 faceTimeSupported];

  return v3;
}

- (BOOL)faceTimeVideoIsAvailable
{
  if (!-[PHInCallUtilities faceTimeVideoIsSupported](self, "faceTimeVideoIsSupported")) {
    return 0;
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:0] == (id)1;

  return v3;
}

- (BOOL)faceTimeAudioIsSupported
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v3 = [v2 callingSupported];

  return v3;
}

- (BOOL)faceTimeAudioIsAvailable
{
  if (!-[PHInCallUtilities faceTimeAudioIsSupported](self, "faceTimeAudioIsSupported")) {
    return 0;
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.InCallService.FTCServiceAvailabilityListenerID" forService:2] == (id)1;

  return v3;
}

- (BOOL)isIPadIdiom
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

- (BOOL)isSetupAssistantRunning
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008680;
  block[3] = &unk_1000F6930;
  block[4] = self;
  if (qword_1001168E0 != -1) {
    dispatch_once(&qword_1001168E0, block);
  }
  return byte_1001168E8;
}

- (BOOL)canSendText
{
  return 0;
}

- (BOOL)isSMSRestricted
{
  id v2 = TUBundleIdentifierMessagesApplication;
  id v10 = 0LL;
  id v3 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v10];
  id v4 = v10;
  unsigned __int8 v5 = v4;
  if (v3)
  {
    char v6 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationState]);
    unsigned __int8 v7 = [v6 isRestricted];
  }

  else
  {
    if (!v4)
    {
      unsigned __int8 v7 = 0;
      goto LABEL_8;
    }

    id v8 = sub_100011210();
    char v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_1000BB3A0((uint64_t)v2, (uint64_t)v5, (os_log_t)v6);
    }
    unsigned __int8 v7 = 0;
  }

LABEL_8:
  return v7;
}

- (void)setRequestedVCPresentationWithStatusBar:(BOOL)a3 withReasonLog:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_requestedVCPresentationWithStatusBar != v4)
  {
    self->_requestedVCPresentationWithStatusBar = v4;
    id v7 = sub_100011210();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = NSStringFromBOOL(self->_requestedVCPresentationWithStatusBar);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "set requestedPresentationWithStatusBar: %@ because: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (BOOL)isLockToEndCallEnabled
{
  if (!sub_1000089D0(0LL) || !sub_100008A9C()) {
    return 1;
  }
  id v2 = (uint64_t (*)(void))sub_100008A9C();
  if (!v2) {
    sub_1000BB424();
  }
  int v3 = v2();
  BOOL v4 = v3 != 0;
  id v5 = sub_100011210();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3 != 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Accessibility lock to end: %d",  (uint8_t *)v8,  8u);
  }

  return v4;
}

- (BOOL)requestedVCPresentationWithStatusBar
{
  return self->_requestedVCPresentationWithStatusBar;
}

- (NSMutableSet)inCallStatusBarSuppressionReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInCallStatusBarSuppressionReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end