@interface SATVLegacyLoginViewController
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)comingFromTapToSetup;
- (BOOL)didLoginOrSkipFromAppleID;
- (BOOL)isiCloudLoggedIn;
- (NSString)appleIDUsername;
- (NSString)iCloudUsername;
- (NSString)iTunesUsername;
- (SATVAuthenticationView)authenticationView;
- (SATVLegacyLoginViewController)init;
- (TVSKActivityIndicatorViewController)activityIndicatorViewController;
- (TVSStateMachine)loginStateMachine;
- (TVSiCloudAccountManager)iCloudAccountManager;
- (UISystemInputViewController)systemInputViewController;
- (id)_passwordText;
- (id)_usernameText;
- (id)clientMenuHandler;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (void)_addConstrainstToLoginView;
- (void)_authenticateAppleIDWithUsername:(id)a3 password:(id)a4;
- (void)_authenticateStoreAccountWithUsername:(id)a3 password:(id)a4;
- (void)_authenticateiCloudAccountWithUsername:(id)a3 password:(id)a4;
- (void)_clearTextFields;
- (void)_continueButtonSelected;
- (void)_crossFadeLoginViewWithChanges:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)_hideActivityIndicator;
- (void)_hideLoginView;
- (void)_loginCompleteWithResult:(unint64_t)a3;
- (void)_menuSelected;
- (void)_postAuthenticationResults:(BOOL)a3 forEmailAddress:(id)a4;
- (void)_postLoginFailed;
- (void)_postLoginSucceeded;
- (void)_registerStateMachineEvents;
- (void)_reloadForStateChange;
- (void)_rememberEmailRecentInput:(id)a3;
- (void)_setControlTargets;
- (void)_setViewsForInitialState;
- (void)_showActivityIndicator;
- (void)_showAppleIDUsernameScreen;
- (void)_showPasswordSettingPrompt;
- (void)_showiCloudUsernameScreen;
- (void)_showiTunesUsernameScreen;
- (void)_skipButtonSelected;
- (void)_useSeparateIDsSelected;
- (void)loadView;
- (void)reset;
- (void)setActivityIndicatorViewController:(id)a3;
- (void)setAppleIDUsername:(id)a3;
- (void)setAuthenticationView:(id)a3;
- (void)setClientMenuHandler:(id)a3;
- (void)setComingFromTapToSetup:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDidLoginOrSkipFromAppleID:(BOOL)a3;
- (void)setICloudAccountManager:(id)a3;
- (void)setICloudLoggedIn:(BOOL)a3;
- (void)setICloudUsername:(id)a3;
- (void)setITunesUsername:(id)a3;
- (void)setLoginStateMachine:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setSystemInputViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVLegacyLoginViewController

- (SATVLegacyLoginViewController)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
  v2 = -[SATVLegacyLoginViewController init](&v25, "init");
  if (v2)
  {
    v3 = -[TVSStateMachine initWithName:initialState:mode:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:",  @"SATVLoginStateMachine",  @"SATVLoginStateMachineStateAppleIDPass",  0LL);
    loginStateMachine = v2->_loginStateMachine;
    v2->_loginStateMachine = v3;

    v5 = v2->_loginStateMachine;
    id v6 = sub_10002AF94();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TVSStateMachine setLogObject:](v5, "setLogObject:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 usernameForActiveAccountType:0]);
    appleIDUsername = v2->_appleIDUsername;
    v2->_appleIDUsername = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 usernameForActiveAccountType:1]);
    iTunesUsername = v2->_iTunesUsername;
    v2->_iTunesUsername = (NSString *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 usernameForActiveAccountType:2]);
    iCloudUsername = v2->_iCloudUsername;
    v2->_iCloudUsername = (NSString *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    [v17 logOutAccountType:0];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    [v18 logOutAccountType:2];

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    [v19 logOutAccountType:1];

    objc_initWeak(&location, v2);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100057114;
    v22[3] = &unk_1000C93A0;
    objc_copyWeak(&v23, &location);
    v21.receiver = v2;
    v21.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
    -[SATVLegacyLoginViewController setMenuHandler:](&v21, "setMenuHandler:", v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)reset
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  unsigned int v5 = [v4 isEqualToString:@"SATVLoginStateMachineStateLoginComplete"];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
    [v6 postEvent:@"SATVLoginStateMachineEventLandedFromMenuAction"];
  }

  else
  {
    -[SATVLegacyLoginViewController setComingFromTapToSetup:](self, "setComingFromTapToSetup:", 1LL);
  }

