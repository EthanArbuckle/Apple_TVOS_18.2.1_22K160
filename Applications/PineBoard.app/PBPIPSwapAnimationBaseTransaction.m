@interface PBPIPSwapAnimationBaseTransaction
+ (id)_animationGroupWithAnimations:(id)a3;
+ (id)_cubicAnimationForKeyPath:(id)a3;
+ (id)_cubicAnimationForOpacity;
+ (id)_keyPathLayer;
+ (id)_springAnimationForCornerRadius;
+ (id)_springAnimationForKeyPath:(id)a3;
+ (id)_springAnimationForOpacity;
+ (id)_springAnimationForPositionX;
+ (id)_springAnimationForPositionY;
+ (id)_springAnimationForScaleX;
+ (id)_springAnimationForScaleY;
+ (id)_springAnimationSettings;
- (CATransform3D)_destinationFullscreenScaleTransform;
- (CATransform3D)_destinationPIPScaleTransform;
- (CGRect)destinationFullscreenFrame;
- (CGRect)destinationPIPFrame;
- (CGSize)_destinationFullscreenScaleFactor;
- (CGSize)_destinationPIPScaleFactor;
- (PBPIPContainerViewControllerLayout)destinationFullscreenLayout;
- (PBPIPContainerViewControllerLayout)destinationPIPLayout;
- (PBPIPSwapAnimationBaseTransaction)initWithContainingView:(id)a3 destinationFullscreenLayout:(id)a4 destinationPIPLayout:(id)a5 quadrant:(int64_t)a6 currentPIPInsets:(UIEdgeInsets)a7;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)currentFullscreenPortalView;
- (UIView)currentPIPPortalView;
- (UIView)destinationFullscreenPortalView;
- (UIView)destinationPIPPortalView;
- (double)defaultPIPCornerRadius;
- (id)_destinationFullscreenViewController;
- (id)_destinationPIPViewController;
- (void)_begin;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PBPIPSwapAnimationBaseTransaction

- (PBPIPSwapAnimationBaseTransaction)initWithContainingView:(id)a3 destinationFullscreenLayout:(id)a4 destinationPIPLayout:(id)a5 quadrant:(int64_t)a6 currentPIPInsets:(UIEdgeInsets)a7
{
  double right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  double top = a7.top;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___PBPIPSwapAnimationBaseTransaction;
  v19 = -[PBPIPSwapAnimationBaseTransaction init](&v43, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_containerView, a3);
    objc_storeStrong((id *)&v20->_destinationFullscreenLayout, a4);
    objc_storeStrong((id *)&v20->_destinationPIPLayout, a5);
    [v16 bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v42 = left;
    double v29 = bottom;
    double y = CGPointZero.y;
    id v31 = [v17 preferredIntrinsicSize];
    v20->_destinationFullscreenFrame.origin.x = UIRectCenteredRect(v31, CGPointZero.x, y, v32, v33, v22, v24, v26, v28);
    v20->_destinationFullscreenFrame.origin.double y = v34;
    v20->_destinationFullscreenFrame.size.width = v35;
    v20->_destinationFullscreenFrame.size.height = v36;
    objc_msgSend(v18, "preferredPictureInPictureFrameForQuadrant:pipInsets:", a6, top, v42, v29, right);
    v20->_destinationPIPFrame.origin.x = v37;
    v20->_destinationPIPFrame.origin.double y = v38;
    v20->_destinationPIPFrame.size.width = v39;
    v20->_destinationPIPFrame.size.height = v40;
  }

  return v20;
}

- (void)dealloc
{
  if (-[PBPIPSwapAnimationBaseTransaction hasStarted](self, "hasStarted") && self->_backgroundView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Started SwapAnimation must be invalidated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B8D4();
    }
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___PBPIPSwapAnimationBaseTransaction;
    -[PBPIPSwapAnimationBaseTransaction dealloc](&v4, "dealloc");
  }

- (double)defaultPIPCornerRadius
{
  return result;
}

