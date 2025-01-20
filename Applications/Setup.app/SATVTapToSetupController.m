@interface SATVTapToSetupController
+ (void)initialize;
- (BOOL)isPresentingError;
- (BOOL)isStarted;
- (BOOL)tapToSetupManager:(id)a3 shouldConnectToNetworkWithName:(id)a4;
- (BOOL)tapToSetupManager:(id)a3 shouldPresentPasswordSettingPromptForAccount:(id)a4;
- (NSString)deviceLanguageCode;
- (SATVTapToSetupController)initWithPresentingViewController:(id)a3;
- (SATVTapToSetupViewController)tapToSetupViewController;
- (SATVTouchRemoteSetupManager)touchRemoteSetupManager;
- (TVSKNavigationController)internalNavigationController;
- (UIViewController)presentingViewController;
- (id)completion;
- (id)errorPromptAutoDismissBlock;
- (void)_completeWithTapToSetupDeviceInfo:(id)a3;
- (void)_dismiss;
- (void)_dismissAndReset;
- (void)_handleError:(id)a3;
- (void)_restartTouchRemoteSetup;
- (void)_showTapToSetupViewController;
- (void)_startTouchRemoteSetup;
- (void)_stopTouchRemoteSetup;
- (void)setCompletion:(id)a3;
- (void)setDeviceLanguageCode:(id)a3;
- (void)setErrorPromptAutoDismissBlock:(id)a3;
- (void)setInternalNavigationController:(id)a3;
- (void)setIsPresentingError:(BOOL)a3;
- (void)setIsStarted:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTapToSetupViewController:(id)a3;
- (void)setTouchRemoteSetupManager:(id)a3;
- (void)start;
- (void)stop;
- (void)tapToSetupManager:(id)a3 didBeginConfigurationPhase:(int64_t)a4 withMetadata:(id)a5;
- (void)tapToSetupManager:(id)a3 didBeginSetupWithDeviceName:(id)a4 isNewFlow:(BOOL)a5;
- (void)tapToSetupManager:(id)a3 didFailSetupWithError:(id)a4;
- (void)tapToSetupManager:(id)a3 didFinishAuthenticationForAccount:(unint64_t)a4 withResult:(BOOL)a5 error:(id)a6;
- (void)tapToSetupManager:(id)a3 didReceivePreAuthInfo:(id)a4;
- (void)tapToSetupManager:(id)a3 networkConnectionStateDidChange:(int64_t)a4;
- (void)tapToSetupManager:(id)a3 presentErrorAlert:(id)a4;
- (void)tapToSetupManager:(id)a3 willAttemptAuthenticationForAccount:(unint64_t)a4;
- (void)tapToSetupManagerDidFinishSetup:(id)a3 deviceInfo:(id)a4;
- (void)tapToSetupManagerStartTimeoutExpired:(id)a3;
@end

@implementation SATVTapToSetupController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVTapToSetupController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVTapToSetupController");
    v3 = (void *)qword_100109720;
    qword_100109720 = (uint64_t)v2;
  }

- (SATVTapToSetupController)initWithPresentingViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVTapToSetupController;
  v6 = -[SATVTapToSetupController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presentingViewController, a3);
  }

  return v7;
}

