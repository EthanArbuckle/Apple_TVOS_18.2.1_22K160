@interface VSSetupViewController
- (BOOL)hasAppearedBefore;
- (BOOL)isGoingBack;
- (BOOL)isStringFirstCharVowel:(id)a3;
- (BOOL)isWaitingForDisappearance;
- (BOOL)willDisappear;
- (NSData)serializedAccountData;
- (NSOperationQueue)privateQueue;
- (UIActivityIndicatorView)spinner;
- (VSAppDescription)appDescription;
- (VSIdentityProvider)identityProvider;
- (VSOnboardingInfoCenter)onboardingInfoCenter;
- (VSSetupFlowController)flowController;
- (VSSetupView)setupView;
- (VSSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)appRecordForDeveloperSettings:(id)a3;
- (id)completionHandler;
- (id)silentSignInSTBCompletionBlock;
- (void)_finish;
- (void)_goBack;
- (void)_menuPressed:(id)a3;
- (void)_offerAuthenticationForFlowController:(id)a3 forProvider:(id)a4 withSupportedAppsButton:(BOOL)a5 msoAppDescription:(id)a6 isSTB:(BOOL)a7 providerAccountUsername:(id)a8;
- (void)autoAdvance;
- (void)beginSetup:(id)a3;
- (void)dealloc;
- (void)fetchDeveloperSettings:(id)a3 error:(id)a4;
- (void)hideTVAnimation;
- (void)reset;
- (void)setAppDescription:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setGoingBack:(BOOL)a3;
- (void)setHasAppearedBefore:(BOOL)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setOnboardingInfoCenter:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setSerializedAccountData:(id)a3;
- (void)setSetupView:(id)a3;
- (void)setSilentSignInSTBCompletionBlock:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setWaitingForDisappearance:(BOOL)a3;
- (void)setWillDisappear:(BOOL)a3;
- (void)setupFlowController:(id)a3 authenticateProviderWithViewController:(id)a4;
- (void)setupFlowController:(id)a3 dismissViewController:(id)a4 completion:(id)a5;
- (void)setupFlowController:(id)a3 offerAuthenticationForProvider:(id)a4 withSupportedAppsButton:(BOOL)a5 msoAppDescription:(id)a6 isSTB:(BOOL)a7 providerAccountUsername:(id)a8;
- (void)setupFlowController:(id)a3 offerAuthenticationWithSupportedAppsButton:(BOOL)a4;
- (void)setupFlowController:(id)a3 pickProviderWithViewController:(id)a4;
- (void)setupFlowController:(id)a3 presentViewController:(id)a4 completion:(id)a5;
- (void)setupFlowController:(id)a3 requestAccessWithViewController:(id)a4;
- (void)setupFlowControllerDidFinishSilentSigningIn:(id)a3;
- (void)setupFlowControllerDidStartLoading:(id)a3;
- (void)setupFlowControllerNeedsDismissalOfSetupView;
- (void)showApps:(id)a3;
- (void)skipSetup:(id)a3;
- (void)startSetTopBoxSilentSignInWithCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VSSetupViewController

- (VSSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = VSDefaultLogObject(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[VSSetupViewController initWithNibName:bundle:]";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  VSRequireMainThread(v10, v11);
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  v12 = -[VSSetupViewController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", v7, v6);

  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[VSSetupFlowController sharedInstance](&OBJC_CLASS___VSSetupFlowController, "sharedInstance"));
    flowController = v12->_flowController;
    v12->_flowController = (VSSetupFlowController *)v13;

    -[VSSetupFlowController setDelegate:](v12->_flowController, "setDelegate:", v12);
    v15 = objc_alloc_init(&OBJC_CLASS___VSOnboardingInfoCenter);
    onboardingInfoCenter = v12->_onboardingInfoCenter;
    v12->_onboardingInfoCenter = v15;

    v17 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  0LL);
    spinner = v12->_spinner;
    v12->_spinner = v17;

    -[UIActivityIndicatorView setHidesWhenStopped:](v12->_spinner, "setHidesWhenStopped:", 1LL);
    v19 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v12->_privateQueue;
    v12->_privateQueue = v19;

    -[NSOperationQueue setName:](v12->_privateQueue, "setName:", @"VSSetupViewController");
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v3 = VSRequireMainThread(self, a2);
  uint64_t v4 = VSDefaultLogObject(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Deallocating setup view controller %p", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  -[VSSetupViewController dealloc](&v6, "dealloc");
}

- (void)_goBack
{
  uint64_t v3 = VSDefaultLogObject(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Will wait for disappearance.", buf, 2u);
  }

  uint64_t v5 = VSDefaultLogObject(-[VSSetupViewController setWaitingForDisappearance:](self, "setWaitingForDisappearance:", 1LL));
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Will invoke menu handler.", buf, 2u);
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VSSetupViewController menuHandler](self, "menuHandler"));
  uint64_t v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  dispatch_time_t v9 = dispatch_time(0LL, 300000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_110EC;
  block[3] = &unk_24558;
  block[4] = self;
  dispatch_after(v9, &_dispatch_main_q, block);
}

