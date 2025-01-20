@interface SATVCloudLoginViewController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSString)customPrompt;
- (NSString)organizationName;
- (NSString)password;
- (NSString)username;
- (SATVCloudLoginViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SATVLoginView)loginView;
- (TVSKActivityIndicatorViewController)activityIndicatorViewController;
- (TVSStateMachine)loginStateMachine;
- (UISystemInputViewController)systemInputViewController;
- (id)_textFieldText;
- (id)preferredFocusEnvironments;
- (void)_authenticateWithUsername:(id)a3 password:(id)a4;
- (void)_clearTextField;
- (void)_continueButtonSelected;
- (void)_crossFadeLoginViewWithChanges:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)_hideActivityIndicator;
- (void)_hideLoginView;
- (void)_menuSelected;
- (void)_registerStateMachineEvents;
- (void)_reloadForStateChange;
- (void)_setControlTargets;
- (void)_setPasswordPlaceholder;
- (void)_setTextFieldText:(id)a3;
- (void)_setUsernamePlaceholder;
- (void)_setViewsForInitialState;
- (void)_setupSystemInputViewController;
- (void)_showActivityIndicator;
- (void)_showPasswordScreen;
- (void)_showUsernameScreen;
- (void)_textDidChange;
- (void)_updatePreferredFocusedViewForGridLayoutGuide;
- (void)loadView;
- (void)setActivityIndicatorViewController:(id)a3;
- (void)setCustomPrompt:(id)a3;
- (void)setLoginStateMachine:(id)a3;
- (void)setLoginView:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSystemInputViewController:(id)a3;
- (void)setUsername:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVCloudLoginViewController

- (SATVCloudLoginViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVCloudLoginViewController;
  v4 = -[SATVCloudLoginViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[TVSStateMachine initWithName:initialState:mode:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:",  @"SATVCloudLoginStateMachine",  @"SATVCloudLoginStateUsername",  0LL);
    loginStateMachine = v4->_loginStateMachine;
    v4->_loginStateMachine = v5;

    v7 = v4->_loginStateMachine;
    if (qword_100109A58 != -1) {
      dispatch_once(&qword_100109A58, &stru_1000CB220);
    }
    -[TVSStateMachine setLogObject:](v7, "setLogObject:", qword_100109A50);
  }

  return v4;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 nextFocusedView]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textField]);
  BOOL v7 = v4 != v6;

  return v7;
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVCloudLoginViewController;
  -[SATVCloudLoginViewController loadView](&v13, "loadView");
  v3 = objc_alloc(&OBJC_CLASS___SATVLoginView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController view](self, "view"));
  [v4 bounds];
  v5 = -[SATVLoginView initWithFrame:](v3, "initWithFrame:");
  loginView = self->_loginView;
  self->_loginView = v5;

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController view](self, "view"));
  [v7 addSubview:self->_loginView];

  v8 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
  activityIndicatorViewController = self->_activityIndicatorViewController;
  self->_activityIndicatorViewController = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v10 setAlpha:0.0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v11 addSubview:v12];

  -[SATVCloudLoginViewController addChildViewController:]( self,  "addChildViewController:",  self->_activityIndicatorViewController);
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVCloudLoginViewController;
  -[SATVCloudLoginViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___UITapGestureRecognizer);
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1000D1100);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  -[UITapGestureRecognizer addTarget:action:](v3, "addTarget:action:", self, "_menuSelected");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 textField]);
  [v6 addTarget:self action:"_textDidChange" forControlEvents:0x20000];

  -[SATVCloudLoginViewController _registerStateMachineEvents](self, "_registerStateMachineEvents");
  -[SATVCloudLoginViewController _setViewsForInitialState](self, "_setViewsForInitialState");
  -[SATVCloudLoginViewController _setControlTargets](self, "_setControlTargets");
  BOOL v7 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_doneButtonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v7, "setAllowedPressTypes:", &off_1000D1118);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &__NSArray0__struct);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController view](self, "view"));
  [v8 addGestureRecognizer:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVCloudLoginViewController;
  -[SATVCloudLoginViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[SATVCloudLoginViewController _setupSystemInputViewController](self, "_setupSystemInputViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v4 setShouldAcceptEvents:1];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVCloudLoginViewController;
  -[SATVCloudLoginViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[SATVCloudLoginViewController activityIndicatorViewController]( self,  "activityIndicatorViewController"));
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController systemInputViewController](self, "systemInputViewController"));
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

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 1;
}

