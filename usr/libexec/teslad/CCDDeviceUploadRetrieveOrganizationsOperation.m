@interface CCDDeviceUploadRetrieveOrganizationsOperation
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7;
@end

@implementation CCDDeviceUploadRetrieveOrganizationsOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  id v9 = a3;
  v12 = v9;
  *a6 = 0;
  if (v9)
  {
    v13 = *(void **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
      int v21 = 138543362;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Response: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v12,  1LL,  a7));
    if (v17)
    {
      v18 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v16);
      [v18 setObject:v17 forKeyedSubscript:kDEPDeviceUploadOrganizationsKey];
      id v19 = [v18 copy];
    }

    else
    {
      id v19 = 0LL;
    }
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

@end