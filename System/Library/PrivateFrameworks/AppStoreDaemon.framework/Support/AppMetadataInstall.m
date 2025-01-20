@interface AppMetadataInstall
+ (Class)databaseEntityClass;
- (AppMetadataInstall)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation AppMetadataInstall

- (AppMetadataInstall)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppMetadataInstall;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppMetadataInstall;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppMetadataInstallEntity, a2);
}

@end