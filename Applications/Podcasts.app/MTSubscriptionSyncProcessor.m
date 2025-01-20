@interface MTSubscriptionSyncProcessor
+ (id)subscriptionSyncProcessorSyncKeys;
- (BOOL)hasLocalChanges;
- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6;
- (BOOL)mergeLocalAndRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6;
- (BOOL)overrideLocalWithRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6;
- (BOOL)requiresNextGetTransaction;
- (BOOL)updatePodcastsToAdd:(id)a3 addingPodcastIfNeeded:(id)a4 hasLocalPodcast:(BOOL)a5;
- (BOOL)updatePodcastsToUnsubscribe:(id)a3 remotePodcast:(id)a4 localPodcast:(id)a5;
- (BOOL)updateSettingsIfNeededForLocalPodcast:(id)a3 remotePodcast:(id)a4;
- (MTSubscriptionSyncProcessor)initWithStorage:(id)a3 config:(id)a4 cloudSyncBugReporter:(id)a5;
- (MTSubscriptionSyncProcessorConfig)config;
- (MTSubscriptionSyncStorageProviding)storageProvider;
- (NSMutableSet)addedSubscriptions;
- (OS_dispatch_queue)workQueue;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)_addedSubscriptions;
- (id)_podcastSubscriptions;
- (id)context;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)logPrefix;
- (id)podcastCacheInContext:(id)a3;
- (id)syncDictionaryToMetricsDictionary:(id)a3;
- (id)unvisitedPodcastsToUnsubscribeIn:(id)a3 mismatch:(BOOL *)a4 version:(id)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (unint64_t)_subscribedPodcastsCount;
- (unint64_t)initialSubscribedPodcastsCount;
- (void)checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:(unint64_t)a3 podcastsToUnsubscribeCount:(unint64_t)a4 newVersion:(id)a5;
- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)importRemotePodcastDicts:(id)a3 inContext:(id)a4 visitingPodcastsInCache:(id)a5 updatingPodcastsToAdd:(id)a6 updatingPodcastsToUnsubscribe:(id)a7 mismatch:(BOOL)a8 version:(id)a9;
- (void)markAddedSubscriptionsAsSynced;
- (void)markAllShowsAsSynced;
- (void)markShowsAsSyncedForPredicate:(id)a3;
- (void)reorderLocalPodcastsToMatchRemote:(id)a3;
- (void)reportImportingRemotePodcast:(id)a3 withLocalPodcast:(id)a4 shouldAddPodcast:(BOOL)a5 shouldUnsubscribeLocalPodcast:(BOOL)a6 shouldUpdateSettings:(BOOL)a7 mismatch:(BOOL)a8 version:(id)a9;
- (void)setAddedSubscriptions:(id)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setConfig:(id)a3;
- (void)setInitialSubscribedPodcastsCount:(unint64_t)a3;
- (void)setStorageProvider:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)subscribeFromCloudToPodcasts:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
- (void)updateSettingsForLocalPodcast:(id)a3 remotePodcast:(id)a4 ctx:(id)a5;
@end

@implementation MTSubscriptionSyncProcessor

- (MTSubscriptionSyncProcessor)initWithStorage:(id)a3 config:(id)a4 cloudSyncBugReporter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MTSubscriptionSyncProcessor;
  v11 = -[MTSubscriptionSyncProcessor init](&v24, "init");
  v12 = v11;
  if (v11)
  {
    -[MTSubscriptionSyncProcessor setConfig:](v11, "setConfig:", v9);
    -[MTSubscriptionSyncProcessor setStorageProvider:](v12, "setStorageProvider:", v8);
    -[MTSubscriptionSyncProcessor setCloudSyncBugReporter:](v12, "setCloudSyncBugReporter:", v10);
    dispatch_queue_t v13 = dispatch_queue_create("MTSubscriptionSyncProcessor.workQueue", 0LL);
    -[MTSubscriptionSyncProcessor setWorkQueue:](v12, "setWorkQueue:", v13);

    uint64_t v15 = _MTLogCategoryCloudSync(v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    v12->_os_signpost_id_t signpostID = os_signpost_id_generate(v16);

    uint64_t v18 = _MTLogCategoryCloudSync(v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    os_signpost_id_t signpostID = v12->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_EVENT,  signpostID,  "MTSubscriptionSyncProcessor.created",  "",  v23,  2u);
    }
  }

  return v12;
}

+ (id)subscriptionSyncProcessorSyncKeys
{
  if (qword_1002B6BF8 != -1) {
    dispatch_once(&qword_1002B6BF8, &stru_1002451C8);
  }
  return (id)qword_1002B6BF0;
}

- (id)context
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 importContext]);

  return v3;
}

- (int64_t)operationTypeForSET
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  id v3 = [v2 syncType];

  if (v3 == (id)1) {
    return 13LL;
  }
  else {
    return 1LL;
  }
}