- (void)setMenuHandler:(id)a3
{
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
  -[SATVLegacyLoginViewController loadView](&v13, "loadView");
  v3 = objc_alloc(&OBJC_CLASS___SATVAuthenticationView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController view](self, "view"));
  [v4 bounds];
  unsigned int v5 = -[SATVAuthenticationView initWithFrame:](v3, "initWithFrame:");
  authenticationView = self->_authenticationView;
  self->_authenticationView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController view](self, "view"));
  [v7 addSubview:self->_authenticationView];

  -[SATVLegacyLoginViewController _addConstrainstToLoginView](self, "_addConstrainstToLoginView");
  v8 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
  activityIndicatorViewController = self->_activityIndicatorViewController;
  self->_activityIndicatorViewController = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v10 setAlpha:0.0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController view](self, "view"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v11 addSubview:v12];

  -[SATVLegacyLoginViewController addChildViewController:]( self,  "addChildViewController:",  self->_activityIndicatorViewController);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
  -[SATVLegacyLoginViewController viewDidLoad](&v5, "viewDidLoad");
  -[SATVLegacyLoginViewController _registerStateMachineEvents](self, "_registerStateMachineEvents");
  -[SATVLegacyLoginViewController _setViewsForInitialState](self, "_setViewsForInitialState");
  -[SATVLegacyLoginViewController _setControlTargets](self, "_setControlTargets");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_doneButtonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1000D1088);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
  -[SATVLegacyLoginViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if ((-[SATVLegacyLoginViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[SATVLegacyLoginViewController isMovingToParentViewController]( self,  "isMovingToParentViewController"))
  {
    -[SATVLegacyLoginViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  10LL,  9LL);
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
  -[SATVLegacyLoginViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVLegacyLoginViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (void)_addConstrainstToLoginView
{
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController view](self, "view"));
  -[SATVAuthenticationView setTranslatesAutoresizingMaskIntoConstraints:]( self->_authenticationView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView widthAnchor](self->_authenticationView, "widthAnchor"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToConstant:835.0]);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView centerYAnchor](self->_authenticationView, "centerYAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v15 centerYAnchor]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  id v9 = -[SATVLegacyLoginViewController tvsk_layoutStyle](self, "tvsk_layoutStyle");
  authenticationView = self->_authenticationView;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView leadingAnchor](authenticationView, "leadingAnchor"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v15 leadingAnchor]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12 constant:150.0]);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView centerXAnchor](authenticationView, "centerXAnchor"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v15 centerXAnchor]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  }

  v14 = (void *)v13;
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v3);
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVLegacyLoginViewController;
  -[SATVLegacyLoginViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLegacyLoginViewController activityIndicatorViewController]( self,  "activityIndicatorViewController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController systemInputViewController](self, "systemInputViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredFocusEnvironments]);

  if (v3) {
    double v4 = v3;
  }
  else {
    double v4 = &__NSArray0__struct;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 1;
}

- (void)_doneButtonPressed:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView continueButton](self->_authenticationView, "continueButton", a3));
  unsigned int v5 = [v4 isEnabled];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView continueButton](self->_authenticationView, "continueButton"));
    [v6 sendActionsForControlEvents:0x2000];
  }

