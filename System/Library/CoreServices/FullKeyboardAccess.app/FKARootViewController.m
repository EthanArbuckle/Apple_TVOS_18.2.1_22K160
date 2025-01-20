@interface FKARootViewController
- (AXUIBannerPresenter)bannerPresenter;
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverridingNativeFocus;
- (FKAGestureViewController)gestureViewController;
- (FKARootViewController)initWithDelegate:(id)a3 displayUUID:(id)a4;
- (FKARootViewControllerDelegate)delegate;
- (void)_notifySceneDidBecomeFocused;
- (void)_setFocusEnabledInScene:(BOOL)a3;
- (void)_startOverridingNativeFocus;
- (void)_stopOverridingNativeFocus;
- (void)dismissChildViewController:(id)a3 animated:(BOOL)a4;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 inPopoverFromRect:(CGRect)a4;
- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5;
- (void)setBannerPresenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureViewController:(id)a3;
- (void)setIsOverridingNativeFocus:(BOOL)a3;
- (void)showChildViewController:(id)a3 animated:(BOOL)a4;
- (void)updateRequiresNativeFocus;
- (void)viewDidLoad;
@end

@implementation FKARootViewController

- (FKARootViewController)initWithDelegate:(id)a3 displayUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FKARootViewController;
  v8 = -[FKARootViewController init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = -[FKAGestureViewController initWithDisplayUUID:]( objc_alloc(&OBJC_CLASS___FKAGestureViewController),  "initWithDisplayUUID:",  v7);
    gestureViewController = v9->_gestureViewController;
    v9->_gestureViewController = v10;

    -[FKARootViewController showChildViewController:animated:]( v9,  "showChildViewController:animated:",  v9->_gestureViewController,  0LL);
  }

  return v9;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___FKARootViewController;
  -[FKARootViewController viewDidLoad](&v2, "viewDidLoad");
  +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:]( &OBJC_CLASS___UIPopoverPresentationController,  "_setAlwaysAllowPopoverPresentations:",  1LL);
}

- (void)showChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[FKARootViewController addChildViewController:](self, "addChildViewController:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  [v7 setAutoresizingMask:18];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  [v18 addSubview:v19];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100009E00;
  v28[3] = &unk_100020708;
  id v20 = v6;
  id v29 = v20;
  v30 = self;
  v21 = objc_retainBlock(v28);
  v22 = v21;
  if (v4)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
    [v23 setAlpha:0.0];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100009E2C;
    v26[3] = &unk_1000207E8;
    id v27 = v20;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100009E60;
    v24[3] = &unk_100020810;
    id v25 = v22;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v26,  v24,  0.3);
  }

  else
  {
    ((void (*)(void *))v21[2])(v21);
  }
}

- (void)dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100009F88;
  v13[3] = &unk_100020708;
  id v6 = a3;
  id v14 = v6;
  double v15 = self;
  id v7 = objc_retainBlock(v13);
  v8 = v7;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100009FD4;
    v11[3] = &unk_1000207E8;
    id v12 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A008;
    v9[3] = &unk_100020810;
    id v10 = v8;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v11,  v9,  0.3);
  }

  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
}

- (void)presentViewController:(id)a3 inPopoverFromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  [v9 setModalPresentationStyle:7];
  id v16 = (id)objc_claimAutoreleasedReturnValue([v9 popoverPresentationController]);
  [v16 setDelegate:self];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
  [v16 setSourceView:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 screen]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fixedCoordinateSpace]);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
  objc_msgSend(v14, "convertRect:toCoordinateSpace:", v15, x, y, width, height);
  objc_msgSend(v16, "setSourceRect:");

  -[FKARootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000A218;
  v12[3] = &unk_100020838;
  v12[4] = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = a3;
  id v10 = objc_retainBlock(v12);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FKARootViewController;
  -[FKARootViewController presentViewController:animated:completion:]( &v11,  "presentViewController:animated:completion:",  v9,  v5,  v10);
}

- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000A310;
  v12[3] = &unk_100020838;
  v12[4] = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = a3;
  id v10 = objc_retainBlock(v12);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FKARootViewController;
  -[FKARootViewController presentViewController:withTransition:completion:]( &v11,  "presentViewController:withTransition:completion:",  v9,  v5,  v10);
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000A3EC;
  v9[3] = &unk_100020838;
  void v9[4] = self;
  id v10 = a4;
  id v6 = v10;
  id v7 = objc_retainBlock(v9);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___FKARootViewController;
  -[FKARootViewController dismissViewControllerWithTransition:completion:]( &v8,  "dismissViewControllerWithTransition:completion:",  v4,  v7);
}

- (void)updateRequiresNativeFocus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController childViewControllers](self, "childViewControllers"));
  if ([v3 indexOfObjectPassingTest:&stru_100020878] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController presentedViewController](self, "presentedViewController"));
    uint64_t v5 = (uint64_t)[v4 requiresNativeFocus];
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  uint64_t v7 = FKALogCommon(v6);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController presentedViewController](self, "presentedViewController"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController childViewControllers](self, "childViewControllers"));
    v11[0] = 67109634;
    v11[1] = v5;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    double v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Update requires native focus: %i. Presented: %@. Child: %@",  (uint8_t *)v11,  0x1Cu);
  }

  -[FKARootViewController setIsOverridingNativeFocus:](self, "setIsOverridingNativeFocus:", v5);
}

- (void)_startOverridingNativeFocus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController delegate](self, "delegate"));
  [v3 willAquireNativeFocus];

  -[FKARootViewController _setFocusEnabledInScene:](self, "_setFocusEnabledInScene:", 1LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 windowScene]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FBSScene]);
  objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  if (!v8)
  {
    uint64_t v10 = FKALogCommon(v9);
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[FKARootViewController view](self, "view"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 window]);
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 windowScene]);
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No identifier for window scene: %@", buf, 0xCu);
    }

    objc_super v8 = &stru_100020B80;
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 systemApplication]);
  v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v20[0] = v18;
  v20[1] = v8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  [v16 performAction:5301 withValue:v19];

  -[FKARootViewController _notifySceneDidBecomeFocused](self, "_notifySceneDidBecomeFocused");
}

- (void)_stopOverridingNativeFocus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 systemApplication]);
  [v4 performAction:5301 withValue:0];

  -[FKARootViewController _setFocusEnabledInScene:](self, "_setFocusEnabledInScene:", 0LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000A7F8;
  v5[3] = &unk_1000207E8;
  v5[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v5);
}

- (void)setIsOverridingNativeFocus:(BOOL)a3
{
  if (self->_isOverridingNativeFocus != a3)
  {
    self->_isOverridingNativeFocus = a3;
    if (a3) {
      -[FKARootViewController _startOverridingNativeFocus](self, "_startOverridingNativeFocus");
    }
    else {
      -[FKARootViewController _stopOverridingNativeFocus](self, "_stopOverridingNativeFocus");
    }
  }

- (void)_setFocusEnabledInScene:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000A8A0;
  v3[3] = &unk_1000207E8;
  v3[4] = self;
  AXPerformSafeBlock(v3);
}

- (void)_notifySceneDidBecomeFocused
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000A94C;
  v2[3] = &unk_1000207E8;
  v2[4] = self;
  AXPerformSafeBlock(v2);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isOverridingNativeFocus
{
  return self->_isOverridingNativeFocus;
}

- (FKAGestureViewController)gestureViewController
{
  return self->_gestureViewController;
}

- (void)setGestureViewController:(id)a3
{
}

- (AXUIBannerPresenter)bannerPresenter
{
  return self->_bannerPresenter;
}

- (void)setBannerPresenter:(id)a3
{
}

- (FKARootViewControllerDelegate)delegate
{
  return (FKARootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end