@interface LakituResponse
- (LakituResponse)initWithError:(id)a3;
- (LakituResponse)initWithResponseDictionary:(id)a3;
- (LakituResponse)initWithURLResponse:(id)a3 data:(id)a4;
- (NSDictionary)responseDictionary;
- (NSError)error;
- (NSHTTPURLResponse)httpResponse;
- (NSString)requestUUID;
- (id)_parsePlistFromData:(id)a3 error:(id *)a4;
- (void)setError:(id)a3;
@end

@implementation LakituResponse

- (id)_parsePlistFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v17 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v17));
    id v7 = v17;
    v9 = v7;
    if (v6)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v10);
      if ((isKindOfClass & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v12 = CloudServicesLog(isKindOfClass);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000445AC();
      }

      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  @"Escrow response not a dictionary",  NSLocalizedDescriptionKey);
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EscrowProxyErrorDomain",  500LL,  v14));
      }
    }

    else
    {
      if (a4)
      {
        id v7 = v7;
        *a4 = v7;
      }

      uint64_t v15 = CloudServicesLog(v7);
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_100044548();
      }
    }

    v6 = 0LL;
    goto LABEL_14;
  }

  v6 = 0LL;
LABEL_15:

  return v6;
}

- (LakituResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___LakituResponse;
  uint64_t v10 = -[LakituResponse init](&v44, "init");
  if (v10)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v9);
    if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    {
      objc_storeStrong((id *)&v10->_httpResponse, a3);
      id v12 = -[NSHTTPURLResponse statusCode](v10->_httpResponse, "statusCode");
      if (v12 != (id)200)
      {
        uint64_t v13 = (uint64_t)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v12));
        uint64_t v15 = CloudServicesLog(v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000447D8((uint64_t)v14, v13, v16);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v17 setObject:v14 forKeyedSubscript:NSLocalizedDescriptionKey];
        if (v13 == 503 || v13 == 429)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHTTPURLResponse allHeaderFields](v10->_httpResponse, "allHeaderFields"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Retry-After"]);

          if (v19)
          {
            uint64_t v21 = CloudServicesLog(v20);
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100044774();
            }

            v23 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
            v24 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
            -[NSDateFormatter setLocale:](v23, "setLocale:", v24);

            -[NSDateFormatter setDateFormat:](v23, "setDateFormat:", @"EEE, dd MMM yyyy HH:mm:ss Z");
            uint64_t v25 = objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v23, "dateFromString:", v19));
            v26 = (void *)v25;
            if (v25
              || (uint64_t v41 = (uint64_t)[v19 longLongValue], v41 >= 1)
              && (uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v41)),  (v26 = (void *)v25) != 0LL))
            {
              uint64_t v27 = CloudServicesLog(v25);
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                sub_1000446E0((uint64_t)v26, v28);
              }

              [v17 setObject:v26 forKeyedSubscript:@"retryAfterDate"];
            }
          }
        }

        uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EscrowProxyErrorDomain",  v13,  v17));
        error = v10->_error;
        v10->_error = (NSError *)v29;
      }
    }

    id v43 = 0LL;
    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[LakituResponse _parsePlistFromData:error:](v10, "_parsePlistFromData:error:", v8, &v43));
    id v32 = v43;
    id v33 = v43;
    responseDictionary = v10->_responseDictionary;
    v10->_responseDictionary = (NSDictionary *)v31;

    if (!v10->_responseDictionary)
    {
      p_error = (id *)&v10->_error;
      if ((id)-[NSError code](v10->_error, "code") != (id)503 && [*p_error code] != (id)429)
      {
        v36 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
        uint64_t v37 = CloudServicesLog(v36);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100044610((uint64_t)v10, (uint64_t)v36, v38);
        }

        if (sub_1000052A8())
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
          v40 = v39;
          if (v33) {
            [v39 logUnrecoverableError:v33 forEvent:CloudServicesAnalyticsLakituResponse withAttributes:0];
          }
          else {
            [v39 logSuccessForEvent:CloudServicesAnalyticsLakituResponse];
          }
        }

        if (!*p_error) {
          objc_storeStrong((id *)&v10->_error, v32);
        }
      }
    }
  }

  return v10;
}

- (LakituResponse)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LakituResponse;
  v6 = -[LakituResponse init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (LakituResponse)initWithResponseDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LakituResponse;
  v6 = -[LakituResponse init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_responseDictionary, a3);
  }

  return v7;
}

- (NSString)requestUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse httpResponse](self, "httpResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allHeaderFields]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"X-Apple-Request-UUID"]);

  return (NSString *)v4;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void).cxx_destruct
{
}

@end