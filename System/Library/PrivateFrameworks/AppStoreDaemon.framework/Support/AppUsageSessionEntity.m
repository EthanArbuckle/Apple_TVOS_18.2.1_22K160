@interface AppUsageSessionEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation AppUsageSessionEntity

+ (id)databaseTable
{
  return @"app_usage_session_reporter_keys";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppUsageSession, a2);
}

@end