- (void)_doneButtonPressed:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView continueButton](self->_loginView, "continueButton", a3));
  unsigned int v5 = [v4 isEnabled];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVLoginView continueButton](self->_loginView, "continueButton"));
    [v6 sendActionsForControlEvents:0x2000];
  }

- (void)_setupSystemInputViewController
{
  systemInputViewController = self->_systemInputViewController;
  if (systemInputViewController)
  {
    -[UISystemInputViewController willMoveToParentViewController:]( systemInputViewController,  "willMoveToParentViewController:",  0LL);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
    [v4 removeFromSuperview];

    -[UISystemInputViewController removeFromParentViewController]( self->_systemInputViewController,  "removeFromParentViewController");
    unsigned int v5 = self->_systemInputViewController;
    self->_systemInputViewController = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView textField](self->_loginView, "textField"));
  double v7 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue( +[UISystemInputViewController systemInputViewControllerForResponder:editorView:containingResponder:]( &OBJC_CLASS___UISystemInputViewController,  "systemInputViewControllerForResponder:editorView:containingResponder:",  v6,  0LL,  self));
  double v8 = self->_systemInputViewController;
  self->_systemInputViewController = v7;

  id v9 = -[UISystemInputViewController supportsTouchInput](self->_systemInputViewController, "supportsTouchInput");
  loginView = self->_loginView;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UISystemInputViewController view](self->_systemInputViewController, "view"));
  -[SATVLoginView setSystemInputView:touchInputEnabled:](loginView, "setSystemInputView:touchInputEnabled:", v11, v9);

  if ((v9 & 1) == 0)
  {
    v12 = self->_loginView;
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView skipButton](v12, "skipButton"));
    -[SATVLoginView setPreferredFocusedEnvironmentForGridLayoutGuide:]( v12,  "setPreferredFocusedEnvironmentForGridLayoutGuide:",  v13);
  }

  -[SATVCloudLoginViewController addChildViewController:]( self,  "addChildViewController:",  self->_systemInputViewController);
}

- (void)_registerStateMachineEvents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100074A24;
  v13[3] = &unk_1000CA3C0;
  objc_copyWeak(&v14, &location);
  [v3 registerHandlerForEvent:@"SATVCloudLoginEventMenuSelected" onState:@"SATVCloudLoginStateUsername" withBlock:v13];

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100074A7C;
  v11[3] = &unk_1000CA3C0;
  objc_copyWeak(&v12, &location);
  [v4 registerHandlerForEvent:@"SATVCloudLoginEventContinueSelected" onState:@"SATVCloudLoginStateUsername" withBlock:v11];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100074AD8;
  v9[3] = &unk_1000CA3C0;
  objc_copyWeak(&v10, &location);
  [v5 registerHandlerForEvent:@"SATVCloudLoginEventContinueSelected" onState:@"SATVCloudLoginStatePassword" withBlock:v9];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100074B6C;
  v7[3] = &unk_1000CA3C0;
  objc_copyWeak(&v8, &location);
  [v6 registerHandlerForEvent:@"SATVCloudLoginEventMenuSelected" onState:@"SATVCloudLoginStatePassword" withBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_setViewsForInitialState
{
  id v3 = sub_10000D7CC(@"CLOUD_CONFIG_LOGIN_TITLE", @"Localizable");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 titleLabel]);
  [v6 setText:v4];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController customPrompt](self, "customPrompt"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController customPrompt](self, "customPrompt"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subtitleLabel]);
    [v10 setText:v8];
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController organizationName](self, "organizationName"));
    id v12 = [v11 length];

    if (!v12)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
      [v9 setText:&stru_1000CB560];
      goto LABEL_6;
    }

    id v13 = sub_10000D7CC(@"CLOUD_CONFIG_LOGIN_PROMPT_%@", @"Localizable");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController organizationName](self, "organizationName"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 subtitleLabel]);
    [v15 setText:v10];
  }

LABEL_6:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 continueButton]);
  id v18 = sub_10000D7CC(@"CONTINUE_BUTTON", @"Localizable");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v17 setTitle:v19 forState:0];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 useSeparateIDsButton]);
  [v21 setHidden:1];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 skipButton]);
  [v23 setHidden:1];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 textField]);
  [v25 setKeyboardType:7];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 continueButton]);
  [v27 setEnabled:0];

  -[SATVCloudLoginViewController _setUsernamePlaceholder](self, "_setUsernamePlaceholder");
  id v28 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  [v28 setNeedsLayout];
}

