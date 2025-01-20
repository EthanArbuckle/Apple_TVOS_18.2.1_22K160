@interface ADCoreAnalyticsSideChannel
+ (int64_t)_currentHour;
+ (void)logAnalyticsBatchUploadedWithBatch:(id)a3;
+ (void)logAnalyticsLocalStoragePurgedWithSize:(id)a3;
+ (void)logAnalyticsLocalStorageSnapshotWithSize:(id)a3;
@end

@implementation ADCoreAnalyticsSideChannel

+ (void)logAnalyticsBatchUploadedWithBatch:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _currentHour];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 analyticsDictionary]);

  id v7 = [v6 mutableCopy];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
  [v7 setObject:v8 forKey:@"hour"];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10034E1A8;
  v10[3] = &unk_1004FD8D0;
  id v11 = v7;
  id v9 = v7;
  AnalyticsSendEventLazy(@"com.apple.siri.analytics.batchupload", v10);
}

+ (void)logAnalyticsLocalStoragePurgedWithSize:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10034E0F8;
  v5[3] = &unk_1004FD8F8;
  id v6 = a3;
  id v7 = [a1 _currentHour];
  id v4 = v6;
  AnalyticsSendEventLazy(@"com.apple.siri.analytics.storage.purged", v5);
}

+ (void)logAnalyticsLocalStorageSnapshotWithSize:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10034E048;
  v5[3] = &unk_1004FD8F8;
  id v6 = a3;
  id v7 = [a1 _currentHour];
  id v4 = v6;
  AnalyticsSendEventLazy(@"com.apple.siri.analytics.storage.snapshot", v5);
}

+ (int64_t)_currentHour
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 components:32 fromDate:v2]);
  id v5 = [v4 hour];

  return (int64_t)v5;
}

@end