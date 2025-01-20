@interface MTDebugDataManager
+ (void)setup;
@end

@implementation MTDebugDataManager

+ (void)setup
{
  v2 = objc_alloc_init(&OBJC_CLASS___MTPodcastDatabaseDebugProvider);
  +[IMDebugDataManager registerDataProvider:](&OBJC_CLASS___IMDebugDataManager, "registerDataProvider:", v2);

  v3 = objc_alloc_init(&OBJC_CLASS___MTMediaLibraryDebugProvider);
  +[IMDebugDataManager registerDataProvider:](&OBJC_CLASS___IMDebugDataManager, "registerDataProvider:", v3);

  v4 = objc_alloc_init(&OBJC_CLASS___MTPodcastDatabaseWalDebugProvider);
  +[IMDebugDataManager registerDataProvider:](&OBJC_CLASS___IMDebugDataManager, "registerDataProvider:", v4);

  v5 = objc_alloc_init(&OBJC_CLASS___MTPodcastDatabaseShmDebugProvider);
  +[IMDebugDataManager registerDataProvider:](&OBJC_CLASS___IMDebugDataManager, "registerDataProvider:", v5);

  v6 = objc_alloc_init(&OBJC_CLASS___MTDebugSharedUserDefaultsDataProvider);
  +[IMDebugDataManager registerDataProvider:](&OBJC_CLASS___IMDebugDataManager, "registerDataProvider:", v6);
}

@end