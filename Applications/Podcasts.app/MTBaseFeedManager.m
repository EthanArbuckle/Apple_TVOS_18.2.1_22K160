@interface MTBaseFeedManager
+ (BOOL)_fetchSmallestPicturePossible;
+ (BOOL)isUpdatingFeedUrl:(id)a3;
+ (BOOL)isUpdatingPodcastUuid:(id)a3;
+ (id)_metadataUrl;
+ (unint64_t)_maxArtworkSize;
+ (unint64_t)updatingCount;
+ (void)didFinishUpdatingAllFeeds:(BOOL)a3;
+ (void)didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4;
+ (void)didStartUpdatingFeedUrl:(id)a3 cloudSyncUrl:(id)a4;
+ (void)initialize;
+ (void)postNotificationName:(id)a3 userInfo:(id)a4;
+ (void)purgeSubscriptionMetadata;
+ (void)removeMetadataForPodcastUuid:(id)a3;
+ (void)saveSubscriptionMetadata;
+ (void)standardDeviationForEpisodes:(id)a3 standardDeviation:(double *)a4 average:(double *)a5;
- (BOOL)_localEpisode:(id)a3 isEqualToServerEpisode:(id)a4;
- (BOOL)_shouldDownloadPodcastWithIdentifierFromStore:(int64_t)a3;
- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3;
- (BOOL)allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:(id)a3;
- (BOOL)isSubscribingWithFeedUrl:(id)a3;
- (BOOL)processFeed:(id)a3 podcastUUID:(id)a4 requestUrl:(id)a5 useBackgroundFetch:(BOOL)a6 needsUpdate:(BOOL)a7 source:(int64_t)a8;
- (BOOL)updatePodcastWithUuid:(id)a3 withFeed:(id)a4 originalFeedUrl:(id)a5 source:(int64_t)a6;
- (MTBaseFeedManager)init;
- (MTExternalFeedDownloader)externalFeedDownloader;
- (MTLegacyDownloadManagerProtocol)downloadManager;
- (NSMutableArray)pendingFeedProcessingBlocks;
- (OS_dispatch_queue)feedProcessingQueue;
- (OS_dispatch_queue)workQueue;
- (_TtC18PodcastsFoundation21PodcastFeedDownloader)storePodcastDownloader;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration;
- (id)_insertNewEpisodeForServerEpisode:(id)a3 podcast:(id)a4 ctx:(id)a5;
- (id)_sortDescriptorsForLocalEpisodes;
- (id)importContext;
- (id)preProcessFeedHook:(id)a3 requestUrl:(id)a4 needsUpdate:(BOOL)a5;
- (id)sessionCompletionHandler;
- (int64_t)_compareServerEpisode:(id)a3 toLocalEpisode:(id)a4;
- (int64_t)_compareServerEpisode:(id)a3 toServerEpisode:(id)a4;
- (void)_addPendingFeedProcessingBlock:(id)a3;
- (void)_didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4;
- (void)_processNextPendingFeedIfPossible;
- (void)_queue_processNextPendingFeedIfPossible;
- (void)_startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9;
- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7;
- (void)didRestoreFeedUrlTask:(id)a3;
- (void)markEpisodeAsFirstSeen:(id)a3;
- (void)preprocessFeedWithDataHashingBlock:(id)a3 feedCreationBlock:(id)a4 url:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7;
- (void)setConfiguration:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setExternalFeedDownloader:(id)a3;
- (void)setFeedProcessingQueue:(id)a3;
- (void)setPendingFeedProcessingBlocks:(id)a3;
- (void)setSessionCompletionHandler:(id)a3;
- (void)setStorePodcastDownloader:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9;
- (void)startDownloadForPodcastStoreId:(int64_t)a3 triggerBy:(id)a4 feedUrl:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7;
@end

@implementation MTBaseFeedManager

+ (void)initialize
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTBaseFeedManager;
  objc_msgSendSuper2(&v5, "initialize");
  if (qword_1002B6B38 != -1) {
    dispatch_once(&qword_1002B6B38, &stru_100244238);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _metadataUrl]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v3));

  if (v4) {
    [(id)qword_1002B6B48 addEntriesFromDictionary:v4];
  }
}

- (MTBaseFeedManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MTBaseFeedManager;
  v2 = -[MTBaseFeedManager init](&v23, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[FeedManagerLocalConfiguration platformSpecificConfiguration]( &OBJC_CLASS____TtC18PodcastsFoundation29FeedManagerLocalConfiguration,  "platformSpecificConfiguration"));
    -[MTBaseFeedManager setConfiguration:](v2, "setConfiguration:", v3);

    v4 = -[MTExternalFeedDownloader initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTExternalFeedDownloader),  "initWithDelegate:",  v2);
    -[MTBaseFeedManager setExternalFeedDownloader:](v2, "setExternalFeedDownloader:", v4);

    objc_super v5 = objc_alloc_init(&OBJC_CLASS____TtC18PodcastsFoundation21PodcastFeedDownloader);
    -[MTBaseFeedManager setStorePodcastDownloader:](v2, "setStorePodcastDownloader:", v5);

    v6 = (objc_class *)objc_opt_class(v2);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-feedProcessingQueue", v8));
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    -[MTBaseFeedManager setFeedProcessingQueue:](v2, "setFeedProcessingQueue:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](v2, "configuration"));
    unsigned int v12 = [v11 workQueueConcurrent];
    v13 = &_dispatch_queue_attr_concurrent;
    if (!v12) {
      v13 = 0LL;
    }
    v14 = v13;

    v15 = (objc_class *)objc_opt_class(v2);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-worker", v17));
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], v14);

    -[MTBaseFeedManager setWorkQueue:](v2, "setWorkQueue:", v19);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingFeedProcessingBlocks = v2->_pendingFeedProcessingBlocks;
    v2->_pendingFeedProcessingBlocks = (NSMutableArray *)v20;
  }

  return v2;
}

