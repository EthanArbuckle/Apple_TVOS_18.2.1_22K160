@interface PBPIPControlsViewController
- (NSArray)activeButtons;
- (PBPIPControlButton)moveQuadrantButton;
- (PBPIPControlsDelegate)delegate;
- (PBPIPControlsViewController)initWithQuadrant:(int64_t)a3 mode:(unint64_t)a4;
- (UIAction)moveQuadrantAction;
- (UIStackView)stackView;
- (UIView)gradientView;
- (id)_layoutContextMenu;
- (id)_moveControl;
- (id)preferredFocusEnvironments;
- (int64_t)currentQuadrant;
- (unint64_t)mode;
- (void)_animateButtonsCoolportWithTargetAlpha:(double)a3 targetTransform:(CGAffineTransform *)a4;
- (void)cancelPictureInPictureButtonPressed:(id)a3;
- (void)didSwipeDown:(id)a3;
- (void)didSwipeUp:(id)a3;
- (void)downPressed:(id)a3;
- (void)endButtonPressed:(id)a3;
- (void)enterSplitViewButtonPressed:(id)a3;
- (void)expandPictureInPictureButtonPressed:(id)a3;
- (void)hideControlsAnimated:(BOOL)a3 completion:(id)a4;
- (void)menuPressed:(id)a3;
- (void)movePictureInPictureButtonPressed:(id)a3;
- (void)playPausePressed:(id)a3;
- (void)setActiveButtons:(id)a3;
- (void)setCurrentQuadrant:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setMoveQuadrantButton:(id)a3;
- (void)setStackView:(id)a3;
- (void)showControlsAnimated:(BOOL)a3 shrinkingEffect:(BOOL)a4;
- (void)toggleStashingButtonPressed:(id)a3;
- (void)upPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBPIPControlsViewController

- (PBPIPControlsViewController)initWithQuadrant:(int64_t)a3 mode:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBPIPControlsViewController;
  v6 = -[PBPIPControlsViewController init](&v10, "init");
  if (v6)
  {
    v7 = objc_opt_new(&OBJC_CLASS___UIStackView);
    stackView = v6->_stackView;
    v6->_stackView = v7;

    v6->_currentQuadrant = a3;
    v6->_mode = a4;
  }

  return v6;
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___PBPIPControlsViewController;
  -[PBPIPControlsViewController viewDidLoad](&v53, "viewDidLoad");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlsViewController view](self, "view"));
  [v40 setInsetsLayoutMarginsFromSafeArea:0];
  objc_msgSend(v40, "setLayoutMargins:", 10.0, 10.0, 10.0, 10.0);
  id obj = (id)objc_claimAutoreleasedReturnValue( +[PBPIPViewBuilder makePipGradientViewWithCornerRadius:]( &OBJC_CLASS___PBPIPViewBuilder,  "makePipGradientViewWithCornerRadius:",  1LL));
  [obj setAlpha:0.0];
  [v40 addSubview:obj];
  objc_storeStrong((id *)&self->_gradientView, obj);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlsViewController stackView](self, "stackView"));
  [v40 addSubview:v45];
  [v45 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v45 setAxis:0];
  [v45 setAlignment:3];
  [v45 setDistribution:1];
  [v45 setSpacing:20.0];
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  unint64_t mode = self->_mode;
  v5 = &off_1003FE890;
  if (mode == 1) {
    v5 = &off_1003FE8A8;
  }
  if (mode == 2) {
    v6 = &off_1003FE8C0;
  }
  else {
    v6 = v5;
  }
  v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v7);
        }
        switch((unint64_t)[*(id *)(*((void *)&v49 + 1) + 8 * (void)i) unsignedIntegerValue])
        {
          case 0uLL:
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl stopPictureInPicture](&OBJC_CLASS___PBPIPControl, "stopPictureInPicture"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 createButton]);

            [v12 addTarget:self action:"expandPictureInPictureButtonPressed:" forControlEvents:0x2000];
            goto LABEL_18;
          case 1uLL:
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlsViewController _moveControl](self, "_moveControl"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v15 createButton]);

            [v12 addTarget:self action:"movePictureInPictureButtonPressed:" forControlEvents:0x2000];
            objc_storeStrong((id *)&self->_moveQuadrantButton, v12);
            goto LABEL_18;
          case 2uLL:
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl cancelPictureInPicture](&OBJC_CLASS___PBPIPControl, "cancelPictureInPicture"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v13 createButton]);

            [v12 addTarget:self action:"cancelPictureInPictureButtonPressed:" forControlEvents:0x2000];
            goto LABEL_18;
          case 3uLL:
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl end](&OBJC_CLASS___PBPIPControl, "end"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v16 createButton]);

            [v12 addTarget:self action:"endButtonPressed:" forControlEvents:0x2000];
            goto LABEL_18;
          case 4uLL:
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl hidePictureInPicture](&OBJC_CLASS___PBPIPControl, "hidePictureInPicture"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v14 createButton]);

            [v12 addTarget:self action:"toggleStashingButtonPressed:" forControlEvents:0x2000];
            goto LABEL_18;
          case 5uLL:
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl pictureInPictureLayout](&OBJC_CLASS___PBPIPControl, "pictureInPictureLayout"));
            v12 = (void *)objc_claimAutoreleasedReturnValue([v17 createButton]);

            objc_initWeak(&location, self);
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472LL;
            v46[2] = sub_100167B14;
            v46[3] = &unk_1003D2288;
            objc_copyWeak(&v47, &location);
            [v12 setMenuProvider:v46];
            objc_destroyWeak(&v47);
            objc_destroyWeak(&location);
