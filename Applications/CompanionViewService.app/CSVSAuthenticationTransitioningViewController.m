@interface CSVSAuthenticationTransitioningViewController
+ (double)defaultSpecifiedWidth;
- (BOOL)cardIsPresented;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CSVSAuthenticationInfo)authenticationInfo;
- (CSVSUISceneTransitionManager)sceneTransitionManager;
- (NSArray)orderedCustomAuthenticationActions;
- (UIGestureRecognizer)dismissCurrentCardRecognizer;
- (UIView)cardContainerView;
- (UIView)containerView;
- (id)_learnMoreAction;
- (id)sceneIdentifierForState:(int64_t)a3;
- (void)_dismissCurrentCard:(id)a3;
- (void)configureHierarchy;
- (void)configureSceneTransitionManager;
- (void)performQRCodeTransition;
- (void)performSessionCompletedTransitionWithError:(id)a3;
- (void)performStartedAuthenticationWithDevice:(id)a3;
- (void)performTappedNotificationTransitionWithDevice:(id)a3;
- (void)reset;
- (void)setAuthenticationInfo:(id)a3;
- (void)setCardContainerView:(id)a3;
- (void)setCardIsPresented:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setOrderedCustomAuthenticationActions:(id)a3;
- (void)setSceneTransitionManager:(id)a3;
- (void)transitionToNextState;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CSVSAuthenticationTransitioningViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationTransitioningViewController;
  -[CSVSAuthenticationTransitioningViewController viewDidLoad](&v7, "viewDidLoad");
  -[CSVSAuthenticationTransitioningViewController configureHierarchy](self, "configureHierarchy");
  -[CSVSAuthenticationTransitioningViewController configureSceneTransitionManager]( self,  "configureSceneTransitionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController sceneTransitionManager](self, "sceneTransitionManager"));
  [v3 transitionToSceneWithIdentifier:@"initial" animated:0];

  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_dismissCurrentCard:");
  dismissCurrentCardRecognizer = self->_dismissCurrentCardRecognizer;
  self->_dismissCurrentCardRecognizer = &v4->super;

  -[UIGestureRecognizer setAllowedPressTypes:]( self->_dismissCurrentCardRecognizer,  "setAllowedPressTypes:",  &off_100026418);
  -[UIGestureRecognizer setDelegate:](self->_dismissCurrentCardRecognizer, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self, "view"));
  [v6 addGestureRecognizer:self->_dismissCurrentCardRecognizer];
}

+ (double)defaultSpecifiedWidth
{
  return 960.0;
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationTransitioningViewController;
  -[CSVSAuthenticationTransitioningViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 * 0.5;
  unsigned int v9 = -[CSVSAuthenticationTransitioningViewController cardIsPresented](self, "cardIsPresented");
  double v10 = v7 + 575.0;
  if (v9) {
    double v10 = -0.0;
  }
  double v11 = v7 * 0.5 + v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController cardContainerView](self, "cardContainerView"));
  objc_msgSend(v12, "setCenter:", v8, v11);
}

- (void)configureHierarchy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self, "view"));
  v3 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v19 = v2;
  [v2 addSubview:v3];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToConstant:575.0]);
  v21[0] = v17;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3, "widthAnchor"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToConstant:530.0]);
  v21[1] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v2 centerXAnchor]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  v21[2] = v8;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3, "centerYAnchor"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v2 centerYAnchor]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10]);
  v21[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);

  objc_super v13 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, 530.0, 575.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 colorWithAlphaComponent:0.1]);
  -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v15);

  -[UIView _setContinuousCornerRadius:](v13, "_setContinuousCornerRadius:", 50.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController view](self, "view"));
  [v16 addSubview:v13];

  -[CSVSAuthenticationTransitioningViewController setContainerView:](self, "setContainerView:", v3);
  -[CSVSAuthenticationTransitioningViewController setCardContainerView:](self, "setCardContainerView:", v13);
}

