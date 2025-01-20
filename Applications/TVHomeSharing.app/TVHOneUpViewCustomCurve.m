@interface TVHOneUpViewCustomCurve
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4;
@end

@implementation TVHOneUpViewCustomCurve

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return +[CABasicAnimation animationWithKeyPath:](&OBJC_CLASS___CABasicAnimation, "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  a3,  a4,  v4,  v5,  v6,  v7);
}

@end