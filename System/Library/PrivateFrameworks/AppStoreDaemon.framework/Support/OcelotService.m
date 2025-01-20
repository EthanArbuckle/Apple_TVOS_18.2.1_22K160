@interface OcelotService
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppPayoutEventsWithCompletionBlock:(id)a3;
- (void)getAppSummaryEventsWithCompletionBlock:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetMetricsWithCompletionBlock:(id)a3;
- (void)resetPayoutWithCompletionBlock:(id)a3;
- (void)sbsyncIfSubscribedWithAccount:(id)a3 completionBlock:(id)a4;
- (void)sbsyncWithCompletionBlock:(id)a3;
- (void)sbsyncWithDuration:(id)a3 completionBlock:(id)a4;
- (void)sendPayoutMetricsWithCompletionBlock:(id)a3;
- (void)sendSummaryMetricsWithCompletionBlock:(id)a3;
- (void)showUpsellForItemID:(id)a3 completionBlock:(id)a4;
- (void)subscriptionDetailsWithCompletionBlock:(id)a3;
- (void)subscriptionStateWithCompletionBlock:(id)a3;
- (void)topAppsForAccount:(id)a3 completionBlock:(id)a4;
@end

@implementation OcelotService

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
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] flushMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A51C8((uint64_t)v13, @"User Request", v4);
}

- (void)getAppPayoutEventsWithCompletionBlock:(id)a3
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
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] getAppPayoutEventsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A545C((uint64_t)v13, v4);
}

- (void)getAppSummaryEventsWithCompletionBlock:(id)a3
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
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] getAppSummaryEventsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A5910((uint64_t)v13, v4);
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
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] recordLaunchesWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A69F4((uint64_t)v13, v4);
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
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] recordMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A724C((uint64_t)v13, v4);
}

- (void)reportAppEvent:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    id v13 = sub_1001DB80C((uint64_t)self);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138412546;
    v18 = v11;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] reportAppEvent for client: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  id v15 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  sub_1002A676C((uint64_t)v16, v7, v6);
}

- (void)resetMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2114;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] resetMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A7448((uint64_t)v13, v4);
}

- (void)resetPayoutWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2114;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] recordLaunchesWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A795C((uint64_t)v13, v4);
}

- (void)sendPayoutMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2114;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] sendPayoutMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A8C94((uint64_t)v13, v4);
}

- (void)sendSummaryMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2114;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] sendSummaryMetricsWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A8E94((uint64_t)v13, v4);
}

- (void)sbsyncIfSubscribedWithAccount:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    id v13 = sub_1001DB80C((uint64_t)self);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138412546;
    v18 = v11;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@]: sbsyncIfSubscribedWithAccount:completionBlock for client: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  id v15 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  sub_1002A7B8C((uint64_t)v16, v7, v6);
}

- (void)sbsyncWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2114;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] sbsyncWithCompletionBlock for client: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002A8204((uint64_t)v13, @"Manual", 0LL, v4);
}

- (void)sbsyncWithDuration:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    id v13 = sub_1001DB80C((uint64_t)self);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138412546;
    v18 = v11;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] sbsyncWithDuration:completionBlock for client: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  id v15 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  sub_1002A8204((uint64_t)v16, @"Manual", v7, v6);
}

- (void)showUpsellForItemID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  id v9 = sub_1001DB80C((uint64_t)self);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = ASDLogHandleForCategory(4LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543874;
    v18 = v8;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] showUpsellForItemID: %{public}@ for client: %{public}@",  (uint8_t *)&v17,  0x20u);
  }

  id v13 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  sub_1002AA770((uint64_t)v14, v6, &__NSDictionary0__struct, v8);

  uint64_t v15 = ASDLogHandleForCategory(4LL);
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] showUpsellForItemID complete for client: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  if (v7) {
    v7[2](v7, 1LL, 0LL);
  }
}

- (void)subscriptionDetailsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_opt_class(self, v9);
    id v11 = v10;
    id v12 = sub_1001DB80C((uint64_t)self);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138412546;
    v40 = v10;
    __int16 v41 = 2114;
    v42 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] subscriptionDetailsWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_activeiTunesAccount"));

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_DSID"));
  id v36 = 0LL;
  BOOL v17 = sub_100224C38((uint64_t)&OBJC_CLASS___SbsyncTask, v16, &v36);
  id v18 = v36;

  if (v15)
  {
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 username]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_DSID"));
    __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v19,  v20));
  }

  else
  {
    __int16 v21 = @"N/A";
  }

  id v22 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = sub_1002A507C((uint64_t)v23);

  v25 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v26 = &__kCFBooleanFalse;
  if (v17) {
    v26 = &__kCFBooleanTrue;
  }
  v37[0] = @"isSubscriptionBagSubscribed";
  v37[1] = @"subscribedAccount";
  v38[0] = v26;
  v38[1] = v21;
  v37[2] = @"arcadeAppCount";
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v24));
  v38[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
  v29 = -[NSMutableDictionary initWithDictionary:](v25, "initWithDictionary:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[SubscriptionEntitlementsCoordinator sharedInstance]( &OBJC_CLASS___SubscriptionEntitlementsCoordinator,  "sharedInstance"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1002301A8;
  v33[3] = &unk_1003EDA00;
  v34 = v29;
  id v35 = v4;
  v31 = v29;
  id v32 = v4;
  sub_100265464(v30, 1uLL, v6, 0, 0, 0LL, v33);
}

- (void)subscriptionStateWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, BOOL, id))a3;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_opt_class(self, v7);
    id v9 = v8;
    id v10 = sub_1001DB80C((uint64_t)self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v8;
    __int16 v20 = 2114;
    __int16 v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] subscriptionStateWithCompletionBlock for client: %{public}@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

  int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_DSID"));
  id v17 = 0LL;
  BOOL v15 = sub_100224C38((uint64_t)&OBJC_CLASS___SbsyncTask, v14, &v17);
  id v16 = v17;

  if (v4) {
    v4[2](v4, v15, v16);
  }
}

- (void)topAppsForAccount:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ASDLogHandleForCategory(3LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_1001DB80C((uint64_t)self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138543362;
    BOOL v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "topAppForAccount for client: %{public}@",  (uint8_t *)&v14,  0xCu);
  }

  id v12 = sub_1002A4FE0((uint64_t)&OBJC_CLASS___OcelotManager);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_1002AAFF8((uint64_t)v13, v7, v6);
}

@end