- (id)sessionCompletionHandler
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sessionCompletionHandler]);

  return v3;
}

- (void)setSessionCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
  [v5 setSessionCompletionHandler:v4];

  -[MTBaseFeedManager _processNextPendingFeedIfPossible](self, "_processNextPendingFeedIfPossible");
}

- (id)importContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](self, "configuration"));
  unsigned int v3 = [v2 supportsBatchInsertion];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  objc_super v5 = v4;
  if (v3) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 resetableImportContext]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 importContext]);
  }
  v7 = (void *)v6;

  return v7;
}

- (id)preProcessFeedHook:(id)a3 requestUrl:(id)a4 needsUpdate:(BOOL)a5
{
  return  [[MTFeedUpdatePreProcessResult alloc] initWithShouldContinue:1 createdPodcastUUID:0];
}

- (BOOL)processFeed:(id)a3 podcastUUID:(id)a4 requestUrl:(id)a5 useBackgroundFetch:(BOOL)a6 needsUpdate:(BOOL)a7 source:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTProcessorManager sharedInstance](&OBJC_CLASS___MTProcessorManager, "sharedInstance"));
  [v17 startProcessorsForFeedUpdates];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager importContext](self, "importContext"));
  if (v15)
  {
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x2020000000LL;
    char v39 = 0;
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x3032000000LL;
    v34[3] = sub_1000D8670;
    v34[4] = sub_1000D8680;
    id v35 = 0LL;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000D8688;
    v23[3] = &unk_100244260;
    id v22 = v18;
    v23[0] = _NSConcreteStackBlock;
    id v24 = v18;
    id v19 = v15;
    BOOL v32 = v9;
    v29 = v34;
    v30 = &v36;
    id v25 = v19;
    v26 = self;
    id v27 = v14;
    id v28 = v16;
    int64_t v31 = a8;
    BOOL v33 = v10;
    [v24 performBlockAndWaitWithSave:v23];
    if (v9 && *((_BYTE *)v37 + 24))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](&OBJC_CLASS___MTFeedUpdateManager, "sharedInstance"));
      [v20 _updatePodcastWithUUID:v19 userInitiated:0 useBackgroundFetch:v10 source:14];
    }

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&v36, 8);
    id v18 = v22;
  }

  return 1;
}

