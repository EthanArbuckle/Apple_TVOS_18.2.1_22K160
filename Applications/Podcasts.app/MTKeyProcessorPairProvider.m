@interface MTKeyProcessorPairProvider
- (MTKeyProcessorPairProvider)initWithCloudSyncBugReporter:(id)a3;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)bookmarkKeyForSyncType:(int64_t)a3;
- (id)bookmarkKeysForSyncType:(int64_t)a3;
- (id)keysAndProcessorsForAllBookkeeperKeys;
- (id)keysAndProcessorsForBookmarksSync;
- (id)keysAndProcessorsForCriticalBookkeeperKeys;
- (id)keysAndProcessorsForInterestSync;
- (id)keysAndProcessorsForNonFollowedShowsSync;
- (id)keysAndProcessorsForSubscriptionsAndStationsSync;
- (id)keysAndProcessorsForTermsVersionSync;
- (id)subscriptionKeyForSyncType:(int64_t)a3;
- (id)subscriptionKeysForSyncType:(int64_t)a3;
- (void)setCloudSyncBugReporter:(id)a3;
@end

@implementation MTKeyProcessorPairProvider

- (MTKeyProcessorPairProvider)initWithCloudSyncBugReporter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTKeyProcessorPairProvider;
  v6 = -[MTKeyProcessorPairProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudSyncBugReporter, a3);
  }

  return v7;
}

- (id)keysAndProcessorsForAllBookkeeperKeys
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTKeyProcessorPairProvider keysAndProcessorsForCriticalBookkeeperKeys]( self,  "keysAndProcessorsForCriticalBookkeeperKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTKeyProcessorPairProvider keysAndProcessorsForTermsVersionSync]( self,  "keysAndProcessorsForTermsVersionSync"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObjectsFromArray:v4]);

  return v5;
}

- (id)keysAndProcessorsForCriticalBookkeeperKeys
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  unsigned int v4 = [v3 isLibrarySyncEnabled];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTKeyProcessorPairProvider keysAndProcessorsForSubscriptionsAndStationsSync]( self,  "keysAndProcessorsForSubscriptionsAndStationsSync"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTKeyProcessorPairProvider keysAndProcessorsForBookmarksSync]( self,  "keysAndProcessorsForBookmarksSync"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTKeyProcessorPairProvider keysAndProcessorsForNonFollowedShowsSync]( self,  "keysAndProcessorsForNonFollowedShowsSync"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayByAddingObjectsFromArray:v6]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v7]);

    if (+[InterestSyncProcessor canSyncInterests]( &OBJC_CLASS____TtC8Podcasts21InterestSyncProcessor,  "canSyncInterests"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTKeyProcessorPairProvider keysAndProcessorsForInterestSync]( self,  "keysAndProcessorsForInterestSync"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 arrayByAddingObjectsFromArray:v10]);

      objc_super v9 = (void *)v11;
    }
  }

  else
  {
    objc_super v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)keysAndProcessorsForNonFollowedShowsSync
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  unsigned int v3 = [v2 isLibrarySyncEnabled];

  if (!v3) {
    return &__NSArray0__struct;
  }
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts29NonFollowedShowsSyncProcessor);
  id v5 = objc_alloc(&OBJC_CLASS___MTKeyProcessorPair);
  v6 = -[MTKeyProcessorPair initWithKey:processor:](v5, "initWithKey:processor:", kMTNonFollowedShowsSyncKey, v4);
  objc_super v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

- (id)keysAndProcessorsForInterestSync
{
  if (!+[InterestSyncProcessor canSyncInterests]( &OBJC_CLASS____TtC8Podcasts21InterestSyncProcessor,  "canSyncInterests")) {
    return &__NSArray0__struct;
  }
  v2 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts21InterestSyncProcessor);
  unsigned int v3 = objc_alloc(&OBJC_CLASS___MTKeyProcessorPair);
  unsigned int v4 = -[MTKeyProcessorPair initWithKey:processor:](v3, "initWithKey:processor:", kMTInterestSyncKey, v2);
  v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

