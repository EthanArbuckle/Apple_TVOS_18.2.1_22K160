@interface ZWZoomDockedLensViewController
- (BOOL)_shouldDisableLensEffectsForStandbyMode;
- (BOOL)_zoomRegionOnDockReplicatorEdge;
- (BOOL)dockPositionIsTransitioning;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isInDockResizingMode;
- (BOOL)transitioningForStandby;
- (BOOL)zoomRegionOnScreenReplicatorEdge;
- (BOOL)zoomRegionVisible;
- (CABackdropLayer)dockBackdropLayer;
- (CABackdropLayer)screenBackdropLayer;
- (CAReplicatorLayer)dockReplicatorLayer;
- (CAReplicatorLayer)screenReplicatorLayer;
- (CAShapeLayer)maskLayer;
- (CAShapeLayer)touchStealLayer;
- (CGPoint)_lensDragMultiplier;
- (CGPoint)deltaForDockedZoomMovementToRect:(CGRect)a3;
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (CGRect)frameForResizeDrag;
- (CGRect)zoomRegionFrame;
- (NSLayoutConstraint)dockedViewBottomConstraint;
- (NSLayoutConstraint)dockedViewLeftConstraint;
- (NSLayoutConstraint)dockedViewRightConstraint;
- (NSLayoutConstraint)dockedViewTopConstraint;
- (NSLayoutConstraint)zoomViewBottomConstraint;
- (NSLayoutConstraint)zoomViewLeftConstraint;
- (NSLayoutConstraint)zoomViewRightConstraint;
- (NSLayoutConstraint)zoomViewTopConstraint;
- (UIView)dockReplicatorView;
- (UIView)dockedLensView;
- (UIView)screenReplicatorView;
- (ZWDockedLensChromeBorderView)dockedBorderView;
- (ZWShowHideZoomRegionButton)toggleZoomRegionButton;
- (ZWZoomDockedLensViewControllerDelegate)dockedDelegate;
- (double)_maxDockHeight;
- (double)_maxDockWidth;
- (double)dockShift;
- (double)dockSize;
- (double)screenShift;
- (id)identifier;
- (id)stringForCurrentDockPosition;
- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4;
- (int64_t)_dockPositionForString:(id)a3;
- (int64_t)dockPosition;
- (void)_applyInitialLayoutConstraints;
- (void)_layoutDockUIWithFrames:(CGRect)a3 restOfScreeFrame:(CGRect)a4 positionOrientationChanged:(BOOL)a5;
- (void)_moveZoomRegionToPoint:(CGPoint)a3;
- (void)_moveZoomRegionToPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)_shiftReplicatorsWithOverflowPan:(CGPoint)a3 useFullDelta:(BOOL)a4;
- (void)_toggleVisibilityButtonWasLongPressed;
- (void)_updateConstraintsAndShiftsForDockPosition:(int64_t)a3;
- (void)_updateZoomRegionFrameForDockResizeWithScreenShiftDelta:(double)a3;
- (void)_updateZoomRegionPositionAndSize;
- (void)handleAdditionalPanOffsetFromOriginalOffset:(CGPoint)a3 validOffset:(CGPoint)a4 useFullDelta:(BOOL)a5;
- (void)interceptFingerDownAtLocation:(CGPoint)a3;
- (void)loadView;
- (void)moveDockedZoomToPhysicalScreenPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)resizeDock:(CGSize)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDockBackdropLayer:(id)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setDockPositionIsTransitioning:(BOOL)a3;
- (void)setDockReplicatorLayer:(id)a3;
- (void)setDockReplicatorView:(id)a3;
- (void)setDockShift:(double)a3;
- (void)setDockSize:(double)a3;
- (void)setDockedBorderView:(id)a3;
- (void)setDockedDelegate:(id)a3;
- (void)setDockedLensView:(id)a3;
- (void)setDockedViewBottomConstraint:(id)a3;
- (void)setDockedViewLeftConstraint:(id)a3;
- (void)setDockedViewRightConstraint:(id)a3;
- (void)setDockedViewTopConstraint:(id)a3;
- (void)setInDockResizingMode:(BOOL)a3;
- (void)setMaskLayer:(id)a3;
- (void)setScreenBackdropLayer:(id)a3;
- (void)setScreenReplicatorLayer:(id)a3;
- (void)setScreenReplicatorView:(id)a3;
- (void)setScreenShift:(double)a3;
- (void)setToggleZoomRegionButton:(id)a3;
- (void)setTouchStealLayer:(id)a3;
- (void)setTransitioningForStandby:(BOOL)a3;
- (void)setZoomRegionFrame:(CGRect)a3;
- (void)setZoomRegionVisible:(BOOL)a3;
- (void)setZoomViewBottomConstraint:(id)a3;
- (void)setZoomViewLeftConstraint:(id)a3;
- (void)setZoomViewRightConstraint:(id)a3;
- (void)setZoomViewTopConstraint:(id)a3;
- (void)shiftDock:(double)a3;
- (void)shiftScreen:(double)a3;
- (void)shiftScreen:(double)a3 animated:(BOOL)a4;
- (void)shiftScreen:(double)a3 animated:(BOOL)a4 discardNewValue:(BOOL)a5;
- (void)showOrHideUIForStandbyModeWithCompletion:(id)a3;
- (void)toggleZoomRegionVisibility;
- (void)transitionToDockPosition:(id)a3 completion:(id)a4;
- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7;
- (void)viewDidLayoutSubviews;
- (void)zoomMovementDidEnd;
@end

@implementation ZWZoomDockedLensViewController

- (void)loadView
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
  -[ZWZoomLensViewController loadView](&v53, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController screen](self, "screen"));
  [v4 bounds];
  double v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController screen](self, "screen"));
  [v7 bounds];
  double v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v10 dockSize];
  -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:");

  -[ZWZoomDockedLensViewController setDockPosition:](self, "setDockPosition:", 0LL);
  -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
  double v12 = v11;
  CGFloat v13 = v6 * v11;
  v14 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, v9, v6 * v11);
  -[ZWZoomDockedLensViewController setDockedLensView:](self, "setDockedLensView:", v14);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v15 = objc_alloc(&OBJC_CLASS___ZWDockedLensChromeBorderView);
  -[UIView frame](v14, "frame");
  v48 = -[ZWDockedLensChromeBorderView initWithFrame:](v15, "initWithFrame:");
  -[ZWZoomDockedLensViewController setDockedBorderView:](self, "setDockedBorderView:", v48);
  -[UIView addSubview:](v14, "addSubview:", v48);
  v45 = v14;
  [v3 addSubview:v14];
  -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", 0.0, v13, v9, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  0.0,  v13,  v9,  v13));
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  0.0,  v13,  v9,  v13,  5.0));
  [v16 appendPath:v47];
  v17 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
  id v46 = v16;
  -[CAShapeLayer setPath:](v17, "setPath:", [v46 CGPath]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  id v19 = objc_claimAutoreleasedReturnValue([v18 colorWithAlphaComponent:0.25]);
  -[CAShapeLayer setFillColor:](v17, "setFillColor:", [v19 CGColor]);

  id v20 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[CAShapeLayer setStrokeColor:](v17, "setStrokeColor:", [v20 CGColor]);

  -[CAShapeLayer setStrokeStart:](v17, "setStrokeStart:", 0.5);
  -[CAShapeLayer setLineWidth:](v17, "setLineWidth:", 3.0);
  -[CAShapeLayer setFillRule:](v17, "setFillRule:", kCAFillRuleEvenOdd);
  v44 = v17;
  -[ZWZoomDockedLensViewController setMaskLayer:](self, "setMaskLayer:", v17);
  -[ZWZoomDockedLensViewController setZoomRegionVisible:](self, "setZoomRegionVisible:", 1LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v14, "layer"));
  [v21 insertSublayer:v17 below:v22];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  id v24 = objc_claimAutoreleasedReturnValue([v23 colorWithAlphaComponent:0.01]);
  objc_msgSend(v43, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v43, "setFrame:", 0.0, v13, v9, v13);
  -[ZWZoomDockedLensViewController setTouchStealLayer:](self, "setTouchStealLayer:", v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v25 addSublayer:v43];

  v26 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, v9, v6);
  -[UIView setCenter:](v26, "setCenter:", v9 * 0.5, v6 * 0.5);
  -[ZWZoomDockedLensViewController setScreenReplicatorView:](self, "setScreenReplicatorView:", v26);
  [v3 addSubview:v26];
  v27 = objc_alloc_init(&OBJC_CLASS___CAReplicatorLayer);
  -[CAReplicatorLayer setAllowsHitTesting:](v27, "setAllowsHitTesting:", 0LL);
  -[CAReplicatorLayer setBounds:](v27, "setBounds:", 0.0, 0.0, v9, v6);
  -[UIView center](v26, "center");
  -[CAReplicatorLayer setPosition:](v27, "setPosition:");
  -[CAReplicatorLayer setInstanceCount:](v27, "setInstanceCount:", 2LL);
  CATransform3DMakeTranslation(&v52, 0.0, v13, 0.0);
  CATransform3D v51 = v52;
  -[CAReplicatorLayer setInstanceTransform:](v27, "setInstanceTransform:", &v51);
  -[ZWZoomDockedLensViewController setScreenShift:](self, "setScreenShift:", v13);
  -[ZWZoomDockedLensViewController setScreenReplicatorLayer:](self, "setScreenReplicatorLayer:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v26, "layer"));
  [v28 addSublayer:v27];

  v29 = objc_alloc_init(&OBJC_CLASS___CABackdropLayer);
  -[CABackdropLayer setAllowsHitTesting:](v29, "setAllowsHitTesting:", 0LL);
  -[CABackdropLayer setEnabled:](v29, "setEnabled:", 1LL);
  -[CABackdropLayer setBackdropRect:](v29, "setBackdropRect:", 0.0, 0.0, v9, v6);
  -[ZWZoomDockedLensViewController setScreenBackdropLayer:](self, "setScreenBackdropLayer:", v29);
  -[CAReplicatorLayer addSublayer:](v27, "addSublayer:", v29);
  v30 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 0.0, 0.0, v9, v6);
  -[UIView setCenter:](v30, "setCenter:", v9 * 0.5, v6 * 0.5);
  -[ZWZoomDockedLensViewController setDockReplicatorView:](self, "setDockReplicatorView:", v30);
  [v3 addSubview:v30];
  v31 = objc_alloc_init(&OBJC_CLASS___CAReplicatorLayer);
  -[CAReplicatorLayer setAllowsHitTesting:](v31, "setAllowsHitTesting:", 0LL);
  -[CAReplicatorLayer setBounds:](v31, "setBounds:", 0.0, 0.0, v9, v13);
  -[CAReplicatorLayer setPosition:](v31, "setPosition:", v9 * 0.5, v13 * 1.5);
  -[CAReplicatorLayer setInstanceCount:](v31, "setInstanceCount:", 2LL);
  CATransform3DMakeTranslation(&v50, 0.0, -(v6 * v12), 0.0);
  CATransform3D v49 = v50;
  -[CAReplicatorLayer setInstanceTransform:](v31, "setInstanceTransform:", &v49);
  -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v13);
  -[ZWZoomDockedLensViewController setDockReplicatorLayer:](self, "setDockReplicatorLayer:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v30, "layer"));
  [v32 addSublayer:v31];

  v33 = objc_alloc_init(&OBJC_CLASS___CABackdropLayer);
  -[CABackdropLayer setAllowsHitTesting:](v33, "setAllowsHitTesting:", 0LL);
  -[CABackdropLayer setEnabled:](v33, "setEnabled:", 1LL);
  -[CABackdropLayer setBackdropRect:](v33, "setBackdropRect:", 0.0, 0.0, v9, v13);
  -[ZWZoomDockedLensViewController setDockBackdropLayer:](self, "setDockBackdropLayer:", v33);
  -[CAReplicatorLayer addSublayer:](v31, "addSublayer:", v33);
  v34 = v3;
  [v3 sendSubviewToBack:v30];
  v42 = v3;
  [v3 sendSubviewToBack:v26];
  v35 = objc_alloc_init(&OBJC_CLASS___ZWShowHideZoomRegionButton);
  -[ZWShowHideZoomRegionButton addTarget:action:forControlEvents:]( v35,  "addTarget:action:forControlEvents:",  self,  "_toggleVisibilityButtonWasPressed",  64LL);
  -[ZWZoomDockedLensViewController setToggleZoomRegionButton:](self, "setToggleZoomRegionButton:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  [v36 makeHorizontal];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  objc_msgSend(v37, "setCenter:", v9 * 0.5, v13);

  [v34 addSubview:v35];
  v38 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_toggleVisibilityButtonWasLongPressed");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  [v39 addGestureRecognizer:v38];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 zoomReplicatorLayer]);
  objc_msgSend(v41, "setPosition:", v9 * 0.5, v13 * 0.5);
}

- (int64_t)_dockPositionForString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:AXZoomDockPositionTop] & 1) == 0)
  {
    if ([v3 isEqualToString:AXZoomDockPositionLeft])
    {
      int64_t v4 = 1LL;
      goto LABEL_9;
    }

    if ([v3 isEqualToString:AXZoomDockPositionRight])
    {
      int64_t v4 = 2LL;
      goto LABEL_9;
    }

    if ([v3 isEqualToString:AXZoomDockPositionBottom])
    {
      int64_t v4 = 3LL;
      goto LABEL_9;
    }

    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWZoomDockedLensViewController.m",  203LL,  "-[ZWZoomDockedLensViewController _dockPositionForString:]",  @"Invalid dock position: %@. Defaulting to Top");
  }

  int64_t v4 = 0LL;
