@interface CrossfireService
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppEventsWithCompletionBlock:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetMetricsWithCompletionBlock:(id)a3;
- (void)sendMetricsWithCompletionBlock:(id)a3;
@end

@implementation CrossfireService

- (void)flushMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] flushMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1001A688C((uint64_t)&OBJC_CLASS___CrossfireManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1001A6928((uint64_t)v13, @"User Request", v4);
}

- (void)getAppEventsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] getAppEventsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1001A688C((uint64_t)&OBJC_CLASS___CrossfireManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1001A6BAC((uint64_t)v13, v4);
}

- (void)recordLaunchesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] recordLaunchesWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1001A688C((uint64_t)&OBJC_CLASS___CrossfireManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1001A6E28((uint64_t)v13, v4);
}

- (void)recordMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] recordMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1001A688C((uint64_t)&OBJC_CLASS___CrossfireManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1001A7074((uint64_t)v13, v4);
}

- (void)reportAppEvent:(id)a3 completionBlock:(id)a4
{
  uint64_t v5 = (void (**)(id, void, void *))a4;
  uint64_t v6 = ASDLogHandleForCategory(14LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_opt_class(self, v8);
    id v10 = v9;
    id v11 = sub_1001DB80C((uint64_t)self);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138543618;
    __int16 v16 = v9;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] reportAppEvent for client: %{public}@",  (uint8_t *)&v15,  0x16u);
  }

  if (v5)
  {
    uint64_t v13 = ASDErrorWithDescription(ASDErrorDomain, 531LL, @"Command no longer supported");
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v5[2](v5, 0LL, v14);
  }
}

- (void)resetMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543618;
    int v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] resetMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1001A688C((uint64_t)&OBJC_CLASS___CrossfireManager);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1001A75C8((uint64_t)v13, v4);
}

- (void)sendMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543618;
    int v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] sendMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1001A688C((uint64_t)&OBJC_CLASS___CrossfireManager);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1001A77AC((uint64_t)v13, v4);
}

@end