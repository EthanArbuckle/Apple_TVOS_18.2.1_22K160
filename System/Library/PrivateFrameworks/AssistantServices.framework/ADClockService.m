@interface ADClockService
+ (id)sharedService;
+ (void)initialize;
- (ADClockService)init;
- (ADRemoteTimerManager)remoteTimerManager;
- (MTTimerManagerIntentSupport)timerManagerProxyForIntentSupport;
- (SOClockAlarmManager)localAlarmManager;
- (SOClockTimerManager)localTimerManager;
- (id)_mergedClockAlarmSnapshot;
- (id)_mergedClockTimerSnapshot;
- (id)addTimer:(id)a3;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)queue;
- (id)removeTimer:(id)a3;
- (id)sleepTimersWithState:(unint64_t)a3;
- (id)timers;
- (id)updateTimer:(id)a3;
- (void)_addTimer:(id)a3 completion:(id)a4;
- (void)_dismissFiringItemsWithOptions:(unint64_t)a3;
- (void)_enumerateAlarmSnapshotsUsingBlock:(id)a3;
- (void)_enumerateAlarmsUsingBlock:(id)a3;
- (void)_enumerateTimerSnapshotsUsingBlock:(id)a3;
- (void)_enumerateTimersUsingBlock:(id)a3;
- (void)_fetchTimerWithID:(id)a3 completion:(id)a4;
- (void)_fetchTimersWithCompletion:(id)a3;
- (void)_mutateMergedClockTimerSnapshotUsingBlock:(id)a3;
- (void)_performBlock:(id)a3;
- (void)_removeTimer:(id)a3 completion:(id)a4;
- (void)_removeTimerWithID:(id)a3 completion:(id)a4;
- (void)_updateTimer:(id)a3 completion:(id)a4;
- (void)_updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5;
- (void)getFiringStatesWithCompletion:(id)a3;
- (void)getSnapshotsWithCompletion:(id)a3;
- (void)performBlock:(id)a3;
- (void)removeTimerWithID:(id)a3 completion:(id)a4;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5;
@end

@implementation ADClockService

- (MTTimerManagerIntentSupport)timerManagerProxyForIntentSupport
{
  if ((AFIsATV(self, a2) & 1) != 0) {
    v3 = 0LL;
  }
  else {
    v3 = self;
  }
  return (MTTimerManagerIntentSupport *)v3;
}

- (id)timers
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADClockService(IntentSupport) timers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = off_100573030();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010686C;
  v9[3] = &unk_1004F1878;
  v9[4] = self;
  id v5 = [off_100573038() immediateScheduler];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 futureWithBlock:v9 scheduler:v6]);

  return v7;
}

- (id)sleepTimersWithState:(unint64_t)a3
{
  id v5 = off_100573030();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100106570;
  v10[3] = &unk_1004F18A0;
  v10[4] = self;
  v10[5] = a3;
  id v6 = [off_100573038() immediateScheduler];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 futureWithBlock:v10 scheduler:v7]);

  return v8;
}

- (id)addTimer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADClockService(IntentSupport) addTimer:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s timerToAdd = %@", buf, 0x16u);
  }

  id v6 = off_100573030();
  v14 = self;
  id v15 = v4;
  v7 = off_100573038;
  id v8 = v4;
  id v9 = objc_msgSend(v7(), "immediateScheduler", _NSConcreteStackBlock, 3221225472, sub_100106068, &unk_1004F1918, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 futureWithBlock:&v13 scheduler:v10]);

  return v11;
}

- (id)updateTimer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADClockService(IntentSupport) updateTimer:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s timerToUpdate = %@", buf, 0x16u);
  }

  id v6 = off_100573030();
  v14 = self;
  id v15 = v4;
  v7 = off_100573038;
  id v8 = v4;
  id v9 = objc_msgSend(v7(), "immediateScheduler", _NSConcreteStackBlock, 3221225472, sub_100104E6C, &unk_1004F1918, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 futureWithBlock:&v13 scheduler:v10]);

  return v11;
}

- (id)removeTimer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADClockService(IntentSupport) removeTimer:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s timerToRemove = %@", buf, 0x16u);
  }

  id v6 = off_100573030();
  v14 = self;
  id v15 = v4;
  v7 = off_100573038;
  id v8 = v4;
  id v9 = objc_msgSend(v7(), "immediateScheduler", _NSConcreteStackBlock, 3221225472, sub_100104280, &unk_1004F1918, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 futureWithBlock:&v13 scheduler:v10]);

  return v11;
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  return 0LL;
}