- (BOOL)updatePodcastWithUuid:(id)a3 withFeed:(id)a4 originalFeedUrl:(id)a5 source:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v358 = v11;
  if (!v10)
  {
    objc_super v23 = v9;
    uint64_t v24 = _MTLogCategoryFeedUpdate(v11);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v397 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to update because feed was nil",  buf,  0xCu);
    }

    goto LABEL_184;
  }

  uint64_t v12 = os_transaction_create("add image to disk store");
  v353 = objc_autoreleasePoolPush();
  v372 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager importContext](self, "importContext"));
  id v357 = v9;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 podcastForUuid:v9]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 podcastStoreId]);
  id v16 = [v15 longLongValue];

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v10 updatedFeedURL]);
  v354 = (void *)v17;
  v355 = (os_log_s *)v12;
  id v347 = v16;
  if (+[MTDBUtil isSupportedUrlString:](&OBJC_CLASS___MTDBUtil, "isSupportedUrlString:", v17)
    && (id v18 = (void *)v17,
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 currentFeedURL]),
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]),
        LOBYTE(v18) = [v18 isEqualToString:v20],
        v20,
        v19,
        (v18 & 1) == 0))
  {
    uint64_t v26 = _MTLogCategoryFeedUpdate(v21);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 currentFeedURL]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 absoluteString]);
      *(_DWORD *)buf = 138543874;
      id v397 = v357;
      __int16 v398 = 2112;
      v399 = v354;
      __int16 v400 = 2112;
      double v401 = *(double *)&v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Found different updatedFeedURL %@ from %@",  buf,  0x20u);
    }

    [v14 setUpdatedFeedURL:v354];
    char v22 = 1;
  }

  else
  {
    char v22 = 0;
  }

  char v348 = v22;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v10 resolvedFeedURL]);
  if ([v30 length])
  {
    int64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v14 currentFeedURL]);
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 absoluteString]);
    unsigned __int8 v33 = [v30 isEqualToString:v32];

    if ((v33 & 1) == 0)
    {
      uint64_t v35 = _MTLogCategoryFeedUpdate(v34);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v14 currentFeedURL]);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 absoluteString]);
        *(_DWORD *)buf = 138543874;
        id v397 = v357;
        __int16 v398 = 2112;
        v399 = v30;
        __int16 v400 = 2112;
        double v401 = *(double *)&v38;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Found different feedURL %@ from %@",  buf,  0x20u);
      }

      [v14 setUpdatedFeedURL:v30];
      char v348 = 1;
    }
  }

  char v39 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 stringByStrippingHTML]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 stringByRemovingNewlineCharacters]);
  [v14 setTitle:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue([v10 author]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 stringByStrippingHTML]);
  [v14 setAuthor:v43];

  v44 = (void *)objc_claimAutoreleasedReturnValue([v10 provider]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 stringByStrippingHTML]);
  [v14 setProvider:v45];

  objc_msgSend(v14, "setIsExplicit:", objc_msgSend(v10, "isExplicit"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v10 feedDescription]);
  [v14 setItemDescription:v46];

  v47 = (void *)objc_claimAutoreleasedReturnValue([v10 showType]);
  [v14 setShowTypeInFeed:v47];

  v48 = (void *)objc_claimAutoreleasedReturnValue([v10 category]);
  [v14 setCategory:v48];

  v49 = (void *)objc_claimAutoreleasedReturnValue([v10 webpageURL]);
  [v14 setWebpageURL:v49];

  v50 = (void *)objc_claimAutoreleasedReturnValue([v10 shareURL]);
  [v14 setStoreCleanURL:v50];

  v51 = (void *)objc_claimAutoreleasedReturnValue([v10 artworkPrimaryColor]);
  [v14 setArtworkPrimaryColor:v51];

  v52 = (void *)objc_claimAutoreleasedReturnValue([v10 showSpecificUpsellCopy]);
  [v14 setShowSpecificUpsellCopy:v52];

  objc_msgSend(v14, "setOfferTypes:", objc_msgSend(v10, "offerTypesAsFlagBits"));
  uint64_t v53 = objc_claimAutoreleasedReturnValue([v10 displayType]);
  if (v53)
  {
    v54 = (void *)v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue([v10 displayType]);
    unsigned int v56 = [v55 isNotEmpty];

    if (v56)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue([v10 displayType]);
      [v14 setDisplayType:v57];
    }
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue([v10 channelItem]);

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue([v10 channelItem]);
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[MTChannel createOrFindChannelFromFeedChannelItem:personalizedRequest:context:]( &OBJC_CLASS___MTChannel,  "createOrFindChannelFromFeedChannelItem:personalizedRequest:context:",  v59,  0LL,  v13));

    [v14 setChannel:v60];
    unsigned int v360 = [v60 subscriptionActive];
  }

  else
  {
    unsigned int v360 = 0;
  }

  uint64_t v356 = kMTEpisodeEntityName;
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesIncludingHiddenOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesIncludingHiddenOnPodcastUuid:",  v62));
  [v61 setPredicate:v63];

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager _sortDescriptorsForLocalEpisodes](v372, "_sortDescriptorsForLocalEpisodes"));
  [v61 setSortDescriptors:v64];

  [v61 setReturnsObjectsAsFaults:0];
  [v61 setFetchBatchSize:200];
  id v391 = 0LL;
  v352 = v61;
  v65 = (void *)objc_claimAutoreleasedReturnValue([v13 executeFetchRequest:v61 error:&v391]);
  id v66 = v391;
  id v349 = v10;
  id v351 = v66;
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = _MTLogCategoryFeedUpdate(v66);
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      v71 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
      *(_DWORD *)buf = 138543874;
      id v397 = v70;
      __int16 v398 = 2112;
      v399 = v71;
      __int16 v400 = 2112;
      double v401 = *(double *)&v351;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "%{public}@ - %@ failed to fetch db episodes - %@",  buf,  0x20u);

      id v67 = v351;
    }

    id v346 = 0LL;
    id v367 = 0LL;
    uint64_t v363 = 0LL;
    v72 = v67;
    objc_super v23 = v357;
    id v25 = v355;
    goto LABEL_183;
  }

  v73 = (void *)objc_claimAutoreleasedReturnValue([v10 items]);
  v390[0] = _NSConcreteStackBlock;
  v390[1] = 3221225472LL;
  v390[2] = sub_1000DB1E4;
  v390[3] = &unk_100244288;
  v390[4] = v372;
  v74 = (void *)objc_claimAutoreleasedReturnValue([v73 sortedArrayWithOptions:16 usingComparator:v390]);

  id v346 = [v74 count];
  v362 = v74;
  id v75 = [(id)objc_opt_class(v372) standardDeviationForEpisodes:v74 standardDeviation:&v389 average:&v388];
  uint64_t v76 = _MTLogCategoryFeedUpdate(v75);
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
  v78 = v372;
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    v80 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
    *(_DWORD *)buf = 138544130;
    id v397 = v79;
    __int16 v398 = 2112;
    v399 = v80;
    __int16 v400 = 2048;
    double v401 = v389;
    __int16 v402 = 2048;
    double v403 = v388;
    _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ Standard Deviation: %f, average: %f",  buf,  0x2Au);
  }

  [v14 setUpdateStdDev:v389];
  uint64_t v81 = _MTLogCategoryFeedUpdate([v14 setUpdateAvg:v388]);
  v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
    id v85 = [v362 count];
    *(_DWORD *)buf = 138543874;
    id v397 = v83;
    __int16 v398 = 2112;
    v399 = v84;
    __int16 v400 = 2048;
    double v401 = *(double *)&v85;
    _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ number of items: %lu",  buf,  0x20u);
  }

  v370 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v371 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v345 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v86 = v362;
  v377 = v13;
  v378 = v14;
  v344 = v30;
  v373 = v65;
  if ([v362 count])
  {
    uint64_t v363 = 0LL;
    v359 = 0LL;
    uint64_t v381 = 0LL;
    unint64_t v87 = 0LL;
    uint64_t v88 = 0LL;
    double v89 = 0.0;
    while (1)
    {
      uint64_t v368 = v88;
      v379 = (void *)objc_claimAutoreleasedReturnValue([v86 objectAtIndex:v88]);
      v90 = (void *)objc_claimAutoreleasedReturnValue([v379 enclosureURL]);

      if (!v90)
      {
        uint64_t v125 = _MTLogCategoryFeedUpdate(v91);
        v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          v127 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
          v128 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
          unint64_t v129 = v87;
          v130 = (void *)objc_claimAutoreleasedReturnValue([v379 title]);
          *(_DWORD *)buf = 138543874;
          id v397 = v127;
          __int16 v398 = 2112;
          v399 = v128;
          __int16 v400 = 2112;
          double v401 = *(double *)&v130;
          _os_log_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_ERROR,  "%{public}@ - %@ feed item without an enclosure: %@",  buf,  0x20u);

          v86 = v362;
          unint64_t v87 = v129;
        }

        goto LABEL_125;
      }

      context = objc_autoreleasePoolPush();
      if (v87 >= (unint64_t)[v65 count])
      {
        char v124 = 0;
        v92 = 0LL;
        v93 = &OBJC_CLASS___DebugUtil_ptr;
      }

      else
      {
        v92 = 0LL;
        ++v87;
        v93 = &OBJC_CLASS___DebugUtil_ptr;
        while (1)
        {
          v94 = v92;
          unint64_t v95 = v87 - 1;
          v92 = (void *)objc_claimAutoreleasedReturnValue([v65 objectAtIndex:v87 - 1]);

          BOOL v96 = -[MTBaseFeedManager _localEpisode:isEqualToServerEpisode:]( v78,  "_localEpisode:isEqualToServerEpisode:",  v92,  v379);
          if (v96)
          {
            char v124 = 0;
            goto LABEL_59;
          }

          uint64_t v97 = _MTLogCategoryFeedUpdate(v96);
          v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
          {
            v99 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
            v100 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
            unint64_t obja = v87 - 1;
            v101 = (void *)objc_claimAutoreleasedReturnValue([v379 guid]);
            v102 = (void *)objc_claimAutoreleasedReturnValue([v92 guid]);
            id v103 = (id)objc_claimAutoreleasedReturnValue([v379 resolvedEnclosureUrl]);
            v104 = (void *)objc_claimAutoreleasedReturnValue([v92 enclosureURL]);
            v105 = (void *)objc_claimAutoreleasedReturnValue([v379 title]);
            unint64_t v374 = v87;
            v106 = (void *)objc_claimAutoreleasedReturnValue([v92 title]);
            *(_DWORD *)buf = 138545154;
            id v397 = v99;
            __int16 v398 = 2112;
            v399 = v100;
            __int16 v400 = 2112;
            double v401 = *(double *)&v101;
            __int16 v402 = 2112;
            double v403 = *(double *)&v102;
            __int16 v404 = 2112;
            id v405 = v103;
            __int16 v406 = 2112;
            v407 = v104;
            __int16 v408 = 2112;
            v409 = v105;
            __int16 v410 = 2112;
            v411 = v106;
            _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_INFO,  "%{public}@ - %@ did not find match for episode %@ - %@ | %@ - %@ | %@ - %@",  buf,  0x52u);

            unint64_t v87 = v374;
            v93 = &OBJC_CLASS___DebugUtil_ptr;

            id v14 = v378;
            unint64_t v95 = obja;

            v78 = v372;
            v13 = v377;
          }

          if (-[MTBaseFeedManager _compareServerEpisode:toLocalEpisode:]( v78,  "_compareServerEpisode:toLocalEpisode:",  v379,  v92) == -1) {
            break;
          }
          v107 = (void *)objc_claimAutoreleasedReturnValue([v92 uuid]);

          if (v107)
          {
            v109 = (void *)objc_claimAutoreleasedReturnValue([v92 uuid]);
            [v370 addObject:v109];

            v110 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v92 storeTrackId]));
            [v371 addObject:v110];
          }

          else
          {
            uint64_t v111 = _MTLogCategoryFeedUpdate(v108);
            v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              v112 = (void *)objc_claimAutoreleasedReturnValue([v92 title]);
              *(_DWORD *)buf = 138412290;
              id v397 = v112;
              _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_ERROR,  "NULL UUID for localEpisode no longer in server feed, title %@",  buf,  0xCu);
            }
          }

          uint64_t v114 = _MTLogCategoryFeedUpdate(v113);
          v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            v116 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
            v117 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
            unint64_t v118 = v87;
            v119 = (void *)objc_claimAutoreleasedReturnValue([v92 uuid]);
            v120 = (void *)objc_claimAutoreleasedReturnValue([v92 title]);
            *(_DWORD *)buf = 138544130;
            id v397 = v116;
            __int16 v398 = 2112;
            v399 = v117;
            __int16 v400 = 2114;
            double v401 = *(double *)&v119;
            __int16 v402 = 2112;
            double v403 = *(double *)&v120;
            _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ marking episode for deletion %{public}@ - %@",  buf,  0x2Au);

            unint64_t v87 = v118;
            v93 = &OBJC_CLASS___DebugUtil_ptr;
          }

          v65 = v373;
          if (200 * (v87 / 0xC8) == v87) {
            [v13 saveInCurrentBlock];
          }
          id v121 = [v373 count];
          unint64_t v122 = v87 + 1;
          if (v87++ >= (unint64_t)v121)
          {
            char v124 = 0;
            unint64_t v87 = v122 - 1;
            goto LABEL_59;
          }
        }

        uint64_t v131 = _MTLogCategoryFeedUpdate(-1LL);
        v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          v133 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
          v134 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
          v135 = (void *)objc_claimAutoreleasedReturnValue([v379 episodeStoreId]);
          v136 = (void *)objc_claimAutoreleasedReturnValue([v379 title]);
          *(_DWORD *)buf = 138544130;
          id v397 = v133;
          __int16 v398 = 2112;
          v399 = v134;
          __int16 v400 = 2114;
          double v401 = *(double *)&v135;
          __int16 v402 = 2112;
          double v403 = *(double *)&v136;
          _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ should add new episode from server %{public}@ - %@",  buf,  0x2Au);

          v93 = &OBJC_CLASS___DebugUtil_ptr;
        }

        char v124 = 1;
        unint64_t v87 = v95;
      }