- (UIView)currentFullscreenPortalView
{
  if ((-[PBPIPSwapAnimationBaseTransaction isRunning](self, "isRunning") & 1) != 0)
  {
    currentFullscreenPortalView = self->_currentFullscreenPortalView;
    if (!currentFullscreenPortalView)
    {
      objc_super v4 = objc_alloc(&OBJC_CLASS___PBPIPSwapPortalClippingView);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPLayout](self, "destinationPIPLayout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerViewController]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      v8 = -[PBPIPSwapPortalClippingView initWithSourceView:](v4, "initWithSourceView:", v7);
      v9 = self->_currentFullscreenPortalView;
      self->_currentFullscreenPortalView = v8;

      currentFullscreenPortalView = self->_currentFullscreenPortalView;
    }

    return (UIView *)currentFullscreenPortalView;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isRunning]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027B97C();
    }
    double result = (UIView *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (UIView)currentPIPPortalView
{
  if ((-[PBPIPSwapAnimationBaseTransaction isRunning](self, "isRunning") & 1) != 0)
  {
    currentPIPPortalView = self->_currentPIPPortalView;
    if (!currentPIPPortalView)
    {
      objc_super v4 = objc_alloc(&OBJC_CLASS___PBPIPSwapPortalClippingView);
      v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction destinationFullscreenLayout]( self,  "destinationFullscreenLayout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerViewController]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      v8 = -[PBPIPSwapPortalClippingView initWithSourceView:](v4, "initWithSourceView:", v7);
      v9 = self->_currentPIPPortalView;
      self->_currentPIPPortalView = v8;

      currentPIPPortalView = self->_currentPIPPortalView;
    }

    return (UIView *)currentPIPPortalView;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isRunning]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027BA24();
    }
    double result = (UIView *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (UIView)destinationFullscreenPortalView
{
  if ((-[PBPIPSwapAnimationBaseTransaction isRunning](self, "isRunning") & 1) != 0)
  {
    destinationFullscreenContentPortalView = self->_destinationFullscreenContentPortalView;
    if (!destinationFullscreenContentPortalView)
    {
      objc_super v4 = objc_alloc(&OBJC_CLASS___PBPIPSwapPortalClippingView);
      -[PBPIPSwapAnimationBaseTransaction destinationFullscreenFrame](self, "destinationFullscreenFrame");
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction _destinationFullscreenViewController]( self,  "_destinationFullscreenViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contentContainerView]);
      v15 = -[PBPIPSwapPortalClippingView initWithFrame:sourceView:]( v4,  "initWithFrame:sourceView:",  v14,  v6,  v8,  v10,  v12);
      id v16 = self->_destinationFullscreenContentPortalView;
      self->_destinationFullscreenContentPortalView = v15;

      id v17 = self->_destinationFullscreenContentPortalView;
      -[PBPIPSwapAnimationBaseTransaction _destinationFullscreenScaleTransform]( self,  "_destinationFullscreenScaleTransform");
      -[PBPIPSwapPortalClippingView setSublayerTransform:](v17, "setSublayerTransform:", v20);
      destinationFullscreenContentPortalView = self->_destinationFullscreenContentPortalView;
    }

    return (UIView *)destinationFullscreenContentPortalView;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isRunning]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027BACC();
    }
    double result = (UIView *)_bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
  }

  return result;
}

