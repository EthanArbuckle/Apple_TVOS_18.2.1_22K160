@interface GEOAPServiceLocal
- (void)flushEvalData;
- (void)flushUploadHistoryWithCompletion:(id)a3;
- (void)reportDailySettings:(id)a3 completion:(id)a4;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5;
- (void)runAggregationTasks;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalDataWithVisitorBlock:(id)a3;
- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5;
- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4;
- (void)showUploadCounts:(id)a3;
- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5;
@end

@implementation GEOAPServiceLocal

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = sub_100004ADC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    v16 = "-[GEOAPServiceLocal reportLogMsg:uploadBatchId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v15, 0xCu);
  }

  id v11 = sub_1000168E0();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  sub_1000170E8((uint64_t)v12, v8, a4, v14, v7);
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = sub_100004ADC();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[GEOAPServiceLocal reportDailyUsageCountType:usageString:usageBool:appId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v17 = sub_1000168E0();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100004CA8;
  v22[3] = &unk_1000286C8;
  id v23 = v11;
  id v21 = v11;
  sub_100017658((uint64_t)v18, v10, v14, v13, v12, v20, v22);
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000168E0();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004D84;
  v12[3] = &unk_1000286C8;
  id v13 = v5;
  id v11 = v5;
  sub_1000193E8(v8, v6, v10, v12);
}

- (void)setEvalMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  [v4 setEvalMode:v3];
}

- (void)flushEvalData
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  [v2 flushEvalData];
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPPersistence sharedInstance](&OBJC_CLASS___GEOAPPersistence, "sharedInstance"));
  [v4 showEvalDataWithVisitorBlock:v3];
}

- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001A420();
  }
}

- (void)runAggregationTasks
{
  id v2 = sub_1000074C0();
  id v3 = (id *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A0F0(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPNetEventAggregator sharedAggregator](&OBJC_CLASS___GEOAPNetEventAggregator, "sharedAggregator"));
  [v4 runAggregation];
}

- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
  [v7 showInflightUploadsWithVisitorBlock:v6 completion:v5];
}

- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
  [v9 showHistoryOfAge:v6 withVisitorBlock:v8 completion:v7];
}

- (void)flushUploadHistoryWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
  [v4 deleteAllHistory];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000506C;
  block[3] = &unk_1000286C8;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, block);
}

- (void)showUploadCounts:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPDebugPersistence sharedInstance](&OBJC_CLASS___GEOAPDebugPersistence, "sharedInstance"));
  [v4 showUploadCounts:v3];
}

@end