- (void)configureSceneTransitionManager
{
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController containerView](self, "containerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController cardContainerView](self, "cardContainerView"));
  v2 = objc_alloc(&OBJC_CLASS___CSVSUIScene);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___CSVSAuthenticationMenuViewController);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100015764;
  v55[3] = &unk_100024A48;
  objc_copyWeak(&v56, &location);
  v39 = -[CSVSUIScene initWithViewControllerClass:containerView:identifier:setupHandler:]( v2,  "initWithViewControllerClass:containerView:identifier:setupHandler:",  v3,  v34,  @"initial",  v55);
  double v4 = objc_alloc(&OBJC_CLASS___CSVSUIScene);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CSVSAuthenticationProgressViewController);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100015824;
  v53[3] = &unk_100024A48;
  objc_copyWeak(&v54, &location);
  v37 = -[CSVSUIScene initWithViewControllerClass:containerView:identifier:setupHandler:]( v4,  "initWithViewControllerClass:containerView:identifier:setupHandler:",  v5,  v40,  @"awaiting-companion-auth",  v53);
  double v6 = objc_alloc(&OBJC_CLASS___CSVSUIScene);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CSVSAuthenticationProgressViewController);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000158AC;
  v51[3] = &unk_100024A48;
  objc_copyWeak(&v52, &location);
  v36 = -[CSVSUIScene initWithViewControllerClass:containerView:identifier:setupHandler:]( v6,  "initWithViewControllerClass:containerView:identifier:setupHandler:",  v7,  v40,  @"confirm-on-companion",  v51);
  double v8 = objc_alloc(&OBJC_CLASS___CSVSUIScene);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___CSVSAuthenticationProgressViewController);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100015934;
  v49[3] = &unk_100024A48;
  objc_copyWeak(&v50, &location);
  v35 = -[CSVSUIScene initWithViewControllerClass:containerView:identifier:setupHandler:]( v8,  "initWithViewControllerClass:containerView:identifier:setupHandler:",  v9,  v40,  @"confirming-on-companion",  v49);
  double v10 = objc_alloc(&OBJC_CLASS___CSVSUIScene);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___CSVSAuthenticationProgressViewController);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000159BC;
  v47[3] = &unk_100024A48;
  objc_copyWeak(&v48, &location);
  v33 = -[CSVSUIScene initWithViewControllerClass:containerView:identifier:setupHandler:]( v10,  "initWithViewControllerClass:containerView:identifier:setupHandler:",  v11,  v40,  @"confirmed-on-companion",  v47);
  v12 = objc_alloc(&OBJC_CLASS___CSVSUIScene);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___CSVSAuthenticationProgressViewController);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100015A44;
  v45[3] = &unk_100024A48;
  objc_copyWeak(&v46, &location);
  v14 = -[CSVSUIScene initWithViewControllerClass:containerView:identifier:setupHandler:]( v12,  "initWithViewControllerClass:containerView:identifier:setupHandler:",  v13,  v40,  @"qr-code",  v45);
  v71[0] = v39;
  v71[1] = v37;
  v71[2] = v36;
  v71[3] = v35;
  v71[4] = v33;
  v71[5] = v14;
  v32 = v14;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 6LL));
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForAppearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForAppearingScene:atomic:identifier:",  v39,  1LL,  @"menu-appear"));
  v58 = v29;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100015ACC;
  v43[3] = &unk_100024A70;
  objc_copyWeak(&v44, &location);
  uint64_t v59 = objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition transitionForAppearingScene:atomic:identifier:handler:]( &OBJC_CLASS___CSVSUISceneTransition,  "transitionForAppearingScene:atomic:identifier:handler:",  v39,  1LL,  @"card-disappear",  v43));
  v27 = (void *)v59;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForDisappearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForDisappearingScene:atomic:identifier:",  v39,  1LL,  @"menu-disappear"));
  v60 = v28;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100015B5C;
  v41[3] = &unk_100024A70;
  objc_copyWeak(&v42, &location);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition transitionForDisappearingScene:atomic:identifier:handler:]( &OBJC_CLASS___CSVSUISceneTransition,  "transitionForDisappearingScene:atomic:identifier:handler:",  v39,  0LL,  @"card-appear",  v41));
  v61 = v31;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForAppearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForAppearingScene:atomic:identifier:",  v37,  1LL,  0LL));
  v62 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForDisappearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForDisappearingScene:atomic:identifier:",  v37,  1LL,  0LL));
  v63 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForAppearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForAppearingScene:atomic:identifier:",  v36,  1LL,  @"confirm-appear"));
  v64 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition transitionForDisappearingScene:atomic:identifier:handler:]( &OBJC_CLASS___CSVSUISceneTransition,  "transitionForDisappearingScene:atomic:identifier:handler:",  v36,  1LL,  @"confirm-disappear",  &stru_100024AB0));
  v65 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition transitionForAppearingScene:atomic:identifier:handler:]( &OBJC_CLASS___CSVSUISceneTransition,  "transitionForAppearingScene:atomic:identifier:handler:",  v35,  1LL,  @"confirming-appear",  &stru_100024AD0));
  v66 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition transitionForDisappearingScene:atomic:identifier:handler:]( &OBJC_CLASS___CSVSUISceneTransition,  "transitionForDisappearingScene:atomic:identifier:handler:",  v35,  1LL,  @"confirming-disappear",  &stru_100024AF0));
  v67 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForAppearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForAppearingScene:atomic:identifier:",  v33,  1LL,  0LL));
  v68 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForAppearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForAppearingScene:atomic:identifier:",  v32,  1LL,  0LL));
  v69 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSVSUISceneTransition standardTransitionForDisappearingScene:atomic:identifier:]( &OBJC_CLASS___CSVSUISceneTransition,  "standardTransitionForDisappearingScene:atomic:identifier:",  v32,  1LL,  0LL));
  v70 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 13LL));

  v25 = -[CSVSUISceneTransitionManager initWithContainerViewController:containerView:scenes:transitions:]( objc_alloc(&OBJC_CLASS___CSVSUISceneTransitionManager),  "initWithContainerViewController:containerView:scenes:transitions:",  self,  v34,  v30,  v24);
  -[CSVSAuthenticationTransitioningViewController setSceneTransitionManager:](self, "setSceneTransitionManager:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationTransitioningViewController sceneTransitionManager]( self,  "sceneTransitionManager"));
  [v26 setPropertyAnimatorProvider:&stru_100024B30];

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);

  objc_destroyWeak(&location);
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationTransitioningViewController sceneIdentifierForState:]( self,  "sceneIdentifierForState:",  a3));
  if (v7)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationTransitioningViewController sceneTransitionManager]( self,  "sceneTransitionManager"));
    [v6 transitionToSceneWithIdentifier:v7 animated:v4];
  }
}

