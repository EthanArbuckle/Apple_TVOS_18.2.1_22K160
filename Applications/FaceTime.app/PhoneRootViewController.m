@interface PhoneRootViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)hasUpdateStatusLayoutGuide;
- (BOOL)isContentViewLoaded;
- (BOOL)shouldAutorotate;
- (PHLocalVideoViewController)localVideoViewController;
- (PhoneBaseViewController)baseViewController;
- (PhoneContentView)contentView;
- (STLockoutViewController)lockoutViewController;
- (TVFaceTimeContainerViewController)faceTimeContainerViewController;
- (UIViewController)detailsViewController;
- (UIVisualEffectView)backgroundBlurView;
- (_UIVisualEffectBackdropView)backdropView;
- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3;
- (id)preferredFocusEnvironments;
- (int64_t)preferredUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_ensureProperPositionForContentView;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_stausBarDidChangeFrame:(id)a3;
- (void)displayUIAnimated:(BOOL)a3;
- (void)ensureBaseViewControllerIsShowing;
- (void)handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)hideDetailsViewController;
- (void)hideVideoConferenceBackgroundViewAnimated:(BOOL)a3;
- (void)loadView;
- (void)setBackgroundBlurView:(id)a3;
- (void)setContentViewHiddenPosition;
- (void)setContentViewNormalPosition;
- (void)setDetailsViewController:(id)a3;
- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3;
- (void)setLockoutViewController:(id)a3;
- (void)setupContentViewFullSize;
- (void)setupContentViewSidebar;
- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)showDetailsViewController;
- (void)showVideoConferenceBackgroundViewAnimated:(BOOL)a3;
- (void)startPreviewIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PhoneRootViewController

- (PhoneContentView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
    v4 = -[PhoneContentView initWithFrame:]( objc_alloc(&OBJC_CLASS___PhoneContentView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[PhoneContentView setContentMode:](self->_contentView, "setContentMode:", 3LL);
    -[PhoneContentView setAutoresizesSubviews:](self->_contentView, "setAutoresizesSubviews:", 1LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v7 = [v6 tabBarFillsScreen];

    if (v7) {
      -[PhoneRootViewController setupContentViewFullSize](self, "setupContentViewFullSize");
    }
    else {
      -[PhoneRootViewController setupContentViewSidebar](self, "setupContentViewSidebar");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v9 = [v8 userInterfaceStyle];

    if (v9 == 1)
    {
      if (!self->_backdropView)
      {
        v10 = objc_alloc(&OBJC_CLASS____UIVisualEffectBackdropView);
        -[PhoneContentView bounds](self->_contentView, "bounds");
        v11 = -[_UIVisualEffectBackdropView initWithFrame:](v10, "initWithFrame:");
        backdropView = self->_backdropView;
        self->_backdropView = v11;

        -[_UIVisualEffectBackdropView setAutoresizingMask:](self->_backdropView, "setAutoresizingMask:", 18LL);
        -[_UIVisualEffectBackdropView setRenderMode:](self->_backdropView, "setRenderMode:", 1LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIVisualEffectBackdropView captureGroup](self->_backdropView, "captureGroup"));
        [v13 setGroupName:@"RootControllerBackgroundBackdrop"];
      }

      if (!self->_backgroundBlurView)
      {
        v14 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
        v16 = -[UIVisualEffectView initWithEffect:](v14, "initWithEffect:", v15);
        backgroundBlurView = self->_backgroundBlurView;
        self->_backgroundBlurView = v16;

        -[PhoneContentView bounds](self->_contentView, "bounds");
        -[UIVisualEffectView setFrame:](self->_backgroundBlurView, "setFrame:");
        -[UIVisualEffectView setAutoresizingMask:](self->_backgroundBlurView, "setAutoresizingMask:", 18LL);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIVisualEffectBackdropView captureGroup](self->_backdropView, "captureGroup"));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 groupName]);
        -[UIVisualEffectView _setGroupName:](self->_backgroundBlurView, "_setGroupName:", v19);

        -[UIVisualEffectView _setCaptureView:](self->_backgroundBlurView, "_setCaptureView:", self->_backdropView);
      }

      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", self->_backdropView);
      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", self->_backgroundBlurView);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v21 = [v20 usesUnifiedInterface];

    if (v21)
    {
      objc_storeStrong((id *)&self->_detailsViewController, self->_faceTimeContainerViewController);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_detailsViewController, "view"));
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self, "baseViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v23 view]);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v25 = [v24 tabBarFillsScreen];

    -[PhoneContentView bounds](self->_contentView, "bounds");
    double v27 = v26;
    if (v25)
    {
      objc_msgSend(v22, "setFrame:");
    }

    else
    {
      -[PhoneContentView bounds](self->_contentView, "bounds");
      objc_msgSend(v22, "setBounds:", 0.0, 0.0, v27);
      -[PhoneContentView bounds](self->_contentView, "bounds");
      double MaxX = CGRectGetMaxX(v36);
      [v22 bounds];
      double v30 = MaxX - floor(v29 * 0.5);
      -[PhoneContentView bounds](self->_contentView, "bounds");
      objc_msgSend(v22, "setCenter:", v30, floor(v31 * 0.5));
    }

    [v22 setAutoresizingMask:18];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
      -[PhoneRootViewController addChildViewController:](self, "addChildViewController:", v33);

      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
      [v34 didMoveToParentViewController:self];
    }

    else
    {
      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", v22);
    }

    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 1LL);

    contentView = self->_contentView;
  }

  return contentView;
}