- (BOOL)hasLocalChanges
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  unsigned __int8 v3 = [v2 syncDirtyFlag];

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _MTLogCategoryCloudSync(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTSubscriptionSyncProcessor.GET",  "key: %@",  (uint8_t *)&v22,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 syncVersion]);

  uint64_t v13 = _MTLogCategoryCloudSync(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v22 = 138543874;
    id v23 = v15;
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Version for GET transaction [%{public}@] key: %{public}@",  (uint8_t *)&v22,  0x20u);
  }

  uint64_t v17 = _MTLogCategoryCloudSync(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v22 = 138543874;
    id v23 = v19;
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Gathering addedSubscriptions for GET transaction [%{public}@] key: %{public}@",  (uint8_t *)&v22,  0x20u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor _addedSubscriptions](self, "_addedSubscriptions"));
  -[MTSubscriptionSyncProcessor setAddedSubscriptions:](self, "setAddedSubscriptions:", v20);

  -[MTSubscriptionSyncProcessor setInitialSubscribedPodcastsCount:]( self,  "setInitialSubscribedPodcastsCount:",  -[MTSubscriptionSyncProcessor _subscribedPodcastsCount](self, "_subscribedPodcastsCount"));
  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  id v8 = +[SyncKeysRepository shouldSyncInReadOnlyMode]( &OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository,  "shouldSyncInReadOnlyMode");
  if ((_DWORD)v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    id v11 = [v10 syncType];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 syncVersion]);
    [v9 reportSubscriptionsSyncIssue:4 subscriptionSyncType:v11 version:v13 userInfo:0];
  }

  uint64_t v14 = _MTLogCategoryCloudSync(v8);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    int v59 = 138412290;
    id v60 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTSubscriptionSyncProcessor.SET",  "key: %@",  (uint8_t *)&v59,  0xCu);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  if ([v18 syncDirtyFlag])
  {
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 syncVersion]);

    if (v20)
    {
      uint64_t v22 = _MTLogCategoryCloudSync(v21);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v25 syncDirtyFlag]));
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 syncVersion]);
        int v59 = 138544130;
        id v60 = v24;
        __int16 v61 = 2114;
        id v62 = v26;
        __int16 v63 = 2114;
        id v64 = v28;
        __int16 v65 = 2114;
        id v66 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ No data for SET transaction. syncDirtyFlag: %{public}@, podcastSyncVersion: %{public}@, key: %{public}@",  (uint8_t *)&v59,  0x2Au);
      }

      goto LABEL_21;
    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  *a5 = (id)objc_claimAutoreleasedReturnValue([v29 syncVersion]);

  uint64_t v31 = _MTLogCategoryCloudSync(v30);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    id v34 = *a5;
    int v59 = 138543874;
    id v60 = v33;
    __int16 v61 = 2114;
    id v62 = v34;
    __int16 v63 = 2114;
    id v64 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Gathering data for SET transaction [%{public}@] key: %{public}@",  (uint8_t *)&v59,  0x20u);
  }

  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor _podcastSubscriptions](self, "_podcastSubscriptions"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor _addedSubscriptions](self, "_addedSubscriptions"));
  -[MTSubscriptionSyncProcessor setAddedSubscriptions:](self, "setAddedSubscriptions:", v35);

  id v36 = -[MTSubscriptionSyncProcessor setInitialSubscribedPodcastsCount:]( self,  "setInitialSubscribedPodcastsCount:",  -[MTSubscriptionSyncProcessor _subscribedPodcastsCount](self, "_subscribedPodcastsCount"));
  if (!v23)
  {
LABEL_21:
    v52 = 0LL;
    goto LABEL_22;
  }

  uint64_t v37 = _MTLogCategoryCloudSync(v36);
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    id v40 = *a5;
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[os_log_s count](v23, "count")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s description](v23, "description"));
    int v59 = 138544387;
    id v60 = v39;
    __int16 v61 = 2114;
    id v62 = v40;
    __int16 v63 = 2114;
    id v64 = v7;
    __int16 v65 = 2114;
    id v66 = v41;
    __int16 v67 = 2113;
    v68 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Providing data for SET transaction [%{public}@] key: %{public}@ : count %{public}@, data: %{private}@",  (uint8_t *)&v59,  0x34u);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 syncVersion]);
  uint64_t v45 = (uint64_t)[v44 integerValue];

  if (!-[os_log_s count](v23, "count") && *a5 && v45 >= 11)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    id v48 = [v47 syncType];
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 syncVersion]);
    [v46 reportSubscriptionsSyncIssue:0 subscriptionSyncType:v48 version:v50 userInfo:0];
  }

  v51 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setArrayValue:](v51, "setArrayValue:", v23);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v51, "value"));

LABEL_22:
  uint64_t v54 = _MTLogCategoryCloudSync(v53);
  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v59 = 138543362;
    id v60 = v56;
    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting subscriptions sync dirty = NO",  (uint8_t *)&v59,  0xCu);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  [v57 setSyncDirtyFlag:0];

  return v52;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  uint64_t v15 = _MTLogCategoryCloudSync(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v19 = 138543874;
    v20 = v17;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Successful GET transaction for key: %{public}@, new version: [%{public}@]",  (uint8_t *)&v19,  0x20u);
  }

  BOOL v18 = -[MTSubscriptionSyncProcessor mergeData:forKey:version:mismatch:]( self,  "mergeData:forKey:version:mismatch:",  v14,  v11,  v12,  0LL);
  -[MTSubscriptionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:mismatch:finishedBlock:",  v12,  v18,  v13);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = _MTLogCategoryCloudSync(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v16 = 138543874;
    uint64_t v17 = v15;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Successful SET transaction for key: %{public}@, new version: [%{public}@]",  (uint8_t *)&v16,  0x20u);
  }

  -[MTSubscriptionSyncProcessor markAddedSubscriptionsAsSynced](self, "markAddedSubscriptionsAsSynced");
  -[MTSubscriptionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:mismatch:finishedBlock:",  v11,  0LL,  v12);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  uint64_t v15 = _MTLogCategoryCloudSync(v14);
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v19 = 138543874;
    __int16 v20 = v17;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Conflict on SET transaction for key: %{public}@, new version: [%{public}@]",  (uint8_t *)&v19,  0x20u);
  }

  BOOL v18 = -[MTSubscriptionSyncProcessor mergeData:forKey:version:mismatch:]( self,  "mergeData:forKey:version:mismatch:",  v14,  v11,  v12,  1LL);
  -[MTSubscriptionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:]( self,  "completeTransactionWithNewVersion:mismatch:finishedBlock:",  v12,  v18,  v13);
}

- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if (+[SyncKeysRepository shouldSyncInReadOnlyMode]( &OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository,  "shouldSyncInReadOnlyMode")) {
    unsigned __int8 v13 = -[MTSubscriptionSyncProcessor overrideLocalWithRemoteData:forKey:version:mismatch:]( self,  "overrideLocalWithRemoteData:forKey:version:mismatch:",  v12,  v11,  v10,  v6);
  }
  else {
    unsigned __int8 v13 = -[MTSubscriptionSyncProcessor mergeLocalAndRemoteData:forKey:version:mismatch:]( self,  "mergeLocalAndRemoteData:forKey:version:mismatch:",  v12,  v11,  v10,  v6);
  }
  BOOL v14 = v13;

  return v14;
}

- (BOOL)overrideLocalWithRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = _MTLogCategoryCloudSync(v12);
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor addedSubscriptions](self, "addedSubscriptions"));
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Read-only sync mode -> Overriding all local data. Local shows that will be overriden: %@; Also, deletin"
      "g all Hidden podcasts synchronously.",
      buf,
      0x16u);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v47 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1001118D0;
  v36[3] = &unk_1002451F0;
  v36[4] = self;
  id v40 = buf;
  id v17 = v10;
  id v37 = v17;
  id v18 = v11;
  id v38 = v18;
  id v34 = v12;
  id v39 = v34;
  BOOL v41 = v6;
  id v19 = [v35 performBlockAndWaitWithSave:v36];
  if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    uint64_t v20 = _MTLogCategoryCloudSync(v19);
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)v44 = 138543362;
      uint64_t v45 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ Found a merge conflict on read-only sync mode!",  v44,  0xCu);
    }

    BOOL v23 = v6;
    id v24 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setKey:](v24, "setKey:", v18);
    -[MZKeyValueStoreNode setValue:](v24, "setValue:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v24, "arrayValue"));
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    id v28 = [v27 syncType];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 syncVersion]);
    v42[0] = @"remoteData";
    v42[1] = @"remoteMismatch";
    uint64_t v31 = @"false";
    if (v23) {
      uint64_t v31 = @"true";
    }
    v43[0] = v25;
    v43[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
    [v26 reportSubscriptionsSyncIssue:3 subscriptionSyncType:v28 version:v30 userInfo:v32];
  }

  _Block_object_dispose(buf, 8);
  return 0;
}

- (BOOL)mergeLocalAndRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  BOOL v59 = a6;
  id v56 = a3;
  id v58 = a4;
  id v57 = a5;
  uint64_t v8 = _MTLogCategoryCloudSync(v57);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2114;
    id v81 = v57;
    __int16 v82 = 1026;
    BOOL v83 = v59;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Merging data for key: %{public}@; newVersion: [%{public}@]; mismatch: %{public}d",
      buf,
      0x26u);
  }

  id v60 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setKey:](v60, "setKey:", v58);
  -[MZKeyValueStoreNode setValue:](v60, "setValue:", v56);
  if (-[MZKeyValueStoreNode hasData](v60, "hasData"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v60, "arrayValue"));
    uint64_t v12 = _MTLogCategoryCloudSync(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      id v15 = [v11 count];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Merging %lu remote dictionaries:",  buf,  0x16u);
    }

    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id obj = v11;
    id v16 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
    id v17 = v16;
    if (v16)
    {
      uint64_t v18 = *(void *)v72;
      do
      {
        id v19 = 0LL;
        do
        {
          if (*(void *)v72 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)v19);
          uint64_t v21 = _MTLogCategoryCloudSync(v16);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
            *(_DWORD *)buf = 138543619;
            *(void *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %{private}@", buf, 0x16u);
          }

          id v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v16 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
        id v17 = v16;
      }

      while (v16);
    }

    if (![obj count])
    {
      uint64_t v24 = _MTLogCategoryCloudSync(0LL);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}@ Nothing to merge: Store node has data, but there are no podcast items.",  buf,  0xCu);
      }

      uint64_t v28 = _MTLogCategoryCloudSync(v27);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode debugDescription](v60, "debugDescription"));
        *(_DWORD *)buf = 138543619;
        *(void *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ Node data: %{private}@",  buf,  0x16u);
      }
    }

    v32 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    v33 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v81) = v59;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_100112110;
    v63[3] = &unk_100245218;
    v63[4] = self;
    id v35 = v34;
    id v64 = v35;
    id v36 = obj;
    id v65 = v36;
    id v37 = v32;
    id v66 = v37;
    id v38 = v33;
    __int16 v67 = v38;
    BOOL v70 = v59;
    id v39 = v57;
    id v68 = v39;
    v69 = buf;
    [v35 performBlockAndWaitWithSave:v63];
    LOBYTE(v59) = (*(unsigned __int8 *)(*(void *)&buf[8] + 24LL) | v59) != 0;
    id v40 = -[NSMutableSet count](v37, "count");
    if (v40)
    {
      uint64_t v41 = _MTLogCategoryCloudSync(v40);
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        id v44 = -[NSMutableSet count](v37, "count");
        *(_DWORD *)v75 = 138543618;
        id v76 = v43;
        __int16 v77 = 2050;
        id v78 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Subscribing to %{public}lu podcasts from cloud sync",  v75,  0x16u);
      }

      -[MTSubscriptionSyncProcessor subscribeFromCloudToPodcasts:](self, "subscribeFromCloudToPodcasts:", v37);
    }

    id v45 = -[NSMutableSet count](v38, "count");
    if (v45)
    {
      uint64_t v46 = _MTLogCategoryCloudSync(v45);
      char v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v48 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        id v49 = -[NSMutableSet count](v38, "count");
        *(_DWORD *)v75 = 138543618;
        id v76 = v48;
        __int16 v77 = 2050;
        id v78 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%{public}@ Unsubscribing %{public}lu podcasts from cloud sync (will be also deleted if they need to)",  v75,  0x16u);
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v38, "allObjects"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
      [v50 disableSubscriptionsWithUuids:v51 ctx:v52];

      -[MTSubscriptionSyncProcessor checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:]( self,  "checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:",  -[MTSubscriptionSyncProcessor initialSubscribedPodcastsCount](self, "initialSubscribedPodcastsCount"),  -[NSMutableSet count](v38, "count"),  v39);
    }

    -[MTSubscriptionSyncProcessor reorderLocalPodcastsToMatchRemote:](self, "reorderLocalPodcastsToMatchRemote:", v36);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v53 = _MTLogCategoryCloudSync(-[MTSubscriptionSyncProcessor markAddedSubscriptionsAsSynced](self, "markAddedSubscriptionsAsSynced"));
    id v36 = (id)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2114;
      id v81 = v58;
      __int16 v82 = 1024;
      BOOL v83 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Nothing to merge: No data in the cloud node version: [%{public}@] key: %{public}@ mismatch:%d",  buf,  0x26u);
    }
  }

  return v59;
}

