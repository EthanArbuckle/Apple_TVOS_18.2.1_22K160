@interface TVMusicProgressBarView
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)hideProgress;
- (CGPoint)focusTranslation;
- (TVMusicProgressBarView)initWithBarView:(id)a3;
- (TVMusicProgressBarView)initWithFrame:(CGRect)a3;
- (id)_initWithFrame:(CGRect)a3 barView:(id)a4;
- (void)_installMotionEffects;
- (void)_uninstallMotionEffects;
- (void)_updateProgress;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setFocusTranslation:(CGPoint)a3;
- (void)setHideProgress:(BOOL)a3;
- (void)setPlayheadStart:(double)a3;
@end

@implementation TVMusicProgressBarView

- (TVMusicProgressBarView)initWithFrame:(CGRect)a3
{
  return (TVMusicProgressBarView *)-[TVMusicProgressBarView _initWithFrame:barView:]( self,  "_initWithFrame:barView:",  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (TVMusicProgressBarView)initWithBarView:(id)a3
{
  return (TVMusicProgressBarView *)-[TVMusicProgressBarView _initWithFrame:barView:]( self,  "_initWithFrame:barView:",  a3,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
}

- (id)_initWithFrame:(CGRect)a3 barView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarView;
  v10 = -[TVMusicProgressBarView initWithFrame:](&v43, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[TVMusicProgressBarView setAccessibilityIdentifier:]( v10,  "setAccessibilityIdentifier:",  @"TVMusic.nowPlaying.progressBar");
    if (v9)
    {
      v12 = (UIView *)v9;
      barView = v11->_barView;
      v11->_barView = v12;
    }

    else if (+[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR"))
    {
      v14 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4017LL));
      v16 = -[UIVisualEffectView initWithEffect:](v14, "initWithEffect:", v15);
      v17 = v11->_barView;
      v11->_barView = v16;

      v18 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
      barView = (UIView *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4001LL));
      v19 = -[UIVisualEffectView initWithEffect:](v18, "initWithEffect:", barView);
      progressView = v11->_progressView;
      v11->_progressView = v19;
    }

    else
    {
      v21 = objc_alloc_init(&OBJC_CLASS___UIView);
      v22 = v11->_barView;
      v11->_barView = v21;

      v23 = objc_alloc_init(&OBJC_CLASS___UIView);
      v24 = v11->_progressView;
      v11->_progressView = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue( +[_UIBackdropViewSettings settingsForPrivateStyle:]( &OBJC_CLASS____UIBackdropViewSettings,  "settingsForPrivateStyle:",  4014LL));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 colorTint]);
      [v25 colorTintAlpha];
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "colorWithAlphaComponent:"));

      -[UIView setBackgroundColor:](v11->_barView, "setBackgroundColor:", v27);
      barView = (UIView *)objc_claimAutoreleasedReturnValue( +[_UIBackdropViewSettings settingsForPrivateStyle:]( &OBJC_CLASS____UIBackdropViewSettings,  "settingsForPrivateStyle:",  4001LL));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView colorTint](barView, "colorTint"));
      -[UIView colorTintAlpha](barView, "colorTintAlpha");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "colorWithAlphaComponent:"));

      -[UIView setBackgroundColor:](v11->_progressView, "setBackgroundColor:", v29);
    }

    v30 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundFillView = v11->_backgroundFillView;
    v11->_backgroundFillView = v30;

    v32 = objc_alloc_init(&OBJC_CLASS___UIView);
    fillMask = v11->_fillMask;
    v11->_fillMask = v32;

    v34 = v11->_fillMask;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v34, "setBackgroundColor:", v35);

    -[UIView addSubview:](v11->_backgroundFillView, "addSubview:", v11->_barView);
    -[UIView addSubview:](v11->_backgroundFillView, "addSubview:", v11->_progressView);
    -[UIView setMaskView:](v11->_backgroundFillView, "setMaskView:", v11->_fillMask);
    -[TVMusicProgressBarView addSubview:](v11, "addSubview:", v11->_backgroundFillView);
    v36 = objc_alloc_init(&OBJC_CLASS___UIView);
    progressMask = v11->_progressMask;
    v11->_progressMask = v36;

    v38 = v11->_progressMask;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

    -[UIView setMaskView:](v11->_progressView, "setMaskView:", v11->_progressMask);
    v40 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]( objc_alloc(&OBJC_CLASS___UIInterpolatingMotionEffect),  "initWithKeyPath:type:",  @"focusDirectionY",  1LL);
    -[UIMotionEffect setMinimumRelativeValue:](v40, "setMinimumRelativeValue:", &off_100282460);
    -[UIMotionEffect setMaximumRelativeValue:](v40, "setMaximumRelativeValue:", &off_100282470);
    motionFocusEffect = v11->_motionFocusEffect;
    v11->_motionFocusEffect = v40;
  }

  return v11;
}

