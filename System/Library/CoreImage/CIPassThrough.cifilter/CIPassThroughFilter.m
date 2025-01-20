@interface CIPassThroughFilter
+ (id)customAttributes;
@end

@implementation CIPassThroughFilter

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryBuiltIn;
  v5[1] = kCICategoryApplePrivate;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v7[0] = v2;
  v7[1] = @"10";
  v6[1] = kCIAttributeFilterAvailable_iOS;
  v6[2] = kCIAttributeFilterAvailable_Mac;
  v7[2] = @"10.12";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));

  return v3;
}

- (void).cxx_destruct
{
}

@end