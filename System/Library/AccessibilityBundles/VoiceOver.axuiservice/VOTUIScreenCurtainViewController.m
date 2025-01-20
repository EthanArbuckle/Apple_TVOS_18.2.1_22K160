@interface VOTUIScreenCurtainViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)enabled;
- (BOOL)hostingWindowShouldMoveForReachability;
- (NSString)screenshotActionHandlerIdentifier;
- (VOTUIScreenCurtainView)curtainView;
- (void)_updateScreenCurtainForInvertColors:(id)a3;
- (void)removeFromParentViewController;
- (void)setCurtainView:(id)a3;
- (void)setEnabled:(BOOL)a3 animate:(BOOL)a4;
- (void)setScreenshotActionHandlerIdentifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUIScreenCurtainViewController

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3 animate:(BOOL)a4
{
  if (self->_enabled && !a3)
  {
    double v6 = 0.3;
    if (!a4) {
      double v6 = 0.0;
    }
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_12D14;
    v17 = &unk_247D0;
    v18 = self;
    v7 = &v14;
LABEL_13:
    +[UIView animateWithDuration:animations:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:",  v7,  v6,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18);
    goto LABEL_14;
  }

  if (!self->_enabled && a3)
  {
    double v6 = 0.3;
    if (!a4) {
      double v6 = 0.0;
    }
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_12D48;
    v12 = &unk_247D0;
    v13 = self;
    v7 = &v9;
    goto LABEL_13;
  }

- (void)removeFromParentViewController
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTUIScreenCurtainViewController;
  -[VOTUIScreenCurtainViewController removeFromParentViewController](&v4, "removeFromParentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)_updateScreenCurtainForInvertColors:(id)a3
{
  if (self->_enabled)
  {
    v3 = self;
    if (AXIsInternalInstall())
    {
      if (CFPreferencesGetAppBooleanValue(@"UseAlpha1ScreenCurtain", kAXSAccessibilityPreferenceDomain, 0LL)) {
        double v4 = 1.0;
      }
      else {
        double v4 = 0.999999881;
      }
    }

    else
    {
      double v4 = 0.999999881;
    }

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController curtainView](v3, "curtainView"));
    BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
    if (IsInvertColorsEnabled
      || (v3 = (VOTUIScreenCurtainViewController *)objc_claimAutoreleasedReturnValue( +[AXSettings sharedInstance]( &OBJC_CLASS___AXSettings,  "sharedInstance")),  (-[VOTUIScreenCurtainViewController classicInvertColors](v3, "classicInvertColors") & 1) != 0))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  v4));
      [v8 setBackgroundColor:v6];

      if (IsInvertColorsEnabled) {
        goto LABEL_14;
      }
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  v4));
      [v8 setBackgroundColor:v7];
    }

LABEL_14:
  }

- (void)viewDidLoad
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[VOTUIScreenCurtainViewController setView:](self, "setView:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController view](self, "view"));
  [v8 setAutoresizingMask:18];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController view](self, "view"));
  [v9 autoresizesSubviews];

  uint64_t v10 = -[VOTUIScreenCurtainView initWithFrame:]( objc_alloc(&OBJC_CLASS___VOTUIScreenCurtainView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[VOTUIScreenCurtainViewController setCurtainView:](self, "setCurtainView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController curtainView](self, "curtainView"));
  [v11 setAutoresizingMask:18];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController curtainView](self, "curtainView"));
  [v12 setUserInteractionEnabled:0];

  if (self->_enabled)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_131FC;
    v23[3] = &unk_247D0;
    v23[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v23, 0.3);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController curtainView](self, "curtainView"));
    [v13 setAlpha:0.0];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController view](self, "view"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIScreenCurtainViewController curtainView](self, "curtainView"));
  [v14 addSubview:v15];

  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_1323C;
  v21[4] = sub_1324C;
  v16 = self;
  v22 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_13254;
  v20[3] = &unk_24758;
  v20[4] = v21;
  [v17 registerUpdateBlock:v20 forRetrieveSelector:"classicInvertColors" withListener:v16];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v18 addObserver:v16 selector:"_updateScreenCurtainForInvertColors:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  v19.receiver = v16;
  v19.super_class = (Class)&OBJC_CLASS___VOTUIScreenCurtainViewController;
  -[VOTUIScreenCurtainViewController viewDidLoad](&v19, "viewDidLoad");
  _Block_object_dispose(v21, 8);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 0;
}

- (VOTUIScreenCurtainView)curtainView
{
  return self->_curtainView;
}

- (void)setCurtainView:(id)a3
{
}

- (NSString)screenshotActionHandlerIdentifier
{
  return self->_screenshotActionHandlerIdentifier;
}

- (void)setScreenshotActionHandlerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end