@interface AppEventEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation AppEventEntity

+ (id)databaseTable
{
  return @"app_events";
}

+ (id)defaultProperties
{
  v3[0] = @"account_id";
  v3[1] = @"app_platform";
  v3[2] = @"bundle_id";
  v3[3] = @"bundle_version";
  v3[4] = @"cohort";
  v3[5] = @"count";
  v3[6] = @"cumulative_user_count";
  v3[7] = @"device_vendor_id";
  v3[8] = @"device_vendor_id_repaired";
  v3[9] = @"event_type";
  v3[10] = @"event_subtype";
  v3[11] = @"evid";
  v3[12] = @"has_been_posted";
  v3[13] = @"is_clip";
  v3[14] = @"is_beta";
  v3[15] = @"is_system_app";
  v3[16] = @"is_temporary";
  v3[17] = @"item_id";
  v3[18] = @"item_name";
  v3[19] = @"launch_time";
  v3[20] = @"launch_end_time";
  v3[21] = @"week_start_time";
  v3[22] = @"short_version";
  v3[23] = @"storefront";
  v3[24] = @"timestamp";
  v3[25] = @"usage_time";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  26LL));
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppEvent, a2);
}

@end