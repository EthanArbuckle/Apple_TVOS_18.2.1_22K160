@interface ADGenericIntentRequestHandler
- (void)_handleGenericIntentRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation ADGenericIntentRequestHandler

- (void)_handleGenericIntentRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_af_analyticsContextDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 appIdentifier]);
  id v13 = sub_1001EA650(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v11 setObject:v14 forKeyedSubscript:AFAnalyticsContextKey[1]];

  [v10 logEventWithType:501 context:v11 contextNoCopy:0];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 appIdentifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  v15));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100270C04;
  v20[3] = &unk_1004F8B08;
  id v21 = v7;
  id v22 = v10;
  id v23 = v8;
  id v17 = v8;
  id v18 = v10;
  id v19 = v7;
  [v16 handleSiriRequest:v19 deliveryHandler:v9 completionHandler:v20];
}

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___STGenericIntentRequest);
  if ((objc_opt_isKindOfClass(v13, v11) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"ADGenericIntentService.m", 122, @"Invalid parameter not satisfying: %@", @"[request isKindOfClass:[STGenericIntentRequest class]]" object file lineNumber description];
  }

  -[ADGenericIntentRequestHandler _handleGenericIntentRequest:deliveryHandler:completionHandler:]( self,  "_handleGenericIntentRequest:deliveryHandler:completionHandler:",  v13,  v9,  v10);
}

@end