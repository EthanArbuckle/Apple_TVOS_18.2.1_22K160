@interface MTFeedIngester
+ (BOOL)_fetchSmallestPicturePossible;
+ (unint64_t)_maxArtworkSize;
+ (unint64_t)_offerTypesAsFlagBits:(id)a3;
+ (void)_markEpisodeAsFirstSeen:(id)a3;
+ (void)_markLatestEpisodeAsUnplayedIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4;
+ (void)_recalculateEpisodeLevel:(id)a3 episodeLevelCalculator:(id)a4 ctx:(id)a5;
+ (void)_sendNotificationForNewlyEntitledEpisodesIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 ctx:(id)a6;
+ (void)_unsafeFinalizeIngestion:(id)a3 episodeLevelCalculator:(id)a4 storeInfoUpdater:(id)a5 updateAverageCalculator:(id)a6 ctx:(id)a7 didUpdateAnyEpisodes:(BOOL)a8 newlyEntitledEpisodeUUIDs:(id)a9;
- (BOOL)_localPodcastExists;
- (BOOL)canSendNotifications;
- (BOOL)didUpdateFeedUrl;
- (BOOL)shouldMarkPlaylistsForUpdate;
- (BOOL)unsafeIngestShow:(id)a3;
- (MTCategoryIngesterProtocol)categoryIngester;
- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator;
- (MTFeedIngester)initWithPodcast:(id)a3 ctx:(id)a4 storeInfoUpdater:(id)a5 imageDownloader:(id)a6 imageStore:(id)a7 syncController:(id)a8 library:(id)a9 downloadManager:(id)a10 episodeLevelCalculator:(id)a11 categoryIngester:(id)a12 feedUpdateSource:(int64_t)a13 updaterJobUUID:(id)a14 canSendNotifications:(BOOL)a15;
- (MTFeedIngesterDownloadManagerProtocol)downloadManager;
- (MTFeedIngesterImageDownloaderProtocol)imageDownloader;
- (MTFeedIngesterLibraryProtocol)library;
- (MTImageStoreProtocol)imageStore;
- (MTPodcast)localPodcast;
- (MTPodcastUpdateAverageCalculator)updateAverageCalculator;
- (MTStoreInfoUpdaterProtocol)storeInfoUpdater;
- (MTSyncControllerProtocol)syncController;
- (NSManagedObjectContext)ctx;
- (NSMutableSet)newlyEntitledEpisodeUUIDs;
- (NSMutableSet)updatedEpisodeUUIDs;
- (NSString)updaterJobUUID;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration;
- (double)latestEpisodeDate;
- (id)_unsafeIngestEpisode:(id)a3 localEpisode:(id)a4 isNew:(BOOL)a5;
- (id)unsafeIngestEpisode:(id)a3 localEpisode:(id)a4;
- (id)unsafeIngestNewEpisode:(id)a3;
- (int64_t)feedUpdateSource;
- (int64_t)itemsDeleted;
- (int64_t)itemsIngested;
- (int64_t)itemsInserted;
- (void)_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:(id)a3 isNewEpisodeToCurrentDevice:(BOOL)a4 oldIsEntitled:(BOOL)a5 oldEnclosureURL:(id)a6 oldPriceType:(id)a7;
- (void)_reportMetrics;
- (void)_setAttributesOfLocalEpisode:(id)a3 feedEpisode:(id)a4;
- (void)_setPodcastArtwork:(id)a3;
- (void)_updatePodcastArtworksIfNeeded;
- (void)setCanSendNotifications:(BOOL)a3;
- (void)setDidUpdateFeedUrl:(BOOL)a3;
- (void)setDownloadManager:(id)a3;
- (void)setFeedUpdateSource:(int64_t)a3;
- (void)setItemsDeleted:(int64_t)a3;
- (void)setItemsIngested:(int64_t)a3;
- (void)setItemsInserted:(int64_t)a3;
- (void)setLatestEpisodeDate:(double)a3;
- (void)setShouldMarkPlaylistsForUpdate:(BOOL)a3;
- (void)setUpdaterJobUUID:(id)a3;
- (void)unsafeDeleteFeedDeletedEpisode:(id)a3;
- (void)unsafeFinalizeIngestion;
- (void)unsafeIngestPage;
@end

@implementation MTFeedIngester

- (MTFeedIngester)initWithPodcast:(id)a3 ctx:(id)a4 storeInfoUpdater:(id)a5 imageDownloader:(id)a6 imageStore:(id)a7 syncController:(id)a8 library:(id)a9 downloadManager:(id)a10 episodeLevelCalculator:(id)a11 categoryIngester:(id)a12 feedUpdateSource:(int64_t)a13 updaterJobUUID:(id)a14 canSendNotifications:(BOOL)a15
{
  id v43 = a3;
  id v42 = a4;
  id v33 = a5;
  id v41 = a5;
  id v40 = a6;
  id v34 = a7;
  id v39 = a7;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a14;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___MTFeedIngester;
  v23 = -[MTFeedIngester init](&v44, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_ctx, a4);
    objc_storeStrong((id *)&v24->_localPodcast, a3);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    newlyEntitledEpisodeUUIDs = v24->_newlyEntitledEpisodeUUIDs;
    v24->_newlyEntitledEpisodeUUIDs = (NSMutableSet *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    updatedEpisodeUUIDs = v24->_updatedEpisodeUUIDs;
    v24->_updatedEpisodeUUIDs = (NSMutableSet *)v27;

    v24->_latestEpisodeDate = 0.0;
    v24->_shouldMarkPlaylistsForUpdate = 0;
    objc_storeStrong((id *)&v24->_storeInfoUpdater, v33);
    objc_storeStrong((id *)&v24->_imageDownloader, a6);
    objc_storeStrong((id *)&v24->_imageStore, v34);
    objc_storeStrong((id *)&v24->_syncController, a8);
    objc_storeStrong((id *)&v24->_library, a9);
    objc_storeStrong((id *)&v24->_downloadManager, a10);
    objc_storeStrong((id *)&v24->_episodeLevelCalculator, a11);
    objc_storeStrong((id *)&v24->_categoryIngester, a12);
    v24->_feedUpdateSource = a13;
    objc_storeStrong((id *)&v24->_updaterJobUUID, a14);
    v24->_itemsInserted = 0LL;
    v24->_itemsIngested = 0LL;
    v24->_itemsDeleted = 0LL;
    v24->_canSendNotifications = a15;
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[FeedManagerLocalConfiguration platformSpecificConfiguration]( &OBJC_CLASS____TtC18PodcastsFoundation29FeedManagerLocalConfiguration,  "platformSpecificConfiguration"));
    configuration = v24->_configuration;
    v24->_configuration = (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration *)v29;
  }

  return v24;
}

