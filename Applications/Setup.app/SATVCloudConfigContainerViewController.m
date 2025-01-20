@interface SATVCloudConfigContainerViewController
- (SATVCloudConfigViewController)_cloudConfigViewController;
- (SATVLoadingCloudConfigViewController)_loadingCloudConfigViewController;
- (TVSKNavigationController)navController;
- (id)cloudConfigFetchFailureHandler;
- (id)completionHandler;
- (id)menuHandler;
- (void)_callCompletionHandler;
- (void)autoAdvance;
- (void)setCloudConfigFetchFailureHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setNavController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVCloudConfigContainerViewController

- (void)autoAdvance
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigContainerViewController _cloudConfigViewController](self, "_cloudConfigViewController"));
  [v2 autoAdvance];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVCloudConfigContainerViewController;
  -[SATVCloudConfigContainerViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVCloudConfigContainerViewController _cloudConfigViewController]( self,  "_cloudConfigViewController"));
  v4 = -[TVSKNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVSKNavigationController),  "initWithRootViewController:",  v3);
  navController = self->_navController;
  self->_navController = v4;

  -[SATVCloudConfigContainerViewController addChildViewController:]( self,  "addChildViewController:",  self->_navController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigContainerViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKNavigationController view](self->_navController, "view"));
  [v6 addSubview:v7];

  -[TVSKNavigationController didMoveToParentViewController:]( self->_navController,  "didMoveToParentViewController:",  self);
}

- (SATVCloudConfigViewController)_cloudConfigViewController
{
  cloudConfigViewController = self->_cloudConfigViewController;
  if (!cloudConfigViewController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SATVCloudConfigViewController);
    v5 = self->_cloudConfigViewController;
    self->_cloudConfigViewController = v4;

    objc_initWeak(&location, self);
    v6 = self->_cloudConfigViewController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001A1DC;
    v11[3] = &unk_1000C93A0;
    objc_copyWeak(&v12, &location);
    -[SATVCloudConfigViewController setMenuHandler:](v6, "setMenuHandler:", v11);
    v7 = self->_cloudConfigViewController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001A23C;
    v9[3] = &unk_1000C93C8;
    objc_copyWeak(&v10, &location);
    -[SATVCloudConfigViewController setCompletionHandler:](v7, "setCompletionHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    cloudConfigViewController = self->_cloudConfigViewController;
  }

  return cloudConfigViewController;
}

- (SATVLoadingCloudConfigViewController)_loadingCloudConfigViewController
{
  loadingCloudConfigViewController = self->_loadingCloudConfigViewController;
  if (!loadingCloudConfigViewController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SATVLoadingCloudConfigViewController);
    v5 = self->_loadingCloudConfigViewController;
    self->_loadingCloudConfigViewController = v4;

    objc_initWeak(&location, self);
    v6 = self->_loadingCloudConfigViewController;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001A418;
    v11[3] = &unk_1000C93A0;
    objc_copyWeak(&v12, &location);
    -[SATVLoadingCloudConfigViewController setMenuHandler:](v6, "setMenuHandler:", v11);
    v7 = self->_loadingCloudConfigViewController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001A488;
    v9[3] = &unk_1000C93C8;
    objc_copyWeak(&v10, &location);
    -[SATVLoadingCloudConfigViewController setCompletionHandler:](v7, "setCompletionHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    loadingCloudConfigViewController = self->_loadingCloudConfigViewController;
  }

  return loadingCloudConfigViewController;
}

- (void)_callCompletionHandler
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigContainerViewController completionHandler](self, "completionHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVCloudConfigContainerViewController completionHandler](self, "completionHandler"));
    v4[2]();
  }

- (id)menuHandler
{
  return self->_menuHandler;
}

- (void)setMenuHandler:(id)a3
{
}

- (id)cloudConfigFetchFailureHandler
{
  return self->_cloudConfigFetchFailureHandler;
}

- (void)setCloudConfigFetchFailureHandler:(id)a3
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