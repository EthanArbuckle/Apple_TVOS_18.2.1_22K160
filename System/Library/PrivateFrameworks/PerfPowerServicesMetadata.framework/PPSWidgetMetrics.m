@interface PPSWidgetMetrics
+ (id)allDeclMetrics;
+ (id)relevanceContextUpdate;
+ (id)subsystem;
@end

@implementation PPSWidgetMetrics

+ (id)subsystem
{
  return @"Widget";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

+ (id)relevanceContextUpdate
{
  return (id)MEMORY[0x189604A58];
}

@end