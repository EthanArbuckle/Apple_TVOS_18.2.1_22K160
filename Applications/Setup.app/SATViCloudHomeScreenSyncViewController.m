@interface SATViCloudHomeScreenSyncViewController
- (SATVChooseOptionView)chooseOptionView;
- (SATViCloudHomeScreenSyncViewController)init;
- (SATViCloudServicesManager)iCloudServicesManager;
- (TVSKActivityIndicatorViewController)activityIndicatorViewController;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIView)activityIndicatorContainerView;
- (id)_footerText;
- (id)completionHandler;
- (id)firstOptionButtonFooterTextForView:(id)a3;
- (id)firstOptionButtonTextForView:(id)a3;
- (id)secondOptionButtonFooterTextForView:(id)a3;
- (id)secondOptionButtonTextForView:(id)a3;
- (id)subtitleTextForView:(id)a3;
- (id)titleTextForView:(id)a3;
- (void)_dismissActivityIndicatorView;
- (void)_enableOrDisableHomeScreenSync:(BOOL)a3;
- (void)_showActivityIndicatorView;
- (void)_showOptionsView;
- (void)autoAdvance;
- (void)didSelectFirstOptionForView:(id)a3;
- (void)didSelectSecondOptionForView:(id)a3;
- (void)reset;
- (void)setActivityIndicatorContainerView:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setActivityIndicatorViewController:(id)a3;
- (void)setChooseOptionView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setICloudServicesManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATViCloudHomeScreenSyncViewController

- (SATViCloudHomeScreenSyncViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATViCloudHomeScreenSyncViewController;
  v2 = -[SATViCloudHomeScreenSyncViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[SATViCloudServicesManager sharedServicesManager]( &OBJC_CLASS___SATViCloudServicesManager,  "sharedServicesManager"));
    iCloudServicesManager = v2->_iCloudServicesManager;
    v2->_iCloudServicesManager = (SATViCloudServicesManager *)v3;
  }

  return v2;
}

- (void)autoAdvance
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v3, "activeAccount"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudServicesManager operationError](self->_iCloudServicesManager, "operationError"));
    uint64_t v4 = v5 == 0LL;
    if (!v5)
    {
      id v6 = sub_10002AF94();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "We didn't find any cloud data and there was no error. We turn on home screen sync by default while auto advancing..",  v8,  2u);
      }
    }
  }

  -[SATViCloudHomeScreenSyncViewController _enableOrDisableHomeScreenSync:](self, "_enableOrDisableHomeScreenSync:", v4);
}

- (void)reset
{
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATViCloudHomeScreenSyncViewController;
  -[SATViCloudHomeScreenSyncViewController viewDidLoad](&v6, "viewDidLoad");
  if (-[SATViCloudServicesManager isFetchOperationInFlight](self->_iCloudServicesManager, "isFetchOperationInFlight"))
  {
    id v3 = sub_10002AF94();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Fetch is still in flight. Display spinner..",  v5,  2u);
    }

    -[SATViCloudHomeScreenSyncViewController _showActivityIndicatorView](self, "_showActivityIndicatorView");
  }

  else
  {
    -[SATViCloudHomeScreenSyncViewController _showOptionsView](self, "_showOptionsView");
  }

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATViCloudHomeScreenSyncViewController;
  -[SATViCloudHomeScreenSyncViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATViCloudHomeScreenSyncViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  6LL,  6LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATViCloudHomeScreenSyncViewController;
  -[SATViCloudHomeScreenSyncViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATViCloudHomeScreenSyncViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (void)viewDidLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SATViCloudHomeScreenSyncViewController;
  -[SATViCloudHomeScreenSyncViewController viewDidLayoutSubviews](&v27, "viewDidLayoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController view](self, "view"));
  unsigned int v4 = [v3 _shouldReverseLayoutDirection];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController view](self, "view"));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double y = CGPointZero.y;
  -[SATVChooseOptionView sizeThatFits:](self->_chooseOptionView, "sizeThatFits:", v11, v13);
  double v17 = UIRectCenteredYInRect(CGPointZero.x, y, v15, v16, v7, v9, v11, v13);
  double v21 = v18;
  double v22 = v19;
  double v23 = v20;
  if (v4) {
    double v24 = v11 + -572.0;
  }
  else {
    double v24 = 572.0;
  }
  double v25 = v24 - floor(CGRectGetWidth(*(CGRect *)&v17) * 0.5);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController chooseOptionView](self, "chooseOptionView"));
  objc_msgSend(v26, "setFrame:", v25, v21, v22, v23);
}

