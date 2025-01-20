@interface PPSBackupMetrics
+ (id)allDeclMetrics;
+ (id)subsystem;
@end

@implementation PPSBackupMetrics

+ (id)subsystem
{
  return @"BackupMetrics";
}

+ (id)allDeclMetrics
{
  return (id)[MEMORY[0x189603FA8] array];
}

@end