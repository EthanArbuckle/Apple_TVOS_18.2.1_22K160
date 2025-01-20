@interface AppMetricsService
- (AppMetricsService)init;
- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
@end

@implementation AppMetricsService

- (AppMetricsService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AppMetricsService;
  v2 = -[AppMetricsService init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AppMetricsService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_1001DB80C((uint64_t)self);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v10 = ASDLogHandleForCategory(14LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] getMetricsEventsForType for client: %{public}@",  buf,  0x16u);
  }

  id v12 = sub_100233508((uint64_t)&OBJC_CLASS___MetricsCoordinator);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002023B8;
  v17[3] = &unk_1003EC8F8;
  id v19 = v8;
  id v20 = v6;
  v18 = v9;
  id v14 = v8;
  v15 = v9;
  id v16 = v6;
  sub_1002338A0((uint64_t)v13, a3, 7LL, v17);
}

- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_1001DB80C((uint64_t)self);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v10 = ASDLogHandleForCategory(14LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] postMetricsEventsForType for client: %{public}@",  buf,  0x16u);
  }

  id v12 = sub_100233508((uint64_t)&OBJC_CLASS___MetricsCoordinator);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10020260C;
  v15[3] = &unk_1003EAEC8;
  id v16 = v6;
  id v14 = v6;
  sub_100234DCC((uint64_t)v13, a3, 7LL, v15);
}

- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_1001DB80C((uint64_t)self);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v10 = ASDLogHandleForCategory(14LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] recordMetricsEventsForType for client: %{public}@",  buf,  0x16u);
  }

  id v12 = sub_100233508((uint64_t)&OBJC_CLASS___MetricsCoordinator);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100202784;
  v15[3] = &unk_1003EAEC8;
  id v16 = v6;
  id v14 = v6;
  sub_1002358F8((uint64_t)v13, a3, 7LL, v15);
}

- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_1001DB80C((uint64_t)self);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v10 = ASDLogHandleForCategory(14LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] resetMetricsEventsForType for client: %{public}@",  buf,  0x16u);
  }

  id v12 = sub_100233508((uint64_t)&OBJC_CLASS___MetricsCoordinator);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002028FC;
  v15[3] = &unk_1003EAEC8;
  id v16 = v6;
  id v14 = v6;
  sub_100235A38((uint64_t)v13, a3, 7LL, v15);
}

- (void).cxx_destruct
{
}

@end