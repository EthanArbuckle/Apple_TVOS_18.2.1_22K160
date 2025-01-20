@interface SHAMSEndpointRequester
- (AMSMediaRequestEncoder)encoder;
- (AMSURLSession)session;
- (BOOL)isTokenFailureError:(id)a3;
- (NSString)clientIdentifier;
- (SHAMSEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4;
- (id)buildEncoderForSession:(id)a3 clientType:(int64_t)a4 clientIdentifier:(id)a5;
- (id)sessionConfiguration;
- (int64_t)clientType;
- (void)handleResultData:(id)a3 forResponse:(id)a4 callback:(id)a5 error:(id)a6;
- (void)invalidate;
- (void)performDownloadRequest:(id)a3 filename:(id)a4 fileType:(id)a5 reply:(id)a6;
- (void)performRequest:(id)a3 withReply:(id)a4;
- (void)setClientIdentifier:(id)a3;
- (void)setClientType:(int64_t)a3;
- (void)setSession:(id)a3;
@end

@implementation SHAMSEndpointRequester

- (SHAMSEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SHAMSEndpointRequester;
  v8 = -[SHAMSEndpointRequester init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientIdentifier, a3);
    v9->_clientType = a4;
    v10 = objc_alloc(&OBJC_CLASS___AMSURLSession);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAMSEndpointRequester sessionConfiguration](v9, "sessionConfiguration"));
    v12 = -[AMSURLSession initWithConfiguration:](v10, "initWithConfiguration:", v11);
    session = v9->_session;
    v9->_session = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[SHAMSEndpointRequester buildEncoderForSession:clientType:clientIdentifier:]( v9,  "buildEncoderForSession:clientType:clientIdentifier:",  v9->_session,  v9->_clientType,  v9->_clientIdentifier));
    encoder = v9->_encoder;
    v9->_encoder = (AMSMediaRequestEncoder *)v14;
  }

  return v9;
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SHAMSEndpointRequester session](self, "session"));
  [v2 invalidateAndCancel];
}

- (void)handleResultData:(id)a3 forResponse:(id)a4 callback:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    v13 = (SHNetworkResponse *)a5;
    uint64_t v14 = -[SHNetworkResponse initWithData:urlResponse:error:]( objc_alloc(&OBJC_CLASS___SHNetworkResponse),  "initWithData:urlResponse:error:",  v10,  v11,  0LL);
    (*((void (**)(SHNetworkResponse *, SHNetworkResponse *))a5 + 2))(v13, v14);
  }

  else
  {
    v15 = (void (**)(id, SHNetworkResponse *))a5;
    uint64_t v16 = sh_log_object(v15);
    objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch data task %@", buf, 0xCu);
    }

    if (-[SHAMSEndpointRequester isTokenFailureError:](self, "isTokenFailureError:", v12))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHAMSEndpointRequester clientIdentifier](self, "clientIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Please check that you have enabled the ShazamKit App Service for this app identifier (%@)",  v18));

      NSErrorUserInfoKey v21 = NSDebugDescriptionErrorKey;
      v22 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      uint64_t v14 = (SHNetworkResponse *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  202LL,  v12,  v20));
    }

    else
    {
      uint64_t v14 = (SHNetworkResponse *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  500LL,  v12));
    }

    v13 = -[SHNetworkResponse initWithData:urlResponse:error:]( objc_alloc(&OBJC_CLASS___SHNetworkResponse),  "initWithData:urlResponse:error:",  0LL,  0LL,  v14);
    v15[2](v15, v13);
  }
}

- (BOOL)isTokenFailureError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)performRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAMSEndpointRequester encoder](self, "encoder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestByEncodingRequest:v6 parameters:0]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000DEB4;
  v11[3] = &unk_10006CF80;
  id v10 = v7;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  [v9 addFinishBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)performDownloadRequest:(id)a3 filename:(id)a4 fileType:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHAMSEndpointRequester encoder](self, "encoder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 requestByEncodingRequest:v10 parameters:0]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000E2B8;
  v19[3] = &unk_10006CFD0;
  id v16 = v13;
  id v22 = v16;
  objc_copyWeak(&v23, &location);
  id v17 = v11;
  id v20 = v17;
  id v18 = v12;
  id v21 = v18;
  [v15 addFinishBlock:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (id)sessionConfiguration
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v2 setTimeoutIntervalForRequest:30.0];
  [v2 setWaitsForConnectivity:0];
  [v2 setDiscretionary:0];
  return v2;
}

- (id)buildEncoderForSession:(id)a3 clientType:(int64_t)a4 clientIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc(&OBJC_CLASS___AMSMediaTokenService);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 amsBag]);
  id v12 = [v9 initWithClientIdentifier:v8 bag:v11];

  [v12 setSession:v7];
  if (a4 == 1)
  {
    uint64_t v13 = 0LL;
    goto LABEL_5;
  }

  if (a4 == 2)
  {
    uint64_t v13 = 1LL;
LABEL_5:
    [v12 setClientType:v13];
  }

  id v14 = [[AMSMediaProtocolHandler alloc] initWithTokenService:v12];
  [v7 setProtocolHandler:v14];
  v15 = objc_alloc(&OBJC_CLASS___AMSMediaRequestEncoder);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 amsBag]);
  id v18 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v15, "initWithTokenService:bag:", v12, v17);

  return v18;
}

- (AMSMediaRequestEncoder)encoder
{
  return self->_encoder;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end