- (void)transitionToNextState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController sceneTransitionManager](self, "sceneTransitionManager"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 activeScene]);

  if (v7
    && (BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]),
        unsigned int v5 = [v4 isEqualToString:@"confirmed-on-companion"],
        v4,
        v5))
  {
    -[CSVSAuthenticationTransitioningViewController reset](self, "reset");
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationTransitioningViewController sceneTransitionManager]( self,  "sceneTransitionManager"));
    [v6 transitionToNextSceneAnimated:1];
  }
}

- (id)sceneIdentifierForState:(int64_t)a3
{
  else {
    return *(&off_100024B50 + a3);
  }
}

- (void)reset
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController sceneTransitionManager](self, "sceneTransitionManager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeScene]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewController]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 view]);

  [v7 removeFromSuperview];
  -[CSVSAuthenticationTransitioningViewController configureSceneTransitionManager]( self,  "configureSceneTransitionManager");
  -[CSVSAuthenticationTransitioningViewController setCardIsPresented:](self, "setCardIsPresented:", 0LL);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController sceneTransitionManager](self, "sceneTransitionManager"));
  [v6 transitionToSceneWithIdentifier:@"initial" animated:0];
}

- (void)performTappedNotificationTransitionWithDevice:(id)a3
{
  id v4 = a3;
  authenticationInfo = self->_authenticationInfo;
  if (authenticationInfo)
  {
    id v9 = v4;
    double v6 = (CSVSAuthenticationInfo *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationInfo infoWithDevice:]( authenticationInfo,  "infoWithDevice:",  v4));
    id v7 = self->_authenticationInfo;
    self->_authenticationInfo = v6;

    -[CSVSAuthenticationTransitioningViewController transitionToState:animated:]( self,  "transitionToState:animated:",  2LL,  1LL);
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_authenticationInfo != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000176BC();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)performStartedAuthenticationWithDevice:(id)a3
{
  id v4 = a3;
  authenticationInfo = self->_authenticationInfo;
  if (authenticationInfo)
  {
    id v9 = v4;
    double v6 = (CSVSAuthenticationInfo *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationInfo infoWithDevice:]( authenticationInfo,  "infoWithDevice:",  v4));
    id v7 = self->_authenticationInfo;
    self->_authenticationInfo = v6;

    -[CSVSAuthenticationTransitioningViewController transitionToState:animated:]( self,  "transitionToState:animated:",  3LL,  1LL);
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_authenticationInfo != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017764();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)performSessionCompletedTransitionWithError:(id)a3
{
  id v4 = a3;
  authenticationInfo = self->_authenticationInfo;
  if (authenticationInfo)
  {
    id v9 = v4;
    double v6 = (CSVSAuthenticationInfo *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationInfo infoWithError:](authenticationInfo, "infoWithError:", v4));
    id v7 = self->_authenticationInfo;
    self->_authenticationInfo = v6;

    -[CSVSAuthenticationTransitioningViewController transitionToState:animated:]( self,  "transitionToState:animated:",  4LL,  1LL);
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_authenticationInfo != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001780C();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)performQRCodeTransition
{
  if (self->_authenticationInfo)
  {
    -[CSVSAuthenticationTransitioningViewController transitionToState:animated:]( self,  "transitionToState:animated:",  5LL,  1LL);
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_authenticationInfo != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000178B4();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

- (id)_learnMoreAction
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationTransitioningViewController authenticationInfo](self, "authenticationInfo"));
  id v4 = sub_1000072BC((uint64_t)[v3 authenticationKind]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100016748;
  v8[3] = &unk_100024598;
  objc_copyWeak(&v9, &location);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v5,  0LL,  0LL,  v8));
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (void)_dismissCurrentCard:(id)a3
{
  if ([a3 state] == (id)3) {
    -[CSVSAuthenticationTransitioningViewController transitionToState:animated:]( self,  "transitionToState:animated:",  0LL,  1LL);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_dismissCurrentCardRecognizer != a3) {
    return 1;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager activeScene](self->_sceneTransitionManager, "activeScene"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  if ([v6 isEqualToString:@"awaiting-companion-auth"])
  {
    unsigned __int8 v3 = 1;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUISceneTransitionManager activeScene](self->_sceneTransitionManager, "activeScene"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    unsigned __int8 v3 = [v8 isEqualToString:@"qr-code"];
  }

  return v3;
}

- (CSVSAuthenticationInfo)authenticationInfo
{
  return self->_authenticationInfo;
}

- (void)setAuthenticationInfo:(id)a3
{
}

- (NSArray)orderedCustomAuthenticationActions
{
  return self->_orderedCustomAuthenticationActions;
}

- (void)setOrderedCustomAuthenticationActions:(id)a3
{
}

- (CSVSUISceneTransitionManager)sceneTransitionManager
{
  return self->_sceneTransitionManager;
}

- (void)setSceneTransitionManager:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)cardContainerView
{
  return self->_cardContainerView;
}

- (void)setCardContainerView:(id)a3
{
}

- (BOOL)cardIsPresented
{
  return self->_cardIsPresented;
}

- (void)setCardIsPresented:(BOOL)a3
{
  self->_cardIsPresented = a3;
}

- (UIGestureRecognizer)dismissCurrentCardRecognizer
{
  return self->_dismissCurrentCardRecognizer;
}

- (void).cxx_destruct
{
}

  ;
}

@end