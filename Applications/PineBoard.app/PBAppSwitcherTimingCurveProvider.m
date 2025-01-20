@interface PBAppSwitcherTimingCurveProvider
- (PBAppSwitcherTimingCurveProvider)initWithCoder:(id)a3;
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)timingCurveType;
@end

@implementation PBAppSwitcherTimingCurveProvider

- (int64_t)timingCurveType
{
  return 2LL;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return 0LL;
}

- (UISpringTimingParameters)springTimingParameters
{
  return  -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  3.0,  1000.0,  500.0,  0.0,  0.0);
}

- (PBAppSwitcherTimingCurveProvider)initWithCoder:(id)a3
{
  return -[PBAppSwitcherTimingCurveProvider init](self, "init", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class(self));
}

@end