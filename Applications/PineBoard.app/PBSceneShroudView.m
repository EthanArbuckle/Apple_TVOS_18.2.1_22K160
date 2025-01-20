@interface PBSceneShroudView
- (BOOL)isAnimating;
- (BOOL)isOverLiveScene;
- (PBSceneHandle)sceneHandle;
- (PBSceneShroudView)initWithSceneHandle:(id)a3 isOverLiveScene:(BOOL)a4;
- (UIActivityIndicatorView)activityIndicatorView;
- (UILabel)switchingLabel;
- (UIStackView)stackView;
- (UIView)applicationSnapshotView;
- (UIVisualEffectView)backgroundVisualEffectView;
- (void)_addSceneSnapshot;
- (void)_setBackgroundPresented:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setLabelAndActivityIndicatorPresented:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentAnimated:(BOOL)a3 completion:(id)a4;
- (void)setAnimating:(BOOL)a3;
@end

@implementation PBSceneShroudView

- (PBSceneShroudView)initWithSceneHandle:(id)a3 isOverLiveScene:(BOOL)a4
{
  id v7 = a3;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___PBSceneShroudView;
  v8 = -[PBSceneShroudView initWithFrame:]( &v65,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    id v64 = v7;
    objc_storeStrong((id *)&v8->_sceneHandle, a3);
    v9->_overLiveScene = a4;
    v10 = objc_alloc_init(&OBJC_CLASS___UIView);
    applicationSnapshotView = v9->_applicationSnapshotView;
    v9->_applicationSnapshotView = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v9->_applicationSnapshotView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[PBSceneShroudView addSubview:](v9, "addSubview:", v9->_applicationSnapshotView);
    v12 = objc_alloc_init(&OBJC_CLASS___UIVisualEffectView);
    backgroundVisualEffectView = v9->_backgroundVisualEffectView;
    v9->_backgroundVisualEffectView = v12;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v9->_backgroundVisualEffectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[PBSceneShroudView addSubview:](v9, "addSubview:", v9->_backgroundVisualEffectView);
    v14 = objc_alloc_init(&OBJC_CLASS___UILabel);
    switchingLabel = v9->_switchingLabel;
    v9->_switchingLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v9->_switchingLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v16 = v9->_switchingLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](v9->_switchingLabel, "layer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    [v18 setCompositingFilter:v19];

    v20 = v9->_switchingLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 colorWithAlphaComponent:0.5]);
    -[UILabel setTextColor:](v20, "setTextColor:", v22);

    -[UILabel setAlpha:](v9->_switchingLabel, "setAlpha:", 0.0);
    v23 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
    activityIndicatorView = v9->_activityIndicatorView;
    v9->_activityIndicatorView = v23;

    -[UIActivityIndicatorView setAlpha:](v9->_activityIndicatorView, "setAlpha:", 0.0);
    v25 = v9->_activityIndicatorView;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](v25, "setColor:", v26);

    v27 = v9->_activityIndicatorView;
    if (v9->_overLiveScene) {
      -[UIActivityIndicatorView startAnimating](v27, "startAnimating");
    }
    else {
      -[UIActivityIndicatorView setHidesWhenStopped:](v27, "setHidesWhenStopped:", 0LL);
    }
    v28 = objc_alloc(&OBJC_CLASS___UIStackView);
    v67[0] = v9->_switchingLabel;
    v67[1] = v9->_activityIndicatorView;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
    v30 = -[UIStackView initWithArrangedSubviews:](v28, "initWithArrangedSubviews:", v29);
    stackView = v9->_stackView;
    v9->_stackView = v30;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v9->_stackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v9->_stackView, "setAxis:", 1LL);
    -[UIStackView setAlignment:](v9->_stackView, "setAlignment:", 3LL);
    -[UIStackView setBaselineRelativeArrangement:](v9->_stackView, "setBaselineRelativeArrangement:", 1LL);
    -[UIStackView setCustomSpacing:afterView:](v9->_stackView, "setCustomSpacing:afterView:", v9->_switchingLabel, 40.0);
    -[PBSceneShroudView addSubview:](v9, "addSubview:", v9->_stackView);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v9->_applicationSnapshotView, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView leadingAnchor](v9, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
    v66[0] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v9->_applicationSnapshotView, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView trailingAnchor](v9, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v59]);
    v66[1] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v9->_applicationSnapshotView, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView topAnchor](v9, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v56]);
    v66[2] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v9->_applicationSnapshotView, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView bottomAnchor](v9, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v53]);
    v66[3] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v9->_backgroundVisualEffectView, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView leadingAnchor](v9, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
    v66[4] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v9->_backgroundVisualEffectView, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView topAnchor](v9, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
    v66[5] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v9->_backgroundVisualEffectView, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView trailingAnchor](v9, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v44]);
    v66[6] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v9->_backgroundVisualEffectView, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView bottomAnchor](v9, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v32]);
    v66[7] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v9->_stackView, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView centerYAnchor](v9, "centerYAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v35]);
    v66[8] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v9->_stackView, "centerXAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView centerXAnchor](v9, "centerXAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v38]);
    v66[9] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 10LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v40);

    id v7 = v64;
  }

  return v9;
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void))a4;
  if (-[PBSceneShroudView isAnimating](self, "isAnimating"))
  {
    if (v6) {
      v6[2](v6, 0LL);
    }
  }

  else
  {
    self->_animating = 1;
    id v7 = dispatch_group_create();
    -[PBSceneShroudView _addSceneSnapshot](self, "_addSceneSnapshot");
    dispatch_group_enter(v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000C6EA8;
    v16[3] = &unk_1003CFF08;
    v8 = v7;
    v17 = v8;
    -[PBSceneShroudView _setBackgroundPresented:animated:completion:]( self,  "_setBackgroundPresented:animated:completion:",  1LL,  v4,  v16);
    dispatch_group_enter(v8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000C6EC0;
    v14[3] = &unk_1003CFF08;
    v15 = v8;
    v9 = v8;
    -[PBSceneShroudView _setLabelAndActivityIndicatorPresented:animated:completion:]( self,  "_setLabelAndActivityIndicatorPresented:animated:completion:",  1LL,  v4,  v14);
    -[PBSceneShroudView _setAdditionalViewsPresented:animated:animationGroup:]( self,  "_setAdditionalViewsPresented:animated:animationGroup:",  1LL,  v4,  v9);
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C6ED8;
    block[3] = &unk_1003D0300;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    dispatch_group_notify(v9, &_dispatch_main_q, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void))a4;
  if (-[PBSceneShroudView isAnimating](self, "isAnimating"))
  {
    if (v6) {
      v6[2](v6, 0LL);
    }
  }

  else
  {
    self->_animating = 1;
    id v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000C70CC;
    v16[3] = &unk_1003CFF08;
    v8 = v7;
    v17 = v8;
    -[PBSceneShroudView _setBackgroundPresented:animated:completion:]( self,  "_setBackgroundPresented:animated:completion:",  0LL,  v4,  v16);
    dispatch_group_enter(v8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000C70E4;
    v14[3] = &unk_1003CFF08;
    v15 = v8;
    v9 = v8;
    -[PBSceneShroudView _setLabelAndActivityIndicatorPresented:animated:completion:]( self,  "_setLabelAndActivityIndicatorPresented:animated:completion:",  0LL,  v4,  v14);
    -[PBSceneShroudView _setAdditionalViewsPresented:animated:animationGroup:]( self,  "_setAdditionalViewsPresented:animated:animationGroup:",  0LL,  v4,  v9);
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C70FC;
    block[3] = &unk_1003D0300;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    dispatch_group_notify(v9, &_dispatch_main_q, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBSceneShroudView;
  -[PBSceneShroudView _setContinuousCornerRadius:](&v14, "_setContinuousCornerRadius:");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView subviews](self, "subviews", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) _setContinuousCornerRadius:a3];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_setLabelAndActivityIndicatorPresented:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = (void (**)(void))a5;
  switchingLabel = self->_switchingLabel;
  v23[0] = self->_applicationSnapshotView;
  v23[1] = switchingLabel;
  v23[2] = self->_activityIndicatorView;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000C7458;
  v20[3] = &unk_1003D2008;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
  id v21 = v10;
  BOOL v22 = v6;
  __int128 v11 = objc_retainBlock(v20);
  __int128 v12 = v11;
  if (v5)
  {
    __int128 v13 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.17,  0.17,  0.83,  0.83);
    objc_super v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    double v15 = 0.13;
    if (v6)
    {
      double v15 = 0.25;
      double v16 = 0.3;
    }

    else
    {
      double v16 = 0.1;
    }

    v17 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v14,  "initWithDuration:timingParameters:",  v13,  v15);
    -[UIViewPropertyAnimator addAnimations:](v17, "addAnimations:", v12);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000C7560;
    v18[3] = &unk_1003D3F80;
    v19 = v8;
    -[UIViewPropertyAnimator addCompletion:](v17, "addCompletion:", v18);
    -[UIViewPropertyAnimator startAnimationAfterDelay:](v17, "startAnimationAfterDelay:", v16);
  }

  else
  {
    ((void (*)(void *))v11[2])(v11);
    v8[2](v8);
  }
}

