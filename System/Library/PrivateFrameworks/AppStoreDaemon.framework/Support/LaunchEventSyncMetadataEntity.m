@interface LaunchEventSyncMetadataEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation LaunchEventSyncMetadataEntity

+ (id)databaseTable
{
  return @"launch_event_sync_metadata";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___LaunchEventSyncMetadata, a2);
}

@end