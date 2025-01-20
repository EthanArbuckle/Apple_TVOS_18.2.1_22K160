@interface SecdWatchdog
+ (BOOL)triggerOSFaults;
+ (BOOL)watchdogrusage:(rusage_info_v6 *)a3;
+ (id)watchdog;
- (BOOL)diskUsageHigh;
- (BOOL)setWatchdogParameters:(id)a3 error:(id *)a4;
- (SecdWatchdog)init;
- (id)watchdogParameters;
- (unint64_t)secondsFromMachTime:(unint64_t)a3;
- (void)activateTimer;
- (void)runWatchdog;
@end

@implementation SecdWatchdog

- (SecdWatchdog)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SecdWatchdog;
  v2 = -[SecdWatchdog init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_runtimeSecondsBeforeWatchdog = xmmword_100204FB0;
    *(_OWORD *)&v2->_checkPeriod = xmmword_100204FC0;
    v2->_gracefulExitLeeway = 300LL;
    v2->_diskUsageLimit = 1048576000LL;
    v2->_diskUsageHigh = 0;
    -[SecdWatchdog activateTimer](v2, "activateTimer");
  }

  return v3;
}

- (unint64_t)secondsFromMachTime:(unint64_t)a3
{
  if (qword_1002DE6E0 != -1) {
    dispatch_once(&qword_1002DE6E0, &stru_100282A00);
  }
  return qword_1002DE6E8 * a3 / 0x3B9ACA00;
}

- (void)runWatchdog
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v45 = v3;
  __int128 v46 = v3;
  __int128 v43 = v3;
  __int128 v44 = v3;
  __int128 v41 = v3;
  __int128 v42 = v3;
  __int128 v39 = v3;
  __int128 v40 = v3;
  __int128 v37 = v3;
  __int128 v38 = v3;
  __int128 v35 = v3;
  __int128 v36 = v3;
  __int128 v33 = v3;
  __int128 v34 = v3;
  __int128 v31 = v3;
  __int128 v32 = v3;
  __int128 v29 = v3;
  __int128 v30 = v3;
  __int128 v27 = v3;
  __int128 v28 = v3;
  __int128 v25 = v3;
  __int128 v26 = v3;
  __int128 v23 = v3;
  __int128 v24 = v3;
  __int128 v21 = v3;
  __int128 v22 = v3;
  __int128 v19 = v3;
  __int128 v20 = v3;
  __int128 v18 = v3;
  if (objc_msgSend((id)objc_opt_class(self, a2), "watchdogrusage:", &v18))
  {
    v4 = self;
    objc_sync_enter(v4);
    unint64_t v6 = -[SecdWatchdog secondsFromMachTime:](v4, "secondsFromMachTime:", (void)v19);
    if (v6 <= v4->_runtimeSecondsBeforeWatchdog + v4->_rusageBaseline)
    {
      if (!v4->_diskUsageHigh && *((void *)&v32 + 1) > v4->_diskUsageLimit + v4->_diskUsageBaseLine)
      {
        if (objc_msgSend((id)objc_opt_class(v4, v5), "triggerOSFaults")
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          unint64_t diskUsageLimit = v4->_diskUsageLimit;
          int v16 = 134217984;
          unint64_t v17 = diskUsageLimit;
          _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "securityd have written more then %llu",  (uint8_t *)&v16,  0xCu);
        }

        v4->_diskUsageHigh = 1;
      }

      double Current = CFAbsoluteTimeGetCurrent();
      if (Current > v4->_lastCheckTime + (double)v4->_resetPeriod)
      {
        v13 = sub_10001267C("SecWatchdog");
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "resetting watchdog monitoring interval ahead another 24 hours",  (uint8_t *)&v16,  2u);
        }

        v4->_lastCheckTime = Current;
        v4->_rusageBaseline = v6;
        v4->_diskUsageHigh = 0;
        v4->_diskUsageBaseLine = *((void *)&v32 + 1);
      }
    }

    else
    {
      v7 = sub_10001267C("SecCritical");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SecWatchdog: watchdog has detected securityd/secd is using too much CPU - attempting to exit gracefully",  (uint8_t *)&v16,  2u);
      }

      sub_10001BE54(@"securityd watchdog triggered", 0x53C0000Cu);
      xpc_transaction_exit_clean();
      dispatch_time_t v9 = dispatch_time(0LL, 1000000000 * v4->_gracefulExitLeeway);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_after(v9, v11, &stru_100282A20);
    }

    objc_sync_exit(v4);
  }