- (id)unsafeIngestNewEpisode:(id)a3
{
  id v4 = a3;
  if (-[MTFeedIngester _localPodcastExists](self, "_localPodcastExists"))
  {
    -[MTSyncControllerProtocol setUppSyncDirtyFlag:](self->_syncController, "setUppSyncDirtyFlag:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:]( &OBJC_CLASS___MTEpisode,  "insertNewEpisodeInManagedObjectContext:canSendNotifications:",  self->_ctx,  self->_canSendNotifications));
    [v5 setPodcast:self->_localPodcast];
    [v5 setImportSource:2];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pubDate]);
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;
    -[MTPodcast addedDate](self->_localPodcast, "addedDate");
    double v10 = v9;

    unsigned int v11 = -[MTPodcast importing](self->_localPodcast, "importing");
    if (v8 < v10) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    if ((v12 & 1) != 0 || (-[MTPodcast subscribed](self->_localPodcast, "subscribed") & 1) == 0)
    {
      id v13 = [v5 metadataTimestamp];
      double v15 = v14;
      uint64_t updated = _MTLogCategoryFeedUpdateIngester(v13);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15 == 0.0)
      {
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
          unsigned int v22 = [v5 sentNotification];
          unsigned int v23 = -[MTPodcast importing](self->_localPodcast, "importing");
          int v42 = 138544642;
          id v43 = v19;
          __int16 v44 = 2112;
          v45 = v20;
          __int16 v46 = 2114;
          v47 = v21;
          __int16 v48 = 1024;
          unsigned int v49 = v22;
          __int16 v50 = 1024;
          int v51 = v12;
          __int16 v52 = 1024;
          unsigned int v53 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ Marking new feed episode as backCatalog. %{public}@, sentNotification: %d, isEpisodePublishe dBeforeAddedDate: %d, podcastIsImporting: %d",  (uint8_t *)&v42,  0x32u);
        }

        [v5 setPlayState:0 manually:1 source:6];
        [v5 setBackCatalog:1];
        [v5 setMetadataTimestamp:0.0];
        [v5 setMetadataFirstSyncEligible:0];
      }

      else
      {
        if (v18)
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
          unsigned int v32 = [v5 sentNotification];
          unsigned int v33 = -[MTPodcast importing](self->_localPodcast, "importing");
          [v5 metadataTimestamp];
          int v42 = 138544898;
          id v43 = v29;
          __int16 v44 = 2112;
          v45 = v30;
          __int16 v46 = 2114;
          v47 = v31;
          __int16 v48 = 1024;
          unsigned int v49 = v32;
          __int16 v50 = 1024;
          int v51 = v12;
          __int16 v52 = 1024;
          unsigned int v53 = v33;
          __int16 v54 = 2048;
          uint64_t v55 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ New feed episode already has a metadataTimestamp. Setting isNew to false. %{public}@, sentNo tification: %d, isEpisodePublishedBeforeAddedDate: %d, podcastIsImporting: %d, metadataTimestamp: %f",  (uint8_t *)&v42,  0x3Cu);
        }

        [v5 setIsNew:0];
      }

      [v5 suppressAutomaticDownloadsIfNeeded];
    }

    uint64_t v35 = _MTLogCategoryFeedUpdateIngester( objc_msgSend( v5,  "setEpisodeLevel:",  +[MTEpisodeLevelCalculator uncalculatedLevel](MTEpisodeLevelCalculator, "uncalculatedLevel")));
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      unsigned int v40 = [v5 sentNotification];
      int v42 = 138544130;
      id v43 = v37;
      __int16 v44 = 2112;
      v45 = v38;
      __int16 v46 = 2114;
      v47 = v39;
      __int16 v48 = 1024;
      unsigned int v49 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ new episode %{public}@, sentNotification: %d",  (uint8_t *)&v42,  0x26u);
    }

    ++self->_itemsInserted;
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[MTFeedIngester _unsafeIngestEpisode:localEpisode:isNew:]( self,  "_unsafeIngestEpisode:localEpisode:isNew:",  v4,  v5,  1LL));
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeStoreId]);
    id v25 = [v24 longLongValue];

    uint64_t v26 = ((uint64_t (*)(void))_MTLogCategoryFeedUpdateIngester)();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v25));
      int v42 = 138412290;
      id v43 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "%@ - could not ingest new feed episode because ingester local podcast does not exist",  (uint8_t *)&v42,  0xCu);
    }

    v28 = 0LL;
  }

  return v28;
}

- (id)unsafeIngestEpisode:(id)a3 localEpisode:(id)a4
{
  return -[MTFeedIngester _unsafeIngestEpisode:localEpisode:isNew:]( self,  "_unsafeIngestEpisode:localEpisode:isNew:",  a3,  a4,  0LL);
}

