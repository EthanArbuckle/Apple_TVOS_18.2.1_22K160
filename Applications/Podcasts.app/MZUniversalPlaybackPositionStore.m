@interface MZUniversalPlaybackPositionStore
+ (id)keyValueStoreItemIdentifierForItem:(id)a3;
- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive;
- (BOOL)_automaticallySynchronizeOnBecomeActive;
- (BOOL)_timerIsStopped;
- (BOOL)canRequestStoreSignIn;
- (BOOL)hasLocalChangesToSync;
- (BOOL)initialAutosyncNeeded;
- (BOOL)isActive;
- (BOOL)refreshTimerActive;
- (MZAsynchronousTask)bagLookupTask;
- (MZUPPAsynchronousTask)synchronizeTask;
- (MZUniversalPlaybackPositionDataSource)dataSource;
- (MZUniversalPlaybackPositionStore)init;
- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3;
- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3 isActive:(BOOL)a4;
- (MZUniversalPlaybackPositionSyncHandler)syncHandler;
- (NSDate)dateToFireNextTimer;
- (NSTimer)timer;
- (OS_dispatch_queue)queue;
- (double)_effectiveAutorefreshRate;
- (double)autorefreshRate;
- (double)bagSpecifiedPollingInterval;
- (id)_accountForSyncing;
- (id)prefsObserver;
- (unint64_t)automaticSynchronizeOptions;
- (void)_grabBagWithCompletionBlock:(id)a3;
- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3;
- (void)_onQueueResumeTimer;
- (void)_onQueueScheduleTimer;
- (void)_onQueueSetHasLocalChangesToSync:(BOOL)a3;
- (void)_onQueueStartNewTimer;
- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3;
- (void)_onQueueStopTimer;
- (void)_onQueueSuspendTimer;
- (void)_onQueueSynchronizeImmediatelyWithCompletionBlock:(id)a3;
- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)_onQueueUpdateTimerForActiveChanges;
- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges;
- (void)_timerFired:(id)a3;
- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3;
- (void)_updateForStoreAccountsChange;
- (void)_updateSettingsFromLoadedBagContext:(id)a3;
- (void)becomeActive;
- (void)checkForAvailabilityWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)resignActive;
- (void)setAutomaticSynchronizeOptions:(unint64_t)a3;
- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3;
- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3;
- (void)setAutorefreshRate:(double)a3;
- (void)setBagLookupTask:(id)a3;
- (void)setBagSpecifiedPollingInterval:(double)a3;
- (void)setCanRequestStoreSignIn:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDateToFireNextTimer:(id)a3;
- (void)setHasLocalChangesToSync:(BOOL)a3;
- (void)setInitialAutosyncNeeded:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPrefsObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRefreshTimerActive:(BOOL)a3;
- (void)setSyncHandler:(id)a3;
- (void)setSynchronizeTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)startUPPSyncTimer;
- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3;
@end

@implementation MZUniversalPlaybackPositionStore

- (MZUniversalPlaybackPositionStore)init
{
  return -[MZUniversalPlaybackPositionStore initWithInitialUpdateDelay:isActive:]( self,  "initWithInitialUpdateDelay:isActive:",  1LL,  -1.0);
}

- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3 isActive:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MZUniversalPlaybackPositionStore;
  id v6 = -[MZUniversalPlaybackPositionStore init](&v22, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("MZUniversalPlaybackPositionStore.queue", 0LL);
    v8 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v7;

    *((_BYTE *)v6 + 11) = a4;
    *((void *)v6 + 3) = 3LL;
    [v6 _updateAutorefreshRateSettingAndRestartTimer:0];
    +[MZUPPBagContext defaultPollingInterval](&OBJC_CLASS___MZUPPBagContext, "defaultPollingInterval");
    *((void *)v6 + 12) = v9;
    if (a3 <= 0.0) {
      a3 = *((double *)v6 + 11);
    }
    *((_BYTE *)v6 + 12) = a3 > 0.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
    [v6 setDateToFireNextTimer:v10];

    v11 = (dispatch_queue_s *)*((void *)v6 + 9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100035994;
    block[3] = &unk_10023FF98;
    v12 = v6;
    id v21 = v12;
    dispatch_sync(v11, block);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    objc_initWeak(&location, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v12 selector:"_updateForStoreAccountsChange" name:ACDAccountStoreDidChangeNotification object:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000359CC;
    v17[3] = &unk_1002413A8;
    objc_copyWeak(&v18, &location);
    v12[10] =  [v13 addObserverForName:@"MZPreferencesDidChangeNotification" object:0 queue:v15 usingBlock:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (MZUniversalPlaybackPositionStore *)v6;
}

- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3
{
  return -[MZUniversalPlaybackPositionStore initWithInitialUpdateDelay:isActive:]( self,  "initWithInitialUpdateDelay:isActive:",  1LL,  a3);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self->_prefsObserver];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore bagLookupTask](self, "bagLookupTask"));
  [v5 invalidate];

  -[MZUniversalPlaybackPositionStore setBagLookupTask:](self, "setBagLookupTask:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore synchronizeTask](self, "synchronizeTask"));
  [v6 invalidate];

  -[MZUniversalPlaybackPositionStore setSynchronizeTask:](self, "setSynchronizeTask:", 0LL);
  -[MZUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", 0LL);
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore timer](self, "timer"));
  [v7 invalidate];

  -[MZUniversalPlaybackPositionStore setTimer:](self, "setTimer:", 0LL);
  -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MZUniversalPlaybackPositionStore;
  -[MZUniversalPlaybackPositionStore dealloc](&v8, "dealloc");
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  return +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:]( &OBJC_CLASS___MZUniversalPlaybackPositionMetadata,  "keyValueStoreItemIdentifierForItem:",  a3);
}

- (void)_onQueueUpdateTimerForActiveChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 1) != 0)
  {
    if (-[MZUniversalPlaybackPositionStore _automaticallySynchronizeOnBecomeActive]( self,  "_automaticallySynchronizeOnBecomeActive"))
    {
      -[MZUniversalPlaybackPositionStore _onQueueStartNewTimerWithTimeIntervalSinceNow:]( self,  "_onQueueStartNewTimerWithTimeIntervalSinceNow:");
    }

    else
    {
      -[MZUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
    }
  }

  else
  {
    -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  }

- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 1) != 0) {
    -[MZUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
  }
  else {
    -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  }
}

- (void)becomeActive
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035BEC;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resignActive
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035C88;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setAutomaticSynchronizeOptions:(unint64_t)a3
{
  if (self->_automaticSynchronizeOptions != a3) {
    self->_automaticSynchronizeOptions = a3;
  }
}

- (void)_onQueueSetHasLocalChangesToSync:(BOOL)a3
{
  self->_hasLocalChangesToSync = a3;
}

- (void)setHasLocalChangesToSync:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100035E18;
  v4[3] = &unk_100240350;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = -[MZUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2LL;
  if (!v3) {
    uint64_t v6 = 0LL;
  }
  -[MZUniversalPlaybackPositionStore setAutomaticSynchronizeOptions:](self, "setAutomaticSynchronizeOptions:", v5 | v6);
}

- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive
{
  return (-[MZUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") >> 1) & 1;
}

- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3
{
}

- (BOOL)_automaticallySynchronizeOnBecomeActive
{
  return -[MZUniversalPlaybackPositionStore automaticSynchronizeOptions]( self,  "automaticSynchronizeOptions") & 1;
}

- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035F4C;
  block[3] = &unk_100240138;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)checkForAvailabilityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[1] = 3221225472LL;
    block[2] = sub_100036090;
    block[3] = &unk_100240138;
    void block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(queue, block);

    id v4 = v6;
  }
}

- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4
{
  self->_initialAutosyncNeeded = 0;
  -[MZUniversalPlaybackPositionStore _onQueueSynchronizeImmediatelyWithCompletionBlock:]( self,  "_onQueueSynchronizeImmediatelyWithCompletionBlock:",  a4);
}

- (void)_onQueueSynchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing"));

  if (v5)
  {
    synchronizeTask = self->_synchronizeTask;
    uint64_t v8 = _MTLogCategoryUPPSync(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (synchronizeTask)
    {
      if (v10)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_onQueueSync - UPP synchronize already in progress.  pending our completion block to be notified when it completes.",  (uint8_t *)&buf,  2u);
      }

      -[MZAsynchronousTask addTaskCompletionBlock:](self->_synchronizeTask, "addTaskCompletionBlock:", v4);
    }

    else
    {
      if (v10)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_onQueueSync - UPP synchronize beginning sync operation...",  (uint8_t *)&buf,  2u);
      }

      objc_initWeak(&buf, self);
      -[MZUniversalPlaybackPositionStore _onQueueStopTimer](self, "_onQueueStopTimer");
      v15 = objc_alloc(&OBJC_CLASS___MZUPPAsynchronousTask);
      v16 = -[MZUPPAsynchronousTask initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:reportMetrics:]( v15,  "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:reportMetrics:",  self->_queue,  @"MZUPPStore Synchronize",  0LL,  20.0,  *(double *)&qword_1002B8960);
      v17 = self->_synchronizeTask;
      self->_synchronizeTask = v16;

      id v18 = self->_synchronizeTask;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000364CC;
      v27[3] = &unk_100240290;
      objc_copyWeak(&v28, &buf);
      -[MZAsynchronousTask setExpirationHandler:](v18, "setExpirationHandler:", v27);
      v19 = self->_synchronizeTask;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10003659C;
      v25[3] = &unk_100240290;
      objc_copyWeak(&v26, &buf);
      -[MZAsynchronousTask setFinishedHandler:](v19, "setFinishedHandler:", v25);
      -[MZAsynchronousTask addTaskCompletionBlock:](self->_synchronizeTask, "addTaskCompletionBlock:", v4);
      kdebug_trace(723517680LL, 0LL, 0LL, 0LL, 0LL);
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      double v21 = v20;
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self->_synchronizeTask, "metrics"));
      [v22 setBagLookupStartTime:v21];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10003675C;
      v23[3] = &unk_1002414D0;
      objc_copyWeak(&v24, &buf);
      -[MZUniversalPlaybackPositionStore _onQueueLoadBagContextWithCompletionHandler:]( self,  "_onQueueLoadBagContextWithCompletionHandler:",  v23);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&buf);
    }
  }

  else
  {
    uint64_t v11 = _MTLogCategoryUPPSync(v6);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "_onQueueSynchronizeImmediatelyWithCompletionBlock - short circuiting. No Active Account!",  (uint8_t *)&buf,  2u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000364B8;
    block[3] = &unk_1002400E8;
    id v31 = v4;
    dispatch_async(v14, block);
  }
}

- (id)_accountForSyncing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);

  return v3;
}

- (void)_updateSettingsFromLoadedBagContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100036CE0;
  v4[3] = &unk_100240240;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3
{
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000370B8;
  v32[3] = &unk_1002414F8;
  v32[4] = self;
  id v4 = a3;
  id v33 = v4;
  id v5 = objc_retainBlock(v32);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing"));
  if (v6)
  {

    goto LABEL_4;
  }

  BOOL v7 = -[MZUniversalPlaybackPositionStore canRequestStoreSignIn](self, "canRequestStoreSignIn");
  if (v7)
  {
LABEL_4:
    if (self->_bagLookupTask)
    {
      uint64_t v8 = _MTLogCategoryCloudSync(v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "_onQueueLoadBag - UPP load bag already in progress.  pending our completion block to be notified when it completes.",  (uint8_t *)buf,  2u);
      }

      -[MZAsynchronousTask addTaskCompletionBlock:](self->_bagLookupTask, "addTaskCompletionBlock:", v5);
    }

    else
    {
      objc_initWeak(buf, self);
      BOOL v10 = objc_alloc(&OBJC_CLASS___MZAsynchronousTask);
      uint64_t v11 = -[MZAsynchronousTask initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:]( v10,  "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:",  self->_queue,  @"MZUPPStore Load Bag",  20.0,  *(double *)&qword_1002B8960);
      bagLookupTask = self->_bagLookupTask;
      self->_bagLookupTask = v11;

      v13 = self->_bagLookupTask;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100037130;
      v26[3] = &unk_100240290;
      objc_copyWeak(&v27, buf);
      -[MZAsynchronousTask setExpirationHandler:](v13, "setExpirationHandler:", v26);
      v14 = self->_bagLookupTask;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000371BC;
      v24[3] = &unk_100240290;
      objc_copyWeak(&v25, buf);
      -[MZAsynchronousTask setFinishedHandler:](v14, "setFinishedHandler:", v24);
      -[MZAsynchronousTask addTaskCompletionBlock:](self->_bagLookupTask, "addTaskCompletionBlock:", v5);
      -[MZAsynchronousTask beginTaskOperation](self->_bagLookupTask, "beginTaskOperation");
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100037320;
      v22[3] = &unk_100241540;
      objc_copyWeak(&v23, buf);
      -[MZUniversalPlaybackPositionStore _grabBagWithCompletionBlock:](self, "_grabBagWithCompletionBlock:", v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(buf);
    }

    goto LABEL_12;
  }

  uint64_t v15 = _MTLogCategoryCloudSync(v7);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_onQueueLoadBag - UPP skipping bag load: No Active Account!",  (uint8_t *)buf,  2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1001LL,  0LL));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003711C;
  block[3] = &unk_1002405F8;
  double v20 = v5;
  id v30 = v17;
  id v31 = v20;
  id v21 = v17;
  dispatch_async(v19, block);

LABEL_12:
}

- (void)_grabBagWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000375F8;
  block[3] = &unk_1002400E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_updateForStoreAccountsChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing"));

  queue = (dispatch_queue_s *)self->_queue;
  if (v3)
  {
    id v8 = _NSConcreteStackBlock;
    id v5 = sub_1000377B4;
    id v6 = &v8;
  }

  else
  {
    BOOL v7 = _NSConcreteStackBlock;
    id v5 = sub_1000377BC;
    id v6 = &v7;
  }

  v6[1] = (void **)3221225472LL;
  v6[2] = (void **)v5;
  v6[3] = (void **)&unk_10023FF98;
  v6[4] = (void **)&self->super.isa;
  dispatch_async(queue, v6);
}

- (double)_effectiveAutorefreshRate
{
  double v4 = v3 / 60.0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](&OBJC_CLASS___MZPreferences, "storeBookkeeperPreferences"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"AutoSyncRateInMinutes" withDefaultValue:v6]);
  [v7 floatValue];
  float v9 = v8;

  if (v4 != v9) {
    return (float)(v9 * 60.0);
  }
  double result = self->_bagSpecifiedPollingInterval;
  if (result <= 0.00000011920929) {
    return (float)(v9 * 60.0);
  }
  return result;
}

- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000378F0;
  v4[3] = &unk_100240350;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_timerFired:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003798C;
  block[3] = &unk_10023FF98;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)startUPPSyncTimer
{
}

