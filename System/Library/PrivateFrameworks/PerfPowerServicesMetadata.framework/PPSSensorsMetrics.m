@interface PPSSensorsMetrics
+ (id)allDeclMetrics;
+ (id)sensorUsageMetrics;
+ (id)subsystem;
@end

@implementation PPSSensorsMetrics

+ (id)subsystem
{
  return @"Sensors";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

+ (id)sensorUsageMetrics
{
  return (id)MEMORY[0x189604A58];
}

@end