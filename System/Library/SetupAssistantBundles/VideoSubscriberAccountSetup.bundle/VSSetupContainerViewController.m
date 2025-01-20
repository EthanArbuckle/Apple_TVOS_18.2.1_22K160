@interface VSSetupContainerViewController
- (BOOL)_isSetTopBoxSilentSignInAllowed;
- (BOOL)isSetTopBoxSilentSignInInProgress;
- (BOOL)isSetTopBoxSilentSignInPending;
- (BOOL)shouldAutoAdvance;
- (NSData)serializedAccountData;
- (TVSKNavigationController)navController;
- (VSSetupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSSetupViewController)setupViewController;
- (id)_appViewController;
- (id)_setupActivityIndicatorViewController;
- (id)_setupActivityIndicatorViewControllerInNavController;
- (id)_setupViewControllerInNavController;
- (id)completionHandler;
- (id)menuHandler;
- (void)_callCompletionHandlerWithAppInstallResult:(unint64_t)a3;
- (void)_resetSetupViewControllerIfNeededAndPopBackToRootViewController;
- (void)_transitionFromSilentSignInViewControllerToSetupViewController;
- (void)autoAdvance;
- (void)reset;
- (void)setCompletionHandler:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setNavController:(id)a3;
- (void)setSerializedAccountData:(id)a3;
- (void)setSetTopBoxSilentSignInInProgress:(BOOL)a3;
- (void)setSetTopBoxSilentSignInPending:(BOOL)a3;
- (void)setShouldAutoAdvance:(BOOL)a3;
- (void)startSetTopBoxSilentSignIn;
- (void)viewDidLoad;
@end

@implementation VSSetupContainerViewController

- (VSSetupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___VSSetupContainerViewController;
  v8 = -[VSSetupContainerViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___VSSetupViewController);
    setupViewController = v8->_setupViewController;
    v8->_setupViewController = v9;

    objc_initWeak(&location, v8);
    v11 = v8->_setupViewController;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_13B70;
    v16[3] = &unk_25010;
    objc_copyWeak(&v17, &location);
    -[VSSetupViewController setMenuHandler:](v11, "setMenuHandler:", v16);
    v12 = v8->_setupViewController;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_13C30;
    v14[3] = &unk_25010;
    objc_copyWeak(&v15, &location);
    -[VSSetupViewController setCompletionHandler:](v12, "setCompletionHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)setSerializedAccountData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController setupViewController](self, "setupViewController"));
  [v5 setSerializedAccountData:v4];
}

- (NSData)serializedAccountData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController setupViewController](self, "setupViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serializedAccountData]);

  return (NSData *)v3;
}

- (void)startSetTopBoxSilentSignIn
{
  BOOL v3 = -[VSSetupContainerViewController _isSetTopBoxSilentSignInAllowed](self, "_isSetTopBoxSilentSignInAllowed");
  if (v3)
  {
    BOOL v4 = -[VSSetupContainerViewController isSetTopBoxSilentSignInInProgress](self, "isSetTopBoxSilentSignInInProgress");
    if (v4)
    {
      uint64_t v5 = VSDefaultLogObject(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Set-top-box silent sign-in is currently in progress. Will wait until it finishes and then attempt another request.",  (uint8_t *)buf,  2u);
      }

      -[VSSetupContainerViewController setSetTopBoxSilentSignInPending:](self, "setSetTopBoxSilentSignInPending:", 1LL);
    }

    else
    {
      if (-[VSSetupContainerViewController isViewLoaded](self, "isViewLoaded"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[VSSetupContainerViewController _setupActivityIndicatorViewController]( self,  "_setupActivityIndicatorViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController navController](self, "navController"));
        [v10 pushViewController:v9 animated:1];
      }

      -[VSSetupContainerViewController setSetTopBoxSilentSignInPending:](self, "setSetTopBoxSilentSignInPending:", 0LL);
      -[VSSetupContainerViewController setSetTopBoxSilentSignInInProgress:]( self,  "setSetTopBoxSilentSignInInProgress:",  1LL);
      objc_initWeak(buf, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController setupViewController](self, "setupViewController"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_13F10;
      v12[3] = &unk_25010;
      objc_copyWeak(&v13, buf);
      [v11 startSetTopBoxSilentSignInWithCompletionHandler:v12];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
  }

  else
  {
    uint64_t v7 = VSDefaultLogObject(v3);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Ignoring set-top-box silent sign-in request as we have already started showing the setup view controller",  (uint8_t *)buf,  2u);
    }
  }

- (void)autoAdvance
{
  if (!-[VSSetupContainerViewController isSetTopBoxSilentSignInInProgress](self, "isSetTopBoxSilentSignInInProgress")) {
    -[VSSetupContainerViewController _callCompletionHandlerWithAppInstallResult:]( self,  "_callCompletionHandlerWithAppInstallResult:",  0LL);
  }
}

- (void)reset
{
  uint64_t v3 = VSDefaultLogObject(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[VSSetupContainerViewController reset]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  -[VSSetupContainerViewController setShouldAutoAdvance:](self, "setShouldAutoAdvance:", 0LL);
  uint64_t v5 = VSDefaultLogObject( -[VSSetupContainerViewController _resetSetupViewControllerIfNeededAndPopBackToRootViewController]( self,  "_resetSetupViewControllerIfNeededAndPopBackToRootViewController"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[VSSetupContainerViewController reset]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Will exit %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___VSSetupContainerViewController;
  -[VSSetupContainerViewController viewDidLoad](&v24, "viewDidLoad");
  if (-[VSSetupContainerViewController isSetTopBoxSilentSignInInProgress](self, "isSetTopBoxSilentSignInInProgress")) {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( -[VSSetupContainerViewController _setupActivityIndicatorViewController]( self,  "_setupActivityIndicatorViewController"));
  }
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController setupViewController](self, "setupViewController"));
  }
  v23 = (void *)v3;
  BOOL v4 = -[TVSKNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVSKNavigationController),  "initWithRootViewController:",  v3);
  navController = self->_navController;
  self->_navController = v4;

  -[VSSetupContainerViewController addChildViewController:](self, "addChildViewController:", self->_navController);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController view](self, "view"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKNavigationController view](self->_navController, "view"));
  [v6 addSubview:v7];

  -[TVSKNavigationController didMoveToParentViewController:]( self->_navController,  "didMoveToParentViewController:",  self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKNavigationController view](self->_navController, "view"));
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 topAnchor]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v21]);
  v25[0] = v20;
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v9 rightAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 rightAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v18]);
  v25[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bottomAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 bottomAnchor]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v25[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 leftAnchor]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 leftAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
  v25[3] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v17);
}

