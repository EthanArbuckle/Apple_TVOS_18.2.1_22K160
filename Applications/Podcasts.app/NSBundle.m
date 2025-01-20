@interface NSBundle
+ (id)appendToBundleIdentifier:(id)a3;
@end

@implementation NSBundle

+ (id)appendToBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingFormat:@".%@", v3]);
  return v6;
}

@end