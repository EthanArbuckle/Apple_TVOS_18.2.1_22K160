@interface AppMetadataInstallEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation AppMetadataInstallEntity

+ (id)databaseTable
{
  return @"current_app_installs";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppMetadataInstall, a2);
}

@end