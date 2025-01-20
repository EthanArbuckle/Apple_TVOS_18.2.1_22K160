@interface _PBPIPSwapAnimation
- (BOOL)isSwappingBetweenApps;
- (PBPIPContainerViewControllerLayout)goingFullScreenLayout;
- (PBPIPContainerViewControllerLayout)goingToPIPLayout;
- (PBPIPSwapAnimator)swapAnimator;
- (_PBPIPSwapAnimation)initWithGoingToPIPLayout:(id)a3 goingFullScreenLayout:(id)a4 quadrant:(int64_t)a5 currentPIPInsets:(UIEdgeInsets)a6;
- (int64_t)quadrant;
- (void)animateAndHoldWithCompletion:(id)a3;
- (void)cleanup;
- (void)dealloc;
@end

@implementation _PBPIPSwapAnimation

- (_PBPIPSwapAnimation)initWithGoingToPIPLayout:(id)a3 goingFullScreenLayout:(id)a4 quadrant:(int64_t)a5 currentPIPInsets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  id v14 = a3;
  id v15 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____PBPIPSwapAnimation;
  v16 = -[_PBPIPSwapAnimation init](&v24, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_goingToPIPLayout, a3);
    objc_storeStrong((id *)&v17->_goingFullScreenLayout, a4);
    v17->_quadrant = a5;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 containerViewController]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 parentViewController]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);

    v21 = -[PBPIPSwapAnimator initWithContainingView:goingFullScreenLayout:goingToPIPLayout:quadrant:currentPIPInsets:]( objc_alloc(&OBJC_CLASS___PBPIPSwapAnimator),  "initWithContainingView:goingFullScreenLayout:goingToPIPLayout:quadrant:currentPIPInsets:",  v20,  v15,  v14,  a5,  top,  left,  bottom,  right);
    swapAnimator = v17->_swapAnimator;
    v17->_swapAnimator = v21;
  }

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PBPIPSwapAnimation;
  -[_PBPIPSwapAnimation dealloc](&v3, "dealloc");
}

- (BOOL)isSwappingBetweenApps
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout application](self->_goingToPIPLayout, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout application](self->_goingFullScreenLayout, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  char v7 = [v4 isEqual:v6] ^ 1;

  return v7;
}

- (void)animateAndHoldWithCompletion:(id)a3
{
  id v4 = a3;
  self->_animating = 1;
  objc_initWeak(&location, self);
  swapAnimator = self->_swapAnimator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001789AC;
  v7[3] = &unk_1003DA308;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[PBPIPSwapAnimator animateWithCompletion:](swapAnimator, "animateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)cleanup
{
  if (self->_cleanupBlock)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout containerViewController]( self->_goingToPIPLayout,  "containerViewController"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 parentViewController]);
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v3 pictureInPictureViewController]);
      -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize]( self->_goingToPIPLayout,  "preferredPictureInPictureSize");
      objc_msgSend(v5, "updateHostedWindowSize:");
      -[PBPIPContainerViewControllerLayout updateConstraintsForPictureInPictureQuadrant:]( self->_goingToPIPLayout,  "updateConstraintsForPictureInPictureQuadrant:",  self->_quadrant);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
      [v6 layoutIfNeeded];
    }

    char v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout containerViewController]( self->_goingFullScreenLayout,  "containerViewController"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 parentViewController]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 pictureInPictureViewController]);
      -[PBPIPContainerViewControllerLayout preferredFullscreenSize]( self->_goingFullScreenLayout,  "preferredFullscreenSize");
      objc_msgSend(v9, "updateHostedWindowSize:");
      -[PBPIPContainerViewControllerLayout updateConstraintsFillingParentView]( self->_goingFullScreenLayout,  "updateConstraintsFillingParentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
      [v10 layoutIfNeeded];
    }

    (*((void (**)(void))self->_cleanupBlock + 2))();
    id cleanupBlock = self->_cleanupBlock;
    self->_id cleanupBlock = 0LL;

    self->_animating = 0;
  }

- (PBPIPSwapAnimator)swapAnimator
{
  return self->_swapAnimator;
}

- (PBPIPContainerViewControllerLayout)goingToPIPLayout
{
  return self->_goingToPIPLayout;
}

- (PBPIPContainerViewControllerLayout)goingFullScreenLayout
{
  return self->_goingFullScreenLayout;
}

- (int64_t)quadrant
{
  return self->_quadrant;
}

- (void).cxx_destruct
{
}

@end