- (void)start
{
  if (!self->_isStarted)
  {
    self->_isStarted = 1;
    -[SATVTapToSetupController _startTouchRemoteSetup](self, "_startTouchRemoteSetup");
  }

- (void)stop
{
  if (self->_isStarted)
  {
    -[SATVTapToSetupController _stopTouchRemoteSetup](self, "_stopTouchRemoteSetup");
    self->_isStarted = 0;
  }

- (void)tapToSetupManager:(id)a3 didReceivePreAuthInfo:(id)a4
{
  id v5 = a4;
  deviceLanguageCode = self->_deviceLanguageCode;
  p_deviceLanguageCode = (id *)&self->_deviceLanguageCode;
  id *p_deviceLanguageCode = 0LL;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  unsigned __int8 v9 = [v8 languageCommitted];

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    CFTypeID TypeID = CFArrayGetTypeID();
    id v12 = objc_msgSend( v10,  "firstSupportedLanguageFromLanguages:",  CFDictionaryGetTypedValue(v5, @"langs", TypeID, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    TypedValue = v13;
    if (!v13)
    {
      CFTypeID v15 = CFStringGetTypeID();
      TypedValue = (void *)CFDictionaryGetTypedValue(v5, @"lang", v15, 0LL);
    }

    objc_storeStrong(p_deviceLanguageCode, TypedValue);

    v16 = (os_log_s *)qword_100109720;
    if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *p_deviceLanguageCode;
      *(_DWORD *)buf = 138543362;
      id v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No language chosen on TV. Using language %{public}@ from iOS device for TTSU UI",  buf,  0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    id v22 = *p_deviceLanguageCode;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    [v18 setPreferredLanguages:v19 withVariants:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    [v20 applyPreferredLanguagesChanges];
  }

  if (CFDictionaryGetInt64(v5, @"voe", 0LL))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    [v21 setVoiceOverEnabled:1];
  }
}

- (BOOL)tapToSetupManager:(id)a3 shouldPresentPasswordSettingPromptForAccount:(id)a4
{
  return 0;
}

- (void)tapToSetupManager:(id)a3 didBeginSetupWithDeviceName:(id)a4 isNewFlow:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  -[SATVTapToSetupController _showTapToSetupViewController](self, "_showTapToSetupViewController");
  -[SATVTapToSetupViewController tapToSetupDidBeginWithDeviceName:isNewFlow:]( self->_tapToSetupViewController,  "tapToSetupDidBeginWithDeviceName:isNewFlow:",  v7,  v5);
}

- (void)tapToSetupManager:(id)a3 didBeginConfigurationPhase:(int64_t)a4 withMetadata:(id)a5
{
  id v7 = a5;
  -[SATVTapToSetupController _showTapToSetupViewController](self, "_showTapToSetupViewController");
  -[SATVTapToSetupViewController tapToSetupDidBeginConfigurationPhase:withMetadata:]( self->_tapToSetupViewController,  "tapToSetupDidBeginConfigurationPhase:withMetadata:",  a4,  v7);
}

- (BOOL)tapToSetupManager:(id)a3 shouldConnectToNetworkWithName:(id)a4
{
  id v5 = a4;
  -[SATVTapToSetupController _showTapToSetupViewController](self, "_showTapToSetupViewController");
  -[SATVTapToSetupViewController tapToSetupWillConnectToWiFiNetworkWithName:]( self->_tapToSetupViewController,  "tapToSetupWillConnectToWiFiNetworkWithName:",  v5);

  return 1;
}

- (void)tapToSetupManager:(id)a3 networkConnectionStateDidChange:(int64_t)a4
{
}

- (void)tapToSetupManager:(id)a3 willAttemptAuthenticationForAccount:(unint64_t)a4
{
}

- (void)tapToSetupManager:(id)a3 didFinishAuthenticationForAccount:(unint64_t)a4 withResult:(BOOL)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (!a5)
  {
    v11 = (void *)qword_100109720;
    if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_ERROR)) {
      sub_100075EB8(v11, a4, v10);
    }
  }
}

- (void)tapToSetupManagerDidFinishSetup:(id)a3 deviceInfo:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)qword_100109720;
  if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SATVTapToSetupController tapToSetupManagerDidFinishSetup:deviceInfo:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: deviceInfo: %@", (uint8_t *)&v7, 0x16u);
  }

  -[SATVTapToSetupController _completeWithTapToSetupDeviceInfo:](self, "_completeWithTapToSetupDeviceInfo:", v5);
}

- (void)tapToSetupManager:(id)a3 didFailSetupWithError:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)qword_100109720;
  if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SATVTapToSetupController tapToSetupManager:didFailSetupWithError:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: error: %@", (uint8_t *)&v7, 0x16u);
  }

  -[SATVTapToSetupController _handleError:](self, "_handleError:", v5);
}

- (void)tapToSetupManagerStartTimeoutExpired:(id)a3
{
  v4 = (os_log_s *)qword_100109720;
  if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[SATVTapToSetupController tapToSetupManagerStartTimeoutExpired:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TRDeviceSetupErrorDomain,  -8106LL,  0LL));
  -[SATVTapToSetupController _handleError:](self, "_handleError:", v5);
}

- (void)tapToSetupManager:(id)a3 presentErrorAlert:(id)a4
{
}

- (void)_dismiss
{
  if (self->_internalNavigationController || self->_isPresentingError)
  {
    -[UIViewController dismissViewControllerAnimated:completion:]( self->_presentingViewController,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
    internalNavigationController = self->_internalNavigationController;
    self->_internalNavigationController = 0LL;

    tapToSetupViewController = self->_tapToSetupViewController;
    self->_tapToSetupViewController = 0LL;

    self->_isPresentingError = 0;
  }

- (void)_startTouchRemoteSetup
{
  p_touchRemoteSetupManager = &self->_touchRemoteSetupManager;
  if (!self->_touchRemoteSetupManager)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SATVTouchRemoteSetupManager);
    objc_storeStrong((id *)p_touchRemoteSetupManager, v4);
    id v5 = (os_log_s *)qword_100109720;
    if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Cleaning up before starting touch remote setup manager. {manager_ptr=%p}",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100005AE4;
    v7[3] = &unk_1000C93F0;
    objc_copyWeak(&v10, (id *)buf);
    int v6 = v4;
    v8 = v6;
    __int16 v9 = self;
    +[SATVUserProfilesUtilities deletePrimaryUserIfAnyWithCompletionHandler:]( &OBJC_CLASS___SATVUserProfilesUtilities,  "deletePrimaryUserIfAnyWithCompletionHandler:",  v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }

- (void)_stopTouchRemoteSetup
{
  v3 = (os_log_s *)qword_100109720;
  if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping touch remote setup manager", v5, 2u);
  }

  -[SATVTouchRemoteSetupManager stop](self->_touchRemoteSetupManager, "stop");
  -[SATVTouchRemoteSetupManager setUserInterfaceDelegate:]( self->_touchRemoteSetupManager,  "setUserInterfaceDelegate:",  0LL);
  touchRemoteSetupManager = self->_touchRemoteSetupManager;
  self->_touchRemoteSetupManager = 0LL;
}

- (void)_restartTouchRemoteSetup
{
  v3 = (os_log_s *)qword_100109720;
  if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Restarting touch remote setup manager", v4, 2u);
  }

  -[SATVTapToSetupController _stopTouchRemoteSetup](self, "_stopTouchRemoteSetup");
  -[SATVTapToSetupController _startTouchRemoteSetup](self, "_startTouchRemoteSetup");
}