- (id)_unsafeIngestEpisode:(id)a3 localEpisode:(id)a4 isNew:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t updated = _MTLogCategoryFeedUpdateIngester(v9);
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 podcast]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v9 podcast]);
    id v88 = v8;
    double v15 = self;
    BOOL v16 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
    *(_DWORD *)buf = 138544130;
    v90 = v13;
    __int16 v91 = 2112;
    id v92 = v17;
    __int16 v93 = 2114;
    v94 = v18;
    __int16 v95 = 2112;
    v96 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ updating episode %{public}@ - %@",  buf,  0x2Au);

    BOOL v5 = v16;
    self = v15;
    id v8 = v88;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 podcast]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uuid]);
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
  unsigned __int8 v23 = [v21 isEqualToString:v22];

  if ((v23 & 1) != 0)
  {
    -[MTFeedIngester _setAttributesOfLocalEpisode:feedEpisode:]( self,  "_setAttributesOfLocalEpisode:feedEpisode:",  v9,  v8);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self->_localPodcast, "channel"));

    if (v25)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast channel](self->_localPodcast, "channel"));
      unsigned int v27 = [v26 subscriptionActive];
    }

    else
    {
      unsigned int v27 = 0;
    }

    id v37 = [v9 isEntitled];
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 priceType]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v9 enclosureURL]);
    [v8 entitledDuration];
    if (v39 > 0.0)
    {
      [v8 entitledDuration];
      objc_msgSend(v9, "setEntitledDuration:");
    }

    [v8 duration];
    if (v40 > 0.0)
    {
      [v8 duration];
      objc_msgSend(v9, "setFreeDuration:");
    }

    id v41 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledEnclosureURL]);
    [v9 setEntitledEnclosureURL:v41];

    int v42 = (void *)objc_claimAutoreleasedReturnValue([v8 resolvedEnclosureUrl]);
    [v9 setFreeEnclosureURL:v42];

    id v43 = (void *)objc_claimAutoreleasedReturnValue([v8 priceType]);
    [v9 setFreePriceType:v43];

    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledPriceType]);
    [v9 setEntitledPriceType:v44];

    v45 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledTranscriptIdentifier]);
    [v9 setEntitledTranscriptIdentifier:v45];

    __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v8 freeTranscriptIdentifier]);
    [v9 setFreeTranscriptIdentifier:v46];

    v47 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledTranscriptSnippet]);
    [v9 setEntitledTranscriptSnippet:v47];

    __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v8 freeTranscriptSnippet]);
    [v9 setFreeTranscriptSnippet:v48];

    unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledTranscriptProvider]);
    [v9 setEntitledTranscriptProvider:v49];

    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v8 freeTranscriptProvider]);
    [v9 setFreeTranscriptProvider:v50];

    if (v27)
    {
      [v8 entitledDuration];
      if (v51 > 0.0)
      {
        [v8 entitledDuration];
        objc_msgSend(v9, "setDuration:");
      }

      __int16 v52 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledEnclosureURL]);

      if (v52)
      {
        unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledEnclosureURL]);
        [v9 setEnclosureURL:v53];
      }

      __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v8 entitledPriceType]);
      [v9 setPriceType:v54];

      uint64_t v55 = objc_claimAutoreleasedReturnValue([v8 entitledTranscriptIdentifier]);
    }

    else
    {
      [v9 freeDuration];
      if (v56 > 0.0 && [v9 allowsDurationUpdateFromSource:6])
      {
        [v9 freeDuration];
        objc_msgSend(v9, "setDuration:");
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue([v9 freeEnclosureURL]);
      [v9 setEnclosureURL:v57];

      v58 = (void *)objc_claimAutoreleasedReturnValue([v9 freePriceType]);
      [v9 setPriceType:v58];

      uint64_t v55 = objc_claimAutoreleasedReturnValue([v9 freeTranscriptIdentifier]);
    }

    v59 = (void *)v55;
    [v9 setTranscriptIdentifier:v55];

    -[MTFeedIngester _handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:isNewEpisodeToCurrentDevice:oldIsEntitled:oldEnclosureURL:oldPriceType:]( self,  "_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:isNewEpisodeToCurrentDevice:oldIsEntitled:oldEnclosureURL:oldPriceType:",  v9,  v5,  v37,  v38,  v29);
    if (v5)
    {
      uint64_t v60 = _MTLogCategoryFeedUpdateIngester([v9 updateEntitlementState]);
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        id v63 = [v9 entitlementState];
        *(_DWORD *)buf = 138543618;
        v90 = v62;
        __int16 v91 = 2048;
        id v92 = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - set entitlement state for inserted episode to %lld for new episode from unsafeIngestEpisode",  buf,  0x16u);
      }
    }

    v64 = (void *)objc_claimAutoreleasedReturnValue([v8 pubDate]);
    [v64 timeIntervalSinceReferenceDate];
    double v66 = v65;
    -[MTPodcast addedDate](self->_localPodcast, "addedDate");
    double v68 = v67;

    if (v5 && v66 >= v68)
    {
      if ([v9 isEntitled])
      {
        id v69 = -[MTPodcast isDark](self->_localPodcast, "isDark");
        v70 = (char *)-[MTPodcast darkCount](self->_localPodcast, "darkCount") + 1;
        -[MTPodcast setDarkCount:](self->_localPodcast, "setDarkCount:", v70);
        -[MTPodcast setDarkCountLocal:](self->_localPodcast, "setDarkCountLocal:", v70);
        -[MTPodcast markPlaylistsForUpdate](self->_localPodcast, "markPlaylistsForUpdate");
        if ((_DWORD)v69 != -[MTPodcast isDark](self->_localPodcast, "isDark"))
        {
          id v71 = -[MTPodcast isDark](self->_localPodcast, "isDark");
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast latestExitFromDarkDownloads](self->_localPodcast, "latestExitFromDarkDownloads"));
          if (v72)
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:]( &OBJC_CLASS___PFAnalyticsEvent,  "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:",  v69,  v71,  2LL,  v72));
          }

          else
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            v73 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:]( &OBJC_CLASS___PFAnalyticsEvent,  "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:",  v69,  v71,  2LL,  v74));
          }

          v75 = (void *)objc_opt_new(&OBJC_CLASS___PFCoreAnalyticsChannel);
          [v75 sendEvent:v73];
        }
      }
    }

    [v9 resolveAvailabilityDate];
    [v9 firstTimeAvailable];
    double v77 = v76;
    -[MTFeedIngester latestEpisodeDate](self, "latestEpisodeDate");
    if (v77 > v78 && [v9 isMedia])
    {
      [v9 firstTimeAvailable];
      self->_latestEpisodeDate = v79;
    }

    updatedEpisodeUUIDs = self->_updatedEpisodeUUIDs;
    v81 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
    -[NSMutableSet addObject:](updatedEpisodeUUIDs, "addObject:", v81);

    uint64_t v83 = _MTLogCategoryFeedUpdateIngester(v82);
    v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
      *(_DWORD *)buf = 138543874;
      v90 = v85;
      __int16 v91 = 2112;
      id v92 = v86;
      __int16 v93 = 1024;
      LODWORD(v94) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ updated episode from feed - isNew %x",  buf,  0x1Cu);
    }

    ++self->_itemsIngested;
    id v36 = v9;
  }

  else
  {
    uint64_t v28 = _MTLogCategoryFeedUpdateIngester(v24);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v9 podcast]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uuid]);
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v9 podcast]);
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 title]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
      *(_DWORD *)buf = 138544130;
      v90 = v31;
      __int16 v91 = 2112;
      id v92 = v33;
      __int16 v93 = 2114;
      v94 = v34;
      __int16 v95 = 2112;
      v96 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ - %@ podcast for episode does not match podcast for ingester %{public}@ - %@",  buf,  0x2Au);
    }

    id v36 = 0LL;
  }

  return v36;
}

