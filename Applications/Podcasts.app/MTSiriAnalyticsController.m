@interface MTSiriAnalyticsController
- (MTSiriAnalyticsController)init;
- (NSString)pendingRequest;
- (void)observePlaybackStartEventForRefId:(id)a3;
- (void)playerRateChanged:(id)a3;
- (void)setPendingRequest:(id)a3;
@end

@implementation MTSiriAnalyticsController

- (MTSiriAnalyticsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTSiriAnalyticsController;
  v2 = -[MTSiriAnalyticsController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"playerRateChanged:" name:IMAVPlayerNotification_RateChanged object:0];
  }

  return v2;
}

- (void)observePlaybackStartEventForRefId:(id)a3
{
  id v4 = a3;
  kdebug_trace(723517500LL, 0LL, 0LL, 0LL, 0LL);
  -[MTSiriAnalyticsController setPendingRequest:](self, "setPendingRequest:", v4);
}

- (void)playerRateChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IMAVPlayer);
  uint64_t v7 = objc_opt_class(v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    if ([v5 loadState] == (id)1)
    {
      [v5 actualRate];
      if (v9 > 0.0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSiriAnalyticsController pendingRequest](v8, "pendingRequest"));

        if (v10)
        {
          kdebug_trace(723517504LL, 0LL, 0LL, 0LL, 0LL);
          uint64_t v17 = 0LL;
          v18 = &v17;
          uint64_t v19 = 0x2050000000LL;
          v11 = (void *)qword_1002B6910;
          uint64_t v20 = qword_1002B6910;
          if (!qword_1002B6910)
          {
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472LL;
            v16[2] = sub_10002B7A8;
            v16[3] = &unk_100240E78;
            v16[4] = &v17;
            sub_10002B7A8((uint64_t)v16);
            v11 = (void *)v18[3];
          }

          id v12 = v11;
          _Block_object_dispose(&v17, 8);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedAnalytics]);
          v21[0] = @"refId";
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTSiriAnalyticsController pendingRequest](v8, "pendingRequest"));
          v21[1] = @"bundleId";
          v22[0] = v14;
          v22[1] = kMTApplicationBundleIdentifier;
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
          [v13 logEventWithType:2901 context:v15];

          -[MTSiriAnalyticsController setPendingRequest:](v8, "setPendingRequest:", 0LL);
        }
      }
    }

    objc_sync_exit(v8);
  }
}

- (NSString)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end