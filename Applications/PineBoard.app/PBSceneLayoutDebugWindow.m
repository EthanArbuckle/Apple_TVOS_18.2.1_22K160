@interface PBSceneLayoutDebugWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_ignoresHitTest;
- (PBSceneLayoutDebugWindow)initWithWindowScene:(id)a3;
- (UILabel)keyboardVisibilityLabel;
- (UIView)focusedFrameView;
- (UIView)overlayInsetsView;
- (int)keyboardFocusedNotifyToken;
- (void)_checkKeyboardState;
- (void)_setFrame:(CGRect)a3 onView:(id)a4 animated:(BOOL)a5;
- (void)_updateFocusedFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)_updateOverlayInsets:(UIEdgeInsets)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)sceneManager:(id)a3 didUpdateFocusedFrame:(CGRect)a4 forFocusedScene:(id)a5;
- (void)sceneManager:(id)a3 didUpdateOverlayInsets:(UIEdgeInsets)a4 forFocusedScene:(id)a5;
@end

@implementation PBSceneLayoutDebugWindow

- (PBSceneLayoutDebugWindow)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___PBSceneLayoutDebugWindow;
  v5 = -[PBSceneLayoutDebugWindow initWithWindowScene:](&v46, "initWithWindowScene:", v4);
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___UIView);
    -[PBSceneLayoutDebugWindow bounds](v5, "bounds");
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    overlayInsetsView = v5->_overlayInsetsView;
    v5->_overlayInsetsView = v7;

    v9 = v5->_overlayInsetsView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_overlayInsetsView, "layer"));
    id v12 = objc_claimAutoreleasedReturnValue(+[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor"));
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(v12, "CGColor"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_overlayInsetsView, "layer"));
    [v13 setBorderWidth:2.0];

    -[PBSceneLayoutDebugWindow addSubview:](v5, "addSubview:", v5->_overlayInsetsView);
    v14 = objc_alloc(&OBJC_CLASS___UIView);
    -[PBSceneLayoutDebugWindow bounds](v5, "bounds");
    v15 = -[UIView initWithFrame:](v14, "initWithFrame:");
    focusedFrameView = v5->_focusedFrameView;
    v5->_focusedFrameView = v15;

    v17 = v5->_focusedFrameView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_focusedFrameView, "layer"));
    id v20 = objc_claimAutoreleasedReturnValue(+[UIColor blueColor](&OBJC_CLASS___UIColor, "blueColor"));
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v5->_focusedFrameView, "layer"));
    [v21 setBorderWidth:2.0];

    -[PBSceneLayoutDebugWindow addSubview:](v5, "addSubview:", v5->_focusedFrameView);
    v22 = objc_alloc_init(&OBJC_CLASS___UILabel);
    keyboardVisibilityLabel = v5->_keyboardVisibilityLabel;
    v5->_keyboardVisibilityLabel = v22;

    v24 = v5->_keyboardVisibilityLabel;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  16.0,  UIFontWeightSemibold));
    -[UILabel setFont:](v24, "setFont:", v25);

    v26 = v5->_keyboardVisibilityLabel;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](&OBJC_CLASS___UIColor, "redColor"));
    -[UILabel setTextColor:](v26, "setTextColor:", v27);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v5->_keyboardVisibilityLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[PBSceneLayoutDebugWindow addSubview:](v5, "addSubview:", v5->_keyboardVisibilityLabel);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_keyboardVisibilityLabel, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutDebugWindow topAnchor](v5, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);
    v47[0] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_keyboardVisibilityLabel, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutDebugWindow trailingAnchor](v5, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
    v47[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v34);

    -[PBSceneLayoutDebugWindow setWindowLevel:](v5, "setWindowLevel:", 1000000.0);
    -[PBSceneLayoutDebugWindow setOpaque:](v5, "setOpaque:", 0LL);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v35 addObserver:v5];
    objc_initWeak(&location, v5);
    v36 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10008BCD0;
    handler[3] = &unk_1003D2CA8;
    objc_copyWeak(&v44, &location);
    notify_register_dispatch(UIKeyboardOnScreenNotifyKey, &v5->_keyboardFocusedNotifyToken, &_dispatch_main_q, handler);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 focusedSceneHandle]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 sceneIfExists]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 clientSettings]);

    if ([v40 isUISubclass])
    {
      id v41 = v40;
      [v41 primaryWindowOverlayInsets];
      -[PBSceneLayoutDebugWindow _updateOverlayInsets:animated:](v5, "_updateOverlayInsets:animated:", 0LL);
      [v41 screenFocusedFrame];
      -[PBSceneLayoutDebugWindow _updateFocusedFrame:animated:](v5, "_updateFocusedFrame:animated:", 0LL);
    }

    -[PBSceneLayoutDebugWindow _checkKeyboardState](v5, "_checkKeyboardState");

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v3 removeObserver:self];

  int keyboardFocusedNotifyToken = self->_keyboardFocusedNotifyToken;
  if (keyboardFocusedNotifyToken != -1)
  {
    notify_cancel(keyboardFocusedNotifyToken);
    self->_int keyboardFocusedNotifyToken = -1;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSceneLayoutDebugWindow;
  -[PBSceneLayoutDebugWindow dealloc](&v5, "dealloc");
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void)_updateOverlayInsets:(UIEdgeInsets)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  -[PBSceneLayoutDebugWindow bounds](self, "bounds");
  -[PBSceneLayoutDebugWindow _setFrame:onView:animated:]( self,  "_setFrame:onView:animated:",  self->_overlayInsetsView,  v4,  left + v10,  top + v11,  v12 - (left + right),  v13 - (top + bottom));
}