- (void)unsafeDeleteFeedDeletedEpisode:(id)a3
{
  id v4 = a3;
  uint64_t updated = _MTLogCategoryFeedUpdateIngester(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    int v11 = 138544130;
    int v12 = v7;
    __int16 v13 = 2112;
    double v14 = v8;
    __int16 v15 = 2114;
    BOOL v16 = v9;
    __int16 v17 = 2112;
    BOOL v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ deleting episode removed from feed %{public}@ - %@",  (uint8_t *)&v11,  0x2Au);
  }

  [v4 setFeedDeleted:1];
  self->_shouldMarkPlaylistsForUpdate = 1;
  ++self->_itemsDeleted;
}

- (BOOL)unsafeIngestShow:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v45 = _MTLogCategoryFeedUpdate();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      *(_DWORD *)buf = 138543362;
      id v128 = v46;
      v47 = "%{public}@ failed to update because feed was nil";
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v47, buf, 0xCu);
    }

- (void)unsafeIngestPage
{
  localPodcast = self->_localPodcast;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[MTPodcast setUpdatedDate:](localPodcast, "setUpdatedDate:");
  -[MTPodcast setConsecutiveFeedFetchErrors:](self->_localPodcast, "setConsecutiveFeedFetchErrors:", 0LL);
  double latestEpisodeDate = self->_latestEpisodeDate;
  -[MTPodcast feedChangedDate](self->_localPodcast, "feedChangedDate");
  if (latestEpisodeDate > v5) {
    -[MTPodcast setFeedChangedDate:](self->_localPodcast, "setFeedChangedDate:", self->_latestEpisodeDate);
  }
  uint64_t updated = _MTLogCategoryFeedUpdateIngester(-[MTFeedIngester _updatePodcastArtworksIfNeeded](self, "_updatePodcastArtworksIfNeeded"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - finished ingestion of page of podcast from feed",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)unsafeFinalizeIngestion
{
  if (self->_shouldMarkPlaylistsForUpdate) {
    -[MTPodcast markPlaylistsForUpdate](self->_localPodcast, "markPlaylistsForUpdate");
  }
  +[MTFeedIngester _unsafeFinalizeIngestion:episodeLevelCalculator:storeInfoUpdater:updateAverageCalculator:ctx:didUpdateAnyEpisodes:newlyEntitledEpisodeUUIDs:]( &OBJC_CLASS___MTFeedIngester,  "_unsafeFinalizeIngestion:episodeLevelCalculator:storeInfoUpdater:updateAverageCalculator:ctx:didUpdateAnyEpisodes:ne wlyEntitledEpisodeUUIDs:",  self->_localPodcast,  self->_episodeLevelCalculator,  self->_storeInfoUpdater,  self->_updateAverageCalculator,  self->_ctx,  -[NSMutableSet count](self->_updatedEpisodeUUIDs, "count") != 0LL,  self->_newlyEntitledEpisodeUUIDs);
}

+ (void)_unsafeFinalizeIngestion:(id)a3 episodeLevelCalculator:(id)a4 storeInfoUpdater:(id)a5 updateAverageCalculator:(id)a6 ctx:(id)a7 didUpdateAnyEpisodes:(BOOL)a8 newlyEntitledEpisodeUUIDs:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (v9)
  {
    +[MTFeedIngester _recalculateEpisodeLevel:episodeLevelCalculator:ctx:]( &OBJC_CLASS___MTFeedIngester,  "_recalculateEpisodeLevel:episodeLevelCalculator:ctx:",  v14,  v15,  v18);
  }

  else
  {
    uint64_t v20 = _MTLogCategoryFeedUpdate();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      *(_DWORD *)buf = 138543362;
      BOOL v43 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%{public}@ - no episodes processed, skipping episode level recalculation",  buf,  0xCu);
    }
  }

  unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 newestEpisodeByAvailabiltyTime]);
  uint64_t updated = _MTLogCategoryFeedUpdateIngester(v23);
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    id v40 = v15;
    id v41 = v16;
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
    id v28 = v19;
    id v29 = v18;
    id v30 = v17;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v23 uuid]);
    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v23 title]);
    id v33 = [v23 storeTrackId];
    *(_DWORD *)buf = 138544386;
    BOOL v43 = v26;
    __int16 v44 = 2112;
    uint64_t v45 = v27;
    __int16 v46 = 2114;
    v47 = v31;
    __int16 v48 = 2112;
    BOOL v49 = v32;
    __int16 v50 = 2048;
    id v51 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ marking latest episode as unplayed if needed %{public}@ - %@ - %lld",  buf,  0x34u);

    id v17 = v30;
    id v18 = v29;
    id v19 = v28;

    id v15 = v40;
    id v16 = v41;
  }

  +[MTFeedIngester _markLatestEpisodeAsUnplayedIfNeeded:latestEpisodeInPodcast:]( &OBJC_CLASS___MTFeedIngester,  "_markLatestEpisodeAsUnplayedIfNeeded:latestEpisodeInPodcast:",  v14,  v23);
  +[MTFeedIngester _sendNotificationForNewlyEntitledEpisodesIfNeeded:latestEpisodeInPodcast:newlyEntitledEpisodeUUIDs:ctx:]( &OBJC_CLASS___MTFeedIngester,  "_sendNotificationForNewlyEntitledEpisodesIfNeeded:latestEpisodeInPodcast:newlyEntitledEpisodeUUIDs:ctx:",  v14,  v23,  v19,  v18);
  [v23 firstTimeAvailable];
  objc_msgSend(v14, "setLatestEpisodeAvailabilityTime:");
  [v14 setAuthenticatedDark:0];
  [v14 setFeedUpdateNeedsRetry:0];
  if (+[MTStoreIdentifier isEmpty:]( MTStoreIdentifier,  "isEmpty:",  [v14 storeCollectionId]))
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    [v16 updateStoreInfoForPodcast:v34];
  }

  id v35 = (id)objc_claimAutoreleasedReturnValue([v14 latestExitFromDarkDownloads]);
  id v36 = v35;
  if (v35) {
    id v35 = [v14 suppressEpisodesWithBasisDate:v35];
  }
  uint64_t v37 = _MTLogCategoryFeedUpdateIngester(v35);
  id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    *(_DWORD *)buf = 138543362;
    BOOL v43 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - finished ingestion of podcast from feed",  buf,  0xCu);
  }
}

