@interface DaemonRunLoop
- (BOOL)performStartupWithError:(id *)a3;
@end

@implementation DaemonRunLoop

- (BOOL)performStartupWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = (id)objc_opt_class(self);
    __int16 v16 = 2080;
    v17 = "Nov 10 2024";
    __int16 v18 = 2080;
    v19 = "02:13:56";
    id v7 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting askpermissiond (%s - %s)",  buf,  0x20u);
  }

  v8 = objc_alloc_init(&OBJC_CLASS___DaemonStartupTask);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonStartupTask perform](v8, "perform"));
  id v13 = 0LL;
  unsigned __int8 v10 = [v9 resultWithError:&v13];
  id v11 = v13;

  if (a3) {
    *a3 = v11;
  }

  return v10;
}

@end