@interface MTBookmarksSyncStorage
+ (BOOL)hasBookmarksSync;
+ (double)lastBookmarksSyncTimestampForSyncType:(int64_t)a3;
+ (id)bookmarksKeyForSyncType:(int64_t)a3;
+ (id)bookmarksLastSyncKeyForSyncType:(int64_t)a3;
+ (id)bookmarksSyncVersionForSyncType:(int64_t)a3;
+ (void)resetBookmarksSync;
+ (void)setBookmarksSyncVersion:(id)a3 syncType:(int64_t)a4;
+ (void)setLastBookmarksSyncTimestamp:(double)a3 syncType:(int64_t)a4;
- (BOOL)syncDirtyFlag;
- (MTBookmarksSyncStorage)initWithSyncType:(int64_t)a3;
- (NSString)logPrefix;
- (NSString)podcastsDomainVersion;
- (NSString)syncVersion;
- (double)lastSyncTimestamp;
- (id)importContext;
- (int64_t)syncType;
- (void)setLastSyncTimestamp:(double)a3;
- (void)setPodcastsDomainVersion:(id)a3;
- (void)setSyncDirtyFlag:(BOOL)a3;
- (void)setSyncType:(int64_t)a3;
- (void)setSyncVersion:(id)a3;
- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4;
- (void)unsafeRemoveFromBookmarksEpisodes:(id)a3 context:(id)a4;
@end

@implementation MTBookmarksSyncStorage

- (MTBookmarksSyncStorage)initWithSyncType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTBookmarksSyncStorage;
  v4 = -[MTBookmarksSyncStorage init](&v7, "init");
  v5 = v4;
  if (v4) {
    -[MTBookmarksSyncStorage setSyncType:](v4, "setSyncType:", a3);
  }
  return v5;
}

- (NSString)syncVersion
{
  return (NSString *)+[MTBookmarksSyncStorage bookmarksSyncVersionForSyncType:]( &OBJC_CLASS___MTBookmarksSyncStorage,  "bookmarksSyncVersionForSyncType:",  -[MTBookmarksSyncStorage syncType](self, "syncType"));
}

- (void)setSyncVersion:(id)a3
{
  id v4 = a3;
  +[MTBookmarksSyncStorage setBookmarksSyncVersion:syncType:]( &OBJC_CLASS___MTBookmarksSyncStorage,  "setBookmarksSyncVersion:syncType:",  v4,  -[MTBookmarksSyncStorage syncType](self, "syncType"));
}

- (double)lastSyncTimestamp
{
  return result;
}

- (void)setLastSyncTimestamp:(double)a3
{
}

+ (id)bookmarksKeyForSyncType:(int64_t)a3
{
  v3 = (id *)&kMTBookmarksKey;
  if (a3 == 1) {
    v3 = (id *)&kMTBookmarksDRMKey;
  }
  return *v3;
}

+ (id)bookmarksLastSyncKeyForSyncType:(int64_t)a3
{
  if (a3 == 1) {
    return @"bookmarks-drm-last-sync";
  }
  else {
    return @"bookmarks-last-sync";
  }
}

+ (id)bookmarksSyncVersionForSyncType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bookmarksKeyForSyncType:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:v3]);

  return v5;
}

+ (void)setBookmarksSyncVersion:(id)a3 syncType:(int64_t)a4
{
  id v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 bookmarksKeyForSyncType:a4]);
  id v7 = [v10 length];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v9 = v8;
  if (v7) {
    [v8 setObject:v10 forKey:v6];
  }
  else {
    [v8 removeObjectForKey:v6];
  }
}

+ (double)lastBookmarksSyncTimestampForSyncType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bookmarksLastSyncKeyForSyncType:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 doubleForKey:v3];
  double v6 = v5;

  return v6;
}

+ (void)setLastBookmarksSyncTimestamp:(double)a3 syncType:(int64_t)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a1 bookmarksLastSyncKeyForSyncType:a4]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  double v6 = v5;
  if (a3 <= 0.0) {
    [v5 removeObjectForKey:v7];
  }
  else {
    [v5 setDouble:v7 forKey:a3];
  }
}

+ (BOOL)hasBookmarksSync
{
  uint64_t v3 = 0LL;
  BOOL v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (v4)
    {
      BOOL v4 = 1;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 bookmarksSyncVersionForSyncType:v3]);
      if (v7)
      {
        BOOL v4 = 1;
      }

      else
      {
        [a1 lastBookmarksSyncTimestampForSyncType:v3];
        BOOL v4 = v8 != 0.0;
      }
    }

    char v5 = 0;
    uint64_t v3 = 1LL;
  }

  while ((v6 & 1) != 0);
  return v4;
}

+ (void)resetBookmarksSync
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v3 markBookmarksSyncDirty:1 for:0];

  [a1 setBookmarksSyncVersion:0 syncType:1];
  [a1 setLastBookmarksSyncTimestamp:1 syncType:0.0];
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v4 markBookmarksSyncDirty:1 for:1];
}

- (NSString)podcastsDomainVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 podcastsDomainVersion]);

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v4 setPodcastsDomainVersion:v3];
}

- (void)setSyncDirtyFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v5 markBookmarksSyncDirty:v3 for:self->syncType];
}

- (BOOL)syncDirtyFlag
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  LOBYTE(self) = objc_msgSend( v3,  "isBookmarksSyncDirtyFor:",  -[MTBookmarksSyncStorage syncType](self, "syncType"));

  return (char)self;
}

- (id)importContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 importContext]);

  return v3;
}

- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  [v6 unsafeBookmarkEpisode:v5 onTimestamp:0 shouldDownloadEpisode:1 from:a4];
}

- (void)unsafeRemoveFromBookmarksEpisodes:(id)a3 context:(id)a4
{
  id v5 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v9);
        uint64_t v11 = _MTLogCategoryCloudSync(v6);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncStorage logPrefix](self, "logPrefix"));
          id v14 = [v10 storeTrackId];
          *(_DWORD *)buf = 138412546;
          v21 = v13;
          __int16 v22 = 2048;
          id v23 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ Step 2: missing bookmark adam id from cloud: %lld",  buf,  0x16u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue( +[PodcastsStateCoordinator shared]( &OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator,  "shared"));
        [v15 unsafeRemoveEpisodeFromBookmarks:v10 from:1];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      id v7 = v6;
    }

    while (v6);
  }
}

- (NSString)logPrefix
{
  if (self->syncType == 1) {
    return (NSString *)@"[Bookmarks DRM Sync]";
  }
  else {
    return (NSString *)@"[Bookmarks Sync]";
  }
}

- (int64_t)syncType
{
  return self->syncType;
}

- (void)setSyncType:(int64_t)a3
{
  self->syncType = a3;
}

@end