LABEL_9:

  return v4;
}

- (void)_applyInitialLayoutConstraints
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
  -[ZWZoomLensViewController _applyInitialLayoutConstraints](&v29, "_applyInitialLayoutConstraints");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  [v4 bounds];
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController screen](self, "screen"));
  [v8 bounds];
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  1LL,  0LL,  v4,  1LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setZoomViewLeftConstraint:](self, "setZoomViewLeftConstraint:", v11);

  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  2LL,  0LL,  v4,  2LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setZoomViewRightConstraint:](self, "setZoomViewRightConstraint:", v12);

  CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  3LL,  0LL,  v4,  3LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setZoomViewTopConstraint:](self, "setZoomViewTopConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  4LL,  0LL,  v4,  4LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setZoomViewBottomConstraint:](self, "setZoomViewBottomConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController zoomViewTopConstraint](self, "zoomViewTopConstraint"));
  v31[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController zoomViewRightConstraint](self, "zoomViewRightConstraint"));
  v31[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController zoomViewLeftConstraint](self, "zoomViewLeftConstraint"));
  v31[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController zoomViewBottomConstraint](self, "zoomViewBottomConstraint"));
  v31[3] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 4LL));
  [v3 addConstraints:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  1LL,  0LL,  v3,  1LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setDockedViewLeftConstraint:](self, "setDockedViewLeftConstraint:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  2LL,  0LL,  v3,  2LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setDockedViewRightConstraint:](self, "setDockedViewRightConstraint:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  3LL,  0LL,  v3,  3LL,  1.0,  0.0));
  -[ZWZoomDockedLensViewController setDockedViewTopConstraint:](self, "setDockedViewTopConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  4LL,  0LL,  v3,  4LL,  1.0,  -(v10 - v7)));
  -[ZWZoomDockedLensViewController setDockedViewBottomConstraint:](self, "setDockedViewBottomConstraint:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
  v30[0] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
  v30[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
  v30[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
  v30[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL));
  [v3 addConstraints:v28];
}

- (id)identifier
{
  return AXZoomLensModeWindowAnchored;
}

- (void)viewDidLayoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
  -[ZWZoomDockedLensViewController viewDidLayoutSubviews](&v54, "viewDidLayoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorView](self, "screenReplicatorView"));
  CATransform3D v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorView](self, "dockReplicatorView"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorLayer](self, "screenReplicatorLayer"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenBackdropLayer](self, "screenBackdropLayer"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v7 bounds];
  double v9 = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v10 bounds];
  double v12 = v11;

  -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
  double v14 = v9 * v13;
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
  {
    double v15 = v12;
    if ((char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
    {
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double v15 = v12 * v16;
      double v14 = v9;
    }
  }

  else
  {
    double v15 = v12;
  }

  v17 = v3;
  [v3 bounds];
  double v19 = v18;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoomPreferredCurrentDockPosition]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController stringForCurrentDockPosition](self, "stringForCurrentDockPosition"));
  if ([v21 isEqualToString:v22])
  {
  }

  else
  {
    unsigned __int8 v23 = -[ZWZoomDockedLensViewController dockPositionIsTransitioning](self, "dockPositionIsTransitioning");

    if ((v23 & 1) == 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 zoomPreferredCurrentDockPosition]);
      -[ZWZoomDockedLensViewController transitionToDockPosition:completion:]( self,  "transitionToDockPosition:completion:",  v41,  0LL);

      id v24 = (void *)v5;
      v25 = (void *)v6;
      v26 = (void *)v4;
      v27 = v52;
      goto LABEL_11;
    }
  }

  id v24 = (void *)v5;
  v25 = (void *)v6;
  v26 = (void *)v4;
  v27 = v52;
  if (vabdd_f64(v19, v12) < 2.22044605e-16)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v28 bounds];
    objc_msgSend(v17, "setBounds:");

    [v17 center];
    double v30 = v29;
    [v17 center];
    objc_msgSend(v17, "setCenter:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v32 bounds];
    objc_msgSend(v52, "setBounds:");

    [v52 center];
    double v34 = v33;
    [v52 center];
    objc_msgSend(v52, "setCenter:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v36 bounds];
    objc_msgSend(v26, "setBounds:");

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorView](self, "screenReplicatorView"));
    [v37 center];
    objc_msgSend(v26, "setPosition:");

    -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
    -[ZWZoomDockedLensViewController setScreenShift:](self, "setScreenShift:", v9 * (v38 / v12));
    objc_msgSend(v24, "setBackdropRect:", 0.0, 0.0, v12, v9);
    objc_msgSend(v25, "setBounds:", 0.0, 0.0, v15, v14);
    -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
    -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v9 * (v39 / v12));
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = __55__ZWZoomDockedLensViewController_viewDidLayoutSubviews__block_invoke;
    v53[3] = &unk_6CBC0;
    v53[4] = self;
    +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v53);
    -[ZWZoomDockedLensViewController _updateConstraintsAndShiftsForDockPosition:]( self,  "_updateConstraintsAndShiftsForDockPosition:",  -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"));
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  }

id __55__ZWZoomDockedLensViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensZoomView]);
  [v2 layoutSubviews];

  return [*(id *)(a1 + 32) _updateZoomRegionPositionAndSize];
}

- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
  -[ZWZoomLensViewController updateZoomFactor:panOffset:animated:animationDuration:completion:]( &v8,  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  a5,  a7,  a3,  a4.x,  a4.y,  a6);
  -[ZWZoomDockedLensViewController _updateZoomRegionPositionAndSize](self, "_updateZoomRegionPositionAndSize");
}