- (BOOL)_localPodcastExists
{
  localPodcast = self->_localPodcast;
  if (localPodcast)
  {
    localPodcast = (MTPodcast *)-[MTPodcast isDeleted](localPodcast, "isDeleted");
    if (!(_DWORD)localPodcast) {
      return 1;
    }
  }

  uint64_t updated = _MTLogCategoryFeedUpdateIngester(localPodcast);
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    int v8 = 138543362;
    BOOL v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@ - local podcast was deleted. Cannot ingest",  (uint8_t *)&v8,  0xCu);
  }

  return 0;
}

- (void)_setAttributesOfLocalEpisode:(id)a3 feedEpisode:(id)a4
{
  id v55 = a3;
  id v6 = a4;
  [v55 setFeedDeleted:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
  [v55 setGuid:v7];

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeStoreId]);
  id v9 = [v8 longLongValue];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByStrippingHTML]);

  [v55 setTitle:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 itunesTitle]);
  [v55 setItunesTitle:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedIngester configuration](self, "configuration"));
  LODWORD(v12) = [v13 usesCleanEpisodeTitles];

  if ((_DWORD)v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v55 podcast]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 cleanedTitleStringWithPrefix:v15]);
    [v55 setCleanedTitle:v16];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 itemDescription]);
  [v55 setItemDescription:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 itemSummary]);
  [v55 setItunesSubtitle:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 author]);
  [v55 setAuthor:v19];

  objc_msgSend(v55, "setByteSize:", objc_msgSend(v6, "byteSize"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 uti]);
  [v55 setUti:v20];

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v6 pubDate]);
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    [v55 pubDate];
    double v24 = v23;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 pubDate]);
    [v25 timeIntervalSinceReferenceDate];
    double v27 = v26;

    if (v24 != v27)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 pubDate]);
      [v28 timeIntervalSinceReferenceDate];
      objc_msgSend(v55, "setPubDate:");
    }
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v6 firstTimeAvailableAsPaid]);
  if (v29)
  {
    id v30 = (void *)v29;
    [v55 firstTimeAvailableAsPaid];
    double v32 = v31;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v6 firstTimeAvailableAsPaid]);
    [v33 timeIntervalSinceReferenceDate];
    double v35 = v34;

    if (v32 != v35)
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v6 firstTimeAvailableAsPaid]);
      [v36 timeIntervalSinceReferenceDate];
      objc_msgSend(v55, "setFirstTimeAvailableAsPaid:");
    }
  }

  uint64_t v37 = objc_claimAutoreleasedReturnValue([v6 firstTimeAvailableAsFree]);
  if (v37)
  {
    id v38 = (void *)v37;
    [v55 firstTimeAvailableAsFree];
    double v40 = v39;
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v6 firstTimeAvailableAsFree]);
    [v41 timeIntervalSinceReferenceDate];
    double v43 = v42;

    if (v40 != v43)
    {
      __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v6 firstTimeAvailableAsFree]);
      [v44 timeIntervalSinceReferenceDate];
      objc_msgSend(v55, "setFirstTimeAvailableAsFree:");
    }
  }

  objc_msgSend(v55, "setExplicit:", objc_msgSend(v6, "isExplicit"));
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeType]);
  [v55 setEpisodeType:v45];

  id v46 = [v55 episodeNumber];
  if (v46 != [v6 episodeNumber]) {
    objc_msgSend(v55, "setEpisodeNumber:", objc_msgSend(v6, "episodeNumber"));
  }
  id v47 = [v55 seasonNumber];
  if (v47 != [v6 seasonNumber]) {
    objc_msgSend(v55, "setSeasonNumber:", objc_msgSend(v6, "seasonNumber"));
  }
  __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v6 webpageURL]);
  [v55 setWebpageURL:v48];

  [v55 setIsHidden:0];
  BOOL v49 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkTemplateURL]);
  [v55 setArtworkTemplateURL:v49];

  [v6 artworkWidth];
  objc_msgSend(v55, "setArtworkWidth:");
  [v6 artworkHeight];
  objc_msgSend(v55, "setArtworkHeight:");
  __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkBackgroundColor]);
  [v55 setArtworkBackgroundColor:v50];

  id v51 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkTextPrimaryColor]);
  [v55 setArtworkTextPrimaryColor:v51];

  __int16 v52 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkTextSecondaryColor]);
  [v55 setArtworkTextSecondaryColor:v52];

  unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkTextTertiaryColor]);
  [v55 setArtworkTextTertiaryColor:v53];

  __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v6 artworkTextQuaternaryColor]);
  [v55 setArtworkTextQuaternaryColor:v54];
}

