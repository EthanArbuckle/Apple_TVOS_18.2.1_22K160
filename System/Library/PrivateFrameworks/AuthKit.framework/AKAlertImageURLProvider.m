@interface AKAlertImageURLProvider
+ (id)url;
@end

@implementation AKAlertImageURLProvider

+ (id)url
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKitUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 URLForResource:@"appleaccount_mono_icon-60-dark" withExtension:@"png"]);

  return v3;
}

@end