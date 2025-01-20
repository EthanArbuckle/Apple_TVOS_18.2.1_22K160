@interface CloudGeniusDateTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusDateTransform

- (id)geniusValueForMLValue:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0 && ([v3 doubleValue], v6 > 2.22044605e-16))
  {
    [v3 doubleValue];
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

@end