- (void)_setPodcastArtwork:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 imageURL]);
  if ([v5 length]) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 imageURL]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 globalImageURL]);
  }
  id v7 = (void *)v6;

  if ([(id)objc_opt_class(self) _fetchSmallestPicturePossible])
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTResizedArtworkURLProvider sharedInstance]( &OBJC_CLASS___MTResizedArtworkURLProvider,  "sharedInstance"));
    id v9 = objc_msgSend( v8,  "resizedArtworkURLString:withDimension:",  v7,  objc_msgSend((id)objc_opt_class(self), "_maxArtworkSize"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    id v7 = (void *)v10;
  }

  if (v7)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self->_localPodcast, "imageURL"));
    unsigned __int8 v12 = [v11 isEqualToString:v7];

    if ((v12 & 1) == 0)
    {
      uint64_t updated = _MTLogCategoryFeedUpdateIngester(v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self->_localPodcast, "title"));
        int v31 = 138543874;
        double v32 = v16;
        __int16 v33 = 2112;
        double v34 = v17;
        __int16 v35 = 2112;
        id v36 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ artwork url did change %@",  (uint8_t *)&v31,  0x20u);
      }

      -[MTPodcast setNeedsArtworkUpdate:](self->_localPodcast, "setNeedsArtworkUpdate:", 1LL);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[PUIFeedManagerArtworkBridge shared](&OBJC_CLASS___PUIFeedManagerArtworkBridge, "shared"));
      [v18 invalidateArtworkForPodcast:self->_localPodcast];
    }
  }

  -[MTPodcast setImageURL:](self->_localPodcast, "setImageURL:", v7);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkTemplateURL]);
  -[MTPodcast setArtworkTemplateURL:](self->_localPodcast, "setArtworkTemplateURL:", v19);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkPrimaryColor]);
  -[MTPodcast setArtworkPrimaryColor:](self->_localPodcast, "setArtworkPrimaryColor:", v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkTextPrimaryColor]);
  -[MTPodcast setArtworkTextPrimaryColor:](self->_localPodcast, "setArtworkTextPrimaryColor:", v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkTextSecondaryColor]);
  -[MTPodcast setArtworkTextSecondaryColor:](self->_localPodcast, "setArtworkTextSecondaryColor:", v22);

  double v23 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkTextTertiaryColor]);
  -[MTPodcast setArtworkTextTertiaryColor:](self->_localPodcast, "setArtworkTextTertiaryColor:", v23);

  double v24 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkTextQuaternaryColor]);
  -[MTPodcast setArtworkTextQuaternaryColor:](self->_localPodcast, "setArtworkTextQuaternaryColor:", v24);

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 uberBackgroundImageURL]);
  -[MTPodcast setUberBackgroundImageURL:](self->_localPodcast, "setUberBackgroundImageURL:", v25);

  double v26 = (void *)objc_claimAutoreleasedReturnValue([v4 uberBackgroundJoeColor]);
  -[MTPodcast setUberBackgroundJoeColor:](self->_localPodcast, "setUberBackgroundJoeColor:", v26);

  double v27 = (void *)objc_claimAutoreleasedReturnValue([v4 uberArtworkTextPrimaryColor]);
  -[MTPodcast setUberArtworkTextPrimaryColor:](self->_localPodcast, "setUberArtworkTextPrimaryColor:", v27);

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 uberArtworkTextSecondaryColor]);
  -[MTPodcast setUberArtworkTextSecondaryColor:](self->_localPodcast, "setUberArtworkTextSecondaryColor:", v28);

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v4 uberArtworkTextTertiaryColor]);
  -[MTPodcast setUberArtworkTextTertiaryColor:](self->_localPodcast, "setUberArtworkTextTertiaryColor:", v29);

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 uberArtworkTextQuaternaryColor]);
  -[MTPodcast setUberArtworkTextQuaternaryColor:](self->_localPodcast, "setUberArtworkTextQuaternaryColor:", v30);
}

- (void)_reportMetrics
{
  id v22 = +[MTFeedUpdateMetricsDataKey newEpisodeCount](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "newEpisodeCount");
  v27[0] = v22;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_itemsInserted));
  v28[0] = v21;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsDataKey deletedEpisodeCount]( &OBJC_CLASS___MTFeedUpdateMetricsDataKey,  "deletedEpisodeCount"));
  v27[1] = v20;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_itemsDeleted));
  v28[1] = v19;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsDataKey updatedEpisodeCount]( &OBJC_CLASS___MTFeedUpdateMetricsDataKey,  "updatedEpisodeCount"));
  v27[2] = v18;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_itemsIngested - self->_itemsInserted));
  v28[2] = v17;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsDataKey totalEpisodeCount]( &OBJC_CLASS___MTFeedUpdateMetricsDataKey,  "totalEpisodeCount"));
  v27[3] = v16;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_itemsDeleted + self->_itemsIngested));
  v28[3] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsDataKey podcastStoreId]( &OBJC_CLASS___MTFeedUpdateMetricsDataKey,  "podcastStoreId"));
  v27[4] = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[MTPodcast storeCollectionId](self->_localPodcast, "storeCollectionId")));
  v28[4] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey source](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "source"));
  v27[5] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_feedUpdateSource));
  v28[5] = v7;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey eventId](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "eventId"));
  v27[6] = v8;
  v28[6] = self->_updaterJobUUID;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey updaterType](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "updaterType"));
  v27[7] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataUpdaterValue sync](&OBJC_CLASS___MTFeedUpdateMetricsDataUpdaterValue, "sync"));
  v28[7] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  8LL));

  uint64_t v12 = _MTLogCategoryFeedUpdate();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
    *(_DWORD *)buf = 138543618;
    double v24 = v14;
    __int16 v25 = 2112;
    double v26 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - processed feed page and found new episodes: %@",  buf,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction pageParser](&OBJC_CLASS___MTFeedUpdateMetricsAction, "pageParser"));
  +[IMMetrics recordUserAction:dataSource:withData:]( &OBJC_CLASS___IMMetrics,  "recordUserAction:dataSource:withData:",  v15,  0LL,  v11);
}

+ (void)_recalculateEpisodeLevel:(id)a3 episodeLevelCalculator:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  if (v10)
  {
    uint64_t v11 = _MTLogCategoryFeedUpdate();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}@ - recalculating episode levels",  (uint8_t *)&v15,  0xCu);
    }

    [v8 unsafeUpdateEpisodeLevelsWithShowUUID:v10 on:v9];
  }

  else
  {
    uint64_t updated = _MTLogCategoryFeedUpdateIngester(0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      id v16 = [v7 storeCollectionId];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%lld - can't process episode levels, uuid missing",  (uint8_t *)&v15,  0xCu);
    }
  }
}

+ (void)_markLatestEpisodeAsUnplayedIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 metadataTimestamp];
    if (fabs(v8) <= 2.22044605e-16)
    {
      id v9 = [v5 subscribed];
      if ((_DWORD)v9)
      {
        uint64_t updated = _MTLogCategoryFeedUpdateIngester(v9);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
          int v19 = 138544386;
          uint64_t v20 = v12;
          __int16 v21 = 2112;
          id v22 = v13;
          __int16 v23 = 2114;
          double v24 = v14;
          __int16 v25 = 2112;
          double v26 = v15;
          __int16 v27 = 2048;
          id v28 = [v7 storeTrackId];
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ marking latest episode as unplayed %{public}@ - %@ - %lld",  (uint8_t *)&v19,  0x34u);
        }

        +[MTFeedIngester _markEpisodeAsFirstSeen:](&OBJC_CLASS___MTFeedIngester, "_markEpisodeAsFirstSeen:", v7);
        [v7 setPlayState:2 manually:0 source:6];
        [v7 setMetadataTimestamp:0.0];
        [v7 setMetadataFirstSyncEligible:1];
      }
    }
  }

  else
  {
    uint64_t v16 = _MTLogCategoryFeedUpdate();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%{public}@ - Could not get the latest episode. Not marking anything as unplayed.",  (uint8_t *)&v19,  0xCu);
    }
  }
}

