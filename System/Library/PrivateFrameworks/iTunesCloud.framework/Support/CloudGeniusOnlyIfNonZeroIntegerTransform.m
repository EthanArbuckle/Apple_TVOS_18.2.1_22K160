@interface CloudGeniusOnlyIfNonZeroIntegerTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusOnlyIfNonZeroIntegerTransform

- (id)geniusValueForMLValue:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0 && [v3 longLongValue]) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

@end