- (UIView)destinationPIPPortalView
{
  if ((-[PBPIPSwapAnimationBaseTransaction isRunning](self, "isRunning") & 1) != 0)
  {
    destinationPIPContentPortalView = self->_destinationPIPContentPortalView;
    if (!destinationPIPContentPortalView)
    {
      objc_super v4 = objc_alloc(&OBJC_CLASS___PBPIPSwapPortalClippingView);
      -[PBPIPSwapAnimationBaseTransaction destinationPIPFrame](self, "destinationPIPFrame");
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction _destinationPIPViewController]( self,  "_destinationPIPViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contentContainerView]);
      v15 = -[PBPIPSwapPortalClippingView initWithFrame:sourceView:]( v4,  "initWithFrame:sourceView:",  v14,  v6,  v8,  v10,  v12);
      id v16 = self->_destinationPIPContentPortalView;
      self->_destinationPIPContentPortalView = v15;

      id v17 = self->_destinationPIPContentPortalView;
      -[PBPIPSwapAnimationBaseTransaction _destinationPIPScaleTransform](self, "_destinationPIPScaleTransform");
      -[PBPIPSwapPortalClippingView setSublayerTransform:](v17, "setSublayerTransform:", v20);
      destinationPIPContentPortalView = self->_destinationPIPContentPortalView;
    }

    return (UIView *)destinationPIPContentPortalView;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self isRunning]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027BB74();
    }
    double result = (UIView *)_bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)_begin
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBPIPSwapAnimationBaseTransaction;
  -[PBPIPSwapAnimationBaseTransaction _begin](&v10, "_begin");
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  -[UIView bounds](self->_containerView, "bounds");
  objc_super v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  double v6 = self->_backgroundView;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_backgroundView);
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction _destinationFullscreenViewController]( self,  "_destinationFullscreenViewController"));
  [v8 showChrome:0 animated:0];

  double v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction _destinationPIPViewController]( self,  "_destinationPIPViewController"));
  [v9 showChrome:0 animated:0];
}

- (void)invalidate
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0LL;

  double v5 = self->_currentFullscreenPortalView;
  -[PBPIPSwapPortalClippingView setSourceView:](v5, "setSourceView:", 0LL);
  -[PBPIPSwapPortalClippingView removeFromSuperview](v5, "removeFromSuperview");

  double v6 = self->_currentPIPPortalView;
  -[PBPIPSwapPortalClippingView setSourceView:](v6, "setSourceView:", 0LL);
  -[PBPIPSwapPortalClippingView removeFromSuperview](v6, "removeFromSuperview");

  double v7 = self->_destinationFullscreenContentPortalView;
  -[PBPIPSwapPortalClippingView setSourceView:](v7, "setSourceView:", 0LL);
  -[PBPIPSwapPortalClippingView removeFromSuperview](v7, "removeFromSuperview");

  double v8 = self->_destinationPIPContentPortalView;
  -[PBPIPSwapPortalClippingView setSourceView:](v8, "setSourceView:", 0LL);
  -[PBPIPSwapPortalClippingView removeFromSuperview](v8, "removeFromSuperview");

  currentFullscreenPortalView = self->_currentFullscreenPortalView;
  self->_currentFullscreenPortalView = 0LL;

  currentPIPPortalView = self->_currentPIPPortalView;
  self->_currentPIPPortalView = 0LL;

  destinationFullscreenContentPortalView = self->_destinationFullscreenContentPortalView;
  self->_destinationFullscreenContentPortalView = 0LL;

  destinationPIPContentPortalView = self->_destinationPIPContentPortalView;
  self->_destinationPIPContentPortalView = 0LL;

  v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction _destinationPIPViewController]( self,  "_destinationPIPViewController"));
  [v13 showChrome:1 animated:0];

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = -[PBPIPSwapAnimationBaseTransaction childTransactionsOfClass:]( self,  "childTransactionsOfClass:",  objc_opt_class(&OBJC_CLASS___PBUICAAnimationTransaction),  0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) invalidate];
        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v17);
  }
}

- (CGSize)_destinationFullscreenScaleFactor
{
  p_destinationFullscreenFrame = &self->_destinationFullscreenFrame;
  -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize]( self->_destinationFullscreenLayout,  "preferredPictureInPictureSize");
  double v4 = p_destinationFullscreenFrame->size.width / v3;
  double v6 = p_destinationFullscreenFrame->size.height / v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)_destinationPIPScaleFactor
{
  p_destinationPIPFrame = &self->_destinationPIPFrame;
  -[PBPIPContainerViewControllerLayout preferredLandscapeBoundingSize]( self->_destinationPIPLayout,  "preferredLandscapeBoundingSize");
  double v4 = p_destinationPIPFrame->size.width / v3;
  double v6 = p_destinationPIPFrame->size.height / v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CATransform3D)_destinationFullscreenScaleTransform
{
  return CATransform3DMakeScale(retstr, v4, v5, 1.0);
}

