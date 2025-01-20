@interface SATVHelloViewController
+ (void)initialize;
- (BOOL)_allowedToProceed;
- (BOOL)_isDisplayAvailable;
- (BOOL)_performStealthStartup;
- (BOOL)_shouldShowRemoteAnimation;
- (BOOL)ignoreDisplayConnection;
- (BOOL)isFirstLanguageOfCycle;
- (NSLayoutConstraint)headerViewCenterXConstraint;
- (NSObject)applicationDidBecomeActiveNotificationObserver;
- (NSObject)peripheralConnectingObserver;
- (NSObject)proximityPairingFailedObserver;
- (NSObject)proximityPairingStartedObserver;
- (SATVCyclingFooterView)pairingInstructionsFooterView;
- (SATVCyclingHeaderView)proximityPairingHeaderView;
- (SATVHelloAnimatingHeaderViewController)helloAnimatingHeaderViewController;
- (SATVHelloViewController)initWithUserInputConfiguration:(id)a3;
- (TVPSAssertion)hudAssertion;
- (TVSKUserInputConfiguration)userInputConfiguration;
- (UIActivityIndicatorView)activityIndicator;
- (id)DisplayMode;
- (id)completeHandler;
- (void)_addConstraintsToHeaderView:(id)a3;
- (void)_bluetoothRemoteDidConnect:(id)a3;
- (void)_callCompletionHandler;
- (void)_onSelectRecognizer:(id)a3;
- (void)_removeHelloHeader;
- (void)_removePairingInstructionsFooter;
- (void)_removeProximityPairingBanner;
- (void)_runRemoteAnimation;
- (void)_showHelloHeader;
- (void)_showPairingInstructionsFooter;
- (void)_showPairingSpinner:(BOOL)a3;
- (void)_showProximityPairingFailedBanner;
- (void)_showProximityPairingStartedBanner;
- (void)_tryToComplete;
- (void)autoAdvance;
- (void)helloAnimatingHeaderViewController:(id)a3 didBeginAnimatingLanguageCode:(id)a4;
- (void)helloAnimatingHeaderViewControllerDidCompleteLanguagesCycle:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setApplicationDidBecomeActiveNotificationObserver:(id)a3;
- (void)setCompleteHandler:(id)a3;
- (void)setHeaderViewCenterXConstraint:(id)a3;
- (void)setHelloAnimatingHeaderViewController:(id)a3;
- (void)setHudAssertion:(id)a3;
- (void)setIgnoreDisplayConnection:(BOOL)a3;
- (void)setIsFirstLanguageOfCycle:(BOOL)a3;
- (void)setPairingInstructionsFooterView:(id)a3;
- (void)setPeripheralConnectingObserver:(id)a3;
- (void)setProximityPairingFailedObserver:(id)a3;
- (void)setProximityPairingHeaderView:(id)a3;
- (void)setProximityPairingStartedObserver:(id)a3;
- (void)tvs_bindDisplayModeToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SATVHelloViewController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVHelloViewController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVHelloViewController");
    v3 = (void *)qword_1001097A8;
    qword_1001097A8 = (uint64_t)v2;
  }

- (SATVHelloViewController)initWithUserInputConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVHelloViewController;
  v6 = -[SATVHelloViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userInputConfiguration, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVHelloViewController;
  -[SATVHelloViewController viewDidLoad](&v7, "viewDidLoad");
  if (-[TVSKUserInputConfiguration supportsRemote](self->_userInputConfiguration, "supportsRemote"))
  {
    v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_onSelectRecognizer:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
    [v4 addGestureRecognizer:v3];

    id v5 = (TVPSAssertion *)[[TVPSSuppressRemoteConnectivityHUDAssertion alloc] initWithIdentifier:@"SATVHelloViewController"];
    hudAssertion = self->_hudAssertion;
    self->_hudAssertion = v5;

    -[TVPSAssertion acquire](self->_hudAssertion, "acquire");
  }

- (id)DisplayMode
{
  if (qword_1001097B0 != -1) {
    dispatch_once(&qword_1001097B0, &stru_1000C9750);
  }
  return (id)qword_1001097B8;
}

- (void)tvs_bindDisplayModeToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController DisplayMode](self, "DisplayMode"));
  [v12 establishBinding:v11 toObject:v10 withKeyPath:v9 bindingOptions:v8 updateHandler:&stru_1000C9790];
}

