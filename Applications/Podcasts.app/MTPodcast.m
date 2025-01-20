@interface MTPodcast
+ (id)allPossibleEpisodeListSortOrderProperties;
+ (id)podcastUuidForFeedUrl:(id)a3 ctx:(id)a4;
+ (id)podcastUuidForFeedUrlString:(id)a3 ctx:(id)a4;
+ (id)predicateForSubscriptionSyncType:(int64_t)a3;
+ (id)predicateForSyncablePodcastsForSyncType:(int64_t)a3;
+ (id)sortDescriptorsForAllPodcasts;
+ (id)sortDescriptorsForDateAddedAscending:(BOOL)a3;
+ (id)sortDescriptorsForFirstTimeAvailableAscending:(BOOL)a3;
+ (id)sortDescriptorsForLastDatePlayed;
+ (id)sortDescriptorsForManualOrder;
+ (id)sortDescriptorsForNewestOnTop;
+ (id)sortDescriptorsForOldestOnTop;
+ (id)sortDescriptorsForRecentlyUnfollowed;
+ (id)sortDescriptorsForRecentlyUpdatedAscending:(BOOL)a3;
+ (id)sortDescriptorsForSortType:(int64_t)a3;
+ (id)sortDescriptorsForTitle:(BOOL)a3;
+ (void)setRemovePlayedDownloadsSetting:(int64_t)a3 forPodcastUuid:(id)a4;
- (BOOL)hasAtLeastOneSeason;
- (BOOL)hasMultipleSeasons;
- (BOOL)isValidShowTypeSetting:(int64_t)a3;
- (BOOL)sortAscending;
- (BOOL)updateCursorPosition:(BOOL)a3;
- (id)_fetchRequestForDistinctSeasons;
- (id)bestDescription;
- (id)countOfNewEpisodes;
- (id)countOfUnplayedEpisodes;
- (id)seasonNumbers;
- (id)seasonSortDescriptorsForSortOrder;
- (id)seasonTrailerInSeason:(int64_t)a3;
- (id)smartPlayEpisode;
- (id)sortDescriptorsForPlayOrder;
- (id)sortDescriptorsForPlayOrderByEpisodeNumber;
- (id)sortDescriptorsForPlayOrderByPubDate;
- (id)sortDescriptorsForSortOrder;
- (unint64_t)countOfUnplayedRssEpisodes;
- (void)_updateChannelRelationship:(id)a3 deassociate:(BOOL)a4;
- (void)applyShowTypeSetting:(int64_t)a3;
- (void)markPlaylistsForUpdate;
- (void)prepareForDeletion;
- (void)setAuthor:(id)a3;
- (void)setChannel:(id)a3;
- (void)setDeletePlayedEpisodes:(int64_t)a3;
- (void)setFeedChangedDate:(double)a3;
- (void)setImageURL:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setLastDatePlayed:(double)a3;
- (void)setLastImplicitlyFollowedDate:(double)a3;
- (void)setModifiedDate:(double)a3;
- (void)setPlaybackNewestToOldest:(BOOL)a3;
- (void)setShowTypeInFeed:(id)a3;
- (void)setShowTypeSetting:(int64_t)a3;
- (void)setSortAscending:(BOOL)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateAvg:(double)a3;
- (void)setUpdateStdDev:(double)a3;
- (void)setUpdatedFeedURL:(id)a3;
- (void)setWebpageURL:(id)a3;
- (void)updateEpisodesMetadataIdentifiers;
@end

@implementation MTPodcast

- (void)setTitle:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast title](self, "title"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self, "title"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastTitle;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastTitle);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      -[MTPodcast updateEpisodesMetadataIdentifiers](self, "updateEpisodesMetadataIdentifiers");
    }
  }
}

- (void)setUpdatedFeedURL:(id)a3
{
  uint64_t v4 = kPodcastUpdatedFeedUrl;
  id v5 = a3;
  -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", v4);
  -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, v4);

  -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v4);
  -[MTPodcast updateEpisodesMetadataIdentifiers](self, "updateEpisodesMetadataIdentifiers");
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v6, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));
}