- (void)toggleZoomRegionVisibility
{
  unsigned int v3 = -[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible");
  if ((v3 & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity"));
    LODWORD(v5) = 0;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5));
    [v4 setToValue:v6];

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    [v7 addAnimation:v4 forKey:0];

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    LODWORD(v9) = 0;
    [v8 setOpacity:v9];

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
    double v11 = v10;
    uint64_t v12 = 1LL;
  }

  else
  {
    -[ZWZoomDockedLensViewController _updateZoomRegionPositionAndSize](self, "_updateZoomRegionPositionAndSize");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity"));
    LODWORD(v13) = 1.0;
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13));
    [v4 setToValue:v14];

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    [v15 addAnimation:v4 forKey:0];

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    LODWORD(v17) = 1.0;
    [v16 setOpacity:v17];

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
    double v11 = v10;
    uint64_t v12 = 0LL;
  }

  [v10 setHidden:v12];

  -[ZWZoomDockedLensViewController setZoomRegionVisible:](self, "setZoomRegionVisible:", v3 ^ 1);
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedDelegate](self, "dockedDelegate"));
  objc_msgSend( v18,  "dockedLensViewController:zoomRegionVisibilityWasChanged:",  self,  -[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible"));
}

- (void)moveDockedZoomToPhysicalScreenPoint:(CGPoint)a3 animated:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  -[ZWZoomDockedLensViewController _moveZoomRegionToPoint:animated:](self, "_moveZoomRegionToPoint:animated:", a4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
  [v7 position];
  double v9 = x - v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
  [v10 position];
  double v12 = y - v11;

  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset");
  double v14 = v9 - v13;
  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset");
  double v16 = v12 - v15;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  objc_msgSend(v18, "zoomLensViewController:didMoveLens:withDelta:", self, v17, v14, v16);
}

- (void)interceptFingerDownAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  [v7 frame];
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  if (CGRectContainsPoint(v10, v8)
    || (-[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame"),
        v9.CGFloat x = x,
        v9.CGFloat y = y,
        CGRectContainsPoint(v11, v9)))
  {
  }

  else
  {
    unsigned int v6 = -[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible");

    if (v6) {
      -[ZWZoomDockedLensViewController toggleZoomRegionVisibility](self, "toggleZoomRegionVisibility");
    }
  }

- (void)showOrHideUIForStandbyModeWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v5 bounds];
  double v7 = v6;

  CGPoint v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v8 bounds];
  double v10 = v9;

  unsigned int v11 = -[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode");
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  if (v11)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke;
    v43[3] = &unk_6CEB0;
    v43[4] = self;
    id v44 = v4;
    +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v43);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    [v12 setHidden:1];

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v13 frame];
    v47.origin.CGFloat x = CGRectZero.origin.x;
    v47.origin.CGFloat y = CGRectZero.origin.y;
    v47.size.width = CGRectZero.size.width;
    v47.size.height = CGRectZero.size.height;
    BOOL v14 = CGRectEqualToRect(v45, v47);

    if (!v14)
    {
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double v16 = v15;
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double v18 = v17;
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      double v20 = v19;
      if (!-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
        || (int64_t v21 = -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"), v22 = 0.0, v21 == 3))
      {
        double v7 = 0.0;
        double v22 = v10;
      }

      -[ZWZoomDockedLensViewController resizeDock:animated:](self, "resizeDock:animated:", 1LL, v22, v7);
      -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:", v16);
      -[ZWZoomDockedLensViewController setScreenShift:](self, "setScreenShift:", v18);
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v20);
    }

    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    unsigned __int8 v23 = v44;
  }

  else
  {
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472LL;
    double v39 = __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke_2;
    v40 = &unk_6CED8;
    v41 = self;
    id v42 = v4;
    +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", &v37);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView", v37, v38, v39, v40));
    [v24 setHidden:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorView](self, "screenReplicatorView"));
    [v25 setHidden:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorView](self, "dockReplicatorView"));
    [v26 setHidden:0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
    [v27 setHidden:0];

    if (-[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
      [v28 setHidden:0];
    }

    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v29 frame];
    v48.origin.CGFloat x = CGRectZero.origin.x;
    v48.origin.CGFloat y = CGRectZero.origin.y;
    v48.size.width = CGRectZero.size.width;
    v48.size.height = CGRectZero.size.height;
    BOOL v30 = CGRectEqualToRect(v46, v48);

    if (!v30)
    {
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double v32 = v31;
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      double v34 = v33;
      if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
        && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
      {
        -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
        double v10 = v10 * v36;
      }

      else
      {
        -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
        double v7 = v7 * v35;
      }

      -[ZWZoomDockedLensViewController resizeDock:animated:](self, "resizeDock:animated:", 1LL, v10, v7);
      +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:", 0.35);
      -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:", v34);
      -[ZWZoomDockedLensViewController shiftScreen:](self, "shiftScreen:", v32);
    }

    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    unsigned __int8 v23 = v42;
  }
}

uint64_t __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toggleZoomRegionButton]);
  [v2 setHidden:1];

  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensView]);
  [v3 setHidden:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockReplicatorView]);
  [v4 setHidden:1];

  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) screenReplicatorView]);
  [v5 setHidden:1];

  double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) touchStealLayer]);
  [v6 setHidden:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __75__ZWZoomDockedLensViewController_showOrHideUIForStandbyModeWithCompletion___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) _updateZoomRegionPositionAndSize];
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) maskLayer]);
  [v3 setHidden:0];
}

- (void)transitionToDockPosition:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  double v12 = __70__ZWZoomDockedLensViewController_transitionToDockPosition_completion___block_invoke;
  double v13 = &unk_6CEB0;
  BOOL v14 = self;
  id v8 = v7;
  id v15 = v8;
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", &v10);
  if (objc_msgSend(v6, "isEqualToString:", AXZoomDockPositionTop, v10, v11, v12, v13, v14))
  {
    uint64_t v9 = 0LL;
LABEL_9:
    -[ZWZoomDockedLensViewController _updateConstraintsAndShiftsForDockPosition:]( self,  "_updateConstraintsAndShiftsForDockPosition:",  v9);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:AXZoomDockPositionLeft])
  {
    uint64_t v9 = 1LL;
    goto LABEL_9;
  }

  if ([v6 isEqualToString:AXZoomDockPositionRight])
  {
    uint64_t v9 = 2LL;
    goto LABEL_9;
  }

  if ([v6 isEqualToString:AXZoomDockPositionBottom])
  {
    uint64_t v9 = 3LL;
    goto LABEL_9;
  }

uint64_t __70__ZWZoomDockedLensViewController_transitionToDockPosition_completion___block_invoke(uint64_t a1)
{
  double v3 = v2;
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v5 = v3 + v4 * 0.5;
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v7 = v6;
  [*(id *)(a1 + 32) zoomRegionFrame];
  double v9 = v7 + v8 * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "_moveZoomRegionToPoint:", v5, v9);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockReplicatorLayer]);
  [v10 position];
  double v12 = v5 - v11;
  double v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockReplicatorLayer]);
  [v13 position];
  double v15 = v9 - v14;

  [*(id *)(a1 + 32) zoomPanOffset];
  double v17 = v12 - v16;
  [*(id *)(a1 + 32) zoomPanOffset];
  double v19 = v15 - v18;
  double v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  int64_t v21 = *(void **)(a1 + 32);
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 lensZoomView]);
  objc_msgSend(v20, "zoomLensViewController:didMoveLens:withDelta:", v21, v22, v17, v19);

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_moveZoomRegionToPoint:(CGPoint)a3
{
}

- (void)_moveZoomRegionToPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v7 bounds];
  double v9 = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v10 bounds];
  double v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v13 bounds];
  double v15 = v14;

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v16 bounds];
  double v18 = v17;

  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v51 = v19;
  double v53 = v21;
  double v54 = v20;
  double v22 = v20 * 0.5;
  double v23 = v21 * 0.5;
  double v25 = v24 + v21 * 0.5;
  int64_t v26 = -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition");
  double v27 = v12 - v18;
  if (v26 == 1) {
    double v28 = v18;
  }
  else {
    double v28 = 0.0;
  }
  if (v26 == 1) {
    double v29 = 0.0;
  }
  else {
    double v29 = v15;
  }
  if (v26 == 2) {
    double v28 = 0.0;
  }
  else {
    double v27 = v12;
  }
  if (v26 == 2) {
    double v29 = 0.0;
  }
  if (v26 == 3) {
    double v30 = v12;
  }
  else {
    double v30 = v27;
  }
  if (v26 == 3) {
    double v31 = 0.0;
  }
  else {
    double v31 = v28;
  }
  if (v26 == 3) {
    double v32 = v9 - v15;
  }
  else {
    double v32 = v9;
  }
  if (v26 == 3) {
    double v33 = 0.0;
  }
  else {
    double v33 = v29;
  }
  double v34 = v32 - v23;
  if (y < v32 - v23) {
    double v34 = y;
  }
  if (v34 >= v23 + v33) {
    double v35 = v34;
  }
  else {
    double v35 = v23 + v33;
  }
  double v36 = v30 - v22;
  if (x < v30 - v22) {
    double v36 = x;
  }
  if (v36 < v22 + v31) {
    double v36 = v22 + v31;
  }
  double v55 = v36;
  double v52 = v35;
  double v37 = v35 - v25;
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
  {
    double v37 = v55 - (v51 + v22);
  }

  -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
  -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:", v37 + v38);
  id v57 = (id)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"path"));
  double v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithCGPath:]( UIBezierPath,  "bezierPathWithCGPath:",  [v39 path]));
  [v57 setFromValue:v40];

  double v41 = v30 - v31;
  id v42 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  v31,  v33,  v41,  v32 - v33));
  double v43 = v55 - v22;
  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v43,  v52 - v23,  v54,  v53,  5.0));
  [v42 appendPath:v44];
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  CGRect v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
  [v45 setStrokeStart:(v32 - v33 + v32 - v33 + v41 * 2.0) / (v54 + v54 + v53 * 2.0 + -8.58407346 + v32 - v33 + v32 - v33 + v41 * 2.0)];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  [v57 setToValue:v42];
  [v57 setDuration:0.15];
  if (v4)
  {
    CGRect v46 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    CGRect v47 = (void *)objc_claimAutoreleasedReturnValue([v57 keyPath]);
    [v46 addAnimation:v57 forKey:v47];
  }

  id v48 = v42;
  id v49 = [v48 CGPath];
  CATransform3D v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
  [v50 setPath:v49];

  -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v43, v52 - v23, v54, v53);
  self->_lastScrollPoint.double x = v55;
  self->_lastScrollPoint.double y = v52;
}

- (void)_updateZoomRegionPositionAndSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v6 bounds];
  double v8 = v7;

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoomReplicatorLayer]);
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v19 bounds];
  double v21 = v20;

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v22 bounds];
  double v24 = v23;

  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v63 = v25;
  double v61 = v26;
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
  {
    int64_t v37 = -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition");
    double v38 = v5;
    double v27 = v8 - v24;
    double v39 = 0.0;
    if (v37 == 1) {
      double v39 = v24;
    }
    double v40 = v8 - v24;
    double v8 = v38;
    double v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  v39,  0.0,  v40));
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v42 = v41;
    -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
    -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12 + v43, v14, v16, v18);
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v45 = v44 - v42;
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v36 = v24 * (v45 / (v27 - v46));
  }

  else
  {
    double v27 = v5 - v21;
    if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")) {
      double v28 = 0.0;
    }
    else {
      double v28 = v21;
    }
    double v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  0.0,  v28,  v8,  v27));
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v31 = v30;
    -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
    -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14 + v32, v16, v18);
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v34 = v33 - v31;
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v36 = v21 * (v34 / (v27 - v35));
  }

  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  CGRect v47 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:"));
  [v29 appendPath:v47];
  double v48 = v27 + v27 + v8 * 2.0;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v50 = v49;
  double v52 = v51;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v54 = v53;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v56 = v55 + v55 + v54 * 2.0 + -8.58407346;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
  [v57 setStrokeStart:v48 / (v48 + v56)];

  id v62 = v29;
  id v58 = [v62 CGPath];
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
  [v59 setPath:v58];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  if (v63 == v50 && v61 == v52)
  {
    -[ZWZoomDockedLensViewController screenShift](self, "screenShift", v61);
    -[ZWZoomDockedLensViewController shiftScreen:](self, "shiftScreen:", v60 - v36);
  }
}

- (BOOL)_zoomRegionOnDockReplicatorEdge
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (!-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    || (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") == (char *)&dword_0 + 3)
  {
    double v20 = 1.0;
    if (vabdd_f64(v6, v15) >= 1.0)
    {
      double v21 = v6 + v10;
      double v22 = v15 + v19;
      return vabdd_f64(v21, v22) < v20;
    }

    return 1;
  }

  double v20 = 1.0;
  if (vabdd_f64(v4, v13) < 1.0) {
    return 1;
  }
  double v21 = v4 + v8;
  double v22 = v13 + v17;
  return vabdd_f64(v21, v22) < v20;
}

- (BOOL)zoomRegionOnScreenReplicatorEdge
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorLayer](self, "screenReplicatorLayer"));
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (!-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    || (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") == (char *)&dword_0 + 3)
  {
    double v20 = 1.0;
    if (vabdd_f64(v6, v15) >= 1.0)
    {
      double v21 = v6 + v10;
      double v22 = v15 + v19;
      return vabdd_f64(v21, v22) < v20;
    }

    return 1;
  }

  double v20 = 1.0;
  if (vabdd_f64(v4, v13) < 1.0) {
    return 1;
  }
  double v21 = v4 + v8;
  double v22 = v13 + v17;
  return vabdd_f64(v21, v22) < v20;
}

- (void)shiftScreen:(double)a3
{
}

- (void)shiftScreen:(double)a3 animated:(BOOL)a4
{
}

- (void)shiftScreen:(double)a3 animated:(BOOL)a4 discardNewValue:(BOOL)a5
{
  BOOL v6 = a4;
  __int128 v9 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v51.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v51.m33 = v9;
  __int128 v10 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v51.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v51.m43 = v10;
  __int128 v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v51.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v51.m13 = v11;
  __int128 v12 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v51.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v51.m23 = v12;
  -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
  double v14 = v13;
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  switch(-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
  {
    case 0LL:
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v15 bounds];
      double v17 = v16;

      if (v17 <= a3) {
        double v18 = v17;
      }
      else {
        double v18 = a3;
      }
      if (v18 >= 0.0) {
        double v14 = v18;
      }
      else {
        double v14 = 0.0;
      }
      double v19 = 0.0;
      double v20 = v14;
      goto LABEL_30;
    case 1LL:
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v21 bounds];
      double v23 = v22;

      if (v23 <= a3) {
        double v24 = v23;
      }
      else {
        double v24 = a3;
      }
      double v20 = 0.0;
      if (v24 >= 0.0) {
        double v14 = v24;
      }
      else {
        double v14 = 0.0;
      }
      double v19 = v14;
      goto LABEL_30;
    case 2LL:
      double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v25 bounds];
      double v27 = v26;

      if (v27 <= a3) {
        double v28 = v27;
      }
      else {
        double v28 = a3;
      }
      if (v28 >= 0.0) {
        double v14 = v28;
      }
      else {
        double v14 = 0.0;
      }
      double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v29 bounds];
      double v31 = v30;

      double v19 = -(v31 - v14);
      double v20 = 0.0;
      goto LABEL_30;
    case 3LL:
      double v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v32 bounds];
      double v34 = v33;

      if (v34 <= a3) {
        double v35 = v34;
      }
      else {
        double v35 = a3;
      }
      if (v35 >= 0.0) {
        double v14 = v35;
      }
      else {
        double v14 = 0.0;
      }
      double v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v36 bounds];
      double v38 = v37;

      double v20 = -(v38 - v14);
      double v19 = 0.0;
LABEL_30:
      CATransform3DMakeTranslation(&v51, v19, v20, 0.0);
      break;
    default:
      break;
  }

  if (v6)
  {
    double v39 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"instanceTransform"));
    double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorLayer](self, "screenReplicatorLayer"));
    double v41 = v40;
    if (v40) {
      [v40 instanceTransform];
    }
    else {
      memset(v50, 0, sizeof(v50));
    }
    double v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](&OBJC_CLASS___NSValue, "valueWithCATransform3D:", v50));
    [v39 setFromValue:v42];

    CATransform3D v49 = v51;
    double v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](&OBJC_CLASS___NSValue, "valueWithCATransform3D:", &v49));
    [v39 setToValue:v43];

    [v39 setDuration:0.35];
    double v44 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionDefault));
    [v39 setTimingFunction:v44];

    [v39 setCumulative:1];
    double v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorLayer](self, "screenReplicatorLayer"));
    [v45 addAnimation:v39 forKey:@"RepInstanceTransform"];
  }

  if (!a5) {
    -[ZWZoomDockedLensViewController setScreenShift:](self, "setScreenShift:", v14);
  }
  CATransform3D v48 = v51;
  double v46 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController screenReplicatorLayer](self, "screenReplicatorLayer"));
  CATransform3D v47 = v48;
  [v46 setInstanceTransform:&v47];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)shiftDock:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v5 bounds];
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v8 bounds];
  double v10 = v9;

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v11 bounds];
  double v13 = v12;

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v14 bounds];
  double v16 = v15;

  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  switch(-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
  {
    case 0LL:
      double v17 = v10 - v13;
      if (v10 - v13 >= a3) {
        double v17 = a3;
      }
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v17);
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      if (v13 >= v18) {
        double v18 = v13;
      }
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v18);
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      double v20 = v13 * 0.5 + v19;
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      objc_msgSend(v21, "setPosition:", v16 * 0.5, v20);

      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      CATransform3DMakeTranslation(&v54, 0.0, -v22, 0.0);
      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      double v24 = v23;
      CATransform3D v53 = v54;
      double v25 = &v53;
      goto LABEL_18;
    case 1LL:
      double v26 = v7 - v16;
      if (v7 - v16 >= a3) {
        double v26 = a3;
      }
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v26);
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      if (v16 >= v27) {
        double v27 = v16;
      }
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v27);
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      double v29 = v16 * 0.5 + v28;
      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      objc_msgSend(v30, "setPosition:", v29, v13 * 0.5);

      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      CATransform3DMakeTranslation(&v52, -v31, 0.0, 0.0);
      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      double v24 = v23;
      CATransform3D v51 = v52;
      double v25 = &v51;
      goto LABEL_18;
    case 2LL:
      double v32 = v7 + v16 * -2.0;
      if (v32 >= a3) {
        double v32 = a3;
      }
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v32);
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", fmax(v33, 0.0));
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      double v35 = v16 * 0.5 + v34;
      double v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      objc_msgSend(v36, "setPosition:", v35, v13 * 0.5);

      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      CATransform3DMakeTranslation(&v50, v7 - v16 - v37, 0.0, 0.0);
      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      double v24 = v23;
      CATransform3D v49 = v50;
      double v25 = &v49;
      goto LABEL_18;
    case 3LL:
      double v38 = v10 + v13 * -2.0;
      if (v38 >= a3) {
        double v38 = a3;
      }
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v38);
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", fmax(v39, 0.0));
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      double v41 = v13 * 0.5 + v40;
      double v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      objc_msgSend(v42, "setPosition:", v16 * 0.5, v41);

      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      CATransform3DMakeTranslation(&v48, 0.0, v10 - v13 - v43, 0.0);
      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
      double v24 = v23;
      CATransform3D v47 = v48;
      double v25 = &v47;
