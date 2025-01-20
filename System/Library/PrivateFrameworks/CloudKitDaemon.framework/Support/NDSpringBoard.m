@interface NDSpringBoard
+ (id)sharedSpringBoard;
- (BOOL)applicationIsForeground:(id)a3;
- (BOOL)identifierIsForSpringBoardApplication:(id)a3;
- (NDSpringBoard)init;
- (unsigned)applicationStateForBundleID:(id)a3;
- (void)addObserver:(id)a3 forApplication:(id)a4;
- (void)handleApplicationStateChange:(id)a3;
- (void)removeObserver:(id)a3 forApplication:(id)a4;
- (void)setupMonitor;
- (void)startMonitoringBundleID:(id)a3;
- (void)stopMonitoringBundleID:(id)a3;
@end

@implementation NDSpringBoard

+ (id)sharedSpringBoard
{
  if (qword_100016108 != -1) {
    dispatch_once(&qword_100016108, &stru_100010748);
  }
  return (id)qword_100016110;
}

- (NDSpringBoard)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NDSpringBoard;
  v2 = -[NDSpringBoard init](&v16, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
    monitor = v2->_monitor;
    v2->_monitor = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    appStates = v2->_appStates;
    v2->_appStates = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    monitoredBundleIDs = v2->_monitoredBundleIDs;
    v2->_monitoredBundleIDs = (NSMutableSet *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.nsnetwork.SpringBoard-queue", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;
  }

  return v2;
}

- (void)setupMonitor
{
  monitor = self->_monitor;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_monitoredBundleIDs, "allObjects"));
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:](monitor, "updateInterestedBundleIDs:", v4);

  -[BKSApplicationStateMonitor setHandler:](self->_monitor, "setHandler:", &stru_100010788);
}

- (void)handleApplicationStateChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A3A8;
  v7[3] = &unk_1000107B0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)addObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A7F4;
  block[3] = &unk_1000107D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)removeObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A928;
  block[3] = &unk_1000107D8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)startMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A9E8;
  v7[3] = &unk_1000107B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000AB18;
  v7[3] = &unk_1000107B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (unsigned)applicationStateForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AC28;
  block[3] = &unk_100010800;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return queue;
}

- (BOOL)applicationIsForeground:(id)a3
{
  return -[NDSpringBoard applicationStateForBundleID:](self, "applicationStateForBundleID:", a3) == 8;
}

- (BOOL)identifierIsForSpringBoardApplication:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  unsigned int v5 = [v4 applicationIsInstalled:v3];

  if (v5)
  {
    uint64_t v9 = 0LL;
    unsigned __int8 v6 = 1;
    id v7 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end