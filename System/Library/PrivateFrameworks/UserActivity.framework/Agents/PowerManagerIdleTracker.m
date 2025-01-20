@interface PowerManagerIdleTracker
+ (id)idleTracker:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6;
+ (unint64_t)setup:(id)a3 interval:(double)a4;
- (BOOL)active;
- (BOOL)enabled;
- (BOOL)firstTime;
- (BOOL)isMirroringActive;
- (NSDate)startTime;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (double)interval;
- (id)block;
- (id)init:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6;
- (unint64_t)userActivityNotificationRef;
- (void)dealloc;
- (void)invalidate;
- (void)setActive:(BOOL)a3;
- (void)setBlock:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFirstTime:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setQueue:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setUserActivityNotificationRef:(unint64_t)a3;
@end

@implementation PowerManagerIdleTracker

+ (id)idleTracker:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[PowerManagerIdleTracker init:queue:interval:block:]( objc_alloc(&OBJC_CLASS___PowerManagerIdleTracker),  "init:queue:interval:block:",  v11,  v10,  v9,  a5);

  return v12;
}

- (id)init:(id)a3 queue:(id)a4 interval:(double)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  os_log_t v14 = sub_100039584(0LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v11;
    __int16 v27 = 2050;
    double v28 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "IdleTracker:alloc(%{public}@) interval=%{public}g",  buf,  0x16u);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PowerManagerIdleTracker;
  v16 = -[PowerManagerIdleTracker init](&v24, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_queue, a4);
    *(_WORD *)&v17->_active = 257;
    v17->_firstTime = 1;
    v17->_interval = a5;
    id v18 = [v13 copy];
    id block = v17->_block;
    v17->_id block = v18;

    objc_initWeak((id *)buf, v17);
    v20 = (void *)objc_opt_class(v17);
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    -[PowerManagerIdleTracker setUserActivityNotificationRef:]( v17,  "setUserActivityNotificationRef:",  [v20 setup:WeakRetained interval:a5]);

    if (!-[PowerManagerIdleTracker userActivityNotificationRef](v17, "userActivityNotificationRef"))
    {
      v22 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PowerManagerIdleTracker block](v17, "block"));
      ((void (**)(void, BOOL))v22)[2](v22, -[PowerManagerIdleTracker active](v17, "active"));
    }

    objc_destroyWeak((id *)buf);
  }

  return v17;
}

- (void)dealloc
{
  os_log_t v3 = sub_100039584(0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerManagerIdleTracker name](self, "name"));
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "IdleTracker:dealloc(%{public}@", buf, 0xCu);
  }

  -[PowerManagerIdleTracker invalidate](self, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PowerManagerIdleTracker;
  -[PowerManagerIdleTracker dealloc](&v6, "dealloc");
}

+ (unint64_t)setup:(id)a3 interval:(double)a4
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 queue]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100005108;
  v10[3] = &unk_1000BCC80;
  id v11 = v5;
  id v7 = v5;
  unint64_t v8 = IOPMScheduleUserActivityLevelNotificationWithTimeout(v6, a4, v10);

  return v8;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (-[PowerManagerIdleTracker userActivityNotificationRef](obj, "userActivityNotificationRef"))
  {
    IOPMUnregisterNotification(-[PowerManagerIdleTracker userActivityNotificationRef](obj, "userActivityNotificationRef"));
    -[PowerManagerIdleTracker setUserActivityNotificationRef:](obj, "setUserActivityNotificationRef:", 0LL);
  }

  objc_sync_exit(obj);
}

- (BOOL)active
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_active != v3)
  {
    obj->_BOOL active = v3;
    if (v3)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      startTime = obj->_startTime;
      obj->_startTime = (NSDate *)v5;

      v4 = obj;
    }
  }

  if (!-[PowerManagerIdleTracker userActivityNotificationRef](v4, "userActivityNotificationRef")
    && -[PowerManagerIdleTracker enabled](obj, "enabled"))
  {
    id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PowerManagerIdleTracker block](obj, "block"));
    ((void (**)(void, BOOL))v7)[2](v7, -[PowerManagerIdleTracker active](obj, "active"));
  }

  objc_sync_exit(obj);
}

- (BOOL)enabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL enabled = v2->_enabled;
  objc_sync_exit(v2);

  return enabled;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_enabled != v3)
  {
    obj->_BOOL enabled = v3;
    -[PowerManagerIdleTracker userActivityNotificationRef](obj, "userActivityNotificationRef");
    v4 = obj;
    if (v3)
    {
      uint64_t v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PowerManagerIdleTracker block](obj, "block"));
      ((void (**)(void, BOOL))v5)[2](v5, -[PowerManagerIdleTracker active](obj, "active"));

      v4 = obj;
    }
  }

  objc_sync_exit(v4);
}

- (double)interval
{
  v2 = self;
  objc_sync_enter(v2);
  double interval = v2->_interval;
  objc_sync_exit(v2);

  return interval;
}

- (void)setInterval:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_double interval = a3;
  unint64_t v4 = -[PowerManagerIdleTracker userActivityNotificationRef](obj, "userActivityNotificationRef");
  -[PowerManagerIdleTracker interval](obj, "interval");
  IOPMSetUserActivityIdleTimeout(v4, v5);
  objc_sync_exit(obj);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)isMirroringActive
{
  return self->_isMirroringActive;
}

- (id)block
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)userActivityNotificationRef
{
  return self->_userActivityNotificationRef;
}

- (void)setUserActivityNotificationRef:(unint64_t)a3
{
  self->_userActivityNotificationRef = a3;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setStartTime:(id)a3
{
}

- (BOOL)firstTime
{
  return self->_firstTime;
}

- (void)setFirstTime:(BOOL)a3
{
  self->_firstTime = a3;
}

- (void).cxx_destruct
{
}

@end