- (void)_menuPressed:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Menu press recognized.", v6, 2u);
  }

  -[VSSetupViewController _goBack](self, "_goBack");
}

- (void)_finish
{
  uint64_t v3 = VSDefaultLogObject(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Will invoke setup step completion handler.", v7, 2u);
  }

  +[VSMetricsManagerObjC recordExitEventWithPage:pageType:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordExitEventWithPage:pageType:",  VSMetricPageBuddyMain,  VSMetricPageTypeBuddy);
  -[VSSetupViewController setHasAppearedBefore:](self, "setHasAppearedBefore:", 0LL);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[VSSetupViewController completionHandler](self, "completionHandler"));
  objc_super v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    -[VSSetupViewController hideTVAnimation](self, "hideTVAnimation");
  }
}

- (void)autoAdvance
{
  uint64_t v3 = VSDefaultLogObject(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[VSSetupViewController autoAdvance]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = VSDefaultLogObject(-[VSSetupViewController _finish](self, "_finish"));
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[VSSetupViewController autoAdvance]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Will exit %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)reset
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
  unsigned __int8 v4 = [v3 isInSTBMode];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = VSDefaultLogObject(v5);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Will reset accounts", buf, 2u);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 undoManager]);

    uint64_t v10 = VSDefaultLogObject([v9 undo]);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Did reset accounts", v12, 2u);
    }
  }

- (void)startSetTopBoxSilentSignInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[VSSetupViewController startSetTopBoxSilentSignInWithCompletionHandler:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v16, 0xCu);
  }

  if (v4)
  {
    -[VSSetupViewController setSilentSignInSTBCompletionBlock:](self, "setSilentSignInSTBCompletionBlock:", v4);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
    [v7 startSilentSigningInForSTBFromActivation:1 withCompletion:0];
  }

  else
  {
    uint64_t v8 = VSErrorLogObject();
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_167A0((os_log_s *)v7, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)setupFlowControllerDidStartLoading:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner", a3));
  [v4 setHidden:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  [v5 startAnimating];

  -[VSSetupViewController hideTVAnimation](self, "hideTVAnimation");
}

- (void)setupFlowController:(id)a3 offerAuthenticationForProvider:(id)a4 withSupportedAppsButton:(BOOL)a5 msoAppDescription:(id)a6 isSTB:(BOOL)a7 providerAccountUsername:(id)a8
{
}

- (void)setupFlowController:(id)a3 offerAuthenticationWithSupportedAppsButton:(BOOL)a4
{
}

- (void)setupFlowController:(id)a3 authenticateProviderWithViewController:(id)a4
{
  id v5 = a4;
  uint64_t v6 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v5);

  -[UINavigationController setNavigationBarHidden:](v6, "setNavigationBarHidden:", 1LL);
  -[UINavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 8LL);
  -[VSSetupViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
}

- (void)setupFlowController:(id)a3 pickProviderWithViewController:(id)a4
{
  id v5 = a4;
  uint64_t v6 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v5);

  -[UINavigationController setNavigationBarHidden:](v6, "setNavigationBarHidden:", 1LL);
  -[UINavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 8LL);
  -[VSSetupViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
}

- (void)setupFlowController:(id)a3 requestAccessWithViewController:(id)a4
{
}

- (void)setupFlowController:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
}

- (void)setupFlowController:(id)a3 dismissViewController:(id)a4 completion:(id)a5
{
}

