@interface PBVolumeSliderWrapperView
- (PBVolumeSlider)sliderView;
- (PBVolumeSliderWrapperView)initWithFrame:(CGRect)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)startIndeterminateAnimationWithDelay:(double)a3 headingUp:(BOOL)a4 completion:(id)a5;
- (void)stopIndeterminateAnimationWithCompletion:(id)a3;
@end

@implementation PBVolumeSliderWrapperView

- (PBVolumeSliderWrapperView)initWithFrame:(CGRect)a3
{
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___PBVolumeSliderWrapperView;
  v3 = -[PBVolumeSliderWrapperView initWithFrame:]( &v48,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterGaussianBlur));
    [v4 setCachesInputImage:0];
    [v4 setValue:@"default" forKey:kCAFilterInputQuality];
    uint64_t v5 = kCAFilterInputDither;
    [v4 setValue:&__kCFBooleanTrue forKey:kCAFilterInputDither];
    [v4 setValue:&__kCFBooleanTrue forKey:kCAFilterInputNormalizeEdges];
    [v4 setValue:&__kCFBooleanTrue forKey:kCAFilterInputHardEdges];
    [v4 setValue:&off_1003FD8A8 forKey:kCAFilterInputRadius];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterColorSaturate));
    [v6 setCachesInputImage:0];
    [v6 setValue:&off_1003FEA00 forKey:kCAFilterInputAmount];
    v7 = objc_alloc_init(&OBJC_CLASS___PBVolumeSliderBackgroundView);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v7;

    v9 = v3->_backgroundView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.243137255, 0.65));
    -[PBVolumeSliderBackgroundView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    [v11 setAllowsInPlaceFiltering:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    [v12 setReducesCaptureBitDepth:1];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    [v13 setScale:0.25];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    id v15 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    objc_msgSend(v14, "setShadowColor:", objc_msgSend(v15, "CGColor"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    LODWORD(v17) = 1051931443;
    [v16 setShadowOpacity:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    objc_msgSend(v18, "setShadowOffset:", 0.0, -2.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    [v19 setShadowRadius:20.0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    [v20 setShadowPathIsBounds:1];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderWrapperView layer](v3, "layer"));
    [v21 contentsScale];
    double v23 = v22;

    if (v23 == 1.0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
      [v24 setReducesCaptureBitDepth:0];

      [v4 setValue:&__kCFBooleanFalse forKey:v5];
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderBackgroundView backdropLayer](v3->_backgroundView, "backdropLayer"));
    v50[0] = v6;
    v50[1] = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
    [v25 setFilters:v26];

    -[PBVolumeSliderWrapperView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v27 = objc_alloc_init(&OBJC_CLASS___UIView);
    sliderWrapperView = v3->_sliderWrapperView;
    v3->_sliderWrapperView = v27;

    -[PBVolumeSliderWrapperView addSubview:](v3, "addSubview:", v3->_sliderWrapperView);
    v29 = objc_alloc_init(&OBJC_CLASS___PBVolumeSlider);
    sliderView = v3->_sliderView;
    v3->_sliderView = v29;

    -[UIView addSubview:](v3->_sliderWrapperView, "addSubview:", v3->_sliderView);
    v31 = objc_alloc_init(&OBJC_CLASS___UIView);
    indeterminateWrapperView = v3->_indeterminateWrapperView;
    v3->_indeterminateWrapperView = v31;

    -[UIView setClipsToBounds:](v3->_indeterminateWrapperView, "setClipsToBounds:", 1LL);
    -[UIView setHidden:](v3->_indeterminateWrapperView, "setHidden:", 1LL);
    -[PBVolumeSliderWrapperView addSubview:](v3, "addSubview:", v3->_indeterminateWrapperView);
    v33 = objc_alloc_init(&OBJC_CLASS___TVSUIGradientView);
    indeterminateGradientView = v3->_indeterminateGradientView;
    v3->_indeterminateGradientView = v33;

    -[TVSUIGradientView setAutoresizingMask:](v3->_indeterminateGradientView, "setAutoresizingMask:", 18LL);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIGradientView gradientLayer](v3->_indeterminateGradientView, "gradientLayer"));
    [v35 setMasksToBounds:1];

    v36 = v3->_indeterminateGradientView;
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.125490196,  0.125490196,  0.125490196,  1.0));
    -[TVSUIGradientView setBackgroundColor:](v36, "setBackgroundColor:", v37);

    -[TVSUIGradientView setAlpha:](v3->_indeterminateGradientView, "setAlpha:", 0.35);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIGradientView gradientLayer](v3->_indeterminateGradientView, "gradientLayer"));
    id v39 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.0));
    v49[0] = [v39 CGColor];
    id v40 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v49[1] = [v40 CGColor];
    id v41 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.0));
    v49[2] = [v41 CGColor];
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 3LL));
    [v38 setColors:v42];

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVSUIGradientView gradientLayer](v3->_indeterminateGradientView, "gradientLayer"));
    [v43 setLocations:&off_1003FE680];

    -[UIView addSubview:](v3->_indeterminateWrapperView, "addSubview:", v3->_indeterminateGradientView);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_indeterminateWrapperView, "layer"));
    [v44 setAllowsGroupBlending:0];

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_indeterminateWrapperView, "layer"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    [v45 setCompositingFilter:v46];
  }

  return v3;
}

