@interface RunLoop
- (BOOL)performStartupWithError:(id *)a3;
- (void)_run;
- (void)runUntilIdleExit;
@end

@implementation RunLoop

- (BOOL)performStartupWithError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  return 1;
}

- (void)runUntilIdleExit
{
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler(v3, &stru_100030C38);
  dispatch_resume(v3);
  id v11 = 0LL;
  unsigned int v4 = -[RunLoop performStartupWithError:](self, "performStartupWithError:", &v11);
  id v5 = v11;
  v6 = v5;
  if (!v4 || v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v6;
      id v10 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to startup daemon. Error: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    -[RunLoop _run](self, "_run");
  }
}

- (void)_run
{
  v3 = objc_autoreleasePoolPush();
  if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) >= 2)
  {
    do
    {
      objc_autoreleasePoolPop(v3);
      v3 = objc_autoreleasePoolPush();
    }

    while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) > 1);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class(self);
    id v6 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Stopping for idle-exit",  (uint8_t *)&v7,  0xCu);
  }

  objc_autoreleasePoolPop(v3);
}

@end