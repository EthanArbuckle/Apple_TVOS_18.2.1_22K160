@interface AMSDXPCActivityScheduler
- (void)removeActivity:(id)a3;
- (void)scheduleIfNeededActivity:(id)a3;
@end

@implementation AMSDXPCActivityScheduler

- (void)scheduleIfNeededActivity:(id)a3
{
  id v4 = a3;
  id v5 = objc_claimAutoreleasedReturnValue([v4 activityIdentifier]);
  v6 = (const char *)[v5 UTF8String];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100047510;
  v8[3] = &unk_1000D8030;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, v8);
}

- (void)removeActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v10 = AMSLogKey(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v13 = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Unregistering activity %{public}@",  (uint8_t *)&v13,  0x20u);
  }

  id v12 = v4;
  xpc_activity_unregister((const char *)[v12 UTF8String]);
}

@end