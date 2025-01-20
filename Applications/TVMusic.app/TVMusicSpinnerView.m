@interface TVMusicSpinnerView
- (BOOL)isAnimating;
- (TVMusicSpinnerView)initWithFrame:(CGRect)a3;
- (TVMusicSpinnerView)initWithFrame:(CGRect)a3 color:(id)a4;
- (UIColor)color;
- (id)_spinnerImageForTraitCollection:(id)a3 size:(CGSize)a4 alpha:(double)a5;
- (void)_addAnimations;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_removeAnimations;
- (void)_updateImagesForTraitCollection:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)startAnimating;
- (void)stopAnimating;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVMusicSpinnerView

- (TVMusicSpinnerView)initWithFrame:(CGRect)a3
{
  return -[TVMusicSpinnerView initWithFrame:color:]( self,  "initWithFrame:color:",  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (TVMusicSpinnerView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___TVMusicSpinnerView;
  v11 = -[TVMusicSpinnerView initWithFrame:](&v39, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (!v11) {
    goto LABEL_14;
  }
  p_color = (void **)&v11->_color;
  objc_storeStrong((id *)&v11->_color, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v14 _graphicsQuality] != (id)10) {
    goto LABEL_5;
  }
  v15 = *p_color;

  if (!v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  0.6));
    v14 = *p_color;
    *p_color = (void *)v16;
LABEL_5:
  }

  v17 = *p_color;
  v18 = objc_alloc(&OBJC_CLASS___UIView);
  -[TVMusicSpinnerView bounds](v12, "bounds");
  v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
  spinnerContainer = v12->_spinnerContainer;
  v12->_spinnerContainer = v19;

  -[UIView setAutoresizingMask:](v12->_spinnerContainer, "setAutoresizingMask:", 18LL);
  -[UIView setContentMode:](v12->_spinnerContainer, "setContentMode:", 1LL);
  if (v17)
  {
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    double v21 = CGRectGetWidth(v40);
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    double v22 = CGRectGetHeight(v41);
    if (v21 >= v22) {
      double v22 = v21;
    }
    v23 = sub_100054F44(v10, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v12->_spinnerContainer, "layer"));
    id v26 = v24;
    objc_msgSend(v25, "setContents:", objc_msgSend(v26, "CGImage"));

    -[TVMusicSpinnerView addSubview:](v12, "addSubview:", v12->_spinnerContainer);
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v12->_spinnerContainer, "layer"));
    [v27 setCompositingFilter:kCAFilterOverlayBlendMode];

    -[TVMusicSpinnerView addSubview:](v12, "addSubview:", v12->_spinnerContainer);
    v28 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMusicSpinnerView bounds](v12, "bounds");
    v29 = -[UIView initWithFrame:](v28, "initWithFrame:");
    spinnerOverlayContainer = v12->_spinnerOverlayContainer;
    v12->_spinnerOverlayContainer = v29;

    -[UIView setAutoresizingMask:](v12->_spinnerOverlayContainer, "setAutoresizingMask:", 18LL);
    -[UIView setContentMode:](v12->_spinnerOverlayContainer, "setContentMode:", 1LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView traitCollection](v12, "traitCollection"));
    id v32 = [v31 userInterfaceStyle];
    v33 = (id *)&kCAFilterPlusL;
    if (v32 != (id)2) {
      v33 = (id *)&kCAFilterPlusD;
    }
    id v34 = *v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v12->_spinnerOverlayContainer, "layer"));
    [v35 setCompositingFilter:v34];

    -[TVMusicSpinnerView addSubview:](v12, "addSubview:", v12->_spinnerOverlayContainer);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView traitCollection](v12, "traitCollection"));
    -[TVMusicSpinnerView _updateImagesForTraitCollection:](v12, "_updateImagesForTraitCollection:", v36);

    id v26 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView layer](v12, "layer"));
    [v26 setAllowsGroupOpacity:0];
    [v26 setAllowsGroupBlending:0];
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v37 addObserver:v12 selector:"_applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
    [v37 addObserver:v12 selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];
  }

LABEL_14:
  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];
  [v3 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicSpinnerView;
  -[TVMusicSpinnerView dealloc](&v4, "dealloc");
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicSpinnerView;
  -[TVMusicSpinnerView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (!a3)
  {
    self->_shouldResumeAnimation = self->_animating;
    -[TVMusicSpinnerView stopAnimating](self, "stopAnimating");
  }

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicSpinnerView;
  -[TVMusicSpinnerView didMoveToWindow](&v5, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView window](self, "window"));
  if (v3)
  {
    BOOL shouldResumeAnimation = self->_shouldResumeAnimation;

    if (shouldResumeAnimation) {
      -[TVMusicSpinnerView startAnimating](self, "startAnimating");
    }
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVMusicSpinnerView;
  -[TVMusicSpinnerView traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView traitCollection](self, "traitCollection"));
  if (![v5 userInterfaceStyle])
  {
LABEL_6:

    goto LABEL_7;
  }

  id v6 = [v4 userInterfaceStyle];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView traitCollection](self, "traitCollection"));
  id v8 = [v7 userInterfaceStyle];

  if (v6 != v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView traitCollection](self, "traitCollection"));
    -[TVMusicSpinnerView _updateImagesForTraitCollection:](self, "_updateImagesForTraitCollection:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView traitCollection](self, "traitCollection"));
    id v11 = [v10 userInterfaceStyle];
    v12 = (id *)&kCAFilterPlusL;
    if (v11 != (id)2) {
      v12 = (id *)&kCAFilterPlusD;
    }
    id v13 = *v12;

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_spinnerOverlayContainer, "layer"));
    [v5 setCompositingFilter:v13];

    goto LABEL_6;
  }

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView window](self, "window", a3));
  if (v4)
  {
    BOOL shouldResumeAnimation = self->_shouldResumeAnimation;

    if (shouldResumeAnimation) {
      -[TVMusicSpinnerView startAnimating](self, "startAnimating");
    }
  }