- (CATransform3D)_destinationPIPScaleTransform
{
  return CATransform3DMakeScale(retstr, v4, v5, 1.0);
}

- (id)_destinationFullscreenViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout containerViewController]( self->_destinationFullscreenLayout,  "containerViewController"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pictureInPictureViewController]);

  return v3;
}

- (id)_destinationPIPViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout containerViewController]( self->_destinationPIPLayout,  "containerViewController"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pictureInPictureViewController]);

  return v3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (PBPIPContainerViewControllerLayout)destinationFullscreenLayout
{
  return self->_destinationFullscreenLayout;
}

- (CGRect)destinationFullscreenFrame
{
  double x = self->_destinationFullscreenFrame.origin.x;
  double y = self->_destinationFullscreenFrame.origin.y;
  double width = self->_destinationFullscreenFrame.size.width;
  double height = self->_destinationFullscreenFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PBPIPContainerViewControllerLayout)destinationPIPLayout
{
  return self->_destinationPIPLayout;
}

- (CGRect)destinationPIPFrame
{
  double x = self->_destinationPIPFrame.origin.x;
  double y = self->_destinationPIPFrame.origin.y;
  double width = self->_destinationPIPFrame.size.width;
  double height = self->_destinationPIPFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
}

+ (id)_keyPathLayer
{
  return 0LL;
}

+ (id)_springAnimationForOpacity
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _springAnimationForKeyPath:@"opacity"]);
}

+ (id)_cubicAnimationForOpacity
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _cubicAnimationForKeyPath:@"opacity"]);
}

+ (id)_springAnimationForCornerRadius
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _springAnimationForKeyPath:@"cornerRadius"]);
}

+ (id)_springAnimationForPositionX
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _springAnimationForKeyPath:@"position.x"]);
}

+ (id)_springAnimationForPositionY
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _springAnimationForKeyPath:@"position.y"]);
}

+ (id)_springAnimationForScaleX
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _springAnimationForKeyPath:@"transform.scale.x"]);
}

+ (id)_springAnimationForScaleY
{
  return (id)objc_claimAutoreleasedReturnValue([a1 _springAnimationForKeyPath:@"transform.scale.y"]);
}

+ (id)_springAnimationSettings
{
  return (id)objc_claimAutoreleasedReturnValue( +[BSSpringAnimationSettings settingsWithMass:stiffness:damping:]( &OBJC_CLASS___BSSpringAnimationSettings,  "settingsWithMass:stiffness:damping:",  1.0,  150.0,  25.0));
}

+ (id)_springAnimationForKeyPath:(id)a3
{
  id v4 = a3;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _springAnimationSettings]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation pb_animationForKeyPath:withSettings:]( &OBJC_CLASS___CABasicAnimation,  "pb_animationForKeyPath:withSettings:",  v4,  v5));

  id v7 = v6;
  [v7 setRemovedOnCompletion:0];
  [v7 setFillMode:kCAFillModeBoth];

  return v7;
}

+ (id)_cubicAnimationForKeyPath:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](&OBJC_CLASS___CABasicAnimation, "animationWithKeyPath:", a3));
  [v3 setDuration:0.25];
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 1.0;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v4,  v5,  v6,  v7));
  [v3 setTimingFunction:v8];

  id v9 = v3;
  [v9 setRemovedOnCompletion:0];
  [v9 setFillMode:kCAFillModeBoth];

  return v9;
}

+ (id)_animationGroupWithAnimations:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[CAAnimationGroup pb_groupWithAnimations:]( &OBJC_CLASS___CAAnimationGroup,  "pb_groupWithAnimations:",  a3));
  [v3 setRemovedOnCompletion:0];
  [v3 setFillMode:kCAFillModeBoth];
  return v3;
}

@end