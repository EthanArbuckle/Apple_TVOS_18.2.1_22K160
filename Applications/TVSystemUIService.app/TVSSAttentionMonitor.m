@interface TVSSAttentionMonitor
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BOOL)isRunning;
- (BOOL)timerDisabledByPref;
- (NSHashTable)timerDisabledAssertions;
- (TVSSAttentionMonitor)initWithMenuModeController:(id)a3;
- (TVSSAttentionMonitorDelegate)delegate;
- (TVSSMenuModeController)menuModeController;
- (id)acquireTimeoutDisabledAssertionWithReason:(id)a3;
- (void)_deregisterAssertionWithToken:(id)a3;
- (void)_handleAttentionEvent:(id)a3;
- (void)_registerAssertion:(id)a3;
- (void)_updateAttentionMonitoringState;
- (void)_updateTimeout;
- (void)dealloc;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation TVSSAttentionMonitor

- (TVSSAttentionMonitor)initWithMenuModeController:(id)a3
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v27;
  id v27 = 0LL;
  v25.receiver = v3;
  v25.super_class = (Class)&OBJC_CLASS___TVSSAttentionMonitor;
  obj = -[TVSSAttentionMonitor init](&v25, "init");
  id v27 = obj;
  objc_storeStrong(&v27, obj);
  if (obj)
  {
    v4 = +[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable");
    v5 = (void *)*((void *)v27 + 5);
    *((void *)v27 + 5) = v4;

    objc_storeStrong((id *)v27 + 4, location[0]);
    [*((id *)v27 + 4) addControllerObserver:v27];
    objc_initWeak(&from, v27);
    v15 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessClient);
    v6 = (void *)*((void *)v27 + 3);
    *((void *)v27 + 3) = v15;

    id v23 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
    [v23 setIdentifier:@"com.apple.TVSystemUIService.InteractiveModeIdleTimer"];
    [v23 setEventMask:3967];
    [v23 setAttentionLostTimeout:*(double *)&qword_1002202B0];
    [*((id *)v27 + 3) setConfiguration:v23];
    v14 = (void *)*((void *)v27 + 3);
    v13 = &_dispatch_main_q;
    v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    v20 = sub_1000C7F58;
    v21 = &unk_1001BA030;
    objc_copyWeak(&v22, &from);
    [v14 setEventHandlerWithQueue:v13 block:&v17];

    v12 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    v28 = @"ControlCenterTimeoutInSeconds";
    v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&qword_1002202B0);
    v29 = v11;
    v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
    -[NSUserDefaults registerDefaults:](v12, "registerDefaults:");

    v9 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v9,  "addObserver:forKeyPath:options:context:",  v27,  @"ControlCenterTimeoutInSeconds",  0LL,  off_1002202B8);

    [v27 _updateTimeout];
    [v27 _updateAttentionMonitoringState];
    objc_destroyWeak(&v22);
    objc_storeStrong(&v23, 0LL);
    objc_destroyWeak(&from);
  }

  v8 = (TVSSAttentionMonitor *)v27;
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v27, 0LL);
  return v8;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults removeObserver:forKeyPath:context:]( v2,  "removeObserver:forKeyPath:context:",  v5,  @"ControlCenterTimeoutInSeconds",  off_1002202B8);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSAttentionMonitor;
  -[TVSSAttentionMonitor dealloc](&v3, "dealloc");
}

- (id)acquireTimeoutDisabledAssertionWithReason:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v3 = objc_alloc(&OBJC_CLASS____TVSSAttentionTimeoutDisabledAssertion);
  v5 = -[_TVSSAttentionTimeoutDisabledAssertion initWithAttentionMonitor:reason:]( v3,  "initWithAttentionMonitor:reason:",  v7,  location[0]);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSAttentionMonitor _updateAttentionMonitoringState](v7, "_updateAttentionMonitoringState");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v23 = 0LL;
  objc_storeStrong(&v23, a4);
  id v22 = 0LL;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  if (a6 == off_1002202B8)
  {
    id v20 = AttentionMonitorLog();
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v20;
      os_log_type_t type = v19;
      sub_100010524(v18);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Timeout pref updated", v18, 2u);
    }

    objc_storeStrong(&v20, 0LL);
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_1000C83BC;
    v16 = &unk_1001B5A60;
    v17 = v25;
    BSDispatchMain(&v12);
    objc_storeStrong((id *)&v17, 0LL);
  }

  else
  {
    v11.receiver = v25;
    v11.super_class = (Class)&OBJC_CLASS___TVSSAttentionMonitor;
    -[TVSSAttentionMonitor observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v23,  v22,  v21);
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_registerAssertion:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = AttentionMonitorLog();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13;
    os_log_type_t type = v12;
    id v9 = [location[0] reason];
    id v5 = v9;
    id v11 = v5;
    id v8 = [location[0] token];
    id v10 = v8;
    sub_10000D540((uint64_t)v16, (uint64_t)v5, (uint64_t)v10);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Adding timeout disabled assertion with reason: %@ token: %@",  v16,  0x16u);

    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(&v13, 0LL);
  timerDisabledAssertions = v15->_timerDisabledAssertions;
  id v4 = [location[0] token];
  -[NSHashTable addObject:](timerDisabledAssertions, "addObject:");

  -[TVSSAttentionMonitor _updateAttentionMonitoringState](v15, "_updateAttentionMonitoringState");
  objc_storeStrong(location, 0LL);
}

