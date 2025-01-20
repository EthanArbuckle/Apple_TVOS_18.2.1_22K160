@interface NSValue(IntegerByBandTransition)
+ (uint64_t)valuewithIntegerByBandTransition:()IntegerByBandTransition;
- (uint64_t)integerByBandTransitionValue;
@end

@implementation NSValue(IntegerByBandTransition)

+ (uint64_t)valuewithIntegerByBandTransition:()IntegerByBandTransition
{
  return [a1 valueWithBytes:a3 objCType:"{?=[3[3q]][3[3B]]}"];
}

- (uint64_t)integerByBandTransitionValue
{
  return [a1 getValue:x8_0];
}

@end