- (void)_installMotionEffects
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView motionEffects](self, "motionEffects"));
  unsigned __int8 v4 = [v3 containsObject:self->_motionFocusEffect];

  if ((v4 & 1) == 0) {
    -[TVMusicProgressBarView addMotionEffect:](self, "addMotionEffect:", self->_motionFocusEffect);
  }
}

- (void)_uninstallMotionEffects
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView motionEffects](self, "motionEffects"));
  unsigned int v4 = [v3 containsObject:self->_motionFocusEffect];

  if (v4) {
    -[TVMusicProgressBarView removeMotionEffect:](self, "removeMotionEffect:", self->_motionFocusEffect);
  }
  -[TVMusicProgressBarView setFocusTranslation:](self, "setFocusTranslation:", CGPointZero.x, CGPointZero.y);
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarView;
  BOOL v7 = -[TVMusicProgressBarView _applyKeyPathsAndRelativeValues:forMotionEffect:]( &v12,  "_applyKeyPathsAndRelativeValues:forMotionEffect:",  v6,  a4);
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"focusDirectionY"]);
    [v8 doubleValue];
    double v10 = v9;

    -[TVMusicProgressBarView bounds](self, "bounds");
    -[TVMusicProgressBarView setFocusTranslation:](self, "setFocusTranslation:", 0.0, v10 * CGRectGetHeight(v13) * 0.25);
  }

  return v7;
}

- (void)_updateProgress
{
}

- (BOOL)hideProgress
{
  return -[UIView isHidden](self->_progressView, "isHidden");
}

- (void)setHideProgress:(BOOL)a3
{
}

- (void)setFocusTranslation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_focusTranslation.x != a3.x || self->_focusTranslation.y != a3.y)
  {
    self->_focusTranslation = a3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView layer](self, "layer"));
    CATransform3DMakeTranslation(&v7, x, y, 0.0);
    [v6 setTransform:&v7];
  }

- (void)setPlayheadStart:(double)a3
{
  if (self->_playheadStart != a3)
  {
    self->_playheadStart = a3;
    -[TVMusicProgressBarView _updateProgress](self, "_updateProgress");
  }

- (BOOL)canBecomeFocused
{
  return -[TVMusicProgressBarView isUserInteractionEnabled](self, "isUserInteractionEnabled");
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarView;
  -[TVMusicProgressBarView layoutSubviews](&v7, "layoutSubviews");
  -[TVMusicProgressBarView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundFillView, "setFrame:");
  CGRect v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_fillMask, "layer"));
  -[UIView frame](self->_fillMask, "frame");
  [v3 setCornerRadius:CGRectGetHeight(v8) * 0.5];

  fillMask = self->_fillMask;
  -[UIView bounds](self->_backgroundFillView, "bounds");
  -[UIView setFrame:](fillMask, "setFrame:");
  barView = self->_barView;
  -[UIView bounds](self->_backgroundFillView, "bounds");
  CGRect v10 = CGRectInset(v9, 0.0, -20.0);
  -[UIView setFrame:](barView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  progressView = self->_progressView;
  -[UIView bounds](self->_backgroundFillView, "bounds");
  -[UIView setFrame:](progressView, "setFrame:");
  -[TVMusicProgressBarView _updateProgress](self, "_updateProgress");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMusicProgressBarView;
  -[TVMusicProgressBarView didUpdateFocusInContext:withAnimationCoordinator:]( &v15,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  CGRect v8 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIView, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);

    if (!v11)
    {
      unsigned __int8 v12 = 0;
      goto LABEL_7;
    }

    unsigned __int8 v12 = -[TVMusicProgressBarView isDescendantOfView:](self, "isDescendantOfView:", v11);
    CGRect v8 = (void *)v11;
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

LABEL_7:
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000473E0;
  v13[3] = &unk_100268F28;
  unsigned __int8 v14 = v12;
  v13[4] = self;
  [v7 addCoordinatedAnimations:v13 completion:&stru_10026AC98];
}

- (CGPoint)focusTranslation
{
  double x = self->_focusTranslation.x;
  double y = self->_focusTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end