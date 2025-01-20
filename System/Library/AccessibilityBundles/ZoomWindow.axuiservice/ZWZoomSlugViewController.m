@interface ZWZoomSlugViewController
+ (double)longPressDurationForStandByMode:(BOOL)a3;
+ (double)standByLongPressDuration;
+ (double)zoomedInLongPressDuration;
- (AXAssertion)disableDashBoardGesturesForLongPressAssertion;
- (AXAssertion)disableDashBoardGesturesForPanAssertion;
- (AXDispatchTimer)dimTimer;
- (BOOL)_panGestureIsRecognizing;
- (BOOL)allGesturesEnabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)inSpeakUnderFingerMode;
- (BOOL)isInPanZoomingMode;
- (BOOL)isInUserRepositioningMode;
- (BOOL)isOrbPanning;
- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3;
- (BOOL)shouldHideWhileOrbing;
- (BOOL)tapGesturesEnabled;
- (BOOL)userIsInteractingWithSlug;
- (CGPoint)deltaFromInitialTouch;
- (CGPoint)deltaFromLastPanEvent;
- (CGPoint)offsetForAutopanner:(id)a3;
- (CGRect)slugRingViewBoundsInScreenCoordinates;
- (NSLayoutConstraint)bottomTriangleRadiusDistanceConstraint;
- (NSLayoutConstraint)circlePivotHeightConstraint;
- (NSLayoutConstraint)circlePivotOffsetXConstraint;
- (NSLayoutConstraint)circlePivotOffsetYConstraint;
- (NSLayoutConstraint)circlePivotWidthConstraint;
- (NSLayoutConstraint)collapsingRingHeightConstraint;
- (NSLayoutConstraint)collapsingRingWidthConstraint;
- (NSLayoutConstraint)leftTriangleRadiusDistanceConstraint;
- (NSLayoutConstraint)rightTriangleRadiusDistanceConstraint;
- (NSLayoutConstraint)topTriangleRadiusDistanceConstraint;
- (UILongPressGestureRecognizer)longPress;
- (UILongPressGestureRecognizer)longPressGesture;
- (UIPanGestureRecognizer)panGesture;
- (UITapGestureRecognizer)doubleTapGesture;
- (UITapGestureRecognizer)singleTapGesture;
- (UITapGestureRecognizer)tripleTapGesture;
- (ZWSlugCirclePivotingView)circlePivotingView;
- (ZWSlugCollapsingRingView)slugRingView;
- (ZWSlugTriangleView)bottomTriangleView;
- (ZWSlugTriangleView)leftTriangleView;
- (ZWSlugTriangleView)rightTriangleView;
- (ZWSlugTriangleView)topTriangleView;
- (ZWZoomSlugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ZWZoomSlugViewControllerDelegate)delegate;
- (double)currentOffsetAngle;
- (double)idleSlugOpacity;
- (unint64_t)slugAppearanceState;
- (void)_didBeginInteractingWithSlug;
- (void)_didFinishInteractingWithSlug;
- (void)_dimAfterDelay;
- (void)_handleDoubleTap:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handleSingleTap:(id)a3;
- (void)_handleTripleTap:(id)a3;
- (void)_updateAccessibilityHint;
- (void)_updateControllerColor;
- (void)_updateControllerThickness;
- (void)_updateGestures;
- (void)_updateRingAndTriangleVisiblity:(BOOL)a3;
- (void)_updateSlugAppearanceForMode:(unint64_t)a3;
- (void)_updateSlugDimStatus:(BOOL)a3 Animated:(BOOL)a4;
- (void)dealloc;
- (void)loadView;
- (void)setAllGesturesEnabled:(BOOL)a3;
- (void)setBottomTriangleRadiusDistanceConstraint:(id)a3;
- (void)setBottomTriangleView:(id)a3;
- (void)setCirclePivotHeightConstraint:(id)a3;
- (void)setCirclePivotOffsetXConstraint:(id)a3;
- (void)setCirclePivotOffsetYConstraint:(id)a3;
- (void)setCirclePivotWidthConstraint:(id)a3;
- (void)setCirclePivotingView:(id)a3;
- (void)setCollapsingRingHeightConstraint:(id)a3;
- (void)setCollapsingRingWidthConstraint:(id)a3;
- (void)setCurrentOffsetAngle:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDeltaFromInitialTouch:(CGPoint)a3;
- (void)setDeltaFromLastPanEvent:(CGPoint)a3;
- (void)setDimTimer:(id)a3;
- (void)setDisableDashBoardGesturesForLongPressAssertion:(id)a3;
- (void)setDisableDashBoardGesturesForPanAssertion:(id)a3;
- (void)setDoubleTapGesture:(id)a3;
- (void)setIdleSlugOpacity:(double)a3;
- (void)setInPanZoomingMode:(BOOL)a3;
- (void)setInSpeakUnderFingerMode:(BOOL)a3;
- (void)setInUserRepositioningMode:(BOOL)a3;
- (void)setIsOrbPanning:(BOOL)a3;
- (void)setLeftTriangleRadiusDistanceConstraint:(id)a3;
- (void)setLeftTriangleView:(id)a3;
- (void)setLongPress:(id)a3;
- (void)setLongPressGesture:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setRightTriangleRadiusDistanceConstraint:(id)a3;
- (void)setRightTriangleView:(id)a3;
- (void)setShouldHideWhileOrbing:(BOOL)a3;
- (void)setSingleTapGesture:(id)a3;
- (void)setSlugAppearanceState:(unint64_t)a3;
- (void)setSlugRingView:(id)a3;
- (void)setTapGesturesEnabled:(BOOL)a3;
- (void)setTopTriangleRadiusDistanceConstraint:(id)a3;
- (void)setTopTriangleView:(id)a3;
- (void)setTripleTapGesture:(id)a3;
- (void)setUserIsInteractingWithSlug:(BOOL)a3;
- (void)updateIdleSlugOpacityAndPreviewImmediately:(double)a3;
- (void)updateLongPressDuration:(double)a3;
- (void)userInteractionHasBecomeActiveWithFirstTouchAtLocation:(CGPoint)a3;
- (void)userInteractionHasBecomeIdle;
- (void)wakeSlug;
@end

@implementation ZWZoomSlugViewController

- (ZWZoomSlugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___ZWZoomSlugViewController;
  v8 = -[ZWZoomSlugViewController initWithNibName:bundle:](&v32, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v9 zoomIdleSlugOpacity];
    -[ZWZoomSlugViewController setIdleSlugOpacity:](v8, "setIdleSlugOpacity:");

    v10 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWZoomSlugViewController setDimTimer:](v8, "setDimTimer:", v10);

    v8->_allGesturesEnabled = 1;
    v8->_tapGesturesEnabled = 1;
    objc_initWeak(&location, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke;
    v29[3] = &unk_6CB98;
    objc_copyWeak(&v30, &location);
    [v11 registerUpdateBlock:v29 forRetrieveSelector:"zoomSlugSingleTapAction" withListener:v8];

    objc_destroyWeak(&v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_2;
    v27[3] = &unk_6CB98;
    objc_copyWeak(&v28, &location);
    [v12 registerUpdateBlock:v27 forRetrieveSelector:"zoomSlugDoubleTapAction" withListener:v8];

    objc_destroyWeak(&v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_3;
    v25[3] = &unk_6CB98;
    objc_copyWeak(&v26, &location);
    [v13 registerUpdateBlock:v25 forRetrieveSelector:"zoomSlugTripleTapAction" withListener:v8];

    objc_destroyWeak(&v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_4;
    v23[3] = &unk_6CB98;
    objc_copyWeak(&v24, &location);
    [v14 registerUpdateBlock:v23 forRetrieveSelector:"zoomSlugTapAndSlideToAdjustZoomLevelEnabled" withListener:v8];

    objc_destroyWeak(&v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_5;
    v21 = &unk_6CB98;
    objc_copyWeak(&v22, &location);
    [v15 registerUpdateBlock:&v18 forRetrieveSelector:"zoomControllerColor" withListener:v8];

    objc_destroyWeak(&v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  v18,  v19,  v20,  v21));
    [v16 addObserver:v8 selector:"_updateControllerThickness" name:kAXSEnhanceTextLegibilityChangedNotification object:0];

    objc_destroyWeak(&location);
  }

  return v8;
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAccessibilityHint];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAccessibilityHint];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAccessibilityHint];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestures];
}

