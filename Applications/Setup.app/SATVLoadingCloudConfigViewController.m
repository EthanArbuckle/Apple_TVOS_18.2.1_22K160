@interface SATVLoadingCloudConfigViewController
+ (BOOL)isSupported;
- (BOOL)isLoading;
- (BOOL)isWaiting;
- (BOOL)needCredentials;
- (MCProfileConnection)profileConnection;
- (SATVCloudLoginViewController)loginViewController;
- (SATVHeaderView)headerView;
- (SATVLoadingCloudConfigViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVSKCloudConfigUtility)cloudUtility;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIView)activityIndicatorContainerView;
- (id)completionHandler;
- (id)menuHandler;
- (void)_enrollWithUsername:(id)a3 password:(id)a4;
- (void)_enrollmentComplete;
- (void)_handleMenuAction;
- (void)_hideActivityIndicator;
- (void)_setSubtitleTitle:(id)a3;
- (void)_setTitle:(id)a3;
- (void)_setupLabels;
- (void)_showActivityIndicator;
- (void)_updateCloudConfig;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActivityIndicatorContainerView:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCloudUtility:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLoginViewController:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setNeedCredentials:(BOOL)a3;
- (void)setProfileConnection:(id)a3;
- (void)setWaiting:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SATVLoadingCloudConfigViewController

- (SATVLoadingCloudConfigViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SATVLoadingCloudConfigViewController;
  v4 = -[SATVLoadingCloudConfigViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    profileConnection = v4->_profileConnection;
    v4->_profileConnection = (MCProfileConnection *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    cloudUtility = v4->_cloudUtility;
    v4->_cloudUtility = (TVSKCloudConfigUtility *)v7;

    -[TVSKCloudConfigUtility addObserver:forKeyPath:options:context:]( v4->_cloudUtility,  "addObserver:forKeyPath:options:context:",  v4,  @"cloudDetails",  0LL,  off_100108C98);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVLoadingCloudConfigViewController;
  -[SATVLoadingCloudConfigViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SATVLoadingCloudConfigViewController;
  -[SATVLoadingCloudConfigViewController loadView](&v30, "loadView");
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UITapGestureRecognizer);
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1000D0FE0);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  -[UITapGestureRecognizer addTarget:action:](v3, "addTarget:action:", self, "_handleMenuAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];

  uint64_t v5 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
  -[SATVLoadingCloudConfigViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v5);

  double y = CGPointZero.y;
  +[UIActivityIndicatorView defaultSizeForStyle:](&OBJC_CLASS___UIActivityIndicatorView, "defaultSizeForStyle:", 20LL);
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v11, "setFrame:", CGPointZero.x, y, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController activityIndicatorView](self, "activityIndicatorView"));
  [v12 setAutoresizingMask:18];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v14 = [v13 _graphicsQuality];

  if (v14 == (id)100)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v15));

    v17 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v16);
    -[SATVLoadingCloudConfigViewController setActivityIndicatorContainerView:]( self,  "setActivityIndicatorContainerView:",  v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    objc_msgSend(v18, "setFrame:", CGPointZero.x, y, v8, v10);

    v19 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 contentView]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController activityIndicatorView](self, "activityIndicatorView"));
    [v20 addSubview:v21];
  }

  else
  {
    v22 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", CGPointZero.x, y, v8, v10);
    -[SATVLoadingCloudConfigViewController setActivityIndicatorContainerView:]( self,  "setActivityIndicatorContainerView:",  v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    [v23 setBackgroundColor:v24];

    v16 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController activityIndicatorView](self, "activityIndicatorView"));
    [v16 addSubview:v19];
  }

  v25 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SATVLoadingCloudConfigViewController setHeaderView:](self, "setHeaderView:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  [v26 addSubview:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  [v28 addSubview:v29];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SATVLoadingCloudConfigViewController;
  -[SATVLoadingCloudConfigViewController viewDidAppear:](&v17, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController activityIndicatorView](self, "activityIndicatorView"));
  [v4 startAnimating];

  -[SATVLoadingCloudConfigViewController _setupLabels](self, "_setupLabels");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController cloudUtility](self, "cloudUtility"));
  if ([v5 isDoingReturnToService])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController profileConnection](self, "profileConnection"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedMDMProfileIdentifier]);

    if (v7)
    {
      -[SATVLoadingCloudConfigViewController _enrollmentComplete](self, "_enrollmentComplete");
      return;
    }
  }

  else
  {
  }

  if (-[SATVLoadingCloudConfigViewController needCredentials](self, "needCredentials")
    && (double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController loginViewController](self, "loginViewController")),
        double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 username]),
        id v10 = [v9 length],
        v9,
        v8,
        !v10))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController completionHandler](self, "completionHandler"));

    if (v15)
    {
      v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController completionHandler]( self,  "completionHandler"));
      v16[2](v16, 0LL);
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController loginViewController](self, "loginViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController loginViewController](self, "loginViewController"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 password]);
    -[SATVLoadingCloudConfigViewController _enrollWithUsername:password:]( self,  "_enrollWithUsername:password:",  v12,  v14);
  }