- (void)viewDidAppear:(BOOL)a3
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SATVHelloViewController;
  -[SATVHelloViewController viewDidAppear:](&v33, "viewDidAppear:", a3);
  if (-[SATVHelloViewController _performStealthStartup](self, "_performStealthStartup"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    -[SATVHelloViewController tvs_bind:toObject:withKeyPath:options:]( self,  "tvs_bind:toObject:withKeyPath:options:",  @"DisplayMode",  v4,  @"currentMode",  0LL);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    id v6 = [v5 applicationState];

    if (!v6) {
      -[SATVHelloViewController _showHelloHeader](self, "_showHelloHeader");
    }
    objc_initWeak(&location, self);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100015F18;
    v30[3] = &unk_1000C97B8;
    objc_copyWeak(&v31, &location);
    id v9 = objc_claimAutoreleasedReturnValue( [v7 addObserverForName:UIApplicationDidBecomeActiveNotification object:0 queue:v8 usingBlock:v30]);
    applicationDidBecomeActiveNotificationObserver = self->_applicationDidBecomeActiveNotificationObserver;
    self->_applicationDidBecomeActiveNotificationObserver = v9;

    if (-[TVSKUserInputConfiguration supportsRemote](self->_userInputConfiguration, "supportsRemote"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v11 addObserver:self selector:"_bluetoothRemoteDidConnect:" name:@"SATVRemotePairingControllerBluetoothRemoteDidConnectNotification" object:0];

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100015F94;
      v28[3] = &unk_1000C97B8;
      objc_copyWeak(&v29, &location);
      v14 = objc_claimAutoreleasedReturnValue( [v12 addObserverForName:@"SATVRemotePairingControllerDidStartProximityPairing" object:0 queue:v13 usingBlock:v28]);
      proximityPairingStartedObserver = self->_proximityPairingStartedObserver;
      self->_proximityPairingStartedObserver = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100015FC0;
      v26[3] = &unk_1000C97B8;
      objc_copyWeak(&v27, &location);
      v18 = objc_claimAutoreleasedReturnValue( [v16 addObserverForName:@"SATVRemotePairingControllerProximityPairingFailed" object:0 queue:v17 usingBlock:v26]);
      proximityPairingFailedObserver = self->_proximityPairingFailedObserver;
      self->_proximityPairingFailedObserver = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100015FEC;
      v24[3] = &unk_1000C97B8;
      objc_copyWeak(&v25, &location);
      v22 = objc_claimAutoreleasedReturnValue( [v20 addObserverForName:@"SATVRemotePairingControllerPeripheralIsConnecting" object:0 queue:v21 usingBlock:v24]);
      peripheralConnectingObserver = self->_peripheralConnectingObserver;
      self->_peripheralConnectingObserver = v22;

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVHelloViewController;
  -[SATVHelloViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  proximityPairingFailedObserver = self->_proximityPairingFailedObserver;
  self->_proximityPairingFailedObserver = 0LL;

  proximityPairingStartedObserver = self->_proximityPairingStartedObserver;
  self->_proximityPairingStartedObserver = 0LL;

  peripheralConnectingObserver = self->_peripheralConnectingObserver;
  self->_peripheralConnectingObserver = 0LL;

  -[SATVHelloViewController _removeHelloHeader](self, "_removeHelloHeader");
  hudAssertion = self->_hudAssertion;
  self->_hudAssertion = 0LL;
}

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_1001097A8;
  if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Advancing due to autoAdvance.", v4, 2u);
  }

  -[SATVHelloViewController setIgnoreDisplayConnection:](self, "setIgnoreDisplayConnection:", 1LL);
  -[SATVHelloViewController _tryToComplete](self, "_tryToComplete");
}

- (void)helloAnimatingHeaderViewControllerDidCompleteLanguagesCycle:(id)a3
{
  if (!self->_pairingInstructionsFooterView)
  {
    self->_isFirstLanguageOfCycle = 1;
    -[SATVHelloViewController _showPairingInstructionsFooter](self, "_showPairingInstructionsFooter", a3);
  }

- (void)helloAnimatingHeaderViewController:(id)a3 didBeginAnimatingLanguageCode:(id)a4
{
  if (self->_isFirstLanguageOfCycle)
  {
    self->_isFirstLanguageOfCycle = 0;
  }

  else
  {
    pairingInstructionsFooterView = self->_pairingInstructionsFooterView;
    CFTimeInterval v5 = CACurrentMediaTime();
    -[SATVCyclingFooterView cycleAtBeginTime:](pairingInstructionsFooterView, "cycleAtBeginTime:", v5);
  }

- (void)_removeHelloHeader
{
  helloAnimatingHeaderViewController = self->_helloAnimatingHeaderViewController;
  self->_helloAnimatingHeaderViewController = 0LL;
}

- (void)_showHelloHeader
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVHelloAnimatingHeaderViewController);
  helloAnimatingHeaderViewController = self->_helloAnimatingHeaderViewController;
  self->_helloAnimatingHeaderViewController = v3;

  -[SATVHelloAnimatingHeaderViewController setDelegate:]( self->_helloAnimatingHeaderViewController,  "setDelegate:",  self);
  -[SATVHelloViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_helloAnimatingHeaderViewController);
  CFTimeInterval v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloAnimatingHeaderViewController view](self->_helloAnimatingHeaderViewController, "view"));
  -[SATVHelloViewController _addConstraintsToHeaderView:](self, "_addConstraintsToHeaderView:", v5);

  -[SATVHelloAnimatingHeaderViewController startAnimating](self->_helloAnimatingHeaderViewController, "startAnimating");
}