- (id)keysAndProcessorsForBookmarksSync
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  unsigned int v4 = [v3 isLibrarySyncEnabled];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v6 = 0LL;
    char v7 = 1;
    do
    {
      char v8 = v7;
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider bookmarkKeyForSyncType:](self, "bookmarkKeyForSyncType:", v6));
      v10 = -[MTBookmarksSyncStorage initWithSyncType:]( objc_alloc(&OBJC_CLASS___MTBookmarksSyncStorage),  "initWithSyncType:",  v6);
      uint64_t v11 = objc_alloc(&OBJC_CLASS___MTBookmarksSyncProcessor);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider cloudSyncBugReporter](self, "cloudSyncBugReporter"));
      v13 = -[MTBookmarksSyncProcessor initWithStorageProvider:cloudSyncBugReporter:]( v11,  "initWithStorageProvider:cloudSyncBugReporter:",  v10,  v12);

      v14 = -[MTKeyProcessorPair initWithKey:processor:]( objc_alloc(&OBJC_CLASS___MTKeyProcessorPair),  "initWithKey:processor:",  v9,  v13);
      [v5 addObject:v14];

      char v7 = 0;
      uint64_t v6 = 1LL;
    }

    while ((v8 & 1) != 0);
  }

  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)keysAndProcessorsForTermsVersionSync
{
  v2 = objc_alloc(&OBJC_CLASS___MTTermsVersionSyncProcessor);
  unsigned int v3 = objc_opt_new(&OBJC_CLASS___MTTermsVersionSyncStorage);
  unsigned int v4 = -[MTTermsVersionSyncProcessor initWithStorage:](v2, "initWithStorage:", v3);

  id v5 = objc_alloc(&OBJC_CLASS___MTKeyProcessorPair);
  uint64_t v6 = -[MTKeyProcessorPair initWithKey:processor:](v5, "initWithKey:processor:", kMTTermsVersionKey, v4);
  objc_super v9 = v6;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

- (id)keysAndProcessorsForSubscriptionsAndStationsSync
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  unsigned int v4 = [v3 isLibrarySyncEnabled];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v6 = 0LL;
    char v7 = 1;
    do
    {
      char v8 = v7;
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider subscriptionKeyForSyncType:](self, "subscriptionKeyForSyncType:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTSubscriptionSyncProcessorConfig configWithSupportsMetrics:]( &OBJC_CLASS___MTSubscriptionSyncProcessorConfig,  "configWithSupportsMetrics:",  1LL));
      uint64_t v11 = objc_opt_new(&OBJC_CLASS___MTSubscriptionSyncStorage);
      -[MTSubscriptionSyncStorage setSyncType:](v11, "setSyncType:", v6);
      v12 = objc_alloc(&OBJC_CLASS___MTSubscriptionSyncProcessor);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider cloudSyncBugReporter](self, "cloudSyncBugReporter"));
      v14 = -[MTSubscriptionSyncProcessor initWithStorage:config:cloudSyncBugReporter:]( v12,  "initWithStorage:config:cloudSyncBugReporter:",  v11,  v10,  v13);

      v15 = -[MTKeyProcessorPair initWithKey:processor:]( objc_alloc(&OBJC_CLASS___MTKeyProcessorPair),  "initWithKey:processor:",  v9,  v14);
      [v5 addObject:v15];

      char v7 = 0;
      uint64_t v6 = 1LL;
    }

    while ((v8 & 1) != 0);
    v16 = objc_alloc(&OBJC_CLASS___MTPlaylistSyncProcessor);
    v17 = objc_opt_new(&OBJC_CLASS___MTPlaylistSyncStorage);
    v18 = -[MTPlaylistSyncProcessor initWithStorageProvider:](v16, "initWithStorageProvider:", v17);

    v19 = objc_alloc(&OBJC_CLASS___MTKeyProcessorPair);
    v20 = -[MTKeyProcessorPair initWithKey:processor:](v19, "initWithKey:processor:", kMTPlaylistsKey, v18);
    [v5 addObject:v20];
  }

  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)bookmarkKeysForSyncType:(int64_t)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider bookmarkKeyForSyncType:](self, "bookmarkKeyForSyncType:", a3));
  uint64_t v6 = v3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (id)bookmarkKeyForSyncType:(int64_t)a3
{
  unsigned int v3 = (id *)&kMTBookmarksKey;
  if (a3 == 1) {
    unsigned int v3 = (id *)&kMTBookmarksDRMKey;
  }
  return *v3;
}

- (id)subscriptionKeysForSyncType:(int64_t)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTKeyProcessorPairProvider subscriptionKeyForSyncType:](self, "subscriptionKeyForSyncType:", a3));
  uint64_t v6 = v3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (id)subscriptionKeyForSyncType:(int64_t)a3
{
  unsigned int v3 = (id *)&kMTSubscriptionsKey;
  if (a3 == 1) {
    unsigned int v3 = (id *)&kMTSubscriptionsV3Key;
  }
  return *v3;
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end