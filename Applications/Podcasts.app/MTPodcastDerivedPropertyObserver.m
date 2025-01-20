@interface MTPodcastDerivedPropertyObserver
+ (id)sharedInstance;
- (BOOL)_changeContainsRelevantChannelChanges:(id)a3;
- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3;
- (BOOL)_changeContainsRelevantPodcastChanges:(id)a3;
- (BOOL)_shouldSkipSettingPropertiesForWatchPPT;
- (BOOL)_shouldUpdatePodcastsStatsForChange:(id)a3;
- (BOOL)isObserving;
- (BOOL)setDerivedPropertyValue:(id)a3 forKey:(id)a4 forPodcast:(id)a5;
- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator;
- (MTPodcastDerivedPropertyObserver)init;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)handlers;
- (NSMutableDictionary)podcastCache;
- (NSPersistentHistoryToken)latestPersistentHistoryToken;
- (NSSet)channelPropertiesToFetch;
- (NSSet)episodePropertiesToFetch;
- (NSSet)podcastPropertiesToFetch;
- (NSSet)podcastStatsProperties;
- (id)_historyTransactionsSinceLatestPersistentHistoryToken;
- (id)_predicateForEpisodesToUpdateWithPodcastUuid:(id)a3 predicateForUnplayedInUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5;
- (id)addDerivedPropertyChangeHandler:(id)a3;
- (id)dependentPropertyForKey:(id)a3 forPodcastUuid:(id)a4;
- (id)derivedPropertiesForPodcast:(id)a3;
- (id)derivedPropertyValueForKey:(id)a3 forPodcast:(id)a4;
- (id)didFinishProcessingContextSaveHandlerForTests;
- (unint64_t)countOfNewEpisodesForPodcast:(id)a3;
- (unint64_t)countOfUnplayedEpisodesForPodcast:(id)a3;
- (void)_fetchLatestProcessedPersistentHistoryToken;
- (void)_processLatestPersistentHistoryTransactions;
- (void)_setLastProcessedPersistentHistoryToken:(id)a3;
- (void)_updateDerivedPropertiesForPodcastUUIDs:(id)a3;
- (void)_updateEpisodeCountsForPodcastUuid:(id)a3;
- (void)episodeResultsChangedForPodcastUuid:(id)a3;
- (void)notifyObserversForPodcast:(id)a3;
- (void)pauseProcessing;
- (void)processLatestPersistentHistoryTransactions;
- (void)removeDerivedPropertyChangeHandler:(id)a3;
- (void)reportStatsForPodcasts;
- (void)resumeProcessing;
- (void)setCache:(id)a3;
- (void)setChannelPropertiesToFetch:(id)a3;
- (void)setDependentPropertyValue:(id)a3 forKey:(id)a4 forPodcastUuid:(id)a5;
- (void)setDidFinishProcessingContextSaveHandlerForTests:(id)a3;
- (void)setEpisodePropertiesToFetch:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setLatestPersistentHistoryToken:(id)a3;
- (void)setPodcastCache:(id)a3;
- (void)setPodcastPropertiesToFetch:(id)a3;
- (void)setPodcastStatsProperties:(id)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateFlagsForPodcastUuid:(id)a3 predicateForUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5;
@end

@implementation MTPodcastDerivedPropertyObserver

+ (id)sharedInstance
{
  if (qword_1002B6AB0 != -1) {
    dispatch_once(&qword_1002B6AB0, &stru_1002433C8);
  }
  return (id)qword_1002B6AA8;
}