- (void)markEpisodeAsFirstSeen:(id)a3
{
  id v3 = a3;
  [v3 unsuppressAutomaticDownloadsIfNeeded];
  [v3 setIsNew:1];
}

- (id)_insertNewEpisodeForServerEpisode:(id)a3 podcast:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && ([v8 isDeleted] & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SyncControllerFactory resolvedSyncController]( &OBJC_CLASS____TtC8Podcasts21SyncControllerFactory,  "resolvedSyncController"));
    [v11 setUppSyncDirtyFlag:1];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:]( &OBJC_CLASS___MTEpisode,  "insertNewEpisodeInManagedObjectContext:canSendNotifications:",  v9,  +[PFNotificationSettings canSendNotification]( &OBJC_CLASS___PFNotificationSettings,  "canSendNotification")));
    [v10 setPodcast:v8];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
    [v10 setGuid:v12];

    [v10 setImportSource:2];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pubDate]);
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;
    [v8 addedDate];
    double v17 = v16;

    unsigned __int8 v18 = [v8 importing];
    if (v15 < v17) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    [v10 metadataTimestamp];
    if (v20 == 0.0)
    {
      [v10 setPlayState:0 manually:1 source:6];
      [v10 setBackCatalog:1];
      [v10 setMetadataTimestamp:0.0];
      [v10 setMetadataFirstSyncEligible:0];
    }

    else
    {
      [v10 setIsNew:0];
    }

    id v21 = [v10 suppressAutomaticDownloadsIfNeeded];
    if ((v19 & 1) == 0)
    {
LABEL_24:
      id v22 = [v8 isDark];
      objc_super v23 = (char *)[v8 darkCount] + 1;
      [v8 setDarkCount:v23];
      [v8 setDarkCountLocal:v23];
      [v8 markPlaylistsForUpdate];
      id v21 = [v8 isDark];
      if ((_DWORD)v22 != (_DWORD)v21)
      {
        id v24 = [v8 isDark];
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 latestExitFromDarkDownloads]);
        if (v25)
        {
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:]( &OBJC_CLASS___PFAnalyticsEvent,  "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:",  v22,  v24,  2LL,  v25));
        }

        else
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:]( &OBJC_CLASS___PFAnalyticsEvent,  "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:",  v22,  v24,  2LL,  v27));
        }

        id v28 = (void *)objc_opt_new(&OBJC_CLASS___PFCoreAnalyticsChannel);
        [v28 sendEvent:v26];
      }
    }

    uint64_t v29 = _MTLogCategoryFeedUpdate(v21);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
      unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
      int v36 = 138544130;
      v37 = v31;
      __int16 v38 = 2112;
      char v39 = v32;
      __int16 v40 = 2114;
      v41 = v33;
      __int16 v42 = 2112;
      v43 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - %@ new episode %{public}@ - %@",  (uint8_t *)&v36,  0x2Au);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)_localEpisode:(id)a3 isEqualToServerEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 guid]);
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 guid]);
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);
      unsigned __int8 v13 = [v11 isEqualToString:v12];

      if ((v13 & 1) != 0)
      {
        unsigned __int8 v14 = 1;
        goto LABEL_21;
      }
    }

    else
    {
    }
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue([v6 resolvedEnclosureUrl]);
  if (v15
    && (uint64_t v16 = objc_claimAutoreleasedReturnValue([v5 enclosureURL])) != 0
    && (double v17 = (void *)v16,
        unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 enclosureURL]),
        unsigned __int8 v19 = [v15 isEqualToString:v18],
        v18,
        v17,
        (v19 & 1) != 0))
  {
    unsigned __int8 v14 = 1;
  }

  else
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByStrippingHTML]);

    if (v21)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
      if (v22)
      {
        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
        if ([v21 isEqualToString:v23])
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 pubDate]);
          [v5 pubDate];
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
          unsigned __int8 v14 = [v24 isEqualToDate:v25];
        }

        else
        {
          unsigned __int8 v14 = 0;
        }
      }

      else
      {
        unsigned __int8 v14 = 0;
      }
    }

    else
    {
      unsigned __int8 v14 = 0;
    }
  }

