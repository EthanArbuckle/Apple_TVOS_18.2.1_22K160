@interface UADispatchScheduler
+ (id)dispatchScheduler:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6;
- (BOOL)scheduleAt:(id)a3;
- (BOOL)scheduleNext:(double)a3;
- (NSString)name;
- (OS_dispatch_group)executingGroup;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)source;
- (double)frequency;
- (id)block;
- (id)init:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6;
- (id)nextRunTimeString;
- (unint64_t)nextTime;
- (unint64_t)runCount;
- (void)_doIt;
- (void)doIt;
- (void)reset;
- (void)resume;
- (void)setFrequency:(double)a3;
- (void)setName:(id)a3;
- (void)suspend;
- (void)updateFrequency:(double)a3;
- (void)waitUntilComplete;
@end

@implementation UADispatchScheduler

- (id)init:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  v11 = (dispatch_queue_s *)a5;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___UADispatchScheduler;
  v13 = -[UADispatchScheduler init](&v31, "init");
  v14 = v13;
  if (v13)
  {
    -[UADispatchScheduler setName:](v13, "setName:", v10);
    -[UADispatchScheduler setFrequency:](v14, "setFrequency:", a4);
    v14->_nextTime = -1LL;
    objc_storeStrong((id *)&v14->_queue, a5);
    dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v11);
    source = v14->_source;
    v14->_source = (OS_dispatch_source *)v15;

    dispatch_group_t v17 = dispatch_group_create();
    executingGroup = v14->_executingGroup;
    v14->_executingGroup = (OS_dispatch_group *)v17;

    id v19 = objc_retainBlock(v12);
    id block = v14->_block;
    v14->_id block = v19;

    os_log_t v21 = sub_100039584(0LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v14, "name"));
      v24 = sub_100075AC8(0xFFFFFFFFFFFFFFFFLL);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      -[UADispatchScheduler frequency](v14, "frequency");
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      __int16 v34 = 2114;
      v35 = v25;
      __int16 v36 = 2048;
      double v37 = v26 * 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, next=%{public}@ freq=%g",  buf,  0x20u);
    }

    dispatch_source_set_timer((dispatch_source_t)v14->_source, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v27 = (dispatch_source_s *)v14->_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100022840;
    handler[3] = &unk_1000BCCA8;
    v30 = v14;
    dispatch_source_set_event_handler(v27, handler);
  }

  return v14;
}

+ (id)dispatchScheduler:(id)a3 frequency:(double)a4 queue:(id)a5 block:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = -[UADispatchScheduler init:frequency:queue:block:]( objc_alloc(&OBJC_CLASS___UADispatchScheduler),  "init:frequency:queue:block:",  v9,  v10,  v11,  a4);

  return v12;
}

- (BOOL)scheduleNext:(double)a3
{
  os_log_t v5 = sub_100039584(0LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](self, "name"));
    *(_DWORD *)buf = 138543618;
    double v37 = v7;
    __int16 v38 = 2048;
    double v39 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@ scheduleNext, interval=%g",  buf,  0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  if (a3 > 315576000.0)
  {
    os_log_t v9 = sub_100039584(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "SCHEDULE: Setting next time to DISPATCH_TIME_FOREVER because interval > anything reasonable",  buf,  2u);
    }

    v8->_dispatch_time_t nextTime = -1LL;
    dispatch_source_set_timer((dispatch_source_t)v8->_source, 0xFFFFFFFFFFFFFFFFLL, 0LL, 0x1DCD6500uLL);
LABEL_7:
    objc_sync_exit(v8);

    return 1;
  }

  if (a3 > 0.0)
  {
    *(double *)&dispatch_time_t v11 = COERCE_DOUBLE(dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0)));
    os_log_t v12 = sub_100039584(0LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v8, "name"));
      dispatch_source_t v15 = sub_100075AC8(v8->_nextTime);
      double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v15));
      *(_DWORD *)buf = 138543874;
      double v37 = v14;
      __int16 v38 = 2048;
      double v39 = a3;
      __int16 v40 = 2114;
      double v41 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, scheduling down to %f seconds(_next=%{public}@)",  buf,  0x20u);
    }

    dispatch_time_t nextTime = v8->_nextTime;
    if (v11 < nextTime || nextTime == -1LL)
    {
      os_log_t v19 = sub_100039584(0LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v8, "name"));
        v22 = sub_100075AC8(v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = sub_100075AC8(v8->_nextTime);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        unint64_t v26 = v8->_nextTime;
        *(_DWORD *)buf = 138544386;
        double v37 = v21;
        __int16 v38 = 2114;
        double v39 = *(double *)&v23;
        __int16 v40 = 2048;
        double v41 = *(double *)&v11;
        __int16 v42 = 2114;
        v43 = v25;
        __int16 v44 = 2048;
        unint64_t v45 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, next=%{public}@/%lld(was %{public}@/%lld)",  buf,  0x34u);
      }

      dispatch_source_set_timer( (dispatch_source_t)v8->_source,  v11,  (unint64_t)(a3 * 1000000000.0),  0x1DCD6500uLL);
      v8->_dispatch_time_t nextTime = v11;
    }

    goto LABEL_7;
  }

  os_log_t v27 = sub_100039584(0LL);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v8, "name"));
    v30 = sub_100075AC8(v8->_nextTime);
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[UADispatchScheduler frequency](v8, "frequency");
    *(_DWORD *)buf = 138543874;
    double v37 = v29;
    __int16 v38 = 2114;
    double v39 = *(double *)&v31;
    __int16 v40 = 2048;
    double v41 = v32 * 1000000000.0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, next=NOW(was %{public}@) freq=%g",  buf,  0x20u);
  }

  objc_sync_exit(v8);
  v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler queue](v8, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022D94;
  block[3] = &unk_1000BCCA8;
  block[4] = v8;
  dispatch_async(v33, block);

  return 1;
}