- (void)setSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MTPodcast subscribed](self, "subscribed") != a3)
  {
    uint64_t v5 = kPodcastSubscribed;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastSubscribed);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v7, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));
  }

- (void)setChannel:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self, "channel"));
  unsigned __int8 v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self, "channel"));
    uint64_t v7 = kPodcastChannel;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastChannel);
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, v7);
    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v7);
    -[MTPodcast setChannelStoreId:](self, "setChannelStoreId:", [v8 storeId]);
    -[MTPodcast _updateChannelRelationship:deassociate:](self, "_updateChannelRelationship:deassociate:", v6, 1LL);
    -[MTPodcast _updateChannelRelationship:deassociate:](self, "_updateChannelRelationship:deassociate:", v8, 0LL);
  }
}

- (void)_updateChannelRelationship:(id)a3 deassociate:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 podcastUuids]);
    v10 = (NSMutableSet *)[v7 mutableCopy];

    id v8 = v10;
    if (!v10) {
      id v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    }
    v11 = v8;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
    if (v4) {
      -[NSMutableSet removeObject:](v11, "removeObject:", v9);
    }
    else {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }

    [v6 setPodcastUuids:v11];
  }

- (void)updateEpisodesMetadataIdentifiers
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast episodes](self, "episodes", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updateUPPIdentifierIfNeeded];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)prepareForDeletion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self, "channel"));
  -[MTPodcast _updateChannelRelationship:deassociate:](self, "_updateChannelRelationship:deassociate:", v3, 1LL);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPodcast;
  -[MTPodcast prepareForDeletion](&v4, "prepareForDeletion");
}

+ (void)setRemovePlayedDownloadsSetting:(int64_t)a3 forPodcastUuid:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100016F34;
  v10[3] = &unk_100240710;
  id v11 = v7;
  id v12 = v5;
  int64_t v13 = a3;
  id v8 = v5;
  id v9 = v7;
  [v9 performBlockAndWaitWithSave:v10];
}

- (id)countOfNewEpisodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcastDerivedPropertyObserver sharedInstance]( &OBJC_CLASS___MTPodcastDerivedPropertyObserver,  "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 countOfNewEpisodesForPodcast:v4]));

  return v5;
}

- (id)countOfUnplayedEpisodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcastDerivedPropertyObserver sharedInstance]( &OBJC_CLASS___MTPodcastDerivedPropertyObserver,  "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 countOfUnplayedEpisodesForPodcast:v4]));

  return v5;
}

- (unint64_t)countOfUnplayedRssEpisodes
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100017160;
  v5[3] = &unk_100240738;
  v5[4] = self;
  __int128 v7 = &v8;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  id v6 = v2;
  [v2 performBlockAndWait:v5];
  unint64_t v3 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v3;
}

- (void)setLastDatePlayed:(double)a3
{
  if (v5 < a3)
  {
    uint64_t v6 = kPodcastLastDatePlayed;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastLastDatePlayed);
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared"));
    [v8 unsafeDidBumpLastDatePlayedFor:self];
  }

- (void)markPlaylistsForUpdate
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast playlistSettings](self, "playlistSettings", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        __int128 v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        [v7 setNeedsUpdate:1];
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
        [v8 setNeedsUpdate:1];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

- (void)setDeletePlayedEpisodes:(int64_t)a3
{
  uint64_t v5 = kPodcastDeletePlayedEpisodes;
  -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastDeletePlayedEpisodes);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

  -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v5);
  -[MTPodcast markPlaylistsForUpdate](self, "markPlaylistsForUpdate");
}

- (void)setLastImplicitlyFollowedDate:(double)a3
{
  if (v5 < a3)
  {
    uint64_t v6 = kPodcastLastImplicitlyFollowedDate;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastLastImplicitlyFollowedDate);
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }

- (void)setModifiedDate:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[FutureDateChecker lenientSharedInstance]( &OBJC_CLASS____TtC18PodcastsFoundation17FutureDateChecker,  "lenientSharedInstance"));
  [v5 timestampBoundByNow:a3];
  double v7 = v6;

  uint64_t v8 = kPodcastModifiedDate;
  -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastModifiedDate);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v7));
  -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);

  -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
}

