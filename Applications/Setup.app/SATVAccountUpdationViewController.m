@interface SATVAccountUpdationViewController
- (OS_dispatch_source)requestTimeoutTimer;
- (SATVAccountUpdationViewController)init;
- (SATVAuthenticationManager)authenticationManager;
- (TVSKActivityIndicatorViewController)activityIndicatorViewController;
- (id)completionHandler;
- (void)_cancelRequestTimeoutTimer;
- (void)_startRequestTimeoutTimer;
- (void)setActivityIndicatorViewController:(id)a3;
- (void)setAuthenticationManager:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRequestTimeoutTimer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVAccountUpdationViewController

- (SATVAccountUpdationViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVAccountUpdationViewController;
  v2 = -[SATVAccountUpdationViewController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
    authenticationManager = v2->_authenticationManager;
    v2->_authenticationManager = (SATVAuthenticationManager *)v3;
  }

  return v2;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVAccountUpdationViewController;
  -[SATVAccountUpdationViewController viewDidLoad](&v7, "viewDidLoad");
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TVSKActivityIndicatorViewController);
  activityIndicatorViewController = self->_activityIndicatorViewController;
  self->_activityIndicatorViewController = v3;

  -[SATVAccountUpdationViewController addChildViewController:]( self,  "addChildViewController:",  self->_activityIndicatorViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAccountUpdationViewController view](self, "view"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKActivityIndicatorViewController view](self->_activityIndicatorViewController, "view"));
  [v5 addSubview:v6];

  -[TVSKActivityIndicatorViewController didMoveToParentViewController:]( self->_activityIndicatorViewController,  "didMoveToParentViewController:",  self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVAccountUpdationViewController;
  -[SATVAccountUpdationViewController viewWillAppear:](&v11, "viewWillAppear:", a3);
  objc_initWeak(&location, self);
  authenticationManager = self->_authenticationManager;
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  objc_super v7 = sub_10002B8D0;
  v8 = &unk_1000C93C8;
  objc_copyWeak(&v9, &location);
  -[SATVAuthenticationManager refreshAccountPropertiesWithCompletion:]( authenticationManager,  "refreshAccountPropertiesWithCompletion:",  &v5);
  -[SATVAccountUpdationViewController _startRequestTimeoutTimer](self, "_startRequestTimeoutTimer", v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_cancelRequestTimeoutTimer
{
  if (self->_requestTimeoutTimer)
  {
    id v3 = sub_10002AF94();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      objc_super v7 = "-[SATVAccountUpdationViewController _cancelRequestTimeoutTimer]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Cancelling our request timeout timer...",  (uint8_t *)&v6,  0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->_requestTimeoutTimer);
    requestTimeoutTimer = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0LL;
  }

- (void)_startRequestTimeoutTimer
{
  id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  requestTimeoutTimer = self->_requestTimeoutTimer;
  self->_requestTimeoutTimer = v3;

  v5 = self->_requestTimeoutTimer;
  dispatch_time_t v6 = dispatch_time(0LL, 6000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_super v7 = self->_requestTimeoutTimer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002BB9C;
  v8[3] = &unk_1000C93A0;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
  dispatch_resume((dispatch_object_t)self->_requestTimeoutTimer);
  objc_destroyWeak(&v9);
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

- (SATVAuthenticationManager)authenticationManager
{
  return self->_authenticationManager;
}

- (void)setAuthenticationManager:(id)a3
{
}

- (OS_dispatch_source)requestTimeoutTimer
{
  return self->_requestTimeoutTimer;
}

- (void)setRequestTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end