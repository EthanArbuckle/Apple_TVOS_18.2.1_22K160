@interface GKPurgeableCacheObject
- (BOOL)purgeable;
- (void)purge;
@end

@implementation GKPurgeableCacheObject

- (BOOL)purgeable
{
  return 1;
}

- (void)purge
{
  BOOL v3 = -[GKPurgeableCacheObject purgeable](self, "purgeable");
  if (v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKPurgeableCacheObject managedObjectContext](self, "managedObjectContext"));
    [v5 deleteObject:self];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v4 = (id)GKOSLoggers(v3);
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000D7D3C();
    }
  }

@end