- (void)_registerStateMachineEvents
{
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_100058218;
  v70[3] = &unk_1000C93A0;
  objc_copyWeak(&v71, location);
  v3 = objc_retainBlock(v70);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_100058258;
  v68[3] = &unk_1000CA3C0;
  objc_copyWeak(&v69, location);
  [v4 registerHandlerForEvent:@"SATVLoginStateMachineEventMenuSelected" onState:@"SATVLoginStateMachineStateAppleIDPass" withBlock:v68];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_1000582C0;
  v66[3] = &unk_1000CA3C0;
  objc_copyWeak(&v67, location);
  [v5 registerHandlerForEvent:@"SATVLoginStateMachineEventContinueSelected" onState:@"SATVLoginStateMachineStateAppleIDPass" withBlock:v66];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_10005833C;
  v63[3] = &unk_1000CACB0;
  objc_copyWeak(&v65, location);
  double v7 = v3;
  id v64 = v7;
  [v6 registerHandlerForEvent:@"SATVLoginStateMachineEventLoginSucceeded" onState:@"SATVLoginStateMachineStateAppleIDAttemptingLogin" withBlock:v63];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1000583A0;
  v61[3] = &unk_1000CACD8;
  double v9 = v7;
  id v62 = v9;
  [v8 registerHandlerForEvent:@"SATVLoginStateMachineEventPasswordSettingPromptSelected" onState:@"SATVLoginStateMachineStateAppleIDPromptingForPasswordSetting" withBlock:v61];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000583C4;
  v59[3] = &unk_1000CA3C0;
  objc_copyWeak(&v60, location);
  [v10 registerHandlerForEvent:@"SATVLoginStateMachineEventLoginFailed" onState:@"SATVLoginStateMachineStateAppleIDAttemptingLogin" withBlock:v59];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100058428;
  v57[3] = &unk_1000CA3C0;
  objc_copyWeak(&v58, location);
  [v11 registerHandlerForEvent:@"SATVLoginStateMachineEventUseSeparateIDsSelected" onState:@"SATVLoginStateMachineStateAppleIDPass" withBlock:v57];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100058484;
  v55[3] = &unk_1000CA3C0;
  objc_copyWeak(&v56, location);
  [v12 registerHandlerForEvent:@"SATVLoginStateMachineEventSkipSelected" onState:@"SATVLoginStateMachineStateAppleIDPass" withBlock:v55];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1000584FC;
  v53[3] = &unk_1000CA3C0;
  objc_copyWeak(&v54, location);
  [v13 registerHandlerForEvent:@"SATVLoginStateMachineEventContinueSelected" onState:@"SATVLoginStateMachineStateiCloudAuthentication" withBlock:v53];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100058578;
  v51[3] = &unk_1000CA3C0;
  objc_copyWeak(&v52, location);
  [v14 registerHandlerForEvent:@"SATVLoginStateMachineEventLoginSucceeded" onState:@"SATVLoginStateMachineStateiCloudAttemptingLogin" withBlock:v51];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000585C8;
  v49[3] = &unk_1000CA3C0;
  objc_copyWeak(&v50, location);
  [v15 registerHandlerForEvent:@"SATVLoginStateMachineEventLoginFailed" onState:@"SATVLoginStateMachineStateiCloudAttemptingLogin" withBlock:v49];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10005860C;
  v47[3] = &unk_1000CA3C0;
  objc_copyWeak(&v48, location);
  [v16 registerHandlerForEvent:@"SATVLoginStateMachineEventMenuSelected" onState:@"SATVLoginStateMachineStateiCloudAuthentication" withBlock:v47];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100058654;
  v45[3] = &unk_1000CA3C0;
  objc_copyWeak(&v46, location);
  [v17 registerHandlerForEvent:@"SATVLoginStateMachineEventSkipSelected" onState:@"SATVLoginStateMachineStateiCloudAuthentication" withBlock:v45];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000586B0;
  v43[3] = &unk_1000CA3C0;
  objc_copyWeak(&v44, location);
  [v18 registerHandlerForEvent:@"SATVLoginStateMachineEventContinueSelected" onState:@"SATVLoginStateMachineStateiTunesAuthentication" withBlock:v43];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10005872C;
  v41[3] = &unk_1000CA3C0;
  objc_copyWeak(&v42, location);
  [v19 registerHandlerForEvent:@"SATVLoginStateMachineEventLoginFailed" onState:@"SATVLoginStateMachineStateiTunesAttemptingLogin" withBlock:v41];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100058770;
  v39[3] = &unk_1000CA3C0;
  objc_copyWeak(&v40, location);
  [v20 registerHandlerForEvent:@"SATVLoginStateMachineEventMenuSelected" onState:@"SATVLoginStateMachineStateiTunesAuthentication" withBlock:v39];

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000587D8;
  v36[3] = &unk_1000CACB0;
  objc_copyWeak(&v38, location);
  v22 = v9;
  id v37 = v22;
  [v21 registerHandlerForEvent:@"SATVLoginStateMachineEventLoginSucceeded" onState:@"SATVLoginStateMachineStateiTunesAttemptingLogin" withBlock:v36];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10005883C;
  v34[3] = &unk_1000CA3C0;
  objc_copyWeak(&v35, location);
  [v23 registerHandlerForEvent:@"SATVLoginStateMachineEventPasswordSettingPromptSelected" onState:@"SATVLoginStateMachineStateiTunesPromptingForPasswordSetting" withBlock:v34];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10005887C;
  v32[3] = &unk_1000CA3C0;
  objc_copyWeak(&v33, location);
  [v24 registerHandlerForEvent:@"SATVLoginStateMachineEventSkipSelected" onState:@"SATVLoginStateMachineStateiTunesAuthentication" withBlock:v32];

  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000588C8;
  v30[3] = &unk_1000CA3C0;
  objc_copyWeak(&v31, location);
  [v25 registerHandlerForEvent:@"SATVLoginStateMachineEventLandedFromMenuAction" onState:@"SATVLoginStateMachineStateLoginComplete" withBlock:v30];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100058984;
  v28[3] = &unk_1000CA3C0;
  objc_copyWeak(&v29, location);
  [v26 registerHandlerForEvent:@"SATVLoginStateMachineEventLandedFromMenuAction" onState:@"SATVLoginStateMachineStateAppleIDPass" withBlock:v28];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v27 setShouldAcceptEvents:1];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);

  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);

  objc_destroyWeak(&v71);
  objc_destroyWeak(location);
}

