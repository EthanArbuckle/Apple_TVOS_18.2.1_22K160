@interface NSValue(IntegerByBand)
+ (uint64_t)valuewithIntegerByBand:()IntegerByBand;
- (uint64_t)integerByBandValue;
@end

@implementation NSValue(IntegerByBand)

+ (uint64_t)valuewithIntegerByBand:()IntegerByBand
{
  return [a1 valueWithBytes:a3 objCType:"{?=[3q][3B]}"];
}

- (uint64_t)integerByBandValue
{
  return [a1 getValue:x8_0];
}

@end