- (void)setupFlowControllerDidFinishSilentSigningIn:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[VSSetupViewController setupFlowControllerDidFinishSilentSigningIn:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[VSSetupViewController silentSignInSTBCompletionBlock]( self,  "silentSignInSTBCompletionBlock"));
  if (v6)
  {
    -[VSSetupViewController setSilentSignInSTBCompletionBlock:](self, "setSilentSignInSTBCompletionBlock:", 0LL);
    v6[2](v6);
  }

  else
  {
    uint64_t v7 = VSErrorLogObject();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_16810(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)setupFlowControllerNeedsDismissalOfSetupView
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController setupView](self, "setupView"));
  [v3 removeFromSuperview];

  -[VSSetupViewController setSetupView:](self, "setSetupView:", 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  [v4 setHidden:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  [v5 startAnimating];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
  unsigned __int8 v7 = [v6 isInSTBMode];

  if ((v7 & 1) == 0) {
    -[VSSetupViewController hideTVAnimation](self, "hideTVAnimation");
  }
}

- (void)beginSetup:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController identityProvider](self, "identityProvider", a3));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
    unsigned int v6 = [v5 isInSTBMode];

    unsigned __int8 v7 = &VSMetricPageBuddyZSO;
    if (!v6) {
      unsigned __int8 v7 = &VSMetricPageBuddySingleProvider;
    }
    +[VSMetricsManagerObjC recordClickEventWithPage:pageType:target:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordClickEventWithPage:pageType:target:",  *v7,  VSMetricPageTypeBuddy,  VSMetricClickTargetContinue);
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController identityProvider](self, "identityProvider"));
    [v9 startSigningInForIdentityProvider:v8];
  }

  else
  {
    +[VSMetricsManagerObjC recordClickEventWithPage:pageType:target:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordClickEventWithPage:pageType:target:",  VSMetricPageBuddyMain,  VSMetricPageTypeBuddy,  VSMetricClickTargetContinue);
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
    [v9 startSigningIn];
  }
}

- (void)skipSetup:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController identityProvider](self, "identityProvider"));
  [v5 notNowWithIdentityProvider:v4];
}