- (void)setAuthor:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast author](self, "author"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast author](self, "author"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastAuthor;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastAuthor);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }
}

- (void)setItemDescription:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast itemDescription](self, "itemDescription"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast itemDescription](self, "itemDescription"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastDescription;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastDescription);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }
}

- (void)setFeedChangedDate:(double)a3
{
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    uint64_t v6 = kPodcastFeedChangedDate;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastFeedChangedDate);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }

- (void)setUpdateStdDev:(double)a3
{
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    uint64_t v6 = kPodcastUpdateStdDev;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastUpdateStdDev);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }

- (void)setUpdateAvg:(double)a3
{
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    uint64_t v6 = kPodcastUpdateAvg;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastUpdateAvg);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }

- (void)setImageURL:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self, "imageURL"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self, "imageURL"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastImageUrl;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastImageUrl);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }
}

- (void)setShowTypeInFeed:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast showTypeInFeed](self, "showTypeInFeed"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast showTypeInFeed](self, "showTypeInFeed"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastShowTypeInFeed;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastShowTypeInFeed);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }
}

- (void)setWebpageURL:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast webpageURL](self, "webpageURL"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast webpageURL](self, "webpageURL"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastWebpageURL;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastWebpageURL);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }
}

- (BOOL)isValidShowTypeSetting:(int64_t)a3
{
  return ((unint64_t)a3 < 5) & (0x16u >> a3);
}

- (void)setShowTypeSetting:(int64_t)a3
{
  if (-[MTPodcast showTypeSetting](self, "showTypeSetting") != (id)a3)
  {
    BOOL v5 = -[MTPodcast isValidShowTypeSetting:](self, "isValidShowTypeSetting:", a3);
    BOOL v6 = v5;
    uint64_t v7 = _MTLogCategoryDatabase(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self, "title"));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast feedURL](self, "feedURL"));
        id v12 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
        int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
        int v16 = 134350083;
        int64_t v17 = a3;
        __int16 v18 = 2113;
        v19 = v10;
        __int16 v20 = 2113;
        v21 = v11;
        __int16 v22 = 2049;
        id v23 = v12;
        __int16 v24 = 2114;
        v25 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Switching show type setting to %{public}lld, show %{private}@, %{private}@, %{private}lld, %{public}@",  (uint8_t *)&v16,  0x34u);
      }

      uint64_t v14 = kPodcastShowTypeSetting;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastShowTypeSetting);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v15, v14);

      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v14);
      -[MTPodcast applyShowTypeSetting:](self, "applyShowTypeSetting:", a3);
    }

    else
    {
      if (v9)
      {
        LOWORD(v16) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WARNING: Ignoring attempt to set an invalid show type",  (uint8_t *)&v16,  2u);
      }
    }
  }

- (void)applyShowTypeSetting:(int64_t)a3
{
  id v4 = +[MTPodcast sortOrderAscForShowType:](&OBJC_CLASS___MTPodcast, "sortOrderAscForShowType:", a3);
  int v5 = (int)v4;
  -[MTPodcast setSortAscending:](self, "setSortAscending:", v4);
  -[MTPodcast setPlaybackNewestToOldest:](self, "setPlaybackNewestToOldest:", v5 ^ 1u);
}

- (void)setSortAscending:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = _MTLogCategoryDatabase(self);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      uint64_t v7 = @"true";
    }
    else {
      uint64_t v7 = @"false";
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self, "title"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast feedURL](self, "feedURL"));
    id v10 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
    int v15 = 138544387;
    int v16 = v7;
    __int16 v17 = 2113;
    __int16 v18 = v8;
    __int16 v19 = 2113;
    __int16 v20 = v9;
    __int16 v21 = 2049;
    id v22 = v10;
    __int16 v23 = 2114;
    __int16 v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Switching SortAscendingFlag to %{public}@, show %{private}@, %{private}@, %{private}lld, %{public}@",  (uint8_t *)&v15,  0x34u);
  }

  unint64_t v12 = (unint64_t)-[MTPodcast flags](self, "flags");
  if (((((v12 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v13 = 2LL;
    if (!v3) {
      uint64_t v13 = 0LL;
    }
    -[MTPodcast setFlags:](self, "setFlags:", v12 & 0xFFFFFFFFFFFFFFFDLL | v13);
    -[MTPodcast markPlaylistsForUpdate](self, "markPlaylistsForUpdate");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v14, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));
  }

- (BOOL)sortAscending
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 1) & 1;
}

