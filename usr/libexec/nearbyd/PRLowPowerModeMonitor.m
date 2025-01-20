@interface PRLowPowerModeMonitor
- (BOOL)lowPowerModeEnabled;
- (BOOL)startMonitoring;
- (PRLowPowerModeMonitor)initWithQueue:(id)a3 stateChangeHandler:(id)a4;
- (void)_initLowPowerModeListner;
- (void)_lowPowerModeChanged:(id)a3;
- (void)dealloc;
- (void)stopMonitoring;
@end

@implementation PRLowPowerModeMonitor

- (PRLowPowerModeMonitor)initWithQueue:(id)a3 stateChangeHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"PRLowPowerModeMonitor.mm", 22, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PRLowPowerModeMonitor;
  v10 = -[PRLowPowerModeMonitor init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    v11->_monitoring = 0;
    id v12 = objc_retainBlock(v9);
    id modeChangeHandler = v11->_modeChangeHandler;
    v11->_id modeChangeHandler = v12;

    v11->_lowPowerModeEnabled = 0;
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PRLowPowerModeMonitor;
  -[PRLowPowerModeMonitor dealloc](&v3, "dealloc");
}

- (void)_initLowPowerModeListner
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_lowPowerModeChanged:" name:NSProcessInfoPowerStateDidChangeNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  self->_lowPowerModeEnabled = [v4 isLowPowerModeEnabled];

  id modeChangeHandler = (void (**)(id, BOOL))self->_modeChangeHandler;
  if (modeChangeHandler) {
    modeChangeHandler[2](modeChangeHandler, self->_lowPowerModeEnabled);
  }
  v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lowPowerModeEnabled) {
      v7 = "enabled";
    }
    else {
      v7 = "disabled";
    }
    int v8 = 136315138;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#lpm-mon, Monitor initialized. LPM is %s",  (uint8_t *)&v8,  0xCu);
  }

- (void)_lowPowerModeChanged:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018D048;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)startMonitoring
{
  if (!self->_monitoring)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018D1E0;
    block[3] = &unk_1007A3000;
    block[4] = self;
    dispatch_async(queue, block);
    self->_monitoring = 1;
  }

  return 1;
}

- (void)stopMonitoring
{
  if (self->_monitoring)
  {
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10018D2F4;
    v4[3] = &unk_1007A1CA0;
    objc_copyWeak(&v5, &location);
    dispatch_async(queue, v4);
    self->_monitoring = 0;
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void).cxx_destruct
{
}

@end