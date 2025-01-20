@interface ZWZoomLensViewController
- (BOOL)_minimumZoomIndistinguishableFromStandbyMode;
- (BOOL)_shouldDisableLensEffectsForStandbyMode;
- (BOOL)_shouldRoundLensCorners;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)inStandbyMode;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldPanZoomContentForAxis:(int64_t)a3 delta:(CGPoint)a4 edgeMask:(unint64_t)a5;
- (BOOL)userIsInteractingWithLens;
- (BOOL)userIsMovingLens;
- (CGPoint)_lensDragMultiplier;
- (CGPoint)dummyScrollViewDefaultOffset;
- (CGPoint)dummyScrollViewOffsetForSlug;
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (CGPoint)offsetByPanningToPoint:(CGPoint)a3 zoomFactor:(double)a4;
- (CGPoint)offsetByPanningToRect:(CGRect)a3 zoomFactor:(double)a4;
- (CGPoint)offsetByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFactor:(double)a5;
- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningToRect:(CGRect)a3 zoomFacotr:(double)a4;
- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFacotr:(double)a5;
- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4;
- (CGPoint)zoomPanOffset;
- (CGSize)dummyScrollViewContentSize;
- (NSString)identifier;
- (NSString)lensEffect;
- (NSString)screenshotActionHandlerIdentifier;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIScreen)screen;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (ZWCancelButtonTouchesScrollView)dummyScrollView;
- (ZWLensZoomView)lensZoomView;
- (ZWZoomLensViewController)initWithZoomFactor:(double)a3 zoomPanOffset:(CGPoint)a4 lensEffect:(id)a5 screen:(id)a6;
- (ZWZoomLensViewControllerDelegate)delegate;
- (double)zoomFactor;
- (id)dummyScrollViewPanGestureRecognizer;
- (id)standbyFinishedTransitioningUnitTestCallback;
- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4;
- (void)_handleLongPress:(id)a3;
- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)handleFluidSwitcherGestureWillBegin;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDummyScrollView:(id)a3;
- (void)setInStandbyMode:(BOOL)a3;
- (void)setLensEffect:(id)a3;
- (void)setLensZoomView:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setScreen:(id)a3;
- (void)setScreenshotActionHandlerIdentifier:(id)a3;
- (void)setStandbyFinishedTransitioningUnitTestCallback:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUserIsInteractingWithLens:(BOOL)a3;
- (void)setUserIsMovingLens:(BOOL)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateStandbyMode:(BOOL)a3 zoomFactor:(double)a4 panOffset:(CGPoint)a5 lensEffect:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7;
- (void)viewDidLoad;
@end

@implementation ZWZoomLensViewController

- (ZWZoomLensViewController)initWithZoomFactor:(double)a3 zoomPanOffset:(CGPoint)a4 lensEffect:(id)a5 screen:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ZWZoomLensViewController;
  v13 = -[ZWZoomLensViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0LL, 0LL);
  v14 = v13;
  if (v13)
  {
    -[ZWZoomLensViewController setZoomFactor:](v13, "setZoomFactor:", a3);
    -[ZWZoomLensViewController setZoomPanOffset:](v14, "setZoomPanOffset:", x, y);
    -[ZWZoomLensViewController setLensEffect:](v14, "setLensEffect:", v11);
    -[ZWZoomLensViewController setScreen:](v14, "setScreen:", v12);
    v14->_inStandbyMode = 1;
  }

  return v14;
}