- (void)_showProximityPairingStartedBanner
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  v3 = objc_alloc(&OBJC_CLASS___SATVCyclingHeaderView);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 orderedRemotePairingStrings]);
  CFTimeInterval v5 = (void *)objc_claimAutoreleasedReturnValue([v10 orderedRemoteProximityStrings]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 orderedGreetingLanguageCodes]);
  objc_super v7 = -[SATVCyclingHeaderView initWithTitleStrings:subtitleStrings:languageCodes:]( v3,  "initWithTitleStrings:subtitleStrings:languageCodes:",  v4,  v5,  v6);
  proximityPairingHeaderView = self->_proximityPairingHeaderView;
  self->_proximityPairingHeaderView = v7;

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
  [v9 addSubview:self->_proximityPairingHeaderView];

  -[SATVHelloViewController _addConstraintsToHeaderView:]( self,  "_addConstraintsToHeaderView:",  self->_proximityPairingHeaderView);
  -[SATVHelloViewController _removePairingInstructionsFooter](self, "_removePairingInstructionsFooter");
  -[SATVHelloViewController _showPairingInstructionsFooter](self, "_showPairingInstructionsFooter");
  -[SATVCyclingHeaderView cycleWithInterval:](self->_proximityPairingHeaderView, "cycleWithInterval:", 5.0);
  -[SATVCyclingFooterView cycleWithInterval:](self->_pairingInstructionsFooterView, "cycleWithInterval:", 5.0);
}

- (void)_removeProximityPairingBanner
{
  proximityPairingHeaderView = self->_proximityPairingHeaderView;
  self->_proximityPairingHeaderView = 0LL;
}

- (void)_showProximityPairingFailedBanner
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  v3 = objc_alloc(&OBJC_CLASS___SATVCyclingHeaderView);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 orderedRemotePairingStrings]);
  CFTimeInterval v5 = (void *)objc_claimAutoreleasedReturnValue([v10 orderedRemotePairingErrorStrings]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 orderedGreetingLanguageCodes]);
  objc_super v7 = -[SATVCyclingHeaderView initWithTitleStrings:subtitleStrings:languageCodes:]( v3,  "initWithTitleStrings:subtitleStrings:languageCodes:",  v4,  v5,  v6);
  proximityPairingHeaderView = self->_proximityPairingHeaderView;
  self->_proximityPairingHeaderView = v7;

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
  [v9 addSubview:self->_proximityPairingHeaderView];

  -[SATVHelloViewController _addConstraintsToHeaderView:]( self,  "_addConstraintsToHeaderView:",  self->_proximityPairingHeaderView);
  -[SATVHelloViewController _removePairingInstructionsFooter](self, "_removePairingInstructionsFooter");
  -[SATVHelloViewController _showPairingInstructionsFooter](self, "_showPairingInstructionsFooter");
  -[SATVCyclingHeaderView cycleWithInterval:](self->_proximityPairingHeaderView, "cycleWithInterval:", 5.0);
  -[SATVCyclingFooterView cycleWithInterval:](self->_pairingInstructionsFooterView, "cycleWithInterval:", 5.0);
}

