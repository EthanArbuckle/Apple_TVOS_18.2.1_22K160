@interface GKAuthenticateExtensionViewController
- (BOOL)openSettingsUponCompletion;
- (GKAuthenticateExtensionViewController)initWithCoder:(id)a3;
- (GKOnboardingMetricsHandler)onboardingMetricsHandler;
- (id)hostObjectProxy;
- (int64_t)mode;
- (void)clientDidCancel;
- (void)clientDidFinish;
- (void)clientWillTerminate;
- (void)constructContentViewController;
- (void)constructOnboardingViewController;
- (void)constructSignInViewControllers;
- (void)messageFromClient:(id)a3;
- (void)onboardingFlowFinishedWithAction:(unint64_t)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setMode:(int64_t)a3;
- (void)setOnboardingMetricsHandler:(id)a3;
- (void)setOpenSettingsUponCompletion:(BOOL)a3;
- (void)setSignInOrigin:(unint64_t)a3;
- (void)unlockRotation;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKAuthenticateExtensionViewController

- (GKAuthenticateExtensionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
  v3 = -[GKAuthenticateExtensionViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[GKAuthenticateExtensionViewController setAdjustTopConstraint:](v3, "setAdjustTopConstraint:", 0LL);
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
  -[GKAuthenticateExtensionViewController viewDidLoad](&v3, "viewDidLoad");
  -[GKAuthenticateExtensionViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
  -[GKAuthenticateExtensionViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  if (-[GKAuthenticateExtensionViewController openSettingsUponCompletion](self, "openSettingsUponCompletion"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKDaemonProxy proxyForLocalPlayer](&OBJC_CLASS___GKDaemonProxy, "proxyForLocalPlayer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 utilityServicePrivate]);
    [v5 openGameCenterSettings];
  }

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
  -[GKAuthenticateExtensionViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  if ((id)-[GKAuthenticateExtensionViewController mode](self, "mode") != (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController contentViewController](self, "contentViewController"));

    if (!v4) {
      -[GKAuthenticateExtensionViewController constructContentViewController](self, "constructContentViewController");
    }
    id v5 =  -[GKAuthenticateExtensionViewController _gkAddMenuButtonTapGestureRecognizerWithTarget:action:]( self,  "_gkAddMenuButtonTapGestureRecognizerWithTarget:action:",  self,  "extensionIsCanceling");
    id v6 = objc_msgSend( [GKAcquireFocusWorkaroundView alloc],  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController view](self, "view"));
    [v7 addSubview:v6];

    [v6 becomeFirstResponder];
  }

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  uint64_t v6 = GKExtensionItemAuthenticateModeKey;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  v10 = v9;
  if (v9) {
    id v11 = [v9 integerValue];
  }
  else {
    id v11 = 0LL;
  }
  -[GKAuthenticateExtensionViewController setMode:](self, "setMode:", v11);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
  -[GKAuthenticateExtensionViewController setInitialState:withReply:](&v12, "setInitialState:withReply:", v8, v7);
}

- (void)constructContentViewController
{
  if ((id)-[GKAuthenticateExtensionViewController mode](self, "mode") == (id)2)
  {
    -[GKAuthenticateExtensionViewController constructOnboardingViewController]( self,  "constructOnboardingViewController");
  }

  else
  {
    objc_super v3 = objc_alloc_init(&OBJC_CLASS___GKSignInViewControllerPrivate);
    v7[0] = 0LL;
    v7[1] = v7;
    v7[2] = 0x3032000000LL;
    v7[3] = sub_100001684;
    v7[4] = sub_100001694;
    v4 = self;
    id v8 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000169C;
    v6[3] = &unk_100004218;
    v6[4] = v7;
    -[GKSignInViewControllerPrivate setCompletionHandler:](v3, "setCompletionHandler:", v6);
    -[GKSignInViewControllerPrivate setAuthExtensionViewController:](v3, "setAuthExtensionViewController:", v4);
    -[GKAuthenticateExtensionViewController setContentViewController:](v4, "setContentViewController:", v3);
    v5.receiver = v4;
    v5.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
    -[GKAuthenticateExtensionViewController constructContentViewController](&v5, "constructContentViewController");
    _Block_object_dispose(v7, 8);
  }

- (void)constructOnboardingViewController
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___GKOnboardingMetricsHandler);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  objc_super v5 = -[GKOnboardingMetricsHandler initWithReporter:refApp:](v3, "initWithReporter:refApp:", v4, 0LL);
  -[GKAuthenticateExtensionViewController setOnboardingMetricsHandler:](self, "setOnboardingMetricsHandler:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController onboardingMetricsHandler](self, "onboardingMetricsHandler"));
  [v6 onboardingDidBegin];

  id v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___GKOnboardingViewController));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [[GKOnboardingViewController alloc] initWithNibName:@"GKOnboardingViewController_ATV" bundle:v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKOnboardingController shared](&OBJC_CLASS___GKOnboardingController, "shared"));
  [v10 setDelegate:self];

  -[GKAuthenticateExtensionViewController setContentViewController:](self, "setContentViewController:", v9);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
  -[GKAuthenticateExtensionViewController pushViewController:animated:](&v11, "pushViewController:animated:", v9, 0LL);
}

