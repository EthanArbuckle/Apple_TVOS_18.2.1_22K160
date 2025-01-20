@interface STGenericIntentRequest
- (id)_ad_finalMetricsContextWithResponse:(id)a3 error:(id)a4;
@end

@implementation STGenericIntentRequest

- (id)_ad_finalMetricsContextWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STGenericIntentRequest _af_analyticsContextDescription](self, "_af_analyticsContextDescription"));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    [v8 setObject:v9 forKeyedSubscript:@"errorDomain"];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 code]));
    [v8 setObject:v10 forKeyedSubscript:@"errorCode"];
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___STGenericIntentResponse);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
  {
    id v12 = [v6 responseCode];
LABEL_7:
    uint64_t v14 = STStringFromGenericIntentResponseCode(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v8 setObject:v15 forKeyedSubscript:AFAnalyticsContextKey[2]];

    goto LABEL_8;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
  {
    id v12 = 0LL;
    goto LABEL_7;
  }

  if (v6)
  {
    v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      v19 = "-[STGenericIntentRequest(Metrics) _ad_finalMetricsContextWithResponse:error:]";
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s unknown response %@",  (uint8_t *)&v18,  0x16u);
    }
  }

@end