- (void)_setBackgroundPresented:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(void))a5;
  v9 = self->_backgroundVisualEffectView;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000C76F0;
  v17[3] = &unk_1003D2008;
  id v10 = v9;
  v18 = v10;
  BOOL v19 = a3;
  __int128 v11 = objc_retainBlock(v17);
  __int128 v12 = v11;
  if (v5)
  {
    __int128 v13 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.3,  0.17,  0.25,  1.0);
    objc_super v14 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v13,  0.53);
    -[UIViewPropertyAnimator addAnimations:](v14, "addAnimations:", v12);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000C7750;
    v15[3] = &unk_1003D3F80;
    double v16 = v8;
    -[UIViewPropertyAnimator addCompletion:](v14, "addCompletion:", v15);
    -[UIViewPropertyAnimator startAnimation](v14, "startAnimation");
  }

  else
  {
    ((void (*)(void *))v11[2])(v11);
    v8[2](v8);
  }
}

- (void)_addSceneSnapshot
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 createSnapshot]);

  id v5 = [v4 IOSurface];
  if (v5 || (id v5 = [v4 CGImage]) != 0)
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_applicationSnapshotView, "layer"));
    [v7 setContents:v6];
  }
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (BOOL)isOverLiveScene
{
  return self->_overLiveScene;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (UIView)applicationSnapshotView
{
  return self->_applicationSnapshotView;
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UILabel)switchingLabel
{
  return self->_switchingLabel;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void).cxx_destruct
{
}

@end