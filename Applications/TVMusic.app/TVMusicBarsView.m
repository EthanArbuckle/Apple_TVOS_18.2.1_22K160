@interface TVMusicBarsView
- (BOOL)isAnimating;
- (CGRect)_frameForBarAtIndex:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (TVMusicBarsView)init;
- (TVMusicBarsView)initWithFrame:(CGRect)a3;
- (id)_createBarViews;
- (unint64_t)musicBarsStyle;
- (void)_createAnimationForBarIndex:(int64_t)a3;
- (void)_createAnimations;
- (void)_updateMusicBarsStyle;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)resumeAnimating;
- (void)setAnimating:(BOOL)a3;
- (void)setMusicBarsStyle:(unint64_t)a3;
- (void)stopAnimating;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicBarsView

- (TVMusicBarsView)init
{
  return -[TVMusicBarsView initWithFrame:](self, "initWithFrame:", CGPointZero.x, CGPointZero.y, 25.0, 18.0);
}

- (TVMusicBarsView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVMusicBarsView;
  v3 = -[TVMusicBarsView initWithFrame:]( &v30,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView layer](v3, "layer"));
    [v5 setAllowsGroupOpacity:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView layer](v4, "layer"));
    [v6 setAllowsGroupBlending:0];

    v7 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMusicBarsView bounds](v4, "bounds");
    v8 = -[UIView initWithFrame:](v7, "initWithFrame:");
    containerView = v4->_containerView;
    v4->_containerView = v8;

    -[UIView setAutoresizingMask:](v4->_containerView, "setAutoresizingMask:", 18LL);
    -[TVMusicBarsView addSubview:](v4, "addSubview:", v4->_containerView);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    barMaskLayer = v4->_barMaskLayer;
    v4->_barMaskLayer = (CALayer *)v10;

    v12 = v4->_barMaskLayer;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_containerView, "layer"));
    [v13 setMask:v12];

    v4->_numberOfBars = 4LL;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[TVMusicBarsView _createBarViews](v4, "_createBarViews"));
    barViews = v4->_barViews;
    v4->_barViews = (NSArray *)v14;

    -[TVMusicBarsView setMusicBarsStyle:](v4, "setMusicBarsStyle:", 0LL);
    objc_initWeak(&location, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10007E198;
    v27[3] = &unk_10026AE58;
    objc_copyWeak(&v28, &location);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( [v16 addObserverForName:UIAccessibilityReduceTransparencyStatusDidChangeNotification object:0 queue:v17 usingBlock:v27]);
    didChangeReduceTransparencyNotification = v4->_didChangeReduceTransparencyNotification;
    v4->_didChangeReduceTransparencyNotification = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10007E1C4;
    v25[3] = &unk_10026AE58;
    objc_copyWeak(&v26, &location);
    uint64_t v22 = objc_claimAutoreleasedReturnValue( [v20 addObserverForName:UIApplicationDidBecomeActiveNotification object:0 queue:v21 usingBlock:v25]);
    didBecomeActiveNotification = v4->_didBecomeActiveNotification;
    v4->_didBecomeActiveNotification = v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicBarsView;
  -[TVMusicBarsView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_containerView, "layer"));
  [v3 bounds];
  -[CALayer setFrame:](self->_barMaskLayer, "setFrame:");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self->_didChangeReduceTransparencyNotification];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self->_didBecomeActiveNotification];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicBarsView;
  -[TVMusicBarsView dealloc](&v5, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicBarsView;
  -[TVMusicBarsView didMoveToWindow](&v5, "didMoveToWindow");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView window](self, "window"));

  if (v3)
  {
    -[TVMusicBarsView _updateMusicBarsStyle](self, "_updateMusicBarsStyle");
    if (-[TVMusicBarsView isAnimating](self, "isAnimating"))
    {
      if (-[NSArray count](self->_barViews, "count"))
      {
        unint64_t v4 = 0LL;
        do
          -[TVMusicBarsView _createAnimationForBarIndex:](self, "_createAnimationForBarIndex:", v4++);
        while (v4 < -[NSArray count](self->_barViews, "count"));
      }
    }
  }

- (void)resumeAnimating
{
  if (!-[TVMusicBarsView isAnimating](self, "isAnimating"))
  {
    -[TVMusicBarsView setAnimating:](self, "setAnimating:", 1LL);
    -[TVMusicBarsView _createAnimations](self, "_createAnimations");
  }

- (void)_createAnimations
{
  if (-[NSArray count](self->_barViews, "count"))
  {
    unint64_t v3 = 0LL;
    do
      -[TVMusicBarsView _createAnimationForBarIndex:](self, "_createAnimationForBarIndex:", v3++);
    while (v3 < -[NSArray count](self->_barViews, "count"));
  }

- (void)_createAnimationForBarIndex:(int64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_barViews, "objectAtIndexedSubscript:"));
  [v5 frame];
  double Width = CGRectGetWidth(v16);
  -[TVMusicBarsView bounds](self, "bounds");
  double Height = CGRectGetHeight(v17);
  double v8 = 2.0 / ((double)a3 + 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"bounds"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  0.0,  0.0,  Width,  Height * 5.0 / 12.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, 0.0, Width, Height, v10));
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithCGRect:]( &OBJC_CLASS___NSValue,  "valueWithCGRect:",  0.0,  0.0,  Width,  Height * 5.0 / 12.0));
  v15[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  [v9 setValues:v13];

  [v9 setDuration:v8];
  [v9 setKeyTimes:&off_1002821F8];
  LODWORD(v14) = 2139095040;
  [v9 setRepeatCount:v14];
  [v5 addAnimation:v9 forKey:@"bounds"];
}