- (void)showApps:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController", a3));
  [v3 showSupportedApps];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  -[VSSetupViewController viewDidLoad](&v15, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController view](self, "view"));
  uint64_t v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_25D58);
  [v3 addGestureRecognizer:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  [v3 addSubview:v5];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 centerXAnchor]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
  [v10 setActive:1];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 centerYAnchor]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
  [v14 setActive:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  -[VSSetupViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  uint64_t v3 = VSDefaultLogObject( +[VSMetricsManagerObjC recordEnterEventWithPage:pageType:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordEnterEventWithPage:pageType:",  VSMetricPageBuddyMain,  VSMetricPageTypeBuddy));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Setup view will appear.", v5, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  id v4 = -[VSSetupViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  uint64_t v5 = VSDefaultLogObject(v4);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup view did appear.", v10, 2u);
  }

  if (!-[VSSetupViewController hasAppearedBefore](self, "hasAppearedBefore"))
  {
    BOOL v7 = -[VSSetupViewController isGoingBack](self, "isGoingBack");
    -[VSSetupViewController setGoingBack:](self, "setGoingBack:", 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController flowController](self, "flowController"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController serializedAccountData](self, "serializedAccountData"));
    [v8 startLoadingWhenGoingBack:v7 serializedAccountDataToImport:v9];

    -[VSSetupViewController setHasAppearedBefore:](self, "setHasAppearedBefore:", 1LL);
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  -[VSSetupViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  uint64_t v4 = VSDefaultLogObject(-[VSSetupViewController setWillDisappear:](self, "setWillDisappear:", 1LL));
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Setup view will disappear.", v6, 2u);
  }

  -[VSSetupViewController setWaitingForDisappearance:](self, "setWaitingForDisappearance:", 0LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VSSetupViewController;
  id v4 = -[VSSetupViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  uint64_t v5 = VSDefaultLogObject(v4);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup view did disappear.", v8, 2u);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController setupView](self, "setupView"));
  [v7 removeFromSuperview];

  -[VSSetupViewController setSetupView:](self, "setSetupView:", 0LL);
  -[VSSetupViewController setWillDisappear:](self, "setWillDisappear:", 0LL);
}

- (BOOL)isStringFirstCharVowel:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (id v3 = [v3 length]) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
    unsigned int v6 = [v5 characterAtIndex:0];

    BOOL v10 = v6 == 105 || (v6 & 0xFFFFFFFB) == 97 || v6 == 111 || v6 == 117;
  }

  else
  {
    uint64_t v11 = VSDefaultLogObject(v3);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "isStringFirstCharVowel: invalid string", v14, 2u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (void)_offerAuthenticationForFlowController:(id)a3 forProvider:(id)a4 withSupportedAppsButton:(BOOL)a5 msoAppDescription:(id)a6 isSTB:(BOOL)a7 providerAccountUsername:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v93 = a3;
  id v100 = a4;
  id v102 = a6;
  id v99 = a8;
  uint64_t v14 = VSDefaultLogObject(v99);
  objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[VSSetupViewController _offerAuthenticationForFlowController:forProvider:withSupportedAppsButt"
                         "on:msoAppDescription:isSTB:providerAccountUsername:]";
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  uint64_t v114 = 0LL;
  v115 = &v114;
  uint64_t v116 = 0x2020000000LL;
  char v117 = 0;
  uint64_t v17 = VSDefaultLogObject(v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v100 displayName]);
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v11;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v102;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v9;
    *(_WORD *)&buf[34] = 2112;
    *(void *)&buf[36] = v99;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Show AuthenticationForProvider: %@, canShowSupportedAppsButton %d, appDescription %@, isSTB %d, providerAccountUsername %@",  buf,  0x2Cu);
  }

  -[VSSetupViewController setIdentityProvider:](self, "setIdentityProvider:", v100);
  -[VSSetupViewController setAppDescription:](self, "setAppDescription:", v102);
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController view](self, "view"));
  v20 = objc_alloc(&OBJC_CLASS___VSSetupView);
  [v98 bounds];
  v21 = -[VSSetupView initWithFrame:](v20, "initWithFrame:");
  -[VSSetupViewController setSetupView:](self, "setSetupView:", v21);
  -[VSSetupView setDelegate:](v21, "setDelegate:", self);
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v100 nameForSorting]);
  if (v22) {
    BOOL v23 = v9;
  }
  else {
    BOOL v23 = 0;
  }
  v101 = (void *)v22;
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"SETUP_TITLE_STB" value:0 table:0]);

    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, v101));
  }

  else if (v22)
  {
    if (-[VSSetupViewController isStringFirstCharVowel:](self, "isStringFirstCharVowel:", v22))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"SETUP_TITLE_SOLE_AN" value:0 table:0]);
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"SETUP_TITLE_SOLE_A" value:0 table:0]);
    }

    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, v101));
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedStringForKey:@"SETUP_TITLE" value:0 table:0]);

    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, 0LL));
  }

  -[VSSetupView setTitle:](v21, "setTitle:", v96);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_130F8;
  *(void *)&buf[32] = sub_13108;
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v102 shortenedDisplayName]);
  *(void *)&buf[40] = v28;
  v29 = *(void **)(*(void *)&buf[8] + 40LL);
  if (!v29)
  {
    uint64_t v30 = VSDefaultLogObject(v28);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "No provider app name, will check developer mode status.",  v118,  2u);
    }

    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472LL;
    v113[2] = sub_13110;
    v113[3] = &unk_24F10;
    v113[4] = self;
    v113[5] = buf;
    -[VSSetupViewController fetchDeveloperSettings:error:](self, "fetchDeveloperSettings:error:", v113, &stru_24F30);
    v29 = *(void **)(*(void *)&buf[8] + 40LL);
  }

  if (!v29) {
    v29 = v101;
  }
  id v97 = v29;
  if (v9)
  {
    if ([v99 length])
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 localizedStringForKey:@"SETUP_MESSAGE_STB_AUTHD" value:0 table:0]);
    }

    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedStringForKey:@"SETUP_MESSAGE_STB" value:0 table:0]);
    }

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v97, v99));
  }

  else if (v101)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedStringForKey:@"SETUP_MESSAGE_SOLE" value:0 table:0]);

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v101));
  }

  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v95 = (void *)objc_claimAutoreleasedReturnValue([v33 localizedStringForKey:@"SETUP_MESSAGE" value:0 table:0]);
  }

  -[VSSetupView setMessage:](v21, "setMessage:", v95);
  if (v9 && [v99 length])
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localizedStringForKey:@"CONTINUE" value:0 table:0]);
    -[VSSetupView setBeginButtonTitle:](v21, "setBeginButtonTitle:", v36);
  }

  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localizedStringForKey:@"SETUP_BEGIN_BUTTON_TITLE" value:0 table:0]);
    -[VSSetupView setBeginButtonTitle:](v21, "setBeginButtonTitle:", v36);
  }

  if (v23)
  {
    if (-[VSSetupViewController isStringFirstCharVowel:](self, "isStringFirstCharVowel:", v101))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"STB_SKIP_SETUP_BUTTON_FORMAT_AN" value:0 table:0]);
    }

    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"STB_SKIP_SETUP_BUTTON_FORMAT_A" value:0 table:0]);
    }

    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v38, v101));
    -[VSSetupView setShouldOverrideSkipButtonStyle:](v21, "setShouldOverrideSkipButtonStyle:", 1LL);
  }

  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v94 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedStringForKey:@"NOT_NOW_BUTTON_TITLE" value:0 table:0]);

    -[VSSetupView setShouldOverrideSkipButtonStyle:](v21, "setShouldOverrideSkipButtonStyle:", 0LL);
  }

  -[VSSetupView setSkipButtonTitle:](v21, "setSkipButtonTitle:", v94);
  -[VSSetupView setShouldShowAppsButton:](v21, "setShouldShowAppsButton:", v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue( [v40 localizedStringForKey:@"SUPPORTED_APPS_BUTTON_TITLE" value:0 table:0]);
  -[VSSetupView setAppsButtonTitle:](v21, "setAppsButtonTitle:", v41);

  -[VSSetupView setShouldShowAboutButton:](v21, "setShouldShowAboutButton:", 1LL);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController onboardingInfoCenter](self, "onboardingInfoCenter"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 tvProviderPrivacyButtonViewController]);

  -[VSSetupViewController addChildViewController:](self, "addChildViewController:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 view]);
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupView tvProviderPrivacyButtonContainer](v21, "tvProviderPrivacyButtonContainer"));
  [v45 addSubview:v44];
  v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v44 topAnchor]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v45 topAnchor]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v48]);
  -[NSMutableArray addObject:](v46, "addObject:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue([v44 bottomAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v45 bottomAnchor]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v51]);
  -[NSMutableArray addObject:](v46, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue([v44 leadingAnchor]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v45 leadingAnchor]);
  v55 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v54]);
  -[NSMutableArray addObject:](v46, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue([v44 trailingAnchor]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v45 trailingAnchor]);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v57]);
  -[NSMutableArray addObject:](v46, "addObject:", v58);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v46);
  [v43 didMoveToParentViewController:self];
  -[VSSetupView setAutoresizingMask:](v21, "setAutoresizingMask:", 18LL);
  id v59 = [v98 addSubview:v21];
  if (!v9
    || (v60 = (void *)objc_claimAutoreleasedReturnValue([v102 artworkURLTemplate]),
        BOOL v61 = v60 == 0LL,
        v60,
        v61))
  {
    uint64_t v67 = VSDefaultLogObject(v59);
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl( &dword_0,  v68,  OS_LOG_TYPE_DEFAULT,  "No provider artwork, will check developer mode status.",  v118,  2u);
    }

    id v69 = objc_alloc_init(&OBJC_CLASS___VSSemaphore);
    v66 = (VSSetupView *)objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFetchOperation);
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472LL;
    v108[2] = sub_132C8;
    v108[3] = &unk_24558;
    id v64 = v69;
    id v109 = v64;
    -[VSSetupView setCompletionBlock:](v66, "setCompletionBlock:", v108);
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController privateQueue](self, "privateQueue"));
    [v70 addOperation:v66];

    [v64 wait];
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupView result](v66, "result"));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 forceUnwrapObject]);

    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472LL;
    v105[2] = sub_132D0;
    v105[3] = &unk_24FC8;
    v105[4] = self;
    v106 = v21;
    v107 = &v114;
    [v72 unwrapObject:v105 error:&stru_24FE8];
  }

  else
  {
    id v62 = objc_alloc(&OBJC_CLASS___VSLoadAllAppIconsOperation);
    id v120 = v102;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v120, 1LL));
    id v64 = objc_msgSend(v62, "initWithApps:shouldPrecomposeIcon:preferredSize:", v63, 0, 1280.0, 768.0);

    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472LL;
    v110[2] = sub_13208;
    v110[3] = &unk_24660;
    v111 = v21;
    id v112 = v102;
    [v64 setCompletionBlock:v110];
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController privateQueue](self, "privateQueue"));
    [v65 addOperation:v64];

    *((_BYTE *)v115 + 24) = 1;
    v66 = v111;
  }

  if (*((_BYTE *)v115 + 24) && v97)
  {
    -[VSSetupView setAppName:](v21, "setAppName:", v97);
    v73 = (void *)objc_claimAutoreleasedReturnValue([v102 rating]);
    v74 = v73;
    if (v73)
    {
      id v75 = v73;
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ ", v75));
      -[VSSetupView setAppAgeRatingBadge:](v21, "setAppAgeRatingBadge:", v76);
    }

    v77 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ([v102 offersInAppPurchases])
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v79 = (void *)objc_claimAutoreleasedReturnValue( [v78 localizedStringForKey:@"OFFERS_IN_APP_PURCHASES" value:0 table:0]);
      -[NSMutableArray addObject:](v77, "addObject:", v79);
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v80 localizedStringForKey:@"INSTALL_APP_DISCLAIMER" value:0 table:0]);
    -[NSMutableArray addObject:](v77, "addObject:", v81);

    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v77, "componentsJoinedByString:", @"\n"));
    -[VSSetupView setFootnote:](v21, "setFootnote:", v82);
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController spinner](self, "spinner"));
  [v83 stopAnimating];

  -[VSSetupView setNeedsFocusUpdate](v21, "setNeedsFocusUpdate");
  -[VSSetupView setAlpha:](v21, "setAlpha:", 0.0);
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472LL;
  v103[2] = sub_13578;
  v103[3] = &unk_24558;
  v84 = v21;
  v104 = v84;
  id v85 = +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v103, 0.3);
  if (*((_BYTE *)v115 + 24))
  {
    uint64_t v86 = VSDefaultLogObject(v85);
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v118 = 0;
      v88 = "No need for animator if artwork is available";
      v89 = v87;
      uint32_t v90 = 2;
LABEL_60:
      _os_log_impl(&dword_0, v89, OS_LOG_TYPE_DEFAULT, v88, v118, v90);
    }
  }

  else
  {
    id v91 = (id)-[VSSetupViewController willDisappear](self, "willDisappear");
    if ((v91 & 1) == 0) {
      id v91 = -[VSSetupViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  1LL,  1LL);
    }
    uint64_t v92 = VSDefaultLogObject(v91);
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v118 = 136315138;
      v119 = "-[VSSetupViewController _offerAuthenticationForFlowController:forProvider:withSupportedAppsButton:msoAppDes"
             "cription:isSTB:providerAccountUsername:]";
      v88 = "Will exit %s";
      v89 = v87;
      uint32_t v90 = 12;
      goto LABEL_60;
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v114, 8);
}

