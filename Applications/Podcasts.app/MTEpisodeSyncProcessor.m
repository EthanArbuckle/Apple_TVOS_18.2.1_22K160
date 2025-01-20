@interface MTEpisodeSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)requiresNextGetTransaction;
- (MTEpisodeSyncProcessor)initWithStorageProvider:(id)a3;
- (MTEpisodeSyncProcessorStorageProviding)storageProvider;
- (double)_sanitisedTimeIntervalForObject:(id)a3;
- (id)_propertiesToFetch;
- (id)_searchDictionaryFromArray:(id)a3 withKey:(id)a4;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)predicateForFilteringEpisodesWithEmptyPlayState;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)completeTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)mergeData:(id)a3 forKey:(id)a4;
- (void)recalculateUpNextForShowWithFeedUrl:(id)a3;
- (void)rescheduleTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
- (void)unsafeUpdateEpisode:(id)a3 forRemoteEpisodeDictionary:(id)a4;
@end

@implementation MTEpisodeSyncProcessor

- (MTEpisodeSyncProcessor)initWithStorageProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTEpisodeSyncProcessor;
  v5 = -[MTEpisodeSyncProcessor init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = _MTLogCategoryCloudSync(-[MTEpisodeSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4));
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    v6->_os_signpost_id_t signpostID = os_signpost_id_generate(v8);

    uint64_t v10 = _MTLogCategoryCloudSync(v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    os_signpost_id_t signpostID = v6->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  signpostID,  "MTEpisodeSyncProcessor.created",  "",  v15,  2u);
    }
  }

  return v6;
}

- (int64_t)operationTypeForSET
{
  return 7LL;
}

- (BOOL)hasLocalChanges
{
  return 0;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _MTLogCategoryCloudSync(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTEpisodeSyncProcessor.GET",  "key: %@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 versionForKey:v5]);

  uint64_t v13 = _MTLogCategoryUPPSync(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v5;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] key: %{public}@, version: %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _MTLogCategoryCloudSync(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  signpostID,  "MTEpisodeSyncProcessor.SET",  "key: %@",  (uint8_t *)&buf,  0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 importContext]);

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_10011949C;
  v38 = sub_1001194AC;
  id v39 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  v27 = sub_1001194B4;
  v28 = &unk_100240AD0;
  v29 = self;
  id v16 = v9;
  id v30 = v16;
  id v17 = v15;
  id v31 = v17;
  p___int128 buf = &buf;
  uint64_t v18 = _MTLogCategoryUPPSync([v17 performBlockAndWait:&v25]);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40LL);
    *(_DWORD *)v33 = 138543362;
    uint64_t v34 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Syncing Episodes: %{public}@",  v33,  0xCu);
  }

  if (objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count", v25, v26, v27, v28, v29))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
    *a5 = (id)objc_claimAutoreleasedReturnValue([v21 versionForKey:v16]);

    v22 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setArrayValue:](v22, "setArrayValue:", *(void *)(*((void *)&buf + 1) + 40LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v22, "value"));
  }

  else
  {
    v23 = 0LL;
  }

  _Block_object_dispose(&buf, 8);
  return v23;
}

