@interface ZWZoomPIPLensViewController
- (AXAssertion)disableDashBoardSystemGesturesAssertion;
- (BOOL)_shouldDisableLensEffectsForStandbyMode;
- (BOOL)_shouldRoundLensCorners;
- (BOOL)_sufficientSpaceExistsForGrabber:(id)a3;
- (BOOL)isInLensResizingMode;
- (BOOL)offsetZoomWindow;
- (CGPoint)_lensDragMultiplier;
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4;
- (NSLayoutConstraint)bottomChromeGrabberDragConstraint;
- (NSLayoutConstraint)leftChromeGrabberDragConstraint;
- (NSLayoutConstraint)rightChromeGrabberDragConstraint;
- (NSLayoutConstraint)topChromeGrabberDragConstraint;
- (ZWLensChromeGrabberView)activeGrabber;
- (ZWLensChromeGrabberView)bottomChromeGrabberView;
- (ZWLensChromeGrabberView)leftChromeGrabberView;
- (ZWLensChromeGrabberView)rightChromeGrabberView;
- (ZWLensChromeGrabberView)topChromeGrabberView;
- (ZWLensChromeView)lensChromeView;
- (ZWZoomPIPLensViewControllerDelegate)pipDelegate;
- (id)_activeGrabberForTouchAtLocation:(CGPoint)a3;
- (id)_defaultGrabberForAxis:(int64_t)a3;
- (id)_secondaryGrabberForAxis:(int64_t)a3;
- (id)grabberViews;
- (id)identifier;
- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4;
- (int64_t)activeResizeHandle;
- (int64_t)lensEdgeForTouchAtLocation:(CGPoint)a3;
- (void)_applyInitialLayoutConstraints;
- (void)_collapseNonactiveGrabbers;
- (void)_handleLongPress:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_trackActiveGrabberWithTouchAtLocation:(CGPoint)a3;
- (void)_updateActiveGrabberDragConstraintWithOffset:(CGPoint)a3;
- (void)_updateActiveResizeHandleForTouchOnChromeAtLocation:(CGPoint)a3;
- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setActiveGrabber:(id)a3;
- (void)setActiveResizeHandle:(int64_t)a3;
- (void)setBottomChromeGrabberDragConstraint:(id)a3;
- (void)setBottomChromeGrabberView:(id)a3;
- (void)setDisableDashBoardSystemGesturesAssertion:(id)a3;
- (void)setInLensResizingMode:(BOOL)a3;
- (void)setLeftChromeGrabberDragConstraint:(id)a3;
- (void)setLeftChromeGrabberView:(id)a3;
- (void)setLensChromeView:(id)a3;
- (void)setOffsetZoomWindow:(BOOL)a3;
- (void)setPipDelegate:(id)a3;
- (void)setRightChromeGrabberDragConstraint:(id)a3;
- (void)setRightChromeGrabberView:(id)a3;
- (void)setTopChromeGrabberDragConstraint:(id)a3;
- (void)setTopChromeGrabberView:(id)a3;
- (void)updateLensChromeAnimated:(BOOL)a3;
- (void)updateVisibleGrabbersAnimated:(BOOL)a3;
@end