- (id)appRecordForDeveloperSettings:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 setTopBoxBundleIdentifier]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord vs_applicationRecordWithBundleIdentifier:]( &OBJC_CLASS___LSApplicationRecord,  "vs_applicationRecordWithBundleIdentifier:",  v3));
  }

  else
  {
    uint64_t v5 = VSErrorLogObject();
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_169AC(v6);
    }

    id v4 = 0LL;
  }

  return v4;
}

- (void)fetchDeveloperSettings:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___VSSemaphore);
  id v9 = objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFetchOperation);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_13720;
  v14[3] = &unk_24558;
  id v15 = v8;
  id v10 = v8;
  [v9 setCompletionBlock:v14];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupViewController privateQueue](self, "privateQueue"));
  [v11 addOperation:v9];

  [v10 wait];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 result]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 forceUnwrapObject]);

  [v13 unwrapObject:v7 error:v6];
}

- (void)hideTVAnimation
{
}

- (NSData)serializedAccountData
{
  return self->_serializedAccountData;
}

- (void)setSerializedAccountData:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (VSSetupFlowController)flowController
{
  return self->_flowController;
}

- (void)setFlowController:(id)a3
{
}

- (VSOnboardingInfoCenter)onboardingInfoCenter
{
  return self->_onboardingInfoCenter;
}

- (void)setOnboardingInfoCenter:(id)a3
{
}

- (BOOL)hasAppearedBefore
{
  return self->_hasAppearedBefore;
}

- (void)setHasAppearedBefore:(BOOL)a3
{
  self->_hasAppearedBefore = a3;
}

- (BOOL)isWaitingForDisappearance
{
  return self->_waitingForDisappearance;
}

- (void)setWaitingForDisappearance:(BOOL)a3
{
  self->_waitingForDisappearance = a3;
}

- (BOOL)willDisappear
{
  return self->_willDisappear;
}

- (void)setWillDisappear:(BOOL)a3
{
  self->_willDisappear = a3;
}

- (BOOL)isGoingBack
{
  return self->_goingBack;
}

- (void)setGoingBack:(BOOL)a3
{
  self->_goingBack = a3;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (VSAppDescription)appDescription
{
  return self->_appDescription;
}

- (void)setAppDescription:(id)a3
{
}

- (id)silentSignInSTBCompletionBlock
{
  return self->_silentSignInSTBCompletionBlock;
}

- (void)setSilentSignInSTBCompletionBlock:(id)a3
{
}

- (VSSetupView)setupView
{
  return self->_setupView;
}

- (void)setSetupView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end