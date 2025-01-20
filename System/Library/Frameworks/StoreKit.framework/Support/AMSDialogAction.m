@interface AMSDialogAction
- (NSString)lib_analyticsActionName;
- (id)_lib_analyticsEventDictionary;
- (void)_lib_setAnalyticsEventDictionary:(id)a3;
- (void)lib_setAnalyticsActionName:(id)a3;
@end

@implementation AMSDialogAction

- (NSString)lib_analyticsActionName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogAction _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"AnalyticsEventAction"]);

  return (NSString *)v3;
}

- (void)lib_setAnalyticsActionName:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogAction _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"AnalyticsEventAction");

  -[AMSDialogAction _lib_setAnalyticsEventDictionary:](self, "_lib_setAnalyticsEventDictionary:", v5);
}

- (id)_lib_analyticsEventDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogAction userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"com.apple.storekit.AnalyticsEvent"]);

  return v3;
}

- (void)_lib_setAnalyticsEventDictionary:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogAction userInfo](self, "userInfo"));
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"com.apple.storekit.AnalyticsEvent");

  -[AMSDialogAction setUserInfo:](self, "setUserInfo:", v5);
}

@end