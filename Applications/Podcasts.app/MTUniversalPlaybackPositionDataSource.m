@interface MTUniversalPlaybackPositionDataSource
+ (double)uppLastSyncTime;
+ (id)mediaItemIdentifierForEpisode:(id)a3;
+ (void)resetUppLastSyncTimeAndDomainVersion;
+ (void)setUppLastSyncTime:(double)a3;
+ (void)updateEpisode:(id)a3 withUPPMetadata:(id)a4;
- (NSMutableArray)episodeObservers;
- (id)_metricsDateFormatter;
- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3;
- (void)addEpisodeObserver:(id)a3;
- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5;
- (void)performBlockAndWait:(id)a3;
- (void)removeEpisodeObserver:(id)a3;
- (void)setEpisodeObservers:(id)a3;
@end

@implementation MTUniversalPlaybackPositionDataSource

+ (id)mediaItemIdentifierForEpisode:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___MTUniversalPlaybackPositionMediaItem);
  -[MTUniversalPlaybackPositionMediaItem setEpisode:](v4, "setEpisode:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:]( &OBJC_CLASS___MZUniversalPlaybackPositionMetadata,  "keyValueStoreItemIdentifierForItem:",  v4));
  return v5;
}

- (void)performBlockAndWait:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 importContext]);

    [v5 performBlockAndWait:v3];
  }

- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___MTUniversalPlaybackPositionTransactionContext);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceReferenceDate];
  -[MTUniversalPlaybackPositionTransactionContext setSyncStartTime:](v4, "setSyncStartTime:");

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 importContext]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](&OBJC_CLASS___MTUPPSyncProcessor, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 predicate]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10005B130;
    v13[3] = &unk_1002421E0;
    id v14 = v7;
    id v15 = v9;
    id v17 = v3;
    v16 = v4;
    id v10 = v9;
    id v11 = v7;
    [v11 performBlockAndWaitWithSave:v13];
  }

  return v4;
}

- (id)_metricsDateFormatter
{
  if (qword_1002B69A8 != -1) {
    dispatch_once(&qword_1002B69A8, &stru_100242200);
  }
  return (id)qword_1002B69A0;
}

- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t (**)(void))a5;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___MTUniversalPlaybackPositionTransactionContext);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v8, v11);
  if ((isKindOfClass & 1) != 0)
  {
    id v38 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTUniversalPlaybackPositionTransactionContext UPPDomainVersion]( &OBJC_CLASS___MTUniversalPlaybackPositionTransactionContext,  "UPPDomainVersion"));
    BOOL v37 = [v13 length] != 0;

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v15 = v14;
    id v16 = v8;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v17 importContext]);

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v20 = v10[2](v10);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    if (v21)
    {
      v22 = (void *)v21;
      do
      {
        -[NSMutableArray addObject:](v18, "addObject:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v16 mediaItems]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v22 itemIdentifier]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v24]);

        if (!v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v22 itemIdentifier]);
          -[NSMutableSet addObject:](v19, "addObject:", v26);
        }

        uint64_t v27 = v10[2](v10);
        uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);

        v22 = (void *)v28;
      }

      while (v28);
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10005BA0C;
    v41[3] = &unk_100242228;
    id v29 = v36;
    id v42 = v29;
    v43 = v19;
    v44 = v18;
    id v45 = v16;
    v46 = self;
    BOOL v48 = v37;
    uint64_t v47 = v15;
    id v30 = v16;
    v31 = v18;
    v32 = v19;
    [v29 performBlockAndWaitWithSave:v41];
    v33 = (void *)objc_opt_class(self);
    [v30 syncStartTime];
    objc_msgSend(v33, "setUppLastSyncTime:");
    id v9 = v38;
    [(id)objc_opt_class(v30) setUPPDomainVersion:v38];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10005C7E4;
    v39[3] = &unk_10023FF98;
    id v40 = v29;
    id v34 = v29;
    [v34 performBlockAndWait:v39];
  }

  else
  {
    uint64_t v35 = _MTLogCategoryUPPSync(isKindOfClass);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v50 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Ran into unexpected transaction {%{public}@} -- BailingOut",  buf,  0xCu);
    }
  }
}