- (id)podcastCacheInContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MTEntityUpdaterCache);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSyncablePodcastsForSyncType:]( MTPodcast,  "predicateForSyncablePodcastsForSyncType:",  [v6 syncType]));
  uint64_t v8 = kMTPodcastEntityName;
  v12[0] = kPodcastStoreCollectionId;
  v12[1] = kPodcastFeedUrl;
  v12[2] = kPodcastUuid;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  id v10 = -[MTEntityUpdaterCache initWithPredicate:entityName:ctx:properties:fetchProperties:]( v5,  "initWithPredicate:entityName:ctx:properties:fetchProperties:",  v7,  v8,  v4,  v9,  0LL);

  -[MTEntityUpdaterCache setAllowKeyForValue:](v10, "setAllowKeyForValue:", &stru_100245258);
  return v10;
}

- (void)importRemotePodcastDicts:(id)a3 inContext:(id)a4 visitingPodcastsInCache:(id)a5 updatingPodcastsToAdd:(id)a6 updatingPodcastsToUnsubscribe:(id)a7 mismatch:(BOOL)a8 version:(id)a9
{
  BOOL v44 = a8;
  id v14 = a3;
  id v48 = a4;
  id v51 = a5;
  id v47 = a6;
  id v46 = a7;
  id v45 = a9;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = v14;
  id v52 = [v14 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v52)
  {
    uint64_t v15 = *(void *)v55;
    uint64_t v53 = kPodcastFeedUrl;
    uint64_t v42 = kPodcastTitle;
    uint64_t v41 = kPodcastStoreCollectionId;
    uint64_t v50 = kPodcastUuid;
    id v40 = self;
    do
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v53]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v51 propertyDictionaryForSearchItem:v17]);
        uint64_t v20 = _MTLogCategoryCloudSync(v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
          uint64_t v23 = v15;
          if (v19) {
            uint64_t v24 = @"Found";
          }
          else {
            uint64_t v24 = @"Didn't find";
          }
          id v49 = v18;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v42]);
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v53]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v41]);
          id v28 = [v27 unsignedLongLongValue];
          *(_DWORD *)buf = 138544387;
          BOOL v59 = v22;
          __int16 v60 = 2114;
          __int16 v61 = v24;
          uint64_t v15 = v23;
          __int16 v62 = 2113;
          __int16 v63 = v25;
          __int16 v64 = 2113;
          id v65 = v26;
          __int16 v66 = 2049;
          id v67 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %{public}@ local match for podcast %{private}@, %{private}@, %{private}lld",  buf,  0x34u);

          self = v40;
          uint64_t v18 = v49;
        }

        uint64_t v29 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v50]);
        uint64_t v30 = (void *)v29;
        if (v19)
        {
          uint64_t v29 = objc_claimAutoreleasedReturnValue([v48 podcastForUuid:v29]);
          uint64_t v31 = (void *)v29;
          if (v18) {
            goto LABEL_13;
          }
        }

        else
        {
          uint64_t v31 = 0LL;
          if (v18)
          {
LABEL_13:
            BOOL v32 = -[MTSubscriptionSyncProcessor updatePodcastsToUnsubscribe:remotePodcast:localPodcast:]( self,  "updatePodcastsToUnsubscribe:remotePodcast:localPodcast:",  v46,  v17,  v31);
            v33 = v18;
            BOOL v34 = -[MTSubscriptionSyncProcessor updateSettingsIfNeededForLocalPodcast:remotePodcast:]( self,  "updateSettingsIfNeededForLocalPodcast:remotePodcast:",  v31,  v17);
            BOOL v35 = -[MTSubscriptionSyncProcessor updatePodcastsToAdd:addingPodcastIfNeeded:hasLocalPodcast:]( self,  "updatePodcastsToAdd:addingPodcastIfNeeded:hasLocalPodcast:",  v47,  v17,  v31 != 0LL);
            BOOL v36 = v34;
            uint64_t v18 = v33;
            -[MTSubscriptionSyncProcessor reportImportingRemotePodcast:withLocalPodcast:shouldAddPodcast:shouldUnsubscribeLocalPodcast:shouldUpdateSettings:mismatch:version:]( self,  "reportImportingRemotePodcast:withLocalPodcast:shouldAddPodcast:shouldUnsubscribeLocalPodcast:shouldUpdateS ettings:mismatch:version:",  v17,  v31,  v35,  v32,  v36,  v44,  v45);
            goto LABEL_18;
          }
        }

        uint64_t v37 = _MTLogCategoryCloudSync(v29);
        id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
          *(_DWORD *)buf = 138543362;
          BOOL v59 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%{public}@ Found podcast in BK with nil feedURL. Can't follow it. Continuing to next one.",  buf,  0xCu);
        }