- (void)_applicationWillResignActiveNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView window](self, "window", a3));

  if (v4)
  {
    self->_BOOL shouldResumeAnimation = self->_animating;
    -[TVMusicSpinnerView stopAnimating](self, "stopAnimating");
  }

- (void)startAnimating
{
  if (!self->_animating)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView window](self, "window"));

    if (v3)
    {
      self->_animating = 1;
      -[TVMusicSpinnerView _addAnimations](self, "_addAnimations");
    }

    else
    {
      self->_BOOL shouldResumeAnimation = 1;
    }
  }

- (void)stopAnimating
{
  if (self->_animating)
  {
    self->_animating = 0;
    -[TVMusicSpinnerView _removeAnimations](self, "_removeAnimations");
  }

- (id)_spinnerImageForTraitCollection:(id)a3 size:(CGSize)a4 alpha:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if ([v8 userInterfaceStyle] == (id)2
    || (v9 = [v8 userInterfaceStyle], double v10 = 0.0, v9 == (id)1000))
  {
    double v10 = 1.0;
  }

  if (width >= height) {
    double height = width;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v10, a5));
  v12 = sub_100054F44(v11, height);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (void)_updateImagesForTraitCollection:(id)a3
{
  id v4 = a3;
  -[TVMusicSpinnerView frame](self, "frame");
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicSpinnerView _spinnerImageForTraitCollection:size:alpha:]( self,  "_spinnerImageForTraitCollection:size:alpha:",  v4,  v5,  v6,  0.75));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_spinnerContainer, "layer"));
  id v14 = v7;
  objc_msgSend(v8, "setContents:", objc_msgSend(v14, "CGImage"));

  -[TVMusicSpinnerView frame](self, "frame");
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicSpinnerView _spinnerImageForTraitCollection:size:alpha:]( self,  "_spinnerImageForTraitCollection:size:alpha:",  v4,  v9,  v10,  0.3));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_spinnerOverlayContainer, "layer"));
  id v13 = v11;
  objc_msgSend(v12, "setContents:", objc_msgSend(v13, "CGImage"));
}

- (void)_addAnimations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSpinnerView layer](self, "layer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 animationForKey:@"repeatingGroupAnimation"]);

  if (!v4)
  {
    -[TVMusicSpinnerView setAlpha:](self, "setAlpha:", 0.0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100055A28;
    v17[3] = &unk_100268CF0;
    v17[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v17,  &stru_10026B190,  0.5,  0.0);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animation](&OBJC_CLASS___CABasicAnimation, "animation"));
    [v5 setKeyPath:@"opacity"];
    [v5 setDuration:0.0833333333];
    LODWORD(v6) = 2139095040;
    [v5 setRepeatCount:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
    [v5 setTimingFunction:v7];

    [v5 setFromValue:&off_100282480];
    [v5 setToValue:&off_100282490];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animation](&OBJC_CLASS___CAKeyframeAnimation, "animation"));
    double v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 12LL);
    uint64_t v10 = -30LL;
    do
    {
      v10 += 30LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v10 * 0.0174532925));
      -[NSMutableArray addObject:](v9, "addObject:", v11);
    }

    while ((unint64_t)v10 < 0x14A);
    [v8 setKeyPath:@"transform.rotation.z"];
    [v8 setValues:v9];
    [v8 setCalculationMode:@"discrete"];
    LODWORD(v12) = 2139095040;
    [v8 setRepeatCount:v12];
    [v8 setDuration:1.0];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](&OBJC_CLASS___CAAnimationGroup, "animation"));
    v18[0] = v5;
    v18[1] = v8;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    [v13 setAnimations:v14];

    [v13 setDuration:1.0e100];
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_spinnerContainer, "layer"));
    [v15 addAnimation:v13 forKey:@"repeatingGroupAnimation"];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_spinnerOverlayContainer, "layer"));
    [v16 addAnimation:v13 forKey:@"repeatingGroupAnimation"];

    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  }
}

- (void)_removeAnimations
{
  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100055AC0;
  v3[3] = &unk_100268CF0;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100055ACC;
  v2[3] = &unk_100268F50;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v3,  v2,  0.5,  0.0);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end