void __51__ZWZoomSlugViewController_initWithNibName_bundle___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateControllerColor];
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWZoomSlugViewController;
  -[ZWZoomSlugViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  id v3 = objc_alloc(&OBJC_CLASS___ZWSlugBackgroundView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = -[ZWSlugBackgroundView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[ZWSlugBackgroundView setSemanticContentAttribute:](v7, "setSemanticContentAttribute:", 2LL);
  -[ZWSlugBackgroundView setAccessibilityIgnoresInvertColors:](v7, "setAccessibilityIgnoresInvertColors:", 1LL);
  -[ZWSlugBackgroundView setDelegate:](v7, "setDelegate:", self);
  -[ZWZoomSlugViewController setView:](self, "setView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v8 setHidden:1];

  v9 = -[ZWSlugCollapsingRingView initWithFrame:]( objc_alloc(&OBJC_CLASS___ZWSlugCollapsingRingView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[ZWSlugBackgroundView addSubview:](v7, "addSubview:", v9);
  -[ZWZoomSlugViewController setSlugRingView:](self, "setSlugRingView:", v9);
  v10 = -[ZWSlugCirclePivotingView initWithFrame:]( objc_alloc(&OBJC_CLASS___ZWSlugCirclePivotingView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[ZWSlugBackgroundView addSubview:](v7, "addSubview:", v10);
  -[ZWZoomSlugViewController setCirclePivotingView:](self, "setCirclePivotingView:", v10);
  v81 = -[ZWSlugTriangleView initWithTriangle:](objc_alloc(&OBJC_CLASS___ZWSlugTriangleView), "initWithTriangle:", 3LL);
  -[ZWSlugBackgroundView addSubview:](v7, "addSubview:", v81);
  -[ZWZoomSlugViewController setLeftTriangleView:](self, "setLeftTriangleView:", v81);
  v82 = -[ZWSlugTriangleView initWithTriangle:](objc_alloc(&OBJC_CLASS___ZWSlugTriangleView), "initWithTriangle:", 1LL);
  -[ZWSlugBackgroundView addSubview:](v7, "addSubview:", v82);
  -[ZWZoomSlugViewController setRightTriangleView:](self, "setRightTriangleView:", v82);
  v79 = -[ZWSlugTriangleView initWithTriangle:](objc_alloc(&OBJC_CLASS___ZWSlugTriangleView), "initWithTriangle:", 2LL);
  -[ZWSlugBackgroundView addSubview:](v7, "addSubview:", v79);
  -[ZWZoomSlugViewController setBottomTriangleView:](self, "setBottomTriangleView:", v79);
  v80 = -[ZWSlugTriangleView initWithTriangle:](objc_alloc(&OBJC_CLASS___ZWSlugTriangleView), "initWithTriangle:", 0LL);
  -[ZWSlugBackgroundView addSubview:](v7, "addSubview:", v80);
  -[ZWZoomSlugViewController setTopTriangleView:](self, "setTopTriangleView:", v80);
  -[ZWSlugBackgroundView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  7LL,  0LL,  0LL,  0LL,  1.0,  150.0));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  8LL,  0LL,  0LL,  0LL,  1.0,  150.0));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v12);

  LODWORD(v13) = 1148846080;
  -[ZWSlugBackgroundView setContentCompressionResistancePriority:forAxis:]( v7,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v13);
  LODWORD(v14) = 1148846080;
  -[ZWSlugBackgroundView setContentCompressionResistancePriority:forAxis:]( v7,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v14);
  LODWORD(v15) = 1148846080;
  -[ZWSlugBackgroundView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0LL, v15);
  LODWORD(v16) = 1148846080;
  -[ZWSlugBackgroundView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1LL, v16);
  -[ZWSlugCollapsingRingView setTranslatesAutoresizingMaskIntoConstraints:]( v9,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v17) = 1148846080;
  -[ZWSlugCollapsingRingView setContentCompressionResistancePriority:forAxis:]( v9,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v17);
  LODWORD(v18) = 1148846080;
  -[ZWSlugCollapsingRingView setContentCompressionResistancePriority:forAxis:]( v9,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v18);
  LODWORD(v19) = 1148846080;
  -[ZWSlugCollapsingRingView setContentHuggingPriority:forAxis:](v9, "setContentHuggingPriority:forAxis:", 0LL, v19);
  LODWORD(v20) = 1148846080;
  -[ZWSlugCollapsingRingView setContentHuggingPriority:forAxis:](v9, "setContentHuggingPriority:forAxis:", 1LL, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  7LL,  0LL,  0LL,  0LL,  1.0,  60.0));
  -[ZWZoomSlugViewController setCollapsingRingWidthConstraint:](self, "setCollapsingRingWidthConstraint:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  8LL,  0LL,  0LL,  0LL,  1.0,  60.0));
  -[ZWZoomSlugViewController setCollapsingRingHeightConstraint:](self, "setCollapsingRingHeightConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingWidthConstraint](self, "collapsingRingWidthConstraint"));
  v84[0] = v23;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingHeightConstraint](self, "collapsingRingHeightConstraint"));
  v84[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
  v84[2] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  10LL,  0LL,  v7,  10LL,  1.0,  0.0));
  v84[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 4LL));
  -[ZWSlugBackgroundView addConstraints:](v7, "addConstraints:", v27);

  -[ZWSlugCirclePivotingView setTranslatesAutoresizingMaskIntoConstraints:]( v10,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v28) = 1148846080;
  -[ZWSlugCirclePivotingView setContentCompressionResistancePriority:forAxis:]( v10,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v28);
  LODWORD(v29) = 1148846080;
  -[ZWSlugCirclePivotingView setContentCompressionResistancePriority:forAxis:]( v10,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v29);
  LODWORD(v30) = 1148846080;
  -[ZWSlugCirclePivotingView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 0LL, v30);
  LODWORD(v31) = 1148846080;
  -[ZWSlugCirclePivotingView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 1LL, v31);
  objc_super v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  7LL,  0LL,  0LL,  0LL,  1.0,  16.0));
  -[ZWZoomSlugViewController setCirclePivotWidthConstraint:](self, "setCirclePivotWidthConstraint:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  8LL,  0LL,  0LL,  0LL,  1.0,  16.0));
  -[ZWZoomSlugViewController setCirclePivotHeightConstraint:](self, "setCirclePivotHeightConstraint:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
  -[ZWZoomSlugViewController setCirclePivotOffsetXConstraint:](self, "setCirclePivotOffsetXConstraint:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  10LL,  0LL,  v7,  10LL,  1.0,  0.0));
  -[ZWZoomSlugViewController setCirclePivotOffsetYConstraint:](self, "setCirclePivotOffsetYConstraint:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotWidthConstraint](self, "circlePivotWidthConstraint"));
  v83[0] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotHeightConstraint](self, "circlePivotHeightConstraint"));
  v83[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetXConstraint](self, "circlePivotOffsetXConstraint"));
  v83[2] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetYConstraint](self, "circlePivotOffsetYConstraint"));
  v83[3] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 4LL));
  -[ZWSlugBackgroundView addConstraints:](v7, "addConstraints:", v40);

  -[ZWSlugTriangleView setTranslatesAutoresizingMaskIntoConstraints:]( v80,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v41) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v80,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v41);
  LODWORD(v42) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v80,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v42);
  LODWORD(v43) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v80, "setContentHuggingPriority:forAxis:", 0LL, v43);
  LODWORD(v44) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v80, "setContentHuggingPriority:forAxis:", 1LL, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v80,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v80,  10LL,  0LL,  v7,  10LL,  1.0,  -20.0));
  -[ZWZoomSlugViewController setTopTriangleRadiusDistanceConstraint:]( self,  "setTopTriangleRadiusDistanceConstraint:",  v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController topTriangleRadiusDistanceConstraint]( self,  "topTriangleRadiusDistanceConstraint"));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v47);

  -[ZWSlugTriangleView setTranslatesAutoresizingMaskIntoConstraints:]( v79,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v48) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v79,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v48);
  LODWORD(v49) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v79,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v49);
  LODWORD(v50) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v79, "setContentHuggingPriority:forAxis:", 0LL, v50);
  LODWORD(v51) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v79, "setContentHuggingPriority:forAxis:", 1LL, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v79,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v79,  10LL,  0LL,  v7,  10LL,  1.0,  20.0));
  -[ZWZoomSlugViewController setBottomTriangleRadiusDistanceConstraint:]( self,  "setBottomTriangleRadiusDistanceConstraint:",  v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController bottomTriangleRadiusDistanceConstraint]( self,  "bottomTriangleRadiusDistanceConstraint"));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v54);

  -[ZWSlugTriangleView setTranslatesAutoresizingMaskIntoConstraints:]( v81,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v55) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v81,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v55);
  LODWORD(v56) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v81,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v56);
  LODWORD(v57) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v81, "setContentHuggingPriority:forAxis:", 0LL, v57);
  LODWORD(v58) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v81, "setContentHuggingPriority:forAxis:", 1LL, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v81,  10LL,  0LL,  v7,  10LL,  1.0,  0.0));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v81,  9LL,  0LL,  v7,  9LL,  1.0,  -20.0));
  -[ZWZoomSlugViewController setLeftTriangleRadiusDistanceConstraint:]( self,  "setLeftTriangleRadiusDistanceConstraint:",  v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController leftTriangleRadiusDistanceConstraint]( self,  "leftTriangleRadiusDistanceConstraint"));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v61);

  -[ZWSlugTriangleView setTranslatesAutoresizingMaskIntoConstraints:]( v82,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  LODWORD(v62) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v82,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v62);
  LODWORD(v63) = 1148846080;
  -[ZWSlugTriangleView setContentCompressionResistancePriority:forAxis:]( v82,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v63);
  LODWORD(v64) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v82, "setContentHuggingPriority:forAxis:", 0LL, v64);
  LODWORD(v65) = 1148846080;
  -[ZWSlugTriangleView setContentHuggingPriority:forAxis:](v82, "setContentHuggingPriority:forAxis:", 1LL, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v82,  10LL,  0LL,  v7,  10LL,  1.0,  0.0));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v82,  9LL,  0LL,  v7,  9LL,  1.0,  20.0));
  -[ZWZoomSlugViewController setRightTriangleRadiusDistanceConstraint:]( self,  "setRightTriangleRadiusDistanceConstraint:",  v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController rightTriangleRadiusDistanceConstraint]( self,  "rightTriangleRadiusDistanceConstraint"));
  -[ZWSlugBackgroundView addConstraint:](v7, "addConstraint:", v68);

  v69 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handleLongPress:");
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v70 addGestureRecognizer:v69];

  -[ZWZoomSlugViewController setLongPressGesture:](self, "setLongPressGesture:", v69);
  -[UILongPressGestureRecognizer setDelegate:](v69, "setDelegate:", self);
  +[ZWZoomSlugViewController standByLongPressDuration]( &OBJC_CLASS___ZWZoomSlugViewController,  "standByLongPressDuration");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v69, "setMinimumPressDuration:");
  -[ZWZoomSlugViewController setLongPress:](self, "setLongPress:", v69);
  v71 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleTripleTap:");
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v71, "setNumberOfTapsRequired:", 3LL);
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v72 addGestureRecognizer:v71];

  -[ZWZoomSlugViewController setTripleTapGesture:](self, "setTripleTapGesture:", v71);
  -[UITapGestureRecognizer setDelegate:](v71, "setDelegate:", self);
  v73 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleDoubleTap:");
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v73, "setNumberOfTapsRequired:", 2LL);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v74 addGestureRecognizer:v73];

  -[ZWZoomSlugViewController setDoubleTapGesture:](self, "setDoubleTapGesture:", v73);
  -[UITapGestureRecognizer setDelegate:](v73, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v73, "requireGestureRecognizerToFail:", v71);
  v75 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleSingleTap:");
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v76 addGestureRecognizer:v75];

  -[ZWZoomSlugViewController setSingleTapGesture:](self, "setSingleTapGesture:", v75);
  -[UITapGestureRecognizer setDelegate:](v75, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v75, "requireGestureRecognizerToFail:", v73);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v75, "requireGestureRecognizerToFail:", v71);
  v77 = -[UIPanGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePan:");
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v78 addGestureRecognizer:v77];

  -[ZWZoomSlugViewController setPanGesture:](self, "setPanGesture:", v77);
  -[UIPanGestureRecognizer setDelegate:](v77, "setDelegate:", self);
  -[ZWZoomSlugViewController _updateGestures](self, "_updateGestures");
  -[ZWZoomSlugViewController _dimAfterDelay](self, "_dimAfterDelay");
  -[ZWZoomSlugViewController _updateControllerColor](self, "_updateControllerColor");
  -[ZWZoomSlugViewController _updateControllerThickness](self, "_updateControllerThickness");
  -[ZWZoomSlugViewController _updateAccessibilityHint](self, "_updateAccessibilityHint");
}

