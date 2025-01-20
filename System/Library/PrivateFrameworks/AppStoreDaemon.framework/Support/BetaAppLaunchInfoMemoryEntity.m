@interface BetaAppLaunchInfoMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
@end

@implementation BetaAppLaunchInfoMemoryEntity

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___BetaAppInfoEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_id";
  v3[1] = @"bundle_version";
  v3[2] = @"email";
  v3[3] = @"expiration_date";
  v3[4] = @"has_shared_screenshot_feedback";
  v3[5] = @"feedback_enabled";
  v3[6] = @"icon_url_template";
  v3[7] = @"last_seen_date";
  v3[8] = @"launch_screen_enabled";
  v3[9] = @"localized_display_names";
  v3[10] = @"platform";
  v3[11] = @"primary_locale";
  v3[12] = @"bundle_short_version";
  v3[13] = @"what_to_test";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  14LL));
}

- (void).cxx_destruct
{
}

@end