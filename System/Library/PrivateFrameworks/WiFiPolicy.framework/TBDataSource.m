@interface TBDataSource
- (unint64_t)type;
- (void)executeFetchRequest:(id)a3;
- (void)submitAnalyticsEventForFetchRequest:(id)a3 duration:(double)a4 error:(id)a5 resultCount:(int64_t)a6;
@end

@implementation TBDataSource

- (void)executeFetchRequest:(id)a3
{
  id v3 = a3;
  NSLog(@"Unsupported fetch request %@", v3);
  +[TBError fetchUnsupportedErrorWithUserInfo:](&OBJC_CLASS___TBError, "fetchUnsupportedErrorWithUserInfo:", 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[TBErrorFetchResponse responseWithError:](&OBJC_CLASS___TBErrorFetchResponse, "responseWithError:", v5);
  [v3 handleResponse:v4];
}

- (void)submitAnalyticsEventForFetchRequest:(id)a3 duration:(double)a4 error:(id)a5 resultCount:(int64_t)a6
{
  id v29 = a3;
  id v10 = a5;
  [v29 descriptor];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 type];

  unint64_t v13 = -[TBDataSource type](self, "type");
  [v29 descriptor];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v14 type] == 1)
  {
    [v29 descriptor];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v19 = 0LL;
      goto LABEL_7;
    }

    v17 = (void *)MEMORY[0x189607968];
    [v29 descriptor];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 bssids];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v19 = 0LL;
  }

LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v29 userInfo],
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        [v20 objectForKeyedSubscript:@"trigger"],
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        v21))
  {
    [v29 userInfo];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:@"trigger"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v23 unsignedIntegerValue];
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  if (v13) {
    uint64_t v25 = 2LL * (v13 == 1);
  }
  else {
    uint64_t v25 = 1LL;
  }
  [MEMORY[0x189607968] numberWithDouble:a4];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:a6];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = +[TBFetchAnalyticsEvent fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:]( &OBJC_CLASS___TBFetchAnalyticsEvent,  "fetchEventWithSource:type:trigger:duration:requestCount:resultCount:error:tileKey:",  v25,  v12,  v24,  v26,  v19,  v27,  v10,  0LL);
  +[TBAnalytics captureEvent:](&OBJC_CLASS___TBAnalytics, "captureEvent:", v28);
}

- (unint64_t)type
{
  return self->_type;
}

@end