- (CGRect)slugRingViewBoundsInScreenCoordinates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
  objc_msgSend(v2, "zw_convertBoundsToScreenCoordinates");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateLongPressDuration:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController longPress](self, "longPress"));
  [v4 setMinimumPressDuration:a3];
}

+ (double)standByLongPressDuration
{
  return 0.2;
}

+ (double)zoomedInLongPressDuration
{
  return 0.5;
}

+ (double)longPressDurationForStandByMode:(BOOL)a3
{
  if (a3) {
    [a1 standByLongPressDuration];
  }
  else {
    [a1 zoomedInLongPressDuration];
  }
  return result;
}

- (void)setShouldHideWhileOrbing:(BOOL)a3
{
  if (self->_shouldHideWhileOrbing != a3)
  {
    BOOL v3 = a3;
    self->_shouldHideWhileOrbing = a3;
    -[ZWZoomSlugViewController _updateSlugDimStatus:Animated:](self, "_updateSlugDimStatus:Animated:");
    if (v3)
    {
      if (!-[ZWZoomSlugViewController isOrbPanning](self, "isOrbPanning")) {
        -[ZWZoomSlugViewController setAllGesturesEnabled:](self, "setAllGesturesEnabled:", 0LL);
      }
      -[ZWZoomSlugViewController _updateSlugAppearanceForMode:](self, "_updateSlugAppearanceForMode:", 0LL);
    }

    else
    {
      -[ZWZoomSlugViewController setAllGesturesEnabled:](self, "setAllGesturesEnabled:", 1LL);
      -[ZWZoomSlugViewController _dimAfterDelay](self, "_dimAfterDelay");
    }
  }

- (void)_updateSlugAppearanceForMode:(unint64_t)a3
{
  if (-[ZWZoomSlugViewController slugAppearanceState](self, "slugAppearanceState") != a3)
  {
    if (a3 == 2)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v37 = [v36 zoomAutopannerShouldPanWithAcceleration];

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingWidthConstraint](self, "collapsingRingWidthConstraint"));
        [v38 setConstant:150.0];

        v39 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController collapsingRingHeightConstraint]( self,  "collapsingRingHeightConstraint"));
        [v39 setConstant:150.0];
      }

      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
        double v41 = (void *)objc_claimAutoreleasedReturnValue([v40 superview]);
        [v41 bounds];
        double v43 = v42 / 5.0;
        double v44 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingWidthConstraint](self, "collapsingRingWidthConstraint"));
        [v44 setConstant:v43];

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 superview]);
        [v46 bounds];
        double v48 = v47 / 5.0;
        double v49 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController collapsingRingHeightConstraint]( self,  "collapsingRingHeightConstraint"));
        [v49 setConstant:v48];

        double v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
        [v50 setShouldUseContinuousCornerRadius:0];

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotingView](self, "circlePivotingView"));
        [v39 setShouldUseRoundedRect:1];
      }

      double v51 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotWidthConstraint](self, "circlePivotWidthConstraint"));
      [v51 setConstant:38.0];

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotHeightConstraint](self, "circlePivotHeightConstraint"));
      [v52 setConstant:38.0];

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v54 = [v53 zoomAutopannerShouldPanWithAcceleration];

      if (v54)
      {
        double v55 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController leftTriangleRadiusDistanceConstraint]( self,  "leftTriangleRadiusDistanceConstraint"));
        [v55 setConstant:-55.0];

        double v56 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController topTriangleRadiusDistanceConstraint]( self,  "topTriangleRadiusDistanceConstraint"));
        [v56 setConstant:-55.0];

        double v57 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController rightTriangleRadiusDistanceConstraint]( self,  "rightTriangleRadiusDistanceConstraint"));
        [v57 setConstant:55.0];

        v34 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController bottomTriangleRadiusDistanceConstraint]( self,  "bottomTriangleRadiusDistanceConstraint"));
        [v34 setConstant:55.0];
