@interface LaunchEventSyncMetadata
+ (Class)databaseEntityClass;
- (LaunchEventSyncMetadata)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation LaunchEventSyncMetadata

- (LaunchEventSyncMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LaunchEventSyncMetadata;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LaunchEventSyncMetadata;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___LaunchEventSyncMetadataEntity, a2);
}

@end