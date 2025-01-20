@interface AppMetricsEventEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation AppMetricsEventEntity

+ (id)databaseTable
{
  return @"app_metrics_events";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppMetricsEvent, a2);
}

@end