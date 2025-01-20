@interface AppInstallObserver
- (AppInstallObserver)init;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorShouldBeginPostProcessing:(id)a3 forApplicationRecord:(id)a4;
@end

@implementation AppInstallObserver

- (AppInstallObserver)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AppInstallObserver;
  v2 = -[AppInstallObserver init](&v20, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    policyQueue = v2->_policyQueue;
    v2->_policyQueue = v3;

    v5 = v2->_policyQueue;
    if (v5) {
      -[NSOperationQueue setName:]( v5->_operationQueue,  "setName:",  @"com.apple.appstored.AppInstallObserver.policyQueue");
    }
    id v6 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v7;

    id v9 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    installScheduler = v2->_installScheduler;
    v2->_installScheduler = (AppInstallScheduler *)v10;

    uint64_t v12 = ASDLogHandleForCategory(2LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Observing installation notifications",  v19,  2u);
    }

    v14 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    observedCoordinators = v2->_observedCoordinators;
    v2->_observedCoordinators = v16;
  }

  return v2;
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
}

- (void)coordinatorShouldBeginPostProcessing:(id)a3 forApplicationRecord:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 URL]);
  uint64_t v8 = ASDLogHandleForCategory(2LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    *(_DWORD *)buf = 138543618;
    v18 = v10;
    __int16 v19 = 2114;
    objc_super v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "coordinatorShouldBeginPostProcessing for bundleID: %{public}@ at URL: %{public}@",  buf,  0x16u);
  }

  databaseStore = self->_databaseStore;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001F0BC4;
  v14[3] = &unk_1003EBCA0;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  -[AppInstallsDatabaseStore modifyUsingTransaction:](databaseStore, "modifyUsingTransaction:", v14);
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  id v9 = a3;
  uint64_t v10 = ASDLogHandleForCategory(24LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
    if (a5 >= 3) {
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown progress value %lu",  a5));
    }
    else {
      id v16 = off_1003EC578[a5];
    }
    *(_DWORD *)buf = 138413058;
    v18 = v15;
    __int16 v19 = 2048;
    double v20 = a4;
    __int16 v21 = 2112;
    v22 = v16;
    __int16 v23 = 2048;
    double v24 = a6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "(AppInstallObserver) Coordinator %@ sent progress: %f for phase: %@ overall: %f",  buf,  0x2Au);
  }

  if (a5 == 1)
  {
    id v12 = sub_1002B0944((uint64_t)&OBJC_CLASS___ProgressCache);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
    sub_1002B2700((uint64_t)v13, v14, fmin(a4 / 100.0, 1.0));
  }
}

- (void).cxx_destruct
{
}

@end