- (void)loadView
{
  v4 = objc_alloc_init(&OBJC_CLASS___PhoneRootView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[PhoneRootView setBackgroundColor:](v4, "setBackgroundColor:", v3);

  -[PhoneRootView setOpaque:](v4, "setOpaque:", 0LL);
  -[PhoneRootViewController setView:](self, "setView:", v4);
}

- (PHLocalVideoViewController)localVideoViewController
{
  localVideoViewController = self->_localVideoViewController;
  if (!localVideoViewController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___PHLocalVideoViewController);
    v5 = self->_localVideoViewController;
    self->_localVideoViewController = v4;

    -[PhoneRootViewController addChildViewController:](self, "addChildViewController:", self->_localVideoViewController);
    localVideoViewController = self->_localVideoViewController;
  }

  return localVideoViewController;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000118C0;
  v9[3] = &unk_1000F6DF0;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v8,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned __int8 v3 = [v2 contentViewCanRotate];

  return v3;
}

- (void)_getRotationContentSettings:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController _getRotationContentSettings:](&v7, "_getRotationContentSettings:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self, "baseViewController"));
  unsigned int v6 = [v5 shouldDisableEdgeClip];

  if (v6) {
    a3->var6 = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned int v6 = [v5 alwaysShowLocalVideo];

  if (v6)
  {
    id v7 = sub_100011210();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Stopping preview via PhoneRootViewController viewDidDisappear",  buf,  2u);
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
    [v9 stopPreview];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController viewDidDisappear:](&v11, "viewDidDisappear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PhoneRootViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PhoneRootViewController startPreviewIfNeeded](self, "startPreviewIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  -[PhoneRootViewController startPreviewIfNeeded](self, "startPreviewIfNeeded");
  id v4 = sub_100011210();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Observing foreground notifications via PhoneRootViewController viewWillAppear",  v7,  2u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PhoneRootViewController;
  -[PhoneRootViewController viewDidLoad](&v5, "viewDidLoad");
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___TVFaceTimeContainerViewController);
  faceTimeContainerViewController = self->_faceTimeContainerViewController;
  self->_faceTimeContainerViewController = v3;

  -[PhoneRootViewController displayUIAnimated:](self, "displayUIAnimated:", 0LL);
}

- (void)startPreviewIfNeeded
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  if ([v3 inCall])
  {

LABEL_4:
    return;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned __int8 v5 = [v4 isSuspended];

  if ((v5 & 1) == 0)
  {
    id v6 = sub_100011210();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting preview via PhoneRootViewController viewWillAppear",  buf,  2u);
    }

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
    [v8 startPreview];
  }

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  id v4 = sub_100011210();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PhoneRootViewController handleApplicationWillEnterForegroundNotification",  v6,  2u);
  }

  -[PhoneRootViewController showFaceTimeFirstRunViewIfNeeded](self, "showFaceTimeFirstRunViewIfNeeded");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30LL;
}

- (int64_t)preferredUserInterfaceStyle
{
  return 0LL;
}

- (id)preferredFocusEnvironments
{
  faceTimeContainerViewController = self->_faceTimeContainerViewController;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &faceTimeContainerViewController,  1LL));
}

- (void)_ensureProperPositionForContentView
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned int v4 = [v3 tabBarFillsScreen];

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  [v5 bounds];
  double v10 = v8;
  double v11 = v9;
  if (v4)
  {
    double x = v6;
    double y = v7;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    [v14 center];
    double v16 = v15;
    double v18 = v17;
  }

  else
  {
    -[PhoneRootViewController _contentViewWidthForApplicationBoundsSize:]( self,  "_contentViewWidthForApplicationBoundsSize:",  v8,  v9);
    double v10 = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    [v20 bounds];
    double v11 = v21;

    if ([UIApp userInterfaceLayoutDirection])
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
      [v22 bounds];
      double v16 = floor(v23 + v10 * -0.5);
    }

    else
    {
      double v16 = floor(v10 * 0.5);
    }

    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    [v14 bounds];
    double v18 = floor(v24 * 0.5);
  }

  -[PhoneContentView setBounds:](self->_contentView, "setBounds:", x, y, v10, v11);
  -[PhoneContentView setCenter:](self->_contentView, "setCenter:", v16, v18);
}

- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3
{
  unint64_t v3 = +[PHUIConfiguration contentViewSizeForFaceTime]( &OBJC_CLASS___PHUIConfiguration,  "contentViewSizeForFaceTime",  a3.width,  a3.height);
  if (v3 > 2) {
    return 320.0;
  }
  else {
    return dbl_1000C3F68[v3];
  }
}

- (void)setupContentViewSidebar
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[PhoneContentView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);

  -[PhoneContentView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 20LL);
  -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned __int8 v5 = [v4 tabBarFillsScreen];

  if ((v5 & 1) == 0)
  {
    -[PhoneRootViewController setContentViewHiddenPosition](self, "setContentViewHiddenPosition");
    -[PhoneContentView setHidden:](self->_contentView, "setHidden:", 1LL);
  }

- (void)setupContentViewFullSize
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[PhoneContentView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);

  -[PhoneContentView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18LL);
  -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
}

- (BOOL)isContentViewLoaded
{
  return self->_contentView != 0LL;
}

- (void)setContentViewNormalPosition
{
  if (-[PhoneRootViewController isContentViewLoaded](self, "isContentViewLoaded"))
  {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v5 = [v4 contentViewAnimationsFadeInsteadOfMove];

    if (v5)
    {
      [v3 setAlpha:1.0];
    }

    else
    {
      __int128 v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v7[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v7[1] = v6;
      v7[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [v3 setTransform:v7];
    }
  }

- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
  [v7 setHidden:0];
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 superview]);

  if (v9 != v8)
  {
    +[UIView disableAnimation](&OBJC_CLASS___UIView, "disableAnimation");
    -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
    [v8 addSubview:v7];
    +[UIView enableAnimation](&OBJC_CLASS___UIView, "enableAnimation");
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100012344;
  v16[3] = &unk_1000F6E18;
  id v17 = v7;
  id v18 = v6;
  id v10 = v6;
  id v11 = v7;
  v12 = objc_retainBlock(v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000123B8;
  v15[3] = &unk_1000F6930;
  v15[4] = self;
  v13 = objc_retainBlock(v15);
  if (v4) {
    double v14 = 0.300000012;
  }
  else {
    double v14 = 0.0;
  }
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v13,  v12,  v14);
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v13,  v12,  v14,  0.0);
}

- (void)setContentViewHiddenPosition
{
  if (-[PhoneRootViewController isContentViewLoaded](self, "isContentViewLoaded"))
  {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    unsigned int v5 = [v4 contentViewAnimationsFadeInsteadOfMove];

    if (v5)
    {
      [v3 setAlpha:0.0];
    }

    else
    {
      id v6 = [UIApp userInterfaceLayoutDirection];
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
      unsigned int v8 = [v7 contentViewOffscreenEdge];

      [v3 bounds];
      if (v8 == 1)
      {
        double Height = CGRectGetHeight(*(CGRect *)&v9);
        CGFloat v14 = Height;
      }

      else
      {
        double Height = CGRectGetWidth(*(CGRect *)&v9);
        CGFloat v14 = 0.0;
      }

      if (v6 != (id)1) {
        double Height = -Height;
      }
      if (v8 == 1) {
        double Height = 0.0;
      }
      CGAffineTransformMakeTranslation(&v16, Height, v14);
      CGAffineTransform v15 = v16;
      [v3 setTransform:&v15];
    }
  }

- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (-[PhoneRootViewController isContentViewLoaded](self, "isContentViewLoaded"))
  {

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000125DC;
    v11[3] = &unk_1000F6E18;
    v11[4] = self;
    id v12 = v6;
    double v7 = objc_retainBlock(v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001266C;
    v10[3] = &unk_1000F6930;
    v10[4] = self;
    unsigned int v8 = objc_retainBlock(v10);
    double v9 = 0.300000012;
    if (!v4) {
      double v9 = 0.0;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v8,  v7,  v9);
  }
}

- (void)showVideoConferenceBackgroundViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
  [v8 insertSubview:v6 below:v9];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000127F0;
  v16[3] = &unk_1000F6E40;
  void v16[4] = self;
  BOOL v17 = v3;
  id v10 = objc_retainBlock(v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001280C;
  v14[3] = &unk_1000F6930;
  id v15 = v6;
  id v11 = v6;
  id v12 = objc_retainBlock(v14);
  if (v3) {
    double v13 = 0.300000012;
  }
  else {
    double v13 = 0.0;
  }
  -[PHLocalVideoViewController viewWillAppear:](self->_localVideoViewController, "viewWillAppear:", v3);
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v12,  v10,  v13);
}

- (void)hideVideoConferenceBackgroundViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[PHLocalVideoViewController isViewLoaded](self->_localVideoViewController, "isViewLoaded"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self->_localVideoViewController, "view"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100012948;
    v16[3] = &unk_1000F6E68;
    id v6 = v5;
    id v17 = v6;
    id v18 = self;
    BOOL v19 = v3;
    double v7 = objc_retainBlock(v16);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    double v13 = sub_100012980;
    CGFloat v14 = &unk_1000F6930;
    id v15 = v6;
    id v8 = v6;
    double v9 = objc_retainBlock(&v11);
    if (v3) {
      double v10 = 0.300000012;
    }
    else {
      double v10 = 0.0;
    }
    -[PHLocalVideoViewController viewWillDisappear:]( self->_localVideoViewController,  "viewWillDisappear:",  v3,  v11,  v12,  v13,  v14);
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v9,  v7,  v10);
  }

- (void)showDetailsViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned int v4 = [v3 userInterfaceStyle];

  if (v4 == 1)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v10 presentedViewController]);
    if (v5)
    {
      id v6 = (void *)v5;
LABEL_4:

      return;
    }

    BOOL faceTimeRegistrationViewIsShowing = self->_faceTimeRegistrationViewIsShowing;

    if (!faceTimeRegistrationViewIsShowing)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
      unsigned int v9 = [v8 isViewLoaded];

      if (v9)
      {
        id v10 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
        [v6 setAlpha:1.0];
        goto LABEL_4;
      }
    }
  }

- (void)hideDetailsViewController
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned int v4 = [v3 userInterfaceStyle];

  if (v4 == 1)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v5 setAlpha:0.0];
  }

- (void)ensureBaseViewControllerIsShowing
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned __int8 v4 = [v3 alwaysShowLocalVideo];

  if ((v4 & 1) == 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self, "baseViewController"));
    [v6 resetViewController];

    id v7 = (id)objc_claimAutoreleasedReturnValue([v5 superview]);
    if (v7 != v8)
    {
      -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
      [v8 addSubview:v5];
    }
  }

- (void)displayUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  if ([v5 alwaysShowLocalVideo])
  {
    unsigned __int8 v6 = +[UIApplication shouldMakeUIForDefaultPNG]( &OBJC_CLASS___UIApplication,  "shouldMakeUIForDefaultPNG");

    if ((v6 & 1) != 0) {
      goto LABEL_7;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    __int128 v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v34[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v34[1] = v9;
    v34[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v8 setTransform:v34];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    [v10 setAlpha:1.0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 superview]);

    if (v12 != v5)
    {
      [v7 viewWillAppear:1];
      [v5 insertSubview:v11 atIndex:0];
      [v7 viewDidAppear:1];
    }

    [v5 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = v17 * 0.5;
    double v22 = v19 * 0.5;
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    objc_msgSend(v23, "setBounds:", v14, v16, v18, v20);

    double v24 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    objc_msgSend(v24, "setCenter:", v21, v22);

    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
    [v25 setAutoresizingMask:18];

    double v26 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
    objc_msgSend(v7, "updateViewControllerForOrientation:", objc_msgSend(v26, "statusBarOrientation"));

    [v7 fadeInAnimated:v3];
  }

LABEL_7:
  double v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVFaceTimeAppConfig sharedInstance](&OBJC_CLASS___TVFaceTimeAppConfig, "sharedInstance"));
  unsigned int v28 = [v27 tabBarCanSlide];

  if (v28)
  {
    -[PhoneRootViewController showContentViewAnimated:completionBlock:]( self,  "showContentViewAnimated:completionBlock:",  0LL,  0LL);
    id v29 = sub_100011210();
    double v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      double v31 = "Showing contents view of PhoneRootViewController.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, v33, 2u);
    }
  }

  else
  {
    id v32 = sub_100011210();
    double v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      double v31 = "Skipping showing contents view of PhoneRootViewController.";
      goto LABEL_12;
    }
  }
}

- (void)_stausBarDidChangeFrame:(id)a3
{
}

- (_UIVisualEffectBackdropView)backdropView
{
  return self->_backdropView;
}

- (PhoneBaseViewController)baseViewController
{
  return self->_baseViewController;
}

- (UIViewController)detailsViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDetailsViewController:(id)a3
{
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
}

- (TVFaceTimeContainerViewController)faceTimeContainerViewController
{
  return self->_faceTimeContainerViewController;
}

- (UIVisualEffectView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
}

- (BOOL)hasUpdateStatusLayoutGuide
{
  return self->_hasUpdateStatusLayoutGuide;
}

- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3
{
  self->_hasUpdateStatusLayoutGuide = a3;
}

- (void).cxx_destruct
{
}

@end