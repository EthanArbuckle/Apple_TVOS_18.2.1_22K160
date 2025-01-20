@interface AMSDialogRequest
- (NSDictionary)lib_analyticsEventInfo;
- (NSString)lib_analyticsDialogName;
- (id)_lib_analyticsEventDictionary;
- (void)_lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4 usingBlock:(id)a5;
- (void)_lib_setAnalyticsEventDictionary:(id)a3;
- (void)lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4;
- (void)lib_setAnalyticsActionName:(id)a3 forAction:(id)a4;
- (void)lib_setAnalyticsDialogName:(id)a3;
- (void)lib_setAnalyticsDialogName:(id)a3 eventInfo:(id)a4;
- (void)lib_setAnalyticsEventInfo:(id)a3;
@end

@implementation AMSDialogRequest

- (NSDictionary)lib_analyticsEventInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"AnalyticsEventInfo"]);

  return (NSDictionary *)v3;
}

- (void)lib_setAnalyticsEventInfo:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"AnalyticsEventInfo");

  -[AMSDialogRequest _lib_setAnalyticsEventDictionary:](self, "_lib_setAnalyticsEventDictionary:", v5);
}

- (NSString)lib_analyticsDialogName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"AnalyticsDialogName"]);

  return (NSString *)v3;
}

- (void)lib_setAnalyticsDialogName:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"AnalyticsDialogName");

  -[AMSDialogRequest _lib_setAnalyticsEventDictionary:](self, "_lib_setAnalyticsEventDictionary:", v5);
}

- (void)lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4
{
}

- (void)lib_setAnalyticsActionName:(id)a3 forAction:(id)a4
{
}

- (void)lib_setAnalyticsDialogName:(id)a3 eventInfo:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v8 = (NSMutableDictionary *)[v7 mutableCopy];

  if (!v8) {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v9 = [v11 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v9,  @"AnalyticsEventInfo");

  id v10 = [v6 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v10,  @"AnalyticsDialogName");

  -[AMSDialogRequest _lib_setAnalyticsEventDictionary:](self, "_lib_setAnalyticsEventDictionary:", v8);
}

- (id)_lib_analyticsEventDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"com.apple.storekit.AnalyticsEvent"]);

  return v3;
}

- (void)_lib_setAnalyticsEventDictionary:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest userInfo](self, "userInfo"));
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = [v7 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"com.apple.storekit.AnalyticsEvent");

  -[AMSDialogRequest setUserInfo:](self, "setUserInfo:", v5);
}

- (void)_lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, const __CFString *, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDialogRequest _lib_analyticsEventDictionary](self, "_lib_analyticsEventDictionary"));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"AnalyticsDialogName"]);
    v14 = v13;
    if (v13 && [v13 length])
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100041630;
      v15[3] = &unk_1002E8C08;
      id v16 = v12;
      id v17 = v8;
      v18 = self;
      id v19 = v9;
      id v20 = v14;
      v10[2](v10, @"com.apple.storekit.dialog", v15);
    }
  }
}

@end