- (ADClockService)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ADClockService;
  v2 = -[ADClockService init](&v23, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.clock-service", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v9;

    v11 = objc_alloc_init(&OBJC_CLASS___ADRemoteTimerManager);
    remoteTimerManager = v2->_remoteTimerManager;
    v2->_remoteTimerManager = v11;

    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___SOClockAlarmManager);
    localAlarmManager = v2->_localAlarmManager;
    v2->_localAlarmManager = v13;

    id v15 = v2->_localAlarmManager;
    if (!v15)
    {
      v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[ADClockService init]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to get an instance of SOClockAlarmManager.",  buf,  0xCu);
        id v15 = v2->_localAlarmManager;
      }

      else
      {
        id v15 = 0LL;
      }
    }

    -[SOClockAlarmManager checkIn](v15, "checkIn");
    v17 = objc_alloc_init(&OBJC_CLASS___SOClockTimerManager);
    localTimerManager = v2->_localTimerManager;
    v2->_localTimerManager = v17;

    id v19 = v2->_localTimerManager;
    if (!v19)
    {
      v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[ADClockService init]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Unable to get an instance of SOClockTimerManager.",  buf,  0xCu);
        id v19 = v2->_localTimerManager;
      }

      else
      {
        id v19 = 0LL;
      }
    }

    -[SOClockTimerManager checkIn](v19, "checkIn");
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v21 addListener:v2];
  }

  return v2;
}

- (void)getFiringStatesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_group_t v9 = "-[ADClockService getFiringStatesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10034CB6C;
    v6[3] = &unk_1004FD990;
    v6[4] = self;
    id v7 = v4;
    -[ADClockService performBlock:](self, "performBlock:", v6);
  }
}

- (void)getSnapshotsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_group_t v9 = "-[ADClockService getSnapshotsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10034CA14;
    v6[3] = &unk_1004FD990;
    v6[4] = self;
    id v7 = v4;
    -[ADClockService performBlock:](self, "performBlock:", v6);
  }
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a6;
  dispatch_group_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _contextManager]);

  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10034C2C0;
  v14[3] = &unk_1004FD510;
  id v15 = v8;
  v16 = self;
  id v17 = v10;
  int64_t v18 = a5;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(queue, v14);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10034C1DC;
  block[3] = &unk_1004FDA80;
  id v13 = self;
  int64_t v14 = a5;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (id)queue
{
  return self->_queue;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10034C1D0;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_performBlock:(id)a3
{
  group = self->_group;
  if (group) {
    dispatch_group_notify((dispatch_group_t)group, (dispatch_queue_t)self->_queue, a3);
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_mutateMergedClockTimerSnapshotUsingBlock:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADClockService _mutateMergedClockTimerSnapshotUsingBlock:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Begin mutating timer snapshot.",  (uint8_t *)&v11,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADClockService _mergedClockTimerSnapshot](self, "_mergedClockTimerSnapshot"));
    uint64_t v7 = v4[2](v4, v6);
    id v8 = (AFClockTimerSnapshot *)objc_claimAutoreleasedReturnValue(v7);
    mergedClockTimerSnapshot = self->_mergedClockTimerSnapshot;
    self->_mergedClockTimerSnapshot = v8;

    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[ADClockService _mutateMergedClockTimerSnapshotUsingBlock:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s End mutating timer snapshot.",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)_enumerateAlarmSnapshotsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (self->_localClockAlarmSnapshot) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
    remoteClockAlarmSnapshotsByDeviceIdentifier = self->_remoteClockAlarmSnapshotsByDeviceIdentifier;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10034C1C4;
    v7[3] = &unk_1004FD538;
    id v8 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( remoteClockAlarmSnapshotsByDeviceIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  v7);

    id v4 = v6;
  }
}

- (void)_enumerateAlarmsUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10034C108;
    v6[3] = &unk_1004FD588;
    id v7 = v4;
    -[ADClockService _enumerateAlarmSnapshotsUsingBlock:](self, "_enumerateAlarmSnapshotsUsingBlock:", v6);
  }
}

- (void)_enumerateTimerSnapshotsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (self->_localClockTimerSnapshot) {
      (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    }
    remoteClockTimerSnapshotsByDeviceIdentifier = self->_remoteClockTimerSnapshotsByDeviceIdentifier;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10034C0FC;
    v7[3] = &unk_1004FD5B0;
    id v8 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( remoteClockTimerSnapshotsByDeviceIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  v7);

    id v4 = v6;
  }
}

- (void)_enumerateTimersUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10034C040;
    v6[3] = &unk_1004FD600;
    id v7 = v4;
    -[ADClockService _enumerateTimerSnapshotsUsingBlock:](self, "_enumerateTimerSnapshotsUsingBlock:", v6);
  }
}