- (void)_setViewsForInitialState
{
  id v3 = sub_10000D7CC(@"AUTH_APPLE_ID_TITLE", @"Localizable");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 titleLabel]);
  [v6 setText:v4];

  id v7 = sub_10000D7CC(@"AUTH_APPLE_ID_SUBTITLE", @"Localizable");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subtitleLabel]);
  [v10 setText:v8];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 continueButton]);
  id v13 = sub_10000D7CC(@"CONTINUE_BUTTON", @"Localizable");
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setTitle:v14 forState:0];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 useSeparateIDsButton]);
  id v17 = sub_10000D7CC(@"AUTH_USE_DIFFERNT_ID_BUTTON", @"Localizable");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 setTitle:v18 forState:0];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 skipButton]);
  id v21 = sub_10000D7CC(@"AUTH_SKIP_BUTTON", @"Localizable");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v20 setTitle:v22 forState:0];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 continueButton]);
  [v24 setEnabled:0];

  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  [v25 setNeedsLayout];

  if (-[SATVLegacyLoginViewController comingFromTapToSetup](self, "comingFromTapToSetup"))
  {
    -[SATVLegacyLoginViewController setComingFromTapToSetup:](self, "setComingFromTapToSetup:", 0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    unsigned int v27 = [v26 iTunesAndiCloudAccountsMatch];

    v28 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 usernameForActiveAccountType:2]);
    if (v27)
    {
      -[SATVLegacyLoginViewController setAppleIDUsername:](self, "setAppleIDUsername:", v29);
    }

    else
    {
      -[SATVLegacyLoginViewController setICloudUsername:](self, "setICloudUsername:", v29);

      v28 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 usernameForActiveAccountType:1]);
      -[SATVLegacyLoginViewController setITunesUsername:](self, "setITunesUsername:", v29);
    }

    id v30 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
    [v30 postEvent:@"SATVLoginStateMachineEventLandedFromMenuAction"];
  }