LABEL_21:
  return v14;
}

- (int64_t)_compareServerEpisode:(id)a3 toServerEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pubDate]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 pubDate]);
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    int64_t v10 = (int64_t)[v8 compare:v7];
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 guid]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 guid]);
    unsigned __int8 v13 = (void *)v12;
    if (v11 | v12) {
      uint64_t v14 = -1LL;
    }
    else {
      uint64_t v14 = 0LL;
    }
    if (v12) {
      int64_t v10 = 1LL;
    }
    else {
      int64_t v10 = v14;
    }
    if (v11 && v12) {
      int64_t v10 = (int64_t)[(id)v12 compare:v11];
    }
  }

  return v10;
}

- (id)_sortDescriptorsForLocalEpisodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  0LL));
  v6[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeGuid,  0LL));
  v6[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

- (int64_t)_compareServerEpisode:(id)a3 toLocalEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pubDate]);
  [v6 pubDate];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    int64_t v10 = (int64_t)[v8 compare:v7];
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 guid]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 guid]);
    unsigned __int8 v13 = (void *)v12;
    if (v11 | v12) {
      uint64_t v14 = -1LL;
    }
    else {
      uint64_t v14 = 0LL;
    }
    if (v12) {
      int64_t v10 = 1LL;
    }
    else {
      int64_t v10 = v14;
    }
    if (v11 && v12) {
      int64_t v10 = (int64_t)[(id)v12 compare:v11];
    }
  }

  return v10;
}

