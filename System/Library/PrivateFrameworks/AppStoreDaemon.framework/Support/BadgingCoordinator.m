@interface BadgingCoordinator
- (BadgingCoordinator)init;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation BadgingCoordinator

- (BadgingCoordinator)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BadgingCoordinator;
  v2 = -[BadgingCoordinator init](&v15, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.BadgingCoordinator.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = ASDLogHandleForCategory(14LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class(v2, v9);
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      id v11 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Registering the push token for badge pushes",  buf,  0xCu);
    }

    id v12 = sub_10028ECBC((uint64_t)&OBJC_CLASS___PushService);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    sub_10028EF00((uint64_t)v13, v2, 35LL);
  }

  return v2;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = (id *)a4;
  v8 = (void (**)(id, void))a5;
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v12 = (void *)objc_opt_class(self, v11);
    id v13 = v12;
    v14 = sub_10025F5F8(v7, (uint64_t)@"aps");
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = 138543618;
    v17 = v12;
    __int16 v18 = 2114;
    v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[%{public}@] Ignoring: %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  v8[2](v8, 0LL);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void).cxx_destruct
{
}

@end