- (void)_setControlTargets
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 continueButton]);
  [v3 addTarget:self action:"_continueButtonSelected" forControlEvents:0x2000];
}

- (void)_continueButtonSelected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVCloudLoginEventContinueSelected"];
}

- (void)_menuSelected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginStateMachine](self, "loginStateMachine"));
  [v2 postEvent:@"SATVCloudLoginEventMenuSelected"];
}

- (void)_textDidChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textField]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  BOOL v6 = [v5 length] != 0;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 continueButton]);
  [v8 setEnabled:v6];

  -[SATVCloudLoginViewController _updatePreferredFocusedViewForGridLayoutGuide]( self,  "_updatePreferredFocusedViewForGridLayoutGuide");
}

- (void)_updatePreferredFocusedViewForGridLayoutGuide
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textField]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  id v6 = [v5 length];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 continueButton]);
  [(id)v8 setEnabled:v6 != 0];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController systemInputViewController](self, "systemInputViewController"));
  LOBYTE(v8) = [v9 supportsTouchInput];

  if ((v8 & 1) == 0 && v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 continueButton]);
    [v10 setPreferredFocusedEnvironmentForGridLayoutGuide:v12];
  }

  -[SATVCloudLoginViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)_showActivityIndicator
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075130;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.3);
}

- (void)_hideActivityIndicator
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVCloudLoginViewController activityIndicatorViewController]( self,  "activityIndicatorViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 alpha];
  double v6 = v5;

  if (v6 > 0.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100075248;
    v7[3] = &unk_1000C9468;
    void v7[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.3);
  }

- (void)_hideLoginView
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075318;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.3);
}

- (id)_textFieldText
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 textField]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);
  id v5 = [v4 copy];

  return v5;
}

- (void)_clearTextField
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 textField]);
  [v2 setText:&stru_1000CB560];
}

- (void)_setTextFieldText:(id)a3
{
  id v6 = [a3 copy];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 textField]);
  [v5 setText:v6];
}

- (void)_reloadForStateChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 textField]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  BOOL v6 = [v5 length] != 0;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 continueButton]);
  [v8 setEnabled:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController systemInputViewController](self, "systemInputViewController"));
  [v9 reloadInputViewsForPersistentDelegate];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  [v10 setNeedsLayout];

  -[SATVCloudLoginViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)_showUsernameScreen
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075574;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  -[SATVCloudLoginViewController _crossFadeLoginViewWithChanges:](self, "_crossFadeLoginViewWithChanges:", v2);
}

- (void)_showPasswordScreen
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100075840;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  -[SATVCloudLoginViewController _crossFadeLoginViewWithChanges:](self, "_crossFadeLoginViewWithChanges:", v2);
}

- (void)_setPasswordPlaceholder
{
  id v3 = sub_10000D7CC(@"CLOUD_CONFIG_PASSWORD_TITLE", @"Localizable");
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 textField]);
  [v5 setPlaceholder:v6];
}

- (void)_setUsernamePlaceholder
{
  id v3 = sub_10000D7CC(@"CLOUD_CONFIG_LOGIN_USERNAME", @"Localizable");
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController loginView](self, "loginView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 textField]);
  [v5 setPlaceholder:v6];
}

- (void)_crossFadeLoginViewWithChanges:(id)a3
{
  id v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100075B94;
  v7[3] = &unk_1000C9468;
  void v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100075BC8;
  v5[3] = &unk_1000CAD00;
  v5[4] = self;
  id v4 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v5,  0.3);
}

- (void)_authenticateWithUsername:(id)a3 password:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudLoginViewController navigationController](self, "navigationController", a3, a4));
  id v4 = [v5 popViewControllerAnimated:1];
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)customPrompt
{
  return self->_customPrompt;
}

- (void)setCustomPrompt:(id)a3
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

- (SATVLoginView)loginView
{
  return self->_loginView;
}

- (void)setLoginView:(id)a3
{
}

- (TVSKActivityIndicatorViewController)activityIndicatorViewController
{
  return self->_activityIndicatorViewController;
}

- (void)setActivityIndicatorViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end