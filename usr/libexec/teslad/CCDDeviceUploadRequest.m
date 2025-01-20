@interface CCDDeviceUploadRequest
- (CCDDeviceUploadRequest)requestWithError:(id *)a3;
- (DEPDeviceUploadCredentials)userCredentials;
- (NSDictionary)requestBody;
- (NSString)endpointPath;
- (NSString)httpMethod;
- (id)_contentType;
- (id)_endpointURL;
- (id)_requestBodyData;
- (id)_requestHeader;
- (int64_t)requestType;
- (void)setUserCredentials:(id)a3;
@end

@implementation CCDDeviceUploadRequest

- (NSString)endpointPath
{
  return 0LL;
}

- (NSString)httpMethod
{
  return 0LL;
}

- (NSDictionary)requestBody
{
  return 0LL;
}

- (id)_contentType
{
  return @"application/json";
}

- (id)_requestHeader
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest userCredentials](self, "userCredentials"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest userCredentials](self, "userCredentials"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dsid]);
    [v3 setObject:v6 forKeyedSubscript:kDEPDeviceUploadUserDsidHeaderKey];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest userCredentials](self, "userCredentials"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dsToken]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([@"myacinfo=" stringByAppendingString:v8]);
    [v3 setObject:v9 forKeyedSubscript:kDEPDeviceUploadCookieHeaderKey];
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)_endpointURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest endpointPath](self, "endpointPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest endpointPath](self, "endpointPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([@"https://eesupportapp.isu.apple.com" stringByAppendingString:v4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)_requestBodyData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest requestBody](self, "requestBody"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest requestBody](self, "requestBody"));
    id v12 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v4,  0LL,  &v12));
    id v6 = v12;

    if (v6)
    {
      id v10 = *(os_log_s **)(DEPLogObjects(v7, v8, v9) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error serializing data: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (CCDDeviceUploadRequest)requestWithError:(id *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _endpointURL](self, "_endpointURL"));
  id v6 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( v4,  "initWithURL:cachePolicy:timeoutInterval:",  v5,  0LL,  30.0);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest httpMethod](self, "httpMethod"));
  -[NSMutableURLRequest setHTTPMethod:](v6, "setHTTPMethod:", v7);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestHeader](self, "_requestHeader", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestHeader](self, "_requestHeader"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v6, "setValue:forHTTPHeaderField:", v15, v13);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _contentType](self, "_contentType"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _contentType](self, "_contentType"));
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v6, "setValue:forHTTPHeaderField:", v17, @"Content-Type");
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestBodyData](self, "_requestBodyData"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestBodyData](self, "_requestBodyData"));
    -[NSMutableURLRequest setHTTPBody:](v6, "setHTTPBody:", v19);
  }

  return (CCDDeviceUploadRequest *)v6;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (DEPDeviceUploadCredentials)userCredentials
{
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
}

- (void).cxx_destruct
{
}

@end