+ (void)_sendNotificationForNewlyEntitledEpisodesIfNeeded:(id)a3 latestEpisodeInPodcast:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 ctx:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 count])
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 managedObjectContext]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[MTRecencyUtil upNextForPodcastUuid:ctx:]( &OBJC_CLASS___MTRecencyUtil,  "upNextForPodcastUuid:ctx:",  v13,  v14));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 episodeUuid]);

    if (v16) {
      id v17 = v16;
    }
    else {
      id v17 = (id)objc_claimAutoreleasedReturnValue([v10 uuid]);
    }
    int v19 = v17;
    uint64_t updated = _MTLogCategoryFeedUpdateIngester(v17);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      double v24 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
      *(_DWORD *)buf = 138544130;
      id v41 = v23;
      __int16 v42 = 2112;
      double v43 = v24;
      __int16 v44 = 2114;
      uint64_t v45 = v16;
      __int16 v46 = 2114;
      id v47 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ Up Next Episode: %{public}@. Latest Episode: %{public}@",  buf,  0x2Au);
    }

    id v26 = [v11 containsObject:v19];
    if ((_DWORD)v26)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForUuid:v16 entityName:kMTEpisodeEntityName]);
      uint64_t v27 = _MTLogCategoryFeedUpdateIngester(v20);
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = v10;
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
        int v31 = (void *)objc_claimAutoreleasedReturnValue([v20 uuid]);
        id v39 = v12;
        double v32 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);
        unsigned int v33 = [v20 isNew];
        *(_DWORD *)buf = 138544386;
        id v41 = v29;
        __int16 v42 = 2112;
        double v43 = v30;
        __int16 v44 = 2114;
        uint64_t v45 = v31;
        __int16 v46 = 2112;
        id v47 = v32;
        __int16 v48 = 1024;
        unsigned int v49 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ Found new smart play episode from episode entitlement changed %{public}@ - %@. episode isNew: %d",  buf,  0x30u);

        id v12 = v39;
        id v10 = v38;
      }

      +[MTFeedIngester _markEpisodeAsFirstSeen:](&OBJC_CLASS___MTFeedIngester, "_markEpisodeAsFirstSeen:", v20);
      [v20 setSentNotification:0];
    }

    else
    {
      uint64_t v34 = _MTLogCategoryFeedUpdateIngester(v26);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = v12;
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
        *(_DWORD *)buf = 138543874;
        id v41 = v36;
        __int16 v42 = 2112;
        double v43 = v37;
        __int16 v44 = 2114;
        uint64_t v45 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ Smart Play Episode is not newly entitled. Not setting eligible for notifications: %{public}@.",  buf,  0x20u);

        id v12 = v35;
      }
    }

    goto LABEL_15;
  }

  uint64_t v18 = _MTLogCategoryFeedUpdateIngester(0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
    *(_DWORD *)buf = 138543618;
    id v41 = v19;
    __int16 v42 = 2112;
    double v43 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ No newly entitled episodes. Not marking any episodes eligibile for notifications.",  buf,  0x16u);
LABEL_15:
  }
}

- (void)_updatePodcastArtworksIfNeeded
{
  if (self->_imageStore && self->_imageDownloader)
  {
    id v3 = -[MTPodcast requestsAreNonAppInitiated](self->_localPodcast, "requestsAreNonAppInitiated");
    if ((-[MTPodcast needsArtworkUpdate](self->_localPodcast, "needsArtworkUpdate") & 1) != 0
      || (uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"))) != 0
      && (id v5 = (void *)v4,
          imageStore = self->_imageStore,
          id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid")),
          LOBYTE(imageStore) = -[MTImageStoreProtocol hasItemForKey:](imageStore, "hasItemForKey:", v7),
          v7,
          v5,
          (imageStore & 1) == 0))
    {
      id v8 = objc_alloc(&OBJC_CLASS____TtC18PodcastsFoundation22DownloadableURLOptions);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self->_localPodcast, "imageURL"));
      id v14 = [v8 init:v9 nonAppInitiated:v3];

      imageDownloader = self->_imageDownloader;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self->_localPodcast, "uuid"));
      -[MTFeedIngesterImageDownloaderProtocol downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:]( imageDownloader,  "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:",  v11,  v14,  0LL,  1LL);
    }
  }

  else
  {
    uint64_t updated = _MTLogCategoryFeedUpdateIngester(self);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Image downloader and image store are nil, artwork won't be downloaded",  buf,  2u);
    }
  }

+ (unint64_t)_maxArtworkSize
{
  return 3000LL;
}

+ (BOOL)_fetchSmallestPicturePossible
{
  return 0;
}

+ (unint64_t)_offerTypesAsFlagBits:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "offers", 0));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * (void)i) offerTypeAsFlagBit];
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

+ (void)_markEpisodeAsFirstSeen:(id)a3
{
  id v3 = a3;
  [v3 unsuppressAutomaticDownloadsIfNeeded];
  [v3 setIsNew:1];
}

- (void)_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:(id)a3 isNewEpisodeToCurrentDevice:(BOOL)a4 oldIsEntitled:(BOOL)a5 oldEnclosureURL:(id)a6 oldPriceType:(id)a7
{
  int v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 priceType]);
  if (!v15
    || (uint64_t v16 = (void *)v15,
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 enclosureURL]),
        v17,
        v16,
        !v17))
  {
    uint64_t updated = _MTLogCategoryFeedUpdateIngester(v15);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(updated);
    if (!os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
    {
LABEL_24:

      goto LABEL_25;
    }

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v12 priceType]);
    __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v12 enclosureURL]);
    *(_DWORD *)buf = 138413314;
    id v57 = v45;
    __int16 v58 = 2112;
    *(void *)uint64_t v59 = v47;
    *(_WORD *)&v59[8] = 2112;
    id v60 = v14;
    __int16 v61 = 2112;
    unsigned int v62 = v48;
    __int16 v63 = 2112;
    id v64 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_ERROR,  "Nil attribute detected for episode %@. Not handling priceType change. priceType: %@, oldPriceType: %@, enclosureUr l: %@, oldEnclosureUrl: %@",  buf,  0x34u);