- (void)_setControlTargets
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 continueButton]);
  [v4 addTarget:self action:"_continueButtonSelected" forControlEvents:0x2000];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 skipButton]);
  [v6 addTarget:self action:"_skipButtonSelected" forControlEvents:0x2000];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 useSeparateIDsButton]);
  [v7 addTarget:self action:"_useSeparateIDsSelected" forControlEvents:0x2000];
}

- (void)_continueButtonSelected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVLoginStateMachineEventContinueSelected"];
}

- (void)_skipButtonSelected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVLoginStateMachineEventSkipSelected"];
}

- (void)_useSeparateIDsSelected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVLoginStateMachineEventUseSeparateIDsSelected"];
}

- (void)_menuSelected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVLoginStateMachineEventMenuSelected"];
}

- (void)_rememberEmailRecentInput:(id)a3
{
  if (a3) {
    +[TIRecentInputs storeInput:forSystemIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "storeInput:forSystemIdentifier:",  a3,  TIEmailRecentInputIdentifier);
  }
}

- (void)_showActivityIndicator
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100058F44;
  v3[3] = &unk_1000C9468;
  v3[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.3);
}

- (void)_hideActivityIndicator
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLegacyLoginViewController activityIndicatorViewController]( self,  "activityIndicatorViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 alpha];
  double v6 = v5;

  if (v6 > 0.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100059068;
    v7[3] = &unk_1000C9468;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.3);
  }

- (void)_hideLoginView
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100059138;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.3);
}

- (id)_usernameText
{
  return -[SATVAuthenticationView usernameText](self->_authenticationView, "usernameText");
}

- (id)_passwordText
{
  return -[SATVAuthenticationView passwordText](self->_authenticationView, "passwordText");
}

- (void)_clearTextFields
{
}

- (void)_reloadForStateChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController authenticationView](self, "authenticationView"));
  [v3 setNeedsLayout];

  -[SATVLegacyLoginViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)_showAppleIDUsernameScreen
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100059220;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  -[SATVLegacyLoginViewController _crossFadeLoginViewWithChanges:](self, "_crossFadeLoginViewWithChanges:", v2);
}

- (void)_showPasswordSettingPrompt
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeAccount]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 backingAccount]);

  double v6 = -[SATVPasswordSettingPromptViewController initWithAccount:]( objc_alloc(&OBJC_CLASS___SATVPasswordSettingPromptViewController),  "initWithAccount:",  v5);
  objc_initWeak(&location, self);
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  double v10 = sub_1000594A4;
  double v11 = &unk_1000C93A0;
  objc_copyWeak(&v12, &location);
  -[SATVPasswordSettingPromptViewController setCompletionHandler:](v6, "setCompletionHandler:", &v8);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController navigationController](self, "navigationController", v8, v9, v10, v11));
  [v7 pushViewController:v6 animated:1];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_showiTunesUsernameScreen
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100059544;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  -[SATVLegacyLoginViewController _crossFadeLoginViewWithChanges:](self, "_crossFadeLoginViewWithChanges:", v2);
}

- (void)_showiCloudUsernameScreen
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000596F0;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  -[SATVLegacyLoginViewController _crossFadeLoginViewWithChanges:](self, "_crossFadeLoginViewWithChanges:", v2);
}

- (void)_crossFadeLoginViewWithChanges:(id)a3
{
  id v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000598F8;
  v7[3] = &unk_1000C9468;
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005992C;
  v5[3] = &unk_1000CAD00;
  v5[4] = self;
  id v4 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v5,  0.3);
}

