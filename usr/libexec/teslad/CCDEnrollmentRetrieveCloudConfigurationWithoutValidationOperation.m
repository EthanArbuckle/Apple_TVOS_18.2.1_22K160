@interface CCDEnrollmentRetrieveCloudConfigurationWithoutValidationOperation
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentRetrieveCloudConfigurationWithoutValidationOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v6 = a3;
  id v7 = [a4 containsString:@"text/plain"];
  if ((_DWORD)v7)
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[CCDError cloudConfigErrorInResponse:]( &OBJC_CLASS___CCDError,  "cloudConfigErrorInResponse:",  v6));
    v13 = *(os_log_s **)(DEPLogObjects(v10, v11, v12) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Got 200 response with error: %@", buf, 0xCu);
    }

    v24 = @"Response";
    id v25 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  }

  else
  {
    v15 = *(void **)(DEPLogObjects(v7, v8, v9) + 8);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = v15;
      v17 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v6, 4LL);
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);
    }

    id v23 = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v23));
    v18 = (NSString *)v23;
    v10 = v18;
    if (v18)
    {
      v21 = *(os_log_s **)(DEPLogObjects(v18, v19, v20) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }
    }
  }

  return v14;
}

@end