@implementation ZWZoomPIPLensViewController

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
  -[ZWZoomLensViewController loadView](&v11, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
  v4 = -[ZWLensChromeView initWithFrame:]( objc_alloc(&OBJC_CLASS___ZWLensChromeView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[ZWZoomPIPLensViewController setLensChromeView:](self, "setLensChromeView:", v4);
  -[ZWLensChromeView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);
  [v6 setMasksToBounds:0];

  [v3 addSubview:v4];
  v7 = -[ZWLensChromeGrabberView initWithEdge:startExpanded:]( objc_alloc(&OBJC_CLASS___ZWLensChromeGrabberView),  "initWithEdge:startExpanded:",  0LL,  0LL);
  -[ZWLensChromeGrabberView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[ZWZoomPIPLensViewController setTopChromeGrabberView:](self, "setTopChromeGrabberView:", v7);
  [v3 addSubview:v7];
  v8 = -[ZWLensChromeGrabberView initWithEdge:startExpanded:]( objc_alloc(&OBJC_CLASS___ZWLensChromeGrabberView),  "initWithEdge:startExpanded:",  1LL,  0LL);
  -[ZWLensChromeGrabberView setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[ZWZoomPIPLensViewController setRightChromeGrabberView:](self, "setRightChromeGrabberView:", v8);
  [v3 addSubview:v8];
  v9 = -[ZWLensChromeGrabberView initWithEdge:startExpanded:]( objc_alloc(&OBJC_CLASS___ZWLensChromeGrabberView),  "initWithEdge:startExpanded:",  2LL,  0LL);
  -[ZWLensChromeGrabberView setTranslatesAutoresizingMaskIntoConstraints:]( v9,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[ZWZoomPIPLensViewController setBottomChromeGrabberView:](self, "setBottomChromeGrabberView:", v9);
  [v3 addSubview:v9];
  v10 = -[ZWLensChromeGrabberView initWithEdge:startExpanded:]( objc_alloc(&OBJC_CLASS___ZWLensChromeGrabberView),  "initWithEdge:startExpanded:",  3LL,  0LL);
  -[ZWLensChromeGrabberView setTranslatesAutoresizingMaskIntoConstraints:]( v10,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[ZWZoomPIPLensViewController setLeftChromeGrabberView:](self, "setLeftChromeGrabberView:", v10);
  [v3 addSubview:v10];
  -[ZWZoomPIPLensViewController updateVisibleGrabbersAnimated:](self, "updateVisibleGrabbersAnimated:", 0LL);
}

- (void)_applyInitialLayoutConstraints
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
  -[ZWZoomLensViewController _applyInitialLayoutConstraints](&v50, "_applyInitialLayoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  v52 = @"negativePad";
  v7 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", -ZWLensOuterBorderWidth());
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v53 = v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));

  v47 = (void *)v4;
  v10 = _NSDictionaryOfVariableBindings(@"lensChromeView, leftGrabber, rightGrabber", v6, v46, v4, 0LL);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v49 = (void *)v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:|[leftGrabber]-negativePad-[lensChromeView]-negativePad-[rightGrabber]|",  0LL,  v9,  v11));
  [v3 addConstraints:v12];

  v13 = _NSDictionaryOfVariableBindings(@"lensChromeView, topGrabber, bottomGrabber", v6, v45, v5, 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"V:|[topGrabber]-negativePad-[lensChromeView]-negativePad-[bottomGrabber]|",  0LL,  v9,  v14));
  [v3 addConstraints:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v45,  9LL,  0LL,  v6,  9LL,  1.0,  0.0));
  -[ZWZoomPIPLensViewController setTopChromeGrabberDragConstraint:](self, "setTopChromeGrabberDragConstraint:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberDragConstraint](self, "topChromeGrabberDragConstraint"));
  LODWORD(v18) = 1148829696;
  [v17 setPriority:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  10LL,  0LL,  v6,  10LL,  1.0,  0.0));
  -[ZWZoomPIPLensViewController setRightChromeGrabberDragConstraint:](self, "setRightChromeGrabberDragConstraint:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController rightChromeGrabberDragConstraint]( self,  "rightChromeGrabberDragConstraint"));
  LODWORD(v21) = 1148829696;
  [v20 setPriority:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  9LL,  0LL,  v6,  9LL,  1.0,  0.0));
  -[ZWZoomPIPLensViewController setBottomChromeGrabberDragConstraint:]( self,  "setBottomChromeGrabberDragConstraint:",  v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController bottomChromeGrabberDragConstraint]( self,  "bottomChromeGrabberDragConstraint"));
  LODWORD(v24) = 1148829696;
  [v23 setPriority:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v46,  10LL,  0LL,  v6,  10LL,  1.0,  0.0));
  -[ZWZoomPIPLensViewController setLeftChromeGrabberDragConstraint:](self, "setLeftChromeGrabberDragConstraint:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController leftChromeGrabberDragConstraint]( self,  "leftChromeGrabberDragConstraint"));
  LODWORD(v27) = 1148829696;
  [v26 setPriority:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberDragConstraint](self, "topChromeGrabberDragConstraint"));
  v51[0] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController rightChromeGrabberDragConstraint]( self,  "rightChromeGrabberDragConstraint"));
  v51[1] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController bottomChromeGrabberDragConstraint]( self,  "bottomChromeGrabberDragConstraint"));
  v51[2] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController leftChromeGrabberDragConstraint]( self,  "leftChromeGrabberDragConstraint"));
  v51[3] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 4LL));
  [v3 addConstraints:v32];

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v45,  1LL,  1LL,  v6,  1LL,  1.0,  0.0));
  [v3 addConstraint:v33];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v45,  2LL,  -1LL,  v6,  2LL,  1.0,  0.0));
  [v3 addConstraint:v34];

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  1LL,  1LL,  v6,  1LL,  1.0,  0.0));
  [v3 addConstraint:v35];

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  2LL,  -1LL,  v6,  2LL,  1.0,  0.0));
  [v3 addConstraint:v36];

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v46,  3LL,  1LL,  v6,  3LL,  1.0,  0.0));
  [v3 addConstraint:v37];

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v46,  4LL,  -1LL,  v6,  4LL,  1.0,  0.0));
  [v3 addConstraint:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v47,  3LL,  1LL,  v6,  3LL,  1.0,  0.0));
  [v3 addConstraint:v39];

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v47,  4LL,  -1LL,  v6,  4LL,  1.0,  0.0));
  [v3 addConstraint:v40];

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v48,  1LL,  0LL,  v6,  1LL,  1.0,  0.0));
  [v3 addConstraint:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v48,  2LL,  0LL,  v6,  2LL,  1.0,  0.0));
  [v3 addConstraint:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v48,  3LL,  0LL,  v6,  3LL,  1.0,  0.0));
  [v3 addConstraint:v43];

  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v48,  4LL,  0LL,  v6,  4LL,  1.0,  0.0));
  [v3 addConstraint:v44];
}