LABEL_16:

        goto LABEL_17;
      }

      double v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController leftTriangleView](self, "leftTriangleView"));
      [v58 setHidden:1];

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController rightTriangleView](self, "rightTriangleView"));
      [v59 setHidden:1];

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController topTriangleView](self, "topTriangleView"));
      [v60 setHidden:1];

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController bottomTriangleView](self, "bottomTriangleView"));
      v34 = v33;
      uint64_t v35 = 1LL;
LABEL_15:
      [v33 setHidden:v35];
      goto LABEL_16;
    }

    if (a3 == 1)
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingWidthConstraint](self, "collapsingRingWidthConstraint"));
      [v19 setConstant:78.0];

      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingHeightConstraint](self, "collapsingRingHeightConstraint"));
      [v20 setConstant:78.0];

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
      [v21 setShouldUseContinuousCornerRadius:1];

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotingView](self, "circlePivotingView"));
      [v22 setShouldUseRoundedRect:0];

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotWidthConstraint](self, "circlePivotWidthConstraint"));
      [v23 setConstant:38.0];

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotHeightConstraint](self, "circlePivotHeightConstraint"));
      [v24 setConstant:38.0];

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetXConstraint](self, "circlePivotOffsetXConstraint"));
      [v25 setConstant:0.0];

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetYConstraint](self, "circlePivotOffsetYConstraint"));
      [v26 setConstant:0.0];

      v27 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController leftTriangleRadiusDistanceConstraint]( self,  "leftTriangleRadiusDistanceConstraint"));
      [v27 setConstant:-30.0];

      double v28 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController topTriangleRadiusDistanceConstraint]( self,  "topTriangleRadiusDistanceConstraint"));
      [v28 setConstant:-30.0];

      double v29 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController rightTriangleRadiusDistanceConstraint]( self,  "rightTriangleRadiusDistanceConstraint"));
      [v29 setConstant:30.0];

      double v16 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController bottomTriangleRadiusDistanceConstraint]( self,  "bottomTriangleRadiusDistanceConstraint"));
      double v17 = v16;
      double v18 = 30.0;
    }

    else
    {
      if (a3) {
        goto LABEL_17;
      }
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingWidthConstraint](self, "collapsingRingWidthConstraint"));
      [v5 setConstant:60.0];

      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController collapsingRingHeightConstraint](self, "collapsingRingHeightConstraint"));
      [v6 setConstant:60.0];

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
      [v7 setShouldUseContinuousCornerRadius:1];

      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotingView](self, "circlePivotingView"));
      [v8 setShouldUseRoundedRect:0];

      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotWidthConstraint](self, "circlePivotWidthConstraint"));
      [v9 setConstant:16.0];

      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotHeightConstraint](self, "circlePivotHeightConstraint"));
      [v10 setConstant:16.0];

      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetXConstraint](self, "circlePivotOffsetXConstraint"));
      [v11 setConstant:0.0];

      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetYConstraint](self, "circlePivotOffsetYConstraint"));
      [v12 setConstant:0.0];

      double v13 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController leftTriangleRadiusDistanceConstraint]( self,  "leftTriangleRadiusDistanceConstraint"));
      [v13 setConstant:-20.0];

      double v14 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController topTriangleRadiusDistanceConstraint]( self,  "topTriangleRadiusDistanceConstraint"));
      [v14 setConstant:-20.0];

      double v15 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController rightTriangleRadiusDistanceConstraint]( self,  "rightTriangleRadiusDistanceConstraint"));
      [v15 setConstant:20.0];

      double v16 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomSlugViewController bottomTriangleRadiusDistanceConstraint]( self,  "bottomTriangleRadiusDistanceConstraint"));
      double v17 = v16;
      double v18 = 20.0;
    }

    [v16 setConstant:v18];

    if (!-[ZWZoomSlugViewController inSpeakUnderFingerMode](self, "inSpeakUnderFingerMode"))
    {
      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController leftTriangleView](self, "leftTriangleView"));
      [v30 setHidden:0];

      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController rightTriangleView](self, "rightTriangleView"));
      [v31 setHidden:0];

      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController topTriangleView](self, "topTriangleView"));
      [v32 setHidden:0];

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController bottomTriangleView](self, "bottomTriangleView"));
      v34 = v33;
      uint64_t v35 = 0LL;
      goto LABEL_15;
    }

void __57__ZWZoomSlugViewController__updateSlugAppearanceForMode___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 layoutIfNeeded];
}