+ (BOOL)isUpdatingPodcastUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000DBB78;
    v10[3] = &unk_1002442B0;
    id v7 = v6;
    id v11 = v7;
    id v12 = v4;
    unsigned __int8 v13 = &v15;
    id v14 = a1;
    [v7 performBlockAndWait:v10];
    BOOL v8 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isUpdatingFeedUrl:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (id)qword_1002B6B40;
    objc_sync_enter(v4);
    unsigned __int8 v5 = [(id)qword_1002B6B40 containsObject:v3];
    objc_sync_exit(v4);
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (unint64_t)updatingCount
{
  id v2 = (id)qword_1002B6B40;
  objc_sync_enter(v2);
  id v3 = [(id)qword_1002B6B40 count];
  objc_sync_exit(v2);

  return (unint64_t)v3;
}

- (void)preprocessFeedWithDataHashingBlock:(id)a3 feedCreationBlock:(id)a4 url:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000DBEAC;
  v19[3] = &unk_1002442D8;
  objc_copyWeak(v23, &location);
  id v15 = v12;
  id v21 = v15;
  id v16 = v14;
  id v20 = v16;
  id v17 = v13;
  BOOL v24 = a6;
  id v22 = v17;
  v23[1] = (id)a7;
  char v18 = objc_retainBlock(v19);
  -[MTBaseFeedManager _addPendingFeedProcessingBlock:](self, "_addPendingFeedProcessingBlock:", v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    id v15 = a6;
    uint64_t v16 = _MTLogCategoryFeedUpdate(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      char v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:NSUnderlyingErrorKey]);
      *(_DWORD *)buf = 138412546;
      id v28 = v18;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: Underlying error %@", buf, 0x16u);
    }

    -[MTBaseFeedManager feedDownloadedWithError:task:requestedUrl:]( self,  "feedDownloadedWithError:task:requestedUrl:",  v12,  v14,  v15);
    id v21 = (id)objc_claimAutoreleasedReturnValue([v15 absoluteString]);

    -[MTBaseFeedManager _didFinishUpdatingFeedUrl:withError:](self, "_didFinishUpdatingFeedUrl:withError:", v21, v12);
  }

  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000DC5D0;
    v25[3] = &unk_100244300;
    id v26 = v13;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    id v23[2] = sub_1000DC5D8;
    v23[3] = &unk_100244328;
    id v24 = v26;
    id v22 = a6;
    -[MTBaseFeedManager preprocessFeedWithDataHashingBlock:feedCreationBlock:url:useBackgroundFetch:source:]( self,  "preprocessFeedWithDataHashingBlock:feedCreationBlock:url:useBackgroundFetch:source:",  v25,  v23,  v22,  v7,  17LL);

    id v21 = v26;
  }
}

- (void)didRestoreFeedUrlTask:(id)a3
{
  id v8 = a3;
  id v3 = (id)qword_1002B6B40;
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = (void *)qword_1002B6B40;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
    [v6 addObject:v7];
  }

  objc_sync_exit(v3);
}

- (BOOL)allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:(id)a3
{
  return 0;
}

- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  unsigned __int8 v6 = [v5 isReachable];

  if ((v6 & 1) == 0)
  {
    if (v3) {
      dispatch_async(&_dispatch_main_q, &stru_100244348);
    }
    [(id)objc_opt_class(self) didFinishUpdatingAllFeeds:0];
  }

  return v6 ^ 1;
}

- (BOOL)_shouldDownloadPodcastWithIdentifierFromStore:(int64_t)a3
{
  return +[MTStoreIdentifier isNotEmpty:](&OBJC_CLASS___MTStoreIdentifier, "isNotEmpty:", a3);
}