+ (id)allPossibleEpisodeListSortOrderProperties
{
  __int16 v19 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  uint64_t v21 = kEpisodePubDate;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:"));
  v23[0] = v2;
  uint64_t v3 = kEpisodeEpisodeNumber;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  1LL));
  v23[1] = v4;
  uint64_t v5 = kEpisodeLevel;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  0LL));
  v23[2] = v6;
  uint64_t v7 = kEpisodeTitle;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
  v23[3] = v8;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 4LL));
  __int16 v20 = -[NSMutableArray initWithArray:](v19, "initWithArray:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v21,  0LL));
  v22[0] = v10;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v3,  0LL));
  v22[1] = v11;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v5,  1LL));
  v22[2] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  v7,  1LL,  "localizedStandardCompare:"));
  v22[3] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL));
  -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v14);

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray mt_compactMap:](v20, "mt_compactMap:", &stru_100241BE8));
  int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);

  return v17;
}

- (id)sortDescriptorsForSortOrder
{
  if (-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed")) {
    return (id)objc_claimAutoreleasedReturnValue( -[MTPodcast seasonSortDescriptorsForSortOrder]( self,  "seasonSortDescriptorsForSortOrder"));
  }
  unsigned __int8 v4 = -[MTPodcast sortAscending](self, "sortAscending");
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  if ((v4 & 1) != 0)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  1LL));
    v14[0] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  1LL));
    v14[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  0LL));
    v14[2] = v8;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
    v14[3] = v9;
    id v10 = v14;
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  0LL));
    v13[0] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  0LL));
    v13[1] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  1LL));
    v13[2] = v8;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
    v13[3] = v9;
    id v10 = v13;
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 4LL));
  unint64_t v12 = -[NSMutableArray initWithArray:](v5, "initWithArray:", v11);

  return v12;
}

- (id)seasonSortDescriptorsForSortOrder
{
  return +[MTEpisode seasonSortDescriptors:]( &OBJC_CLASS___MTEpisode,  "seasonSortDescriptors:",  -[MTPodcast showTypeSetting](self, "showTypeSetting"));
}

+ (id)sortDescriptorsForOldestOnTop
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  1LL));
  v8[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  1LL));
  v8[1] = v3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  0LL));
  v8[2] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
  v8[3] = v5;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return v6;
}

+ (id)sortDescriptorsForNewestOnTop
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  0LL));
  v8[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  0LL));
  v8[1] = v3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  1LL));
  v8[2] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
  v8[3] = v5;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return v6;
}

- (id)sortDescriptorsForPlayOrder
{
  if ((-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed") & 1) != 0) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcast sortDescriptorsForPlayOrderByEpisodeNumber]( self,  "sortDescriptorsForPlayOrderByEpisodeNumber"));
  }
  else {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast sortDescriptorsForPlayOrderByPubDate](self, "sortDescriptorsForPlayOrderByPubDate"));
  }
  return v3;
}

- (id)sortDescriptorsForPlayOrderByPubDate
{
  id v3 = -[MTPodcast playbackNewestToOldest](self, "playbackNewestToOldest");
  unsigned __int8 v4 = (void *)objc_opt_class(self);
  return _[v4 sortDescriptorsForNewestToOldest:v3];
}

- (id)sortDescriptorsForPlayOrderByEpisodeNumber
{
  return +[MTEpisode seasonSortDescriptors:]( &OBJC_CLASS___MTEpisode,  "seasonSortDescriptors:",  -[MTPodcast showTypeSetting](self, "showTypeSetting"));
}