- (id)identifier
{
  return AXZoomLensModeWindow;
}

- (void)updateLensChromeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
  -[ZWZoomLensViewController updateLensChromeAnimated:](&v5, "updateLensChromeAnimated:");
  -[ZWZoomPIPLensViewController updateVisibleGrabbersAnimated:](self, "updateVisibleGrabbersAnimated:", v3);
}

- (BOOL)_shouldRoundLensCorners
{
  return !-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode");
}

- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  -[ZWZoomPIPLensViewController updateLensChromeAnimated:](self, "updateLensChromeAnimated:", v5);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __79__ZWZoomPIPLensViewController__updateLensChromeVisibility_animated_completion___block_invoke;
  v11[3] = &unk_6CBE8;
  id v12 = v8;
  id v10 = v8;
  [v9 updateChromeVisibility:v6 animated:v5 completion:v11];
}

uint64_t __79__ZWZoomPIPLensViewController__updateLensChromeVisibility_animated_completion___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_shouldDisableLensEffectsForStandbyMode
{
  return 1;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  [v10 sampledContentSizeWithZoomFactor:a3];
  double v12 = v11;
  double v14 = v13;

  double v15 = (v7 - v12) * 0.5;
  double v16 = (v9 - v14) * 0.5;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setInLensResizingMode:(BOOL)a3
{
  if (self->_inLensResizingMode != a3)
  {
    BOOL v3 = a3;
    self->_inLensResizingMode = a3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
    [v5 showLensResizingHandles:v3 animated:1];

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
    [v6 showLensResizingHandlesShowing:v3];

    -[ZWZoomPIPLensViewController updateVisibleGrabbersAnimated:](self, "updateVisibleGrabbersAnimated:", 1LL);
  }

- (void)_updateActiveResizeHandleForTouchOnChromeAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[ZWZoomPIPLensViewController isInLensResizingMode](self, "isInLensResizingMode")) {
    -[ZWZoomPIPLensViewController setActiveResizeHandle:]( self,  "setActiveResizeHandle:",  -[ZWZoomPIPLensViewController lensEdgeForTouchAtLocation:](self, "lensEdgeForTouchAtLocation:", x, y));
  }
}