- (void)_startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a6;
  uint64_t v16 = _MTLogCategoryFeedUpdate(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412290;
    int64_t v28 = (int64_t)v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Running on downloads queue %@",  (uint8_t *)&v27,  0xCu);
  }

  char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](self, "configuration"));
  unsigned __int8 v19 = (void *)([v18 useBackgroundFetchForFeedDownloads] | v9);

  BOOL v20 = -[MTBaseFeedManager _shouldDownloadPodcastWithIdentifierFromStore:]( self,  "_shouldDownloadPodcastWithIdentifierFromStore:",  a5);
  BOOL v21 = v20;
  uint64_t v22 = _MTLogCategoryFeedUpdate(v20);
  objc_super v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v24)
    {
      int v27 = 134218498;
      int64_t v28 = a5;
      __int16 v29 = 2112;
      id v30 = v14;
      __int16 v31 = 2048;
      BOOL v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Downloading from Media API with storeID %lld for feedURL %@ localBackgroundFetch %ld",  (uint8_t *)&v27,  0x20u);
    }

    -[MTBaseFeedManager startDownloadForPodcastStoreId:triggerBy:feedUrl:useBackgroundFetch:source:]( self,  "startDownloadForPodcastStoreId:triggerBy:feedUrl:useBackgroundFetch:source:",  a5,  v15,  v14,  v19,  a9);
  }

  else
  {
    if (v24)
    {
      int v27 = 138412546;
      int64_t v28 = (int64_t)v14;
      __int16 v29 = 2048;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Downloading directly from feedURL %@ localBackgroundFetch %ld",  (uint8_t *)&v27,  0x16u);
    }

    id v25 = [[_TtC18PodcastsFoundation22DownloadableURLOptions alloc] initWithUrl:v14 nonAppInitiated:1];
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
    [v26 startDownloadTaskForFeedURL:v25 userInitiated:v10 useBackgroundFetch:v19];
  }
}

- (void)startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (v15)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000DCC4C;
    v22[3] = &unk_100244370;
    v22[4] = self;
    id v23 = v15;
    int64_t v26 = a5;
    id v24 = v16;
    BOOL v28 = a7;
    BOOL v29 = a8;
    id v25 = v17;
    int64_t v27 = a9;
    char v18 = objc_retainBlock(v22);
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](self, "configuration"));
    if ([v19 useBackgroundFetchForFeedDownloads])
    {
      unsigned __int8 v20 = -[MTBaseFeedManager _shouldDownloadPodcastWithIdentifierFromStore:]( self,  "_shouldDownloadPodcastWithIdentifierFromStore:",  a5);

      if ((v20 & 1) == 0)
      {
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
        [v21 restoreBackgroundDownloadTasksWithCompletion:v18];

LABEL_7:
        goto LABEL_8;
      }
    }

    else
    {
    }

    ((void (*)(void *))v18[2])(v18);
    goto LABEL_7;
  }

- (void)startDownloadForPodcastStoreId:(int64_t)a3 triggerBy:(id)a4 feedUrl:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager storePodcastDownloader](self, "storePodcastDownloader"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);
  BOOL v17 = -[MTBaseFeedManager allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:]( self,  "allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:",  v16);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000DD020;
  v19[3] = &unk_100244398;
  void v19[4] = self;
  id v20 = v12;
  BOOL v22 = v8;
  int64_t v21 = a7;
  id v18 = v12;
  [v14 downloadPodcast:v15 triggerBy:v13 allowEpisodesTo404:v17 isImplicitActionRequest:v8 completion:v19];
}

+ (void)purgeSubscriptionMetadata
{
  id v3 = (id)qword_1002B6B48;
  objc_sync_enter(v3);
  id v4 = (void *)qword_1002B6B48;
  qword_1002B6B48 = 0LL;

  objc_sync_exit(v3);
  [a1 saveSubscriptionMetadata];
}

+ (void)removeMetadataForPodcastUuid:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = (id)qword_1002B6B48;
    objc_sync_enter(v4);
    [(id)qword_1002B6B48 removeObjectForKey:v5];
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

+ (void)saveSubscriptionMetadata
{
  id v3 = (id)qword_1002B6B48;
  objc_sync_enter(v3);
  id v4 = (void *)qword_1002B6B48;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _metadataUrl]);
  id v10 = 0LL;
  [v4 writeToURL:v5 error:&v10];
  id v6 = v10;

  if (v6)
  {
    uint64_t v8 = _MTLogCategoryFeedUpdate(v7);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = a1;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ failed to save hash cache due to %@",  buf,  0x16u);
    }
  }

  objc_sync_exit(v3);
}

- (BOOL)isSubscribingWithFeedUrl:(id)a3
{
  return 0;
}

- (void)_addPendingFeedProcessingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager feedProcessingQueue](self, "feedProcessingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DD4C0;
  v7[3] = &unk_100240138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_processNextPendingFeedIfPossible
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager feedProcessingQueue](self, "feedProcessingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DD57C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_queue_processNextPendingFeedIfPossible
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager feedProcessingQueue](self, "feedProcessingQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionCompletionHandler]);

  if (v5)
  {
    uint64_t v7 = _MTLogCategoryFeedUpdate(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      BOOL v9 = "Postponing feed update because we're waiting to call the session completion handler";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, 2u);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
    id v11 = [v10 count];

    if (!v11)
    {
      uint64_t v19 = _MTLogCategoryFeedUpdate(v12);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      LOWORD(v20) = 0;
      BOOL v9 = "There are no pending feed updates. Doing nothing.";
      goto LABEL_4;
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
    [v14 removeObjectAtIndex:0];

    uint64_t v15 = (*((uint64_t (**)(os_log_s *))v8 + 2))(v8);
    uint64_t v16 = _MTLogCategoryFeedUpdate(v15);
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
      int v20 = 134217984;
      id v21 = [v18 count];
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Done processing feed. %lu remaining.",  (uint8_t *)&v20,  0xCu);
    }

    -[MTBaseFeedManager _queue_processNextPendingFeedIfPossible](self, "_queue_processNextPendingFeedIfPossible");
  }

+ (id)_metadataUrl
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants cachesDirectory](&OBJC_CLASS___MTConstants, "cachesDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"MTSubscriptionMeta.plist"]);

  return v3;
}

