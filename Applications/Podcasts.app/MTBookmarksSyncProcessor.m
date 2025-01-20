@interface MTBookmarksSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)requiresNextGetTransaction;
- (MTBookmarksSyncProcessor)initWithStorageProvider:(id)a3 cloudSyncBugReporter:(id)a4;
- (MTBookmarksSyncStorageProviding)storageProvider;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)findEpisodeByFeedURL:(id)a3 guid:(id)a4 inContext:(id)a5;
- (id)findEpisodeByStoreID:(int64_t)a3 inContext:(id)a4;
- (id)logPrefix;
- (id)predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs:(id)a3;
- (id)predicateForBookmarksSyncType;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)bumpBookmarksSyncVersionToVersion:(id)a3;
- (void)checkPotentialLibraryDeletionIssueForRemoteBookmarksCount:(unint64_t)a3 episodesToUnbookmarkCount:(unint64_t)a4 newVersion:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)finishSuccessfulTransactionWithNewVersion:(id)a3 finishedBlock:(id)a4;
- (void)markEverythingAsSyncedWithVersion:(id)a3;
- (void)rescheduleTransactionWithFinishedBlock:(id)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
- (void)updateLocalCacheIfNeededWithData:(id)a3 version:(id)a4;
@end

@implementation MTBookmarksSyncProcessor

- (MTBookmarksSyncProcessor)initWithStorageProvider:(id)a3 cloudSyncBugReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MTBookmarksSyncProcessor;
  v8 = -[MTBookmarksSyncProcessor init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    -[MTBookmarksSyncProcessor setStorageProvider:](v8, "setStorageProvider:", v6);
    uint64_t v10 = _MTLogCategoryCloudSync(-[MTBookmarksSyncProcessor setCloudSyncBugReporter:](v9, "setCloudSyncBugReporter:", v7));
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v9->_os_signpost_id_t signpostID = os_signpost_id_generate(v11);

    uint64_t v13 = _MTLogCategoryCloudSync(v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    os_signpost_id_t signpostID = v9->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  signpostID,  "MTBookmarksSyncProcessor.created",  "",  v18,  2u);
    }
  }

  return v9;
}

- (int64_t)operationTypeForSET
{
  return 11LL;
}

- (BOOL)hasLocalChanges
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
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
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTBookmarksSyncProcessor.GET",  "key: %@",  (uint8_t *)&v17,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 syncVersion]);

  uint64_t v13 = _MTLogCategoryCloudSync(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    int v17 = 138412802;
    id v18 = v15;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ Version for GET transaction key: %@, vers: %@",  (uint8_t *)&v17,  0x20u);
  }

  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = _MTLogCategoryCloudSync(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTBookmarksSyncProcessor.SET",  "key: %@",  buf,  0xCu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  if ([v12 syncDirtyFlag])
  {

LABEL_10:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 importContext]);

    v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllBookmarkedEpisodes]( &OBJC_CLASS___MTEpisode,  "predicateForAllBookmarkedEpisodes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 AND:v28]);

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1000C4E48;
    v51[3] = &unk_100240980;
    id v17 = v25;
    id v52 = v17;
    id v30 = v29;
    id v53 = v30;
    v31 = v26;
    v54 = v31;
    [v17 performBlockAndWait:v51];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    *a5 = (id)objc_claimAutoreleasedReturnValue([v32 syncVersion]);

    uint64_t v34 = _MTLogCategoryCloudSync(v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      id v37 = v7;
      id v38 = *a5;
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](v31, "count")));
      id v50 = v17;
      id v40 = v30;
      v41 = a5;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](v31, "description"));
      *(_DWORD *)buf = 138413314;
      id v56 = v36;
      __int16 v57 = 2112;
      id v58 = v38;
      id v7 = v37;
      __int16 v59 = 2112;
      v60 = v37;
      __int16 v61 = 2112;
      id v62 = v39;
      __int16 v63 = 2112;
      v64 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@ Providing data for SET transaction [%@] key: %@ : count %@, data: %@",  buf,  0x34u);

      a5 = v41;
      id v30 = v40;
      id v17 = v50;
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 syncVersion]);
    uint64_t v45 = (uint64_t)[v44 integerValue];

    if (!-[NSMutableArray count](v31, "count") && *a5 && v45 >= 11)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
      objc_msgSend( v46,  "reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:",  0,  objc_msgSend(v47, "syncType"),  *a5,  0);
    }

    v48 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setArrayValue:](v48, "setArrayValue:", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v48, "value"));

    goto LABEL_17;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 syncVersion]);

  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v16 = _MTLogCategoryCloudSync(v15);
  id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 syncDirtyFlag]));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 syncVersion]);
    *(_DWORD *)buf = 138413058;
    id v56 = v18;
    __int16 v57 = 2112;
    id v58 = v20;
    __int16 v59 = 2112;
    v60 = v22;
    __int16 v61 = 2112;
    id v62 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_INFO,  "%@ No data for SET transaction. bookmarksSyncDirtyFlag: %@, bookmarksSyncVersion: %@, key: %@",  buf,  0x2Au);
  }

  v23 = 0LL;