- (void)_didBeginInteractingWithSlug
{
  if (!-[ZWZoomSlugViewController isOrbPanning](self, "isOrbPanning")) {
    -[ZWZoomSlugViewController _updateSlugDimStatus:Animated:](self, "_updateSlugDimStatus:Animated:", 0LL, 1LL);
  }
}

- (void)_didFinishInteractingWithSlug
{
  if (!-[ZWZoomSlugViewController userIsInteractingWithSlug](self, "userIsInteractingWithSlug")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWZoomSlugViewController.m",  517LL,  "-[ZWZoomSlugViewController _didFinishInteractingWithSlug]",  @"Our state for tracking userInteractingWithSlug is messed up. Should have been YES, as we are finishing interact");
  }
  -[ZWZoomSlugViewController setUserIsInteractingWithSlug:](self, "setUserIsInteractingWithSlug:", 0LL);
  -[ZWZoomSlugViewController _updateSlugAppearanceForMode:](self, "_updateSlugAppearanceForMode:", 0LL);
  -[ZWZoomSlugViewController _dimAfterDelay](self, "_dimAfterDelay");
}

- (void)updateIdleSlugOpacityAndPreviewImmediately:(double)a3
{
}

- (void)wakeSlug
{
}

- (void)_dimAfterDelay
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController dimTimer](self, "dimTimer"));
  [v3 cancel];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController dimTimer](self, "dimTimer"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __42__ZWZoomSlugViewController__dimAfterDelay__block_invoke;
  v5[3] = &unk_6CBC0;
  v5[4] = self;
  [v4 afterDelay:v5 processBlock:2.0];
}

id __42__ZWZoomSlugViewController__dimAfterDelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSlugDimStatus:1 Animated:1];
}

- (void)_updateSlugDimStatus:(BOOL)a3 Animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController dimTimer](self, "dimTimer"));
  [v7 cancel];

  double v8 = 1.0;
  if (v5)
  {
    double v8 = 0.0;
    if (!self->_shouldHideWhileOrbing)
    {
      -[ZWZoomSlugViewController idleSlugOpacity](self, "idleSlugOpacity");
      double v8 = v9;
    }
  }

  double v10 = 0.0;
  if (v4) {
    double v10 = ZWDefaultFadeAnimationDuration();
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __58__ZWZoomSlugViewController__updateSlugDimStatus_Animated___block_invoke;
  v11[3] = &unk_6CD58;
  v11[4] = self;
  *(double *)&v11[5] = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  6LL,  v11,  0LL,  v10,  0.0);
}

void __58__ZWZoomSlugViewController__updateSlugDimStatus_Animated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 setAlpha:v1];
}

- (void)_updateControllerColor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = AXUIZoomControllerColor([v3 zoomControllerColor]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotingView](self, "circlePivotingView"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 circleLayer]);
  [v6 setFillColor:v4];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController topTriangleView](self, "topTriangleView"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 triangleLayer]);
  [v8 setFillColor:v4];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController rightTriangleView](self, "rightTriangleView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 triangleLayer]);
  [v10 setFillColor:v4];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController bottomTriangleView](self, "bottomTriangleView"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 triangleLayer]);
  [v12 setFillColor:v4];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController leftTriangleView](self, "leftTriangleView"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 triangleLayer]);
  [v14 setFillColor:v4];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
  [v16 setBorderColor:v4];

  -[ZWZoomSlugViewController wakeSlug](self, "wakeSlug");
}

- (void)_updateControllerThickness
{
  if (UIAccessibilityIsBoldTextEnabled()) {
    double v3 = 4.0;
  }
  else {
    double v3 = 2.0;
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController slugRingView](self, "slugRingView"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);
  [v4 setBorderWidth:v3];
}

- (void)_updateGestures
{
  BOOL allGesturesEnabled = self->_allGesturesEnabled;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController longPressGesture](self, "longPressGesture"));
  [v4 setEnabled:allGesturesEnabled];

  BOOL v5 = self->_allGesturesEnabled;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController panGesture](self, "panGesture"));
  [v6 setEnabled:v5];

  id v20 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v7 = [v20 zoomSlugSingleTapAction];
  id v8 = [v20 zoomSlugDoubleTapAction];
  id v9 = [v20 zoomSlugTripleTapAction];
  unsigned int v10 = [v20 zoomSlugTapAndSlideToAdjustZoomLevelEnabled];
  if (v7) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = v10;
  }
  if (self->_tapGesturesEnabled) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0LL;
  }
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController singleTapGesture](self, "singleTapGesture"));
  [v13 setEnabled:v12];

  BOOL v15 = self->_tapGesturesEnabled && v8 != 0LL;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController doubleTapGesture](self, "doubleTapGesture"));
  [v16 setEnabled:v15];

  BOOL v18 = self->_tapGesturesEnabled && v9 != 0LL;
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController tripleTapGesture](self, "tripleTapGesture"));
  [v19 setEnabled:v18];
}

- (void)setAllGesturesEnabled:(BOOL)a3
{
  self->_BOOL allGesturesEnabled = a3;
  -[ZWZoomSlugViewController setTapGesturesEnabled:](self, "setTapGesturesEnabled:");
}

- (void)setTapGesturesEnabled:(BOOL)a3
{
  self->_tapGesturesEnabled = a3;
  -[ZWZoomSlugViewController _updateGestures](self, "_updateGestures");
}

- (BOOL)_panGestureIsRecognizing
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController panGesture](self, "panGesture"));
  double v3 = (char *)[v2 state];

  return (unint64_t)(v3 - 1) < 2;
}

- (void)_handleSingleTap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3
    && !-[ZWZoomSlugViewController _panGestureIsRecognizing](self, "_panGestureIsRecognizing"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = [v4 zoomSlugSingleTapAction];

    if (v5)
    {
      -[ZWZoomSlugViewController _didBeginInteractingWithSlug](self, "_didBeginInteractingWithSlug");
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
      [v6 slugWasSingleTappedWithSlugViewController:self];

      -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 0LL);
      -[ZWZoomSlugViewController _didFinishInteractingWithSlug](self, "_didFinishInteractingWithSlug");
    }
  }

- (void)_handleDoubleTap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = [v4 zoomSlugDoubleTapAction];

    if (v5)
    {
      -[ZWZoomSlugViewController _didBeginInteractingWithSlug](self, "_didBeginInteractingWithSlug");
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
      [v6 slugWasDoubleTappedWithSlugViewController:self];

      -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 0LL);
      -[ZWZoomSlugViewController _didFinishInteractingWithSlug](self, "_didFinishInteractingWithSlug");
    }
  }

- (void)_handleTripleTap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = [v4 zoomSlugTripleTapAction];

    if (v5)
    {
      -[ZWZoomSlugViewController _didBeginInteractingWithSlug](self, "_didBeginInteractingWithSlug");
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
      [v6 slugWasTripleTappedWithSlugViewController:self];

      -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 0LL);
      -[ZWZoomSlugViewController _didFinishInteractingWithSlug](self, "_didFinishInteractingWithSlug");
    }
  }