- (MTPodcastDerivedPropertyObserver)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MTPodcastDerivedPropertyObserver;
  id v2 = -[MTPodcastDerivedPropertyObserver init](&v31, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  kEpisodeUuid,  kEpisodeExternalType,  kEpisodeTitle,  kEpisodeLevel,  kEpisodeShowTypeSpecificLevel,  kEpisodePubDate,  kEpisodeEpisodeNumber,  kEpisodePlayState,  kEpisodePlayStateManuallySet,  kEpisodePodcastUuid,  kEpisodeIsFromiTunesSync,  kEpisodeListenNowEpisode,  kEpisodeUnplayedTab,  kEpisodeUserEpisode,  kEpisodeIsNew,  kEpisodePlayStateLastModifiedDate,  kEpisodeMetadataTimestamp,  kEpisodeLastDatePlayed,  kEpisodePriceType,  0LL));
    v10 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v9;

    uint64_t v11 = kPodcastSubscribed;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  kPodcastSubscribed,  kPodcastDeletePlayedEpisodes,  kPodcastEpisodeLimit,  kPodcastHidden,  kPodcastChannelStoreId,  kPodcastLastRemovedFromUpNextDate,  0LL));
    v13 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", kChannelSubscriptionActive, 0LL));
    v15 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  kPodcastFlags,  kPodcastDarkCountLocal,  kPodcastLastTouchDate,  kPodcastNotifications,  0LL));
    v17 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.podcasts.MTPodcastDerivedPropertyObserver.handlerQueue", 0LL);
    v19 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.podcasts.MTPodcastDerivedPropertyObserver.notificationQueue", 0LL);
    v21 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v20;

    id v22 = objc_alloc_init(&OBJC_CLASS___MTEpisodeLevelCalculator);
    v23 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v22;

    objc_initWeak(&location, v2);
    dispatch_source_t v24 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_add,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 2));
    v25 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v24;

    v26 = (dispatch_source_s *)*((void *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10009E07C;
    handler[3] = &unk_100240290;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return (MTPodcastDerivedPropertyObserver *)v2;
}

- (void)startObserving
{
  obj = self;
  objc_sync_enter(obj);
  if (-[MTPodcastDerivedPropertyObserver isObserving](obj, "isObserving"))
  {
    objc_sync_exit(obj);
  }

  else
  {
    -[MTPodcastDerivedPropertyObserver setIsObserving:](obj, "setIsObserving:", 1LL);
    objc_sync_exit(obj);

    -[MTPodcastDerivedPropertyObserver _fetchLatestProcessedPersistentHistoryToken]( obj,  "_fetchLatestProcessedPersistentHistoryToken");
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    [v2 addChangeNotifier:obj];

    -[MTPodcastDerivedPropertyObserver processLatestPersistentHistoryTransactions]( obj,  "processLatestPersistentHistoryTransactions");
  }

- (void)stopObserving
{
  obj = self;
  objc_sync_enter(obj);
  if (-[MTPodcastDerivedPropertyObserver isObserving](obj, "isObserving"))
  {
    -[MTPodcastDerivedPropertyObserver setIsObserving:](obj, "setIsObserving:", 0LL);
    objc_sync_exit(obj);

    id v2 = (MTPodcastDerivedPropertyObserver *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    -[MTPodcastDerivedPropertyObserver removeChangeNotifier:](v2, "removeChangeNotifier:", obj);
    uint64_t v3 = v2;
  }

  else
  {
    objc_sync_exit(obj);
    uint64_t v3 = obj;
  }
}

- (void)pauseProcessing
{
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009E26C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)resumeProcessing
{
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009E368;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)_fetchLatestProcessedPersistentHistoryToken
{
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009E444;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)_setLastProcessedPersistentHistoryToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_handlerQueue);
  if (v4)
  {
    id v26 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v26));
    id v7 = v26;
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0LL;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v14 setObject:v6 forKey:@"DerivedPropertyObserverPersistentHistoryToken"];

      uint64_t v16 = _MTLogCategoryDatabase(v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Derived Property Observer set last processed persistent history token %@.",  buf,  0xCu);
      }

      dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1209600.0));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "deleteHistoryBeforeDate:",  v18));

      dispatch_queue_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 privateQueueContext]);

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10009E878;
      v23[3] = &unk_100240240;
      id v24 = v21;
      id v25 = v19;
      id v22 = v19;
      id v11 = v21;
      [v11 performBlock:v23];
    }

    else
    {
      uint64_t v10 = _MTLogCategoryDatabase(v7);
      id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Derived Property Observer encountered error archiving last persistent history token %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v12 = _MTLogCategoryDatabase(v5);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Derived Property Observer set last processed persistent history token to nil. Removing default.",  buf,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v8 removeObjectForKey:@"DerivedPropertyObserverPersistentHistoryToken"];
  }
}

