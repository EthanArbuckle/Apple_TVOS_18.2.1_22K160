@interface MTPodcastDatabaseShmDebugProvider
- (id)debugDataFileName;
@end

@implementation MTPodcastDatabaseShmDebugProvider

- (id)debugDataFileName
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPodcastDatabaseShmDebugProvider;
  id v2 = -[MTPodcastDatabaseDebugProvider debugDataFileName](&v6, "debugDataFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-shm"]);

  return v4;
}

@end