- (void)_handleLongPress:(id)a3
{
  uint64_t v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    if (-[ZWZoomSlugViewController isOrbPanning](self, "isOrbPanning"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
      [v5 endOrbZoomWithSlugViewController:self];

      -[ZWZoomSlugViewController setIsOrbPanning:](self, "setIsOrbPanning:", 0LL);
    }

    else
    {
      -[ZWZoomSlugViewController _updateSlugAppearanceForMode:](self, "_updateSlugAppearanceForMode:", 0LL);
      -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 0LL);
    }

    goto LABEL_9;
  }

  if (v4 != (_BYTE *)&dword_0 + 2)
  {
    if (v4 != (_BYTE *)&dword_0 + 1)
    {
LABEL_9:
      -[ZWZoomSlugViewController setDisableDashBoardGesturesForLongPressAssertion:]( self,  "setDisableDashBoardGesturesForLongPressAssertion:",  0LL);
      return;
    }

    -[ZWZoomSlugViewController setIsOrbPanning:](self, "setIsOrbPanning:", 1LL);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
    unsigned __int8 v7 = [v6 attemptOrbZoomIfAppropriateWithSlugViewController:self];

    if ((v7 & 1) == 0)
    {
      -[ZWZoomSlugViewController setIsOrbPanning:](self, "setIsOrbPanning:", 0LL);
      -[ZWZoomSlugViewController _updateSlugAppearanceForMode:](self, "_updateSlugAppearanceForMode:", 1LL);
      -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 1LL);
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableDashboardSystemGestures,  @"Zoom: slug longPress"));
      -[ZWZoomSlugViewController setDisableDashBoardGesturesForLongPressAssertion:]( self,  "setDisableDashBoardGesturesForLongPressAssertion:",  v8);
    }
  }

- (void)_handlePan:(id)a3
{
  id v73 = a3;
  uint64_t v4 = (char *)[v73 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == (_BYTE *)&dword_0 + 2)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
      [v73 translationInView:v11];
      double v13 = v12;
      double v15 = v14;

      double v16 = v13 - self->_firstTouchLocation.x;
      double v17 = v15 - self->_firstTouchLocation.y;
      -[ZWZoomSlugViewController setDeltaFromLastPanEvent:]( self,  "setDeltaFromLastPanEvent:",  v13 - self->_lastPanLocation.x,  v15 - self->_lastPanLocation.y);
      -[ZWZoomSlugViewController setCurrentOffsetAngle:](self, "setCurrentOffsetAngle:", atan2(v17, v16));
      -[ZWZoomSlugViewController setDeltaFromInitialTouch:](self, "setDeltaFromInitialTouch:", v16, v17);
      if (-[ZWZoomSlugViewController isInPanZoomingMode](self, "isInPanZoomingMode"))
      {
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
        -[ZWZoomSlugViewController deltaFromInitialTouch](self, "deltaFromInitialTouch");
        objc_msgSend(v18, "zoomSlugViewController:wantsToAdjustZoomLevelWithDelta:", self);
      }

      else if (-[ZWZoomSlugViewController isOrbPanning](self, "isOrbPanning"))
      {
        double v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
        [v28 center];
        double v30 = v13 + v29;
        double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
        [v31 center];
        double v33 = v15 + v32;

        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
        objc_msgSend(v18, "updateOrbZoomAtPoint:withSlugViewController:", self, v30, v33);
      }

      else if (-[ZWZoomSlugViewController isInUserRepositioningMode](self, "isInUserRepositioningMode"))
      {
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
        -[ZWZoomSlugViewController deltaFromLastPanEvent](self, "deltaFromLastPanEvent");
        objc_msgSend(v18, "zoomSlugViewController:didDragSlug:withDelta:", self, v34);
      }

      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        unsigned __int8 v37 = [v36 zoomAutopannerShouldPanWithAcceleration];

        if ((v37 & 1) != 0)
        {
          -[ZWZoomSlugViewController deltaFromInitialTouch](self, "deltaFromInitialTouch");
          double v40 = v38;
          double v41 = v39;
          if (v38 <= 0.0)
          {
            if (v38 < 0.0 && v38 < -30.0) {
              double v40 = -30.0;
            }
          }

          else
          {
            double v40 = fmin(v38, 30.0);
          }

          if (v39 <= 0.0)
          {
            if (v39 < 0.0 && v39 < -30.0) {
              double v41 = -30.0;
            }
          }

          else
          {
            double v41 = fmin(v39, 30.0);
          }

          v72 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetXConstraint](self, "circlePivotOffsetXConstraint"));
          [v72 setConstant:v40];

          v70 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetYConstraint](self, "circlePivotOffsetYConstraint"));
          BOOL v18 = v70;
          double v71 = v41;
        }

        else
        {
          double v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetXConstraint](self, "circlePivotOffsetXConstraint"));
          [v42 constant];
          double v44 = v43;
          -[ZWZoomSlugViewController deltaFromLastPanEvent](self, "deltaFromLastPanEvent");
          double v46 = v44 + v45;
          double v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetYConstraint](self, "circlePivotOffsetYConstraint"));
          [v47 constant];
          double v49 = v48;
          -[ZWZoomSlugViewController deltaFromLastPanEvent](self, "deltaFromLastPanEvent");
          double v51 = v49 + v50;

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
          v53 = (void *)objc_claimAutoreleasedReturnValue([v52 superview]);
          [v53 bounds];
          double v54 = 5.0 + 5.0;
          double v56 = v55 / (5.0 + 5.0) + -19.0 - 3.0;

          if (v46 < v56) {
            double v56 = v46;
          }
          double v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
          double v58 = (void *)objc_claimAutoreleasedReturnValue([v57 superview]);
          [v58 bounds];
          double v60 = -(v59 / v54 + -19.0 - 3.0);

          if (v56 < v60) {
            double v56 = v60;
          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
          double v62 = (void *)objc_claimAutoreleasedReturnValue([v61 superview]);
          [v62 bounds];
          double v64 = v63 / v54 + -19.0 - 3.0;

          if (v51 >= v64) {
            double v51 = v64;
          }
          double v65 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
          v66 = (void *)objc_claimAutoreleasedReturnValue([v65 superview]);
          [v66 bounds];
          double v68 = -(v67 / v54 + -19.0 - 3.0);

          if (v51 < v68) {
            double v51 = v68;
          }
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetXConstraint](self, "circlePivotOffsetXConstraint"));
          [v69 setConstant:v56];

          v70 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotOffsetYConstraint](self, "circlePivotOffsetYConstraint"));
          BOOL v18 = v70;
          double v71 = v51;
        }

        [v70 setConstant:v71];
      }

      self->_lastPanLocation.x = v13;
      self->_lastPanLocation.double y = v15;
    }

    else if (v4 == (_BYTE *)&dword_0 + 1)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableDashboardSystemGestures,  @"Zoom: slug panning"));
      -[ZWZoomSlugViewController setDisableDashBoardGesturesForPanAssertion:]( self,  "setDisableDashBoardGesturesForPanAssertion:",  v7);

      unsigned __int8 v8 = -[ZWZoomSlugViewController isInPanZoomingMode](self, "isInPanZoomingMode");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController singleTapGesture](self, "singleTapGesture"));
      if ([v9 state] == (char *)&dword_0 + 3)
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        -[ZWZoomSlugViewController setInPanZoomingMode:]( self,  "setInPanZoomingMode:",  [v10 zoomSlugTapAndSlideToAdjustZoomLevelEnabled]);
      }

      else
      {
        -[ZWZoomSlugViewController setInPanZoomingMode:](self, "setInPanZoomingMode:", 0LL);
      }

      if ((v8 & 1) == 0 && -[ZWZoomSlugViewController isInPanZoomingMode](self, "isInPanZoomingMode"))
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
        [v19 prepareForSlugZoomPanningWithSlugViewController:self];
      }

      -[ZWZoomSlugViewController setTapGesturesEnabled:](self, "setTapGesturesEnabled:", 0LL);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
      [v73 translationInView:v20];
      self->_lastPanLocation.x = v21;
      self->_lastPanLocation.double y = v22;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
      [v73 translationInView:v23];
      self->_firstTouchLocation.x = v24;
      self->_firstTouchLocation.double y = v25;

      -[ZWZoomSlugViewController setCurrentOffsetAngle:](self, "setCurrentOffsetAngle:", 0.0);
      -[ZWZoomSlugViewController _didBeginInteractingWithSlug](self, "_didBeginInteractingWithSlug");
      if (!-[ZWZoomSlugViewController isInPanZoomingMode](self, "isInPanZoomingMode")
        && !-[ZWZoomSlugViewController isOrbPanning](self, "isOrbPanning"))
      {
        if (-[ZWZoomSlugViewController inSpeakUnderFingerMode](self, "inSpeakUnderFingerMode")
          || (id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate")),
              unsigned __int8 v27 = [v26 shouldBeginAutopanningLensWithSlugViewController:self],
              v26,
              (v27 & 1) == 0))
        {
          -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 1LL);
        }

        if (-[ZWZoomSlugViewController isInUserRepositioningMode](self, "isInUserRepositioningMode"))
        {
          -[ZWZoomSlugViewController _updateSlugAppearanceForMode:](self, "_updateSlugAppearanceForMode:", 1LL);
        }

        else
        {
          -[ZWZoomSlugViewController _updateSlugAppearanceForMode:](self, "_updateSlugAppearanceForMode:", 2LL);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
          [v35 wantsToStartAutopannerWithSlugViewController:self];

          self->_shouldHideWhileOrbing = 1;
          -[ZWZoomSlugViewController _dimAfterDelay](self, "_dimAfterDelay");
        }
      }
    }

    else
    {
      -[ZWZoomSlugViewController setDisableDashBoardGesturesForPanAssertion:]( self,  "setDisableDashBoardGesturesForPanAssertion:",  0LL);
    }
  }

  else
  {
    -[ZWZoomSlugViewController setDisableDashBoardGesturesForPanAssertion:]( self,  "setDisableDashBoardGesturesForPanAssertion:",  0LL);
    -[ZWZoomSlugViewController setTapGesturesEnabled:](self, "setTapGesturesEnabled:", 1LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController delegate](self, "delegate"));
    [v5 wantsToStopAutopannerWithSlugViewController:self];

    -[ZWZoomSlugViewController _didFinishInteractingWithSlug](self, "_didFinishInteractingWithSlug");
    -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 0LL);
    double y = CGPointZero.y;
    -[ZWZoomSlugViewController setDeltaFromInitialTouch:](self, "setDeltaFromInitialTouch:", CGPointZero.x, y);
    -[ZWZoomSlugViewController setDeltaFromLastPanEvent:](self, "setDeltaFromLastPanEvent:", CGPointZero.x, y);
    -[ZWZoomSlugViewController setCurrentOffsetAngle:](self, "setCurrentOffsetAngle:", 0.0);
    -[ZWZoomSlugViewController setInPanZoomingMode:](self, "setInPanZoomingMode:", 0LL);
    self->_shouldHideWhileOrbing = 0;
    -[ZWZoomSlugViewController wakeSlug](self, "wakeSlug");
  }
}