- (void)_updateDerivedPropertiesForPodcastUUIDs:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009EA84;
  block[3] = &unk_10023FF98;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___MTBackgroundTaskManager);
  uint64_t v14 = v5;
  dispatch_async(&_dispatch_main_q, block);
  handlerQueue = (dispatch_queue_s *)self->_handlerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009EA94;
  v9[3] = &unk_100240980;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(handlerQueue, v9);
}

- (id)_historyTransactionsSinceLatestPersistentHistoryToken
{
  if (!self->_latestPersistentHistoryToken) {
    return 0LL;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateQueueContext]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryAfterToken:",  self->_latestPersistentHistoryToken));
  [v5 setResultType:5];
  [v5 setFetchBatchSize:200];
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10009EEBC;
  v37 = sub_10009EECC;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10009EEBC;
  objc_super v31 = sub_10009EECC;
  id v32 = 0LL;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_10009EED4;
  id v22 = &unk_100241ED8;
  id v25 = &v27;
  id v6 = v4;
  id v23 = v6;
  id v7 = v5;
  id v24 = v7;
  id v26 = &v33;
  id v8 = [v6 performBlockAndWait:&v19];
  if (v34[5])
  {
    uint64_t v9 = _MTLogCategoryDatabase(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v34[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Derived Property Observer encountered error trying to fetch store result %@",  buf,  0xCu);
    }

    uint64_t v13 = _MTLogCategoryDatabase(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Derived Property Observer clearing out persistent history token and performing a full persistent history run",  buf,  2u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults",  v19,  v20,  v21,  v22,  v23));
    [v15 removeObjectForKey:@"DerivedPropertyObserverPersistentHistoryToken"];

    latestPersistentHistoryToken = self->_latestPersistentHistoryToken;
    self->_latestPersistentHistoryToken = 0LL;

    v17 = 0LL;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v28[5], "result", v19, v20, v21, v22, v23));
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (BOOL)_shouldUpdatePodcastsStatsForChange:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changedObjectID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 entity]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  unsigned int v7 = [v6 isEqualToString:kMTEpisodeEntityName];
  unsigned int v8 = [v6 isEqualToString:kMTPodcastEntityName];
  unsigned int v9 = v8;
  if ((v7 & 1) != 0 || v8)
  {
    if (((unint64_t)[v3 changeType] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 updatedProperties]);
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        id v13 = v12;
        id v23 = v6;
        id v24 = v3;
        uint64_t v14 = *(void *)v27;
        uint64_t v15 = kEpisodeIsFromiTunesSync;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            if (!v7
              || (dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v26 + 1)
                                                                                     + 8LL * (void)i), "name")),
                  unsigned __int8 v19 = [v18 isEqualToString:v15],
                  v18,
                  (v19 & 1) == 0))
            {
              if (!v9) {
                continue;
              }
              podcastStatsProperties = self->_podcastStatsProperties;
              v21 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
              LOBYTE(podcastStatsProperties) = -[NSSet containsObject:](podcastStatsProperties, "containsObject:", v21);
            }

            BOOL v10 = 1;
            goto LABEL_18;
          }

          id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v13) {
            continue;
          }
          break;
        }

        BOOL v10 = 0;
