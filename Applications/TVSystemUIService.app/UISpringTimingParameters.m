@interface UISpringTimingParameters
+ (id)tvss_appearingSpringParameters;
+ (id)tvss_defaultSpringParameters;
@end

@implementation UISpringTimingParameters

+ (id)tvss_defaultSpringParameters
{
  v5 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  sub_1000113E4();
  return  -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v5,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  155.0,  50.0,  v2,  v3);
}

  ;
}

+ (id)tvss_appearingSpringParameters
{
  v5 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  sub_1000113E4();
  return  -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v5,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  200.0,  23.0,  v2,  v3);
}

@end