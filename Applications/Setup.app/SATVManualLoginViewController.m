@interface SATVManualLoginViewController
- (AISSetupViewController)setupViewController;
- (TVSKActivityIndicatorViewController)activityIndicatorViewController;
- (id)completionHandler;
- (void)_showLoginViewController;
- (void)reset;
- (void)setActivityIndicatorViewController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setSetupViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVManualLoginViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVManualLoginViewController;
  -[SATVManualLoginViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
  activityIndicatorViewController = self->_activityIndicatorViewController;
  self->_activityIndicatorViewController = v3;

  v5 = self->_activityIndicatorViewController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVManualLoginViewController view](self, "view"));
  -[SATVManualLoginViewController bs_addChildViewController:withSuperview:]( self,  "bs_addChildViewController:withSuperview:",  v5,  v6);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009060;
  v7[3] = &unk_1000C9468;
  v7[4] = self;
  +[SATVUserProfilesUtilities deletePrimaryUserIfAnyWithCompletionHandler:]( &OBJC_CLASS___SATVUserProfilesUtilities,  "deletePrimaryUserIfAnyWithCompletionHandler:",  v7);
}

- (void)reset
{
  setupViewController = self->_setupViewController;
  self->_setupViewController = 0LL;

  -[SATVManualLoginViewController _showLoginViewController](self, "_showLoginViewController");
}

- (void)_showLoginViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___AISSetupContext);
  [v3 setDeviceUserKind:2];
  [v3 setLocalRole:0];
  [v3 setRemoteRole:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", AIDAServiceTypeCloud));
  [v3 setRequiredServiceTypes:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  AIDAServiceTypeStore,  AIDAServiceTypeGameCenter,  0LL));
  [v3 setDesiredServiceTypes:v5];

  [v3 setShouldBackgroundDesiredServices:1];
  [v3 setSupportsSplitAccounts:1];
  v6 = -[AISSetupViewController initWithContext:]( objc_alloc(&OBJC_CLASS___AISSetupViewController),  "initWithContext:",  v3);
  -[AISSetupViewController setShouldAutoDismiss:](v6, "setShouldAutoDismiss:", 0LL);
  id v7 = sub_10000D7CC(@"AUTH_SKIP_BUTTON", @"Localizable");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v8,  0LL,  0LL,  &stru_1000C94D0));

  -[AISSetupViewController setSkipAction:](v6, "setSkipAction:", v9);
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009320;
  v12[3] = &unk_1000C9548;
  objc_copyWeak(&v13, &location);
  -[AISSetupViewController setReportHandler:](v6, "setReportHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVManualLoginViewController view](self, "view"));
  -[SATVManualLoginViewController bs_addChildViewController:withSuperview:]( self,  "bs_addChildViewController:withSuperview:",  v6,  v10);

  setupViewController = self->_setupViewController;
  self->_setupViewController = v6;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (TVSKActivityIndicatorViewController)activityIndicatorViewController
{
  return self->_activityIndicatorViewController;
}

- (void)setActivityIndicatorViewController:(id)a3
{
}

- (AISSetupViewController)setupViewController
{
  return self->_setupViewController;
}

- (void)setSetupViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end