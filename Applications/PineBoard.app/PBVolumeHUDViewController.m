@interface PBVolumeHUDViewController
- (BOOL)alwaysWantsCompactSize;
- (BOOL)controlCenterActive;
- (BOOL)stretchVolumeSliderForMaximumVolumeUpdateIfNeeded;
- (BOOL)stretchVolumeSliderForMinimumVolumeUpdateIfNeeded;
- (BOOL)volumeDownButtonIsDown;
- (BOOL)volumeUpButtonIsDown;
- (PBVolumeSlider)volumeSlider;
- (PBVolumeSliderWrapperView)wrapperView;
- (int64_t)state;
- (void)dismissVolumeHUDWithCompletion:(id)a3;
- (void)hideIndeterminateVolumeHUDWithLevel:(id)a3 completion:(id)a4;
- (void)initializeVolumeHUDWithImage:(id)a3 level:(id)a4;
- (void)noteVolumeDownWasHit:(BOOL)a3;
- (void)noteVolumeUpWasHit:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setVolumeDownButtonIsDown:(BOOL)a3;
- (void)setVolumeSlider:(id)a3;
- (void)setVolumeUpButtonIsDown:(BOOL)a3;
- (void)setWrapperView:(id)a3;
- (void)showIndeterminateVolumeHUDHeadingUp:(BOOL)a3 completion:(id)a4;
- (void)stretchVolumeHUDWithLevel:(id)a3;
- (void)updateIndeterminateVolumeHUDWithLevel:(id)a3 completion:(id)a4;
- (void)updateVolumeHUDWithLevel:(id)a3 completion:(id)a4;
@end

@implementation PBVolumeHUDViewController

- (void)initializeVolumeHUDWithImage:(id)a3 level:(id)a4
{
  id v6 = a4;
  if (!self->_wrapperView)
  {
    id v7 = a3;
    double v8 = 12.0;
    if (!-[PBVolumeHUDViewController controlCenterActive](self, "controlCenterActive"))
    {
      if (-[PBVolumeHUDViewController alwaysWantsCompactSize](self, "alwaysWantsCompactSize")) {
        double v8 = 12.0;
      }
      else {
        double v8 = 74.0;
      }
    }

    if (-[PBVolumeHUDViewController controlCenterActive](self, "controlCenterActive")) {
      double v9 = 17.0;
    }
    else {
      double v9 = 50.0;
    }
    double v10 = 6.0;
    if (!-[PBVolumeHUDViewController controlCenterActive](self, "controlCenterActive"))
    {
      if (-[PBVolumeHUDViewController alwaysWantsCompactSize](self, "alwaysWantsCompactSize")) {
        double v10 = 6.0;
      }
      else {
        double v10 = 24.0;
      }
    }

    if (-[PBVolumeHUDViewController controlCenterActive](self, "controlCenterActive")) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = -[PBVolumeHUDViewController alwaysWantsCompactSize](self, "alwaysWantsCompactSize");
    }
    if (-[PBVolumeHUDViewController controlCenterActive](self, "controlCenterActive")) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = -[PBVolumeHUDViewController alwaysWantsCompactSize](self, "alwaysWantsCompactSize") ^ 1;
    }
    -[PBVolumeHUDViewController setState:](self, "setState:", v11);
    v13 = objc_alloc(&OBJC_CLASS___PBVolumeSliderWrapperView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDViewController view](self, "view"));
    [v14 frame];
    CGFloat v15 = v8 + v9;
    double v17 = v16 - v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDViewController view](self, "view"));
    [v18 frame];
    v20 = -[PBVolumeSliderWrapperView initWithFrame:](v13, "initWithFrame:", v17, (v19 + -230.0) * 0.5, v8, 230.0);
    wrapperView = self->_wrapperView;
    self->_wrapperView = v20;

    v22 = (PBVolumeSlider *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderWrapperView sliderView](self->_wrapperView, "sliderView"));
    volumeSlider = self->_volumeSlider;
    self->_volumeSlider = v22;

    -[PBVolumeSliderWrapperView _setContinuousCornerRadius:](self->_wrapperView, "_setContinuousCornerRadius:", v10);
    -[PBVolumeSlider setGlyphImage:](self->_volumeSlider, "setGlyphImage:", v7);

    -[PBVolumeSlider setGlyphVisible:](self->_volumeSlider, "setGlyphVisible:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDViewController view](self, "view"));
    [v24 addSubview:self->_wrapperView];

    -[PBVolumeSlider setNeedsLayout](self->_volumeSlider, "setNeedsLayout");
    -[PBVolumeSlider layoutIfNeeded](self->_volumeSlider, "layoutIfNeeded");
    CGAffineTransformMakeTranslation(&v37, v15, 0.0);
    v25 = self->_wrapperView;
    CGAffineTransform v36 = v37;
    -[PBVolumeSliderWrapperView setTransform:](v25, "setTransform:", &v36);
  }

  v26 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  140.0,  22.0,  0.0,  0.0);
  v27 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  -[UISpringTimingParameters settlingDuration](v26, "settlingDuration");
  v28 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v27, "initWithDuration:timingParameters:", v26);
  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472LL;
  v32 = sub_100085CEC;
  v33 = &unk_1003CFEB8;
  v34 = self;
  id v35 = v6;
  id v29 = v6;
  -[UIViewPropertyAnimator addAnimations:](v28, "addAnimations:", &v30);
  -[UIViewPropertyAnimator startAnimation](v28, "startAnimation", v30, v31, v32, v33, v34);
}

