@interface LNFeatures_tvOS
+ (BOOL)homeRVCEnabled;
+ (BOOL)isHomePod;
@end

@implementation LNFeatures_tvOS

+ (BOOL)isHomePod
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0LL) == 7;
}

+ (BOOL)homeRVCEnabled
{
  if ((_os_feature_enabled_impl("Home", "RVC") & 1) != 0) {
    return 1;
  }
  v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.homed");
  unsigned __int8 v4 = -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", @"RVC");

  return v4;
}

@end