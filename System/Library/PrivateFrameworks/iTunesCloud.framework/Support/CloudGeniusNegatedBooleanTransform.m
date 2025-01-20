@interface CloudGeniusNegatedBooleanTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusNegatedBooleanTransform

- (id)geniusValueForMLValue:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 BOOLValue] ^ 1));
  }
  else {
    v6 = &__kCFBooleanFalse;
  }

  return v6;
}

@end