- (void)startIndeterminateAnimationWithDelay:(double)a3 headingUp:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v37 = a5;
  LODWORD(v7) = 1051260355;
  LODWORD(v8) = 1062501089;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v7,  v9,  v8,  v10));
  v11 = -[UICubicTimingParameters initWithCustomCurve:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithCustomCurve:",  v38);
  v12 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentVolumeFadeDuration]);
  [v14 floatValue];
  v16 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v12,  "initWithDuration:timingParameters:",  v11,  v15);

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10008A540;
  v48[3] = &unk_1003CFF08;
  v48[4] = self;
  -[UIViewPropertyAnimator addAnimations:](v16, "addAnimations:", v48);
  if (v5)
  {
    CGAffineTransformMakeTranslation(&v47, 0.0, 230.0);
    CGFloat v17 = -230.0;
  }

  else
  {
    CGAffineTransformMakeTranslation(&v47, 0.0, -230.0);
    CGFloat v17 = 230.0;
  }

  CGAffineTransformMakeTranslation(&v46, 0.0, v17);
  indeterminateGradientView = self->_indeterminateGradientView;
  CGAffineTransform v45 = v47;
  -[TVSUIGradientView setTransform:](indeterminateGradientView, "setTransform:", &v45);
  -[UIView setHidden:](self->_indeterminateWrapperView, "setHidden:", 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 indeterminateAnimationMass]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 indeterminateAnimationStiffness]);

  double v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 indeterminateAnimationDamping]);

  v25 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  [v20 floatValue];
  double v27 = v26;
  [v22 floatValue];
  double v29 = v28;
  [v24 floatValue];
  v31 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v25,  "initWithMass:stiffness:damping:initialVelocity:",  v27,  v29,  v30,  0.0,  0.0);
  v32 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v31,  0.0);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10008A568;
  v43[3] = &unk_1003D40F8;
  v43[4] = self;
  CGAffineTransform v44 = v46;
  -[UIViewPropertyAnimator addAnimations:](v32, "addAnimations:", v43);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10008A5B0;
  v41[3] = &unk_1003D3F80;
  id v33 = v37;
  id v42 = v33;
  -[UIViewPropertyAnimator addCompletion:](v32, "addCompletion:", v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10008A5D0;
  v39[3] = &unk_1003D4120;
  v34 = v32;
  id v40 = v34;
  -[UIViewPropertyAnimator addCompletion:](v16, "addCompletion:", v39);
  -[PBVolumeSlider alpha](self->_sliderView, "alpha");
  if (fabs(v35 + -0.25) >= 0.00000011920929) {
    v36 = v16;
  }
  else {
    v36 = v34;
  }
  -[UIViewPropertyAnimator startAnimation](v36, "startAnimation");
}

- (void)stopIndeterminateAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  -[UIView setHidden:](self->_indeterminateWrapperView, "setHidden:", 1LL);
  LODWORD(v5) = 1051260355;
  LODWORD(v6) = 1062501089;
  LODWORD(v7) = 0;
  LODWORD(v8) = 1062501089;
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v5,  v7,  v6,  v8));
  double v10 = -[UICubicTimingParameters initWithCustomCurve:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithCustomCurve:",  v9);
  v11 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentVolumeFadeOutDuration]);
  [v13 floatValue];
  float v15 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v11,  "initWithDuration:timingParameters:",  v10,  v14);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10008A7B0;
  v22[3] = &unk_1003CFF08;
  v22[4] = self;
  -[UIViewPropertyAnimator addAnimations:](v15, "addAnimations:", v22);
  CGFloat v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10008A7D8;
  v20 = &unk_1003D3F80;
  id v21 = v4;
  id v16 = v4;
  -[UIViewPropertyAnimator addCompletion:](v15, "addCompletion:", &v17);
  -[UIViewPropertyAnimator startAnimation](v15, "startAnimation", v17, v18, v19, v20);
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBVolumeSliderWrapperView;
  -[PBVolumeSliderWrapperView layoutSubviews](&v12, "layoutSubviews");
  -[PBVolumeSliderWrapperView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PBVolumeSlider setFrame:](self->_sliderView, "setFrame:");
  -[PBVolumeSliderBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_sliderWrapperView, "setFrame:", v4, v6, v8, v10);
  indeterminateWrapperView = self->_indeterminateWrapperView;
  -[UIView bounds](self->_sliderWrapperView, "bounds");
  CGRect v14 = CGRectInset(v13, 1.0, 1.0);
  -[UIView setFrame:]( indeterminateWrapperView,  "setFrame:",  v14.origin.x,  v14.origin.y,  v14.size.width,  v14.size.height);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBVolumeSliderWrapperView;
  -[PBVolumeSliderWrapperView _setContinuousCornerRadius:](&v7, "_setContinuousCornerRadius:");
  -[PBVolumeSliderBackgroundView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderWrapperView sliderView](self, "sliderView"));
  [v5 _setContinuousCornerRadius:a3];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeSliderWrapperView sliderView](self, "sliderView"));
  [v6 setContinuousSliderCornerRadius:a3];

  -[UIView _setContinuousCornerRadius:](self->_indeterminateWrapperView, "_setContinuousCornerRadius:", a3);
}

- (PBVolumeSlider)sliderView
{
  return self->_sliderView;
}

- (void).cxx_destruct
{
}

@end