- (void)_updateAccessibilityHint
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = (char *)[v3 zoomSlugSingleTapAction];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v6 = (char *)[v5 zoomSlugDoubleTapAction];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v8 = (char *)[v7 zoomSlugTripleTapAction];

  double v19 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    id v9 = @"ZW_SLUG_HINT_SINGLE_TAP_ZOOM_MENU";
  }

  else
  {
    if (v4 != (_BYTE *)&dword_0 + 2) {
      goto LABEL_6;
    }
    id v9 = @"ZW_SLUG_HINT_SINGLE_TAP_TOGGLE_ZOOM";
  }

  id v10 = ZWLocString(v9);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableString appendString:](v19, "appendString:", v11);

  -[NSMutableString appendString:](v19, "appendString:", @" ");
LABEL_6:
  if (v6 == (_BYTE *)&dword_0 + 1)
  {
    double v12 = @"ZW_SLUG_HINT_DOUBLE_TAP_ZOOM_MENU";
  }

  else
  {
    if (v6 != (_BYTE *)&dword_0 + 2) {
      goto LABEL_11;
    }
    double v12 = @"ZW_SLUG_HINT_DOUBLE_TAP_TOGGLE_ZOOM";
  }

  id v13 = ZWLocString(v12);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableString appendString:](v19, "appendString:", v14);

  -[NSMutableString appendString:](v19, "appendString:", @" ");
LABEL_11:
  if (v8 == (_BYTE *)&dword_0 + 1)
  {
    double v15 = @"ZW_SLUG_HINT_TRIPLE_TAP_ZOOM_MENU";
    goto LABEL_15;
  }

  if (v8 == (_BYTE *)&dword_0 + 2)
  {
    double v15 = @"ZW_SLUG_HINT_TRIPLE_TAP_TOGGLE_ZOOM";
LABEL_15:
    id v16 = ZWLocString(v15);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NSMutableString appendString:](v19, "appendString:", v17);
  }

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v18 setAccessibilityHint:v19];
}

- (void)_updateRingAndTriangleVisiblity:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController leftTriangleView](self, "leftTriangleView"));
  [v5 setHidden:v3];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController rightTriangleView](self, "rightTriangleView"));
  [v6 setHidden:v3];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController topTriangleView](self, "topTriangleView"));
  [v7 setHidden:v3];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController bottomTriangleView](self, "bottomTriangleView"));
  [v8 setHidden:v3];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController circlePivotingView](self, "circlePivotingView"));
  [v9 setHidden:v3];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ZWSlugCollapsingRingView speakFingerImageView](self->_slugRingView, "speakFingerImageView"));
  [v10 setHidden:v3 ^ 1];
}

- (void)userInteractionHasBecomeIdle
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ZWZoomSlugViewController;
  -[ZWZoomViewController userInteractionHasBecomeIdle](&v3, "userInteractionHasBecomeIdle");
  -[ZWZoomSlugViewController setInUserRepositioningMode:](self, "setInUserRepositioningMode:", 0LL);
}

- (void)userInteractionHasBecomeActiveWithFirstTouchAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ZWZoomSlugViewController;
  -[ZWZoomViewController userInteractionHasBecomeActiveWithFirstTouchAtLocation:]( &v7,  "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController view](self, "view"));
  [v6 bounds];
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  CGRectContainsPoint(v9, v8);
}