- (void)_showPairingSpinner:(BOOL)a3
{
  if (!self->_activityIndicator)
  {
    BOOL v44 = a3;
    v4 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  19LL);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v4;

    -[UIActivityIndicatorView setAutoresizingMask:](self->_activityIndicator, "setAutoresizingMask:", 18LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v7 = [v6 _graphicsQuality];

    if (v7 == (id)100)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v8));

      id v10 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v10, "contentView"));
      [v11 addSubview:self->_activityIndicator];
    }

    else
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___UIView);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UIVisualEffectView setBackgroundColor:](v10, "setBackgroundColor:", v12);

      -[UIVisualEffectView addSubview:](v10, "addSubview:", self->_activityIndicator);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
    [v13 addSubview:v10];

    +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 19LL);
    double v15 = v14;
    double v17 = v16;
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v10,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( self->_activityIndicator,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](self->_activityIndicator, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v10, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v42]);
    v45[0] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](self->_activityIndicator, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v10, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v39]);
    v45[1] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](self->_activityIndicator, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v10, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36]);
    v45[2] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](self->_activityIndicator, "bottomAnchor"));
    objc_super v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v10, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
    v45[3] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](v10, "centerXAnchor"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v31 centerXAnchor]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v29]);
    v45[4] = v28;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v10, "bottomAnchor"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v27 bottomAnchor]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v18 constant:-150.0]);
    v45[5] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](v10, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToConstant:v15]);
    v45[6] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](v10, "heightAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToConstant:v17]);
    v45[7] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 8LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v24);

    *(_DWORD *)&a3 = v44;
  }

  id v25 = self->_activityIndicator;
  if (a3)
  {
    -[UIActivityIndicatorView setHidden:](v25, "setHidden:", 0LL);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  }

  else
  {
    -[UIActivityIndicatorView setHidden:](v25, "setHidden:", 1LL);
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  }

- (void)_addConstraintsToHeaderView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  CFTimeInterval v5 = (void *)objc_claimAutoreleasedReturnValue([v4 centerXAnchor]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 centerXAnchor]);
  id v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToAnchor:v7]);
  headerViewCenterXConstraint = self->_headerViewCenterXConstraint;
  self->_headerViewCenterXConstraint = v8;

  v19[0] = self->_headerViewCenterXConstraint;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 centerYAnchor]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12]);
  v19[1] = v13;
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 widthAnchor]);
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToConstant:1144.0]);
  v19[2] = v15;
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v4 heightAnchor]);

  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToConstant:159.0]);
  v19[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);
}

- (BOOL)_isDisplayAvailable
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMode]);

  id v4 = [v3 width];
  id v5 = [v3 height];
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (BOOL)_allowedToProceed
{
  if (-[SATVHelloViewController _isDisplayAvailable](self, "_isDisplayAvailable")) {
    return 1;
  }
  else {
    return -[SATVHelloViewController ignoreDisplayConnection](self, "ignoreDisplayConnection");
  }
}

- (void)_onSelectRecognizer:(id)a3
{
  id v4 = (os_log_s *)qword_1001097A8;
  if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Advancing due to SELECT event.", v5, 2u);
  }

  -[SATVHelloViewController _runRemoteAnimation](self, "_runRemoteAnimation");
}

- (BOOL)_performStealthStartup
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  if ([v2 languageCommitted])
  {
    unsigned int v3 = 1;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    unsigned int v3 = [v4 localeCommitted];
  }

  id v5 = (os_log_s *)qword_1001097A8;
  if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v8 = 138412290;
    objc_super v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Is Stealth : %@", (uint8_t *)&v8, 0xCu);
  }

  return v3;
}