- (int64_t)lensEdgeForTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = ZWZoomLensBorderThicknessForTouches();
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
  [v13 bounds];
  double v15 = v14;
  CGFloat rect_24 = v16;
  CGFloat v39 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v22 = v15 - v12;
  CGFloat v23 = v17 - v12;
  double v24 = v19;
  CGFloat rect_8 = v19;
  CGFloat v25 = v19 + v12 * 2.0;
  CGFloat v26 = v12 + v12;
  CGFloat v27 = v21 + v12 * 2.0;
  CGFloat rect = v24 + v22;
  v45.origin.double x = v22;
  v45.origin.double y = v23;
  v45.size.width = v25;
  v45.size.height = v26;
  v40.double x = v9;
  v40.double y = v11;
  BOOL v28 = CGRectContainsPoint(v45, v40);
  v46.origin.double x = v22;
  v46.origin.double y = v21 + v23;
  v46.size.width = v25;
  v46.size.height = v26;
  v41.double x = v9;
  v41.double y = v11;
  BOOL v29 = CGRectContainsPoint(v46, v41);
  v47.origin.double x = v22;
  v47.origin.double y = v23;
  v47.size.width = v26;
  v47.size.height = v27;
  v42.double x = v9;
  v42.double y = v11;
  BOOL v30 = CGRectContainsPoint(v47, v42);
  v48.origin.double x = rect;
  v48.origin.double y = v23;
  v48.size.width = v26;
  v48.size.height = v27;
  v43.double x = v9;
  v43.double y = v11;
  BOOL v31 = CGRectContainsPoint(v48, v43);
  v49.origin.double y = rect_24;
  v49.origin.double x = v39;
  v49.size.width = rect_8;
  v49.size.height = v21;
  v44.double x = v9;
  v44.double y = v11;
  LODWORD(result) = CGRectContainsPoint(v49, v44);
  if (v28 && v30) {
    return 2LL;
  }
  if (v28 && v31) {
    return 4LL;
  }
  if (v29 && v30) {
    return 8LL;
  }
  int64_t v33 = 5LL;
  if (v28) {
    int64_t v33 = 3LL;
  }
  int v34 = v29 && v31 || v28 || v31;
  if (v29 && v31) {
    int64_t v33 = 6LL;
  }
  uint64_t v35 = 9LL;
  if (v29) {
    uint64_t v35 = 7LL;
  }
  if (!v34) {
    int64_t v33 = v35;
  }
  if (v34 | (v29 || v30)) {
    return v33;
  }
  else {
    return result;
  }
}

- (void)setOffsetZoomWindow:(BOOL)a3
{
  BOOL v3 = a3;
  self->_offsetZoomWindow = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  [v4 setOffsetZoomWindowFromFinger:v3];
}

- (id)grabberViews
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
  v9[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));
  v9[1] = v4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));
  v9[2] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
  v9[3] = v6;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));

  return v7;
}

- (id)_defaultGrabberForAxis:(int64_t)a3
{
  if (a3 == 2) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));
  }
  else {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
  }
  return v3;
}

- (id)_secondaryGrabberForAxis:(int64_t)a3
{
  if (a3 == 2) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));
  }
  else {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
  }
  return v3;
}

- (BOOL)_sufficientSpaceExistsForGrabber:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  [v3 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v3);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  [v13 bounds];
  v16.origin.double x = v6;
  v16.origin.double y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  LOBYTE(v3) = CGRectContainsRect(v15, v16);

  return (char)v3;
}

- (id)_activeGrabberForTouchAtLocation:(CGPoint)a3
{
  id v4 = (char *)-[ZWZoomPIPLensViewController lensEdgeForTouchAtLocation:]( self,  "lensEdgeForTouchAtLocation:",  a3.x,  a3.y)
     - 1;
  double v5 = 0LL;
  switch((unint64_t)v4)
  {
    case 0uLL:
      return v5;
    case 1uLL:
      CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
      unsigned int v7 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v6);

      if (v7) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 2uLL:
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
      unsigned int v19 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v18);

      if (!v19) {
        goto LABEL_23;
      }
      goto LABEL_13;
    case 3uLL:
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
      unsigned int v21 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v20);

      if (!v21) {
        goto LABEL_15;
      }
LABEL_13:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
      return v5;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
      unsigned int v23 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v22);

      if (v23) {
        goto LABEL_20;
      }
LABEL_15:
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));
      unsigned int v25 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v24);

      if (!v25) {
        goto LABEL_23;
      }
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));
      return v5;
    case 6uLL:
      CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
      unsigned int v27 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v26);

      if (!v27) {
        goto LABEL_23;
      }
      goto LABEL_20;
    case 7uLL:
      BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
      unsigned int v29 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v28);

      if (!v29) {
        goto LABEL_21;
      }
