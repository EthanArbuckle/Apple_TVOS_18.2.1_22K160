@interface APSPowerAssertion
- (APSPowerAssertion)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5;
@end

@implementation APSPowerAssertion

- (APSPowerAssertion)initWithName:(id)a3 category:(int)a4 holdDuration:(double)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___APSPowerAssertion;
  v5 = -[APSPowerAssertion_NoHold initWithName:category:holdDuration:]( &v8,  "initWithName:category:holdDuration:",  a3,  *(void *)&a4,  a5);
  v6 = v5;
  if (v5) {
    -[APSPowerAssertion_NoHold hold](v5, "hold");
  }
  return v6;
}

@end