- (void)loadView
{
  v25 = -[ZWLensRootView initWithDelegate:](objc_alloc(&OBJC_CLASS___ZWLensRootView), "initWithDelegate:", self);
  -[ZWZoomLensViewController setView:](self, "setView:", v25);
  -[ZWLensRootView setAccessibilityContainerType:](v25, "setAccessibilityContainerType:", 4LL);
  id v3 = ZWLocString(@"ZW_LENS_TOUCH_CONTAINER_LABEL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[ZWLensRootView setAccessibilityLabel:](v25, "setAccessibilityLabel:", v4);

  -[ZWLensRootView setTranslatesAutoresizingMaskIntoConstraints:]( v25,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v5 = objc_alloc(&OBJC_CLASS___ZWLensZoomView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[ZWLensZoomView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[ZWZoomLensViewController setLensZoomView:](self, "setLensZoomView:", v9);
  -[ZWLensRootView addSubview:](v25, "addSubview:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoomCurrentLensEffect]);
  -[ZWLensZoomView updateLensEffect:animated:completion:](v9, "updateLensEffect:animated:completion:", v11, 0LL, 0LL);

  -[ZWLensZoomView setTranslatesAutoresizingMaskIntoConstraints:]( v9,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v12 = -[ZWCancelButtonTouchesScrollView initWithFrame:]( objc_alloc(&OBJC_CLASS___ZWCancelButtonTouchesScrollView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[ZWLensRootView addSubview:](v25, "addSubview:", v12);
  -[ZWCancelButtonTouchesScrollView setTranslatesAutoresizingMaskIntoConstraints:]( v12,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[ZWCancelButtonTouchesScrollView setCanCancelContentTouches:](v12, "setCanCancelContentTouches:", 1LL);
  -[ZWCancelButtonTouchesScrollView setContentInsetAdjustmentBehavior:](v12, "setContentInsetAdjustmentBehavior:", 2LL);
  LODWORD(v13) = AXResistAllCompressingAndStretching[0];
  LODWORD(v14) = AXResistAllCompressingAndStretching[1];
  LODWORD(v15) = AXResistAllCompressingAndStretching[2];
  LODWORD(v16) = AXResistAllCompressingAndStretching[3];
  -[ZWCancelButtonTouchesScrollView ax_setContentHuggingAndCompressionResistance:]( v12,  "ax_setContentHuggingAndCompressionResistance:",  v13,  v14,  v15,  v16);
  id v17 =  -[ZWCancelButtonTouchesScrollView ax_pinConstraintsInAllDimensionsToView:]( v12,  "ax_pinConstraintsInAllDimensionsToView:",  v25);
  -[ZWZoomLensViewController setDummyScrollView:](self, "setDummyScrollView:", v12);
  -[ZWCancelButtonTouchesScrollView setDelegate:](v12, "setDelegate:", self);
  -[ZWZoomLensViewController dummyScrollViewContentSize](self, "dummyScrollViewContentSize");
  -[ZWCancelButtonTouchesScrollView setContentSize:](v12, "setContentSize:");
  -[ZWZoomLensViewController dummyScrollViewDefaultOffset](self, "dummyScrollViewDefaultOffset");
  -[ZWCancelButtonTouchesScrollView setContentOffset:](v12, "setContentOffset:");
  -[ZWCancelButtonTouchesScrollView setBounces:](v12, "setBounces:", 0LL);
  -[ZWCancelButtonTouchesScrollView setHidden:](v12, "setHidden:", 1LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWCancelButtonTouchesScrollView panGestureRecognizer](v12, "panGestureRecognizer"));
  -[ZWLensRootView addGestureRecognizer:](v25, "addGestureRecognizer:", v18);

  v19 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handleLongPress:");
  -[ZWZoomLensViewController setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v19);
  -[UILongPressGestureRecognizer setDelegate:](v19, "setDelegate:", self);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v19, "setMinimumPressDuration:", 0.02);
  -[UILongPressGestureRecognizer setAllowableMovement:](v19, "setAllowableMovement:", 10000.0);
  -[ZWLensRootView addGestureRecognizer:](v25, "addGestureRecognizer:", v19);
  v20 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleTap:");
  -[ZWZoomLensViewController setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v20);
  -[ZWLensRootView addGestureRecognizer:](v25, "addGestureRecognizer:", v20);
  -[UITapGestureRecognizer setDelegate:](v20, "setDelegate:", self);
  -[ZWZoomLensViewController zoomFactor](self, "zoomFactor");
  double v22 = v21;
  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset");
  -[ZWZoomLensViewController updateZoomFactor:panOffset:animated:animationDuration:completion:]( self,  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  0LL,  0LL,  v22,  v23,  v24,  -1.0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ZWZoomLensViewController;
  -[ZWZoomLensViewController dealloc](&v2, "dealloc");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ZWZoomLensViewController;
  -[ZWZoomLensViewController viewDidLoad](&v3, "viewDidLoad");
  -[ZWZoomLensViewController _applyInitialLayoutConstraints](self, "_applyInitialLayoutConstraints");
}

- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7
{
  BOOL v8 = a5;
  double y = a4.y;
  double x = a4.x;
  id v17 = a7;
  -[ZWZoomLensViewController setZoomFactor:](self, "setZoomFactor:", a3);
  -[ZWZoomLensViewController setZoomPanOffset:](self, "setZoomPanOffset:", x, y);
  -[ZWZoomLensViewController zoomFactor](self, "zoomFactor");
  if (vabdd_f64(v13, AXZoomMinimumZoomLevel) <= 0.0001
    && -[ZWZoomLensViewController _minimumZoomIndistinguishableFromStandbyMode]( self,  "_minimumZoomIndistinguishableFromStandbyMode"))
  {
    -[ZWZoomLensViewController setInStandbyMode:](self, "setInStandbyMode:", 1LL);
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));

  if (v14)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
    objc_msgSend( v15,  "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:",  -[ZWZoomLensViewController _shouldRoundLensCorners](self, "_shouldRoundLensCorners"),  v8,  v17,  x,  y,  a3,  a6);

LABEL_8:
    double v16 = v17;
    goto LABEL_9;
  }

  double v16 = v17;
  if (v17)
  {
    (*((void (**)(id))v17 + 2))(v17);
    goto LABEL_8;
  }

- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  BOOL v8 = (void (**)(void))a5;
  -[ZWZoomLensViewController setLensEffect:](self, "setLensEffect:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
    [v10 updateLensEffect:v11 animated:v6 completion:v8];
  }

  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)setInStandbyMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL inStandbyMode = self->_inStandbyMode;
  self->_BOOL inStandbyMode = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v6 setZoomInStandby:v3];

  if (inStandbyMode != v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
    [v7 zoomLensViewControllerDidChangeStandbyMode:self];
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController dummyScrollView](self, "dummyScrollView"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController dummyScrollView](self, "dummyScrollView"));
  [v8 contentOffset];
  objc_msgSend(v9, "setContentOffset:animated:", 0);
}

- (void)updateStandbyMode:(BOOL)a3 zoomFactor:(double)a4 panOffset:(CGPoint)a5 lensEffect:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  double y = a5.y;
  double x = a5.x;
  uint64_t v13 = a3;
  id v15 = a6;
  id v16 = a8;
  if (vabdd_f64(a4, AXZoomMinimumZoomLevel) <= 0.0001) {
    uint64_t v13 = -[ZWZoomLensViewController _minimumZoomIndistinguishableFromStandbyMode]( self,  "_minimumZoomIndistinguishableFromStandbyMode") | v13;
  }
  -[ZWZoomLensViewController setInStandbyMode:](self, "setInStandbyMode:", v13);
  -[ZWZoomLensViewController setZoomFactor:](self, "setZoomFactor:", a4);
  -[ZWZoomLensViewController setZoomPanOffset:](self, "setZoomPanOffset:", x, y);
  -[ZWZoomLensViewController setLensEffect:](self, "setLensEffect:", v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ZWZoomLensViewController standbyFinishedTransitioningUnitTestCallback]( self,  "standbyFinishedTransitioningUnitTestCallback"));

  if (!v17)
  {
LABEL_6:
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (v16)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke;
    v38[3] = &unk_6CED8;
    v38[4] = self;
    id v39 = v16;
    id v16 = objc_retainBlock(v38);

    goto LABEL_6;
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue( -[ZWZoomLensViewController standbyFinishedTransitioningUnitTestCallback]( self,  "standbyFinishedTransitioningUnitTestCallback"));
  if (v9)
  {
LABEL_7:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
    [v18 didStartAnimation];
  }

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke( uint64_t a1)
{
  objc_super v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) standbyFinishedTransitioningUnitTestCallback]);
  v2[2]();
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_2( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 didEndAnimation];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_3( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensZoomView]);
  double v3 = AXZoomMinimumZoomLevel;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_4;
  v6[3] = &unk_6CE40;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  char v8 = v4;
  id v7 = v5;
  objc_msgSend( v2,  "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:",  0,  v4,  v6,  CGPointZero.x,  CGPointZero.y,  v3,  -1.0);
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_4( uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_5;
  v3[3] = &unk_6CEB0;
  id v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  [v4 _updateLensChromeVisibility:0 animated:v1 completion:v3];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_5( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 zoomLensViewControllerUpdateUIForStandby:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_6( uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_7;
  v3[3] = &unk_6CEB0;
  id v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  [v4 _updateLensChromeVisibility:0 animated:v1 completion:v3];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_7( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 zoomLensViewControllerUpdateUIForStandby:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_8( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensZoomView]);
  [*(id *)(a1 + 32) zoomPanOffset];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 32) zoomFactor];
  double v8 = v7;
  id v9 = [*(id *)(a1 + 32) _shouldRoundLensCorners];
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_9;
  v12[3] = &unk_6CE40;
  id v11 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  char v14 = v10;
  id v13 = v11;
  objc_msgSend( v2,  "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:",  v9,  v10,  v12,  v4,  v6,  v8,  -1.0);
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_9( uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensZoomView]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensEffect]);
  [v3 updateLensEffect:v2 animated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (CGPoint)_lensDragMultiplier
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)handleFluidSwitcherGestureWillBegin
{
}

