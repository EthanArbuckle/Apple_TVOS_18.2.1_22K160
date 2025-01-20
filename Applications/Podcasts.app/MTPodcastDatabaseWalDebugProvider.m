@interface MTPodcastDatabaseWalDebugProvider
- (id)debugDataFileName;
@end

@implementation MTPodcastDatabaseWalDebugProvider

- (id)debugDataFileName
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPodcastDatabaseWalDebugProvider;
  id v2 = -[MTPodcastDatabaseDebugProvider debugDataFileName](&v6, "debugDataFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-wal"]);

  return v4;
}

@end