@interface _NSStatic_NSUnitTemperature
- (Class)_effectiveUnitClass;
- (Class)classForCoder;
- (unint64_t)retainCount;
@end

@implementation _NSStatic_NSUnitTemperature

- (unint64_t)retainCount
{
  return -1LL;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)_effectiveUnitClass
{
  return (Class)objc_opt_class();
}

@end