- (BOOL)_shouldRoundLensCorners
{
  return 0;
}

- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (BOOL)_shouldDisableLensEffectsForStandbyMode
{
  return 0;
}

- (BOOL)_minimumZoomIndistinguishableFromStandbyMode
{
  return !-[ZWZoomLensViewController _shouldDisableLensEffectsForStandbyMode]( self,  "_shouldDisableLensEffectsForStandbyMode");
}

- (BOOL)shouldPanZoomContentForAxis:(int64_t)a3 delta:(CGPoint)a4 edgeMask:(unint64_t)a5
{
  char v5 = a5;
  double y = a4.y;
  double x = a4.x;
  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset");
  if (a3 == 2)
  {
    if ((v5 & 8) == 0 || (BOOL result = 1, x >= 0.0) && x + v9 > 0.0)
    {
      if ((v5 & 2) != 0)
      {
        BOOL v12 = x > 0.0;
        double v13 = x + v9;
        return v13 >= 0.0 || v12;
      }

      return 0;
    }
  }

  else if ((v5 & 1) == 0 || (BOOL result = 1, y >= 0.0) && y + v10 > 0.0)
  {
    if ((v5 & 4) != 0)
    {
      BOOL v12 = y > 0.0;
      double v13 = y + v10;
      return v13 >= 0.0 || v12;
    }

    return 0;
  }

  return result;
}

- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFacotr:(double)a5
{
  if ((a4 & 2) != 0) {
    double x = a3.x;
  }
  else {
    double x = 0.0;
  }
  if ((a4 & 4) != 0) {
    double y = a3.y;
  }
  else {
    double y = 0.0;
  }
  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset", a3.x, a3.y);
  double v9 = x + v8;
  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset");
  double v11 = y + v10;
  double v12 = v9;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (CGPoint)offsetByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFactor:(double)a5
{
  char v5 = a4;
  -[ZWZoomLensViewController offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:]( self,  "offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:",  a3.x,  a3.y);
  -[ZWZoomLensViewController validPanOffsetForProposedOffset:proposedZoomFactor:]( self,  "validPanOffsetForProposedOffset:proposedZoomFactor:");
  double v8 = v7;
  double v10 = v9;
  -[ZWZoomLensViewController zoomPanOffset](self, "zoomPanOffset");
  if ((v5 & 2) != 0) {
    double v11 = v8;
  }
  if ((v5 & 4) != 0) {
    double v12 = v10;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)offsetByPanningToPoint:(CGPoint)a3 zoomFactor:(double)a4
{
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningToRect:(CGRect)a3 zoomFacotr:(double)a4
{
  double Center = AX_CGRectGetCenter(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
  [v8 frame];
  double v13 = AX_CGRectGetCenter(v9, v10, v11, v12);
  double v15 = v14;

  double v16 = Center - v13;
  double v17 = v7 - v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)offsetByPanningToRect:(CGRect)a3 zoomFactor:(double)a4
{
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  -[ZWZoomLensViewController maximumPanOffsetWithZoomFactor:](self, "maximumPanOffsetWithZoomFactor:", a4);
  double v8 = -v6;
  if (x >= -v6) {
    double v8 = x;
  }
  if (x <= v6) {
    double v6 = v8;
  }
  double v9 = -v7;
  if (y >= -v7) {
    double v9 = y;
  }
  if (y <= v7) {
    double v7 = v9;
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (id)dummyScrollViewPanGestureRecognizer
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController dummyScrollView](self, "dummyScrollView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 panGestureRecognizer]);

  return v3;
}

- (CGSize)dummyScrollViewContentSize
{
  double v2 = 10000.0;
  double v3 = 10000.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGPoint)dummyScrollViewDefaultOffset
{
  double v2 = 5000.0;
  double v3 = 5000.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)dummyScrollViewOffsetForSlug
{
  double v4 = v3;
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController dummyScrollView](self, "dummyScrollView"));
  [v7 contentOffset];
  double v9 = v8;
  double v11 = v10;

  double v12 = v4 - v9;
  double v13 = v6 - v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)_handleLongPress:(id)a3
{
  double v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    double v5 = self;
    uint64_t v6 = 0LL;
LABEL_9:
    -[ZWZoomLensViewController setUserIsInteractingWithLens:](v5, "setUserIsInteractingWithLens:", v6);
    return;
  }

  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if (v7 - self->_lastTapTime <= 1.0) {
      unint64_t v8 = (unint64_t)(double)(self->_prescrollTaps + 1);
    }
    else {
      unint64_t v8 = 0LL;
    }
    self->_prescrollTaps = v8;
    self->_lastTapTime = v7;
    double v5 = self;
    uint64_t v6 = 1LL;
    goto LABEL_9;
  }

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v6 = a3;
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode"))
  {
    -[ZWZoomLensViewController setUserIsMovingLens:](self, "setUserIsMovingLens:", 1LL);
    self->_lastDragOffset = CGPointZero;
    self->_shouldNotifyDelegateOfDrag = 0;
    -[ZWZoomLensViewController dummyScrollViewDefaultOffset](self, "dummyScrollViewDefaultOffset");
    objc_msgSend(v6, "setContentOffset:");
    self->_shouldNotifyDelegateOfDrag = 1;
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
    [v4 zoomLensViewController:self willBeginMovingLens:v5];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode", a3))
  {
    -[ZWZoomLensViewController dummyScrollViewOffsetForSlug](self, "dummyScrollViewOffsetForSlug");
    CGFloat v6 = v4;
    CGFloat v7 = v5;
    if (self->_shouldNotifyDelegateOfDrag)
    {
      double v8 = v4 - self->_lastDragOffset.x;
      double v9 = v5 - self->_lastDragOffset.y;
      -[ZWZoomLensViewController _lensDragMultiplier](self, "_lensDragMultiplier");
      double v11 = v8 * v10;
      double v13 = v9 * v12;
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
      objc_msgSend(v14, "zoomLensViewController:didMoveLens:withDelta:", self, v15, v11, v13);
    }

    self->_lastDragOffset.double x = v6;
    self->_lastDragOffset.double y = v7;
  }

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode", a3) && !a4)
  {
    -[ZWZoomLensViewController setUserIsMovingLens:](self, "setUserIsMovingLens:", 0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
    CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
    [v7 zoomLensViewController:self didFinishMovingLens:v6];
  }

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (!-[ZWZoomLensViewController inStandbyMode](self, "inStandbyMode", a3))
  {
    -[ZWZoomLensViewController setUserIsMovingLens:](self, "setUserIsMovingLens:", 0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController delegate](self, "delegate"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController view](self, "view"));
    [v5 zoomLensViewController:self didFinishMovingLens:v4];
  }

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController longPressGestureRecognizer](self, "longPressGestureRecognizer"));

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController dummyScrollView](self, "dummyScrollView"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 panGestureRecognizer]);
  id v11 = v10;
  if (v8 == v6)
  {
    if (v10 != v7)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController tapGestureRecognizer](self, "tapGestureRecognizer"));
