@interface AnalyticsLogger
+ (id)logger;
- (AnalyticsLogger)init;
- (OS_dispatch_queue)queue;
- (void)logCAEventforMode:(id)a3 startDate:(id)a4 endDate:(id)a5 startingSOC:(id)a6 endingSOC:(id)a7 exitReason:(id)a8;
- (void)setQueue:(id)a3;
@end

@implementation AnalyticsLogger

+ (id)logger
{
  if (qword_10001B6A0 != -1) {
    dispatch_once(&qword_10001B6A0, &stru_1000143F0);
  }
  return (id)qword_10001B698;
}

- (AnalyticsLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AnalyticsLogger;
  v2 = -[AnalyticsLogger init](&v7, "init");
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.powerexperienced.analytics.logger", v4);
  -[AnalyticsLogger setQueue:](v2, "setQueue:", v5);

  return v2;
}

- (void)logCAEventforMode:(id)a3 startDate:(id)a4 endDate:(id)a5 startingSOC:(id)a6 endingSOC:(id)a7 exitReason:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AnalyticsLogger queue](self, "queue"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100003FB0;
  v27[3] = &unk_100014440;
  id v28 = v16;
  id v29 = v15;
  id v30 = v14;
  id v31 = v19;
  id v32 = v17;
  id v33 = v18;
  id v21 = v18;
  id v22 = v17;
  id v23 = v19;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  dispatch_async(v20, v27);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end