- (void)_bluetoothRemoteDidConnect:(id)a3
{
  id v4 = (os_log_s *)qword_1001097A8;
  if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Advancing due to remote connect.", v5, 2u);
  }

  -[SATVHelloViewController _runRemoteAnimation](self, "_runRemoteAnimation");
}

- (void)_runRemoteAnimation
{
  if (-[SATVHelloViewController _allowedToProceed](self, "_allowedToProceed"))
  {
    if (-[SATVHelloViewController _shouldShowRemoteAnimation](self, "_shouldShowRemoteAnimation"))
    {
      -[SATVHelloViewController _showPairingSpinner:](self, "_showPairingSpinner:", 0LL);
      unsigned int v3 = (void *)qword_1001097A8;
      if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
      {
        id v4 = v3;
        id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBluetoothRemoteTypeManager sharedInstance]( &OBJC_CLASS___TVSKBluetoothRemoteTypeManager,  "sharedInstance"));
        id v6 = [v5 remoteType];
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBluetoothRemoteTypeManager sharedInstance]( &OBJC_CLASS___TVSKBluetoothRemoteTypeManager,  "sharedInstance"));
        *(_DWORD *)buf = 134218240;
        id v12 = v6;
        __int16 v13 = 1024;
        unsigned int v14 = [v7 remoteSupportsTVProvider];
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Running animation for remote. {remoteType=%ld, supportsTVProvider=%{BOOL}d}",  buf,  0x12u);
      }

      int v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBluetoothRemoteTypeManager sharedInstance]( &OBJC_CLASS___TVSKBluetoothRemoteTypeManager,  "sharedInstance"));
      -[SATVHelloViewController runTimelineAnimationForDiscoveredPairingRemoteType:]( self,  "runTimelineAnimationForDiscoveredPairingRemoteType:",  [v8 remoteType]);

      v9[4] = self;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100016FD0;
      v10[3] = &unk_1000C9468;
      v10[4] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10001707C;
      v9[3] = &unk_1000C9490;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v10,  v9,  1.0);
    }

    else
    {
      -[SATVHelloViewController _tryToComplete](self, "_tryToComplete");
    }
  }

- (void)_tryToComplete
{
  if (-[SATVHelloViewController _allowedToProceed](self, "_allowedToProceed"))
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
    objc_msgSend(v3, "tvs_unbind:", qword_1001097B8);

    id v4 = (os_log_s *)qword_1001097A8;
    if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Advance to language selection screen.", buf, 2u);
    }

    if (-[SATVHelloViewController _performStealthStartup](self, "_performStealthStartup")
      || !-[SATVHelloViewController _shouldShowRemoteAnimation](self, "_shouldShowRemoteAnimation"))
    {
      -[SATVHelloViewController _callCompletionHandler](self, "_callCompletionHandler");
    }

    else
    {
      dispatch_time_t v5 = dispatch_time(0LL, 2000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000171C8;
      block[3] = &unk_1000C9468;
      block[4] = self;
      dispatch_after(v5, &_dispatch_main_q, block);
    }
  }

  else
  {
    id v6 = (os_log_s *)qword_1001097A8;
    if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "No display detected. Unable to advance to language selection screen.",  buf,  2u);
    }
  }

