@interface LakituRequest
- (BOOL)pinningFailure;
- (Class)responseClass;
- (NSMutableURLRequest)urlRequest;
- (NSNumber)protocolVersion;
- (NSString)loggingDescription;
- (NSString)urlString;
- (OS_dispatch_queue)queue;
- (OS_os_activity)activity;
- (id)additionalHeaders;
- (id)authorizationHeader;
- (id)bodyDictionary;
- (id)credential;
- (id)protectionSpace;
- (id)sessionConfig;
- (id)validateInput;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)performRequestWithHandler:(id)a3;
- (void)setActivity:(id)a3;
- (void)setPinningFailure:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation LakituRequest

- (NSString)loggingDescription
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (NSNumber)protocolVersion
{
  return (NSNumber *)&off_10006DB28;
}

- (id)bodyDictionary
{
  return 0LL;
}

- (id)authorizationHeader
{
  return 0LL;
}

- (id)additionalHeaders
{
  return &__NSDictionary0__struct;
}

- (id)validateInput
{
  if (qword_100078FF0)
  {
    id v2 = [(id)qword_100078FF0 timeIntervalSinceNow];
    double v4 = v3;
    uint64_t v5 = CloudServicesLog(v2);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v6;
    if (v4 <= 0.0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "clearing retry-after date", buf, 2u);
      }

      v9 = 0LL;
      v8 = (void *)qword_100078FF0;
      qword_100078FF0 = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100047288(v7);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  qword_100078FF0));
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  304LL,  @"retry-after date has not passed, throttling calls to escrow proxy until %@",  v8));
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)credential
{
  return 0LL;
}

- (id)protectionSpace
{
  return 0LL;
}

- (NSMutableURLRequest)urlRequest
{
  double v3 = objc_alloc(&OBJC_CLASS___NSURL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest urlString](self, "urlString"));
  uint64_t v5 = -[NSURL initWithString:](v3, "initWithString:", v4);

  if (v5)
  {
    v6 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v5);
    -[NSMutableURLRequest ak_addDeviceUDIDHeader](v6, "ak_addDeviceUDIDHeader");
    -[NSMutableURLRequest ak_addClientInfoHeader](v6, "ak_addClientInfoHeader");
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (os_activity_s *)objc_claimAutoreleasedReturnValue(-[LakituRequest activity](self, "activity"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FC48;
  block[3] = &unk_1000698B8;
  id v21 = v11;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v13;
  id v19 = v11;
  os_activity_apply(v15, block);
}

- (id)sessionConfig
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  id v4 = objc_alloc_init(&OBJC_CLASS___AKAppleIDSession);
  objc_msgSend(v3, "set_appleIDContext:", v4);

  objc_msgSend(v3, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleEscrowProxyService);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"application/x-apple-plist",  @"Content-Type");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest authorizationHeader](self, "authorizationHeader"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"Authorization");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest additionalHeaders](self, "additionalHeaders"));
  -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v7);

  [v3 setHTTPAdditionalHeaders:v5];
  return v3;
}

- (void)performRequestWithHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest validateInput](self, "validateInput"));
  if (v5)
  {
    v4[2](v4, 0LL, v5);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest sessionConfig](self, "sessionConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v6,  self,  0LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest urlRequest](self, "urlRequest"));
    os_activity_t v9 = _os_activity_create( (void *)&_mh_execute_header,  "start data task",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    -[LakituRequest setActivity:](self, "setActivity:", v9);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000300E0;
    v15[3] = &unk_100069930;
    os_activity_t v16 = v9;
    id v17 = self;
    id v18 = v4;
    v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dataTaskWithRequest:v8 completionHandler:v15]);
    uint64_t v12 = CloudServicesLog(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest loggingDescription](self, "loggingDescription"));
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: starting escrow proxy request (%@)",  buf,  0x16u);
    }

    [v11 resume];
    [v7 finishTasksAndInvalidate];
  }
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)pinningFailure
{
  return self->_pinningFailure;
}

- (void)setPinningFailure:(BOOL)a3
{
  self->_pinningFailure = a3;
}

- (void).cxx_destruct
{
}

@end