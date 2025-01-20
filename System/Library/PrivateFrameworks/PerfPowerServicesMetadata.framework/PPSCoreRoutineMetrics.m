@interface PPSCoreRoutineMetrics
+ (id)allDeclMetrics;
+ (id)subsystem;
@end

@implementation PPSCoreRoutineMetrics

+ (id)subsystem
{
  return @"CoreRoutine";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

@end