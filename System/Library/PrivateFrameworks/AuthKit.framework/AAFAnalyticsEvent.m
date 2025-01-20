@interface AAFAnalyticsEvent
+ (id)ak_analyticsEventWithContext:(id)a3 client:(id)a4 eventName:(id)a5 error:(id)a6;
+ (id)ak_analyticsEventWithContext:(id)a3 eventName:(id)a4 error:(id)a5;
+ (id)ak_analyticsEventWithEventName:(id)a3 account:(id)a4 error:(id)a5;
+ (id)ak_analyticsEventWithEventName:(id)a3 error:(id)a4;
- (void)ak_updateTelemetryIdWithAccount:(id)a3;
- (void)ak_updateWithAuthenticationResults:(id)a3 authContext:(id)a4 error:(id)a5;
@end

@implementation AAFAnalyticsEvent

+ (id)ak_analyticsEventWithEventName:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryAuthKitAccount]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ak_analyticsEventWithEventName:account:error:", v7, v9, v6));

  return v10;
}

+ (id)ak_analyticsEventWithEventName:(id)a3 account:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[AAFAnalyticsEvent initWithEventName:eventCategory:initData:]( objc_alloc(&OBJC_CLASS___AAFAnalyticsEvent),  "initWithEventName:eventCategory:initData:",  v9,  &off_1001D8D58,  0LL);

  -[AAFAnalyticsEvent populateUnderlyingErrorsStartingWithRootError:]( v10,  "populateUnderlyingErrorsStartingWithRootError:",  v7);
  -[AAFAnalyticsEvent ak_updateTelemetryIdWithAccount:](v10, "ak_updateTelemetryIdWithAccount:", v8);

  return v10;
}

- (void)ak_updateTelemetryIdWithAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 telemetryDeviceSessionIDForAccount:v4]);
    -[AAFAnalyticsEvent setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v6,  kAAFDeviceSessionIdString);
  }

  else
  {
    uint64_t v7 = _AKLogSystem(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100136144(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

+ (id)ak_analyticsEventWithContext:(id)a3 eventName:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 authKitAccount:0]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithEventName:account:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithEventName:account:error:",  v9,  v10,  v8));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 telemetryFlowID]);
  if (!v12)
  {
    uint64_t v14 = _AKLogSystem(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100136178(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 telemetryFlowID]);
  [v11 setObject:v23 forKeyedSubscript:kAAFFlowIdString];

  return v11;
}

+ (id)ak_analyticsEventWithContext:(id)a3 client:(id)a4 eventName:(id)a5 error:(id)a6
{
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  a3,  a5,  a6));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);

  [v10 setObject:v11 forKeyedSubscript:@"processName"];
  return v10;
}

- (void)ak_updateWithAuthenticationResults:(id)a3 authContext:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v23 = 0LL;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authKitAccount:&v23]);
  id v11 = v23;
  uint64_t v12 = v11;
  if (!v10 || v11)
  {
    uint64_t v13 = _AKLogSystem(v11);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1001361AC((uint64_t)v8, v14);
    }
  }

  -[AAFAnalyticsEvent ak_updateTelemetryIdWithAccount:](self, "ak_updateTelemetryIdWithAccount:", v10);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 telemetryFlowID]);

  -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v15, kAAFFlowIdString);
  uint64_t v16 = kAAFDeviceSessionIdString;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[AAFAnalyticsEvent objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  kAAFDeviceSessionIdString));
  if (!v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    unsigned int v19 = [v18 accountAccessTelemetryOptInForAccount:v10];

    if (!v19) {
      goto LABEL_10;
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 telemetryDeviceSessionIDForAccount:v10]);
    -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v20, v16);
  }

LABEL_10:
  if (a3)
  {
    -[AAFAnalyticsEvent setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kAAFDidSucceed);
  }

  else
  {
    -[AAFAnalyticsEvent setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kAAFDidSucceed);
    -[AAFAnalyticsEvent populateUnderlyingErrorsStartingWithRootError:]( self,  "populateUnderlyingErrorsStartingWithRootError:",  v8);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 securityLevelForAccount:v10]));
  -[AAFAnalyticsEvent setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v22, @"securityLevel");
}

@end