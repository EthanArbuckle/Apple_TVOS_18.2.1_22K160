@interface MediaStreamMonitor
- (MSIOSAlbumSharingDaemon)albumSharingDaemon;
- (MediaStreamMonitor)init;
- (id)_dormantTimerWithSelector:(SEL)a3;
- (id)_scheduleNextBTAJobNextActivityDate:(id)a3 jobName:(const char *)a4 serviceName:(id)a5 createJobBlock:(id)a6;
- (void)MSAlbumSharingDaemonDidIdle:(id)a3;
- (void)MSAlbumSharingDaemonDidUnidle:(id)a3;
- (void)MSAlbumSharingDaemonDidUnidleMomentarily:(id)a3;
- (void)_didIdle;
- (void)_didUnidle;
- (void)_resetIdleTimer;
- (void)_startIdleTimerWithInterval:(double)a3;
- (void)_stopIdleTimer;
- (void)albumSharingDaemonPokeTimerDidFire:(id)a3;
- (void)dealloc;
- (void)mstreamdIdleTimerDidFire:(id)a3;
- (void)setAlbumSharingDaemon:(id)a3;
@end

@implementation MediaStreamMonitor

- (id)_dormantTimerWithSelector:(SEL)a3
{
  v5 = objc_alloc(&OBJC_CLASS___NSTimer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  v7 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v5,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v6,  self,  a3,  0LL,  1LL,  1000000000.0);

  return v7;
}

- (MediaStreamMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MediaStreamMonitor;
  v2 = -[MediaStreamMonitor init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( -[MediaStreamMonitor _dormantTimerWithSelector:]( v2,  "_dormantTimerWithSelector:",  "mstreamdIdleTimerDidFire:"));
    idleTimer = v3->_idleTimer;
    v3->_idleTimer = (NSTimer *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v6 addTimer:v3->_idleTimer forMode:NSDefaultRunLoopMode];

    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[MediaStreamMonitor _dormantTimerWithSelector:]( v3,  "_dormantTimerWithSelector:",  "albumSharingDaemonPokeTimerDidFire:"));
    albumSharingDaemonPokeTimer = v3->_albumSharingDaemonPokeTimer;
    v3->_albumSharingDaemonPokeTimer = (NSTimer *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v9 addTimer:v3->_albumSharingDaemonPokeTimer forMode:NSDefaultRunLoopMode];
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MediaStreamMonitor;
  -[MediaStreamMonitor dealloc](&v3, "dealloc");
}

- (void)_startIdleTimerWithInterval:(double)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    double v8 = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Starting idle check timer with an interval of %.1f seconds.",  (uint8_t *)&v7,  0xCu);
  }

  idleTimer = self->_idleTimer;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
  -[NSTimer setFireDate:](idleTimer, "setFireDate:", v6);
}

- (void)_stopIdleTimer
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Stopping idle timer",  v5,  2u);
  }

  idleTimer = self->_idleTimer;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  -[NSTimer setFireDate:](idleTimer, "setFireDate:", v4);
}

- (void)_didIdle
{
  int v2 = self->_busyCount - 1;
  self->_busyCount = v2;
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Daemon idled.",  buf,  2u);
    }

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"));

    if (v4 == v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPauseManager sharedManager](&OBJC_CLASS___MSPauseManager, "sharedManager"));
      unsigned int v7 = [v6 isPaused];

      if (v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v10 = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Not starting exit timer because daemon is paused.",  v10,  2u);
        }
      }

      else
      {
        -[MediaStreamMonitor _startIdleTimerWithInterval:](self, "_startIdleTimerWithInterval:", 40.0);
      }

      idleStateNotificationTimer = self->_idleStateNotificationTimer;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
      -[NSTimer setFireDate:](idleStateNotificationTimer, "setFireDate:", v9);
    }

    else
    {
      -[MediaStreamMonitor performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_didIdle",  0LL,  1LL);
    }
  }

- (void)_resetIdleTimer
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSTimer fireDate](self->_idleTimer, "fireDate"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 < 40.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Extending exit timer period.",  v7,  2u);
    }

    -[MediaStreamMonitor _startIdleTimerWithInterval:](self, "_startIdleTimerWithInterval:", 40.0);
  }

- (void)_didUnidle
{
  int busyCount = self->_busyCount;
  self->_int busyCount = busyCount + 1;
  if (!busyCount)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v6 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Daemon unidled.",  v6,  2u);
    }

    -[MediaStreamMonitor _stopIdleTimer](self, "_stopIdleTimer");
    idleStateNotificationTimer = self->_idleStateNotificationTimer;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
    -[NSTimer setFireDate:](idleStateNotificationTimer, "setFireDate:", v5);
  }

