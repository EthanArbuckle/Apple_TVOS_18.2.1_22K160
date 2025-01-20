@interface MTStoreInfoUpdater
+ (id)sharedInstance;
- (BOOL)updateAdamId:(id)a3 forEpisode:(id)a4;
- (MTStoreInfoUpdater)init;
- (NSOperationQueue)updateOperationQueue;
- (id)_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:(id)a3;
- (id)episodesWithMissingAdamIdsForPodcast:(id)a3 withContext:(id)a4;
- (void)getStoreInfoForEpisodesWithAdamIds:(id)a3 callback:(id)a4;
- (void)getStoreInfoForPodcastWithAdamId:(int64_t)a3 callback:(id)a4;
- (void)setUpdateOperationQueue:(id)a3;
- (void)updateStoreInfoForEpisodesAndPodcast:(id)a3 skipPodcastLastCheckDate:(BOOL)a4;
- (void)updateStoreInfoForEpisodesInPodcast:(id)a3 withEpisodeIds:(id)a4 andEpisodesWithGuid:(id)a5;
- (void)updateStoreInfoForPodcast:(id)a3;
@end

@implementation MTStoreInfoUpdater

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100116A18;
  block[3] = &unk_100240300;
  block[4] = a1;
  if (qword_1002B6C08 != -1) {
    dispatch_once(&qword_1002B6C08, block);
  }
  return (id)qword_1002B6C00;
}

- (MTStoreInfoUpdater)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTStoreInfoUpdater;
  v2 = -[MTStoreInfoUpdater init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[MTStoreInfoUpdater setUpdateOperationQueue:](v2, "setUpdateOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreInfoUpdater updateOperationQueue](v2, "updateOperationQueue"));
    [v4 setMaxConcurrentOperationCount:1];
  }

  return v2;
}

- (void)updateStoreInfoForPodcast:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreInfoUpdater updateOperationQueue](self, "updateOperationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100116B58;
  v7[3] = &unk_100240240;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)updateStoreInfoForEpisodesAndPodcast:(id)a3 skipPodcastLastCheckDate:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 importContext]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100116EA8;
  v11[3] = &unk_100242E80;
  id v12 = v8;
  id v13 = v6;
  BOOL v15 = a4;
  v14 = self;
  id v9 = v6;
  id v10 = v8;
  [v10 performBlockAndWait:v11];
}

- (void)updateStoreInfoForEpisodesInPodcast:(id)a3 withEpisodeIds:(id)a4 andEpisodesWithGuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 importContext]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100117440;
  v17[3] = &unk_100243CD8;
  id v18 = v12;
  id v19 = v8;
  v20 = self;
  id v21 = v10;
  id v22 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  id v16 = v12;
  [v16 performBlockAndWait:v17];
}

- (BOOL)updateAdamId:(id)a3 forEpisode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && (uint64_t)[v5 longLongValue] >= 1
    && (v7 = [v5 longLongValue], id v8 = objc_msgSend(v6, "storeTrackId"), v8 != v7))
  {
    uint64_t v11 = _MTLogCategoryDatabase(v8);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      int v14 = 134218242;
      id v15 = v7;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating store track id %lld for episode %@",  (uint8_t *)&v14,  0x16u);
    }

    [v6 setStoreTrackId:v7];
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:(id)a3
{
  uint64_t v3 = kMTEpisodeEntityName;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  v3));
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchBatchSize:200];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:",  v4,  1LL));

  uint64_t v7 = kEpisodeStoreTrackId;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", kMTSerpentAdamIdOffset));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K = 0 OR %K = %@)",  v7,  v7,  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 AND:v9]);

  [v5 setPredicate:v10];
  return v5;
}

- (id)episodesWithMissingAdamIdsForPodcast:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTStoreInfoUpdater _fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:]( self,  "_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:",  a3));
  id v12 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v7 error:&v12]);

  id v9 = v12;
  if (v9)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMLogCategory defaultCategory](&OBJC_CLASS___IMLogCategory, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to fetch episodes for store info update - %@",  buf,  0xCu);
    }
  }

  return v8;
}

- (void)getStoreInfoForPodcastWithAdamId:(int64_t)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v7 = objc_alloc(&OBJC_CLASS___IMContentLookupService);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  __int16 v16 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v10 = [v7 initWithIds:v9];

  [v10 setProfile:kProductProfile];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100117ED4;
  v13[3] = &unk_100245398;
  id v14 = v6;
  id v15 = v5;
  id v11 = v5;
  id v12 = v6;
  [v10 request:v13];
}

- (void)getStoreInfoForEpisodesWithAdamIds:(id)a3 callback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[IMContentLookupService alloc] initWithIds:v5];
  [v7 setProfile:kMTStoreLookupPodcastProductProfile];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001183F4;
  v10[3] = &unk_100245398;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 request:v10];
}

- (NSOperationQueue)updateOperationQueue
{
  return self->_updateOperationQueue;
}

- (void)setUpdateOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end