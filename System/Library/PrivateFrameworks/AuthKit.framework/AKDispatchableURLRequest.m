@interface AKDispatchableURLRequest
- (AKAuthHandler)authenticationHandler;
- (AKDispatchableURLRequest)initWithURLRequestProvider:(id)a3 authenticationHandler:(id)a4 completionHandler:(id)a5;
- (AKURLRequestProvider)urlRequestProvider;
- (NSDictionary)additionalHeaders;
- (NSDictionary)dispatchingInfo;
- (id)_addingAdditionalHeaders:(id)a3 forURLRequest:(id)a4;
- (id)_urlSession;
- (int64_t)responseCode;
- (void)_executeAllowingReauthentication:(BOOL)a3 completion:(id)a4;
- (void)_executeURLRequest:(id)a3 withSession:(id)a4 completion:(id)a5;
- (void)_reauthenticateAndExecuteWithCompletion:(id)a3;
- (void)_reauthenticateWithCompletion:(id)a3;
- (void)executeWithResponseHandler:(id)a3;
- (void)handleResponseCode;
- (void)invalidateWithError:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setResponseCode:(int64_t)a3;
@end

@implementation AKDispatchableURLRequest

- (AKDispatchableURLRequest)initWithURLRequestProvider:(id)a3 authenticationHandler:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___AKDispatchableURLRequest;
  v12 = -[AKDispatchableURLRequest init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_urlRequestProvider, a3);
    objc_storeStrong((id *)&v13->_authenticationHandler, a4);
    id v14 = objc_retainBlock(v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;
  }

  return v13;
}

- (NSDictionary)dispatchingInfo
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 3LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"capp");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 concreteAuthenticationContext]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 concreteAuthenticationContext]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _proxiedAppName]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"papp");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 concreteAuthenticationContext]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 serviceType]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"svct");
  }

  id v15 = -[NSMutableDictionary copy](v3, "copy");

  return (NSDictionary *)v15;
}

- (void)executeWithResponseHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100038434;
  v4[3] = &unk_1001C7D20;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[AKDispatchableURLRequest _executeAllowingReauthentication:completion:]( v5,  "_executeAllowingReauthentication:completion:",  1LL,  v4);
}

- (void)handleResponseCode
{
  int64_t v3 = -[AKDispatchableURLRequest responseCode](self, "responseCode");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  +[AKCommonResponseCodeHandler handleResponseCode:altDSID:]( &OBJC_CLASS___AKCommonResponseCodeHandler,  "handleResponseCode:altDSID:",  v3,  v5);
}

- (void)invalidateWithError:(id)a3
{
}

- (id)_urlSession
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
  unsigned int v4 = [v3 _denyVirtualInterfaces];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKURLSession sharedURLSessionWithDenyVirtualInterfaces]( &OBJC_CLASS___AKURLSession,  "sharedURLSessionWithDenyVirtualInterfaces"));
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
    unsigned int v7 = [v6 shouldCacheResource];

    if (v7) {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKURLSession sharedCacheEnabledURLSession]( &OBJC_CLASS___AKURLSession,  "sharedCacheEnabledURLSession"));
    }
    else {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](&OBJC_CLASS___AKURLSession, "sharedURLSession"));
    }
  }

  return v5;
}

- (void)_executeAllowingReauthentication:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000386B4;
  v9[3] = &unk_1001C7D70;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  [v7 buildRequestWithCompletion:v9];
}

- (void)_executeURLRequest:(id)a3 withSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100132530(self, (uint64_t)v8, v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest additionalHeaders](self, "additionalHeaders"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKDispatchableURLRequest _addingAdditionalHeaders:forURLRequest:]( self,  "_addingAdditionalHeaders:forURLRequest:",  v13,  v8));

  uint64_t v16 = _AKLogSystem(v15);
  objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1001324B0((uint64_t)self, (uint64_t)v14, v17);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100038ADC;
  v20[3] = &unk_1001C7668;
  v20[4] = self;
  id v21 = v10;
  id v18 = v10;
  id v19 = [v9 beginAuthenticationDataTaskWithRequest:v14 completionHandler:v20];
}

- (void)_reauthenticateAndExecuteWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100038CD4;
  v4[3] = &unk_1001C7460;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[AKDispatchableURLRequest _reauthenticateWithCompletion:](v5, "_reauthenticateWithCompletion:", v4);
}

- (void)_reauthenticateWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(id, void, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest authenticationHandler](self, "authenticationHandler"));

  if (v5)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest authenticationHandler](self, "authenticationHandler"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest urlRequestProvider](self, "urlRequestProvider"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 concreteAuthenticationContext]);
    id v21 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 buildReauthenticationContextFromContext:v9 error:&v21]);
    id v11 = v21;

    if (v11)
    {
      v4[2](v4, 0LL, v11);
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKDispatchableURLRequest authenticationHandler](self, "authenticationHandler"));

      [v20 reauthenticateWithContext:v10 completion:v4];
      id v11 = v20;
    }
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v6);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001323D0((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
    }

    v4[2](v4, 0LL, 0LL);
  }
}

- (id)_addingAdditionalHeaders:(id)a3 forURLRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100038F9C;
    v10[3] = &unk_1001C7618;
    id v11 = [v6 mutableCopy];
    id v7 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
    id v8 = [v7 copy];
  }

  else
  {
    id v8 = v6;
  }

  return v8;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (AKURLRequestProvider)urlRequestProvider
{
  return self->_urlRequestProvider;
}

- (AKAuthHandler)authenticationHandler
{
  return self->_authenticationHandler;
}

- (void).cxx_destruct
{
}

  ;
}

@end