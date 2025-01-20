@interface MTSubscriptionSyncStorage
+ (void)resetAllSubscriptionsSyncKeys;
+ (void)resetForSyncType:(int64_t)a3;
- (BOOL)syncDirtyFlag;
- (MTSubscriptionSyncStorage)init;
- (NSString)podcastsDomainVersion;
- (NSString)syncVersion;
- (double)subscriptionsLastSyncTimestamp;
- (id)importContext;
- (int64_t)syncType;
- (void)cleanUpOldHiddenPodcasts;
- (void)disableSubscriptionsWithUuids:(id)a3 ctx:(id)a4;
- (void)enableSubscriptionOnPodcastUuid:(id)a3 ctx:(id)a4;
- (void)immediatelyDeleteAllHiddenPodcasts;
- (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5;
- (void)setPodcastsDomainVersion:(id)a3;
- (void)setSyncDirtyFlag:(BOOL)a3;
- (void)setSyncType:(int64_t)a3;
- (void)setSyncVersion:(id)a3;
- (void)updateSubscriptionsLastSyncTimestamp;
@end

@implementation MTSubscriptionSyncStorage

- (MTSubscriptionSyncStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTSubscriptionSyncStorage;
  v2 = -[MTSubscriptionSyncStorage init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v2->_cloudSyncBugReporter;
    v2->_cloudSyncBugReporter = v3;
  }

  return v2;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v4 setPodcastsDomainVersion:v3];
}

- (NSString)podcastsDomainVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 podcastsDomainVersion]);

  return (NSString *)v3;
}

- (void)setSyncDirtyFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v5, "markSubscriptionSyncDirty:for:", v3, -[MTSubscriptionSyncStorage syncType](self, "syncType"));
}

- (BOOL)syncDirtyFlag
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  LOBYTE(self) = objc_msgSend( v3,  "isSubscriptionSyncDirtyFor:",  -[MTSubscriptionSyncStorage syncType](self, "syncType"));

  return (char)self;
}

- (double)subscriptionsLastSyncTimestamp
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v3, "subscriptionsLastSyncTimestampFor:", -[MTSubscriptionSyncStorage syncType](self, "syncType"));
  double v5 = v4;

  return v5;
}

- (void)updateSubscriptionsLastSyncTimestamp
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v3, "updateSubscriptionsLastSyncTimestampFor:", -[MTSubscriptionSyncStorage syncType](self, "syncType"));
}

- (NSString)syncVersion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "subscriptionsSyncVersionFor:",  -[MTSubscriptionSyncStorage syncType](self, "syncType")));

  return (NSString *)v4;
}

- (void)setSyncVersion:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend( v5,  "updateSubscriptionsSyncVersionFor:newValue:",  -[MTSubscriptionSyncStorage syncType](self, "syncType"),  v4);

  -[objc_class didUpdateSubscriptionsSyncVersionForSyncType:]( +[SyncControllerFactory resolvedSyncClass](&OBJC_CLASS____TtC8Podcasts21SyncControllerFactory, "resolvedSyncClass"),  "didUpdateSubscriptionsSyncVersionForSyncType:",  -[MTSubscriptionSyncStorage syncType](self, "syncType"));
}

+ (void)resetAllSubscriptionsSyncKeys
{
}

+ (void)resetForSyncType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v4 resetSubscriptionsSyncVersionFor:a3];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v5 markSubscriptionSyncDirty:1 for:a3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v6 resetSubscriptionsLastSyncTimestampFor:a3];
}

- (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5
{
}

- (void)cleanUpOldHiddenPodcasts
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
  [v2 cleanUpOldHiddenPodcasts];
}

- (void)immediatelyDeleteAllHiddenPodcasts
{
  uint64_t v3 = os_feature_enabled_recently_unfollowed(self, a2);
  if ((_DWORD)v3)
  {
    uint64_t v4 = _MTLogCategoryCloudSync(v3);
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "This device is at the same time in read-only sync mode AND is supposed to have a Recently Unfollowed feature. Th is is a programming error and will break Recently Unfollowed badly.",  v7,  2u);
    }

    -[CloudSyncBugReporter report:userInfo:](self->_cloudSyncBugReporter, "report:userInfo:", 5LL, 0LL);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
  [v6 immediatelyDeleteAllHiddenPodcasts];
}

- (void)enableSubscriptionOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  [v7 unsafeEnableSubscriptionOnPodcastUUID:v6 from:0 context:v5];
}

- (void)disableSubscriptionsWithUuids:(id)a3 ctx:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  [v7 disableSubscriptionsOnPodcastUUIDs:v6 from:0 context:v5];
}

- (id)importContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 importContext]);

  return v3;
}

- (int64_t)syncType
{
  return self->syncType;
}

- (void)setSyncType:(int64_t)a3
{
  self->syncType = a3;
}

- (void).cxx_destruct
{
}

@end