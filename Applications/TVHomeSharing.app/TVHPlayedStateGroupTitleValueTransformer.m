@interface TVHPlayedStateGroupTitleValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation TVHPlayedStateGroupTitleValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString);
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v3 = [a3 integerValue];
  if (v3 == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"UNPLAYED_TITLE";
  }

  else
  {
    if (v3 != (id)2)
    {
      v7 = 0LL;
      return v7;
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"CONTINUE_WATCHING_TITLE";
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:0 table:0]);

  return v7;
}

@end