@interface PDWebServiceConnectionTask
+ (BOOL)supportsSecureCoding;
- (NSString)passTypeIdentifier;
- (PDWebService)webService;
- (PDWebServiceConnectionTask)initWithCoder:(id)a3;
- (PDWebServiceConnectionTask)initWithWebService:(id)a3;
- (id)bodyDictionary;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (id)request;
- (id)teamIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)reportAuthenticationFailure;
- (void)reportMalformedResponseError:(id)a3;
- (void)reportNSURLConnectionError:(id)a3;
- (void)reportUnexpectedResponseCode:(int64_t)a3;
@end

@implementation PDWebServiceConnectionTask

- (PDWebServiceConnectionTask)initWithWebService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDWebServiceConnectionTask;
  v6 = -[PDNetworkTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webService, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWebServiceConnectionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDWebServiceConnectionTask;
  v6 = -[PDNetworkTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PDWebService, v5),  @"webService");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    webService = v6->_webService;
    v6->_webService = (PDWebService *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDWebServiceConnectionTask;
  id v4 = a3;
  -[PDNetworkTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_webService, @"webService", v5.receiver, v5.super_class);
}

- (id)request
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceURL]);

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask endpointComponents](self, "endpointComponents"));
  id v6 = [v5 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v66;
    do
    {
      objc_super v9 = 0LL;
      v10 = v4;
      do
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v11 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLPathAllowedCharacterSet"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAddingPercentEncodingWithAllowedCharacters:v12]);
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v13]);

        objc_super v9 = (char *)v9 + 1;
        v10 = v4;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }

    while (v7);
  }

  v52 = self;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask queryFields](self, "queryFields"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  obj = (void *)objc_claimAutoreleasedReturnValue([v54 allKeys]);
  id v14 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v62;
    v17 = @"?";
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAddingPercentEncodingWithAllowedCharacters:v20]);

        v22 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKey:v19]);
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAddingPercentEncodingWithAllowedCharacters:v23]);

        [v55 appendFormat:@"%@%@=%@", v17, v21, v24];
        v17 = @"&";
      }

      id v15 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
    }

    while (v15);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v51 stringByAppendingString:v55]);
  uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v25));

  if (PKDeveloperLoggingEnabled(v27)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100441F8C(v52);
  }

  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask method](v52, "method"));
    *(_DWORD *)buf = 138412546;
    v71 = v30;
    __int16 v72 = 2112;
    uint64_t v73 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Generating %@ request with URL <%@>",  buf,  0x16u);
  }

  v50 = (void *)v26;
  v31 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask method](v52, "method"));
  -[NSMutableURLRequest setHTTPMethod:](v31, "setHTTPMethod:", v32);

  -[NSMutableURLRequest setHTTPShouldHandleCookies:](v31, "setHTTPShouldHandleCookies:", 0LL);
  -[NSMutableURLRequest setCachePolicy:](v31, "setCachePolicy:", 1LL);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask headerFields](v52, "headerFields"));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 allKeys]);
  id v35 = [v34 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:v39]);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v31, "setValue:forHTTPHeaderField:", v40, v39);

        if (PKDeveloperLoggingEnabled(v41)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:v39]);
          *(_DWORD *)buf = 138412546;
          v71 = v39;
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v43;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Request contains header field <%@: %@>",  buf,  0x16u);
        }

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:v39]);
          *(_DWORD *)buf = 138412546;
          v71 = v39;
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v42;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Request contains header field <%@: %@>",  buf,  0x16u);
        }
      }

      id v36 = [v34 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }

    while (v36);
  }

  uint64_t v44 = objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask bodyDictionary](v52, "bodyDictionary"));
  v45 = (void *)v44;
  if (v44)
  {
    if (PKDeveloperLoggingEnabled(v44)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100441F14((uint64_t)v45);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Request contains body dictionary %@",  buf,  0xCu);
    }

    id v56 = 0LL;
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v45,  0LL,  &v56));
    id v48 = v56;
    if (!v46) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Could not create json data for %@: %@",  objc_opt_class(v52, v47),  v48);
    }
    -[NSMutableURLRequest setHTTPBody:](v31, "setHTTPBody:", v46);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v31,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  }

  return v31;
}

- (void)reportAuthenticationFailure
{
  id v7 = PDTaskError(0LL, self, 0LL, @"Authentication failure", v2, v3, v4, v5, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[PDNetworkTask reportError:](self, "reportError:", v9);
}

- (void)reportUnexpectedResponseCode:(int64_t)a3
{
  id v8 = PDTaskError(1LL, self, 0LL, @"Unexpected response code %ld", v3, v4, v5, v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[PDNetworkTask reportError:](self, "reportError:", v9);
}

- (void)reportNSURLConnectionError:(id)a3
{
  id v8 = PDTaskError(2LL, self, a3, @"Connection error", v3, v4, v5, v6, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[PDNetworkTask reportError:](self, "reportError:", v10);
}

- (void)reportMalformedResponseError:(id)a3
{
  id v8 = PDTaskError(3LL, self, a3, @"Server response was malformed", v3, v4, v5, v6, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[PDNetworkTask reportError:](self, "reportError:", v10);
}

- (id)method
{
  return 0LL;
}

- (id)endpointComponents
{
  return 0LL;
}

- (id)queryFields
{
  return 0LL;
}

- (id)headerFields
{
  return 0LL;
}

- (id)bodyDictionary
{
  return 0LL;
}

- (NSString)passTypeIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 passTypeIdentifier]);

  return (NSString *)v3;
}

- (id)teamIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 teamIdentifier]);

  return v3;
}

- (PDWebService)webService
{
  return self->_webService;
}

- (void).cxx_destruct
{
}

@end