LABEL_11:
      char v13 = v14 == v7;

      goto LABEL_13;
    }

- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4
{
  return 0LL;
}

- (ZWZoomLensViewControllerDelegate)delegate
{
  return (ZWZoomLensViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (CGPoint)zoomPanOffset
{
  double x = self->_zoomPanOffset.x;
  double y = self->_zoomPanOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  self->_zoomPanOffset = a3;
}

- (NSString)lensEffect
{
  return self->_lensEffect;
}

- (void)setLensEffect:(id)a3
{
}

- (BOOL)userIsInteractingWithLens
{
  return self->_userIsInteractingWithLens;
}

- (void)setUserIsInteractingWithLens:(BOOL)a3
{
  self->_userIsInteractingWithLens = a3;
}

- (BOOL)userIsMovingLens
{
  return self->_userIsMovingLens;
}

- (void)setUserIsMovingLens:(BOOL)a3
{
  self->_userIsMovingLens = a3;
}

- (ZWLensZoomView)lensZoomView
{
  return self->_lensZoomView;
}

- (void)setLensZoomView:(id)a3
{
}

- (BOOL)inStandbyMode
{
  return self->_inStandbyMode;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (void)setScreen:(id)a3
{
}

- (ZWCancelButtonTouchesScrollView)dummyScrollView
{
  return self->_dummyScrollView;
}

- (void)setDummyScrollView:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSString)screenshotActionHandlerIdentifier
{
  return self->_screenshotActionHandlerIdentifier;
}

- (void)setScreenshotActionHandlerIdentifier:(id)a3
{
}

- (id)standbyFinishedTransitioningUnitTestCallback
{
  return self->_standbyFinishedTransitioningUnitTestCallback;
}

- (void)setStandbyFinishedTransitioningUnitTestCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  uint64_t v2 = OUTLINED_FUNCTION_1((uint64_t)self);
  OUTLINED_FUNCTION_0(v2);
  return 0LL;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_1((uint64_t)self);
  OUTLINED_FUNCTION_0(v3);
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end