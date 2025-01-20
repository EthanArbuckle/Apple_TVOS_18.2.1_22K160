@interface PBPIPSwapAnimator
- (BSInvalidatable)animationTransaction;
- (PBPIPContainerViewControllerLayout)goingFullScreenLayout;
- (PBPIPContainerViewControllerLayout)goingToPIPLayout;
- (PBPIPSwapAnimator)initWithContainingView:(id)a3 goingFullScreenLayout:(id)a4 goingToPIPLayout:(id)a5 quadrant:(int64_t)a6 currentPIPInsets:(UIEdgeInsets)a7;
- (UIEdgeInsets)currentPIPInsets;
- (UIView)containingView;
- (id)_createAnimationTransaction;
- (int64_t)quadrant;
- (void)animateWithCompletion:(id)a3;
@end

@implementation PBPIPSwapAnimator

- (PBPIPSwapAnimator)initWithContainingView:(id)a3 goingFullScreenLayout:(id)a4 goingToPIPLayout:(id)a5 quadrant:(int64_t)a6 currentPIPInsets:(UIEdgeInsets)a7
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBPIPSwapAnimator;
  v19 = -[PBPIPSwapAnimator init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_containingView, a3);
    objc_storeStrong((id *)&v20->_goingFullScreenLayout, a4);
    objc_storeStrong((id *)&v20->_goingToPIPLayout, a5);
    v20->_quadrant = a6;
    v20->_currentPIPInsets.CGFloat top = top;
    v20->_currentPIPInsets.CGFloat left = left;
    v20->_currentPIPInsets.CGFloat bottom = bottom;
    v20->_currentPIPInsets.CGFloat right = right;
  }

  return v20;
}

- (void)animateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_animationTransaction)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimator _createAnimationTransaction](self, "_createAnimationTransaction"));
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000EA24;
    v6[3] = &unk_1003D0490;
    id v7 = v4;
    objc_copyWeak(&v8, &location);
    [v5 registerBlockObserver:v6];
    objc_storeStrong((id *)&self->_animationTransaction, v5);
    [v5 begin];
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
}

- (id)_createAnimationTransaction
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  id v4 = off_1003CDA50;
  if (!IsReduceMotionEnabled) {
    id v4 = off_1003CDA48;
  }
  return  objc_msgSend( objc_alloc((Class)objc_opt_class(*v4)),  "initWithContainingView:destinationFullscreenLayout:destinationPIPLayout:quadrant:currentPIPInsets:",  self->_containingView,  self->_goingFullScreenLayout,  self->_goingToPIPLayout,  self->_quadrant,  self->_currentPIPInsets.top,  self->_currentPIPInsets.left,  self->_currentPIPInsets.bottom,  self->_currentPIPInsets.right);
}

- (UIView)containingView
{
  return self->_containingView;
}

- (PBPIPContainerViewControllerLayout)goingFullScreenLayout
{
  return self->_goingFullScreenLayout;
}

- (PBPIPContainerViewControllerLayout)goingToPIPLayout
{
  return self->_goingToPIPLayout;
}

- (int64_t)quadrant
{
  return self->_quadrant;
}

- (UIEdgeInsets)currentPIPInsets
{
  double top = self->_currentPIPInsets.top;
  double left = self->_currentPIPInsets.left;
  double bottom = self->_currentPIPInsets.bottom;
  double right = self->_currentPIPInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BSInvalidatable)animationTransaction
{
  return self->_animationTransaction;
}

- (void).cxx_destruct
{
}

@end