+ (BOOL)_fetchSmallestPicturePossible
{
  return 0;
}

+ (unint64_t)_maxArtworkSize
{
  return 3000LL;
}

+ (void)didStartUpdatingFeedUrl:(id)a3 cloudSyncUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1002B6B40;
  objc_sync_enter(v8);
  [(id)qword_1002B6B40 addObject:v6];
  objc_sync_exit(v8);

  uint64_t v15 = @"MTBaseFeedManagerFeedUrlKey";
  id v16 = v6;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  [a1 postNotificationName:@"MTBaseFeedManagerDidStartUpdatingFeed" userInfo:v9];

  uint64_t v11 = _MTLogCategoryFeedUpdate(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "didStartUpdatingFeedUrl: %@",  (uint8_t *)&v13,  0xCu);
  }
}

- (void)_didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class(self) didFinishUpdatingFeedUrl:v7 withError:v6];
}

+ (void)didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = (id)qword_1002B6B40;
  objc_sync_enter(v8);
  if (v6)
  {
    id v9 = [(id)qword_1002B6B40 containsObject:v6];
    if ((_DWORD)v9)
    {
      [(id)qword_1002B6B40 removeObject:v6];
      id v9 = [(id)qword_1002B6B40 count];
      BOOL v10 = v9 == 0LL;
      if (!v7) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    objc_msgSend( v13,  "logFile:lineNumber:format:",  "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Feed/MTBaseFeedManager.m",  1368,  @"Feed update finished without a feedURL, likely failed.");

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsAction finishedWithoutURL]( &OBJC_CLASS___MTFeedUpdateMetricsAction,  "finishedWithoutURL"));
    +[IMMetrics recordUserAction:](&OBJC_CLASS___IMMetrics, "recordUserAction:", v14);
  }

  BOOL v10 = 0;
  if (!v7)
  {
LABEL_4:
    uint64_t v11 = _MTLogCategoryFeedUpdate(v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v22 = v6;
      __int16 v23 = 1024;
      LODWORD(v24) = [(id)qword_1002B6B40 count];
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "didFinishUpdatingFeedUrl: %@, remaining count = %d",  buf,  0x12u);
    }

    goto LABEL_10;
  }

+ (void)didFinishUpdatingAllFeeds:(BOOL)a3
{
  if (!objc_msgSend(a1, "updatingCount", a3))
  {
    uint64_t v4 = _MTLogCategoryFeedUpdate([a1 postNotificationName:@"MTBaseFeedManagerDidEndUpdatingAllFeeds" userInfo:0]);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didFinishUpdatingAllFeeds", v6, 2u);
    }
  }

+ (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DDD50;
  v7[3] = &unk_100240240;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async(&_dispatch_main_q, v7);
}

+ (void)standardDeviationForEpisodes:(id)a3 standardDeviation:(double *)a4 average:(double *)a5
{
  id v33 = a3;
  *a4 = 0.0;
  *a5 = 0.0;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v8 = [v33 count];
  if ((uint64_t)v8 - 1 >= 1)
  {
    id v9 = v8;
    uint64_t v10 = 1LL;
    do
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:v10 - 1]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pubDate]);
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:v10]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pubDate]);
      [v16 timeIntervalSinceReferenceDate];
      double v18 = v17;

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", vabdd_f64(v14, v18)));
      -[NSMutableArray addObject:](v7, "addObject:", v19);

      ++v10;
    }

    while (v9 != (id)v10);
    uint64_t v20 = (uint64_t)-[NSMutableArray count](v7, "count");
    uint64_t v21 = v20;
    if (v20 < 1)
    {
      if (v20) {
        *a5 = 0.0 / (double)v20;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
      double v23 = 0.0;
      do
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v22));
        [v24 doubleValue];
        double v23 = v23 + v25;

        ++v22;
      }

      while (v21 != v22);
      *a5 = v23 / (double)v21;
      if (v21 >= 1)
      {
        uint64_t v26 = 0LL;
        double v27 = 0.0;
        do
        {
          BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v26));
          [v28 doubleValue];
          double v30 = v29 - *a5;
          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v26));
          [v31 doubleValue];
          double v27 = v27 + v30 * (v32 - *a5);

          ++v26;
        }

        while (v21 != v26);
        if (v21 > 1) {
          *a4 = sqrt(v27 / (double)(v21 - 1));
        }
      }
    }
  }
}

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (MTExternalFeedDownloader)externalFeedDownloader
{
  return self->_externalFeedDownloader;
}

- (void)setExternalFeedDownloader:(id)a3
{
}

- (_TtC18PodcastsFoundation21PodcastFeedDownloader)storePodcastDownloader
{
  return self->_storePodcastDownloader;
}

- (void)setStorePodcastDownloader:(id)a3
{
}

- (NSMutableArray)pendingFeedProcessingBlocks
{
  return self->_pendingFeedProcessingBlocks;
}

- (void)setPendingFeedProcessingBlocks:(id)a3
{
}

- (OS_dispatch_queue)feedProcessingQueue
{
  return self->_feedProcessingQueue;
}

- (void)setFeedProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end