LABEL_18:
        id v6 = v23;
        id v3 = v24;
      }

      else
      {
        BOOL v10 = 0;
      }
    }

    else
    {
      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 changedObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entity]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

  if ([v7 isEqualToString:kMTEpisodeEntityName])
  {
    id v8 = [v4 changeType];
    if (!v8)
    {
LABEL_15:
      BOOL v16 = 1;
      goto LABEL_16;
    }

    if (v8 == (id)1)
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedProperties", 0));
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            episodePropertiesToFetch = self->_episodePropertiesToFetch;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) name]);
            LOBYTE(episodePropertiesToFetch) = -[NSSet containsObject:]( episodePropertiesToFetch,  "containsObject:",  v15);

            if ((episodePropertiesToFetch & 1) != 0)
            {

              goto LABEL_15;
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }

  BOOL v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)_changeContainsRelevantPodcastChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 changedObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entity]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

  if ([v7 isEqualToString:kMTPodcastEntityName])
  {
    id v8 = [v4 changeType];
    if (!v8)
    {
LABEL_15:
      BOOL v16 = 1;
      goto LABEL_16;
    }

    if (v8 == (id)1)
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedProperties", 0));
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            podcastPropertiesToFetch = self->_podcastPropertiesToFetch;
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) name]);
            LOBYTE(podcastPropertiesToFetch) = -[NSSet containsObject:]( podcastPropertiesToFetch,  "containsObject:",  v15);

            if ((podcastPropertiesToFetch & 1) != 0)
            {

              goto LABEL_15;
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }

  BOOL v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)_changeContainsRelevantChannelChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 changedObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entity]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

  unint64_t v8 = (unint64_t)[v4 changeType];
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    BOOL v16 = 1;
    goto LABEL_17;
  }

  if (v8 == 1)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedProperties", 0));
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          channelPropertiesToFetch = self->_channelPropertiesToFetch;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) name]);
          LOBYTE(channelPropertiesToFetch) = -[NSSet containsObject:](channelPropertiesToFetch, "containsObject:", v15);

          if ((channelPropertiesToFetch & 1) != 0)
          {
            BOOL v16 = 1;
            goto LABEL_16;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = 0;
LABEL_16:
  }

  else
  {
LABEL_13:
    BOOL v16 = 0;
  }

- (void)processLatestPersistentHistoryTransactions
{
}

