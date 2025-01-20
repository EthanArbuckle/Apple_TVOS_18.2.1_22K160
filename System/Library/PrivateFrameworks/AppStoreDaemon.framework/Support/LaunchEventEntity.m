@interface LaunchEventEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation LaunchEventEntity

+ (id)databaseTable
{
  return @"launch_events";
}

+ (id)defaultProperties
{
  v3[0] = @"bundle_id";
  v3[1] = @"containing_bundle_id";
  v3[2] = @"event_source";
  v3[3] = @"is_extension";
  v3[4] = @"launch_end_time";
  v3[5] = @"launch_start_time";
  v3[6] = @"timestamp";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  7LL));
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___LaunchEvent, a2);
}

@end