LABEL_18:
      objc_msgSend( v23,  "setInstanceTransform:",  v25,  *(_OWORD *)&v47.m11,  *(_OWORD *)&v47.m13,  *(_OWORD *)&v47.m21,  *(_OWORD *)&v47.m23,  *(_OWORD *)&v47.m31,  *(_OWORD *)&v47.m33,  *(_OWORD *)&v47.m41,  *(_OWORD *)&v47.m43);

      break;
    default:
      break;
  }

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
  double v45 = a3 - v44;
  -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
  -[ZWZoomDockedLensViewController shiftScreen:](self, "shiftScreen:", v46 - v45);
}

- (void)_shiftReplicatorsWithOverflowPan:(CGPoint)a3 useFullDelta:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedDelegate](self, "dockedDelegate"));
  if ([v8 userIsInteractingWithSlugWithDockedLensViewController:self])
  {
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedDelegate](self, "dockedDelegate"));
    unsigned __int8 v10 = [v9 isZoomMovingWithVelocityWithDockedLensViewController:self];

    if ((v10 & 1) == 0 && !a4)
    {
      double v11 = self->_lastPanPoint.y;
      double v12 = x - self->_lastPanPoint.x;
      self->_lastPanPoint.double x = x;
      self->_lastPanPoint.double y = y;
      double y = y - v11;
      double x = v12;
    }
  }

  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
  {
    double y = x;
  }

  -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
  -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:", y + v13);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)_layoutDockUIWithFrames:(CGRect)a3 restOfScreeFrame:(CGRect)a4 positionOrientationChanged:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view", a3.origin.x, a3.origin.y));
  [v13 bounds];
  double v50 = v14;

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v15 bounds];
  double v49 = v16;

  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v18 = v17;
  double v47 = v19;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v21 = v20;
  double v48 = v22;
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v23 bounds];
  double v46 = v24;

  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v25 bounds];
  double v45 = v26;

  if (v5)
  {
    -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
    -[ZWZoomDockedLensViewController setScreenShift:](self, "setScreenShift:", v49 * (v27 / v50));
    -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
    -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v49 * (v28 / v50));
    -[ZWZoomDockedLensViewController setZoomRegionFrame:]( self,  "setZoomRegionFrame:",  v21,  v48,  v11 * (v18 / v45),  v10 * (v47 / v46));
  }

  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
  objc_msgSend(v29, "setFrame:", x, y, width, height);

  double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;

  double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  objc_msgSend(v35, "setBounds:", v32, v34, v11, v10);

  -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
  -[ZWZoomDockedLensViewController shiftScreen:](self, "shiftScreen:");
  double v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
  objc_msgSend(v36, "setBounds:", 0.0, 0.0, v11, v10);

  -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
  -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:");
  double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
  objc_msgSend(v37, "setBackdropRect:", 0.0, 0.0, v11, v10);

  if (-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
    double v39 = v38;
    -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
    double v41 = v40;
    -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
    double v43 = v42;
    if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
      && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
    {
      double v50 = 0.0;
      double v44 = v49;
    }

    else
    {
      double v44 = 0.0;
    }

    -[ZWZoomDockedLensViewController resizeDock:animated:](self, "resizeDock:animated:", 0LL, v50, v44);
    -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:", v39);
    -[ZWZoomDockedLensViewController setScreenShift:](self, "setScreenShift:", v41);
    -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v43);
  }

- (void)_updateConstraintsAndShiftsForDockPosition:(int64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v5 bounds];
  double width = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v8 bounds];
  double height = v9;

  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v12 = v11;
  double v14 = v13;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v16 = v15;
  double v18 = v17;
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v19 bounds];
  double v21 = v20;

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v22 bounds];
  double v24 = v23;

  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  double v25 = -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition");
  -[ZWZoomDockedLensViewController setDockPosition:](self, "setDockPosition:", a3);
  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, v21, v24);

  switch(a3)
  {
    case 0LL:
      double v82 = v16;
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double y = height * v27;
      if (v25 == (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
      {
        uint64_t v29 = 0LL;
LABEL_42:
        double height = height - y;
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
        [v67 setConstant:-height];

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
        double x = 0.0;
        [v68 setConstant:0.0];

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
        [v69 setConstant:0.0];

        v70 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
        [v70 setConstant:0.0];

        v71 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
        [v71 makeHorizontal];

        CATransform3D v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
        objc_msgSend(v53, "setCenter:", width * 0.5, y);
        double v41 = 0.0;
        double v42 = 0.0;
        double v35 = width;
        double v40 = y;
        goto LABEL_50;
      }

      if (v25 == (_BYTE *)&dword_0 + 3)
      {
        double v14 = v14 + v24;
        -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
        -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v24 + v63);
      }

      else
      {
        if (v25 == (_BYTE *)&dword_0 + 2)
        {
          -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
          double v12 = v12 + v21 - v64;
          -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
          -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v21 + v65);
          goto LABEL_40;
        }

        if (v25 == (_BYTE *)&dword_0 + 1)
        {
          -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
          double v12 = v12 - v43;
LABEL_40:
          uint64_t v29 = 1LL;
          goto LABEL_41;
        }
      }

      uint64_t v29 = 0LL;
LABEL_41:
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14 + v66, v82, v18);
      goto LABEL_42;
    case 1LL:
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double x = width * v30;
      if (v25 == (_BYTE *)&dword_0 + 3)
      {
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v14 = v14 + v45;
        goto LABEL_24;
      }

      if (v25 == (_BYTE *)&dword_0 + 2)
      {
        double v12 = v12 + v21;
        -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
        -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v21 + v47);
      }

      else if (!v25)
      {
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v14 = v14 - v32;
LABEL_24:
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v12 = v12 + v46;
        uint64_t v29 = 1LL;
        goto LABEL_27;
      }

      uint64_t v29 = 0LL;
LABEL_27:
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14, v16, v18);
      double width = width - x;
      double v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
      double y = 0.0;
      [v48 setConstant:0.0];

      double v49 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
      [v49 setConstant:0.0];

      double v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
      [v50 setConstant:-width];

      CATransform3D v51 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
      [v51 setConstant:0.0];

      CATransform3D v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
      [v52 makeVertical];

      CATransform3D v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
      objc_msgSend(v53, "setCenter:", x, height * 0.5);
      double v41 = 0.0;
      double v42 = 0.0;
      double v35 = x;
      goto LABEL_34;
    case 2LL:
      double v83 = v18;
      double v33 = v14;
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double v35 = width * v34;
      if (v25 == (_BYTE *)&dword_0 + 3)
      {
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v33 = v33 + v54;
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v12 = v12 - (v35 - v55);
        goto LABEL_29;
      }

      if (v25 == (_BYTE *)&dword_0 + 1)
      {
        double v12 = v12 - v35;
        -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
        -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v56 - v21);
      }

      else if (!v25)
      {
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v33 = v33 - v36;
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v12 = v12 - (v35 - v37);
        -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
        -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v38 - v24);
LABEL_29:
        uint64_t v29 = 1LL;
        goto LABEL_32;
      }

      uint64_t v29 = 0LL;
LABEL_32:
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v33, v16, v83);
      double width = width - v35;
      id v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
      double x = 0.0;
      [v57 setConstant:0.0];

      id v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
      [v58 setConstant:width];

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
      [v59 setConstant:0.0];

      double v60 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
      [v60 setConstant:0.0];

      double v61 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
      [v61 makeVertical];

      id v62 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
      objc_msgSend(v62, "setCenter:", width, height * 0.5);

      if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
      {
        double y = 0.0;
        double v41 = width;
        double v42 = 0.0;
LABEL_36:
        double v40 = height;
        goto LABEL_51;
      }

      CATransform3D v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
      objc_msgSend(v53, "setFrame:", v35, 0.0, v35, height);
      double y = 0.0;
      double v41 = width;
      double v42 = 0.0;
LABEL_34:
      double v40 = height;
      goto LABEL_50;
    case 3LL:
      double v84 = v18;
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double v40 = height * v39;
      if (v25 == (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
      {
        uint64_t v29 = 0LL;
        goto LABEL_48;
      }

      if (!v25)
      {
        double v14 = v14 - v24;
        -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
        -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v24 + v72);
        goto LABEL_44;
      }

      if (v25 == (_BYTE *)&dword_0 + 2)
      {
        -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
        double v12 = v12 + v21 - v73;
        -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
        -[ZWZoomDockedLensViewController setDockShift:](self, "setDockShift:", v21 + v74);
        goto LABEL_46;
      }

      if (v25 != (_BYTE *)&dword_0 + 1)
      {
LABEL_44:
        uint64_t v29 = 0LL;
        goto LABEL_47;
      }

      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double v12 = v12 - v44;
LABEL_46:
      uint64_t v29 = 1LL;
LABEL_47:
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v12, v14 - v75, v16, v84);
LABEL_48:
      double height = height - v40;
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
      double x = 0.0;
      [v76 setConstant:0.0];

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
      [v77 setConstant:0.0];

      v78 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
      [v78 setConstant:0.0];

      v79 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
      [v79 setConstant:height];

      v80 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
      [v80 makeHorizontal];

      v81 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
      objc_msgSend(v81, "setCenter:", width * 0.5, height);

      if (-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
      {
        CATransform3D v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
        objc_msgSend(v53, "setFrame:", 0.0, v40, width, v40);
        double y = 0.0;
        double v41 = 0.0;
        double v42 = height;
        double v35 = width;
LABEL_50:
      }

      else
      {
        double y = 0.0;
        double v41 = 0.0;
        double v42 = height;
        double v35 = width;
      }

- (void)setInDockResizingMode:(BOOL)a3
{
  if (self->_inDockResizingMode != a3)
  {
    self->_inDockResizingMode = a3;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
    [v3 setNeedsLayout];
  }

- (void)_updateZoomRegionFrameForDockResizeWithScreenShiftDelta:(double)a3
{
  double v6 = v5;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v8 = v7;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoomReplicatorLayer]);
  [v10 frame];
  double v12 = v11;
  double v14 = v13;

  switch(-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
  {
    case 0LL:
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v15 bounds];
      double v17 = v16;

      if (v17 >= v8 + a3) {
        double v8 = v17;
      }
      else {
        double v8 = v8 + a3;
      }
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
      [v18 bounds];
      double v20 = v19 - v14;

      if (v20 < v8) {
        double v8 = v20;
      }
      break;
    case 1LL:
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v21 bounds];
      double v23 = v22;

      if (v23 >= v6 + a3) {
        double v6 = v23;
      }
      else {
        double v6 = v6 + a3;
      }
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
      [v24 bounds];
      double v26 = v25 - v12;

      if (v26 < v6) {
        double v6 = v26;
      }
      break;
    case 2LL:
      double v27 = fmax(v6 + a3, 0.0);
      double v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
      [v28 bounds];
      double v30 = v29;
      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v31 bounds];
      double v6 = v30 - v32 - v12;

      if (v6 >= v27) {
        double v6 = v27;
      }
      break;
    case 3LL:
      double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v33 bounds];
      double v35 = v34;

      if (v35 >= v8 + a3) {
        double v36 = v35;
      }
      else {
        double v36 = v8 + a3;
      }
      double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
      [v37 bounds];
      double v39 = v38;
      double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v40 bounds];
      double v8 = v39 - v41 - v14;

      if (v8 >= v36) {
        double v8 = v36;
      }
      break;
    default:
      break;
  }

  -[ZWZoomDockedLensViewController setZoomRegionFrame:](self, "setZoomRegionFrame:", v6, v8, v12, v14);
}