- (void)setPlaybackNewestToOldest:(BOOL)a3
{
  int v3 = a3;
  unsigned int v5 = -[MTPodcast playbackNewestToOldest](self, "playbackNewestToOldest");
  unint64_t v6 = (unint64_t)-[MTPodcast flags](self, "flags");
  if (((((v6 & 8) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v7 = 8LL;
    if (!v3) {
      uint64_t v7 = 0LL;
    }
    -[MTPodcast setFlags:](self, "setFlags:", v6 & 0xFFFFFFFFFFFFFFF7LL | v7);
    -[MTPodcast markPlaylistsForUpdate](self, "markPlaylistsForUpdate");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v8, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));

    if (v5 != v3) {
      -[MTPodcast updateCursorPosition:](self, "updateCursorPosition:", 0LL);
    }
  }

- (BOOL)updateCursorPosition:(BOOL)a3
{
  uint64_t v11 = 0LL;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004B774;
  v7[3] = &unk_100241C10;
  v7[4] = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  id v8 = v4;
  BOOL v9 = &v11;
  BOOL v10 = a3;
  [v4 performBlockAndWait:v7];
  char v5 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v5;
}

+ (id)podcastUuidForFeedUrlString:(id)a3 ctx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v13 = 0LL;
    char v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    int v16 = sub_10004BB3C;
    __int16 v17 = sub_10004BB4C;
    id v18 = 0LL;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10004BB54;
    v9[3] = &unk_100240558;
    id v10 = v6;
    id v11 = v5;
    unint64_t v12 = &v13;
    [v10 performBlockAndWait:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)podcastUuidForFeedUrl:(id)a3 ctx:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 podcastUuidForFeedUrlString:v7 ctx:v6]);

  return v8;
}

- (id)smartPlayEpisode
{
  if ((-[MTPodcast subscribed](self, "subscribed") & 1) != 0
    || !-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed")
    || (uint64_t)-[MTPodcast latestSeasonNumber](self, "latestSeasonNumber") < 1
    || (-[MTPodcast lastDatePlayed](self, "lastDatePlayed"), v3 != 0.0)
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcast seasonTrailerInSeason:]( self,  "seasonTrailerInSeason:",  -[MTPodcast latestSeasonNumber](self, "latestSeasonNumber")))) == 0LL)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast nextEpisodeUuid](self, "nextEpisodeUuid"));

    if (!v5
      || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext")),
          id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast nextEpisodeUuid](self, "nextEpisodeUuid")),
          id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeForUuid:v7]),
          v7,
          v6,
          !v4))
    {
      id v8 = (void *)objc_opt_new(&OBJC_CLASS___MTPodcastEpisodeFilter);
      [v8 setExcludeUnentitled:1];
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast newestEpisodeWithFilter:](self, "newestEpisodeWithFilter:", v8));
    }
  }

  return v4;
}

- (id)_fetchRequestForDistinctSeasons
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:",  v2));

  uint64_t v4 = kEpisodeSeasonNumber;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeSeasonNumber,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  [v6 setResultType:2];
  uint64_t v11 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v6 setPropertiesToFetch:v7];

  [v6 setReturnsDistinctResults:1];
  [v6 setPredicate:v3];
  id v10 = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  [v6 setSortDescriptors:v8];

  return v6;
}

- (BOOL)hasAtLeastOneSeason
{
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004BF34;
  v5[3] = &unk_100240738;
  v5[4] = self;
  id v7 = &v8;
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  id v6 = v2;
  [v2 performBlockAndWait:v5];
  char v3 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v3;
}

- (BOOL)hasMultipleSeasons
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast seasonNumbers](self, "seasonNumbers"));
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)seasonNumbers
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  unint64_t v12 = sub_10004BB3C;
  uint64_t v13 = sub_10004BB4C;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004C15C;
  v6[3] = &unk_100240558;
  v6[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  id v7 = v3;
  uint64_t v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)seasonTrailerInSeason:(int64_t)a3
{
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___MTPodcastEpisodeFilter);
  uint64_t v18 = 0LL;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_10004BB3C;
  id v22 = sub_10004BB4C;
  id v23 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004C33C;
  v12[3] = &unk_100241C38;
  id v7 = v5;
  id v13 = v7;
  id v14 = self;
  int v16 = &v18;
  int64_t v17 = a3;
  id v8 = v6;
  id v15 = v8;
  [v8 performBlockAndWait:v12];
  uint64_t v9 = (void *)v19[5];
  if (v9) {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  }
  else {
    uint64_t v10 = 0LL;
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)bestDescription
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast itemDescription](self, "itemDescription"));
  if ([v2 hasHTML])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 stringBySmartlyStrippingHTML]);

    id v2 = (void *)v3;
  }

  return v2;
}

