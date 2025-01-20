@interface MTFeedUpdateManager
- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4;
- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5;
- (MTFeedManager)feedManager;
- (MTFeedUpdateManager)init;
- (OS_dispatch_queue)workQueue;
- (void)_fetchMediaAPIShowsExpectedToUpdate:(id)a3;
- (void)_unsafe_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7;
- (void)_updateAllMediaAPIPodcastsUserInitiated:(BOOL)a3 source:(int64_t)a4 completion:(id)a5;
- (void)_updateAllNonMediaAPIPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6;
- (void)_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7;
- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 source:(int64_t)a8 completion:(id)a9;
- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 completion:(id)a10;
- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 tryRedirectURL:(BOOL)a10 startedUpdateCallback:(id)a11 completion:(id)a12;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdateCallback:(id)a8;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 tryRedirectURL:(BOOL)a8 startedUpdateCallback:(id)a9;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6;
- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 tryRedirectURL:(BOOL)a7;
- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdatesCallback:(id)a8;
- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7;
- (void)setWorkQueue:(id)a3;
- (void)updateAllMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4;
- (void)updateAllNonMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4;
- (void)updateAllPodcastsInBackgroundWithSource:(int64_t)a3 started:(id)a4;
- (void)updateAllPodcastsNeedingRetry:(id)a3;
- (void)updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6;
- (void)updateMediaAPIPodcastsExpectedToUpdate:(id)a3;
- (void)updateMediaAPIPodcastsExpectedToUpdateWithLimit:(int64_t)a3 started:(id)a4;
- (void)updatePodcastWithStoreId:(int64_t)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 source:(int64_t)a7 completion:(id)a8;
- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 forceBootstrap:(BOOL)a6 source:(int64_t)a7 completion:(id)a8;
- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 completion:(id)a6;
- (void)updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 started:(id)a6;
@end

@implementation MTFeedUpdateManager

- (MTFeedUpdateManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTFeedUpdateManager;
  v2 = -[MTFeedUpdateManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[MTFeedManager sharedInstance](&OBJC_CLASS___MTFeedManager, "sharedInstance"));
    feedManager = v2->_feedManager;
    v2->_feedManager = (MTFeedManager *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("MTFeedUpdateManagerQueue", 0LL);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v10 = a6;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000FC948;
  v13[3] = &unk_100244BA0;
  BOOL v16 = a3;
  BOOL v17 = a4;
  id v14 = v10;
  int64_t v15 = a5;
  v13[4] = self;
  id v12 = v10;
  dispatch_async(v11, v13);
}

- (void)updateAllPodcastsInBackgroundWithSource:(int64_t)a3 started:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    uint64_t v8 = _MTLogCategoryFeedUpdate(v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Updating all podcasts with non background source. %ld.",  buf,  0xCu);
    }
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FCA84;
  block[3] = &unk_100244BC8;
  id v13 = v7;
  int64_t v14 = a3;
  block[4] = self;
  id v11 = v7;
  dispatch_async(v10, block);
}

- (void)updateAllPodcastsNeedingRetry:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FCB38;
  v7[3] = &unk_100240138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_fetchMediaAPIShowsExpectedToUpdate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 importContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000FCF34;
  v8[3] = &unk_100240138;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (void)updateMediaAPIPodcastsExpectedToUpdateWithLimit:(int64_t)a3 started:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FD6F8;
  block[3] = &unk_100244BC8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)updateMediaAPIPodcastsExpectedToUpdate:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FDC48;
  v7[3] = &unk_100240138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateAllMediaAPIPodcastsUserInitiated:(BOOL)a3 source:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000FDF94;
  v8[3] = &unk_100244C90;
  void v8[4] = self;
  id v9 = a5;
  BOOL v11 = v6;
  int64_t v10 = a4;
  id v7 = v9;
  +[BatchFeedRequestController fetchOutOfDateShowUUIDsWithIncludeImplicit:completionHandler:]( &OBJC_CLASS____TtC18PodcastsFoundation26BatchFeedRequestController,  "fetchOutOfDateShowUUIDsWithIncludeImplicit:completionHandler:",  v6,  v8);
}