- (void)_dismissAndReset
{
  deviceLanguageCode = self->_deviceLanguageCode;
  self->_deviceLanguageCode = 0LL;

  -[SATVTapToSetupController _restartTouchRemoteSetup](self, "_restartTouchRemoteSetup");
}

- (void)_showTapToSetupViewController
{
  if (!self->_tapToSetupViewController)
  {
    v3 = (os_log_s *)qword_100109720;
    if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Creating and showing SATVTapToSetupViewController",  (uint8_t *)buf,  2u);
    }

    v4 = -[SATVTapToSetupViewController initWithDeviceLanguageCode:]( objc_alloc(&OBJC_CLASS___SATVTapToSetupViewController),  "initWithDeviceLanguageCode:",  self->_deviceLanguageCode);
    tapToSetupViewController = self->_tapToSetupViewController;
    self->_tapToSetupViewController = v4;

    -[SATVTapToSetupViewController tapToSetupDidBeginWithDeviceName:isNewFlow:]( self->_tapToSetupViewController,  "tapToSetupDidBeginWithDeviceName:isNewFlow:",  0LL,  1LL);
    objc_initWeak(buf, self);
    int v6 = self->_tapToSetupViewController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100005F04;
    v10[3] = &unk_1000C93A0;
    objc_copyWeak(&v11, buf);
    -[SATVTapToSetupViewController setMenuHandler:](v6, "setMenuHandler:", v10);
    int v7 = -[TVSKNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVSKNavigationController),  "initWithRootViewController:",  self->_tapToSetupViewController);
    internalNavigationController = self->_internalNavigationController;
    self->_internalNavigationController = v7;

    -[UIViewController presentViewController:animated:completion:]( self->_presentingViewController,  "presentViewController:animated:completion:",  self->_internalNavigationController,  1LL,  0LL);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v9 deactivateScreenSaver];

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }

- (void)_handleError:(id)a3
{
  id v4 = a3;
  -[SATVTapToSetupController _stopTouchRemoteSetup](self, "_stopTouchRemoteSetup");
  if (v4)
  {
    id v5 = [v4 code];
    int v6 = 0LL;
    int v7 = 0LL;
    char v8 = 0;
    switch((unint64_t)v5)
    {
      case 0xFFFFFFFFFFFFE058LL:
      case 0xFFFFFFFFFFFFE05ALL:
        break;
      case 0xFFFFFFFFFFFFE05BLL:
        char v8 = 1;
        int v7 = @"TTS_ERROR_TITLE";
        int v6 = @"TTS_ERROR_VERSION_MESSAGE";
        break;
      default:
        char v8 = 1;
        int v7 = @"TTS_ERROR_TITLE";
        int v6 = @"TTS_ERROR_MESSAGE";
        break;
    }
  }

  else
  {
    int v6 = 0LL;
    int v7 = 0LL;
    char v8 = 0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000604C;
  block[3] = &unk_1000C9440;
  char v13 = v8;
  block[4] = self;
  id v10 = (__CFString *)v7;
  id v11 = (__CFString *)v6;
  id v12 = @"TTS_ERROR_OK";
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_completeWithTapToSetupDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_100109720;
  if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SATVTapToSetupController _completeWithTapToSetupDeviceInfo:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Completed with device info: %@", buf, 0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupController completion](self, "completion"));

  if (v6)
  {
    int v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SATVTapToSetupController completion](self, "completion"));
    ((void (**)(void, id))v7)[2](v7, v4);
  }

  -[SATVTapToSetupController stop](self, "stop");
  dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006564;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_after(v8, &_dispatch_main_q, block);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (SATVTouchRemoteSetupManager)touchRemoteSetupManager
{
  return self->_touchRemoteSetupManager;
}

- (void)setTouchRemoteSetupManager:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (TVSKNavigationController)internalNavigationController
{
  return self->_internalNavigationController;
}

- (void)setInternalNavigationController:(id)a3
{
}

- (SATVTapToSetupViewController)tapToSetupViewController
{
  return self->_tapToSetupViewController;
}

- (void)setTapToSetupViewController:(id)a3
{
}

- (NSString)deviceLanguageCode
{
  return self->_deviceLanguageCode;
}

- (void)setDeviceLanguageCode:(id)a3
{
}

- (BOOL)isPresentingError
{
  return self->_isPresentingError;
}

- (void)setIsPresentingError:(BOOL)a3
{
  self->_isPresentingError = a3;
}

- (id)errorPromptAutoDismissBlock
{
  return self->_errorPromptAutoDismissBlock;
}

- (void)setErrorPromptAutoDismissBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end