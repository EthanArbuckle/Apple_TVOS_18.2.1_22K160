@interface SOSAnalytics
+ (id)databasePath;
+ (id)logger;
@end

@implementation SOSAnalytics

+ (id)databasePath
{
  if (databasePath_onceToken != -1) {
    dispatch_once(&databasePath_onceToken, &__block_literal_global_4483);
  }
  return +[SFAnalytics defaultAnalyticsDatabasePath:]( &OBJC_CLASS___SOSAnalytics,  "defaultAnalyticsDatabasePath:",  @"sos_analytics");
}

+ (id)logger
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SOSAnalytics;
  objc_msgSendSuper2(&v3, sel_logger);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __28__SOSAnalytics_databasePath__block_invoke()
{
}

uint64_t __28__SOSAnalytics_databasePath__block_invoke_4(int a1, char *a2)
{
  return remove(a2);
}

uint64_t __28__SOSAnalytics_databasePath__block_invoke_3(int a1, char *a2)
{
  return remove(a2);
}

uint64_t __28__SOSAnalytics_databasePath__block_invoke_2(int a1, char *a2)
{
  return remove(a2);
}

@end