- (void)_processLatestPersistentHistoryTransactions
{
  if (self->_processingIsPaused)
  {
    uint64_t v4 = _MTLogCategoryDatabase(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MTPodcastDerivedPropertyObserver processing is paused. Skipping processLatestPersistentHistoryTransactions.",  buf,  2u);
    }
  }

  else
  {
    kdebug_trace(723517920LL, 0LL, 0LL, 0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009FCB0;
    block[3] = &unk_10023FF98;
    id v6 = objc_alloc_init(&OBJC_CLASS___MTBackgroundTaskManager);
    v59 = v6;
    dispatch_async(&_dispatch_main_q, block);
    kdebug_trace(723517928LL, 0LL, 0LL, 0LL, 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver _historyTransactionsSinceLatestPersistentHistoryToken]( self,  "_historyTransactionsSinceLatestPersistentHistoryToken"));
    kdebug_trace(723517932LL, 0LL, 0LL, 0LL, 0LL);
    *(void *)buf = 0LL;
    v53 = buf;
    uint64_t v54 = 0x3032000000LL;
    v55 = sub_10009EEBC;
    v56 = sub_10009EECC;
    id v57 = 0LL;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x2020000000LL;
    char v51 = 0;
    kdebug_trace(723517936LL, 0LL, 0LL, 0LL, 0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 privateQueueContext]);

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10009FCC0;
    v40[3] = &unk_1002433F0;
    id v12 = v7;
    v46 = &v48;
    id v41 = v12;
    v42 = self;
    id v13 = v9;
    id v43 = v13;
    id v14 = v8;
    id v44 = v14;
    id v15 = v11;
    id v45 = v15;
    v47 = buf;
    [v15 performBlockAndWait:v40];
    kdebug_trace(723517940LL, 0LL, 0LL, 0LL, 0LL);
    if (!v12)
    {
      uint64_t v16 = kdebug_trace(723517944LL, 0LL, 0LL, 0LL, 0LL);
      uint64_t v17 = _MTLogCategoryDatabase(v16);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Derived Property Observer has never processed persistent history data. Will recalculate everything.",  v60,  2u);
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1000A053C;
      v35[3] = &unk_100240AD0;
      id v36 = v15;
      id v37 = v14;
      id v38 = v13;
      v39 = buf;
      [v36 performBlockAndWait:v35];
      *((_BYTE *)v49 + 24) = 1;
      kdebug_trace(723517948LL, 0LL, 0LL, 0LL, 0LL);
    }

    objc_initWeak(&location, self);
    id v19 = [v14 count];
    if (v19)
    {
      uint64_t v20 = _MTLogCategoryDatabase(v19);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v60 = 138543362;
        id v61 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Derived Property Observer did find changes for %{public}@",  v60,  0xCu);
      }

      -[MTPodcastDerivedPropertyObserver _updateDerivedPropertiesForPodcastUUIDs:]( self,  "_updateDerivedPropertiesForPodcastUUIDs:",  v14);
    }

    if ([v13 count])
    {
      handlerQueue = (dispatch_queue_s *)self->_handlerQueue;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1000A0898;
      v31[3] = &unk_100240A08;
      objc_copyWeak(&v33, &location);
      id v32 = v13;
      dispatch_async(handlerQueue, v31);

      objc_destroyWeak(&v33);
    }

    if (*((_BYTE *)v49 + 24))
    {
      id v23 = (dispatch_queue_s *)self->_handlerQueue;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000A09EC;
      v29[3] = &unk_100240290;
      objc_copyWeak(&v30, &location);
      dispatch_async(v23, v29);
      objc_destroyWeak(&v30);
    }

    if (*((void *)v53 + 5))
    {
      id v24 = (dispatch_queue_s *)self->_handlerQueue;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000A0A68;
      v27[3] = &unk_1002419A0;
      objc_copyWeak(&v28, &location);
      v27[4] = buf;
      dispatch_async(v24, v27);
      -[MTPodcastDerivedPropertyObserver setLatestPersistentHistoryToken:]( self,  "setLatestPersistentHistoryToken:",  *((void *)v53 + 5));
      objc_destroyWeak(&v28);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000A0AAC;
    v25[3] = &unk_10023FF98;
    uint64_t v5 = v6;
    __int128 v26 = v5;
    dispatch_async(&_dispatch_main_q, v25);

    kdebug_trace(723517924LL, 0LL, 0LL, 0LL, 0LL);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)reportStatsForPodcasts
{
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  uint64_t v47 = 0LL;
  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  uint64_t v28 = 0LL;
  __int128 v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = 0LL;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateQueueContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A0ED4;
  v15[3] = &unk_100243418;
  __int128 v18 = &v44;
  id v5 = v4;
  id v16 = v5;
  uint64_t v17 = self;
  id v19 = &v40;
  uint64_t v20 = &v36;
  __int128 v21 = &v32;
  id v22 = &v28;
  id v23 = &v24;
  [v5 performBlockAndWait:v15];
  v48[0] = @"total";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v41[3]));
  v49[0] = v6;
  v48[1] = @"subscribed";
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v37[3]));
  v49[1] = v7;
  v48[2] = @"not_subscribed";
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v41[3] - v37[3]));
  v49[2] = v8;
  v48[3] = @"authenticated_dark";
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v33[3]));
  v49[3] = v9;
  v49[4] = &off_100254C50;
  v48[4] = @"feed_dark";
  v48[5] = @"download_dark";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v29[3]));
  v49[5] = v10;
  v48[6] = @"notifications_enabled";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v25[3]));
  v49[6] = v11;
  v48[7] = @"notifications_disabled";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v41[3] - v25[3]));
  v49[7] = v12;
  v48[8] = @"episodes_from_itunes";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v45[3]));
  v49[8] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  9LL));
  +[IMMetrics recordUserAction:dataSource:withData:]( &OBJC_CLASS___IMMetrics,  "recordUserAction:dataSource:withData:",  @"podcast_stats",  0LL,  v14);

  kdebug_trace(723517956LL, 0LL, 0LL, 0LL, 0LL);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