- (void)MSAlbumSharingDaemonDidIdle:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 nextActivityDate]);
  if (v9)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    unsigned __int8 v5 = [v9 isEqualToDate:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = v9;
      [v6 timeIntervalSinceNow];
      if (v7 < 300.0)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));

        id v6 = (id)v8;
      }

      -[NSTimer setFireDate:](self->_albumSharingDaemonPokeTimer, "setFireDate:", v6);
    }
  }

  -[MediaStreamMonitor _didIdle](self, "_didIdle");
}

- (void)MSAlbumSharingDaemonDidUnidle:(id)a3
{
  albumSharingDaemonPokeTimer = self->_albumSharingDaemonPokeTimer;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture", a3));
  -[NSTimer setFireDate:](albumSharingDaemonPokeTimer, "setFireDate:", v5);

  -[MediaStreamMonitor _didUnidle](self, "_didUnidle");
}

- (void)MSAlbumSharingDaemonDidUnidleMomentarily:(id)a3
{
}

- (void)albumSharingDaemonPokeTimerDidFire:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  [v4 setFireDate:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
  [WeakRetained retryOutstandingActivities];
}

- (id)_scheduleNextBTAJobNextActivityDate:(id)a3 jobName:(const char *)a4 serviceName:(id)a5 createJobBlock:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = (uint64_t (**)(id, id))a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v24 = 138543362;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Checking on job state for %{public}@",  (uint8_t *)&v24,  0xCu);
  }

  v12 = (void *)BackgroundTaskAgentCopyJob(a4);
  v13 = v12;
  if (!v9)
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v21)
      {
        int v24 = 138543362;
        id v25 = v10;
        v22 = "No more scheduled jobs for %{public}@. Unscheduling.";
LABEL_18:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  v22,  (uint8_t *)&v24,  0xCu);
      }
    }

    else if (v21)
    {
      int v24 = 138543362;
      id v25 = v10;
      v22 = "No jobs scheduled for %{public}@.";
      goto LABEL_18;
    }

    BackgroundTaskAgentRemoveJob(a4);
    id v16 = 0LL;
    goto LABEL_20;
  }

  if (v12)
  {
    v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  xpc_dictionary_get_double(v12, kBackgroundTaskAgentJobWindowStartTime));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v15 && [v15 compare:v9] != (id)-1) {
      goto LABEL_20;
    }
    BackgroundTaskAgentRemoveJob(a4);
  }

  id v16 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if ([v16 compare:v17] == (id)-1)
  {
    id v18 = v17;

    id v16 = v18;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v24 = 138543362;
    id v25 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Scheduling Photo Stream job for %{public}@",  (uint8_t *)&v24,  0xCu);
  }

  uint64_t v19 = v11[2](v11, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  BackgroundTaskAgentAddJob(a4, v20);

LABEL_20:
  return v16;
}

- (void)mstreamdIdleTimerDidFire:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"));

  if (v5 == v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Idle timer fired.",  (uint8_t *)&v24,  2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained nextActivityDate]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MediaStreamMonitor _scheduleNextBTAJobNextActivityDate:jobName:serviceName:createJobBlock:]( self,  "_scheduleNextBTAJobNextActivityDate:jobName:serviceName:createJobBlock:",  v8,  "com.apple.mediastream.mstreamd.as.wakeup",  @"Shared Stream",  &stru_1000188B0));
    BackgroundTaskAgentRemoveJob("com.apple.mediastream.mstreamd.pluggedin");
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Monitoring for external power.",  (uint8_t *)&v24,  2u);
      }

      xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
      v12 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v13 timeIntervalSinceReferenceDate];
      xpc_dictionary_set_double(v11, v12, v14 + 10.0);

      v15 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v16 timeIntervalSinceReferenceDate];
      xpc_dictionary_set_double(v11, v15, v17 + 86400.0);

      xpc_dictionary_set_double(v11, kBackgroundTaskAgentPowerPluggedinTime, 2.0);
      xpc_dictionary_set_BOOL(v11, kBackgroundTaskAgentNetworkRequired, 1);
      xpc_dictionary_set_BOOL(v11, kBackgroundTaskAgentCellularAllowed, 0);
      BackgroundTaskAgentAddJob("com.apple.mediastream.mstreamd.pluggedin", v11);

      if (!v9)
      {
LABEL_15:
        byte_10001E380 = 1;
        if (!v8) {
          goto LABEL_27;
        }
        goto LABEL_16;
      }
    }

    else if (v10)
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not monitoring for external power.",  (uint8_t *)&v24,  2u);
      if (!v9) {
        goto LABEL_15;
      }
    }

    else if (!v9)
    {
      goto LABEL_15;
    }

    if (!v8)
    {
LABEL_27:
      if (byte_10001E380 != 1) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }

- (MSIOSAlbumSharingDaemon)albumSharingDaemon
{
  return (MSIOSAlbumSharingDaemon *)objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
}

- (void)setAlbumSharingDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end