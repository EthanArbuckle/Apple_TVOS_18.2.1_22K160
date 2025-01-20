@interface PBPIPSwapReduceMotionAnimationTransaction
+ (id)_crossfadeAnimation;
+ (id)_crossfadeTransactionForLayer:(id)a3;
- (void)_addChildCrossfadeAnimationTransactionForView:(id)a3;
- (void)_begin;
@end

@implementation PBPIPSwapReduceMotionAnimationTransaction

- (void)_begin
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBPIPSwapReduceMotionAnimationTransaction;
  -[PBPIPSwapAnimationBaseTransaction _begin](&v8, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction currentFullscreenPortalView](self, "currentFullscreenPortalView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction currentPIPPortalView](self, "currentPIPPortalView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapAnimationBaseTransaction destinationFullscreenPortalView]( self,  "destinationFullscreenPortalView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPPortalView](self, "destinationPIPPortalView"));
  -[PBPIPSwapAnimationBaseTransaction defaultPIPCornerRadius](self, "defaultPIPCornerRadius");
  objc_msgSend(v5, "_setContinuousCornerRadius:");
  -[PBPIPSwapAnimationBaseTransaction defaultPIPCornerRadius](self, "defaultPIPCornerRadius");
  objc_msgSend(v7, "_setContinuousCornerRadius:");
  [v3 addSubview:v4];
  [v3 addSubview:v5];
  [v3 addSubview:v6];
  [v3 addSubview:v7];
  -[PBPIPSwapReduceMotionAnimationTransaction _addChildCrossfadeAnimationTransactionForView:]( self,  "_addChildCrossfadeAnimationTransactionForView:",  v6);
  -[PBPIPSwapReduceMotionAnimationTransaction _addChildCrossfadeAnimationTransactionForView:]( self,  "_addChildCrossfadeAnimationTransactionForView:",  v7);
}

+ (id)_crossfadeAnimation
{
  id v2 = [(id)objc_opt_class(a1) _springAnimationForOpacity];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 setFromValue:&off_1003FEB70];
  [v3 setToValue:&off_1003FEB80];
  return v3;
}

+ (id)_crossfadeTransactionForLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(a1) _crossfadeAnimation];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[PBUICAAnimationTransaction initWithLayer:animation:name:]( objc_alloc(&OBJC_CLASS___PBUICAAnimationTransaction),  "initWithLayer:animation:name:",  v4,  v6,  @"PIP swap crossfade (reduce motion)");

  return v7;
}

- (void)_addChildCrossfadeAnimationTransactionForView:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 layer]);
  id v5 = [(id)objc_opt_class(self) _crossfadeTransactionForLayer:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PBPIPSwapReduceMotionAnimationTransaction addChildTransaction:](self, "addChildTransaction:", v6);
}

@end