LABEL_18:
            if (v12)
            {
              [v45 addArrangedSubview:v12];
              -[NSMutableArray addObject:](v3, "addObject:", v12);
            }

            break;
          default:
            continue;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }

    while (v8);
  }

  to = v3;
  unint64_t v18 = (unint64_t)[to count];
  if (v18 >= 3 && (v18 & 1) != 0)
  {
    unint64_t v19 = v18 >> 1;
    v20 = (void *)objc_claimAutoreleasedReturnValue([to objectAtIndex:v18 >> 1]);
    [to removeObjectAtIndex:v19];
    [to insertObject:v20 atIndex:0];
  }

  v21 = (NSArray *)[to copy];
  activeButtons = self->_activeButtons;
  self->_activeButtons = v21;

  v43 = (void *)objc_claimAutoreleasedReturnValue([v40 layoutMarginsGuide]);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "pb_constraintsForPinningToBottomOfView:", v40));
  [v42 addObjectsFromArray:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v45 centerXAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 centerXAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v41]);
  v54[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v45 bottomAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v43 bottomAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
  v54[1] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v45 widthAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v43 widthAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintLessThanOrEqualToAnchor:v30]);
  v54[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 3LL));
  [v42 addObjectsFromArray:v32];

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v42);
  v33 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v33, "setAllowedPressTypes:", &off_1003FE830);
  [v40 addGestureRecognizer:v33];
  v34 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "playPausePressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v34, "setAllowedPressTypes:", &off_1003FE848);
  [v40 addGestureRecognizer:v34];
  v35 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "downPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v35, "setAllowedPressTypes:", &off_1003FE860);
  [v40 addGestureRecognizer:v35];
  v36 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  self,  "didSwipeDown:");
  -[UISwipeGestureRecognizer setDirection:](v36, "setDirection:", 8LL);
  [v40 addGestureRecognizer:v36];
  v37 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "upPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v37, "setAllowedPressTypes:", &off_1003FE878);
  [v40 addGestureRecognizer:v37];
  v38 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  self,  "didSwipeUp:");
  -[UISwipeGestureRecognizer setDirection:](v38, "setDirection:", 4LL);
  [v40 addGestureRecognizer:v38];
  -[PBPIPControlsViewController hideControlsAnimated:completion:](self, "hideControlsAnimated:completion:", 0LL, 0LL);
}

- (void)setCurrentQuadrant:(int64_t)a3
{
  self->_currentQuadrant = a3;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100167BE8;
  v3[3] = &unk_1003D0890;
  objc_copyWeak(&v4, &location);
  dispatch_async(&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)preferredFocusEnvironments
{
  return self->_activeButtons;
}

- (void)_animateButtonsCoolportWithTargetAlpha:(double)a3 targetTransform:(CGAffineTransform *)a4
{
  v7 = self->_activeButtons;
  id v8 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100167E1C;
  v24[3] = &unk_1003D1718;
  v24[4] = self;
  double v26 = a3;
  uint64_t v9 = v7;
  v25 = v9;
  objc_super v10 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v8,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v24,  0.15,  0.25,  0.0,  0.75,  1.0);
  -[UIViewPropertyAnimator startAnimation](v10, "startAnimation");
  v11 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  150.0,  17.0,  0.0,  0.0);
  v12 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  -[UISpringTimingParameters settlingDuration](v11, "settlingDuration");
  v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v12, "initWithDuration:timingParameters:", v11);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  unint64_t v18 = sub_100167F24;
  unint64_t v19 = &unk_1003D40F8;
  v20 = v9;
  __int128 v14 = *(_OWORD *)&a4->c;
  __int128 v21 = *(_OWORD *)&a4->a;
  __int128 v22 = v14;
  __int128 v23 = *(_OWORD *)&a4->tx;
  v15 = v9;
  -[UIViewPropertyAnimator addAnimations:](v13, "addAnimations:", &v16);
  -[UIViewPropertyAnimator startAnimation](v13, "startAnimation", v16, v17, v18, v19);
}