- (BOOL)scheduleAt:(id)a3
{
  id v4 = a3;
  os_log_t v5 = v4;
  if (v4) {
    [v4 timeIntervalSinceNow];
  }
  else {
    double v6 = 0.0;
  }
  BOOL v7 = -[UADispatchScheduler scheduleNext:](self, "scheduleNext:", v6);

  return v7;
}

- (void)doIt
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022E64;
  block[3] = &unk_1000BCCA8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_doIt
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler executingGroup](self, "executingGroup"));
  dispatch_group_enter(v4);

  os_log_t v5 = sub_100039584(0LL);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](self, "name"));
    int v17 = 138543362;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, run.  ",  (uint8_t *)&v17,  0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  v8->_dispatch_time_t nextTime = -1LL;
  dispatch_source_set_timer((dispatch_source_t)v8->_source, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  objc_sync_exit(v8);

  ++v8->_runCount;
  os_log_t v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[UADispatchScheduler block](v8, "block"));
  v9[2]();

  os_log_t v10 = sub_100039584(0LL);
  dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v8, "name"));
    v13 = sub_100075AC8(v8->_nextTime);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138543618;
    v18 = v12;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, DONE run, next=%{public}@",  (uint8_t *)&v17,  0x16u);
  }

  dispatch_source_t v15 = v8;
  objc_sync_enter(v15);
  dispatch_source_set_timer((dispatch_source_t)v8->_source, v8->_nextTime, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  objc_sync_exit(v15);

  double v16 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler executingGroup](v15, "executingGroup"));
  dispatch_group_leave(v16);
}

- (void)updateFrequency:(double)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_frequency = a3;
  os_log_t v5 = sub_100039584(0LL);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v4, "name"));
    v8 = sub_100075AC8(v4->_nextTime);
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[UADispatchScheduler frequency](v4, "frequency");
    int v12 = 138543874;
    v13 = v7;
    __int16 v14 = 2114;
    dispatch_source_t v15 = v9;
    __int16 v16 = 2048;
    double v17 = v10 * 1000000000.0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, setFreq, next=%{public}@ freq=%g",  (uint8_t *)&v12,  0x20u);
  }

  dispatch_time_t v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler source](v4, "source"));
  dispatch_source_set_timer(v11, -[UADispatchScheduler nextTime](v4, "nextTime"), 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

  objc_sync_exit(v4);
}

- (void)reset
{
  v2 = self;
  objc_sync_enter(v2);
  os_log_t v3 = sub_100039584(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler name](v2, "name"));
    double v6 = sub_100075AC8(v2->_nextTime);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UADispatchScheduler frequency](v2, "frequency");
    int v10 = 138543874;
    dispatch_time_t v11 = v5;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2048;
    double v15 = v8 * 1000000000.0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "SCHEDULE:%{public}@, RESET, next=FOREVER(was %{public}@) freq=%g",  (uint8_t *)&v10,  0x20u);
  }

  v2->_dispatch_time_t nextTime = -1LL;
  os_log_t v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler source](v2, "source"));
  dispatch_source_set_timer(v9, v2->_nextTime, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);

  objc_sync_exit(v2);
}

- (void)resume
{
  v2 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler source](self, "source"));
  dispatch_resume(v2);
}

- (void)suspend
{
  os_log_t v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler executingGroup](self, "executingGroup"));
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  id v4 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler source](self, "source"));
  dispatch_suspend(v4);
}

- (void)waitUntilComplete
{
  group = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[UADispatchScheduler executingGroup](self, "executingGroup"));
  if (group)
  {
    os_log_t v3 = self;
    objc_sync_enter(v3);
    executingGroup = v3->_executingGroup;
    v3->_executingGroup = 0LL;

    objc_sync_exit(v3);
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)nextRunTimeString
{
  return sub_100075AC8(-[UADispatchScheduler nextTime](self, "nextTime"));
}

- (unint64_t)runCount
{
  return self->_runCount;
}

- (unint64_t)nextTime
{
  return self->_nextTime;
}

- (OS_dispatch_source)source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (OS_dispatch_group)executingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setName:(id)a3
{
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

@end