- (void)_deregisterAssertionWithToken:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)AttentionMonitorLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D28C((uint64_t)v6, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Removing timeout disabled assertion with token: %@",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[NSHashTable removeObject:](v5->_timerDisabledAssertions, "removeObject:", location[0]);
  -[TVSSAttentionMonitor _updateAttentionMonitoringState](v5, "_updateAttentionMonitoringState");
  objc_storeStrong(location, 0LL);
}

- (void)_updateTimeout
{
  os_log_type_t v12 = self;
  SEL v11 = a2;
  id v5 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults doubleForKey:](v5, "doubleForKey:", @"ControlCenterTimeoutInSeconds");
  double v6 = v2;

  double v10 = v6;
  if (v6 > 0.0) {
    uint64_t v4 = *(void *)&v10;
  }
  else {
    uint64_t v4 = qword_1002202B0;
  }
  double v9 = *(double *)&v4;
  double v3 = v10;
  v12->_timerDisabledByPref = v10 <= 0.0;
  id location = -[AWAttentionAwarenessClient configuration](v12->_attentionAwarenessClient, "configuration", v3);
  [location setAttentionLostTimeout:v9];
  -[AWAttentionAwarenessClient setConfiguration:](v12->_attentionAwarenessClient, "setConfiguration:", location);
  os_log_t oslog = (os_log_t)AttentionMonitorLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100074010((uint64_t)v13, *(uint64_t *)&v10, v12->_timerDisabledByPref);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Update timeout: %f disabled: %d", v13, 0x12u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)_updateAttentionMonitoringState
{
  v29 = self;
  SEL v28 = a2;
  unint64_t v27 = -[TVSSMenuModeController mode](self->_menuModeController, "mode");
  BOOL v10 = 0;
  if (v27 == 3)
  {
    BOOL v10 = 0;
    if (!v29->_timerDisabledByPref) {
      BOOL v10 = -[NSHashTable count](v29->_timerDisabledAssertions, "count") == 0;
    }
  }

  BOOL v26 = v10;
  if (!v29->_running || v26)
  {
    if (!v29->_running && v26)
    {
      id v17 = AttentionMonitorLog();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = (os_log_s *)v17;
        os_log_type_t v6 = v16;
        sub_100010524(v15);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Starting attention monitoring", v15, 2u);
      }

      objc_storeStrong(&v17, 0LL);
      id v14 = 0LL;
      attentionAwarenessClient = v29->_attentionAwarenessClient;
      id obj = 0LL;
      unsigned __int8 v4 = -[AWAttentionAwarenessClient resumeWithError:]( attentionAwarenessClient,  "resumeWithError:",  &obj);
      objc_storeStrong(&v14, obj);
      char v13 = v4 & 1;
      if ((v4 & 1) != 0)
      {
        v29->_running = 1;
      }

      else
      {
        os_log_t oslog = (os_log_t)AttentionMonitorLog();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10001AEB8((uint64_t)v30, (uint64_t)v14);
          _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Failed to start AttentionAwarenessClient %{public}@",  v30,  0xCu);
        }

        objc_storeStrong((id *)&oslog, 0LL);
      }

      objc_storeStrong(&v14, 0LL);
    }
  }

  else
  {
    id location = AttentionMonitorLog();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v24;
      sub_100010524(v23);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Stopping attention monitoring", v23, 2u);
    }

    objc_storeStrong(&location, 0LL);
    id v22 = 0LL;
    double v2 = v29->_attentionAwarenessClient;
    id v20 = 0LL;
    unsigned __int8 v7 = -[AWAttentionAwarenessClient suspendWithError:](v2, "suspendWithError:", &v20);
    objc_storeStrong(&v22, v20);
    char v21 = v7 & 1;
    if ((v7 & 1) != 0)
    {
      v29->_running = 0;
    }

    else
    {
      id v19 = AttentionMonitorLog();
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        sub_10001AEB8((uint64_t)v31, (uint64_t)v22);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  v18,  "Failed to stop AttentionAwarenessClient %{public}@",  v31,  0xCu);
      }

      objc_storeStrong(&v19, 0LL);
    }

    objc_storeStrong(&v22, 0LL);
  }

- (void)_handleAttentionEvent:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] eventMask] == (id)1)
  {
    double v3 = -[TVSSAttentionMonitor delegate](v5, "delegate");
    -[TVSSAttentionMonitorDelegate attentionMonitorDidRequestDismissal:](v3, "attentionMonitorDidRequestDismissal:", v5);
  }

  objc_storeStrong(location, 0LL);
}

- (TVSSAttentionMonitorDelegate)delegate
{
  return (TVSSAttentionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (BOOL)timerDisabledByPref
{
  return self->_timerDisabledByPref;
}

- (NSHashTable)timerDisabledAssertions
{
  return self->_timerDisabledAssertions;
}

- (void).cxx_destruct
{
}

@end