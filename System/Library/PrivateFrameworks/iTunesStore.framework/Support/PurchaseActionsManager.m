@interface PurchaseActionsManager
+ (id)sharedInstance;
+ (void)registerInstallAttributionDatabaseCleanTask;
+ (void)registerInstallAttributionPingbackRetryTask;
+ (void)unregisterInstallAttributionPingbackRetryTask;
- (PurchaseActionsManager)init;
- (void)deletePurchaseIntentsForApp:(id)a3;
- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4;
- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4;
- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3;
- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4;
- (void)insertInstallAttributionParams:(id)a3 overrideCampaignLimit:(BOOL)a4 completionHandler:(id)a5;
- (void)insertInstallAttributionPingback:(id)a3;
- (void)insertPurchaseIntent:(id)a3;
- (void)removeInstallAttributionParamsBeforeDate:(id)a3;
- (void)removeInstallAttributionParamsForApp:(id)a3;
- (void)removeInstallAttributionPingbackForApp:(id)a3;
- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3;
- (void)resetTimestampsForApp:(id)a3;
- (void)sendPendingPingbacks;
- (void)setAppBundleIdForCurrentInstallSheet:(id)a3;
- (void)setPingbackPendingForApp:(id)a3;
@end

@implementation PurchaseActionsManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100179FDC;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A35A8 != -1) {
    dispatch_once(&qword_1003A35A8, block);
  }
  return (id)qword_1003A35A0;
}

- (PurchaseActionsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PurchaseActionsManager;
  v2 = -[PurchaseActionsManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PurchaseActionsDatabase);
    database = v2->_database;
    v2->_database = v3;
  }

  return v2;
}

- (void)deletePurchaseIntentsForApp:(id)a3
{
}

- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4
{
}

- (void)insertPurchaseIntent:(id)a3
{
}

- (void)resetTimestampsForApp:(id)a3
{
}

- (void)setAppBundleIdForCurrentInstallSheet:(id)a3
{
  id v5 = a3;
  bundleIdForCurrentInstallSheet = self->_bundleIdForCurrentInstallSheet;
  p_bundleIdForCurrentInstallSheet = &self->_bundleIdForCurrentInstallSheet;
  id v8 = v5;
  if (!-[NSString isEqualToString:](bundleIdForCurrentInstallSheet, "isEqualToString:")) {
    objc_storeStrong((id *)p_bundleIdForCurrentInstallSheet, a3);
  }
}

- (void)insertInstallAttributionParams:(id)a3 overrideCampaignLimit:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!a4)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    v45 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
    [v12 addOperations:v13 waitUntilFinished:1];

    if (-[ISLoadURLBagOperation success](v11, "success"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v11, "URLBag"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"install-attribution-max-campaign-id"]);

      if (v15 && [v15 integerValue])
      {
        uint64_t v10 = (uint64_t)[v15 integerValue];
LABEL_20:

        goto LABEL_21;
      }

- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4
{
}

- (void)removeInstallAttributionParamsForApp:(id)a3
{
}

- (void)removeInstallAttributionParamsBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v11 = 138543618;
  id v12 = (id)objc_opt_class(self);
  __int16 v13 = 2114;
  id v14 = v4;
  id v9 = v12;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[%{public}@]: Removing IA params before date: %{public}@",  &v11,  22);

  if (v10)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  -[PurchaseActionsDatabase removeInstallAttributionParamsBeforeDate:]( self->_database,  "removeInstallAttributionParamsBeforeDate:",  v4);
}

+ (void)registerInstallAttributionDatabaseCleanTask
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 604800LL);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10017A88C;
  v5[3] = &unk_10034C028;
  id v6 = v3;
  id v7 = a1;
  id v4 = v3;
  xpc_activity_register("com.apple.itunesstored.PurchaseActionManager.IAParamsClean", XPC_ACTIVITY_CHECK_IN, v5);
}

- (void)insertInstallAttributionPingback:(id)a3
{
}

- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4
{
}

- (void)setPingbackPendingForApp:(id)a3
{
  int64_t v4 = 1000000000LL;
  if ((SSDebugShouldDisableInstallAttributionPingbackDelay(-[PurchaseActionsDatabase setPingbackPendingForApp:](self->_database, "setPingbackPendingForApp:", a3)) & 1) == 0) {
    int64_t v4 = 1000000000LL * (arc4random_uniform(0x1C20u) + 1);
  }
  dispatch_time_t v5 = dispatch_time(0LL, v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017B148;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_after(v5, &_dispatch_main_q, block);
  +[PurchaseActionsManager registerInstallAttributionPingbackRetryTask]( &OBJC_CLASS___PurchaseActionsManager,  "registerInstallAttributionPingbackRetryTask");
}

- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3
{
}

- (void)removeInstallAttributionPingbackForApp:(id)a3
{
}

- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3
{
}

- (void)sendPendingPingbacks
{
  xpc_object_t v3 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  v18 = v3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v4 addOperations:v5 waitUntilFinished:1];

  if (!-[ISLoadURLBagOperation success](v3, "success"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharediTunesStoreConfig](&OBJC_CLASS___SSLogConfig, "sharediTunesStoreConfig"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v7 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class(self);
      id v12 = v17;
      __int16 v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%{public}@]: Failed to load URL bag when sending Install Attribution pingbacks",  &v16,  12);

      if (!v13)
      {
LABEL_17:
        uint64_t v8 = 10LL;
        goto LABEL_18;
      }

      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_17;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v3, "URLBag"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"install-attribution-max-ping-back-attempts"]);

  uint64_t v8 = (uint64_t)[v7 integerValue];
LABEL_18:

  database = self->_database;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10017B3D8;
  v15[3] = &unk_100350738;
  v15[4] = self;
  v15[5] = v8;
  -[PurchaseActionsDatabase getPendingInstallAttributionPingbacksWithCompletionHandler:]( database,  "getPendingInstallAttributionPingbacksWithCompletionHandler:",  v15);
}

+ (void)registerInstallAttributionPingbackRetryTask
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 86400LL);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10017BBE4;
  v5[3] = &unk_10034C028;
  id v6 = v3;
  id v7 = a1;
  id v4 = v3;
  xpc_activity_register("com.apple.itunesstored.PurchaseActionManager.IAPingbackRetry", XPC_ACTIVITY_CHECK_IN, v5);
}

+ (void)unregisterInstallAttributionPingbackRetryTask
{
}

- (void).cxx_destruct
{
}

@end