- (void)showControlsAnimated:(BOOL)a3 shrinkingEffect:(BOOL)a4
{
  BOOL v5 = a3;
  CGAffineTransformMakeScale(&v54, 0.5, 0.5);
  v7 = self->_activeButtons;
  id v8 = v7;
  if (v5)
  {
    if (!a4)
    {
      __int128 v31 = *(_OWORD *)&CGAffineTransformIdentity.c;
      __int128 v33 = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v54.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v54.c = v31;
      __int128 v29 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      *(_OWORD *)&v54.tx = v29;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v50,  v57,  16LL);
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v51;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v51 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
            *(_OWORD *)&v49.a = v33;
            *(_OWORD *)&v49.c = v31;
            *(_OWORD *)&v49.tx = v29;
            [v13 setTransform:&v49];
          }

          id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v50,  v57,  16LL);
        }

        while (v10);
      }
    }

    if (_os_feature_enabled_impl("PineBoard", "Coolport"))
    {
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v14 = v8;
      id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v45,  v56,  16LL);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v46;
        do
        {
          for (j = 0LL; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v46 != v17) {
              objc_enumerationMutation(v14);
            }
            unint64_t v19 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
            CGAffineTransform v49 = v54;
            [v19 setTransform:&v49];
          }

          id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v45,  v56,  16LL);
        }

        while (v16);
      }

      __int128 v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v49.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v49.c = v20;
      *(_OWORD *)&v49.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[PBPIPControlsViewController _animateButtonsCoolportWithTargetAlpha:targetTransform:]( self,  "_animateButtonsCoolportWithTargetAlpha:targetTransform:",  &v49,  1.0);
    }

    else
    {
      double v26 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1001683C4;
      v39[3] = &unk_1003D9C38;
      v39[4] = self;
      uint64_t v41 = 0x3FF0000000000000LL;
      v40 = v8;
      __int128 v27 = *(_OWORD *)&CGAffineTransformIdentity.c;
      __int128 v42 = *(_OWORD *)&CGAffineTransformIdentity.a;
      __int128 v43 = v27;
      __int128 v44 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v28 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v26,  "initWithDuration:curve:animations:",  0LL,  v39,  0.4);
      -[UIViewPropertyAnimator startAnimation](v28, "startAnimation");
    }
  }

  else
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v35,  v55,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v36;
      __int128 v32 = *(_OWORD *)&CGAffineTransformIdentity.c;
      __int128 v34 = *(_OWORD *)&CGAffineTransformIdentity.a;
      __int128 v30 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      do
      {
        for (k = 0LL; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v8);
          }
          v25 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)k);
          *(_OWORD *)&v49.a = v34;
          *(_OWORD *)&v49.c = v32;
          *(_OWORD *)&v49.tx = v30;
          objc_msgSend(v25, "setTransform:", &v49, v30, v32, v34);
          [v25 setAlpha:1.0];
        }

        id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v35,  v55,  16LL);
      }

      while (v22);
    }
  }
}

- (void)hideControlsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  CGAffineTransformMakeScale(&v28, 0.01, 0.01);
  CGAffineTransformMakeScale(&v27, 0.5, 0.5);
  v7 = self->_activeButtons;
  id v8 = v7;
  if (v4)
  {
    if (_os_feature_enabled_impl("PineBoard", "Coolport"))
    {
      CGAffineTransform v26 = v27;
      -[PBPIPControlsViewController _animateButtonsCoolportWithTargetAlpha:targetTransform:]( self,  "_animateButtonsCoolportWithTargetAlpha:targetTransform:",  &v26,  0.0);
    }

    else
    {
      __int128 v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100168778;
      v22[3] = &unk_1003D9C38;
      v22[4] = self;
      uint64_t v24 = 0LL;
      uint64_t v23 = v8;
      CGAffineTransform v25 = v28;
      id v15 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v14,  "initWithDuration:curve:animations:",  0LL,  v22,  0.4);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1001688AC;
      v20[3] = &unk_1003D3F80;
      id v21 = v6;
      -[UIViewPropertyAnimator addCompletion:](v15, "addCompletion:", v20);
      -[UIViewPropertyAnimator startAnimation](v15, "startAnimation");
    }
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v29,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          [v13 setAlpha:0.0];
          CGAffineTransform v26 = v28;
          [v13 setTransform:&v26];
        }

        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v29,  16LL);
      }

      while (v10);
    }

    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)expandPictureInPictureButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsDidSelectStopPictureInPicture:self];
}