+ (id)predicateForSyncablePodcastsForSyncType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForNotHiddenNotImplicitlyFollowedPodcasts]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSubscriptionSyncType:]( &OBJC_CLASS___MTPodcast,  "predicateForSubscriptionSyncType:",  a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 AND:v5]);

  return v6;
}

+ (id)predicateForSubscriptionSyncType:(int64_t)a3
{
  uint64_t v4 = kPodcastDisplayType;
  uint64_t v5 = NSPersistentStringForMTDisplayType(0LL, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v8 = NSPersistentStringForMTDisplayType(2LL, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) || (%K == %@) || (%K == NULL)",  v4,  v6,  v4,  v9,  v4));

  if (a3 == 1)
  {
    uint64_t v12 = NSPersistentStringForMTDisplayType(1LL, v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  v4,  v13));
  }

  else
  {
    id v14 = v10;
  }

  return v14;
}

+ (id)sortDescriptorsForSortType:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast sortDescriptorsForManualOrder]( &OBJC_CLASS___MTPodcast,  "sortDescriptorsForManualOrder"));
      return v3;
    case 1LL:
      uint64_t v4 = 0LL;
      goto LABEL_5;
    case 2LL:
      uint64_t v4 = 1LL;
LABEL_5:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast sortDescriptorsForDateAddedAscending:]( &OBJC_CLASS___MTPodcast,  "sortDescriptorsForDateAddedAscending:",  v4));
      return v3;
    case 4LL:
      uint64_t v5 = 0LL;
      goto LABEL_8;
    case 5LL:
      uint64_t v6 = 0LL;
      goto LABEL_12;
    case 6LL:
      uint64_t v6 = 1LL;
LABEL_12:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast sortDescriptorsForFirstTimeAvailableAscending:]( &OBJC_CLASS___MTPodcast,  "sortDescriptorsForFirstTimeAvailableAscending:",  v6));
      break;
    case 7LL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast sortDescriptorsForRecentlyUnfollowed]( &OBJC_CLASS___MTPodcast,  "sortDescriptorsForRecentlyUnfollowed"));
      break;
    default:
      uint64_t v5 = 1LL;
LABEL_8:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForTitle:](&OBJC_CLASS___MTPodcast, "sortDescriptorsForTitle:", v5));
      break;
  }

  return v3;
}

+ (id)sortDescriptorsForManualOrder
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastSortOrder,  0LL));
  v6[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastSubscribed,  0LL));
  v6[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

+ (id)sortDescriptorsForAllPodcasts
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MTShowsPreferencesDataStore sharedInstance]( &OBJC_CLASS___MTShowsPreferencesDataStore,  "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortDescriptors]);

  return v3;
}

+ (id)sortDescriptorsForLastDatePlayed
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastLastDatePlayed,  0LL));
  uint64_t v5 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

+ (id)sortDescriptorsForRecentlyUpdatedAscending:(BOOL)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastFeedChangedDate,  a3));
  v7[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kPodcastTitle,  0LL,  "localizedStandardCompare:"));
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

+ (id)sortDescriptorsForFirstTimeAvailableAscending:(BOOL)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastLatestEpisodeAvailabilityTime,  a3));
  v7[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kPodcastTitle,  0LL,  "localizedStandardCompare:"));
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

+ (id)sortDescriptorsForDateAddedAscending:(BOOL)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastAddedDate,  a3));
  v7[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kPodcastTitle,  0LL,  "localizedStandardCompare:"));
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

+ (id)sortDescriptorsForRecentlyUnfollowed
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kLastUnfollowedDate,  0LL));
  v6[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kPodcastTitle,  0LL,  "localizedStandardCompare:"));
  v6[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

+ (id)sortDescriptorsForTitle:(BOOL)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kPodcastTitle,  a3,  "localizedStandardCompare:"));
  v7[0] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kPodcastUpdatedDate,  0LL));
  v7[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

@end