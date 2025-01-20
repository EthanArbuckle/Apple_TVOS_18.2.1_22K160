@interface PBPIPStartStopAnimator
- (BOOL)isolated;
- (CGRect)destinationFrame;
- (CGSize)targetSize;
- (PBPIPContainerViewControllerLayout)layout;
- (PBPIPStartStopAnimator)initWithContext:(unint64_t)a3 isolated:(BOOL)a4 layout:(id)a5 targetSize:(CGSize)a6 quadrant:(int64_t)a7 pipInsets:(UIEdgeInsets)a8;
- (id)completionHandler;
- (unint64_t)context;
- (void)_performDefaultAnimation;
- (void)_performIsolatedAnimation;
- (void)_performReducedMotionAnimation;
- (void)setCompletionHandler:(id)a3;
- (void)startAnimation;
@end

@implementation PBPIPStartStopAnimator

- (PBPIPStartStopAnimator)initWithContext:(unint64_t)a3 isolated:(BOOL)a4 layout:(id)a5 targetSize:(CGSize)a6 quadrant:(int64_t)a7 pipInsets:(UIEdgeInsets)a8
{
  double right = a8.right;
  double bottom = a8.bottom;
  double left = a8.left;
  double top = a8.top;
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v19 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBPIPStartStopAnimator;
  v20 = -[PBPIPStartStopAnimator init](&v27, "init");
  v21 = v20;
  if (v20)
  {
    v20->_context = a3;
    v20->_isolated = a4;
    objc_storeStrong((id *)&v20->_layout, a5);
    v21->_targetSize.CGFloat width = width;
    v21->_targetSize.CGFloat height = height;
    if (a3 == 1)
    {
      [v19 preferredIntrinsicFrame];
      goto LABEL_6;
    }

    if (!a3)
    {
      objc_msgSend(v19, "preferredPictureInPictureFrameForQuadrant:pipInsets:", a7, top, left, bottom, right);
LABEL_6:
      v21->_destinationFrame.origin.x = v22;
      v21->_destinationFrame.origin.y = v23;
      v21->_destinationFrame.size.CGFloat width = v24;
      v21->_destinationFrame.size.CGFloat height = v25;
    }
  }

  return v21;
}

- (void)startAnimation
{
  if (self->_isolated)
  {
    -[PBPIPStartStopAnimator _performIsolatedAnimation](self, "_performIsolatedAnimation");
  }

  else if (UIAccessibilityIsReduceMotionEnabled())
  {
    -[PBPIPStartStopAnimator _performReducedMotionAnimation](self, "_performReducedMotionAnimation");
  }

  else
  {
    -[PBPIPStartStopAnimator _performDefaultAnimation](self, "_performDefaultAnimation");
  }

- (void)_performIsolatedAnimation
{
  if (self->_context)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_context == PBPIPAnimationContextStart"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288B3C(a2, (uint64_t)self, (uint64_t)v8);
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout containerViewController]( self->_layout,  "containerViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pictureInPictureViewController]);
    objc_msgSend(v4, "updateHostedWindowSize:", self->_targetSize.width, self->_targetSize.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
    [v5 setAlpha:0.0];
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100173660;
    v10[3] = &unk_1003CFF08;
    id v11 = v5;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10017367C;
    v9[3] = &unk_1003CFEE0;
    id v6 = v5;
    +[PGPictureInPictureViewController animateViewWithAnimationType:initialSpringVelocity:animations:completion:]( &OBJC_CLASS___PGPictureInPictureViewController,  "animateViewWithAnimationType:initialSpringVelocity:animations:completion:",  0LL,  v10,  v9,  0.0);
  }

- (void)_performDefaultAnimation
{
  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100173724;
  v3[3] = &unk_1003CFF08;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001737C0;
  v2[3] = &unk_1003CFEE0;
  +[PGPictureInPictureViewController animateViewWithAnimationType:initialSpringVelocity:animations:completion:]( &OBJC_CLASS___PGPictureInPictureViewController,  "animateViewWithAnimationType:initialSpringVelocity:animations:completion:",  0LL,  v3,  v2,  0.0);
}

- (void)_performReducedMotionAnimation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout containerViewController](self->_layout, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 parentViewController]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout containerViewController](self->_layout, "containerViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);

  -[PBPIPContainerViewControllerLayout preferredIntrinsicSize](self->_layout, "preferredIntrinsicSize");
  double v9 = v8;
  double v11 = v10;
  -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize](self->_layout, "preferredPictureInPictureSize");
  __int128 v14 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v34.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v34.m33 = v14;
  __int128 v15 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v34.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v34.m43 = v15;
  __int128 v16 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v34.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v34.m13 = v16;
  __int128 v17 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v34.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v34.m23 = v17;
  unint64_t context = self->_context;
  if (context == 1)
  {
    double v19 = v12 / v9;
    double v20 = v13 / v11;
    goto LABEL_5;
  }

  if (!context)
  {
    double v19 = v9 / v12;
    double v20 = v11 / v13;
LABEL_5:
    CATransform3DMakeScale(&v34, v19, v20, 1.0);
  }

  v21 = objc_alloc(&OBJC_CLASS____UIPortalView);
  [v7 frame];
  CGFloat v22 = -[_UIPortalView initWithFrame:](v21, "initWithFrame:");
  CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(-[_UIPortalView layer](v22, "layer"));
  CATransform3D v33 = v34;
  [v23 setTransform:&v33];

  -[_UIPortalView setSourceView:](v22, "setSourceView:", v7);
  [v5 addSubview:v22];
  [v7 setAlpha:0.0];
  CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout containerViewController]( self->_layout,  "containerViewController"));
  CGFloat v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pictureInPictureViewController]);

  objc_msgSend(v25, "updateHostedWindowSize:", self->_targetSize.width, self->_targetSize.height);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100173A44;
  v30[3] = &unk_1003CFEB8;
  id v31 = v7;
  v32 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100173A78;
  v28[3] = &unk_1003D63D8;
  v28[4] = self;
  v29 = v32;
  v26 = v32;
  id v27 = v7;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v30,  v28,  0.6);
}

- (unint64_t)context
{
  return self->_context;
}

- (BOOL)isolated
{
  return self->_isolated;
}

- (PBPIPContainerViewControllerLayout)layout
{
  return self->_layout;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (CGRect)destinationFrame
{
  double x = self->_destinationFrame.origin.x;
  double y = self->_destinationFrame.origin.y;
  double width = self->_destinationFrame.size.width;
  double height = self->_destinationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end