- (void)onboardingFlowFinishedWithAction:(unint64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController onboardingMetricsHandler](self, "onboardingMetricsHandler"));
  [v5 reportEventForOnboardingFlowAction:a3];

  if (a3 <= 9)
  {
    if (((1LL << a3) & 0x3EE) == 0)
    {
      if (a3)
      {
        uint64_t v8 = GKExtensionMessageCommandKey;
        id v9 = &off_1000043C0;
        id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
        -[GKAuthenticateExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v7);

        goto LABEL_4;
      }

      -[GKAuthenticateExtensionViewController setOpenSettingsUponCompletion:]( self,  "setOpenSettingsUponCompletion:",  1LL);
    }

    -[GKAuthenticateExtensionViewController extensionIsFinishing](self, "extensionIsFinishing");
  }

- (void)constructSignInViewControllers
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000019B4;
  v3[3] = &unk_1000042B8;
  v3[4] = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController contentViewController](self, "contentViewController"));
  id v2 = v4;
  gk_dispatch_as_group(v3);
}

- (void)clientDidFinish
{
  if ((id)-[GKAuthenticateExtensionViewController mode](self, "mode") != (id)2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100001CB0;
    v3[3] = &unk_1000042E0;
    v3[4] = self;
    -[GKAuthenticateExtensionViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  0LL,  v3);
  }

- (void)clientDidCancel
{
}

- (void)setSignInOrigin:(unint64_t)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[GKOnboardingController shared](&OBJC_CLASS___GKOnboardingController, "shared"));
    [v4 setOrigin:a3];
  }

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GKExtensionProtocolSecureCodedClasses();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v17 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v4,  &v17));
  id v8 = v17;

  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers(v9, v10);
    }
    objc_super v12 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000021F4((uint64_t)v8, v12);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageCommandKey]);
  id v14 = [v13 integerValue];

  if (v14 == (id)62)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKExtensionMessageParamKey]);
    -[GKAuthenticateExtensionViewController setSignInOrigin:]( self,  "setSignInOrigin:",  [v15 unsignedIntegerValue]);
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___GKAuthenticateExtensionViewController;
    -[GKAuthenticateExtensionViewController messageFromClient:](&v16, "messageFromClient:", v4);
  }
}

- (void)clientWillTerminate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v2 reportEvent:GKReporterDomainOnboardingEvent type:GKReporterOnboardingTerminated];
}

- (id)hostObjectProxy
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKAuthenticateExtensionViewController extensionContext](self, "extensionContext"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _auxiliaryConnection]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:&stru_100004320]);

  return v4;
}

- (void)unlockRotation
{
  uint64_t v4 = GKExtensionMessageCommandKey;
  uint64_t v5 = &off_1000043D8;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));
  -[GKAuthenticateExtensionViewController sendMessageToClient:](self, "sendMessageToClient:", v3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)openSettingsUponCompletion
{
  return self->_openSettingsUponCompletion;
}

- (void)setOpenSettingsUponCompletion:(BOOL)a3
{
  self->_openSettingsUponCompletion = a3;
}

- (GKOnboardingMetricsHandler)onboardingMetricsHandler
{
  return self->_onboardingMetricsHandler;
}

- (void)setOnboardingMetricsHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end