- (void)_callCompletionHandler
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController completeHandler](self, "completeHandler"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVHelloViewController completeHandler](self, "completeHandler"));
    v4[2]();

    -[SATVHelloViewController setCompleteHandler:](self, "setCompleteHandler:", 0LL);
  }

  else
  {
    dispatch_time_t v5 = (os_log_s *)qword_1001097A8;
    if (os_log_type_enabled((os_log_t)qword_1001097A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Skipping redundant advance to language screen - should already be there.",  v6,  2u);
    }
  }

- (void)_showPairingInstructionsFooter
{
  if (-[TVSKUserInputConfiguration requiresRemote](self->_userInputConfiguration, "requiresRemote"))
  {
    if (!self->_pairingInstructionsFooterView)
    {
      unsigned int v3 = objc_alloc(&OBJC_CLASS___SATVCyclingFooterView);
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVInternationalUtility sharedInstance]( &OBJC_CLASS___SATVInternationalUtility,  "sharedInstance"));
      dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 orderedRemotePairingHelpStrings]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SATVInternationalUtility sharedInstance]( &OBJC_CLASS___SATVInternationalUtility,  "sharedInstance"));
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 orderedGreetingLanguageCodes]);
      int v8 = -[SATVCyclingFooterView initWithStrings:languageCodes:](v3, "initWithStrings:languageCodes:", v5, v7);
      pairingInstructionsFooterView = self->_pairingInstructionsFooterView;
      self->_pairingInstructionsFooterView = v8;

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
      [v10 addSubview:self->_pairingInstructionsFooterView];

      -[SATVCyclingFooterView setTranslatesAutoresizingMaskIntoConstraints:]( self->_pairingInstructionsFooterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView centerXAnchor](self->_pairingInstructionsFooterView, "centerXAnchor"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v25 centerXAnchor]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
      v26[0] = v22;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView widthAnchor](self->_pairingInstructionsFooterView, "widthAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v21 widthAnchor]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v11]);
      v26[1] = v12;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView heightAnchor](self->_pairingInstructionsFooterView, "heightAnchor"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToConstant:200.0]);
      v26[2] = v14;
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView bottomAnchor](self->_pairingInstructionsFooterView, "bottomAnchor"));
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloViewController view](self, "view"));
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bottomAnchor]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v17]);
      v26[3] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v19);
    }
  }

- (void)_removePairingInstructionsFooter
{
  pairingInstructionsFooterView = self->_pairingInstructionsFooterView;
  self->_pairingInstructionsFooterView = 0LL;
}

- (BOOL)_shouldShowRemoteAnimation
{
  unsigned __int8 v3 = -[TVSKUserInputConfiguration supportsRemote](self->_userInputConfiguration, "supportsRemote");
  if (-[SATVHelloViewController tvsk_layoutStyle](self, "tvsk_layoutStyle") == (id)1) {
    return v3;
  }
  else {
    return 0;
  }
}

- (TVSKUserInputConfiguration)userInputConfiguration
{
  return self->_userInputConfiguration;
}

- (id)completeHandler
{
  return self->_completeHandler;
}

- (void)setCompleteHandler:(id)a3
{
}

- (SATVHelloAnimatingHeaderViewController)helloAnimatingHeaderViewController
{
  return self->_helloAnimatingHeaderViewController;
}

- (void)setHelloAnimatingHeaderViewController:(id)a3
{
}

- (SATVCyclingHeaderView)proximityPairingHeaderView
{
  return self->_proximityPairingHeaderView;
}

- (void)setProximityPairingHeaderView:(id)a3
{
}

- (SATVCyclingFooterView)pairingInstructionsFooterView
{
  return self->_pairingInstructionsFooterView;
}

- (void)setPairingInstructionsFooterView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (TVPSAssertion)hudAssertion
{
  return self->_hudAssertion;
}

- (void)setHudAssertion:(id)a3
{
}

- (NSObject)proximityPairingStartedObserver
{
  return self->_proximityPairingStartedObserver;
}

- (void)setProximityPairingStartedObserver:(id)a3
{
}

- (NSObject)proximityPairingFailedObserver
{
  return self->_proximityPairingFailedObserver;
}

- (void)setProximityPairingFailedObserver:(id)a3
{
}

- (NSObject)peripheralConnectingObserver
{
  return self->_peripheralConnectingObserver;
}

- (void)setPeripheralConnectingObserver:(id)a3
{
}

- (NSObject)applicationDidBecomeActiveNotificationObserver
{
  return self->_applicationDidBecomeActiveNotificationObserver;
}

- (void)setApplicationDidBecomeActiveNotificationObserver:(id)a3
{
}

- (BOOL)isFirstLanguageOfCycle
{
  return self->_isFirstLanguageOfCycle;
}

- (void)setIsFirstLanguageOfCycle:(BOOL)a3
{
  self->_isFirstLanguageOfCycle = a3;
}

- (BOOL)ignoreDisplayConnection
{
  return self->_ignoreDisplayConnection;
}

- (void)setIgnoreDisplayConnection:(BOOL)a3
{
  self->_ignoreDisplayConnection = a3;
}

- (NSLayoutConstraint)headerViewCenterXConstraint
{
  return self->_headerViewCenterXConstraint;
}

- (void)setHeaderViewCenterXConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end