- (void)_updateEpisodeCountsForPodcastUuid:(id)a3
{
  id v4 = a3;
  kdebug_trace(723517960LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10009EEBC;
  id v25 = sub_10009EECC;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  __int128 v18 = sub_10009EEBC;
  id v19 = sub_10009EECC;
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 privateQueueContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A12DC;
  v9[3] = &unk_100243440;
  id v7 = v4;
  id v10 = v7;
  id v8 = v6;
  id v13 = &v21;
  id v14 = &v15;
  id v11 = v8;
  id v12 = self;
  [v8 performBlockAndWait:v9];
  LODWORD(v5) = -[MTPodcastDerivedPropertyObserver setDerivedPropertyValue:forKey:forPodcast:]( self,  "setDerivedPropertyValue:forKey:forPodcast:",  v22[5],  @"kCountOfNewEpisodesKey",  v7);
  if ((-[MTPodcastDerivedPropertyObserver setDerivedPropertyValue:forKey:forPodcast:]( self,  "setDerivedPropertyValue:forKey:forPodcast:",  v16[5],  @"kCountOfUnplayedEpisodesKey",  v7) | v5) == 1) {
    -[MTPodcastDerivedPropertyObserver notifyObserversForPodcast:](self, "notifyObserversForPodcast:", v7);
  }
  kdebug_trace(723517964LL, 0LL, 0LL, 0LL, 0LL);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)episodeResultsChangedForPodcastUuid:(id)a3
{
  id v7 = a3;
  -[MTPodcastDerivedPropertyObserver _updateEpisodeCountsForPodcastUuid:](self, "_updateEpisodeCountsForPodcastUuid:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver didFinishProcessingContextSaveHandlerForTests]( self,  "didFinishProcessingContextSaveHandlerForTests"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:]( self,  "derivedPropertiesForPodcast:",  v7));
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver didFinishProcessingContextSaveHandlerForTests]( self,  "didFinishProcessingContextSaveHandlerForTests"));
    ((void (**)(void, void *))v6)[2](v6, v5);
  }
}