- (void)resizeDock:(CGSize)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockReplicatorLayer](self, "dockReplicatorLayer"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v11 = v10;
  double v13 = v12;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v14 bounds];
  double v16 = v15;

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v17 bounds];
  double v19 = v18;

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v20 bounds];
  double v22 = v21;

  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v23 bounds];
  double v25 = v24;

  -[ZWZoomDockedLensViewController _maxDockWidth](self, "_maxDockWidth");
  if (width > v26)
  {
    -[ZWZoomDockedLensViewController _maxDockWidth](self, "_maxDockWidth");
    double width = v27;
  }

  -[ZWZoomDockedLensViewController _maxDockHeight](self, "_maxDockHeight");
  if (height > v28)
  {
    -[ZWZoomDockedLensViewController _maxDockHeight](self, "_maxDockHeight");
    double height = v29;
  }

  if ((vabdd_f64(height, v22) >= 2.22044605e-16
     || -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
     && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
    && (vabdd_f64(width, v25) >= 2.22044605e-16
     || (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 1
     && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 2))
  {
    double v171 = v13;
    double v30 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", v4 ^ 1);
    +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:", 0.35);
    double v31 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"position"));
    double v32 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
    double v33 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](&OBJC_CLASS___CAMediaTimingFunction, "functionWithName:"));
    [v31 setTimingFunction:v33];

    [v31 setDuration:0.35];
    double v170 = v25;
    double v164 = v19;
    double v165 = v16;
    double v172 = height;
    double v167 = v11;
    double v168 = v22;
    double v166 = width;
    switch(-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
    {
      case 0LL:
        -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:", height / v16);
        -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
        double v35 = v16 * v34;
        double v36 = v16 * v34 - v22;
        double v163 = v16 - v16 * v34;
        double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
        [v37 setConstant:-v163];

        double v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
        [v38 setConstant:0.0];

        double v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
        [v39 setConstant:0.0];

        double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
        [v40 setConstant:0.0];

        if (v4)
        {
          v176[0] = _NSConcreteStackBlock;
          v176[1] = 3221225472LL;
          v176[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke;
          v176[3] = &unk_6CF00;
          v176[4] = self;
          *(double *)&v176[5] = v25;
          *(double *)&v176[6] = v22;
          *(double *)&v176[7] = v19;
          *(double *)&v176[8] = v35;
          +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v176,  0LL,  0.35,  0.0);
          double v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v41 center];
          double v43 = v42;
          double v44 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v44 center];
          double v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v43, v45 - v36 * 0.5));
          [v31 setFromValue:v46];

          double v30 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          double v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v47 center];
          double v49 = v48;
          double v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v50 center];
          CATransform3D v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v49, v36 * 0.5 + v51));
          [v31 setToValue:v52];

          double v32 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          CATransform3D v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          objc_msgSend(v53, "setFrame:", 0.0, 0.0, v19, v35);
        }

        else
        {
          CATransform3D v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
          objc_msgSend(v53, "setCenter:", v19 * 0.5, v35);
        }

        double v169 = v36;
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
        double v81 = 0.0;
        double v71 = v163;
        objc_msgSend(v114, "setFrame:", 0.0, v35, v19, v163);
        double height = v35;
        double v76 = v35;
        goto LABEL_27;
      case 1LL:
        -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:", width / v19);
        -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
        double v96 = v19;
        double v19 = v19 * v97;
        v98 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
        [v98 setConstant:0.0];

        v99 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
        [v99 setConstant:0.0];

        double v100 = v96 - v19;
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
        [v101 setConstant:-(v96 - v19)];

        v102 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
        [v102 setConstant:0.0];

        double v169 = v19 - v25;
        if (v4)
        {
          v175[0] = _NSConcreteStackBlock;
          v175[1] = 3221225472LL;
          v175[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_2;
          v175[3] = &unk_6CF00;
          v175[4] = self;
          *(double *)&v175[5] = v25;
          *(double *)&v175[6] = v168;
          *(double *)&v175[7] = v19;
          *(double *)&v175[8] = v16;
          +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v175,  0LL,  0.35,  0.0);
          v103 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v103 center];
          double v105 = v104 - (v19 - v25) * 0.5;
          v106 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v106 center];
          v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v105));
          [v31 setFromValue:v107];

          double v30 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          v108 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v108 center];
          double v110 = (v19 - v25) * 0.5 + v109;
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v111 center];
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v110));
          [v31 setToValue:v112];

          double v32 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          v113 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          objc_msgSend(v113, "setFrame:", 0.0, 0.0, v19, v16);
        }

        else
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
          objc_msgSend(v113, "setCenter:", v19, v16 * 0.5);
        }

        v114 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
        double v76 = 0.0;
        double v71 = v100;
        objc_msgSend(v114, "setFrame:", v19, 0.0, v100, v16);
        double v81 = v19;
        goto LABEL_30;
      case 2LL:
        -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:", width / v19);
        -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
        double v55 = v19 * v54;
        double v169 = v19 * v54 - v25;
        double v56 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
        [v56 setConstant:0.0];

        id v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
        [v57 setConstant:v19 - v55];

        id v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
        [v58 setConstant:0.0];

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
        [v59 setConstant:0.0];

        if (v4)
        {
          v174[0] = _NSConcreteStackBlock;
          v174[1] = 3221225472LL;
          v174[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_3;
          v174[3] = &unk_6CF28;
          v174[4] = self;
          *(double *)&v174[5] = v25;
          *(double *)&v174[6] = v22;
          *(double *)&v174[7] = v19;
          *(double *)&v174[8] = v55;
          *(double *)&v174[9] = v16;
          +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v174,  0LL,  0.35,  0.0);
          double v60 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v60 center];
          double v62 = v169 * 0.5 + v61;
          double v63 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v63 center];
          double v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v62));
          [v31 setFromValue:v64];

          double v30 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          double v65 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v65 center];
          double v67 = v169 * 0.5 + v66;
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v68 center];
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v67));
          [v31 setToValue:v69];

          double v32 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          objc_msgSend(v70, "setFrame:", 0.0, 0.0, v55, v16);

          double v71 = v19 - v55;
        }

        else
        {
          v115 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
          double v71 = v19 - v55;
          objc_msgSend(v115, "setCenter:", v19 - v55, v16 * 0.5);
        }

        double v19 = v55;
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
        double v81 = 0.0;
        objc_msgSend(v114, "setFrame:", 0.0, 0.0, v71, v16);
        double v76 = 0.0;
LABEL_30:
        double height = v16;
        double v117 = v71;
        double v118 = height;
        double v119 = height;
        goto LABEL_31;
      case 3LL:
        -[ZWZoomDockedLensViewController setDockSize:](self, "setDockSize:", height / v16);
        -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
        double v73 = v16 * v72;
        double v74 = v16 * v72 - v22;
        double v75 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewBottomConstraint](self, "dockedViewBottomConstraint"));
        double v76 = 0.0;
        [v75 setConstant:0.0];

        v77 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewLeftConstraint](self, "dockedViewLeftConstraint"));
        [v77 setConstant:0.0];

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewRightConstraint](self, "dockedViewRightConstraint"));
        [v78 setConstant:0.0];

        v79 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedViewTopConstraint](self, "dockedViewTopConstraint"));
        [v79 setConstant:v16 - v73];

        double v169 = v74;
        if (v4)
        {
          v173[0] = _NSConcreteStackBlock;
          v173[1] = 3221225472LL;
          v173[2] = __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_4;
          v173[3] = &unk_6CF28;
          v173[4] = self;
          *(double *)&v173[5] = v170;
          *(double *)&v173[6] = v22;
          *(double *)&v173[7] = v19;
          *(double *)&v173[8] = v16;
          *(double *)&v173[9] = v73;
          double v80 = v16 - v73;
          double v81 = 0.0;
          +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v173,  0LL,  0.35,  0.0);
          double v82 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v82 center];
          double v84 = v83;
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v85 center];
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v84, v74 * 0.5 + v86));
          [v31 setFromValue:v87];

          double v30 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v88 center];
          double v90 = v89;
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          [v91 center];
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v90, v74 * 0.5 + v92));
          [v31 setToValue:v93];

          double v32 = &AVSpeechUtteranceDefaultSpeechRate_ptr;
          v94 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
          double height = v73;
          objc_msgSend(v94, "setFrame:", 0.0, 0.0, v19, v73);

          double v71 = v80;
        }

        else
        {
          double height = v73;
          v116 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
          objc_msgSend(v116, "setCenter:", v19 * 0.5, v16 - v73);

          double v71 = v16 - v73;
          double v81 = 0.0;
        }

        v114 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController touchStealLayer](self, "touchStealLayer"));
        objc_msgSend(v114, "setFrame:", 0.0, 0.0, v19, v71);