- (void)updateVolumeHUDWithLevel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[PBVolumeHUDViewController stretchVolumeSliderForMinimumVolumeUpdateIfNeeded]( self,  "stretchVolumeSliderForMinimumVolumeUpdateIfNeeded")
    && !-[PBVolumeHUDViewController stretchVolumeSliderForMaximumVolumeUpdateIfNeeded]( self,  "stretchVolumeSliderForMaximumVolumeUpdateIfNeeded"))
  {
    -[PBVolumeHUDViewController setState:](self, "setState:", 1LL);
    double v8 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  220.0,  30.0,  0.0,  0.0);
    double v9 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    -[UISpringTimingParameters settlingDuration](v8, "settlingDuration");
    double v10 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v9, "initWithDuration:timingParameters:", v8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100085EE0;
    v13[3] = &unk_1003CFEB8;
    v13[4] = self;
    id v14 = v6;
    -[UIViewPropertyAnimator addAnimations:](v10, "addAnimations:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100086004;
    v11[3] = &unk_1003D3F80;
    id v12 = v7;
    -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", v11);
    -[UIViewPropertyAnimator startAnimation](v10, "startAnimation");
  }
}

- (void)showIndeterminateVolumeHUDHeadingUp:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_state)
  {
    if ((id)-[PBVolumeHUDViewController state](self, "state") == (id)1) {
      -[PBVolumeSliderWrapperView startIndeterminateAnimationWithDelay:headingUp:completion:]( self->_wrapperView,  "startIndeterminateAnimationWithDelay:headingUp:completion:",  v4,  v6,  1.0);
    }
  }

  else
  {
    id v7 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  220.0,  30.0,  0.0,  0.0);
    double v8 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    -[UISpringTimingParameters settlingDuration](v7, "settlingDuration");
    double v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", v7);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008618C;
    v17[3] = &unk_1003CFF08;
    v17[4] = self;
    -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v17);
    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_10008629C;
    v13 = &unk_1003D3FA8;
    id v14 = self;
    BOOL v16 = v4;
    id v15 = v6;
    -[UIViewPropertyAnimator addCompletion:](v9, "addCompletion:", &v10);
    -[UIViewPropertyAnimator startAnimation](v9, "startAnimation", v10, v11, v12, v13, v14);
  }
}

- (void)hideIndeterminateVolumeHUDWithLevel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  wrapperView = self->_wrapperView;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10008637C;
  v11[3] = &unk_1003D2F08;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[PBVolumeSliderWrapperView stopIndeterminateAnimationWithCompletion:]( wrapperView,  "stopIndeterminateAnimationWithCompletion:",  v11);
}

- (void)updateIndeterminateVolumeHUDWithLevel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  220.0,  30.0,  0.0,  0.0);
  id v9 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  -[UISpringTimingParameters settlingDuration](v8, "settlingDuration");
  id v10 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v9, "initWithDuration:timingParameters:", v8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000864E0;
  v15[3] = &unk_1003CFEB8;
  v15[4] = self;
  id v16 = v6;
  id v11 = v6;
  -[UIViewPropertyAnimator addAnimations:](v10, "addAnimations:", v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100086604;
  v13[3] = &unk_1003D3F80;
  id v14 = v7;
  id v12 = v7;
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", v13);
  -[UIViewPropertyAnimator startAnimation](v10, "startAnimation");
}

- (void)stretchVolumeHUDWithLevel:(id)a3
{
  id v4 = a3;
  v5 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  300.0,  34.0,  0.0,  0.0);
  id v6 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  -[UISpringTimingParameters settlingDuration](v5, "settlingDuration");
  id v7 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v6, "initWithDuration:timingParameters:", v5);
  [v4 floatValue];
  BOOL v9 = fabsf(v8 + -1.0) < 0.00000011921;
  double v10 = 18.0;
  v12[1] = 3221225472LL;
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_10008673C;
  v12[3] = &unk_1003D1718;
  if (v9) {
    double v10 = -18.0;
  }
  double v14 = v10;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  -[UIViewPropertyAnimator addAnimations:](v7, "addAnimations:", v12);
  -[UIViewPropertyAnimator startAnimation](v7, "startAnimation");
}