- (void)stopAnimating
{
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  unint64_t v3 = self->_barViews;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v32;
    double v28 = 0.3;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationLayer", *(void *)&v28));
        [v9 bounds];
        CGFloat v11 = v10;
        double v13 = v12;
        double v30 = v14;
        double v16 = v15;

        [v8 bounds];
        double Width = CGRectGetWidth(v36);
        -[CALayer bounds](self->_barMaskLayer, "bounds");
        double v18 = CGRectGetHeight(v37) * v28;
        -[CALayer bounds](self->_barMaskLayer, "bounds");
        double Height = CGRectGetHeight(v38);
        v39.origin.x = 0.0;
        v39.origin.y = 0.0;
        v39.size.width = Width;
        v39.size.height = v18;
        double v20 = Height - CGRectGetHeight(v39);
        v40.origin.x = 0.0;
        v40.origin.y = 0.0;
        v40.size.width = Width;
        v40.size.height = v18;
        double v21 = CGRectGetHeight(v40);
        double v29 = v11;
        v41.origin.x = v11;
        v41.origin.y = v13;
        v41.size.width = v30;
        v41.size.height = v16;
        double v22 = CGRectGetHeight(v41);
        [v8 removeAllAnimations];
        if (v20 != 0.0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"bounds"));
          v24 = v23;
          double v25 = fabs((v21 - v22) / v20);
          if (v25 < 0.5) {
            double v25 = 0.5;
          }
          *(float *)&double v25 = v25;
          [v23 setSpeed:v25];
          id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v29, v13, v30, v16));
          [v24 setFromValue:v26];

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, 0.0, Width, v18));
          [v24 setToValue:v27];

          [v8 addAnimation:v24 forKey:@"bounds"];
          objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, v18);
        }
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
    }

    while (v5);
  }

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)setMusicBarsStyle:(unint64_t)a3
{
  self->_musicBarsStyle = a3;
  -[TVMusicBarsView _updateMusicBarsStyle](self, "_updateMusicBarsStyle");
}

- (void)_updateMusicBarsStyle
{
  unint64_t musicBarsStyle = self->_musicBarsStyle;
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  switch(musicBarsStyle)
  {
    case 0uLL:
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView traitCollection](self, "traitCollection"));
      id v6 = [v5 userInterfaceStyle];

      if (v6 != (id)2) {
        goto LABEL_7;
      }
      goto LABEL_3;
    case 1uLL:
LABEL_3:
      double v7 = 1.0;
      if (!IsReduceTransparencyEnabled) {
        double v7 = 0.6;
      }
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, v7));
      -[UIView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v8);

      if (IsReduceTransparencyEnabled) {
        goto LABEL_13;
      }
      v9 = &kCAFilterPlusL;
      goto LABEL_15;
    case 2uLL:
LABEL_7:
      BOOL v10 = !IsReduceTransparencyEnabled;
      double v11 = 0.5;
      goto LABEL_9;
    case 3uLL:
      BOOL v10 = !IsReduceTransparencyEnabled;
      double v11 = 0.6;
LABEL_9:
      double v12 = 1.0;
      if (v10) {
        double v12 = v11;
      }
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, v12));
      -[UIView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v13);

      if (IsReduceTransparencyEnabled)
      {
LABEL_13:
        id v15 = 0LL;
      }

      else
      {
        v9 = &kCAFilterPlusD;
LABEL_15:
        id v15 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v9));
      }

      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_containerView, "layer"));
      [v14 setCompositingFilter:v15];

      if (!IsReduceTransparencyEnabled) {
      return;
      }
    default:
      return;
  }

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7 && !-[TVMusicBarsView musicBarsStyle](self, "musicBarsStyle")) {
    -[TVMusicBarsView _updateMusicBarsStyle](self, "_updateMusicBarsStyle");
  }
}

- (CGRect)_frameForBarAtIndex:(int64_t)a3
{
  if (self)
  {
    int64_t numberOfBars = self->_numberOfBars;
    double v8 = v5 + (double)(numberOfBars - 1) * -3.0;
    double v9 = (double)numberOfBars;
  }

  else
  {
    double v8 = v5 + 3.0;
    double v9 = 0.0;
  }

  double v10 = v8 / v9;
  double v11 = (v8 / v9 + 3.0) * (double)a3;
  double v12 = v6 - v6 * 0.3;
  double v13 = v6 * 0.3;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_createBarViews
{
  if (self) {
    int64_t numberOfBars = self->_numberOfBars;
  }
  else {
    int64_t numberOfBars = 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", numberOfBars));
  if (numberOfBars >= 1)
  {
    for (uint64_t i = 0LL; i != numberOfBars; ++i)
    {
      -[TVMusicBarsView _frameForBarAtIndex:](self, "_frameForBarAtIndex:", i);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
      objc_msgSend(v14, "setAnchorPoint:", 0.5, 1.0);
      id v15 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

      [v14 setCornerRadius:1.0];
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
      -[CALayer addSublayer:](self->_barMaskLayer, "addSublayer:", v14);
      [v4 addObject:v14];
    }
  }

  id v16 = [v4 copy];

  return v16;
}

- (unint64_t)musicBarsStyle
{
  return self->_musicBarsStyle;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
}

@end