- (void)updateAllMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FE228;
  v7[3] = &unk_100244CB8;
  id v8 = a4;
  id v6 = v8;
  -[MTFeedUpdateManager _updateAllMediaAPIPodcastsUserInitiated:source:completion:]( self,  "_updateAllMediaAPIPodcastsUserInitiated:source:completion:",  0LL,  a3,  v7);
}

- (void)_updateAllNonMediaAPIPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v9 = a6;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 importContext]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000FE30C;
  v14[3] = &unk_100244D08;
  BOOL v18 = a3;
  id v15 = v11;
  int64_t v16 = self;
  BOOL v19 = a4;
  id v17 = v9;
  id v12 = v9;
  id v13 = v11;
  [v13 performBlock:v14];
}

- (void)updateAllNonMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4
{
}

- (void)updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FE74C;
  block[3] = &unk_100244C68;
  block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 completion:(id)a6
{
}

- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 forceBootstrap:(BOOL)a6 source:(int64_t)a7 completion:(id)a8
{
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 source:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  int64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000FE8E4;
  v22[3] = &unk_100244D30;
  BOOL v27 = a5;
  BOOL v28 = a6;
  v22[4] = self;
  id v23 = v15;
  id v24 = v16;
  id v25 = v17;
  BOOL v29 = a7;
  int64_t v26 = a8;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  dispatch_async(v18, v22);
}

- (void)updatePodcastWithStoreId:(int64_t)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 source:(int64_t)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 importContext]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000FEB70;
  v20[3] = &unk_100244D58;
  id v23 = v14;
  int64_t v24 = a3;
  id v21 = v16;
  id v22 = v13;
  BOOL v26 = a5;
  BOOL v27 = a6;
  int64_t v25 = a7;
  id v17 = v13;
  id v18 = v14;
  id v19 = v16;
  [v19 performBlock:v20];
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6
{
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 tryRedirectURL:(BOOL)a7
{
}

- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4
{
  return -[MTFeedUpdateManager isPodcastUpdatable:userInitiated:forced:]( self,  "isPodcastUpdatable:userInitiated:forced:",  a3,  a4,  0LL);
}

- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = v7;
  if (v7 && (![v7 isImplicitlyFollowed] || v6))
  {
    unsigned __int8 v9 = 1;
    if (!v6 && !a5)
    {
      if (+[MTStoreIdentifier isNotEmpty:]( MTStoreIdentifier,  "isNotEmpty:",  [v8 storeCollectionId])
        && (([v8 importing] & 1) != 0
         || ([v8 feedUpdateNeedsRetry] & 1) != 0))
      {
        unsigned __int8 v9 = 1;
      }

      else
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForPeriodicallyUpdatablePodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForPeriodicallyUpdatablePodcasts"));
        unsigned __int8 v9 = [v11 evaluateWithObject:v8];
      }
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_unsafe_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  BOOL v10 = a3;
  id v12 = a7;
  if (v10) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](&OBJC_CLASS___MTPodcast, "predicateForNotHiddenPodcasts"));
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  }
  id v14 = (void *)v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 importContext]);

  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x3032000000LL;
  v30[3] = sub_1000FD9BC;
  v30[4] = sub_1000FD9CC;
  id v31 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000FEFC4;
  v20[3] = &unk_100244DA8;
  id v17 = v16;
  id v21 = v17;
  id v18 = v14;
  id v22 = v18;
  id v23 = self;
  BOOL v27 = v10;
  BOOL v28 = a4;
  BOOL v29 = a5;
  int64_t v25 = v30;
  int64_t v26 = a6;
  id v19 = v12;
  id v24 = v19;
  [v17 performBlock:v20];

  _Block_object_dispose(v30, 8);
}