LABEL_18:
      }

      id v52 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    }

    while (v52);
  }
}

- (BOOL)updatePodcastsToUnsubscribe:(id)a3 remotePodcast:(id)a4 localPodcast:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kPodcastSubscribed]);
  unsigned int v12 = [v11 BOOLValue];

  if (v10 && (id v13 = [v10 subscribed], ((v13 ^ 1 | v12) & 1) == 0))
  {
    uint64_t v15 = _MTLogCategoryCloudSync(v13);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 feedURL]);
      id v20 = [v10 storeCollectionId];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
      int v25 = 138544643;
      __int16 v26 = v17;
      __int16 v27 = 2113;
      id v28 = v18;
      __int16 v29 = 2113;
      uint64_t v30 = v19;
      __int16 v31 = 2049;
      id v32 = v20;
      __int16 v33 = 2114;
      BOOL v34 = v21;
      __int16 v35 = 2113;
      BOOL v36 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Marking local podcast for unsubscribe: %{private}@, %{private}@, %{private}lld, %{public}@. Remot e dict: %{private}@",  (uint8_t *)&v25,  0x3Eu);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
    [v8 addObject:v23];

    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)updateSettingsIfNeededForLocalPodcast:(id)a3 remotePodcast:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  if (v6) {
    -[MTSubscriptionSyncProcessor updateSettingsForLocalPodcast:remotePodcast:ctx:]( self,  "updateSettingsForLocalPodcast:remotePodcast:ctx:",  v6,  v7,  v8);
  }

  return v6 != 0LL;
}

- (BOOL)updatePodcastsToAdd:(id)a3 addingPodcastIfNeeded:(id)a4 hasLocalPodcast:(BOOL)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kPodcastSubscribed]);
  unsigned int v11 = [v10 BOOLValue];

  int v13 = v11 & ~v5;
  if (v13 == 1)
  {
    uint64_t v14 = _MTLogCategoryCloudSync(v12);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
      int v19 = 138543619;
      id v20 = v16;
      __int16 v21 = 2113;
      id v22 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Marking remote podcast for insertion in local DB [reason: not in local DB and subscribed]: %{private}@",  (uint8_t *)&v19,  0x16u);
    }

    [v8 addObject:v9];
  }

  return v13;
}

- (void)reportImportingRemotePodcast:(id)a3 withLocalPodcast:(id)a4 shouldAddPodcast:(BOOL)a5 shouldUnsubscribeLocalPodcast:(BOOL)a6 shouldUpdateSettings:(BOOL)a7 mismatch:(BOOL)a8 version:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor config](self, "config"));
  unsigned int v19 = [v18 supportsMetrics];

  if (v19)
  {
    id v20 = [v15 mutableCopy];
    [v20 setValue:v17 forKey:@"version"];
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
    [v20 setValue:v21 forKey:@"mismatch"];

    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[MTSubscriptionSyncProcessor syncDictionaryToMetricsDictionary:]( self,  "syncDictionaryToMetricsDictionary:",  v15));
    [v20 setValue:v22 forKey:@"sync_data"];

    if (v10)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
      [v24 recordUserAction:@"cloud_sync_update_podcast" dataSource:v16 withData:v20];

      if (!v11)
      {
LABEL_4:
        if (!v12)
        {
LABEL_6:

          goto LABEL_7;
        }

- (id)unvisitedPodcastsToUnsubscribeIn:(id)a3 mismatch:(BOOL *)a4 version:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100112F08;
  v16[3] = &unk_100245280;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  uint64_t v18 = self;
  id v19 = v8;
  __int16 v21 = a4;
  BOOL v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v20 = v10;
  id v11 = v8;
  id v12 = v17;
  [v9 enumerateUnvisitedItemUuids:v16];

  int v13 = v20;
  uint64_t v14 = v10;

  return v14;
}