- (id)predicateForFilteringEpisodesWithEmptyPlayState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForPlayStateManuallySet:]( &OBJC_CLASS___MTEpisode,  "predicateForPlayStateManuallySet:",  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBacklog:](&OBJC_CLASS___MTEpisode, "predicateForBacklog:", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 AND:v3]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForNilLastDatePlayed](&OBJC_CLASS___MTEpisode, "predicateForNilLastDatePlayed"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 AND:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForNilLastUserMarkedAsPlayedDate]( &OBJC_CLASS___MTEpisode,  "predicateForNilLastUserMarkedAsPlayedDate"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 AND:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForNonNilLastDatePlayed]( &OBJC_CLASS___MTEpisode,  "predicateForNonNilLastDatePlayed"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForNonNilLastUserMarkedAsPlayedDate]( &OBJC_CLASS___MTEpisode,  "predicateForNonNilLastUserMarkedAsPlayedDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 OR:v10]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 OR:v8]);

  return v12;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  uint64_t v15 = _MTLogCategoryUPPSync(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = v12;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Successful GET transaction [%{public}@] key: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  -[MTEpisodeSyncProcessor mergeData:forKey:](self, "mergeData:forKey:", v14, v11);
  -[MTEpisodeSyncProcessor completeTransactionWithNewVersion:key:finishedBlock:]( self,  "completeTransactionWithNewVersion:key:finishedBlock:",  v12,  v11,  v13);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = _MTLogCategoryUPPSync(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v11;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Successful SET transaction [%{public}@] key: %{public}@ mismatch:NO",  (uint8_t *)&v15,  0x16u);
  }

  -[MTEpisodeSyncProcessor completeTransactionWithNewVersion:key:finishedBlock:]( self,  "completeTransactionWithNewVersion:key:finishedBlock:",  v11,  v10,  v12);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  uint64_t v15 = _MTLogCategoryUPPSync(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = v12;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Conflict for SET transaction [%{public}@] key: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  -[MTEpisodeSyncProcessor mergeData:forKey:](self, "mergeData:forKey:", v14, v11);
  -[MTEpisodeSyncProcessor rescheduleTransactionWithNewVersion:key:finishedBlock:]( self,  "rescheduleTransactionWithNewVersion:key:finishedBlock:",  v12,  v11,  v13);
}

- (void)completeTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = _MTLogCategoryCloudSync(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  signpostID,  "MTSubscriptionSyncProcessor.completed",  "",  (uint8_t *)&v24,  2u);
  }

  uint64_t v16 = _MTLogCategoryUPPSync(v15);
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = v8;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Completing transaction [%{public}@] key: %{public}@",  (uint8_t *)&v24,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  [v18 setVersion:v8 forKey:v9];

  v10[2](v10, 0LL);
  uint64_t v20 = _MTLogCategoryUPPSync(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = v8;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Completing transaction [%{public}@] key: %{public}@, now reculating Up Next",  (uint8_t *)&v24,  0x16u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 feedUrlFromModernKey:v9]);

  -[MTEpisodeSyncProcessor recalculateUpNextForShowWithFeedUrl:](self, "recalculateUpNextForShowWithFeedUrl:", v23);
}

- (void)rescheduleTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = _MTLogCategoryCloudSync(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  signpostID,  "MTSubscriptionSyncProcessor.mismatch",  "",  (uint8_t *)&v19,  2u);
  }

  uint64_t v16 = _MTLogCategoryUPPSync(v15);
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Rescheduling SET transaction after solving conflict [%{public}@] key: %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  [v18 setVersion:v8 forKey:v9];

  v10[2](v10, 1LL);
}

- (void)mergeData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setKey:](v8, "setKey:", v7);
  -[MZKeyValueStoreNode setValue:](v8, "setValue:", v6);
  BOOL v9 = -[MZKeyValueStoreNode hasData](v8, "hasData");
  if (v9)
  {
    uint64_t v10 = _MTLogCategoryUPPSync(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v29 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Merging data for key %{public}@",  buf,  0xCu);
    }

    id v12 = objc_autoreleasePoolPush();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v8, "arrayValue"));
    uint64_t v14 = _MTLogCategoryUPPSync(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Getting Episodes: %{public}@",  buf,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeSyncProcessor _searchDictionaryFromArray:withKey:]( self,  "_searchDictionaryFromArray:withKey:",  v13,  kEpisodeGuid));
    int v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeSyncProcessor _searchDictionaryFromArray:withKey:]( self,  "_searchDictionaryFromArray:withKey:",  v13,  kEpisodeMetadataIdentifier));

    objc_autoreleasePoolPop(v12);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 importContext]);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10011A430;
    v23[3] = &unk_100243CD8;
    v23[4] = self;
    id v24 = v7;
    id v25 = v19;
    id v26 = v16;
    id v27 = v17;
    id v20 = v17;
    id v21 = v16;
    id v22 = v19;
    [v22 performBlockAndWait:v23];
  }
}

