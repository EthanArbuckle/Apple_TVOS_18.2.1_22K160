@interface DMDAppLifeCycle
+ (id)_lifeCycleByBundleIdentifier;
+ (id)lifeCycleForBundleIdentifier:(id)a3;
+ (void)_removeLifeCycleForBundleIdentifier:(id)a3;
- (BOOL)_isInTransitoryState;
- (BOOL)_isStale;
- (BOOL)_isUnchangedForInterval:(double)a3;
- (CATStateMachine)stateMachine;
- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3;
- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3 currentState:(unint64_t)a4;
- (NSDate)lastModified;
- (NSOperationQueue)queue;
- (NSPointerArray)observers;
- (NSProgress)progress;
- (NSString)bundleIdentifier;
- (NSString)currentStateName;
- (unint64_t)currentState;
- (void)_updateLastModified;
- (void)addObserver:(id)a3;
- (void)cancelAndWaitUntilAllOperationsAreFinished;
- (void)didCancelInstalling;
- (void)didCancelUpdating;
- (void)didChangeInstallingProgress;
- (void)didChangeUpdatingProgress;
- (void)didFailInstalling;
- (void)didFailUninstalling;
- (void)didFailUpdating;
- (void)didFinishInstalling;
- (void)didFinishUninstalling;
- (void)didFinishUpdating;
- (void)didPauseInstalling;
- (void)didPauseUpdating;
- (void)didResetState;
- (void)didResumeInstalling;
- (void)didResumeUpdating;
- (void)didStartInstalling;
- (void)didStartUpdating;
- (void)removeObserver:(id)a3;
- (void)setLastModified:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)willStartInstalling;
- (void)willStartUninstalling;
- (void)willStartUpdating;
@end

@implementation DMDAppLifeCycle

+ (id)lifeCycleForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _lifeCycleByBundleIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
  id v8 = [v7 _isStale];
  if ((_DWORD)v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 observers]);
    uint64_t v12 = DMFAppLog(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218242;
      id v23 = [v10 count];
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Preserving %lu observers for bundle ID: %{public}@",  (uint8_t *)&v22,  0x16u);
    }

    uint64_t v16 = DMFAppLog(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      id v23 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Discard stale app lifecycle for bundle ID: %{public}@",  (uint8_t *)&v22,  0xCu);
    }

LABEL_10:
    id v20 = [objc_alloc((Class)objc_opt_class(DMDiphoneOSAppLifeCycle)) initWithBundleIdentifier:v4];
    v7 = v20;
    if (v10) {
      [v20 setObservers:v10];
    }
    [v6 setObject:v7 forKeyedSubscript:v4];
    [v7 didResetState];
    goto LABEL_13;
  }

  uint64_t v18 = DMFAppLog(v8, v9);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543362;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Lifecycle is not stale for bundle ID: %{public}@",  (uint8_t *)&v22,  0xCu);
  }

  v10 = 0LL;
  if (!v7) {
    goto LABEL_10;
  }
LABEL_13:

  objc_sync_exit(v5);
  return v7;
}

+ (void)_removeLifeCycleForBundleIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _lifeCycleByBundleIdentifier]);
  [v5 setObject:0 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

+ (id)_lifeCycleByBundleIdentifier
{
  if (qword_1000CCBF0 != -1) {
    dispatch_once(&qword_1000CCBF0, &stru_10009DFD8);
  }
  return (id)qword_1000CCBE8;
}

- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  id v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 handleFailureInMethod:a2, self, @"DMDAppLifeCycle.m", 88, @"%@ must implement %@", self, v7 object file lineNumber description];

  return 0LL;
}