- (void)viewDidLayoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___SATVLoadingCloudConfigViewController;
  -[SATVLoadingCloudConfigViewController viewDidLayoutSubviews](&v45, "viewDidLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  [v12 frame];
  double v17 = UIRectCenteredIntegralRect(v13, v14, v15, v16, v5, v7, v9, v11);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  CGFloat y = CGPointZero.y;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  v46.origin.x = v5;
  v46.origin.CGFloat y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  objc_msgSend(v26, "sizeThatFits:", CGRectGetWidth(v46), 3.40282347e38);
  double v28 = v27;

  v47.origin.x = v5;
  v47.origin.CGFloat y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  double Width = CGRectGetWidth(v47);
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  [v30 frame];
  double MinY = CGRectGetMinY(v48);
  v49.origin.x = CGPointZero.x;
  v49.origin.CGFloat y = y;
  v49.size.width = Width;
  v49.size.height = v28;
  double v32 = MinY - CGRectGetHeight(v49) + -40.0;

  v50.origin.x = CGPointZero.x;
  v50.origin.CGFloat y = v32;
  v50.size.width = Width;
  v50.size.height = v28;
  if (CGRectGetMinY(v50) < 0.0)
  {
    v51.origin.x = CGPointZero.x;
    v51.origin.CGFloat y = v32;
    v51.size.width = Width;
    v51.size.height = v28;
    double v32 = 50.0;
    double v44 = 50.0 - CGRectGetMinY(v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    [v33 frame];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
    objc_msgSend(v42, "setFrame:", v35, v44 + v37, v39, v41);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  objc_msgSend(v43, "setFrame:", CGPointZero.x, v32, Width, v28);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100108C98 == a6)
  {
    -[SATVLoadingCloudConfigViewController _updateCloudConfig](self, "_updateCloudConfig", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___SATVLoadingCloudConfigViewController;
    -[SATVLoadingCloudConfigViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

+ (BOOL)isSupported
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  if ([v2 shouldSkipEnrollment])
  {
    unsigned __int8 v3 = 0;
  }

  else
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    else {
      unsigned __int8 v3 = 0;
    }
  }

  return v3;
}

- (void)_setTitle:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 titleLabel]);
  [v6 setText:v4];

  -[SATVHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  [v7 setNeedsLayout];
}

- (void)_setSubtitleTitle:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subtitleLabel]);
  [v6 setText:v4];

  -[SATVHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  [v7 setNeedsLayout];
}