LABEL_27:
        double v117 = v19;
        double v118 = v71;
        double v119 = v19;
LABEL_31:

        v95 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  v81,  v76,  v117,  v118));
        double v25 = v71 + v71 + v119 * 2.0;
        double v11 = v167;
        double v22 = v168;
        double width = v166;
        break;
      default:
        v95 = 0LL;
        break;
    }

    v120 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
    [v120 bounds];
    double v122 = v121;
    double v124 = v123;

    v125 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
    objc_msgSend(v125, "setBounds:", v122, v124, v19, height);

    double v126 = v172;
    if (v172 == 0.0 || width == 0.0 || (double v126 = v170, v170 == 0.0) || v22 == 0.0)
    {
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift", v126);
      -[ZWZoomDockedLensViewController shiftScreen:animated:discardNewValue:]( self,  "shiftScreen:animated:discardNewValue:",  v4,  1LL);
      double v129 = v169;
    }

    else
    {
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift", v170);
      double v128 = v127;
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double v129 = v169;
      -[ZWZoomDockedLensViewController shiftScreen:animated:](self, "shiftScreen:animated:", v4, v169 + v130);
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      -[ZWZoomDockedLensViewController _updateZoomRegionFrameForDockResizeWithScreenShiftDelta:]( self,  "_updateZoomRegionFrameForDockResizeWithScreenShiftDelta:",  v131 - v128);
    }

    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    v132 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:"));
    [v8 frame];
    double v134 = v133;
    [v8 frame];
    [v8 setFrame:v134];
    if (v4)
    {
      v135 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
      [v135 addAnimation:v31 forKey:@"position"];

      if ((char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") == (char *)&dword_0 + 2
        || (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") == (char *)&dword_0 + 3)
      {
        v136 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"position"));
        [v136 setDuration:0.35];
        v137 = (void *)objc_claimAutoreleasedReturnValue([(id)v32[134] functionWithName:kCAMediaTimingFunctionDefault]);
        [v136 setTimingFunction:v137];

        v138 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
        [v138 position];

        if ((char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") == (char *)&dword_0 + 3)
        {
          double v139 = v164 * 0.5;
          v140 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
          [v140 position];
          double v142 = v141;
        }

        else
        {
          v140 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockBackdropLayer](self, "dockBackdropLayer"));
          [v140 position];
          double v139 = v144;
          double v142 = v165 * 0.5;
        }

        v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v139, v142));
        [v136 setFromValue:v145];

        double v146 = v170 + v139 - v19;
        double v147 = v22 + v142 - height;
        v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v146, v147));
        [v136 setToValue:v148];

        objc_msgSend(v9, "setPosition:", v146, v147);
        v149 = @"position";
        v150 = v9;
        v151 = v136;
      }

      else
      {
        v136 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"backdropRect"));
        [v136 setDuration:0.35];
        v152 = (void *)objc_claimAutoreleasedReturnValue([(id)v32[134] functionWithName:kCAMediaTimingFunctionDefault]);
        [v136 setTimingFunction:v152];

        [v9 backdropRect];
        v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:"));
        [v136 setFromValue:v153];

        v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", 0.0, 0.0, v19, height));
        [v136 setToValue:v154];

        objc_msgSend(v9, "setBackdropRect:", 0.0, 0.0, v19, height);
        [v9 backdropRect];
        objc_msgSend(v9, "setFrame:");
        v150 = v9;
        v151 = v136;
        v149 = @"backdropRect";
      }

      [v150 addAnimation:v151 forKey:v149];
    }

    else
    {
      -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
      -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:", v129 + v143);
      objc_msgSend(v9, "setBackdropRect:", 0.0, 0.0, v19, height);
    }

    [v95 appendPath:v132];
    [(id)v30[137] setDisableActions:1];
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    [v155 setStrokeStart:v25 / (v171 + v171 + v11 * 2.0 + -8.58407346 + v25)];

    id v156 = v95;
    id v157 = [v156 CGPath];
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController maskLayer](self, "maskLayer"));
    [v158 setPath:v157];

    -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
    if (v159 > 0.0)
    {
      -[ZWZoomDockedLensViewController dockSize](self, "dockSize");
      double v161 = v160;
      v162 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      [v162 setDockSize:v161];
    }

    [(id)v30[137] commit];
  }
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedBorderView]);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 56) * 0.5;
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toggleZoomRegionButton]);
  objc_msgSend(v8, "setCenter:", v7, v6);
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedBorderView]);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64) * 0.5;
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toggleZoomRegionButton]);
  objc_msgSend(v8, "setCenter:", v6, v7);
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_3(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedBorderView]);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 56) - *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72) * 0.5;
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toggleZoomRegionButton]);
  objc_msgSend(v8, "setCenter:", v6, v7);
}

void __54__ZWZoomDockedLensViewController_resizeDock_animated___block_invoke_4(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 layoutIfNeeded];

  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedBorderView]);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v3, v4);

  double v6 = *(double *)(a1 + 56) * 0.5;
  double v7 = *(double *)(a1 + 64) - *(double *)(a1 + 72);
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toggleZoomRegionButton]);
  objc_msgSend(v8, "setCenter:", v6, v7);
}

- (double)_maxDockWidth
{
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v3 bounds];
    double v5 = v6 * 0.5;
  }

  else
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v3 bounds];
    double v5 = v4;
  }

  return v5;
}

- (double)_maxDockHeight
{
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v3 bounds];
    double v5 = v6;
  }

  else
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v3 bounds];
    double v5 = v4 * 0.5;
  }

  return v5;
}

- (id)stringForCurrentDockPosition
{
  unint64_t v2 = -[ZWZoomDockedLensViewController dockPosition](self, "dockPosition");
  if (v2 <= 3) {
    id v3 = *(id *)*(&off_6CF48 + v2);
  }
  return v3;
}

- (void)_toggleVisibilityButtonWasLongPressed
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedDelegate](self, "dockedDelegate"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  [v4 dockedLensViewController:self toggleButtonDidReceiveLongPress:v3];
}

- (BOOL)_shouldDisableLensEffectsForStandbyMode
{
  return 1;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  [v10 sampledContentSizeWithZoomFactor:a3];
  double v12 = v11;
  double v14 = v13;

  double v15 = (v7 - v12) * 0.5;
  double v16 = (v9 - v14) * 0.5;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)deltaForDockedZoomMovementToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  switch(-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
  {
    case 0LL:
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double y = y + v8;
      break;
    case 1LL:
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double x = x + v9;
      break;
    case 2LL:
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v10 bounds];
      double v12 = v11;
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double x = x - (v12 - v13);
      goto LABEL_6;
    case 3LL:
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
      [v10 bounds];
      double v15 = v14;
      -[ZWZoomDockedLensViewController screenShift](self, "screenShift");
      double y = y - (v15 - v16);
LABEL_6:

      break;
    default:
      break;
  }

  double Center = AX_CGRectGetCenter(x, y, width, height);
  double v19 = v18;
  -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
  double v24 = Center - AX_CGRectGetCenter(v20, v21, v22, v23);
  double v26 = v19 - v25;
  if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition")
    && (char *)-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition") != (char *)&dword_0 + 3)
  {
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v36 = v35;
    double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v37 bounds];
    double v39 = v38;

    double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
    [v40 bounds];
    double v42 = v41;

    double v24 = v24 / (v42 / (v39 - v42 - v36) + 1.0);
  }

  else
  {
    -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
    double v28 = v27;
    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
    [v29 bounds];
    double v31 = v30;

    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
    [v32 bounds];
    double v34 = v33;

    double v26 = v26 / (v34 / (v31 - v34 - v28) + 1.0);
  }

  double v43 = v24;
  double v44 = v26;
  result.double y = v44;
  result.double x = v43;
  return result;
}

- (void)handleAdditionalPanOffsetFromOriginalOffset:(CGPoint)a3 validOffset:(CGPoint)a4 useFullDelta:(BOOL)a5
{
}

- (void)zoomMovementDidEnd
{
  self->_lastPanPoint = CGPointZero;
}