- (void)_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000FF4A4;
  v36[3] = &unk_100240A30;
  id v12 = a7;
  id v37 = v12;
  uint64_t v13 = objc_retainBlock(v36);
  BOOL v14 = sub_1000FF530();
  if (v14)
  {
    uint64_t v15 = _MTLogCategoryFeedUpdate(v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v17 = "Skipping feed update: disabled";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager feedManager](self, "feedManager"));
  unsigned int v19 = [v18 abortUpdatesIfNetworkUnreachable:v10];

  if (v19)
  {
    uint64_t v22 = _MTLogCategoryFeedUpdate(v20);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v17 = "Skipping feed update due to network not being reachable";
      goto LABEL_7;
    }

- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
}

- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdatesCallback:(id)a8
{
  id v14 = a3;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000FFB90;
  v27[3] = &unk_100240A30;
  id v28 = a8;
  id v15 = v28;
  id v16 = objc_retainBlock(v27);
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000FFC1C;
  v20[3] = &unk_100244E98;
  BOOL v24 = a4;
  void v20[4] = self;
  id v21 = v14;
  BOOL v25 = a5;
  BOOL v26 = a6;
  id v22 = v16;
  int64_t v23 = a7;
  id v18 = v14;
  unsigned int v19 = v16;
  dispatch_async(v17, v20);
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdateCallback:(id)a8
{
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 completion:(id)a10
{
  LOBYTE(v10) = 1;
  -[MTFeedUpdateManager _updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:]( self,  "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:starte dUpdateCallback:completion:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  v10,  0LL,  a10);
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 tryRedirectURL:(BOOL)a8 startedUpdateCallback:(id)a9
{
  LOBYTE(v9) = a8;
  -[MTFeedUpdateManager _updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:]( self,  "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:starte dUpdateCallback:completion:",  a3,  0LL,  a4,  a5,  0LL,  a6,  a7,  v9,  a9,  0LL);
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 tryRedirectURL:(BOOL)a10 startedUpdateCallback:(id)a11 completion:(id)a12
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a11;
  id v17 = a12;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_100100460;
  v58[3] = &unk_1002406E8;
  id v18 = v16;
  id v59 = v18;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1001004F4;
  v55[3] = &unk_100244EC0;
  unsigned int v19 = objc_retainBlock(v58);
  id v56 = v19;
  id v20 = v17;
  id v57 = v20;
  id v21 = objc_retainBlock(v55);
  if (sub_1000FF530())
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[FeedUpdaterObjcError feedUpdatesDisabled]( &OBJC_CLASS____TtC18PodcastsFoundation20FeedUpdaterObjcError,  "feedUpdatesDisabled"));
    ((void (*)(void *, void *))v21[2])(v21, v22);
  }

  else
  {
    v53[0] = 0LL;
    v53[1] = v53;
    v53[2] = 0x2020000000LL;
    char v54 = 1;
    v51[0] = 0LL;
    v51[1] = v51;
    v51[2] = 0x3032000000LL;
    v51[3] = sub_1000FD9BC;
    v51[4] = sub_1000FD9CC;
    id v52 = 0LL;
    v49[0] = 0LL;
    v49[1] = v49;
    v49[2] = 0x3032000000LL;
    v49[3] = sub_1000FD9BC;
    v49[4] = sub_1000FD9CC;
    id v50 = 0LL;
    v48[0] = 0LL;
    v48[1] = v48;
    v48[2] = 0x2020000000LL;
    v48[3] = 0LL;
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 importContext]);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001005BC;
    v30[3] = &unk_100244F10;
    id v25 = v24;
    id v31 = v25;
    id v32 = v14;
    BOOL v33 = self;
    BOOL v43 = a5;
    BOOL v44 = a6;
    v38 = v53;
    v39 = v51;
    BOOL v45 = a10;
    v40 = v48;
    v41 = v49;
    BOOL v46 = a8;
    int64_t v42 = a9;
    v35 = v21;
    v36 = v19;
    id v34 = v15;
    BOOL v47 = a7;
    id v37 = v20;
    [v25 performBlock:v30];

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v49, 8);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MTFeedManager)feedManager
{
  return self->_feedManager;
}

- (void).cxx_destruct
{
}

@end