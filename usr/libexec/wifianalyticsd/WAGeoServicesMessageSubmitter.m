@interface WAGeoServicesMessageSubmitter
- (WAGeoServicesMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitMessage:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WAGeoServicesMessageSubmitter

- (WAGeoServicesMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WAGeoServicesMessageSubmitter;
  result = -[WAGeoServicesMessageSubmitter init](&v5, "init");
  result->_groupTypeForThisSubmitter = a3;
  return result;
}

- (id)submitMessage:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WAGeoServicesMessageSubmitter;
  id v5 = -[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]( &v15,  "instantiateAWDProtobufAndPopulateValues:",  v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (objc_opt_class(&OBJC_CLASS___GEOWiFiConnectionQualityReporter))
    {
      +[GEOWiFiConnectionQualityReporter reportWiFiConnectionQuality:]( &OBJC_CLASS___GEOWiFiConnectionQualityReporter,  "reportWiFiConnectionQuality:",  v6);
      id v7 = WALogCategoryDefaultHandle();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
        *(_DWORD *)buf = 136446722;
        v17 = "-[WAGeoServicesMessageSubmitter submitMessage:]";
        __int16 v18 = 1024;
        int v19 = 48;
        __int16 v20 = 2112;
        v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Successfully submitted GeoServices message with key: %@",  buf,  0x1Cu);
      }
    }

    else
    {
      id v14 = WALogCategoryDefaultHandle();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v17 = "-[WAGeoServicesMessageSubmitter submitMessage:]";
        __int16 v18 = 1024;
        int v19 = 45;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No GEOWiFiConnectionQualityReporter to report WiFiConnectionQuality with",  buf,  0x12u);
      }
    }

    v10 = 0LL;
  }

  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    v23 = @"WAErrorCodeSubmissionModelFailure";
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9007LL,  v8));
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDSubmitter submissionDelegate](self, "submissionDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  [v11 messsageWasSubmittedWithUUID:v12];

  return v10;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end