LABEL_20:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
      return v5;
    case 8uLL:
LABEL_21:
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));
      unsigned int v31 = -[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v30);

      if (!v31) {
        goto LABEL_23;
      }
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));
      break;
    default:
      CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
      unsigned __int8 v9 = [v8 ignoreLogging];

      if ((v9 & 1) == 0)
      {
        CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
        uint64_t v11 = AXLoggerForFacility();
        CGFloat v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

        os_log_type_t v13 = AXOSLogLevelFromAXLogLevel(0LL);
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = AXColorizeFormatLog(0LL, @"Could not detect which edge was touched");
          CGRect v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          uint64_t v16 = _AXStringForArgs();
          double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v12, v13))
          {
            int v33 = 138543362;
            int v34 = v17;
            _os_log_impl(&dword_0, v12, v13, "%{public}@", (uint8_t *)&v33, 0xCu);
          }
        }
      }

- (void)_collapseNonactiveGrabbers
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController grabberViews](self, "grabberViews", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      unsigned int v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v7);
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController activeGrabber](self, "activeGrabber"));

        if (v8 != v9) {
          [v8 collapseGrabberAnimated:1];
        }
        unsigned int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }
}

- (void)_updateActiveGrabberDragConstraintWithOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController activeGrabber](self, "activeGrabber"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));

  if (v6 == v7)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController topChromeGrabberDragConstraint]( self,  "topChromeGrabberDragConstraint"));
LABEL_9:
    id v16 = v14;
    double v15 = x;
LABEL_12:
    [v14 setConstant:v15];

    return;
  }

  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController activeGrabber](self, "activeGrabber"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));

  if (v8 == v9)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController rightChromeGrabberDragConstraint]( self,  "rightChromeGrabberDragConstraint"));
LABEL_11:
    id v16 = v14;
    double v15 = y;
    goto LABEL_12;
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController activeGrabber](self, "activeGrabber"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));

  if (v10 == v11)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController bottomChromeGrabberDragConstraint]( self,  "bottomChromeGrabberDragConstraint"));
    goto LABEL_9;
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController activeGrabber](self, "activeGrabber"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));

  if (v12 == v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController leftChromeGrabberDragConstraint]( self,  "leftChromeGrabberDragConstraint"));
    goto LABEL_11;
  }

- (void)_trackActiveGrabberWithTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController activeGrabber](self, "activeGrabber"));
  if (v6)
  {
    id v17 = v6;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
    objc_msgSend(v7, "convertPoint:toView:", v8, x, y);
    double v10 = v9;
    double v12 = v11;

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
    [v13 bounds];
    double MidX = CGRectGetMidX(v18);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
    [v15 bounds];
    double MidY = CGRectGetMidY(v19);

    -[ZWZoomPIPLensViewController _updateActiveGrabberDragConstraintWithOffset:]( self,  "_updateActiveGrabberDragConstraintWithOffset:",  v10 - MidX,  v12 - MidY);
    uint64_t v6 = v17;
  }
}

- (void)updateVisibleGrabbersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode")
    && !-[ZWZoomPIPLensViewController isInLensResizingMode](self, "isInLensResizingMode"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController pipDelegate](self, "pipDelegate"));
    unsigned int v6 = [v5 shouldHideGrabbersWithZoomLensViewController:self];

    if (!v6)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController _defaultGrabberForAxis:](self, "_defaultGrabberForAxis:", 2LL));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController _secondaryGrabberForAxis:](self, "_secondaryGrabberForAxis:", 2LL));
      if (-[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v12))
      {
        [v12 expandGrabberAnimated:v3];
      }

      else
      {
        [v12 collapseGrabberAnimated:v3];
        if (-[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v13))
        {
          [v13 expandGrabberAnimated:v3];
          goto LABEL_17;
        }
      }

      [v13 collapseGrabberAnimated:v3];
