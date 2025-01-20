@interface CPLSyncSession
- (CPLCloudKitRescheduler)cloudKitRescheduler;
- (void)createCloudKitReschedulerIfNecessary;
@end

@implementation CPLSyncSession

- (void)createCloudKitReschedulerIfNecessary
{
  if (-[CPLSyncSession needsToAcquireRescheduler](self, "needsToAcquireRescheduler"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSyncSession scheduler](self, "scheduler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 engineLibrary]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transport]);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 platformObject]);

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___CPLCloudKitTransport);
    if ((objc_opt_isKindOfClass(v8, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v8 createReschedulerForSession:self]);
      -[CPLSyncSession setRescheduler:](self, "setRescheduler:", v7);
    }
  }

- (CPLCloudKitRescheduler)cloudKitRescheduler
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSyncSession rescheduler](self, "rescheduler"));
  v5 = v4;
  return (CPLCloudKitRescheduler *)v5;
}

@end