- (void)addEpisodeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionDataSource episodeObservers](self, "episodeObservers"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[MTUniversalPlaybackPositionDataSource setEpisodeObservers:](self, "setEpisodeObservers:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionDataSource episodeObservers](self, "episodeObservers"));
  [v7 addObject:v4];
}

- (void)removeEpisodeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionDataSource episodeObservers](self, "episodeObservers"));
  [v5 removeObject:v4];
}

+ (void)updateEpisode:(id)a3 withUPPMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _MTLogCategoryUPPSync(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
    uint64_t v11 = (const __CFString *)[v5 storeTrackId];
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 metadataIdentifier]);
    *(_DWORD *)uint64_t v27 = 138479107;
    *(void *)&v27[4] = v9;
    __int16 v28 = 2114;
    int64_t v29 = (int64_t)v10;
    __int16 v30 = 2049;
    v31 = v11;
    __int16 v32 = 2114;
    id v33 = v12;
    __int16 v34 = 2050;
    id v35 = [v5 playState];
    __int16 v36 = 2114;
    id v37 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating episode %{private}@, %{public}@, %{private}lld, %{public}@, current playState: %{public}lld\n with UPP metadata: %{public}@",  v27,  0x3Eu);
  }

  id v13 = [v6 playCount];
  int64_t v14 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:]( MTLibraryLegacyUtil,  "playStateFromHasBeenPlayed:andPlayCount:",  [v6 hasBeenPlayed],  v13);
  id v15 = [v5 playState];
  id v16 = [v5 isBackCatalogItem];
  else {
    int v17 = 0;
  }
  uint64_t v18 = _MTLogCategoryUPPSync(v16);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if ((id)v14 != v15 || v17)
  {
    if (v20)
    {
      id v25 = [v5 playState];
      *(_DWORD *)uint64_t v27 = 134349312;
      *(void *)&v27[4] = v25;
      __int16 v28 = 2050;
      int64_t v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "UPP Updating playState from %{public}lld to %{public}lld",  v27,  0x16u);
    }

    [v5 setPlayState:v14 manually:0 source:3];
  }

  else
  {
    if (v20)
    {
      id v21 = [v5 playState];
      else {
        v22 = @"NO";
      }
      unsigned int v23 = [v5 backCatalog];
      *(_DWORD *)uint64_t v27 = 134349826;
      if (v23) {
        v24 = @"YES";
      }
      else {
        v24 = @"NO";
      }
      *(void *)&v27[4] = v21;
      __int16 v28 = 2112;
      int64_t v29 = (int64_t)v22;
      __int16 v30 = 2112;
      v31 = v24;
      __int16 v32 = 2048;
      id v33 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "UPP NOT Updating playState because it was already %{public}lld, playStateManuallySet: %@, backCatalog: %@. Remot e UPP playCount: %lld",  v27,  0x2Au);
    }
  }

  objc_msgSend(v6, "bookmarkTime", *(void *)v27);
  *(float *)&double v26 = v26;
  [v5 setPlayhead:v26];
  [v5 setPlayCount:v13];
  [v5 pubDate];
  objc_msgSend(v5, "setImportDate:");
  [v6 timestamp];
  objc_msgSend(v5, "setMetadataTimestamp:");
  [v5 setMetadataFirstSyncEligible:0];
}

+ (void)resetUppLastSyncTimeAndDomainVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 removeObjectForKey:kMTLibraryUppLastSyncTimeKey];

  +[MTUniversalPlaybackPositionTransactionContext setUPPDomainVersion:]( &OBJC_CLASS___MTUniversalPlaybackPositionTransactionContext,  "setUPPDomainVersion:",  0LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](&OBJC_CLASS___MTUPPSyncProcessor, "sharedInstance"));
  [v3 updatePredicate];
}

+ (void)setUppLastSyncTime:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setDouble:kMTLibraryUppLastSyncTimeKey forKey:a3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](&OBJC_CLASS___MTUPPSyncProcessor, "sharedInstance"));
  [v5 updatePredicate];
}

+ (double)uppLastSyncTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 doubleForKey:kMTLibraryUppLastSyncTimeKey];
  double v4 = v3;

  return v4;
}

- (NSMutableArray)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end