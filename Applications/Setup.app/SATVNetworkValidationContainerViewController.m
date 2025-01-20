@interface SATVNetworkValidationContainerViewController
- (SATVNetworkValidationViewController)networkValidationViewController;
- (TVSKNavigationController)navController;
- (id)completionHandler;
- (id)menuHandler;
- (id)preferredFocusEnvironments;
- (void)autoAdvance;
- (void)setCompletionHandler:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setNavController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVNetworkValidationContainerViewController

- (void)autoAdvance
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationContainerViewController networkValidationViewController]( self,  "networkValidationViewController"));
  [v2 autoAdvance];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVNetworkValidationContainerViewController;
  -[SATVNetworkValidationContainerViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVNetworkValidationContainerViewController networkValidationViewController]( self,  "networkValidationViewController"));
  v4 = -[TVSKNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVSKNavigationController),  "initWithRootViewController:",  v3);
  -[SATVNetworkValidationContainerViewController setNavController:](self, "setNavController:", v4);
  -[SATVNetworkValidationContainerViewController tvsk_addChildViewController:](self, "tvsk_addChildViewController:", v4);
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVNetworkValidationContainerViewController navController](self, "navController"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (SATVNetworkValidationViewController)networkValidationViewController
{
  networkValidationViewController = self->_networkValidationViewController;
  if (!networkValidationViewController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SATVNetworkValidationViewController);
    objc_super v5 = self->_networkValidationViewController;
    self->_networkValidationViewController = v4;

    objc_initWeak(&location, self);
    uint64_t v6 = self->_networkValidationViewController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006BF6C;
    v11[3] = &unk_1000C93A0;
    objc_copyWeak(&v12, &location);
    -[SATVNetworkValidationViewController setMenuHandler:](v6, "setMenuHandler:", v11);
    v7 = self->_networkValidationViewController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006BFC0;
    v9[3] = &unk_1000C93C8;
    objc_copyWeak(&v10, &location);
    -[SATVNetworkValidationViewController setCompletionHandler:](v7, "setCompletionHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    networkValidationViewController = self->_networkValidationViewController;
  }

  return networkValidationViewController;
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