- (void)updateFlagsForPodcastUuid:(id)a3 predicateForUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5
{
  id v8 = a3;
  id v31 = a4;
  id v32 = a5;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 privateQueueContext]);

  kdebug_trace(723517984LL, 0LL, 0LL, 0LL, 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v8));
  [v11 setPredicate:v12];

  [v11 setFetchLimit:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 executeFetchRequest:v11 error:0]);
  id v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPlayed:](&OBJC_CLASS___MTEpisode, "predicateForPlayed:", 0LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v31 AND:v15]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver _predicateForEpisodesToUpdateWithPodcastUuid:predicateForUnplayedInUnplayedTab:predicateForUserEpisodes:]( self,  "_predicateForEpisodesToUpdateWithPodcastUuid:predicateForUnplayedInUnplayedTab:predicateForUserEpisodes:",  v8,  v16,  v32));
    kdebug_trace(723517992LL, 0LL, 0LL, 0LL, 0LL);
    objc_initWeak(&location, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000A1A24;
    v38[3] = &unk_100243468;
    uint64_t v30 = &v45;
    objc_copyWeak(&v45, &location);
    id v18 = v10;
    id v39 = v18;
    id v19 = v17;
    id v40 = v19;
    id v29 = v16;
    id v41 = v29;
    uint64_t v42 = self;
    id v43 = v32;
    id v20 = v8;
    id v44 = v20;
    [v18 performBlockAndWait:v38];
    kdebug_trace(723517996LL, 0LL, 0LL, 0LL, 0LL);
    kdebug_trace(723518016LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:]( &OBJC_CLASS___MTRecencyUtil,  "upNextForPodcastUuid:excludeExplicit:ctx:",  v20,  0LL,  v18));
    uint64_t v22 = kdebug_trace(723518020LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v23 = _MTLogCategoryDefault(v22);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "episodeUuid", v29, &v45));
      [v21 modifiedDate];
      *(_DWORD *)buf = 138543874;
      id v48 = v20;
      __int16 v49 = 2114;
      uint64_t v50 = v25;
      __int16 v51 = 2050;
      uint64_t v52 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "UpNext result from property changed observer for podcast %{public}@: episodeUuid: %{public}@ at %{public}f",  buf,  0x20u);
    }

    if (!-[MTPodcastDerivedPropertyObserver _shouldSkipSettingPropertiesForWatchPPT]( self,  "_shouldSkipSettingPropertiesForWatchPPT"))
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000A1FC4;
      v33[3] = &unk_100240C10;
      id v34 = v20;
      id v35 = v21;
      id v36 = v18;
      id v37 = self;
      [v36 performBlockAndWait:v33];
    }

    kdebug_trace(723517988LL, 0LL, 0LL, 0LL, 0LL);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 podcastForUuid:v8]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 nextEpisodeUuid]);

    if (v28)
    {
      [v27 setNextEpisodeUuid:0];
      [v10 saveInCurrentBlock];
    }

    kdebug_trace(723517988LL, 0LL, 0LL, 0LL, 0LL);
  }
}

- (id)_predicateForEpisodesToUpdateWithPodcastUuid:(id)a3 predicateForUnplayedInUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForUnplayedTabFlag:]( &OBJC_CLASS___MTEpisode,  "predicateForUnplayedTabFlag:",  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForNilValueForKey:]( &OBJC_CLASS___NSPredicate,  "predicateForNilValueForKey:",  kEpisodeUnplayedTab));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 OR:v12]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v8 AND:v13]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v8));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForUnplayedTabFlag:]( &OBJC_CLASS___MTEpisode,  "predicateForUnplayedTabFlag:",  1LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 AND:v15]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v30 OR:v16]);
  [v10 addObject:v17];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUserEpisode:](&OBJC_CLASS___MTEpisode, "predicateForUserEpisode:", 0LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForNilValueForKey:]( &OBJC_CLASS___NSPredicate,  "predicateForNilValueForKey:",  kEpisodeUserEpisode));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 OR:v19]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 AND:v20]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v7));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUserEpisode:](&OBJC_CLASS___MTEpisode, "predicateForUserEpisode:", 1LL));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 AND:v23]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 OR:v24]);
  [v10 addObject:v25];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v9));

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v10));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 AND:v27]);

  return v28;
}

- (id)derivedPropertiesForPodcast:(id)a3
{
  id v4 = a3;
  id v5 = self->_cache;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4));
  if (!v6)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v6, v4);
  }

  objc_sync_exit(v5);

  return v6;
}

- (id)derivedPropertyValueForKey:(id)a3 forPodcast:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:]( self,  "derivedPropertiesForPodcast:",  v7));
    objc_sync_enter(v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
    objc_sync_exit(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)setDerivedPropertyValue:(id)a3 forKey:(id)a4 forPodcast:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length])
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:]( self,  "derivedPropertiesForPodcast:",  v10));
    objc_sync_enter(v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
    unsigned __int8 v13 = [v12 isEqual:v8];
    if (v8) {
      [v11 setObject:v8 forKeyedSubscript:v9];
    }
    else {
      [v11 removeObjectForKey:v9];
    }
    char v14 = v13 ^ 1;

    objc_sync_exit(v11);
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)dependentPropertyForKey:(id)a3 forPodcastUuid:(id)a4
{
  podcastCache = self->_podcastCache;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](podcastCache, "objectForKeyedSubscript:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  return v8;
}

