@interface PMPowerModeAnalytics
+ (void)sendAnalyticsDaily:(id)a3 forStream:(id)a4;
+ (void)sendAnalyticsEvent:(id)a3 withBatteryLevel:(id)a4 fromSource:(id)a5 withCharger:(id)a6 withDurationInMinutes:(id)a7 forStream:(id)a8;
@end

@implementation PMPowerModeAnalytics

+ (void)sendAnalyticsEvent:(id)a3 withBatteryLevel:(id)a4 fromSource:(id)a5 withCharger:(id)a6 withDurationInMinutes:(id)a7 forStream:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (&_AnalyticsSendEventLazy)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000AB14;
    v18[3] = &unk_100059428;
    id v19 = v13;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    id v23 = v17;
    AnalyticsSendEventLazy(a8, v18);
  }
}

+ (void)sendAnalyticsDaily:(id)a3 forStream:(id)a4
{
  id v5 = a3;
  v6 = v5;
  if (&_AnalyticsSendEventLazy)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000AC44;
    v7[3] = &unk_100059450;
    id v8 = v5;
    AnalyticsSendEventLazy(a4, v7);
  }
}

@end