- (void)activateTimer
{
  v2 = self;
  objc_sync_enter(v2);
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v40 = v3;
  __int128 v41 = v3;
  __int128 v38 = v3;
  __int128 v39 = v3;
  __int128 v36 = v3;
  __int128 v37 = v3;
  __int128 v34 = v3;
  __int128 v35 = v3;
  __int128 v32 = v3;
  __int128 v33 = v3;
  __int128 v30 = v3;
  __int128 v31 = v3;
  __int128 v28 = v3;
  __int128 v29 = v3;
  __int128 v26 = v3;
  __int128 v27 = v3;
  __int128 v24 = v3;
  __int128 v25 = v3;
  __int128 v22 = v3;
  __int128 v23 = v3;
  __int128 v20 = v3;
  __int128 v21 = v3;
  __int128 v18 = v3;
  __int128 v19 = v3;
  __int128 v16 = v3;
  __int128 v17 = v3;
  __int128 v14 = v3;
  __int128 v15 = v3;
  __int128 v13 = v3;
  objc_msgSend((id)objc_opt_class(v2, v4), "watchdogrusage:", &v13);
  v2->_rusageBaseline = -[SecdWatchdog secondsFromMachTime:](v2, "secondsFromMachTime:", (void)v14);
  v2->_lastCheckTime = CFAbsoluteTimeGetCurrent();
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v2);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);
  timer = v2->_timer;
  v2->_timer = (OS_dispatch_source *)v7;

  dispatch_source_set_timer( (dispatch_source_t)v2->_timer,  0LL,  1000000000 * v2->_checkPeriod,  1000000000 * v2->_checkPeriodLeeway);
  dispatch_time_t v9 = (dispatch_source_s *)v2->_timer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009930;
  v10[3] = &unk_100291A38;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)v2->_timer);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);
}

- (id)watchdogParameters
{
  v2 = self;
  objc_sync_enter(v2);
  v9[0] = @"allowed-runtime";
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v2->_runtimeSecondsBeforeWatchdog));
  v10[0] = v3;
  v9[1] = @"reset-period";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v2->_resetPeriod));
  v10[1] = v4;
  v9[2] = @"check-period";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v2->_checkPeriod));
  v10[2] = v5;
  v9[3] = @"graceful-exit-time";
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v2->_gracefulExitLeeway));
  v10[3] = v6;
  dispatch_source_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)setWatchdogParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_source_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v8 = self;
  objc_sync_enter(v8);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000097C8;
  v16[3] = &unk_100282A48;
  objc_copyWeak(&v18, &location);
  id v9 = v7;
  id v17 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
  dispatch_source_cancel((dispatch_source_t)v8->_timer);
  timer = v8->_timer;
  v8->_timer = 0LL;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  objc_sync_exit(v8);

  -[SecdWatchdog activateTimer](v8, "activateTimer");
  id v11 = [v9 count];
  id v12 = v11;
  if (a4 && v11)
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to set parameters: %@",  v9));
    __int128 v21 = v13;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.securityd.watchdog",  0LL,  v14));
  }

  return v12 == 0LL;
}

- (BOOL)diskUsageHigh
{
  return self->_diskUsageHigh;
}

- (void).cxx_destruct
{
}

+ (id)watchdog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009AC0;
  block[3] = &unk_1002935A8;
  block[4] = a1;
  if (qword_1002DE6D8 != -1) {
    dispatch_once(&qword_1002DE6D8, block);
  }
  return (id)qword_1002DE6D0;
}

+ (BOOL)watchdogrusage:(rusage_info_v6 *)a3
{
  pid_t v4 = getpid();
  return proc_pid_rusage(v4, 6, (rusage_info_t *)a3) == 0;
}

+ (BOOL)triggerOSFaults
{
  return 1;
}

@end