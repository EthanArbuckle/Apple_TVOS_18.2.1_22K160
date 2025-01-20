@interface EventMonitor
+ (id)sharedEventMonitor;
- (EventMonitor)init;
- (id)monitorEvent:(id)a3;
- (void)_cancelPollTimer;
- (void)_fireEventsAfterPollTimer;
- (void)_reloadPollTimer;
- (void)_willRemoveEvent:(id)a3;
- (void)dealloc;
- (void)removeEvent:(id)a3;
@end

@implementation EventMonitor

- (EventMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___EventMonitor;
  v2 = -[EventMonitor init](&v4, "init");
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.EventMonitor", 0LL);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___EventMonitor;
  -[EventMonitor dealloc](&v3, "dealloc");
}

+ (id)sharedEventMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3CEC;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3410 != -1) {
    dispatch_once(&qword_1003A3410, block);
  }
  return (id)qword_1003A3408;
}

- (id)monitorEvent:(id)a3
{
  id v4 = [a3 copy];
  [v4 _setLastOccurrenceCheckTime:CFAbsoluteTimeGetCurrent()];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F3D8C;
  v7[3] = &unk_10034AE70;
  v7[4] = self;
  v7[5] = v4;
  dispatch_sync(dispatchQueue, v7);
  return v4;
}

- (void)removeEvent:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F3E58;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)_cancelPollTimer
{
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    dispatch_source_cancel((dispatch_source_t)pollTimer);
    dispatch_release((dispatch_object_t)self->_pollTimer);
    self->_pollTimer = 0LL;
  }

- (void)_fireEventsAfterPollTimer
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"EventMonitor");
  uint64_t v5 = (uint64_t)-[NSMutableArray count](self->_events, "count");
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      id v7 = -[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", v6 - 2);
      [v7 _lastOccurrenceCheckTime];
      if (vabdd_f64(Current, v8 + (double)(uint64_t)[v7 pollInterval]) < 0.5)
      {
        if ([v7 hasOccurred])
        {
          -[NSMutableArray addObject:](v3, "addObject:", v7);
          -[EventMonitor _willRemoveEvent:](self, "_willRemoveEvent:", v7);
          -[NSMutableArray removeObjectAtIndex:](self->_events, "removeObjectAtIndex:", v6 - 2);
        }

        else
        {
          [v7 _setLastOccurrenceCheckTime:Current];
        }
      }

      --v6;
    }

    while (v6 > 1);
  }

  if (-[NSMutableArray count](v3, "count"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4078;
    block[3] = &unk_10034AE98;
    block[4] = v3;
    dispatch_async(global_queue, block);
  }

  else
  {
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "releaseKeepAliveAssertion:", @"EventMonitor");
  }

  -[EventMonitor _cancelPollTimer](self, "_cancelPollTimer");
  -[EventMonitor _reloadPollTimer](self, "_reloadPollTimer");
}

- (void)_reloadPollTimer
{
  if (-[NSMutableArray count](self->_events, "count"))
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    events = self->_events;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( events,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v35;
      double v7 = 1.79769313e308;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v35 != v6) {
            objc_enumerationMutation(events);
          }
          v9 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( events,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
      }

      while (v5);
    }

    else
    {
      double v7 = 1.79769313e308;
    }

    double v10 = fmax(v7, 10.0);
    if (self->_pollTimer)
    {
      double v11 = v10 + self->_lastPollTime;
      double Current = CFAbsoluteTimeGetCurrent();
      id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      double v14 = v11 - Current;
      unsigned int v15 = [v13 shouldLog];
      else {
        LODWORD(v16) = v15;
      }
      v17 = (os_log_s *)[v13 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        uint64_t v16 = v16;
      }
      else {
        v16 &= 2u;
      }
      if ((_DWORD)v16)
      {
        uint64_t v18 = objc_opt_class(self);
        int v38 = 138412546;
        uint64_t v39 = v18;
        __int16 v40 = 2048;
        double v41 = v14;
        uint64_t v19 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  2LL,  "%@: Scheduling poll in %.2f seconds",  &v38,  22);
        if (v19)
        {
          v20 = (void *)v19;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
          free(v20);
          SSFileLog(v13, @"%@");
        }
      }

      pollTimer = self->_pollTimer;
      dispatch_time_t v22 = dispatch_time(0LL, (uint64_t)(v14 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)pollTimer, v22, (unint64_t)(v10 * 1000000000.0), 0LL);
    }

    else
    {
      id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v24 = [v23 shouldLog];
      else {
        LODWORD(v25) = v24;
      }
      v26 = (os_log_s *)[v23 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        uint64_t v25 = v25;
      }
      else {
        v25 &= 2u;
      }
      if ((_DWORD)v25)
      {
        uint64_t v27 = objc_opt_class(self);
        int v38 = 138412546;
        uint64_t v39 = v27;
        __int16 v40 = 2048;
        double v41 = v10;
        uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  2LL,  "%@: Scheduling poll in %.2f seconds",  &v38,  22);
        if (v28)
        {
          v29 = (void *)v28;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
          free(v29);
          SSFileLog(v23, @"%@");
        }
      }

      self->_lastPollTime = CFAbsoluteTimeGetCurrent();
      v30 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      self->_pollTimer = v30;
      dispatch_time_t v31 = dispatch_time(0LL, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)v30, v31, (unint64_t)(v10 * 1000000000.0), 0LL);
      v32 = self->_pollTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000F4544;
      handler[3] = &unk_10034AE98;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v32, handler);
      dispatch_resume((dispatch_object_t)self->_pollTimer);
    }
  }

  else
  {
    -[EventMonitor _cancelPollTimer](self, "_cancelPollTimer");
  }

- (void)_willRemoveEvent:(id)a3
{
}

@end