- (DMDAppLifeCycle)initWithBundleIdentifier:(id)a3 currentState:(unint64_t)a4
{
  id v6 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___DMDAppLifeCycle;
  v7 = -[DMDAppLifeCycle init](&v53, "init");
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    lastModified = v7->_lastModified;
    v7->_lastModified = (NSDate *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    observers = v7->_observers;
    v7->_observers = (NSPointerArray *)v12;

    uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    queue = v7->_queue;
    v7->_queue = v14;

    uint64_t v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.dmd.%@.%p(%@).queue",  objc_opt_class(v7),  v7,  v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NSOperationQueue setName:](v7->_queue, "setName:", v17);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_queue, "setMaxConcurrentOperationCount:", 1LL);
    uint64_t v18 = -[CATStateMachine initWithTarget:](objc_alloc(&OBJC_CLASS___CATStateMachine), "initWithTarget:", v7);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v18;

    id v20 = v7->_stateMachine;
    id v51 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 0LL));
    unint64_t v50 = a4;
    int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v20, "addStateWithName:", v21));

    id v23 = v7->_stateMachine;
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 1LL));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v23, "addStateWithName:", v24));

    id v25 = v7->_stateMachine;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 2LL));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v25, "addStateWithName:", v26));

    v28 = v7->_stateMachine;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 3LL));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v28, "addStateWithName:", v29));

    v31 = v7->_stateMachine;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 4LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v31, "addStateWithName:", v32));

    v34 = v7->_stateMachine;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 5LL));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v34, "addStateWithName:", v35));

    v37 = v7->_stateMachine;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 6LL));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v37, "addStateWithName:", v38));

    v40 = v7->_stateMachine;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 7LL));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v40, "addStateWithName:", v41));

    v42 = v7->_stateMachine;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 8LL));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine addStateWithName:](v42, "addStateWithName:", v43));

    [v22 addTransitionToState:v52 triggeringEvent:@"willStartInstalling"];
    [v52 addTransitionToState:v27 triggeringEvent:@"didStartInstalling"];
    [v52 addTransitionToState:v22 triggeringEvent:@"didCancelInstalling"];
    [v27 addTransitionToState:v30 triggeringEvent:@"didPauseInstalling"];
    [v27 addTransitionToState:v22 triggeringEvent:@"didCancelInstalling"];
    [v27 addTransitionToState:v22 triggeringEvent:@"didFailInstalling"];
    [v27 addTransitionToState:v33 triggeringEvent:@"didFinishInstalling"];
    [v30 addTransitionToState:v27 triggeringEvent:@"didResumeInstalling"];
    [v30 addTransitionToState:v22 triggeringEvent:@"didCancelInstalling"];
    [v33 addTransitionToState:v36 triggeringEvent:@"willStartUpdating"];
    [v33 addTransitionToState:v44 triggeringEvent:@"willStartUninstalling"];
    [v36 addTransitionToState:v39 triggeringEvent:@"didStartUpdating"];
    [v36 addTransitionToState:v33 triggeringEvent:@"didCancelUpdating"];
    [v39 addTransitionToState:v49 triggeringEvent:@"didPauseUpdating"];
    [v39 addTransitionToState:v33 triggeringEvent:@"didCancelUpdating"];
    [v39 addTransitionToState:v33 triggeringEvent:@"didFailUpdating"];
    [v39 addTransitionToState:v33 triggeringEvent:@"didFinishUpdating"];
    [v44 addTransitionToState:v33 triggeringEvent:@"didFailUninstalling"];
    [v44 addTransitionToState:v22 triggeringEvent:@"didFinishUninstalling"];
    v45 = v7->_stateMachine;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", v50));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CATStateMachine stateWithName:](v45, "stateWithName:", v46));
    -[CATStateMachine setInitialState:](v7->_stateMachine, "setInitialState:", v47);

    id v6 = v51;
    -[CATStateMachine setLogLevel:](v7->_stateMachine, "setLogLevel:", 2LL);
    -[CATStateMachine start](v7->_stateMachine, "start");
  }

  return v7;
}

- (BOOL)_isStale
{
  unsigned int v3 = -[DMDAppLifeCycle _isInTransitoryState](self, "_isInTransitoryState");
  double v4 = 60.0;
  if (v3) {
    double v4 = 10.0;
  }
  return -[DMDAppLifeCycle _isUnchangedForInterval:](self, "_isUnchangedForInterval:", v4);
}

- (BOOL)_isInTransitoryState
{
  return (-[DMDAppLifeCycle currentState](self, "currentState") & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (BOOL)_isUnchangedForInterval:(double)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle lastModified](self, "lastModified"));
  [v4 timeIntervalSinceNow];
  double v6 = -v5;

  return v6 >= a3;
}

- (void)_updateLastModified
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[DMDAppLifeCycle setLastModified:](self, "setLastModified:", v3);
}

- (unint64_t)currentState
{
  if (qword_1000CCC00 != -1) {
    dispatch_once(&qword_1000CCC00, &stru_10009DFF8);
  }
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100019B60;
  v8[3] = &unk_10009E020;
  v8[4] = self;
  v8[5] = &v9;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v8));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v13 = v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  [v4 addOperations:v5 waitUntilFinished:1];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSString)currentStateName
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_100019D50;
  v13 = sub_100019D60;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100019D68;
  v8[3] = &unk_10009E020;
  v8[4] = self;
  v8[5] = &v9;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v8));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  uint64_t v15 = v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  [v4 addOperations:v5 waitUntilFinished:1];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

- (void)willStartInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100019E44;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didStartInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001A058;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didPauseInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001A26C;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didResumeInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001A480;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didCancelInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001A694;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFailInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001A8A8;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFinishInstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001AABC;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)willStartUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001ACD0;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didStartUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001AEE4;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didPauseUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001B0F8;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didResumeUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001B30C;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didCancelUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001B520;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFailUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001B734;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFinishUpdating
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001B948;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)willStartUninstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001BB5C;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFailUninstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001BD70;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)didFinishUninstalling
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001BF84;
  v5[3] = &unk_10009E048;
  v5[4] = self;
  v5[5] = a2;
  [v4 addOperationWithBlock:v5];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001C1B8;
  v7[3] = &unk_10009D820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001C290;
  v7[3] = &unk_10009D820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)didChangeInstallingProgress
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001C3B8;
  v4[3] = &unk_10009E070;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)didChangeUpdatingProgress
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001C544;
  v4[3] = &unk_10009E070;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)didResetState
{
  uint64_t v3 = DMFAppLog(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle bundleIdentifier](self, "bundleIdentifier"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle observers](self, "observers"));
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    id v13 = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Did reset state for lifecycle for bundle ID: %{public}@, observer count = %lu",  buf,  0x16u);
  }

  unint64_t v7 = -[DMDAppLifeCycle currentState](self, "currentState");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001C79C;
  v9[3] = &unk_10009E048;
  v9[4] = self;
  v9[5] = v7;
  [v8 addOperationWithBlock:v9];
}

- (void)cancelAndWaitUntilAllOperationsAreFinished
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppLifeCycle queue](self, "queue"));
  [v2 cancelAllOperations];
  [v2 waitUntilAllOperationsAreFinished];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CATStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (void).cxx_destruct
{
}

@end