- (void)dismissVolumeHUDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082DE4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1002782B4(v6);
  }

  id v7 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  140.0,  22.0,  0.0,  0.0);
  float v8 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  -[UISpringTimingParameters settlingDuration](v7, "settlingDuration");
  BOOL v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", v7);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000869C4;
  v16[3] = &unk_1003CFF08;
  v16[4] = self;
  -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v16);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_100086AC8;
  double v14 = &unk_1003D3F80;
  id v15 = v4;
  id v10 = v4;
  -[UIViewPropertyAnimator addCompletion:](v9, "addCompletion:", &v11);
  -[PBVolumeHUDViewController setState:](self, "setState:", 0LL, v11, v12, v13, v14);
  -[UIViewPropertyAnimator startAnimation](v9, "startAnimation");
}

- (void)noteVolumeUpWasHit:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100082DE4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1002782F4(v3, v6, v7, v8, v9, v10, v11, v12);
  }

  -[PBVolumeHUDViewController setVolumeUpButtonIsDown:](self, "setVolumeUpButtonIsDown:", v3);
}

- (void)noteVolumeDownWasHit:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100082DE4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100278374(v3, v6, v7, v8, v9, v10, v11, v12);
  }

  -[PBVolumeHUDViewController setVolumeDownButtonIsDown:](self, "setVolumeDownButtonIsDown:", v3);
}

- (void)setVolumeUpButtonIsDown:(BOOL)a3
{
  if (self->_volumeUpButtonIsDown != a3)
  {
    self->_volumeUpButtonIsDown = a3;
    if (a3)
    {
      -[PBVolumeHUDViewController stretchVolumeSliderForMaximumVolumeUpdateIfNeeded]( self,  "stretchVolumeSliderForMaximumVolumeUpdateIfNeeded");
    }

    else if (self->_state == 1)
    {
      -[PBVolumeSlider value](self->_volumeSlider, "value");
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      -[PBVolumeHUDViewController updateVolumeHUDWithLevel:completion:]( self,  "updateVolumeHUDWithLevel:completion:",  v4,  0LL);
    }
  }

- (void)setVolumeDownButtonIsDown:(BOOL)a3
{
  if (self->_volumeDownButtonIsDown != a3)
  {
    self->_volumeDownButtonIsDown = a3;
    if (a3)
    {
      -[PBVolumeHUDViewController stretchVolumeSliderForMinimumVolumeUpdateIfNeeded]( self,  "stretchVolumeSliderForMinimumVolumeUpdateIfNeeded");
    }

    else if (self->_state == 1)
    {
      -[PBVolumeSlider value](self->_volumeSlider, "value");
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      -[PBVolumeHUDViewController updateVolumeHUDWithLevel:completion:]( self,  "updateVolumeHUDWithLevel:completion:",  v4,  0LL);
    }
  }

- (BOOL)stretchVolumeSliderForMaximumVolumeUpdateIfNeeded
{
  if (v3 <= 0.98 || self->_state != 1 || !self->_volumeUpButtonIsDown) {
    return 0;
  }
  -[PBVolumeHUDViewController stretchVolumeHUDWithLevel:](self, "stretchVolumeHUDWithLevel:", &off_1003FD878);
  return 1;
}

- (BOOL)stretchVolumeSliderForMinimumVolumeUpdateIfNeeded
{
  if (v3 >= 0.02 || self->_state != 1 || !self->_volumeDownButtonIsDown) {
    return 0;
  }
  -[PBVolumeHUDViewController stretchVolumeHUDWithLevel:](self, "stretchVolumeHUDWithLevel:", &off_1003FD890);
  return 1;
}

- (BOOL)controlCenterActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  if ([v2 isPresenting])
  {
    float v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
    unsigned int v4 = [v3 isFullScreenOverlayActive] ^ 1;
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)alwaysWantsCompactSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 alwaysShowIndeterminateOnButtonPress];

  return v3;
}

- (BOOL)volumeUpButtonIsDown
{
  return self->_volumeUpButtonIsDown;
}

- (BOOL)volumeDownButtonIsDown
{
  return self->_volumeDownButtonIsDown;
}

- (PBVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
}

- (PBVolumeSliderWrapperView)wrapperView
{
  return self->_wrapperView;
}

- (void)setWrapperView:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end