LABEL_17:
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController _defaultGrabberForAxis:](self, "_defaultGrabberForAxis:", 4LL));

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController _secondaryGrabberForAxis:](self, "_secondaryGrabberForAxis:", 4LL));
      if (-[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v15))
      {
        [v15 expandGrabberAnimated:v3];
      }

      else
      {
        [v15 collapseGrabberAnimated:v3];
        if (-[ZWZoomPIPLensViewController _sufficientSpaceExistsForGrabber:]( self,  "_sufficientSpaceExistsForGrabber:",  v14))
        {
          [v14 expandGrabberAnimated:v3];
LABEL_22:

          return;
        }
      }

      [v14 collapseGrabberAnimated:v3];
      goto LABEL_22;
    }
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController grabberViews](self, "grabberViews"));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v11) collapseGrabberAnimated:v3];
        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
  -[ZWZoomLensViewController _handleTap:](&v19, "_handleTap:", v4);
  if ([v4 state] == (char *)&dword_0 + 3)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController grabberViews](self, "grabberViews"));
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view", (void)v15));
          double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
          [v4 locationInView:v12];
          objc_msgSend(v11, "convertPoint:toView:", v10);
          unsigned int v13 = objc_msgSend(v10, "pointInside:withEvent:", 0);

          if (v13)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController pipDelegate](self, "pipDelegate"));
            [v14 zoomLensViewController:self grabberDidReceiveTap:v10];

            goto LABEL_12;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)_handleLongPress:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
  id v4 = a3;
  -[ZWZoomLensViewController _handleLongPress:](&v12, "_handleLongPress:", v4);
  id v5 = (char *)objc_msgSend(v4, "state", v12.receiver, v12.super_class);

  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (_BYTE *)&dword_0 + 1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomLensViewController dummyScrollViewPanGestureRecognizer]( self,  "dummyScrollViewPanGestureRecognizer"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
      [v6 locationInView:v7];
      double v9 = v8;
      double v11 = v10;

      -[ZWZoomPIPLensViewController _updateActiveResizeHandleForTouchOnChromeAtLocation:]( self,  "_updateActiveResizeHandleForTouchOnChromeAtLocation:",  v9,  v11);
    }
  }

  else
  {
    -[ZWZoomPIPLensViewController _updateActiveGrabberDragConstraintWithOffset:]( self,  "_updateActiveGrabberDragConstraintWithOffset:",  CGPointZero.x,  CGPointZero.y);
    -[ZWZoomPIPLensViewController setActiveGrabber:](self, "setActiveGrabber:", 0LL);
    -[ZWZoomPIPLensViewController updateVisibleGrabbersAnimated:](self, "updateVisibleGrabbersAnimated:", 1LL);
  }

- (CGPoint)_lensDragMultiplier
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableDashboardSystemGestures,  @"Zoom: PIP window dragging"));
    -[ZWZoomPIPLensViewController setDisableDashBoardSystemGesturesAssertion:]( self,  "setDisableDashBoardSystemGesturesAssertion:",  v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
    [v6 locationInView:v7];
    double v8 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomPIPLensViewController _activeGrabberForTouchAtLocation:]( self,  "_activeGrabberForTouchAtLocation:"));
    -[ZWZoomPIPLensViewController setActiveGrabber:](self, "setActiveGrabber:", v8);

    -[ZWZoomPIPLensViewController _collapseNonactiveGrabbers](self, "_collapseNonactiveGrabbers");
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
    -[ZWZoomLensViewController scrollViewWillBeginDragging:](&v9, "scrollViewWillBeginDragging:", v4);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController view](self, "view"));
    [v5 locationInView:v6];
    -[ZWZoomPIPLensViewController _trackActiveGrabberWithTouchAtLocation:]( self,  "_trackActiveGrabberWithTouchAtLocation:");

    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
    -[ZWZoomLensViewController scrollViewDidScroll:](&v7, "scrollViewDidScroll:", v4);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    -[ZWZoomPIPLensViewController setDisableDashBoardSystemGesturesAssertion:]( self,  "setDisableDashBoardSystemGesturesAssertion:",  0LL);
    if (!v4) {
      -[ZWZoomPIPLensViewController updateVisibleGrabbersAnimated:](self, "updateVisibleGrabbersAnimated:", 1LL);
    }
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
    -[ZWZoomLensViewController scrollViewDidEndDragging:willDecelerate:]( &v7,  "scrollViewDidEndDragging:willDecelerate:",  v6,  v4);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    -[ZWZoomPIPLensViewController updateVisibleGrabbersAnimated:](self, "updateVisibleGrabbersAnimated:", 1LL);
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
    -[ZWZoomLensViewController scrollViewDidEndDecelerating:](&v5, "scrollViewDidEndDecelerating:", v4);
  }
}

- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController lensChromeView](self, "lensChromeView"));
  v30[0] = v8;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController topChromeGrabberView](self, "topChromeGrabberView"));
  v30[1] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController rightChromeGrabberView](self, "rightChromeGrabberView"));
  v30[2] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController bottomChromeGrabberView](self, "bottomChromeGrabberView"));
  v30[3] = v11;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomPIPLensViewController leftChromeGrabberView](self, "leftChromeGrabberView"));
  v30[4] = v12;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 5LL));

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
LABEL_3:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v17) {
        objc_enumerationMutation(v14);
      }
      objc_super v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
      objc_msgSend(v7, "convertPoint:toView:", v19, x, y);
      double v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hitTest:withEvent:", 0));

      if (v20) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v21 = v7;

    if (v21) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
  id v22 = -[ZWZoomLensViewController zoomRootview:viewForHitTestAtPoint:]( &v24,  "zoomRootview:viewForHitTestAtPoint:",  v7,  x,  y);
  id v21 = (id)objc_claimAutoreleasedReturnValue(v22);
LABEL_12:

  return v21;
}

- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if (!-[ZWZoomPIPLensViewController offsetZoomWindow](self, "offsetZoomWindow"))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___ZWZoomPIPLensViewController;
    -[ZWZoomLensViewController validPanOffsetForProposedOffset:proposedZoomFactor:]( &v12,  "validPanOffsetForProposedOffset:proposedZoomFactor:",  x,  y,  a4);
    double x = v8;
    double y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (ZWZoomPIPLensViewControllerDelegate)pipDelegate
{
  return (ZWZoomPIPLensViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_pipDelegate);
}

- (void)setPipDelegate:(id)a3
{
}

- (BOOL)isInLensResizingMode
{
  return self->_inLensResizingMode;
}

- (ZWLensChromeView)lensChromeView
{
  return self->_lensChromeView;
}

- (void)setLensChromeView:(id)a3
{
}

- (int64_t)activeResizeHandle
{
  return self->_activeResizeHandle;
}

- (void)setActiveResizeHandle:(int64_t)a3
{
  self->_activeResizeHandle = a3;
}

- (BOOL)offsetZoomWindow
{
  return self->_offsetZoomWindow;
}

- (ZWLensChromeGrabberView)topChromeGrabberView
{
  return self->_topChromeGrabberView;
}

- (void)setTopChromeGrabberView:(id)a3
{
}

- (ZWLensChromeGrabberView)rightChromeGrabberView
{
  return self->_rightChromeGrabberView;
}

- (void)setRightChromeGrabberView:(id)a3
{
}

- (ZWLensChromeGrabberView)bottomChromeGrabberView
{
  return self->_bottomChromeGrabberView;
}

- (void)setBottomChromeGrabberView:(id)a3
{
}

- (ZWLensChromeGrabberView)leftChromeGrabberView
{
  return self->_leftChromeGrabberView;
}

- (void)setLeftChromeGrabberView:(id)a3
{
}

- (NSLayoutConstraint)topChromeGrabberDragConstraint
{
  return self->_topChromeGrabberDragConstraint;
}

- (void)setTopChromeGrabberDragConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightChromeGrabberDragConstraint
{
  return self->_rightChromeGrabberDragConstraint;
}

- (void)setRightChromeGrabberDragConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomChromeGrabberDragConstraint
{
  return self->_bottomChromeGrabberDragConstraint;
}

- (void)setBottomChromeGrabberDragConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftChromeGrabberDragConstraint
{
  return self->_leftChromeGrabberDragConstraint;
}

- (void)setLeftChromeGrabberDragConstraint:(id)a3
{
}

- (ZWLensChromeGrabberView)activeGrabber
{
  return self->_activeGrabber;
}

- (void)setActiveGrabber:(id)a3
{
}

- (AXAssertion)disableDashBoardSystemGesturesAssertion
{
  return self->_disableDashBoardSystemGesturesAssertion;
}

- (void)setDisableDashBoardSystemGesturesAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end