LABEL_21:
    goto LABEL_24;
  }

  id v55 = v14;
  uint64_t v18 = _MTLogCategoryFeedUpdateIngester(v15);
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 priceType]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 enclosureURL]);
    id v50 = [v12 entitlementState];
    __int16 v52 = (void *)objc_claimAutoreleasedReturnValue([v12 podcast]);
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v52 channel]);
    int v53 = v9;
    __int16 v23 = self;
    id v24 = [v51 storeId];
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v12 podcast]);
    BOOL v54 = v10;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 channel]);
    *(_DWORD *)buf = 138414082;
    id v57 = v20;
    __int16 v58 = 2112;
    *(void *)uint64_t v59 = v21;
    *(_WORD *)&v59[8] = 2112;
    id v60 = v55;
    __int16 v61 = 2112;
    unsigned int v62 = v22;
    __int16 v63 = 2112;
    id v64 = v13;
    __int16 v65 = 2048;
    id v66 = v50;
    __int16 v67 = 2048;
    id v68 = v24;
    self = v23;
    int v9 = v53;
    __int16 v69 = 1024;
    unsigned int v70 = [v26 subscriptionActive];
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Handling attributes and redownload on priceType change if needed for episode: %@. priceType: %@, oldPriceType: %@, enclosureUrl: %@, oldEnclosureUrl: %@, oldEntitlementState: %lld, channel: %lld, subscriptionActive: %d",  buf,  0x4Eu);

    BOOL v10 = v54;
  }

  uint64_t v27 = _MTLogCategoryFeedUpdateIngester([v12 updateEntitlementState]);
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = [v12 entitlementState];
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
    *(_DWORD *)buf = 134218242;
    id v57 = v29;
    __int16 v58 = 2112;
    *(void *)uint64_t v59 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Updated entitlementState to: %lld for episode %@",  buf,  0x16u);
  }

  BOOL v31 = 0;
  id v14 = v55;
  if (!v55 && v10)
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v12 priceType]);
    BOOL v31 = v32 != 0LL;
  }

  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v12 priceType]);
  unsigned int v34 = [v33 isEqualToString:v55];

  uint64_t v36 = _MTLogCategoryFeedUpdateIngester(v35);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  BOOL v38 = os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT);
  if ((v34 & 1) != 0 || v31)
  {
    if (v38)
    {
      unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
      *(_DWORD *)buf = 138412802;
      id v57 = v49;
      __int16 v58 = 1024;
      *(_DWORD *)uint64_t v59 = v34;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v31;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEFAULT,  "priceType did not actually change for episode %@. priceTypeValueDidNotChange: %d - isNewEpisodeAndPriceTypeDidNotChange: %d",  buf,  0x18u);
    }

    goto LABEL_24;
  }

  if (v38)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
    double v40 = (void *)objc_claimAutoreleasedReturnValue([v12 priceType]);
    *(_DWORD *)buf = 138412802;
    id v57 = v39;
    __int16 v58 = 2112;
    *(void *)uint64_t v59 = v55;
    *(_WORD *)&v59[8] = 2112;
    id v60 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEFAULT,  "PriceType changed for episode uuid %@ from priceType: %@ to %@",  buf,  0x20u);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "setPriceTypeChangedDate:");
  if ([v12 isEntitled])
  {
    id v41 = [v12 isEntitled];
    if ((_DWORD)v41 != v9)
    {
      uint64_t v42 = _MTLogCategoryFeedUpdateIngester(v41);
      double v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
        *(_DWORD *)buf = 138412290;
        id v57 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Episode %@ is newly entitled.", buf, 0xCu);
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedIngester newlyEntitledEpisodeUUIDs](self, "newlyEntitledEpisodeUUIDs"));
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
      [v37 addObject:v45];
      goto LABEL_21;
    }
  }

- (BOOL)didUpdateFeedUrl
{
  return self->_didUpdateFeedUrl;
}

- (void)setDidUpdateFeedUrl:(BOOL)a3
{
  self->_didUpdateFeedUrl = a3;
}

- (double)latestEpisodeDate
{
  return self->_latestEpisodeDate;
}

- (void)setLatestEpisodeDate:(double)a3
{
  self->_double latestEpisodeDate = a3;
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (NSMutableSet)newlyEntitledEpisodeUUIDs
{
  return self->_newlyEntitledEpisodeUUIDs;
}

- (NSMutableSet)updatedEpisodeUUIDs
{
  return self->_updatedEpisodeUUIDs;
}

- (BOOL)shouldMarkPlaylistsForUpdate
{
  return self->_shouldMarkPlaylistsForUpdate;
}

- (void)setShouldMarkPlaylistsForUpdate:(BOOL)a3
{
  self->_shouldMarkPlaylistsForUpdate = a3;
}

- (NSManagedObjectContext)ctx
{
  return self->_ctx;
}

- (MTPodcast)localPodcast
{
  return self->_localPodcast;
}

- (MTStoreInfoUpdaterProtocol)storeInfoUpdater
{
  return self->_storeInfoUpdater;
}

- (MTFeedIngesterImageDownloaderProtocol)imageDownloader
{
  return self->_imageDownloader;
}

- (MTImageStoreProtocol)imageStore
{
  return self->_imageStore;
}

- (MTSyncControllerProtocol)syncController
{
  return self->_syncController;
}

- (MTFeedIngesterLibraryProtocol)library
{
  return self->_library;
}

- (MTFeedIngesterDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator
{
  return self->_episodeLevelCalculator;
}

- (MTPodcastUpdateAverageCalculator)updateAverageCalculator
{
  return self->_updateAverageCalculator;
}

- (MTCategoryIngesterProtocol)categoryIngester
{
  return self->_categoryIngester;
}

- (int64_t)feedUpdateSource
{
  return self->_feedUpdateSource;
}

- (void)setFeedUpdateSource:(int64_t)a3
{
  self->_feedUpdateSource = a3;
}

- (NSString)updaterJobUUID
{
  return self->_updaterJobUUID;
}

- (void)setUpdaterJobUUID:(id)a3
{
}

- (int64_t)itemsInserted
{
  return self->_itemsInserted;
}

- (void)setItemsInserted:(int64_t)a3
{
  self->_itemsInserted = a3;
}

- (int64_t)itemsIngested
{
  return self->_itemsIngested;
}

- (void)setItemsIngested:(int64_t)a3
{
  self->_itemsIngested = a3;
}

- (int64_t)itemsDeleted
{
  return self->_itemsDeleted;
}

- (void)setItemsDeleted:(int64_t)a3
{
  self->_itemsDeleted = a3;
}

- (BOOL)canSendNotifications
{
  return self->_canSendNotifications;
}

- (void)setCanSendNotifications:(BOOL)a3
{
  self->_canSendNotifications = a3;
}

- (void).cxx_destruct
{
}

@end