LABEL_17:

  return v23;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
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
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    int v18 = 138412802;
    __int16 v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ Updating local cache after GET transaction for key %@, new version: [%{public}@]",  (uint8_t *)&v18,  0x20u);
  }

  -[MTBookmarksSyncProcessor updateLocalCacheIfNeededWithData:version:]( self,  "updateLocalCacheIfNeededWithData:version:",  v14,  v12);
  -[MTBookmarksSyncProcessor finishSuccessfulTransactionWithNewVersion:finishedBlock:]( self,  "finishSuccessfulTransactionWithNewVersion:finishedBlock:",  v12,  v13);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  id v12 = a6;
  uint64_t v13 = _MTLogCategoryCloudSync(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    int v16 = 138412546;
    id v17 = v15;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ Successful SET transaction for key %@, marking everything as synced and finishing normally",  (uint8_t *)&v16,  0x16u);
  }

  -[MTBookmarksSyncProcessor finishSuccessfulTransactionWithNewVersion:finishedBlock:]( self,  "finishSuccessfulTransactionWithNewVersion:finishedBlock:",  v12,  v11);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = _MTLogCategoryCloudSync(v14);
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    int v18 = 138412546;
    id v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ Failure on SET transaction for key %@. Bookkeeper copy has diverged from local copy, we must merge both",  (uint8_t *)&v18,  0x16u);
  }

  -[MTBookmarksSyncProcessor updateLocalCacheIfNeededWithData:version:]( self,  "updateLocalCacheIfNeededWithData:version:",  v14,  v13);
  -[MTBookmarksSyncProcessor bumpBookmarksSyncVersionToVersion:](self, "bumpBookmarksSyncVersionToVersion:", v13);

  -[MTBookmarksSyncProcessor rescheduleTransactionWithFinishedBlock:]( self,  "rescheduleTransactionWithFinishedBlock:",  v12);
}

- (void)updateLocalCacheIfNeededWithData:(id)a3 version:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _MTLogCategoryCloudSync(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138543618;
    id v39 = v10;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Merging data for newVersion: [%{public}@];",
      buf,
      0x16u);
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setValue:](v11, "setValue:", v7);

  BOOL v12 = -[MZKeyValueStoreNode hasData](v11, "hasData");
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v11, "arrayValue"));
    uint64_t v14 = _MTLogCategoryCloudSync(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      id v17 = [v13 count];
      *(_DWORD *)buf = 138543618;
      id v39 = v16;
      __int16 v40 = 2048;
      id v41 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Merging %lu remote dictionaries:",  buf,  0x16u);
    }

    if (![v13 count])
    {
      uint64_t v18 = _MTLogCategoryCloudSync(0LL);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
        *(_DWORD *)buf = 138543362;
        id v39 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ Nothing to merge: Store node has data, but there are no bookmark items.",  buf,  0xCu);
      }

      uint64_t v22 = _MTLogCategoryCloudSync(v21);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode debugDescription](v11, "debugDescription"));
        *(_DWORD *)buf = 138543619;
        id v39 = v24;
        __int16 v40 = 2113;
        id v41 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@ Node data: %{private}@",  buf,  0x16u);
      }
    }

    unsigned __int8 v26 = +[PFNotificationSettings canSendNotification]( &OBJC_CLASS___PFNotificationSettings,  "canSendNotification");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 importContext]);

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000C57C8;
    v32[3] = &unk_100243D28;
    id v33 = v13;
    uint64_t v34 = self;
    id v35 = v28;
    unsigned __int8 v37 = v26;
    id v36 = v6;
    id v29 = v28;
    id v30 = v13;
    [v29 performBlockAndWaitWithSave:v32];

    goto LABEL_15;
  }

  uint64_t v31 = _MTLogCategoryCloudSync(v12);
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138543618;
    id v39 = v29;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Nothing to merge: No data in the cloud node version: [%{public}@]",  buf,  0x16u);