- (void)checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:(unint64_t)a3 podcastsToUnsubscribeCount:(unint64_t)a4 newVersion:(id)a5
{
  double v8 = (double)a4 / (double)a3;
  uint64_t v9 = _MTLogCategoryCloudSync(self);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a3 >= 0xA && v8 >= 0.8)
  {
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      int v21 = 138543874;
      id v22 = v12;
      __int16 v23 = 2048;
      unint64_t v24 = a4;
      __int16 v25 = 2048;
      unint64_t v26 = *(void *)&v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Big library unsubscription detected: podcastsToUnsubscribeCount: %lu, unsubscribedRatio: %f",  (uint8_t *)&v21,  0x20u);
    }

    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    id v14 = [v13 syncType];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 syncVersion]);
    v29[0] = @"previouslyFollowedShowsCount";
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    v30[0] = v17;
    v29[1] = @"showsToUnfollowCount";
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v30[1] = v18;
    void v29[2] = @"unfollowRatio";
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
    v30[2] = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
    -[os_log_s reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:]( v10,  "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:",  1LL,  v14,  v16,  v20);

    goto LABEL_8;
  }

  if (v11)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v21 = 138544130;
    id v22 = v13;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    __int16 v27 = 2048;
    double v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %ld unsubscriptions detected out of %ld total subscribed shows, unsubscriptionRatio: %f",  (uint8_t *)&v21,  0x2Au);
LABEL_8:
  }
}

- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5
{
  BOOL v6 = a4;
  double v8 = (__CFString *)a3;
  uint64_t v9 = (void (**)(id, BOOL))a5;
  uint64_t v10 = _MTLogCategoryCloudSync(v9);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v14 = @"NO";
    if (v6) {
      id v14 = @"YES";
    }
    int v35 = 138412290;
    uint64_t v36 = (uint64_t)v14;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  signpostID,  "MTSubscriptionSyncProcessor.completed",  "mismatch %@",  (uint8_t *)&v35,  0xCu);
  }

  uint64_t v16 = _MTLogCategoryCloudSync(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 syncVersion]);
    int v35 = 138544130;
    uint64_t v36 = (uint64_t)v18;
    __int16 v37 = 2114;
    id v38 = v8;
    __int16 v39 = 2114;
    id v40 = v20;
    __int16 v41 = 1024;
    BOOL v42 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Transaction complete: Updating sync version to %{public}@ (from %{public}@), mismatch %d",  (uint8_t *)&v35,  0x26u);
  }

  int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  [v21 setSyncVersion:v8];

  uint64_t v23 = _MTLogCategoryCloudSync(v22);
  unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v35 = 138543362;
    uint64_t v36 = (uint64_t)v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Cleaning up old hidden podcasts after successful transaction",  (uint8_t *)&v35,  0xCu);
  }

  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  [v26 cleanUpOldHiddenPodcasts];

  uint64_t v28 = _MTLogCategoryCloudSync(v27);
  __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    __int16 v31 = (void *)v30;
    id v32 = @"NO";
    if (v6) {
      id v32 = @"YES";
    }
    int v35 = 138543618;
    uint64_t v36 = v30;
    __int16 v37 = 2114;
    id v38 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting subscriptions sync dirty = %{public}@",  (uint8_t *)&v35,  0x16u);
  }

  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  [v33 setSyncDirtyFlag:v6];

  if (!v6)
  {
    BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    [v34 updateSubscriptionsLastSyncTimestamp];
  }

  v9[2](v9, v6);
}

- (void)reorderLocalPodcastsToMatchRemote:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _MTLogCategoryCloudSync(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Reordering local podcasts to match remote dictionaries:",  buf,  0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100113AE0;
  v10[3] = &unk_100240980;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  id v12 = v4;
  int v13 = self;
  id v8 = v4;
  id v9 = v11;
  [v9 performBlockAndWaitWithSave:v10];
}

- (id)syncDictionaryToMetricsDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) subscriptionSyncProcessorSyncKeys];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryWithValuesForKeys:v6]);

  return v7;
}

- (id)_addedSubscriptions
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSyncablePodcastsForSyncType:]( MTPodcast,  "predicateForSyncablePodcastsForSyncType:",  [v4 syncType]));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  kPodcastFeedUrl));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 AND:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForHasBeenSynced:](&OBJC_CLASS___MTPodcast, "predicateForHasBeenSynced:", 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 AND:v8]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10011412C;
  v16[3] = &unk_100240C10;
  id v17 = v3;
  id v18 = v9;
  id v19 = self;
  uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v20 = v10;
  id v11 = v9;
  id v12 = v3;
  [v12 performBlockAndWait:v16];
  int v13 = v20;
  id v14 = v10;

  return v14;
}

- (unint64_t)_subscribedPodcastsCount
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSyncablePodcastsForSyncType:]( MTPodcast,  "predicateForSyncablePodcastsForSyncType:",  [v4 syncType]));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  kPodcastFeedUrl));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 AND:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSubscribedPodcasts](&OBJC_CLASS___MTPodcast, "predicateForSubscribedPodcasts"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 AND:v8]);

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001144DC;
  v14[3] = &unk_1002404B8;
  id v17 = &v18;
  id v10 = v3;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  [v10 performBlockAndWait:v14];
  unint64_t v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void)markAddedSubscriptionsAsSynced
{
  uint64_t v3 = _MTLogCategoryCloudSync(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor addedSubscriptions](self, "addedSubscriptions"));
    int v9 = 138543619;
    id v10 = v5;
    __int16 v11 = 2113;
    unint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Marking new subscriptions as synced: %{private}@",  (uint8_t *)&v9,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor addedSubscriptions](self, "addedSubscriptions"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUuids:](&OBJC_CLASS___MTPodcast, "predicateForPodcastUuids:", v7));

  -[MTSubscriptionSyncProcessor markShowsAsSyncedForPredicate:](self, "markShowsAsSyncedForPredicate:", v8);
}

