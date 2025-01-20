@interface SKAnalyticsManager
+ (void)sendEvent:(id)a3;
+ (void)sendEventLazyWithName:(id)a3 buildEvent:(id)a4;
@end

@implementation SKAnalyticsManager

+ (void)sendEvent:(id)a3
{
  id v3 = a3;
  if ([v3 canCreatePayload])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventName]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000332C4;
    v13[3] = &unk_1002E8318;
    id v14 = v3;
    AnalyticsSendEventLazy(v4, v13);
  }

  else
  {
    if (qword_10032E340 != -1) {
      dispatch_once(&qword_10032E340, &stru_1002E8360);
    }
    v5 = (os_log_s *)qword_10032E2F8;
    if (os_log_type_enabled((os_log_t)qword_10032E2F8, OS_LOG_TYPE_ERROR)) {
      sub_10025E1E4(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (void)sendEventLazyWithName:(id)a3 buildEvent:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100033344;
  v6[3] = &unk_1002E8340;
  id v7 = a4;
  id v5 = v7;
  AnalyticsSendEventLazy(a3, v6);
}

@end