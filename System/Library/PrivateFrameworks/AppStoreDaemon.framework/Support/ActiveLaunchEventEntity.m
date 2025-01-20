@interface ActiveLaunchEventEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)defaultProperties;
@end

@implementation ActiveLaunchEventEntity

+ (id)databaseTable
{
  return @"active_launch_events";
}

+ (id)defaultProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ActiveLaunchEventEntity;
  id v2 = objc_msgSendSuper2(&v6, "defaultProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObject:@"payload"]);

  return v4;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___LaunchEvent, a2);
}

@end