- (CGPoint)offsetForAutopanner:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  unsigned int v5 = [v4 zoomAutopannerShouldPanWithAcceleration];

  if (v5)
  {
    -[ZWZoomSlugViewController deltaFromInitialTouch](self, "deltaFromInitialTouch");
  }

  else
  {
    -[ZWZoomSlugViewController deltaFromLastPanEvent](self, "deltaFromLastPanEvent");
    double v9 = v8 * 5.0;
    -[ZWZoomSlugViewController deltaFromLastPanEvent](self, "deltaFromLastPanEvent");
    double v11 = v10 * 5.0;
    -[ZWZoomSlugViewController setDeltaFromLastPanEvent:]( self,  "setDeltaFromLastPanEvent:",  CGPointZero.x,  CGPointZero.y);
    double v6 = v9;
    double v7 = v11;
  }

  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController longPressGesture](self, "longPressGesture"));

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController panGesture](self, "panGesture"));
  if (v8 == v6)
  {
    char v10 = v9 == v7;
  }

  else if (v9 == v6)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController longPressGesture](self, "longPressGesture"));
    if (v11 == v7)
    {
      char v10 = 1;
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController doubleTapGesture](self, "doubleTapGesture"));
      if (v12 == v7)
      {
        char v10 = 1;
      }

      else
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController tripleTapGesture](self, "tripleTapGesture"));
        if (v13 == v7)
        {
          char v10 = 1;
        }

        else
        {
          id v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomSlugViewController singleTapGesture](self, "singleTapGesture"));
          char v10 = v14 == v7;
        }
      }
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (ZWZoomSlugViewControllerDelegate)delegate
{
  return (ZWZoomSlugViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)userIsInteractingWithSlug
{
  return self->_userIsInteractingWithSlug;
}

- (void)setUserIsInteractingWithSlug:(BOOL)a3
{
  self->_userIsInteractingWithSlug = a3;
}

- (BOOL)inSpeakUnderFingerMode
{
  return self->_inSpeakUnderFingerMode;
}

- (void)setInSpeakUnderFingerMode:(BOOL)a3
{
  self->_inSpeakUnderFingerMode = a3;
}

- (BOOL)shouldHideWhileOrbing
{
  return self->_shouldHideWhileOrbing;
}

- (ZWSlugCollapsingRingView)slugRingView
{
  return self->_slugRingView;
}

- (void)setSlugRingView:(id)a3
{
}

- (NSLayoutConstraint)collapsingRingWidthConstraint
{
  return self->_collapsingRingWidthConstraint;
}

- (void)setCollapsingRingWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)collapsingRingHeightConstraint
{
  return self->_collapsingRingHeightConstraint;
}

- (void)setCollapsingRingHeightConstraint:(id)a3
{
}

- (ZWSlugCirclePivotingView)circlePivotingView
{
  return self->_circlePivotingView;
}

- (void)setCirclePivotingView:(id)a3
{
}

- (NSLayoutConstraint)circlePivotWidthConstraint
{
  return self->_circlePivotWidthConstraint;
}

- (void)setCirclePivotWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)circlePivotHeightConstraint
{
  return self->_circlePivotHeightConstraint;
}

- (void)setCirclePivotHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)circlePivotOffsetXConstraint
{
  return self->_circlePivotOffsetXConstraint;
}

- (void)setCirclePivotOffsetXConstraint:(id)a3
{
}

- (NSLayoutConstraint)circlePivotOffsetYConstraint
{
  return self->_circlePivotOffsetYConstraint;
}

- (void)setCirclePivotOffsetYConstraint:(id)a3
{
}

- (ZWSlugTriangleView)leftTriangleView
{
  return self->_leftTriangleView;
}

- (void)setLeftTriangleView:(id)a3
{
}

- (NSLayoutConstraint)leftTriangleRadiusDistanceConstraint
{
  return self->_leftTriangleRadiusDistanceConstraint;
}

- (void)setLeftTriangleRadiusDistanceConstraint:(id)a3
{
}

- (ZWSlugTriangleView)rightTriangleView
{
  return self->_rightTriangleView;
}

- (void)setRightTriangleView:(id)a3
{
}

- (NSLayoutConstraint)rightTriangleRadiusDistanceConstraint
{
  return self->_rightTriangleRadiusDistanceConstraint;
}

- (void)setRightTriangleRadiusDistanceConstraint:(id)a3
{
}

- (ZWSlugTriangleView)topTriangleView
{
  return self->_topTriangleView;
}

- (void)setTopTriangleView:(id)a3
{
}

- (NSLayoutConstraint)topTriangleRadiusDistanceConstraint
{
  return self->_topTriangleRadiusDistanceConstraint;
}

- (void)setTopTriangleRadiusDistanceConstraint:(id)a3
{
}

- (ZWSlugTriangleView)bottomTriangleView
{
  return self->_bottomTriangleView;
}

- (void)setBottomTriangleView:(id)a3
{
}

- (NSLayoutConstraint)bottomTriangleRadiusDistanceConstraint
{
  return self->_bottomTriangleRadiusDistanceConstraint;
}

- (void)setBottomTriangleRadiusDistanceConstraint:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (UITapGestureRecognizer)singleTapGesture
{
  return self->_singleTapGesture;
}

- (void)setSingleTapGesture:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGesture
{
  return self->_doubleTapGesture;
}

- (void)setDoubleTapGesture:(id)a3
{
}

- (UITapGestureRecognizer)tripleTapGesture
{
  return self->_tripleTapGesture;
}

- (void)setTripleTapGesture:(id)a3
{
}

- (BOOL)tapGesturesEnabled
{
  return self->_tapGesturesEnabled;
}

- (BOOL)allGesturesEnabled
{
  return self->_allGesturesEnabled;
}

- (BOOL)isInUserRepositioningMode
{
  return self->_inUserRepositioningMode;
}

- (void)setInUserRepositioningMode:(BOOL)a3
{
  self->_inUserRepositioningMode = a3;
}

- (BOOL)isInPanZoomingMode
{
  return self->_inPanZoomingMode;
}

- (void)setInPanZoomingMode:(BOOL)a3
{
  self->_inPanZoomingMode = a3;
}

- (BOOL)isOrbPanning
{
  return self->_isOrbPanning;
}

- (void)setIsOrbPanning:(BOOL)a3
{
  self->_isOrbPanning = a3;
}

- (AXAssertion)disableDashBoardGesturesForPanAssertion
{
  return self->_disableDashBoardGesturesForPanAssertion;
}

- (void)setDisableDashBoardGesturesForPanAssertion:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesForLongPressAssertion
{
  return self->_disableDashBoardGesturesForLongPressAssertion;
}

- (void)setDisableDashBoardGesturesForLongPressAssertion:(id)a3
{
}

- (double)currentOffsetAngle
{
  return self->_currentOffsetAngle;
}

- (void)setCurrentOffsetAngle:(double)a3
{
  self->_currentOffsetAngle = a3;
}

- (CGPoint)deltaFromInitialTouch
{
  double x = self->_deltaFromInitialTouch.x;
  double y = self->_deltaFromInitialTouch.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDeltaFromInitialTouch:(CGPoint)a3
{
  self->_deltaFromInitialTouch = a3;
}

- (CGPoint)deltaFromLastPanEvent
{
  double x = self->_deltaFromLastPanEvent.x;
  double y = self->_deltaFromLastPanEvent.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDeltaFromLastPanEvent:(CGPoint)a3
{
  self->_deltaFromLastPanEvent = a3;
}

- (double)idleSlugOpacity
{
  return self->_idleSlugOpacity;
}

- (void)setIdleSlugOpacity:(double)a3
{
  self->_idleSlugOpacitdouble y = a3;
}

- (AXDispatchTimer)dimTimer
{
  return self->_dimTimer;
}

- (void)setDimTimer:(id)a3
{
}

- (unint64_t)slugAppearanceState
{
  return self->_slugAppearanceState;
}

- (void)setSlugAppearanceState:(unint64_t)a3
{
  self->_slugAppearanceState = a3;
}

- (UILongPressGestureRecognizer)longPress
{
  return self->_longPress;
}

- (void)setLongPress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end