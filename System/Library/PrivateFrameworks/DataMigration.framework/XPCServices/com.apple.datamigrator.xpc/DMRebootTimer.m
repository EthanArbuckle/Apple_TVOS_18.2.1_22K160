@interface DMRebootTimer
+ (BOOL)_shouldRebootOnCurrentPlatform;
+ (id)createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5;
+ (unint64_t)_maximumRebootCount;
+ (void)_setDidReboot:(BOOL)a3;
- (BOOL)canceled;
- (DMEnvironment)environment;
- (NSString)pluginName;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)timer;
- (id)_createHelperConnection;
- (id)_initWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5;
- (void)_timerFired;
- (void)cancel;
- (void)resume;
- (void)setCanceled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setPluginName:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation DMRebootTimer

+ (id)createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 > 0.0
    && +[DMRebootTimer _shouldRebootOnCurrentPlatform](&OBJC_CLASS___DMRebootTimer, "_shouldRebootOnCurrentPlatform")
    && [v9 shouldWatchdogPluginsAfterTimeout]
    && (id v10 = [v9 migrationRebootCount], v10 < objc_msgSend(a1, "_maximumRebootCount")))
  {
    id v11 = -[DMRebootTimer _initWithTimeIntervalBeforeReboot:pluginName:environment:]( objc_alloc(&OBJC_CLASS___DMRebootTimer),  "_initWithTimeIntervalBeforeReboot:pluginName:environment:",  v8,  v9,  a3);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (BOOL)_shouldRebootOnCurrentPlatform
{
  return 0;
}

+ (unint64_t)_maximumRebootCount
{
  return 3LL;
}

- (id)_initWithTimeIntervalBeforeReboot:(double)a3 pluginName:(id)a4 environment:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___DMRebootTimer;
  id v10 = -[DMRebootTimer init](&v28, "init");
  id v11 = v10;
  if (v10)
  {
    -[DMRebootTimer setCanceled:](v10, "setCanceled:", 0LL);
    -[DMRebootTimer setPluginName:](v11, "setPluginName:", v8);
    -[DMRebootTimer setEnvironment:](v11, "setEnvironment:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer pluginName](v11, "pluginName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.datamigrator.rebootTimer.%@",  v12));

    id v14 = v13;
    v15 = (const char *)[v14 UTF8String];
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create(v15, v17);
    -[DMRebootTimer setSerialQueue:](v11, "setSerialQueue:", v18);

    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer serialQueue](v11, "serialQueue"));
    dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v19);
    -[DMRebootTimer setTimer:](v11, "setTimer:", v20);

    v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer timer](v11, "timer"));
    dispatch_time_t v22 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0LL);

    objc_initWeak(&location, v11);
    v23 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer timer](v11, "timer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000055F4;
    handler[3] = &unk_100020788;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v23, handler);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)_timerFired
{
  uint64_t v4 = objc_opt_class(self, a2);
  id obj = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(obj);
  if (byte_10002CB80)
  {
    objc_sync_exit(obj);
  }

  else
  {
    byte_10002CB80 = 1;
    objc_sync_exit(obj);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer environment](self, "environment"));
    v6 = (char *)[v5 migrationRebootCount];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer environment](self, "environment"));
    [v7 setMigrationRebootCount:v6 + 1];

    id obj = (id)objc_claimAutoreleasedReturnValue(-[DMRebootTimer _createHelperConnection](self, "_createHelperConnection"));
    [obj resume];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[DMRebootTimer pluginName](self, "pluginName"));
    id v9 = (void *)v8;
    if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
      _DMLogFunc(v2, 3LL);

      objc_msgSend(obj, "reboot", v9, v13);
    }

    else
    {
      uint64_t v12 = v8;
      _DMLogFunc(v2, 3LL);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer pluginName](self, "pluginName", v12));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"datamigrator plugin %@ hang",  v10));

      [obj panicWithMessage:v11];
    }

    [obj invalidate];
  }
}

- (id)_createHelperConnection
{
  return objc_alloc_init(&OBJC_CLASS___DMHelperConnection);
}

+ (void)_setDidReboot:(BOOL)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  byte_10002CB80 = a3;
  objc_sync_exit(obj);
}

- (void)resume
{
  uint64_t v2 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer timer](self, "timer"));
  dispatch_resume(v2);
}

- (void)cancel
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DMRebootTimer serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000058C4;
  block[3] = &unk_100020720;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
}

- (DMEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end