- (void)setDependentPropertyValue:(id)a3 forKey:(id)a4 forPodcastUuid:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_podcastCache, "objectForKeyedSubscript:", v9));
  if (!v10)
  {
    podcastCache = self->_podcastCache;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](podcastCache, "setObject:forKeyedSubscript:", v10, v9);
  }

  [v10 setObject:v12 forKeyedSubscript:v8];
}

- (void)notifyObserversForPodcast:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:]( self,  "derivedPropertiesForPodcast:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver handlers](self, "handlers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A2704;
  v9[3] = &unk_100242520;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

- (NSMutableDictionary)handlers
{
  uint64_t v3 = self->_handlers;
  objc_sync_enter(v3);
  id v4 = -[NSMutableDictionary copy](self->_handlers, "copy");
  objc_sync_exit(v3);

  return (NSMutableDictionary *)v4;
}

- (BOOL)_shouldSkipSettingPropertiesForWatchPPT
{
  return 0;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableDictionary)podcastCache
{
  return self->_podcastCache;
}

- (void)setPodcastCache:(id)a3
{
}

- (NSSet)episodePropertiesToFetch
{
  return self->_episodePropertiesToFetch;
}

- (void)setEpisodePropertiesToFetch:(id)a3
{
}

- (NSSet)podcastPropertiesToFetch
{
  return self->_podcastPropertiesToFetch;
}

- (void)setPodcastPropertiesToFetch:(id)a3
{
}

- (NSSet)channelPropertiesToFetch
{
  return self->_channelPropertiesToFetch;
}

- (void)setChannelPropertiesToFetch:(id)a3
{
}

- (NSSet)podcastStatsProperties
{
  return self->_podcastStatsProperties;
}

- (void)setPodcastStatsProperties:(id)a3
{
}

- (NSPersistentHistoryToken)latestPersistentHistoryToken
{
  return self->_latestPersistentHistoryToken;
}

- (void)setLatestPersistentHistoryToken:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator
{
  return self->_episodeLevelCalculator;
}

- (id)didFinishProcessingContextSaveHandlerForTests
{
  return self->_didFinishProcessingContextSaveHandlerForTests;
}

- (void)setDidFinishProcessingContextSaveHandlerForTests:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)addDerivedPropertyChangeHandler:(id)a3
{
  id v4 = a3;
  id v5 = CFUUIDCreate(0LL);
  id v6 = (__CFString *)CFUUIDCreateString(0LL, v5);
  CFRelease(v5);
  id v7 = self->_handlers;
  objc_sync_enter(v7);
  handlers = self->_handlers;
  id v9 = [v4 copy];
  -[NSMutableDictionary setObject:forKey:](handlers, "setObject:forKey:", v9, v6);

  objc_sync_exit(v7);
  return v6;
}

- (void)removeDerivedPropertyChangeHandler:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = self->_handlers;
    objc_sync_enter(v4);
    -[NSMutableDictionary removeObjectForKey:](self->_handlers, "removeObjectForKey:", v5);
    objc_sync_exit(v4);
  }
}

- (unint64_t)countOfNewEpisodesForPodcast:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver derivedPropertyValueForKey:forPodcast:]( self,  "derivedPropertyValueForKey:forPodcast:",  @"kCountOfNewEpisodesKey",  a3));
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (unint64_t)countOfUnplayedEpisodesForPodcast:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDerivedPropertyObserver derivedPropertyValueForKey:forPodcast:]( self,  "derivedPropertyValueForKey:forPodcast:",  @"kCountOfUnplayedEpisodesKey",  a3));
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

@end