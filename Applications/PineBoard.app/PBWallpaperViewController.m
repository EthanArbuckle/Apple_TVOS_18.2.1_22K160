@interface PBWallpaperViewController
- (BOOL)acceptsEventFocus;
- (BOOL)allowsInteraction;
- (BOOL)expectsEventForwarding;
- (BOOL)isIdleModeActive;
- (BOOL)isInterruptible;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (PBWallpaperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)wallpaperView;
- (id)_wallpaperForApplicationSceneHandle:(id)a3 withVariant:(int64_t)a4;
- (void)_handleDisplayBoundsDidChangeNotification:(id)a3;
- (void)_updateWallpaperForApplicationSceneHandle:(id)a3;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
- (void)setIdleModeActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setWallpaperView:(id)a3;
- (void)updateWallpaperWithTransitionContext:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PBWallpaperViewController

- (PBWallpaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBWallpaperViewController;
  v4 = -[PBWallpaperViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v5 addObserver:v4];
    if (sub_1001C9E00())
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v6 addObserver:v4 selector:"_handleDisplayBoundsDidChangeNotification:" name:@"PBDisplayBoundsManagerBoundsDidChangeNotification" object:0];
    }
  }

  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBWallpaperViewController;
  -[PBWallpaperViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentApplicationSceneHandle]);
  -[PBWallpaperViewController _updateWallpaperForApplicationSceneHandle:]( self,  "_updateWallpaperForApplicationSceneHandle:",  v4);
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBWallpaperViewController;
  -[PBWallpaperViewController viewDidLayoutSubviews](&v21, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if ((sub_1001C9E00() & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mainWorkspace]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 geometry]);

    [v14 bounds];
    CGFloat v16 = v15;
    double v7 = v17;
    double v9 = v18;
    double v11 = v19;
    [v14 fullDisplayBounds];
    double Width = CGRectGetWidth(v22);
    v23.origin.x = v16;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    double v5 = (Width - CGRectGetWidth(v23)) * 0.5;
    -[UIView setClipsToBounds:](self->_wallpaperView, "setClipsToBounds:", 1LL);
  }

  -[UIView setFrame:](self->_wallpaperView, "setFrame:", v5, v7, v9, v11);
}

- (void)setIdleModeActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_idleModeActive != a3)
  {
    BOOL v4 = a3;
    self->_idleModeActive = a3;
    if (-[PBWallpaperViewController isViewLoaded](self, "isViewLoaded"))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController wallpaperView](self, "wallpaperView"));
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);
      if (v4) {
        uint64_t v9 = 2LL;
      }
      else {
        uint64_t v9 = 1LL;
      }
      if (v4) {
        double v10 = 3.0;
      }
      else {
        double v10 = 1.0;
      }
      double v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBWallpaperViewController _wallpaperForApplicationSceneHandle:withVariant:]( self,  "_wallpaperForApplicationSceneHandle:withVariant:",  v8,  v9));

      [v11 setAlpha:0.0];
      -[PBWallpaperViewController setWallpaperView:](self, "setWallpaperView:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController view](self, "view"));
      [v12 addSubview:v11];
      id v16 = v6;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100132A54;
      v17[3] = &unk_1003CFF08;
      id v18 = v11;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100132A70;
      v15[3] = &unk_1003CFEE0;
      id v13 = v6;
      id v14 = v11;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v17,  v15,  v10);
    }
  }

- (void)updateWallpaperWithTransitionContext:(id)a3
{
  id v4 = a3;
  if (-[PBWallpaperViewController isViewLoaded](self, "isViewLoaded"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 animationFence]);
    +[UIScene _synchronizeDrawingWithFence:](&OBJC_CLASS___UIScene, "_synchronizeDrawingWithFence:", v5);

    if (self->_idleModeActive) {
      uint64_t v6 = 2LL;
    }
    else {
      uint64_t v6 = 1LL;
    }
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBWallpaperViewController _wallpaperForApplicationSceneHandle:withVariant:]( self,  "_wallpaperForApplicationSceneHandle:withVariant:",  v8,  v6));

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController view](self, "view"));
    [v9 setAlpha:0.0];
    [v10 addSubview:v9];
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 animationSettings]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100132C30;
    v15[3] = &unk_1003CFF08;
    id v16 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100132C4C;
    v13[3] = &unk_1003D63D8;
    v13[4] = self;
    id v14 = v16;
    id v12 = v16;
    +[BSUIAnimationFactory animateWithSettings:actions:completion:]( &OBJC_CLASS___BSUIAnimationFactory,  "animateWithSettings:actions:completion:",  v11,  v15,  v13);
  }
}

- (void)_handleDisplayBoundsDidChangeNotification:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController view](self, "view", a3));
  [v3 setNeedsLayout];
}

- (void)_updateWallpaperForApplicationSceneHandle:(id)a3
{
  id v4 = a3;
  if (-[PBWallpaperViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_idleModeActive) {
      uint64_t v5 = 2LL;
    }
    else {
      uint64_t v5 = 1LL;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBWallpaperViewController _wallpaperForApplicationSceneHandle:withVariant:]( self,  "_wallpaperForApplicationSceneHandle:withVariant:",  v4,  v5));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController view](self, "view"));
    [v7 addSubview:v6];
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBWallpaperViewController wallpaperView](self, "wallpaperView"));
    [v8 removeFromSuperview];

    -[PBWallpaperViewController setWallpaperView:](self, "setWallpaperView:", v6);
  }
}

- (id)_wallpaperForApplicationSceneHandle:(id)a3 withVariant:(int64_t)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 clientProcessBundleIdentifier]);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper pb_wallpaperViewForVariant:bundleIdentifier:]( &OBJC_CLASS___TVSUIWallpaper,  "pb_wallpaperViewForVariant:bundleIdentifier:",  a4,  v7));
  return v9;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)expectsEventForwarding
{
  return 0;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = (void (**)(void))a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100132F10;
  v15[3] = &unk_1003CFF08;
  void v15[4] = self;
  double v8 = objc_retainBlock(v15);
  uint64_t v9 = v8;
  if (v5)
  {
    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_100132F44;
    id v13 = &unk_1003CFF30;
    id v14 = v7;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v9,  &v10,  0.5);
  }

  else
  {
    ((void (*)(void *))v8[2])(v8);
    if (v7) {
      v7[2](v7);
    }
  }

  -[PBWallpaperViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 1LL, v10, v11, v12, v13);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = (void (**)(void))a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100133068;
  v15[3] = &unk_1003CFF08;
  void v15[4] = self;
  double v8 = objc_retainBlock(v15);
  uint64_t v9 = v8;
  if (v5)
  {
    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_10013309C;
    id v13 = &unk_1003CFF30;
    id v14 = v7;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v9,  &v10,  0.5);
  }

  else
  {
    ((void (*)(void *))v8[2])(v8);
    if (v7) {
      v7[2](v7);
    }
  }

  -[PBWallpaperViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL, v10, v11, v12, v13);
}

- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5
{
}

- (PBSystemOverlayContentDelegate)contentDelegate
{
  return (PBSystemOverlayContentDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void)setContentDelegate:(id)a3
{
}

- (BOOL)isIdleModeActive
{
  return self->_idleModeActive;
}

- (UIView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
}

- (BOOL)allowsInteraction
{
  return self->_allowsInteraction;
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

- (void).cxx_destruct
{
}

@end