- (void)markAllShowsAsSynced
{
  uint64_t v3 = _MTLogCategoryCloudSync(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    int v8 = 138543362;
    int v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Marking all shows as synced",  (uint8_t *)&v8,  0xCu);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSyncablePodcastsForSyncType:]( MTPodcast,  "predicateForSyncablePodcastsForSyncType:",  [v6 syncType]));

  -[MTSubscriptionSyncProcessor markShowsAsSyncedForPredicate:](self, "markShowsAsSyncedForPredicate:", v7);
}

- (void)markShowsAsSyncedForPredicate:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001147D4;
  v7[3] = &unk_100240240;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlockAndWaitWithSave:v7];
}

- (id)_podcastSubscriptions
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100114A2C;
  v11[3] = &unk_100240980;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  int v13 = self;
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v14 = v3;
  id v4 = v12;
  [v4 performBlockAndWait:v11];
  if (!-[NSMutableArray count](v3, "count"))
  {
    uint64_t v5 = _MTLogCategoryCloudSync(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ WARNING: Syncing up an empty podcast library",  buf,  0xCu);
    }
  }

  id v8 = v14;
  id v9 = v3;

  return v9;
}

- (void)subscribeFromCloudToPodcasts:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  [v6 subscriptionsLastSyncTimestamp];
  uint64_t v8 = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100114F78;
  v11[3] = &unk_1002452F8;
  id v12 = v4;
  int v13 = self;
  id v14 = v5;
  uint64_t v15 = v8;
  id v9 = v5;
  id v10 = v4;
  [v9 performBlockAndWaitWithSave:v11];
}

- (void)updateSettingsForLocalPodcast:(id)a3 remotePodcast:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v98 = a5;
  uint64_t v9 = _MTLogCategoryCloudSync(v98);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
    id v14 = [v7 storeCollectionId];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    *(_DWORD *)buf = 138544643;
    v103 = v11;
    __int16 v104 = 2113;
    id v105 = v12;
    __int16 v106 = 2113;
    v107 = v13;
    __int16 v108 = 2049;
    id v109 = v14;
    __int16 v110 = 2114;
    id v111 = v15;
    __int16 v112 = 2113;
    id v113 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Updating settings for podcast: %{private}@, %{private}@, %{private}lld, %{public}@. Remote dictionary: %{private}@",  buf,  0x3Eu);
  }

  [v7 setHasBeenSynced:1];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kPodcastSubscribed]);
  unsigned int v18 = [v17 BOOLValue];

  id v19 = [v7 subscribed];
  if ((v19 & 1) != 0 || !v18)
  {
    uint64_t v29 = _MTLogCategoryCloudSync(v19);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
      id v33 = [v7 storeCollectionId];
      BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      *(_DWORD *)buf = 138544387;
      v103 = v30;
      __int16 v104 = 2113;
      id v105 = v31;
      __int16 v106 = 2113;
      v107 = v32;
      __int16 v108 = 2049;
      id v109 = v33;
      __int16 v110 = 2114;
      id v111 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping unsubscription of remotely unsubscribed podcast [reason: all unsubscriptions should be handl ed in batch later in the process]: %{private}@, %{private}@, %{private}lld, %{public}@",  buf,  0x34u);
    }
  }

  else
  {
    uint64_t v20 = _MTLogCategoryCloudSync(v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
      id v25 = [v7 storeCollectionId];
      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      *(_DWORD *)buf = 138544387;
      v103 = v22;
      __int16 v104 = 2113;
      id v105 = v23;
      __int16 v106 = 2113;
      v107 = v24;
      __int16 v108 = 2049;
      id v109 = v25;
      __int16 v110 = 2114;
      id v111 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Enabling subscription for podcast: %{private}@, %{private}@, %{private}lld, %{public}@",  buf,  0x34u);
    }

    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    -[os_log_s enableSubscriptionOnPodcastUuid:ctx:](v27, "enableSubscriptionOnPodcastUuid:ctx:", v28, v98);
  }