- (id)_mergedClockAlarmSnapshot
{
  mergedClockAlarmSnapshot = self->_mergedClockAlarmSnapshot;
  if (!mergedClockAlarmSnapshot)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[ADClockService _mergedClockAlarmSnapshot]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Merging local and remote alarms...",  buf,  0xCu);
    }

    dispatch_queue_attr_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFClockAlarmSnapshot alarmsByID](self->_localClockAlarmSnapshot, "alarmsByID"));
    if ([v6 count])
    {
      id v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v8 = v7;
        id v9 = [v6 count];
        *(_DWORD *)buf = 136315394;
        v27 = "-[ADClockService _mergedClockAlarmSnapshot]";
        __int16 v28 = 2048;
        id v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Adding %tu alarms (local)...", buf, 0x16u);
      }

      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);
    }

    remoteClockAlarmSnapshotsByDeviceIdentifier = self->_remoteClockAlarmSnapshotsByDeviceIdentifier;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10034BEC8;
    v24[3] = &unk_1004FD628;
    int v11 = v5;
    v25 = v11;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( remoteClockAlarmSnapshotsByDeviceIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  v24);
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_10034BFDC;
    v22 = &unk_1004FD650;
    id v12 = v11;
    objc_super v23 = v12;
    id v13 = (AFClockAlarmSnapshot *)+[AFClockAlarmSnapshot newWithBuilder:]( &OBJC_CLASS___AFClockAlarmSnapshot,  "newWithBuilder:",  &v19);
    int64_t v14 = self->_mergedClockAlarmSnapshot;
    self->_mergedClockAlarmSnapshot = v13;

    id v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      id v17 = -[NSMutableDictionary count](v12, "count", v19, v20, v21, v22);
      *(_DWORD *)buf = 136315394;
      v27 = "-[ADClockService _mergedClockAlarmSnapshot]";
      __int16 v28 = 2048;
      id v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Merged %tu local and remote alarms.",  buf,  0x16u);
    }

    mergedClockAlarmSnapshot = self->_mergedClockAlarmSnapshot;
  }

  return mergedClockAlarmSnapshot;
}

- (id)_mergedClockTimerSnapshot
{
  mergedClockTimerSnapshot = self->_mergedClockTimerSnapshot;
  if (!mergedClockTimerSnapshot)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[ADClockService _mergedClockTimerSnapshot]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Merging local and remote timers...",  buf,  0xCu);
    }

    dispatch_queue_attr_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFClockTimerSnapshot timersByID](self->_localClockTimerSnapshot, "timersByID"));
    if ([v6 count])
    {
      id v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v8 = v7;
        id v9 = [v6 count];
        *(_DWORD *)buf = 136315394;
        v27 = "-[ADClockService _mergedClockTimerSnapshot]";
        __int16 v28 = 2048;
        id v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Adding %tu timers (local)...", buf, 0x16u);
      }

      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);
    }

    remoteClockTimerSnapshotsByDeviceIdentifier = self->_remoteClockTimerSnapshotsByDeviceIdentifier;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10034BD50;
    v24[3] = &unk_1004FD678;
    int v11 = v5;
    v25 = v11;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( remoteClockTimerSnapshotsByDeviceIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  v24);
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_10034BE64;
    v22 = &unk_1004FD6A0;
    id v12 = v11;
    objc_super v23 = v12;
    id v13 = (AFClockTimerSnapshot *)+[AFClockTimerSnapshot newWithBuilder:]( &OBJC_CLASS___AFClockTimerSnapshot,  "newWithBuilder:",  &v19);
    int64_t v14 = self->_mergedClockTimerSnapshot;
    self->_mergedClockTimerSnapshot = v13;

    id v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      id v17 = -[NSMutableDictionary count](v12, "count", v19, v20, v21, v22);
      *(_DWORD *)buf = 136315394;
      v27 = "-[ADClockService _mergedClockTimerSnapshot]";
      __int16 v28 = 2048;
      id v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Merged %tu local and remote timers.",  buf,  0x16u);
    }

    mergedClockTimerSnapshot = self->_mergedClockTimerSnapshot;
  }

  return mergedClockTimerSnapshot;
}

- (void)_fetchTimersWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_attr_t v5 = self->_queue;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOClockTimerManager timers](self->_localTimerManager, "timers"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10034BC00;
    v15[3] = &unk_1004FD6C8;
    id v7 = v5;
    v16 = v7;
    id v8 = v4;
    id v17 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 addSuccessBlock:v15]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10034BC94;
    v12[3] = &unk_1004FD6F0;
    id v13 = v7;
    id v14 = v8;
    id v10 = v7;
    id v11 = [v9 addFailureBlock:v12];
  }
}