- (void)_updateFocusedFrame:(CGRect)a3 animated:(BOOL)a4
{
}

- (void)_setFrame:(CGRect)a3 onView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  double v12 = v11;
  if (v5)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10008BF04;
    v13[3] = &unk_1003D41A8;
    double v16 = x;
    double v17 = y;
    double v18 = width;
    double v19 = height;
    id v14 = v11;
    v15 = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v13, 0.25);
  }

  else
  {
    objc_msgSend(v11, "setFrame:", x, y, width, height);
    -[PBSceneLayoutDebugWindow layoutSubviews](self, "layoutSubviews");
  }
}

- (void)_checkKeyboardState
{
  uint64_t state64 = 0LL;
  if (notify_get_state(self->_keyboardFocusedNotifyToken, &state64))
  {
    -[UILabel setText:](self->_keyboardVisibilityLabel, "setText:", @"Keyboard Focused: ?");
  }

  else
  {
    keyboardVisibilityLabel = self->_keyboardVisibilityLabel;
    if (state64 == 1) {
      BOOL v4 = @"YES";
    }
    else {
      BOOL v4 = @"NO";
    }
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Keyboard Focused: %@",  v4));
    -[UILabel setText:](keyboardVisibilityLabel, "setText:", v5);
  }

- (void)sceneManager:(id)a3 didUpdateOverlayInsets:(UIEdgeInsets)a4 forFocusedScene:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C04C;
  block[3] = &unk_1003D41D0;
  block[4] = self;
  UIEdgeInsets v6 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)sceneManager:(id)a3 didUpdateFocusedFrame:(CGRect)a4 forFocusedScene:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C0D4;
  block[3] = &unk_1003D41D0;
  block[4] = self;
  CGRect v6 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

- (UIView)focusedFrameView
{
  return self->_focusedFrameView;
}

- (UIView)overlayInsetsView
{
  return self->_overlayInsetsView;
}

- (int)keyboardFocusedNotifyToken
{
  return self->_keyboardFocusedNotifyToken;
}

- (UILabel)keyboardVisibilityLabel
{
  return self->_keyboardVisibilityLabel;
}

- (void).cxx_destruct
{
}

@end