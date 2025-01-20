@interface RPNWActivityMetrics
+ (id)metricsUsingToken:(id)a3;
- (OS_nw_activity)nwActivity;
- (id)_initWithNWActivity:(id)a3;
- (id)_metricsDictionary;
- (void)submitMetrics;
@end

@implementation RPNWActivityMetrics

+ (id)metricsUsingToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWActivityUtils activityFromToken:](&OBJC_CLASS___RPNWActivityUtils, "activityFromToken:", v4));
  if (v5)
  {
    id v6 = [objc_alloc((Class)a1) _initWithNWActivity:v5];
  }

  else
  {
    if (dword_1001321F0 <= 90
      && (dword_1001321F0 != -1 || _LogCategory_Initialize(&dword_1001321F0, 90LL)))
    {
      LogPrintF( &dword_1001321F0,  "+[RPNWActivityMetrics metricsUsingToken:]",  90LL,  "Failed to create NWActivity from token %p",  v4);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (void)submitMetrics
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNWActivityMetrics _metricsDictionary](self, "_metricsDictionary"));
  v3 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWActivityMetrics nwActivity](self, "nwActivity"));
    nw_activity_submit_metrics(v4, "rapportd", v3);
  }

  else if (dword_1001321F0 <= 90 {
         && (dword_1001321F0 != -1 || _LogCategory_Initialize(&dword_1001321F0, 90LL)))
  }
  {
    LogPrintF( &dword_1001321F0,  "-[RPNWActivityMetrics submitMetrics]",  90LL,  "Failed to produce XPC metrics from %p",  v5);
  }
}

- (id)_initWithNWActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPNWActivityMetrics;
  id v6 = -[RPNWActivityMetrics init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_nwActivity, a3);
  }

  return v7;
}

- (id)_metricsDictionary
{
  return &__NSDictionary0__struct;
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void).cxx_destruct
{
}

@end