- (CGPoint)_lensDragMultiplier
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGRect)frameForResizeDrag
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = ZWZoomLensBorderThicknessForTouches();
  switch(-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
  {
    case 0LL:
      v19.origin.double x = v5;
      v19.origin.double y = v7;
      v19.size.double width = v9;
      v19.size.double height = v11;
      double MaxY = CGRectGetMaxY(v19);
      goto LABEL_7;
    case 1LL:
      v20.origin.double x = v5;
      v20.origin.double y = v7;
      v20.size.double width = v9;
      v20.size.double height = v11;
      double MaxX = CGRectGetMaxX(v20);
      goto LABEL_5;
    case 2LL:
      v21.origin.double x = v5;
      v21.origin.double y = v7;
      v21.size.double width = v9;
      v21.size.double height = v11;
      double MaxX = CGRectGetMinX(v21);
LABEL_5:
      double v5 = MaxX - v12;
      double v9 = v12 + v12;
      break;
    case 3LL:
      v22.origin.double x = v5;
      v22.origin.double y = v7;
      v22.size.double width = v9;
      v22.size.double height = v11;
      double MaxY = CGRectGetMinY(v22);
LABEL_7:
      double v7 = MaxY - v12;
      double v11 = v12 + v12;
      break;
    default:
      break;
  }

  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  objc_msgSend(v11, "convertPoint:toView:", v12, v8, v10);
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
    [v17 frame];
    v22.double x = v8;
    v22.double y = v10;
    if (CGRectContainsPoint(v25, v22))
    {
    }

    else
    {
      -[ZWZoomDockedLensViewController frameForResizeDrag](self, "frameForResizeDrag");
      v23.double x = v8;
      v23.double y = v10;
      BOOL v18 = CGRectContainsPoint(v26, v23);

      if (v18)
      {
        CGRect v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedDelegate](self, "dockedDelegate"));
        [v19 handleWasDraggedWithDockedLensViewController:self];

        v21.receiver = self;
        v21.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
        -[ZWZoomLensViewController scrollViewWillBeginDragging:](&v21, "scrollViewWillBeginDragging:", v4);
        goto LABEL_10;
      }
    }
  }

  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    if (-[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible"))
    {
      -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
      v24.double x = v14;
      v24.double y = v16;
      if (CGRectContainsPoint(v27, v24))
      {
        v20.receiver = self;
        v20.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
        -[ZWZoomLensViewController scrollViewWillBeginDragging:](&v20, "scrollViewWillBeginDragging:", v4);
        self->_lastScrollPoint.double x = v8;
        self->_lastScrollPoint.double y = v10;
      }
    }
  }

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v5 locationInView:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  if (-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode")
    || !-[ZWZoomDockedLensViewController isInDockResizingMode](self, "isInDockResizingMode"))
  {
    if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
    {
      if (-[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible"))
      {
        -[ZWZoomDockedLensViewController zoomRegionFrame](self, "zoomRegionFrame");
        v24.double x = v8;
        v24.double y = v10;
        if (CGRectContainsPoint(v25, v24))
        {
          v22.receiver = self;
          v22.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
          -[ZWZoomLensViewController scrollViewDidScroll:](&v22, "scrollViewDidScroll:", v4);
          double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
          double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
          [v11 locationInView:v12];
          double v14 = v13;
          double v16 = v15;

          double x = self->_lastScrollPoint.x;
          double y = self->_lastScrollPoint.y;
          +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
          +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
          if (-[ZWZoomDockedLensViewController _zoomRegionOnDockReplicatorEdge]( self,  "_zoomRegionOnDockReplicatorEdge"))
          {
            double v19 = v16 - y;
            if (-[ZWZoomDockedLensViewController dockPosition](self, "dockPosition"))
            {
              double v20 = v14 - x;
            }

            -[ZWZoomDockedLensViewController dockShift](self, "dockShift");
            -[ZWZoomDockedLensViewController shiftDock:](self, "shiftDock:", v19 + v21);
          }

          +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
          self->_lastScrollPoint.double x = v14;
          self->_lastScrollPoint.double y = v16;
        }
      }
    }
  }

  else
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
    -[ZWZoomLensViewController scrollViewDidScroll:](&v23, "scrollViewDidScroll:", v4);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode")
    && (-[ZWZoomDockedLensViewController isInDockResizingMode](self, "isInDockResizingMode")
     || -[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible")))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
    -[ZWZoomLensViewController scrollViewDidEndDragging:willDecelerate:]( &v8,  "scrollViewDidEndDragging:willDecelerate:",  v6,  v4);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedDelegate](self, "dockedDelegate"));
    [v7 doneResizingDockWithDockedLensViewController:self];

    -[ZWZoomDockedLensViewController zoomMovementDidEnd](self, "zoomMovementDidEnd");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode")
    && (-[ZWZoomDockedLensViewController zoomRegionVisible](self, "zoomRegionVisible")
     || -[ZWZoomDockedLensViewController isInDockResizingMode](self, "isInDockResizingMode")))
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
    -[ZWZoomLensViewController scrollViewDidEndDecelerating:](&v5, "scrollViewDidEndDecelerating:", v4);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController view](self, "view"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedLensView](self, "dockedLensView"));
  objc_msgSend(v13, "convertPoint:toView:", v14, v10, v12);
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  -[ZWZoomDockedLensViewController frameForResizeDrag](self, "frameForResizeDrag");
  v24.double x = v16;
  v24.double y = v18;
  if (CGRectContainsPoint(v25, v24))
  {
    char v19 = 0;
  }

  else
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___UIButton);
    char isKindOfClass = objc_opt_isKindOfClass(v20, v21);

    char v19 = isKindOfClass ^ 1;
  }

  return v19 & 1;
}

- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  objc_msgSend(v7, "convertPoint:toView:", v9, x, y);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitTest:withEvent:", 0));

  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController toggleZoomRegionButton](self, "toggleZoomRegionButton"));
  }

  else
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
    objc_msgSend(v7, "convertPoint:toView:", v13, x, y);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hitTest:withEvent:", 0));

    if (v14)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[ZWZoomDockedLensViewController dockedBorderView](self, "dockedBorderView"));
    }

    else
    {
      v18.receiver = self;
      v18.super_class = (Class)&OBJC_CLASS___ZWZoomDockedLensViewController;
      id v15 = -[ZWZoomLensViewController zoomRootview:viewForHitTestAtPoint:]( &v18,  "zoomRootview:viewForHitTestAtPoint:",  v7,  x,  y);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v15);
    }
  }

  CGFloat v16 = (void *)v11;

  return v16;
}

- (ZWZoomDockedLensViewControllerDelegate)dockedDelegate
{
  return (ZWZoomDockedLensViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_dockedDelegate);
}

- (void)setDockedDelegate:(id)a3
{
}

- (UIView)dockedLensView
{
  return self->_dockedLensView;
}

- (void)setDockedLensView:(id)a3
{
}

- (ZWShowHideZoomRegionButton)toggleZoomRegionButton
{
  return self->_toggleZoomRegionButton;
}

- (void)setToggleZoomRegionButton:(id)a3
{
}

- (UIView)screenReplicatorView
{
  return self->_screenReplicatorView;
}

- (void)setScreenReplicatorView:(id)a3
{
}

- (CAReplicatorLayer)screenReplicatorLayer
{
  return self->_screenReplicatorLayer;
}

- (void)setScreenReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)screenBackdropLayer
{
  return self->_screenBackdropLayer;
}

- (void)setScreenBackdropLayer:(id)a3
{
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (CGRect)zoomRegionFrame
{
  double x = self->_zoomRegionFrame.origin.x;
  double y = self->_zoomRegionFrame.origin.y;
  double width = self->_zoomRegionFrame.size.width;
  double height = self->_zoomRegionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomRegionFrame:(CGRect)a3
{
  self->_zoomRegionFrame = a3;
}

- (double)screenShift
{
  return self->_screenShift;
}

- (void)setScreenShift:(double)a3
{
  self->_screenShift = a3;
}

- (BOOL)isInDockResizingMode
{
  return self->_inDockResizingMode;
}

- (BOOL)zoomRegionVisible
{
  return self->_zoomRegionVisible;
}

- (void)setZoomRegionVisible:(BOOL)a3
{
  self->_zoomRegionVisible = a3;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (void)setDockPosition:(int64_t)a3
{
  self->_dockPosition = a3;
}

- (BOOL)dockPositionIsTransitioning
{
  return self->_dockPositionIsTransitioning;
}

- (void)setDockPositionIsTransitioning:(BOOL)a3
{
  self->_dockPositionIsTransitioning = a3;
}

- (UIView)dockReplicatorView
{
  return self->_dockReplicatorView;
}

- (void)setDockReplicatorView:(id)a3
{
}

- (CAReplicatorLayer)dockReplicatorLayer
{
  return self->_dockReplicatorLayer;
}

- (void)setDockReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)dockBackdropLayer
{
  return self->_dockBackdropLayer;
}

- (void)setDockBackdropLayer:(id)a3
{
}

- (CAShapeLayer)touchStealLayer
{
  return self->_touchStealLayer;
}

- (void)setTouchStealLayer:(id)a3
{
}

- (double)dockShift
{
  return self->_dockShift;
}

- (void)setDockShift:(double)a3
{
  self->_dockShift = a3;
}

- (ZWDockedLensChromeBorderView)dockedBorderView
{
  return self->_dockedBorderView;
}

- (void)setDockedBorderView:(id)a3
{
}

- (double)dockSize
{
  return self->_dockSize;
}

- (void)setDockSize:(double)a3
{
  self->_dockSize = a3;
}

- (NSLayoutConstraint)dockedViewTopConstraint
{
  return self->_dockedViewTopConstraint;
}

- (void)setDockedViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockedViewBottomConstraint
{
  return self->_dockedViewBottomConstraint;
}

- (void)setDockedViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockedViewLeftConstraint
{
  return self->_dockedViewLeftConstraint;
}

- (void)setDockedViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockedViewRightConstraint
{
  return self->_dockedViewRightConstraint;
}

- (void)setDockedViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewTopConstraint
{
  return self->_zoomViewTopConstraint;
}

- (void)setZoomViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewBottomConstraint
{
  return self->_zoomViewBottomConstraint;
}

- (void)setZoomViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewLeftConstraint
{
  return self->_zoomViewLeftConstraint;
}

- (void)setZoomViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)zoomViewRightConstraint
{
  return self->_zoomViewRightConstraint;
}

- (void)setZoomViewRightConstraint:(id)a3
{
}

- (BOOL)transitioningForStandby
{
  return self->_transitioningForStandby;
}

- (void)setTransitioningForStandby:(BOOL)a3
{
  self->_transitioningForStandbdouble y = a3;
}

- (void).cxx_destruct
{
}

@end