- (void)_setupLabels
{
  id v3 = sub_10000D7CC(@"CLOUD_CONFIG_CONFIGURING_APPLETV", @"Localizable");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 titleLabel]);
  [v6 setText:v4];

  id v7 = sub_10000D7CC(@"CLOUD_CONFIG_INSTALLING_DESCRIPTION_%@", @"Localizable");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController cloudUtility](self, "cloudUtility"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 organizationName]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController headerView](self, "headerView"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subtitleLabel]);
  [v13 setText:v11];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController view](self, "view"));
  [v14 setNeedsLayout];
}

- (void)_enrollWithUsername:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  -[SATVLoadingCloudConfigViewController setLoading:](self, "setLoading:", 1LL);
  cloudUtilitCGFloat y = self->_cloudUtility;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002A2AC;
  v9[3] = &unk_1000C9BF0;
  objc_copyWeak(&v10, &location);
  -[TVSKCloudConfigUtility loginWithUsername:password:completionBlock:]( cloudUtility,  "loginWithUsername:password:completionBlock:",  v6,  v7,  v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_enrollmentComplete
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController activityIndicatorView](self, "activityIndicatorView"));
  [v3 stopAnimating];

  if (-[MCProfileConnection isAwaitingDeviceConfigured]( self->_profileConnection,  "isAwaitingDeviceConfigured"))
  {
    id v4 = sub_10002AF94();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Waiting for device configured command", buf, 2u);
    }

    -[SATVLoadingCloudConfigViewController setWaiting:](self, "setWaiting:", 1LL);
    id v6 = sub_10000D7CC(@"CLOUD_CONFIG_AWAITING_CONFIGURATION_DESCRIPTION_%@", @"Localizable");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKCloudConfigUtility organizationName](self->_cloudUtility, "organizationName"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
    -[SATVLoadingCloudConfigViewController _setSubtitleTitle:](self, "_setSubtitleTitle:", v9);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController cloudUtility](self, "cloudUtility"));
    [v10 cloudConfigDidFinishWasApplied:1];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController completionHandler](self, "completionHandler"));
    if (v11)
    {
      v12 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController completionHandler]( self,  "completionHandler"));
      v12[2](v12, 1LL);
    }
  }

- (void)_updateCloudConfig
{
  if (-[SATVLoadingCloudConfigViewController isWaiting](self, "isWaiting"))
  {
    if ((-[MCProfileConnection isAwaitingDeviceConfigured]( self->_profileConnection,  "isAwaitingDeviceConfigured") & 1) == 0)
    {
      -[SATVLoadingCloudConfigViewController setWaiting:](self, "setWaiting:", 0LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002AB44;
      block[3] = &unk_1000C9468;
      block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)_showActivityIndicator
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10002ABB0;
  v2[3] = &unk_1000C9468;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.3);
}

- (void)_hideActivityIndicator
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVLoadingCloudConfigViewController activityIndicatorContainerView]( self,  "activityIndicatorContainerView"));
  [v3 alpha];
  double v5 = v4;

  if (v5 > 0.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10002AC78;
    v6[3] = &unk_1000C9468;
    v6[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v6, 0.3);
  }

- (void)_handleMenuAction
{
  if (!-[SATVLoadingCloudConfigViewController isLoading](self, "isLoading"))
  {
    id v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVLoadingCloudConfigViewController menuHandler](self, "menuHandler"));
    if (v3)
    {
      double v4 = v3;
      v3[2]();
      id v3 = v4;
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

- (SATVHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
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

- (SATVCloudLoginViewController)loginViewController
{
  return self->_loginViewController;
}

- (void)setLoginViewController:(id)a3
{
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
}

- (TVSKCloudConfigUtility)cloudUtility
{
  return self->_cloudUtility;
}

- (void)setCloudUtility:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)isWaiting
{
  return self->_waiting;
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (BOOL)needCredentials
{
  return self->_needCredentials;
}

- (void)setNeedCredentials:(BOOL)a3
{
  self->_needCredentials = a3;
}

- (void).cxx_destruct
{
}

@end