- (void)movePictureInPictureButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained controlsDidSelectMovePictureInPictureToNextQuadrant:self];

  -[PBPIPControlsViewController setCurrentQuadrant:](self, "setCurrentQuadrant:", v5);
}

- (void)cancelPictureInPictureButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsDidSelectCancelPictureInPicture:self];
}

- (void)endButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  [v5 disconnectAllCalls];

  -[PBPIPControlsViewController cancelPictureInPictureButtonPressed:](self, "cancelPictureInPictureButtonPressed:", v4);
}

- (void)toggleStashingButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsDidSelectTogglePictureInPictureStashing:self];
}

- (void)enterSplitViewButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsDidSelectEnterSplitView:self];
}

- (void)menuPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsDidSelectDismissControls:self];
}

- (void)playPausePressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsDidSelectTogglePlayPause:self];
}

- (void)downPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controls:self requestPagingSkipByNumberOfPages:1];
}

- (void)didSwipeDown:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controls:self requestPagingSkipByNumberOfPages:1];
}

- (void)upPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controls:self requestPagingSkipByNumberOfPages:-1];
}

- (void)didSwipeUp:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controls:self requestPagingSkipByNumberOfPages:-1];
}

- (UIAction)moveQuadrantAction
{
  moveQuadrantAction = self->_moveQuadrantAction;
  if (!moveQuadrantAction)
  {
    objc_initWeak(&location, self);
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    uint64_t v11 = sub_100168CE4;
    v12 = &unk_1003D22B0;
    objc_copyWeak(&v13, &location);
    id v4 = objc_retainBlock(&v9);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlsViewController _moveControl](self, "_moveControl", v9, v10, v11, v12));
    v6 = (UIAction *)objc_claimAutoreleasedReturnValue([v5 createActionWithHandler:v4]);
    v7 = self->_moveQuadrantAction;
    self->_moveQuadrantAction = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    moveQuadrantAction = self->_moveQuadrantAction;
  }

  return moveQuadrantAction;
}

- (id)_layoutContextMenu
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100168FBC;
  v19[3] = &unk_1003D22B0;
  objc_copyWeak(&v20, &location);
  v3 = objc_retainBlock(v19);
  v17[1] = 3221225472LL;
  v17[2] = sub_100168FFC;
  v17[3] = &unk_1003D22B0;
  v17[0] = _NSConcreteStackBlock;
  objc_copyWeak(&v18, &location);
  id v4 = objc_retainBlock(v17);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBPIPControl layoutOptionPictureInPicture]( &OBJC_CLASS___PBPIPControl,  "layoutOptionPictureInPicture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 createActionWithHandler:0]);

  [v6 setState:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl layoutOptionSplitView](&OBJC_CLASS___PBPIPControl, "layoutOptionSplitView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 createActionWithHandler:v3]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBPIPControl layoutOptionFullScreenPictureInPicture]( &OBJC_CLASS___PBPIPControl,  "layoutOptionFullScreenPictureInPicture"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 createActionWithHandler:v4]);

  v23[0] = v6;
  v23[1] = v8;
  v23[2] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIMenu menuWithTitle:image:identifier:options:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:image:identifier:options:children:",  &stru_1003E2910,  0LL,  0LL,  33LL,  v11));
  v22[0] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPControlsViewController moveQuadrantAction](self, "moveQuadrantAction"));
  v22[1] = v13;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](&OBJC_CLASS___UIMenu, "menuWithChildren:", v14));
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v15;
}

- (id)_moveControl
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBPIPControl movePictureInPictureWithCurrentQuadrant:]( &OBJC_CLASS___PBPIPControl,  "movePictureInPictureWithCurrentQuadrant:",  -[PBPIPControlsViewController currentQuadrant](self, "currentQuadrant")));
}

- (PBPIPControlsDelegate)delegate
{
  return (PBPIPControlsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSArray)activeButtons
{
  return self->_activeButtons;
}

- (void)setActiveButtons:(id)a3
{
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (PBPIPControlButton)moveQuadrantButton
{
  return self->_moveQuadrantButton;
}

- (void)setMoveQuadrantButton:(id)a3
{
}

- (int64_t)currentQuadrant
{
  return self->_currentQuadrant;
}

- (void).cxx_destruct
{
}

@end