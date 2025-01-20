@interface SATVActivationContainerViewController
- (SATVActivationViewController)activationViewController;
- (TVSKNavigationController)navController;
- (id)completionHandler;
- (id)menuHandler;
- (void)_callCompletionHandlerWithSuccess:(BOOL)a3 shouldFinishSetup:(BOOL)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setNavController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVActivationContainerViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVActivationContainerViewController;
  -[SATVActivationContainerViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationContainerViewController activationViewController](self, "activationViewController"));
  v4 = -[TVSKNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVSKNavigationController),  "initWithRootViewController:",  v3);
  -[SATVActivationContainerViewController setNavController:](self, "setNavController:", v4);
  -[SATVActivationContainerViewController addChildViewController:](self, "addChildViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationContainerViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKNavigationController view](v4, "view"));
  [v5 addSubview:v6];

  -[TVSKNavigationController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
}

- (SATVActivationViewController)activationViewController
{
  activationViewController = self->_activationViewController;
  if (!activationViewController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SATVActivationViewController);
    v5 = self->_activationViewController;
    self->_activationViewController = v4;

    objc_initWeak(&location, self);
    v6 = self->_activationViewController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000698BC;
    v11[3] = &unk_1000C93A0;
    objc_copyWeak(&v12, &location);
    -[SATVActivationViewController setMenuHandler:](v6, "setMenuHandler:", v11);
    objc_super v7 = self->_activationViewController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006991C;
    v9[3] = &unk_1000CAF80;
    objc_copyWeak(&v10, &location);
    -[SATVActivationViewController setCompletionHandler:](v7, "setCompletionHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    activationViewController = self->_activationViewController;
  }

  return activationViewController;
}

- (void)_callCompletionHandlerWithSuccess:(BOOL)a3 shouldFinishSetup:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationContainerViewController completionHandler](self, "completionHandler"));

  if (v7)
  {
    v8 = (void (**)(id, BOOL, BOOL))objc_claimAutoreleasedReturnValue( -[SATVActivationContainerViewController completionHandler]( self,  "completionHandler"));
    v8[2](v8, v5, v4);
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