LABEL_12:
  int v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kPodcastShowTypeSetting]);
  uint64_t v36 = v35;
  if (v35)
  {
    __int16 v37 = v35;
    id v38 = [v35 longLongValue];
    uint64_t v39 = _MTLogCategoryCloudSync(v38);
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
      id v44 = [v7 storeCollectionId];
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      *(_DWORD *)buf = 138544643;
      v103 = v41;
      __int16 v104 = 2050;
      id v105 = v38;
      __int16 v106 = 2113;
      v107 = v42;
      __int16 v108 = 2113;
      id v109 = v43;
      __int16 v110 = 2049;
      id v111 = v44;
      __int16 v112 = 2114;
      id v113 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Subscriptions Sync wants to set show type setting to %{public}lld, for podcast: %{private}@, %{pr ivate}@, %{private}lld, %{public}@",  buf,  0x3Eu);
    }

    [v7 setShowTypeSetting:v38];
    uint64_t v36 = v37;
  }

  v101 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kPodcastLastTouchDate]);
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kPodcastDarkCount]);
  if (v46)
  {
    if (v101)
    {
      [v7 lastTouchDate];
      id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      id v48 = [v47 compare:v101];

      if (v48 == (id)-1LL)
      {
        unint64_t v49 = (unint64_t)[v7 isDark];
        uint64_t v50 = _MTLogCategoryCloudSync(v49);
        id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          id v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
          id v93 = [v46 longLongValue];
          unsigned int v96 = v49;
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
          id v55 = [v7 storeCollectionId];
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
          *(_DWORD *)buf = 138544643;
          v103 = v52;
          __int16 v104 = 2050;
          id v105 = v93;
          __int16 v106 = 2113;
          v107 = v53;
          __int16 v108 = 2113;
          id v109 = v54;
          __int16 v110 = 2049;
          id v111 = v55;
          __int16 v112 = 2114;
          id v113 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting darkCount = %{public}lld for podcast: %{private}@, %{private}@, %{private}lld, %{public}@",  buf,  0x3Eu);

          unint64_t v49 = v96;
        }

        objc_msgSend(v7, "setDarkCount:", objc_msgSend(v46, "longLongValue"));
        if ((_DWORD)v49 != [v7 isDark])
        {
          id v57 = (id)v49;
          id v58 = [v7 isDark];
          BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v7 latestExitFromDarkDownloads]);
          if (v59)
          {
            __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:]( &OBJC_CLASS___PFAnalyticsEvent,  "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:",  v57,  v58,  6LL,  v59));
          }

          else
          {
            __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:]( &OBJC_CLASS___PFAnalyticsEvent,  "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:",  v57,  v58,  6LL,  v61));
          }

          __int16 v62 = (void *)objc_opt_new(&OBJC_CLASS___PFCoreAnalyticsChannel);
          [v62 sendEvent:v60];
        }
      }
    }
  }

  __int16 v63 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
  uint64_t v64 = kPodcastFeedUrl;
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kPodcastFeedUrl]);
  unsigned __int8 v66 = [v63 isEqualToString:v65];

  if ((v66 & 1) == 0)
  {
    uint64_t v68 = _MTLogCategoryCloudSync(v67);
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      __int128 v71 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v64]);
      __int128 v72 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
      __int128 v73 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
      id v94 = v8;
      __int128 v74 = v46;
      id v75 = [v7 storeCollectionId];
      v97 = v36;
      id v76 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      *(_DWORD *)buf = 138544643;
      v103 = v70;
      __int16 v104 = 2113;
      id v105 = v71;
      __int16 v106 = 2113;
      v107 = v72;
      __int16 v108 = 2113;
      id v109 = v73;
      __int16 v110 = 2049;
      id v111 = v75;
      id v46 = v74;
      id v8 = v94;
      __int16 v112 = 2114;
      id v113 = v76;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting feedURL = %{private}@ for podcast: %{private}@, %{private}@, %{private}lld, %{public}@",  buf,  0x3Eu);

      uint64_t v36 = v97;
    }

    __int16 v77 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v64]);
    [v7 setFeedURL:v77];
  }

  id v78 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kPodcastAddedDate]);
  v79 = v78;
  if (v78)
  {
    [v78 timeIntervalSinceReferenceDate];
    double v81 = v80;
    id v82 = [v7 addedDate];
    if (v81 < v83)
    {
      uint64_t v84 = _MTLogCategoryCloudSync(v82);
      v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        [v79 timeIntervalSinceReferenceDate];
        v88 = v87;
        v100 = (void *)objc_claimAutoreleasedReturnValue([v79 description]);
        v89 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
        v90 = (void *)objc_claimAutoreleasedReturnValue([v7 feedURL]);
        id v91 = [v7 storeCollectionId];
        v95 = v46;
        v92 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
        *(_DWORD *)buf = 138544899;
        v103 = v86;
        __int16 v104 = 2050;
        id v105 = v88;
        __int16 v106 = 2114;
        v107 = v100;
        __int16 v108 = 2113;
        id v109 = v89;
        __int16 v110 = 2113;
        id v111 = v90;
        __int16 v112 = 2049;
        id v113 = v91;
        __int16 v114 = 2114;
        v115 = v92;
        _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting addedDate = %{public}f(%{public}@) for podcast: %{private}@, %{private}@, %{private}lld, %{public}@",  buf,  0x48u);

        id v46 = v95;
      }

      [v79 timeIntervalSinceReferenceDate];
      objc_msgSend(v7, "setAddedDate:");
    }
  }
}

- (id)logPrefix
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  id v3 = [v2 syncType];

  if (v3 == (id)1) {
    return @"[Subscription V3 Sync]";
  }
  else {
    return @"[Subscription Sync]";
  }
}

- (NSMutableSet)addedSubscriptions
{
  return self->_addedSubscriptions;
}

- (void)setAddedSubscriptions:(id)a3
{
}

- (MTSubscriptionSyncProcessorConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (MTSubscriptionSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (unint64_t)initialSubscribedPodcastsCount
{
  return self->_initialSubscribedPodcastsCount;
}

- (void)setInitialSubscribedPodcastsCount:(unint64_t)a3
{
  self->_initialSubscribedPodcastsCount = a3;
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