- (void)unsafeUpdateEpisode:(id)a3 forRemoteEpisodeDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 metadataTimestamp];
  double v9 = v8;
  uint64_t v10 = kEpisodePlayStateManuallySet;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kEpisodePlayStateManuallySet]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v10]);
    id v13 = [v12 BOOLValue];

    id v14 = [v6 backCatalog];
    objc_msgSend(v6, "setPlayState:manually:source:", objc_msgSend(v6, "playState"), v13, 4);
    [v6 setBackCatalog:v14];
  }

  uint64_t v15 = kEpisodeIsNew;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kEpisodeIsNew]);

  if (v16)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v15]);
    unsigned __int8 v18 = [v17 BOOLValue];

    if ((v18 & 1) == 0) {
      [v6 setIsNew:0];
    }
  }

  uint64_t v19 = kEpisodeLastDatePlayed;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kEpisodeLastDatePlayed]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v19]);
    -[MTEpisodeSyncProcessor _sanitisedTimeIntervalForObject:](self, "_sanitisedTimeIntervalForObject:", v21);
    double v23 = v22;

    [v6 lastDatePlayed];
    if (v23 > v24)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[FutureDateChecker sharedInstance]( &OBJC_CLASS____TtC18PodcastsFoundation17FutureDateChecker,  "sharedInstance"));
      id v26 = [v25 isFutureWithTimestamp:v23];

      uint64_t v28 = _MTLogCategoryUPPSync(v27);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
        id v32 = [v6 storeTrackId];
        v33 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataIdentifier]);
        [v6 lastDatePlayed];
        uint64_t v35 = v34;
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26));
        int v43 = 138544899;
        v44 = v30;
        __int16 v45 = 2114;
        v46 = v31;
        __int16 v47 = 2049;
        id v48 = v32;
        __int16 v49 = 2114;
        v50 = v33;
        __int16 v51 = 2050;
        uint64_t v52 = v35;
        __int16 v53 = 2050;
        double v54 = v23;
        __int16 v55 = 2114;
        v56 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[Episode Sync] Changing last date played for %{public}@, %{public}@, %{private}lld, %{public}@, from %{public} lf to %{public}lf. Is future: %{public}@",  (uint8_t *)&v43,  0x48u);
      }

      [v6 setLastDatePlayed:v23];
    }
  }

  uint64_t v37 = kEpisodeLastUserMarkedAsPlayedDate;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kEpisodeLastUserMarkedAsPlayedDate]);

  if (v38)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v37]);
    [v39 doubleValue];
    double v41 = v40;

    [v6 lastUserMarkedAsPlayedDate];
    if (v41 > v42) {
      [v6 setLastUserMarkedAsPlayedDate:v41];
    }
  }

  [v6 setMetadataTimestamp:v9];
}

- (void)recalculateUpNextForShowWithFeedUrl:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 privateQueueContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011ABEC;
  v8[3] = &unk_100240240;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (double)_sanitisedTimeIntervalForObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    [v3 doubleValue];
LABEL_5:
    double v7 = v5;
    goto LABEL_6;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
  double v7 = 0.0;
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
  {
    [v3 timeIntervalSinceReferenceDate];
    goto LABEL_5;
  }

- (id)_searchDictionaryFromArray:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v6, (void)v16));
        if (v14) {
          [v7 setObject:v13 forKey:v14];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)_propertiesToFetch
{
  v3[0] = kEpisodeGuid;
  v3[1] = kEpisodeMetadataIdentifier;
  v3[2] = kEpisodeMetadataTimestamp;
  v3[3] = kEpisodeBackCatalog;
  v3[4] = kEpisodePlayState;
  v3[5] = kEpisodeDownloadBehavior;
  v3[6] = kEpisodeIsNew;
  v3[7] = kEpisodePlayhead;
  v3[8] = kEpisodePlayStateManuallySet;
  v3[9] = kEpisodeLastUserMarkedAsPlayedDate;
  v3[10] = kEpisodePodcast;
  v3[11] = kEpisodeLastDatePlayed;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  12LL));
}

- (MTEpisodeSyncProcessorStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end