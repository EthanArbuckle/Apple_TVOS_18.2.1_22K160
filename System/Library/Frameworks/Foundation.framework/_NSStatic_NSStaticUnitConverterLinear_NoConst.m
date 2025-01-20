@interface _NSStatic_NSStaticUnitConverterLinear_NoConst
- (Class)classForCoder;
- (double)constant;
- (unint64_t)retainCount;
@end

@implementation _NSStatic_NSStaticUnitConverterLinear_NoConst

- (unint64_t)retainCount
{
  return -1LL;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (double)constant
{
  return 0.0;
}

@end