- (BOOL)_isSetTopBoxSilentSignInAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[VSSetupContainerViewController _setupViewControllerInNavController]( self,  "_setupViewControllerInNavController"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (void)_transitionFromSilentSignInViewControllerToSetupViewController
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController setupViewController](self, "setupViewController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController navController](self, "navController"));
  [v3 replaceContentViewControllersWithViewController:v4];
}

- (id)_setupActivityIndicatorViewController
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___VSSetupActivityIndicatorViewController);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_14538;
  v5[3] = &unk_25010;
  objc_copyWeak(&v6, &location);
  -[VSSetupActivityIndicatorViewController setMenuHandler:](v3, "setMenuHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_setupActivityIndicatorViewControllerInNavController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController navController](self, "navController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootContentViewController]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___VSSetupActivityIndicatorViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_setupViewControllerInNavController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController navController](self, "navController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootContentViewController]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___VSSetupViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_appViewController
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderAppSetupViewController);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1477C;
  v7[3] = &unk_25010;
  objc_copyWeak(&v8, &location);
  -[VSIdentityProviderAppSetupViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_147AC;
  v5[3] = &unk_25038;
  objc_copyWeak(&v6, &location);
  -[VSIdentityProviderAppSetupViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v3;
}

- (void)_resetSetupViewControllerIfNeededAndPopBackToRootViewController
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[VSSetupContainerViewController _setupViewControllerInNavController]( self,  "_setupViewControllerInNavController"));
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = VSDefaultLogObject(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Resetting info for %@", (uint8_t *)&v10, 0xCu);
    }

    [v4 reset];
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupContainerViewController navController](self, "navController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rootContentViewController]);
  id v9 = [v7 popToViewController:v8 animated:1];
}

- (void)_callCompletionHandlerWithAppInstallResult:(unint64_t)a3
{
  id v8 = (void (**)(id, void *, unint64_t))objc_claimAutoreleasedReturnValue( -[VSSetupContainerViewController completionHandler]( self,  "completionHandler"));
  if (v8)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSAccountStore sharedAccountStore](&OBJC_CLASS___VSAccountStore, "sharedAccountStore"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstAccount]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identityProviderID]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);

    v8[2](v8, v7, a3);
  }
}

- (id)menuHandler
{
  return self->_menuHandler;
}

- (void)setMenuHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (VSSetupViewController)setupViewController
{
  return self->_setupViewController;
}

- (BOOL)shouldAutoAdvance
{
  return self->_shouldAutoAdvance;
}

- (void)setShouldAutoAdvance:(BOOL)a3
{
  self->_shouldAutoAdvance = a3;
}

- (BOOL)isSetTopBoxSilentSignInInProgress
{
  return self->_setTopBoxSilentSignInInProgress;
}

- (void)setSetTopBoxSilentSignInInProgress:(BOOL)a3
{
  self->_setTopBoxSilentSignInInProgress = a3;
}

- (BOOL)isSetTopBoxSilentSignInPending
{
  return self->_setTopBoxSilentSignInPending;
}

- (void)setSetTopBoxSilentSignInPending:(BOOL)a3
{
  self->_setTopBoxSilentSignInPending = a3;
}

- (TVSKNavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end