- (void)_enableOrDisableHomeScreenSync:(BOOL)a3
{
  BOOL v3 = a3;
  +[SATViCloudHomeScreenSyncUtilities enableOrDisableHomeScreenSync:]( &OBJC_CLASS___SATViCloudHomeScreenSyncUtilities,  "enableOrDisableHomeScreenSync:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    double v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATViCloudHomeScreenSyncViewController completionHandler]( self,  "completionHandler"));
    v6[2](v6, v3);
  }

- (id)titleTextForView:(id)a3
{
  return sub_10000D7CC(@"iCLOUD_HOME_SCREEN_SYNC_TITLE", @"Localizable");
}

- (id)subtitleTextForView:(id)a3
{
  return sub_10000D7CC(@"iCLOUD_HOME_SCREEN_SYNC_SUBTITLE", @"Localizable");
}

- (id)firstOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"iCLOUD_HOME_SCREEN_SYNC_ENABLE", @"Localizable");
}

- (id)secondOptionButtonTextForView:(id)a3
{
  return sub_10000D7CC(@"iCLOUD_HOME_SCREEN_SYNC_DISABLE", @"Localizable");
}

- (id)firstOptionButtonFooterTextForView:(id)a3
{
  return -[SATViCloudHomeScreenSyncViewController _footerText](self, "_footerText", a3);
}

- (id)secondOptionButtonFooterTextForView:(id)a3
{
  return -[SATViCloudHomeScreenSyncViewController _footerText](self, "_footerText", a3);
}

- (void)didSelectFirstOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "User wants to enable iCloud Home Screen Sync",  v6,  2u);
  }

  -[SATViCloudHomeScreenSyncViewController _enableOrDisableHomeScreenSync:]( self,  "_enableOrDisableHomeScreenSync:",  1LL);
  +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 7LL, &__kCFBooleanTrue);
}

- (void)didSelectSecondOptionForView:(id)a3
{
  id v4 = sub_10002AF94();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "User does not want to enable iCloud Home Screen Sync",  v6,  2u);
  }

  -[SATViCloudHomeScreenSyncViewController _enableOrDisableHomeScreenSync:]( self,  "_enableOrDisableHomeScreenSync:",  0LL);
  +[TVCSMetrics reportChangeFor:toValue:]( &OBJC_CLASS___TVCSMetrics,  "reportChangeFor:toValue:",  7LL,  &__kCFBooleanFalse);
  +[TVCSMetrics reportAction:](&OBJC_CLASS___TVCSMetrics, "reportAction:", 3LL);
}

- (void)_showActivityIndicatorView
{
  double v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  double v10 = sub_1000394EC;
  double v11 = &unk_1000C93C8;
  objc_copyWeak(&v12, &location);
  BOOL v3 = objc_retainBlock(&v8);
  -[SATViCloudServicesManager setFetchRequestCompletionHandler:]( self->_iCloudServicesManager,  "setFetchRequestCompletionHandler:",  v3,  v8,  v9,  v10,  v11);
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
  activityIndicatorViewController = self->_activityIndicatorViewController;
  self->_activityIndicatorViewController = v4;

  -[SATViCloudHomeScreenSyncViewController addChildViewController:]( self,  "addChildViewController:",  self->_activityIndicatorViewController);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController view](self, "view"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v6 addSubview:v7];

  -[TVSKActivityIndicatorViewController didMoveToParentViewController:]( self->_activityIndicatorViewController,  "didMoveToParentViewController:",  self);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_dismissActivityIndicatorView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v3 removeFromSuperview];

  -[TVSKActivityIndicatorViewController removeFromParentViewController]( self->_activityIndicatorViewController,  "removeFromParentViewController");
  activityIndicatorViewController = self->_activityIndicatorViewController;
  self->_activityIndicatorViewController = 0LL;
}

- (void)_showOptionsView
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___SATVChooseOptionView);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController view](self, "view"));
  [v4 bounds];
  v5 = -[SATVChooseOptionView initWithFrame:](v3, "initWithFrame:");
  chooseOptionView = self->_chooseOptionView;
  self->_chooseOptionView = v5;

  -[SATVChooseOptionView setDataSource:](self->_chooseOptionView, "setDataSource:", self);
  -[SATVChooseOptionView setDelegate:](self->_chooseOptionView, "setDelegate:", self);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATViCloudHomeScreenSyncViewController view](self, "view"));
  [v7 addSubview:self->_chooseOptionView];
}

- (id)_footerText
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v2, "activeAccount"));
  id v4 = sub_10000D7CC(@"iCLOUD_HOME_SCREEN_SYNC_FOOTNOTE", @"Localizable");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIView)activityIndicatorContainerView
{
  return self->_activityIndicatorContainerView;
}

- (void)setActivityIndicatorContainerView:(id)a3
{
}

- (SATViCloudServicesManager)iCloudServicesManager
{
  return self->_iCloudServicesManager;
}

- (void)setICloudServicesManager:(id)a3
{
}

- (SATVChooseOptionView)chooseOptionView
{
  return self->_chooseOptionView;
}

- (void)setChooseOptionView:(id)a3
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