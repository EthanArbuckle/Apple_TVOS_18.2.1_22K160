@interface CloudGeniusHasValueTransform
- (id)geniusValueForMLValue:(id)a3;
@end

@implementation CloudGeniusHasValueTransform

- (id)geniusValueForMLValue:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    unint64_t v7 = (unint64_t)[v3 BOOLValue];
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v6);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) == 0)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData, v9);
      if ((objc_opt_isKindOfClass(v3, v10) & 1) == 0)
      {
        v11 = &__kCFBooleanFalse;
        goto LABEL_7;
      }
    }

    unint64_t v7 = [v3 length] != 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
LABEL_7:

  return v11;
}

@end