- (void)_authenticateAppleIDWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  [v8 setPresentingController:self];

  objc_initWeak(&location, self);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100059B0C;
  v11[3] = &unk_1000CA610;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v9 authenticateAccountType:0 username:v10 password:v7 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_authenticateStoreAccountWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  [v8 setPresentingController:self];

  objc_initWeak(&location, self);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100059C84;
  v11[3] = &unk_1000CA610;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v9 authenticateAccountType:1 username:v10 password:v7 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_authenticateiCloudAccountWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  [v8 setPresentingController:self];

  objc_initWeak(&location, self);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100059DFC;
  v11[3] = &unk_1000CA610;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v9 authenticateAccountType:2 username:v10 password:v7 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_postAuthenticationResults:(BOOL)a3 forEmailAddress:(id)a4
{
  if (a3)
  {
    -[SATVLegacyLoginViewController _rememberEmailRecentInput:](self, "_rememberEmailRecentInput:", a4);
    -[SATVLegacyLoginViewController _postLoginSucceeded](self, "_postLoginSucceeded");
  }

  else
  {
    -[SATVLegacyLoginViewController _postLoginFailed](self, "_postLoginFailed");
  }

- (void)_postLoginFailed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVLoginStateMachineEventLoginFailed"];
}

- (void)_postLoginSucceeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVLoginStateMachineEventLoginSucceeded"];
}

- (void)_loginCompleteWithResult:(unint64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  [v5 setObject:&__kCFBooleanTrue forKey:@"AppleIDPB10Presented"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLegacyLoginViewController completionHandler](self, "completionHandler"));
  if (v6)
  {
    id v7 = (void (**)(id, unint64_t))objc_claimAutoreleasedReturnValue( -[SATVLegacyLoginViewController completionHandler]( self,  "completionHandler"));
    v7[2](v7, a3);
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (TVSStateMachine)loginStateMachine
{
  return self->_loginStateMachine;
}

- (void)setLoginStateMachine:(id)a3
{
}

- (UISystemInputViewController)systemInputViewController
{
  return self->_systemInputViewController;
}

- (void)setSystemInputViewController:(id)a3
{
}

- (SATVAuthenticationView)authenticationView
{
  return self->_authenticationView;
}

- (void)setAuthenticationView:(id)a3
{
}

- (TVSKActivityIndicatorViewController)activityIndicatorViewController
{
  return self->_activityIndicatorViewController;
}

- (void)setActivityIndicatorViewController:(id)a3
{
}

- (NSString)appleIDUsername
{
  return self->_appleIDUsername;
}

- (void)setAppleIDUsername:(id)a3
{
}

- (NSString)iCloudUsername
{
  return self->_iCloudUsername;
}

- (void)setICloudUsername:(id)a3
{
}

- (NSString)iTunesUsername
{
  return self->_iTunesUsername;
}

- (void)setITunesUsername:(id)a3
{
}

- (TVSiCloudAccountManager)iCloudAccountManager
{
  return self->_iCloudAccountManager;
}

- (void)setICloudAccountManager:(id)a3
{
}

- (BOOL)isiCloudLoggedIn
{
  return self->_iCloudLoggedIn;
}

- (void)setICloudLoggedIn:(BOOL)a3
{
  self->_iCloudLoggedIn = a3;
}

- (BOOL)didLoginOrSkipFromAppleID
{
  return self->_didLoginOrSkipFromAppleID;
}

- (void)setDidLoginOrSkipFromAppleID:(BOOL)a3
{
  self->_didLoginOrSkipFromAppleID = a3;
}

- (BOOL)comingFromTapToSetup
{
  return self->_comingFromTapToSetup;
}

- (void)setComingFromTapToSetup:(BOOL)a3
{
  self->_comingFromTapToSetup = a3;
}

- (id)clientMenuHandler
{
  return self->_clientMenuHandler;
}

- (void)setClientMenuHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end