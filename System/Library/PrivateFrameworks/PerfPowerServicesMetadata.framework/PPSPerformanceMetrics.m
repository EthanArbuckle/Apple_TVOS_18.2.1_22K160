@interface PPSPerformanceMetrics
+ (id)allDeclMetrics;
+ (id)subsystem;
@end

@implementation PPSPerformanceMetrics

+ (id)subsystem
{
  return @"PerformanceMetrics";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

@end