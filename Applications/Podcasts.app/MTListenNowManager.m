@interface MTListenNowManager
- (MTListenNowManager)init;
- (MTPropertyChangeQueryObserver)listenNowQueryObserver;
- (OS_dispatch_queue)workQueue;
- (id)_predicate;
- (unint64_t)backgroundTaskIdentifier;
- (unint64_t)updateCount;
- (void)_beginBackgroundTask;
- (void)_endBackgroundTask;
- (void)_endBackgroundTask:(BOOL)a3;
- (void)dealloc;
- (void)results:(id)a3;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setListenNowQueryObserver:(id)a3;
- (void)setUpdateCount:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
- (void)update;
@end

@implementation MTListenNowManager

- (MTListenNowManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MTListenNowManager;
  v2 = -[MTListenNowManager init](&v20, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager _predicate](v2, "_predicate"));
    [v3 setPredicate:v4];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](&OBJC_CLASS___MTEpisode, "sortDescriptorsForListenNow"));
    [v3 setSortDescriptors:v5];

    v6 = objc_alloc(&OBJC_CLASS___MTPropertyChangeQueryObserver);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 privateQueueContext]);
    v9 = -[MTPropertyChangeQueryObserver initWithFetchRequest:managedObjectContext:]( v6,  "initWithFetchRequest:managedObjectContext:",  v3,  v8);
    -[MTListenNowManager setListenNowQueryObserver:](v2, "setListenNowQueryObserver:", v9);

    v21[0] = kEpisodeListenNowEpisode;
    v21[1] = kEpisodePodcastUuid;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager listenNowQueryObserver](v2, "listenNowQueryObserver"));
    [v11 setPropertyKeys:v10];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager listenNowQueryObserver](v2, "listenNowQueryObserver"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100027560;
    v17[3] = &unk_100240440;
    objc_copyWeak(&v18, &location);
    id v13 = [v12 addResultsChangedHandler:v17];

    v2->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    dispatch_queue_t v14 = dispatch_queue_create("MTListenNowManager", 0LL);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTListenNowManager;
  -[MTListenNowManager dealloc](&v3, "dealloc");
}

- (void)startObservingChanges
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027664;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)stopObservingChanges
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager listenNowQueryObserver](self, "listenNowQueryObserver"));
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002771C;
  block[3] = &unk_10023FF98;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(workQueue, block);
}

- (void)update
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027790;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)results:(id)a3
{
  id v4 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000278A0;
  v7[3] = &unk_100240138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (id)_predicate
{
  return +[MTEpisode predicateForListenNow](&OBJC_CLASS___MTEpisode, "predicateForListenNow");
}

- (void)_beginBackgroundTask
{
  v2 = self;
  objc_sync_enter(v2);
  -[MTListenNowManager setUpdateCount:]( v2,  "setUpdateCount:",  (char *)-[MTListenNowManager updateCount](v2, "updateCount") + 1);
  id v3 = -[MTListenNowManager backgroundTaskIdentifier](v2, "backgroundTaskIdentifier");
  if (v3 == (id)UIBackgroundTaskInvalid)
  {
    uint64_t v4 = _MTLogCategoryDefault(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MTListenNowManager starting background task",  buf,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100027A64;
    v7[3] = &unk_10023FF98;
    v7[4] = v2;
    -[MTListenNowManager setBackgroundTaskIdentifier:]( v2,  "setBackgroundTaskIdentifier:",  [v6 beginBackgroundTaskWithName:@"Listen now manager" expirationHandler:v7]);
  }

  objc_sync_exit(v2);
}

- (void)_endBackgroundTask
{
}

- (void)_endBackgroundTask:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  -[MTListenNowManager setUpdateCount:]( v4,  "setUpdateCount:",  (char *)-[MTListenNowManager updateCount](v4, "updateCount") - 1);
  if (!-[MTListenNowManager updateCount](v4, "updateCount") || v3)
  {
    id v5 = -[MTListenNowManager backgroundTaskIdentifier](v4, "backgroundTaskIdentifier");
    if (v5 != (id)UIBackgroundTaskInvalid)
    {
      uint64_t v6 = _MTLogCategoryDefault(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = &stru_100248948;
        if (v3) {
          id v8 = @"(expired)";
        }
        int v10 = 138412290;
        v11 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MTListenNowManager ending background task %@",  (uint8_t *)&v10,  0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      objc_msgSend( v9,  "endBackgroundTask:",  -[MTListenNowManager backgroundTaskIdentifier](v4, "backgroundTaskIdentifier"));

      -[MTListenNowManager setBackgroundTaskIdentifier:](v4, "setBackgroundTaskIdentifier:", UIBackgroundTaskInvalid);
    }
  }

  if (-[MTListenNowManager backgroundTaskIdentifier](v4, "backgroundTaskIdentifier") == UIBackgroundTaskInvalid) {
    -[MTListenNowManager setUpdateCount:](v4, "setUpdateCount:", 0LL);
  }
  objc_sync_exit(v4);
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MTPropertyChangeQueryObserver)listenNowQueryObserver
{
  return self->_listenNowQueryObserver;
}

- (void)setListenNowQueryObserver:(id)a3
{
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (void).cxx_destruct
{
}

@end