LABEL_15:
  }
}

- (void)checkPotentialLibraryDeletionIssueForRemoteBookmarksCount:(unint64_t)a3 episodesToUnbookmarkCount:(unint64_t)a4 newVersion:(id)a5
{
  uint64_t v8 = _MTLogCategoryCloudSync(self);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (a3 || a4 < 0xA)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138543874;
      id v23 = v19;
      __int16 v24 = 2048;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %lu local bookmarks removed, and %lu new bookmarks added",  buf,  0x20u);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138543874;
      id v23 = v11;
      __int16 v24 = 2048;
      unint64_t v25 = 0LL;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ Big library unbookmarking detected: remoteBookmarksCount: %lu, episodesToUnbookmarkCount: %lu",  buf,  0x20u);
    }

    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    id v13 = [v12 syncType];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 syncVersion]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  0LL,  @"remoteBookmarksCount"));
    v20[1] = @"episodesToUnbookmarkCount";
    v21[0] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v21[1] = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    -[os_log_s reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:]( v10,  "reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:",  1LL,  v13,  v15,  v18);
  }
}

- (id)findEpisodeByStoreID:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
  uint64_t v8 = kMTEpisodeEntityName;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodeStoreTrackId:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodeStoreTrackId:",  a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 AND:v7]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectInEntity:v8 predicate:v10]);

  return v11;
}

- (id)findEpisodeByFeedURL:(id)a3 guid:(id)a4 inContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodeGuid:onFeedURL:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodeGuid:onFeedURL:",  v9,  v10));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 AND:v11]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectInEntity:kMTEpisodeEntityName predicate:v13]);

  return v14;
}

- (void)markEverythingAsSyncedWithVersion:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setLastSyncTimestamp:");

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  [v5 setSyncDirtyFlag:0];
}

- (void)bumpBookmarksSyncVersionToVersion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  [v5 setSyncVersion:v4];
}

- (id)predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  [v5 lastSyncTimestamp];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForDateKey:isLessThanDate:]( &OBJC_CLASS___NSPredicate,  "predicateForDateKey:isLessThanDate:",  kEpisodeLastBookmarkedDate,  v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 AND:v9]);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForBookmarkedEpisodesExcludingUUIDs:]( &OBJC_CLASS___MTEpisode,  "predicateForBookmarkedEpisodesExcludingUUIDs:",  v4));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 AND:v11]);

  return v13;
}

- (id)predicateForBookmarksSyncType
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRSSEpisodes](&OBJC_CLASS___MTEpisode, "predicateForRSSEpisodes"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  id v5 = [v4 syncType];

  if (v5 == (id)1)
  {
    uint64_t v6 = kEpisodePriceType;
    uint64_t v7 = NSPersistentStringForMTEpisodePriceType(2LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v16[0] = v8;
    uint64_t v9 = NSPersistentStringForMTEpisodePriceType(3LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16[1] = v10;
    uint64_t v11 = NSPersistentStringForMTEpisodePriceType(4LL);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v16[2] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K IN %@)",  v6,  v13));
  }

  else
  {
    id v14 = v3;
  }

  return v14;
}

- (void)finishSuccessfulTransactionWithNewVersion:(id)a3 finishedBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  id v7 = a3;
  uint64_t v8 = _MTLogCategoryCloudSync(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  signpostID,  "MTSubscriptionSyncProcessor.completed",  "",  v12,  2u);
  }

  -[MTBookmarksSyncProcessor markEverythingAsSyncedWithVersion:](self, "markEverythingAsSyncedWithVersion:", v7);
  if (v6) {
    v6[2](v6, 0LL);
  }
}

- (void)rescheduleTransactionWithFinishedBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = _MTLogCategoryCloudSync(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  signpostID,  "MTSubscriptionSyncProcessor.mismatch",  "",  v9,  2u);
  }

  if (v4) {
    v4[2](v4, 1LL);
  }
}

- (id)logPrefix
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 logPrefix]);

  return v3;
}

- (MTBookmarksSyncStorageProviding)storageProvider
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

- (void).cxx_destruct
{
}

@end