- (void)_fetchTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10034BAA8;
    v8[3] = &unk_1004FD718;
    id v9 = v6;
    id v10 = v7;
    -[ADClockService _fetchTimersWithCompletion:](self, "_fetchTimersWithCompletion:", v8);
  }
}

- (void)_addTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADClockService _addTimer:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerToAdd = %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOClockTimerManager addTimer:](self->_localTimerManager, "addTimer:", v6));
  if (v7)
  {
    id v10 = self->_queue;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 timerID]);
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10034B5FC;
    v23[3] = &unk_1004FD830;
    id v12 = v10;
    v24 = v12;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = v11;
    id v25 = v13;
    id v14 = v7;
    id v27 = v14;
    id v15 = v6;
    id v26 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 addSuccessBlock:v23]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10034B6BC;
    v19[3] = &unk_1004FD740;
    id v20 = v15;
    id v17 = v12;
    v21 = v17;
    id v22 = v14;
    id v18 = [v16 addFailureBlock:v19];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10034B5EC;
  v15[3] = &unk_1004FDA30;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[ADClockService _updateTimerWithID:changes:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s timerID = %@, changes = %@", buf, 0x20u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10034B174;
  v15[3] = &unk_1004FD790;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  -[ADClockService _fetchTimerWithID:completion:](self, "_fetchTimerWithID:completion:", v12, v15);
}

- (void)_updateTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADClockService _updateTimer:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerToUpdate = %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOClockTimerManager updateTimer:](self->_localTimerManager, "updateTimer:", v6));
  if (v7)
  {
    id v10 = self->_queue;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 timerID]);
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10034ACC4;
    v23[3] = &unk_1004FD830;
    id v12 = v10;
    __int16 v24 = v12;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = v11;
    id v25 = v13;
    id v14 = v7;
    id v27 = v14;
    id v15 = v6;
    id v26 = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 addSuccessBlock:v23]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10034AD84;
    v19[3] = &unk_1004FD740;
    id v20 = v15;
    id v17 = v12;
    v21 = v17;
    id v22 = v14;
    id v18 = [v16 addFailureBlock:v19];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)removeTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10034ACB4;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_removeTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADClockService _removeTimerWithID:completion:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerID = %@", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10034AAAC;
  v11[3] = &unk_1004FD7B8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  -[ADClockService _fetchTimerWithID:completion:](self, "_fetchTimerWithID:completion:", v9, v11);
}

- (void)_removeTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADClockService _removeTimer:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerToRemove = %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOClockTimerManager removeTimer:](self->_localTimerManager, "removeTimer:", v6));
  if (v7)
  {
    id v10 = self->_queue;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 timerID]);
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10034A5F4;
    v23[3] = &unk_1004FD830;
    id v12 = v10;
    __int16 v24 = v12;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = v11;
    id v25 = v13;
    id v14 = v6;
    id v26 = v14;
    id v15 = v7;
    id v27 = v15;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 addSuccessBlock:v23]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10034A6B4;
    v19[3] = &unk_1004FD740;
    id v20 = v14;
    id v17 = v12;
    v21 = v17;
    id v22 = v15;
    id v18 = [v16 addFailureBlock:v19];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_dismissFiringItemsWithOptions:(unint64_t)a3
{
  unint64_t v4 = a3 & 1;
  unint64_t v5 = a3 & 2;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v10 = "-[ADClockService _dismissFiringItemsWithOptions:]";
    __int16 v11 = 1024;
    int v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5 >> 1;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s includingAlarms = %d, includingTimers = %d",  buf,  0x18u);
  }

  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10034992C;
    v8[3] = &unk_1004FD940;
    void v8[4] = self;
    -[ADClockService _performBlock:](self, "_performBlock:", v8);
  }

  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100349E34;
    v7[3] = &unk_1004FD940;
    void v7[4] = self;
    -[ADClockService _performBlock:](self, "_performBlock:", v7);
  }

- (ADRemoteTimerManager)remoteTimerManager
{
  return self->_remoteTimerManager;
}

- (SOClockAlarmManager)localAlarmManager
{
  return self->_localAlarmManager;
}

- (SOClockTimerManager)localTimerManager
{
  return self->_localTimerManager;
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ADClockService) == a1)
  {
    +[SOClockAlarmManager warmUp](&OBJC_CLASS___SOClockAlarmManager, "warmUp");
    +[SOClockTimerManager warmUp](&OBJC_CLASS___SOClockTimerManager, "warmUp");
  }

+ (id)sharedService
{
  if (AFIsHorseman(a1, a2))
  {
    if (qword_100578698 != -1) {
      dispatch_once(&qword_100578698, &stru_1004FD358);
    }
    id v2 = (id)qword_1005786A0;
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

@end