@interface _APRSBiomeBase
+ (id)config;
+ (id)eventStream;
+ (id)getStoragePath;
+ (id)publisherForEventsStartingFromDate:(id)a3;
+ (id)sharedEventQueue;
+ (id)sourceForStream;
+ (void)postEvent:(id)a3;
+ (void)postEvent:(id)a3 usingSource:(id)a4;
+ (void)pruneEventsOlderThanDate:(id)a3;
+ (void)setStoragePath:(id)a3;
@end

@implementation _APRSBiomeBase

+ (id)config
{
  id v2 = +[BMStoreConfig newPrivateStreamDefaultConfigurationWithStoreBasePath:]( &OBJC_CLASS___BMStoreConfig,  "newPrivateStreamDefaultConfigurationWithStoreBasePath:");
  v3 = (void *)qword_1001578B0;
  qword_1001578B0 = (uint64_t)v2;

  return (id)qword_1001578B0;
}

+ (void)setStoragePath:(id)a3
{
}

+ (id)getStoragePath
{
  return (id)qword_1001578A8;
}

+ (id)eventStream
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase config](&OBJC_CLASS____APRSBiomeBase, "config"));
  v4 = (objc_class *)objc_opt_class(a1);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:1]);

  id v8 = [[BMStoreStream alloc] initWithPrivateStreamIdentifier:v7 storeConfig:v3];
  return v8;
}

+ (id)sourceForStream
{
  id v2 = [(id)objc_opt_class(a1) eventStream];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 source]);

  return v4;
}

+ (id)sharedEventQueue
{
  if (qword_1001578C0 != -1) {
    dispatch_once(&qword_1001578C0, &stru_100115D80);
  }
  return (id)qword_1001578B8;
}

+ (void)postEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(a1) eventStream];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 source]);

  [(id)objc_opt_class(a1) postEvent:v4 usingSource:v7];
}

+ (void)postEvent:(id)a3 usingSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](&OBJC_CLASS____APRSBiomeBase, "sharedEventQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100040DB0;
  v10[3] = &unk_100115148;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

+ (id)publisherForEventsStartingFromDate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(a1) eventStream];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 publisherFromStartTime:v8]);
  return v9;
}

+ (void)pruneEventsOlderThanDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 eventStream]);
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;

  double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeBase sharedEventQueue](&OBJC_CLASS____APRSBiomeBase, "sharedEventQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100040EE8;
  v10[3] = &unk_100115DC8;
  id v11 = v5;
  uint64_t v12 = v7;
  id v9 = v5;
  dispatch_async(v8, v10);
}

@end