- (void)_onQueueScheduleTimer
{
  BOOL v3 = +[MTPrivacyUtil privacyAcknowledgementNeeded](&OBJC_CLASS___MTPrivacyUtil, "privacyAcknowledgementNeeded");
  if (v3)
  {
    uint64_t v4 = _MTLogCategoryCloudSync(v3);
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Cannot schedule UPPSync timer. Privacy acknowledgement needed.",  buf,  2u);
    }
  }

  else if (!self->_refreshTimerActive)
  {
    self->_refreshTimerActive = 1;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore dateToFireNextTimer](self, "dateToFireNextTimer"));
    [v6 timeIntervalSinceNow];
    uint64_t v8 = v7;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100037A94;
    v9[3] = &unk_100241568;
    v9[5] = v8;
    v9[4] = self;
    dispatch_async(&_dispatch_main_q, v9);
  }

- (void)_onQueueStopTimer
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  -[MZUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v3);

  -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
}

- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
  -[MZUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v5);

  -[MZUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
}

- (void)_onQueueStartNewTimer
{
}

- (void)_onQueueSuspendTimer
{
  if (self->_refreshTimerActive)
  {
    uint64_t v3 = _MTLogCategoryCloudSync(self);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "suspending update timer", v5, 2u);
    }

    -[NSTimer invalidate](self->_timer, "invalidate");
    -[MZUniversalPlaybackPositionStore setTimer:](self, "setTimer:", 0LL);
    self->_refreshTimerActive = 0;
  }

- (BOOL)_timerIsStopped
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore dateToFireNextTimer](self, "dateToFireNextTimer"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  unsigned __int8 v4 = [v2 isEqualToDate:v3];

  return v4;
}

- (void)_onQueueResumeTimer
{
  if (-[MZUniversalPlaybackPositionStore isActive](self, "isActive")
    && !self->_refreshTimerActive
    && !-[MZUniversalPlaybackPositionStore _timerIsStopped](self, "_timerIsStopped"))
  {
    -[MZUniversalPlaybackPositionStore _onQueueScheduleTimer](self, "_onQueueScheduleTimer");
  }

- (MZUniversalPlaybackPositionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (MZUniversalPlaybackPositionDataSource *)a3;
}

- (unint64_t)automaticSynchronizeOptions
{
  return self->_automaticSynchronizeOptions;
}

- (BOOL)hasLocalChangesToSync
{
  return self->_hasLocalChangesToSync;
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  self->_canRequestStoreSignIn = a3;
}

- (MZUPPAsynchronousTask)synchronizeTask
{
  return self->_synchronizeTask;
}

- (void)setSynchronizeTask:(id)a3
{
}

- (MZAsynchronousTask)bagLookupTask
{
  return self->_bagLookupTask;
}

- (void)setBagLookupTask:(id)a3
{
}

- (MZUniversalPlaybackPositionSyncHandler)syncHandler
{
  return self->_syncHandler;
}

- (void)setSyncHandler:(id)a3
{
}

- (NSDate)dateToFireNextTimer
{
  return self->_dateToFireNextTimer;
}

- (void)setDateToFireNextTimer:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)refreshTimerActive
{
  return self->_refreshTimerActive;
}

- (void)setRefreshTimerActive:(BOOL)a3
{
  self->_refreshTimerActive = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)initialAutosyncNeeded
{
  return self->_initialAutosyncNeeded;
}

- (void)setInitialAutosyncNeeded:(BOOL)a3
{
  self->_initialAutosyncNeeded = a3;
}

- (id)prefsObserver
{
  return self->_prefsObserver;
}

- (void)setPrefsObserver:(id)a3
{
  self->_prefsObserver = a3;
}

- (double)autorefreshRate
{
  return self->_autorefreshRate;
}

- (void)setAutorefreshRate:(double)a3
{
  self->_autorefreshRate = a3;
}

- (double)bagSpecifiedPollingInterval
{
  return self->_bagSpecifiedPollingInterval;
}

- (void)setBagSpecifiedPollingInterval:(double)a3
{
  self->_bagSpecifiedPollingInterval = a3;
}

- (void).cxx_destruct
{
}

@end