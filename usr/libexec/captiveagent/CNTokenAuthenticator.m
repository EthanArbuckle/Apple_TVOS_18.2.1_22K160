@interface CNTokenAuthenticator
+ (id)sessionConfiguration;
+ (id)tokenAuthServerDiscoveryURL;
- (BOOL)parseChallenge:(id)a3 outRealm:(id *)a4 outErrorCode:(id *)a5 outErrorDescription:(id *)a6;
- (CNTokenAuthenticator)initWithURLString:(id)a3 token:(id)a4 queue:(id)a5 responseHandler:(id)a6;
- (NSData)token;
- (NSMutableData)receivedData;
- (NSOperationQueue)opQueue;
- (NSString)interfaceName;
- (NSString)userAgent;
- (NSURL)url;
- (NSURLSession)session;
- (NSURLSessionDataTask)loginDataTask;
- (id)authResult:(id)a3;
- (id)credentialForBearerChallenge:(id)a3;
- (id)locationFromResponse:(id)a3;
- (id)responseHandler;
- (unsigned)resultCodeFromError:(id)a3;
- (unsigned)timeoutSeconds;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)cancel;
- (void)dealloc;
- (void)handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)handleChallengeResponse:(id)a3;
- (void)handleRedirectResponse:(id)a3;
- (void)handleResponse:(unsigned int)a3 result:(id)a4;
- (void)handleTaskCompletion;
- (void)login;
- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4;
- (void)setInterfaceName:(id)a3;
- (void)setLoginDataTask:(id)a3;
- (void)setOpQueue:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)setTimeoutSeconds:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)start;
@end

@implementation CNTokenAuthenticator

- (CNTokenAuthenticator)initWithURLString:(id)a3 token:(id)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CNTokenAuthenticator;
  v14 = -[CNTokenAuthenticator init](&v23, "init");
  if (!v14) {
    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_5;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
  -[CNTokenAuthenticator setUrl:](v14, "setUrl:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](v14, "url"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 scheme]);
  id v18 = [v17 compare:@"https" options:1];

  if (v18)
  {
LABEL_4:
    v19 = 0LL;
  }

  else
  {
LABEL_5:
    -[CNTokenAuthenticator setToken:](v14, "setToken:", v11);
    v20 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[CNTokenAuthenticator setOpQueue:](v14, "setOpQueue:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](v14, "opQueue"));
    [v21 setUnderlyingQueue:v12];

    -[CNTokenAuthenticator setResponseHandler:](v14, "setResponseHandler:", v13);
    *(_WORD *)&v14->_isAuthorized = 0;
    v19 = v14;
  }

  return v19;
}

- (void)dealloc
{
  os_log_t v3 = sub_1000021D4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_log_type_t v5 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "dealloced", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CNTokenAuthenticator;
  -[CNTokenAuthenticator dealloc](&v6, "dealloc");
}

- (void)login
{
  if (!self->_session)
  {
    os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CNTokenAuthenticator sessionConfiguration]( &OBJC_CLASS___CNTokenAuthenticator,  "sessionConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
    os_log_type_t v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  self,  v4));
    session = self->_session;
    self->_session = v5;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
  if (-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds")) {
    double v8 = (double)-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds");
  }
  else {
    double v8 = 60.0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v7,  4LL,  v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator userAgent](self, "userAgent"));
  [v9 setValue:v10 forHTTPHeaderField:@"User-Agent"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator interfaceName](self, "interfaceName"));
  [v9 setBoundInterfaceIdentifier:v11];

  id v12 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v9));
  loginDataTask = self->_loginDataTask;
  self->_loginDataTask = v12;

  os_log_t v14 = sub_1000021D4();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  os_log_type_t v16 = _SC_syslog_os_log_mapping(7LL);
  v17 = v15;
  if (os_log_type_enabled(v17, v16))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);
    int v20 = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    objc_super v23 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  v16,  "%@ starting token based captive portal authentication with url: [%@]",  (uint8_t *)&v20,  0x16u);
  }

  -[NSURLSessionDataTask resume](self->_loginDataTask, "resume");
}

- (void)start
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator url](self, "url"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[CNTokenAuthenticator tokenAuthServerDiscoveryURL]( &OBJC_CLASS___CNTokenAuthenticator,  "tokenAuthServerDiscoveryURL"));
  }
  os_log_type_t v5 = (void *)v4;
  -[CNTokenAuthenticator setUrl:](self, "setUrl:", v4);

  -[CNTokenAuthenticator login](self, "login");
}

- (void)cancel
{
  session = self->_session;
  if (session)
  {
    -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
    uint64_t v4 = self->_session;
    self->_session = 0LL;
  }

  loginDataTask = self->_loginDataTask;
  self->_loginDataTask = 0LL;
}

+ (id)sessionConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v2 setHTTPCookieStorage:0];
  [v2 setURLCache:0];
  [v2 setURLCredentialStorage:0];
  objc_msgSend(v2, "set_enableOAuthBearerTokenChallenges:", 1);
  return v2;
}

+ (id)tokenAuthServerDiscoveryURL
{
  return +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"http://captive.apple.com/hotspot-detect.html");
}

- (id)locationFromResponse:(id)a3
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allHeaderFields]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Location"]);

  return v4;
}

- (void)handleRedirectResponse:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator locationFromResponse:](self, "locationFromResponse:", a3));
  os_log_t v5 = sub_1000021D4();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (v4)
  {
    os_log_type_t v7 = _SC_syslog_os_log_mapping(7LL);
    if (os_log_type_enabled(v6, v7))
    {
      int v14 = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "%@ task received HTTP Redirect with location header: [%@]",  (uint8_t *)&v14,  0x16u);
    }

    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s scheme](v6, "scheme"));
    id v9 = [v8 compare:@"https" options:1];

    if (v9)
    {
      os_log_t v10 = sub_1000021D4();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = _SC_syslog_os_log_mapping(7LL);
      if (os_log_type_enabled(v11, v12))
      {
        int v14 = 138412290;
        v15 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "%@ task found location without https scheme",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

  else
  {
    os_log_type_t v13 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v6, v13))
    {
      int v14 = 138412290;
      v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v13,  "%@ task received HTTP Redirect without location header",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (unsigned)resultCodeFromError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned int v6 = [v5 isEqualToString:NSURLErrorDomain];

    if (v6)
    {
      id v7 = [v4 code];
      switch((unint64_t)v7)
      {
        case 0xFFFFFFFFFFFFFC0FLL:
        case 0xFFFFFFFFFFFFFC13LL:
          unsigned int v8 = 8;
          break;
        case 0xFFFFFFFFFFFFFC10LL:
        case 0xFFFFFFFFFFFFFC11LL:
        case 0xFFFFFFFFFFFFFC14LL:
        case 0xFFFFFFFFFFFFFC16LL:
          goto LABEL_9;
        case 0xFFFFFFFFFFFFFC12LL:
        case 0xFFFFFFFFFFFFFC15LL:
          unsigned int v8 = 7;
          break;
        case 0xFFFFFFFFFFFFFC17LL:
          unsigned int v8 = 6;
          break;
        default:
          if (v7 != (id)-1202LL) {
            goto LABEL_9;
          }
          unsigned int v8 = 15;
          break;
      }
    }

    else
    {
LABEL_9:
      unsigned int v8 = 13;
    }
  }

  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator responseHandler](self, "responseHandler"));

  if (v6)
  {
    id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[CNTokenAuthenticator responseHandler]( self,  "responseHandler"));
    ((void (**)(void, uint64_t, id))v7)[2](v7, v4, v8);
  }

  -[CNTokenAuthenticator cancel](self, "cancel");
}

- (void)handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v47 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  v46 = v8;
  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authenticationMethod]);
  os_log_t v12 = sub_1000021D4();
  os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  os_log_type_t v14 = _SC_syslog_os_log_mapping(7LL);
  v15 = v13;
  if (os_log_type_enabled(v15, v14))
  {
    *(_DWORD *)buf = 138412546;
    v52 = (CNTokenAuthenticator *)objc_opt_class(self);
    __int16 v53 = 2114;
    v54 = v11;
    __int16 v16 = v52;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  v14,  "%@ received authentication challenege with %{public}@",  buf,  0x16u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v47 currentRequest]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URL]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 scheme]);
  unsigned int v20 = [v19 isEqualToString:@"https"];

  unsigned int v21 = [v11 isEqualToString:NSURLAuthenticationMethodOAuthBearerToken];
  int v22 = v21 ^ 1;
  if (!self->_tokenAuthAttempted && (v22 & 1) == 0 && ((v20 ^ 1) & 1) == 0)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator credentialForBearerChallenge:](self, "credentialForBearerChallenge:", v46));
    goto LABEL_7;
  }

  if (![v11 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    int v40 = 17;
    goto LABEL_28;
  }

  os_log_t v32 = sub_1000021D4();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  os_log_type_t v34 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v33, v34))
  {
    *(_DWORD *)buf = 138412290;
    v52 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "%@ received authentication challenege to trust server certificate",  buf,  0xCu);
  }

  BOOL v35 = SecTrustEvaluateWithError((SecTrustRef)[v10 serverTrust], 0);
  os_log_t v36 = sub_1000021D4();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  os_log_type_t v38 = _SC_syslog_os_log_mapping(7LL);
  BOOL v39 = os_log_type_enabled(v37, v38);
  if (!v35)
  {
    if (v39)
    {
      *(_DWORD *)buf = 138412290;
      v52 = self;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ failed to trust server certificate", buf, 0xCu);
    }

    int v40 = 15;
LABEL_28:
    v24 = 0LL;
    if (((v20 | v22) & 1) != 0)
    {
LABEL_32:
      v9[2](v9, 2LL, 0LL);
      objc_initWeak((id *)buf, self);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
      v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v44 underlyingQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004A98;
      block[3] = &unk_100010750;
      objc_copyWeak(&v49, (id *)buf);
      int v50 = v40;
      dispatch_async(v45, block);

      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)buf);
      goto LABEL_33;
    }

- (id)credentialForBearerChallenge:(id)a3
{
  id v4 = a3;
  if (!-[NSData length](self->_token, "length")) {
    goto LABEL_4;
  }
  os_log_t v5 = objc_alloc(&OBJC_CLASS___NSString);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator token](self, "token"));
  id v7 = -[NSString initWithData:encoding:](v5, "initWithData:encoding:", v6, 4LL);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 protectionSpace]);
  OAuth2 = (const void *)_CFURLCredentialCreateOAuth2(0, v7, [v8 realm]);

  if (OAuth2)
  {
    id v10 = -[NSURLCredential _initWithCFURLCredential:]( objc_alloc(&OBJC_CLASS___NSURLCredential),  "_initWithCFURLCredential:",  OAuth2);
    CFRelease(OAuth2);
  }

  else
  {
LABEL_4:
    id v10 = 0LL;
  }

  return v10;
}

- (void)handleResponse:(unsigned int)a3 result:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 underlyingQueue]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004CAC;
  v10[3] = &unk_100010778;
  objc_copyWeak(&v12, &location);
  unsigned int v13 = a3;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)parseChallenge:(id)a3 outRealm:(id *)a4 outErrorCode:(id *)a5 outErrorDescription:(id *)a6
{
  id v9 = a3;
  id v10 = v9;
  if (!v9
    || (unint64_t)[v9 length] < 0xE
    || [v10 rangeOfString:@"Bearer"] == (id)0x7FFFFFFFFFFFFFFFLL
    || [v10 rangeOfString:@"realm="] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = 0;
  }

  else
  {
    *a6 = 0LL;
    *a5 = 0LL;
    *a4 = 0LL;
    unsigned int v13 = [v10 rangeOfString:@"realm="];
    v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "substringWithRange:",  &v13[v14],  (_BYTE *)objc_msgSend(v10, "length") - &v13[v14]));
    if ((unint64_t)[v15 length] >= 3)
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"^().*()",  1LL,  0LL));
      if (v16)
      {
        id v18 = objc_msgSend(v16, "rangeOfFirstMatchInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
        if (v18 != (id)0x7FFFFFFFFFFFFFFFLL || (id v19 = 0LL, v17)) {
          id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v18, v17));
        }
        if ((unint64_t)objc_msgSend(v19, "length", v18) >= 3)
        {
          id v19 = v19;
          *a4 = v19;
          unsigned int v20 = [v15 rangeOfString:@"error="];
          if (v20 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v11 = 1;
          }

          else
          {
            int v22 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "substringWithRange:",  &v20[v21],  (_BYTE *)objc_msgSend(v15, "length") - &v20[v21]));
            id v23 = objc_msgSend( v16,  "rangeOfFirstMatchInString:options:range:",  v22,  0,  0,  objc_msgSend(v22, "length"));
            uint64_t v25 = v24;

            if (v23 != (id)0x7FFFFFFFFFFFFFFFLL || (id v19 = 0LL, v25))
            {
              id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", v23, v25));
              NSLog(@"substringForFirstMatch: [%@]", v19);
            }

            if ((unint64_t)[v19 length] >= 3)
            {
              id v19 = v19;
              *a5 = v19;
              os_log_t v26 = [v22 rangeOfString:@"error_description="];
              os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v22,  "substringWithRange:",  &v26[v27],  (_BYTE *)objc_msgSend(v22, "length") - &v26[v27]));
              id v29 = objc_msgSend( v16,  "rangeOfFirstMatchInString:options:range:",  v28,  0,  0,  objc_msgSend(v28, "length"));
              uint64_t v31 = v30;

              if (v29 != (id)0x7FFFFFFFFFFFFFFFLL || (id v19 = 0LL, v31))
              {
                id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringWithRange:", v29, v31));
                NSLog(@"substringForFirstMatch: [%@]", v19);
              }

              if ((unint64_t)[v19 length] >= 3)
              {
                id v19 = v19;
                *a6 = v19;
                BOOL v11 = 1;
              }

              else
              {
LABEL_29:
                BOOL v11 = 0;
              }
            }

            else
            {
LABEL_23:
              BOOL v11 = 0;
            }
          }
        }

        else
        {
          BOOL v11 = 0;
        }
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (void)handleChallengeResponse:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 allHeaderFields]);
  if (![v4 count]
    || (uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"WWW-Authenticate"])) == 0)
  {
    os_log_t v20 = sub_1000021D4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_log_type_t v21 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v12, v21))
    {
      *(_DWORD *)buf = 138412546;
      os_log_type_t v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = @"WWW-Authenticate";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v21,  "%@ login data task did not receive response with [%@] header",  buf,  0x16u);
    }

    id v6 = 0LL;
    id v10 = 0LL;
    id v9 = 0LL;
    id v8 = 0LL;
    goto LABEL_18;
  }

  id v6 = (void *)v5;
  id v25 = 0LL;
  id v26 = 0LL;
  id v24 = 0LL;
  unsigned __int8 v7 = -[CNTokenAuthenticator parseChallenge:outRealm:outErrorCode:outErrorDescription:]( self,  "parseChallenge:outRealm:outErrorCode:outErrorDescription:",  v5,  &v26,  &v25,  &v24);
  id v8 = v26;
  id v9 = (__CFString *)v25;
  id v10 = (__CFString *)v24;
  if ((v7 & 1) == 0)
  {
    os_log_t v22 = sub_1000021D4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v23 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v12, v23))
    {
      *(_DWORD *)buf = 138412546;
      os_log_type_t v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = @"WWW-Authenticate";
      __int16 v16 = "%@ login data task received response with invalid [%@] header";
      uint64_t v17 = v12;
      os_log_type_t v18 = v23;
      uint32_t v19 = 22;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
    }

- (id)authResult:(id)a3
{
  id v4 = a3;
  if (v4 && self->_isAuthorized)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_tokenAuthAttempted));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, off_100014FD0);

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:off_100014FE8]);
    id v8 = v7;
    if (self->_tokenAuthAttempted && [v7 length]) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
    }
    else {
      id v9 = 0LL;
    }
    if ([v9 length]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, off_100014FD8);
    }
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:off_100014FF0]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, off_100014FE0);

    url = self->_url;
    if (url)
    {
      os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](url, "absoluteString"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, off_100014FC8);
    }

    id v10 = v5;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)handleTaskCompletion
{
  NSUInteger v3 = -[NSMutableData length](self->_receivedData, "length");
  os_log_t v4 = sub_1000021D4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_log_type_t v6 = _SC_syslog_os_log_mapping(7LL);
  BOOL v7 = os_log_type_enabled(v5, v6);
  if (v3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ handleTaskCompletion: received non-zero data", buf, 0xCu);
    }

    receivedData = self->_receivedData;
    id v21 = 0LL;
    id v9 = (CNTokenAuthenticator *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  receivedData,  0LL,  &v21));
    uint64_t v5 = (os_log_s *)v21;
    if (v5)
    {
      os_log_t v10 = sub_1000021D4();
      os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        os_log_type_t v23 = (CNTokenAuthenticator *)v5;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "JSON parsing failed, error: %@", buf, 0xCu);
      }

      os_log_type_t v13 = 0LL;
    }

    else
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0)
      {
        os_log_type_t v13 = 0LL;
        goto LABEL_9;
      }

      os_log_t v16 = sub_1000021D4();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Token Authentication server sent : %{public}@", buf, 0xCu);
      }

      os_log_type_t v13 = (CNTokenAuthenticator *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator authResult:](self, "authResult:", v9));
      os_log_t v19 = sub_1000021D4();
      os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v20 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v11, v20))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, v20, "Token Authentication Result : %{public}@", buf, 0xCu);
      }
    }

LABEL_9:
    goto LABEL_13;
  }

  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    os_log_type_t v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ handleTaskCompletion: did not receive data", buf, 0xCu);
  }

  os_log_type_t v13 = 0LL;
LABEL_13:

  if (self->_isAuthorized) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = 19LL;
  }
  -[CNTokenAuthenticator handleResponse:result:](self, "handleResponse:result:", v14, v13);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_log_t v14 = sub_1000021D4();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  os_log_type_t v16 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138412290;
    os_log_type_t v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ didReceiveChallenge", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator opQueue](self, "opQueue"));
  os_log_type_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 underlyingQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100005934;
  v22[3] = &unk_1000107A0;
  objc_copyWeak(&v26, (id *)buf);
  id v23 = v12;
  id v24 = v11;
  id v25 = v13;
  id v19 = v13;
  id v20 = v11;
  id v21 = v12;
  dispatch_async(v18, v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  os_log_t v10 = sub_1000021D4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_log_type_t v12 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v11, v12))
  {
    int v31 = 138412290;
    os_log_t v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ didReceiveResponse", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    id v14 = v8;
    os_log_t v15 = sub_1000021D4();
    os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = _SC_syslog_os_log_mapping(7LL);
    os_log_type_t v18 = v16;
    if (os_log_type_enabled(v18, v17))
    {
      id v19 = (CNTokenAuthenticator *)[v14 statusCode];
      int v31 = 134217984;
      os_log_t v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  v17,  "login data task received response with status code %lu",  (uint8_t *)&v31,  0xCu);
    }

    if ([v14 statusCode] == (id)200)
    {
      self->_isAuthorized = 1;
LABEL_17:
      v9[2](v9, 1LL);
LABEL_22:

      goto LABEL_23;
    }

    if (self->_tokenAuthAttempted && [v14 statusCode] == (id)401)
    {
      os_log_t v23 = sub_1000021D4();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v24, v25))
      {
        int v31 = 138412290;
        os_log_t v32 = self;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ token authentication failed", (uint8_t *)&v31, 0xCu);
      }

      self->_isAuthorized = 0;
      -[CNTokenAuthenticator handleChallengeResponse:](self, "handleChallengeResponse:", v14);
      v9[2](v9, 0LL);
      id v26 = self;
      uint64_t v27 = 19LL;
    }

    else
    {
      if ([v14 statusCode] == (id)401) {
        goto LABEL_17;
      }
      os_log_t v28 = sub_1000021D4();
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      os_log_type_t v30 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v29, v30))
      {
        int v31 = 138412290;
        os_log_t v32 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "%@ login data task received response with unexpected status code",  (uint8_t *)&v31,  0xCu);
      }

      v9[2](v9, 0LL);
      id v26 = self;
      uint64_t v27 = 1LL;
    }

    -[CNTokenAuthenticator handleResponse:result:](v26, "handleResponse:result:", v27, 0LL);
    goto LABEL_22;
  }

  os_log_t v20 = sub_1000021D4();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  os_log_type_t v22 = _SC_syslog_os_log_mapping(3LL);
  if (os_log_type_enabled(v21, v22))
  {
    int v31 = 138412290;
    os_log_t v32 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "%@ login data task received invalid response",  (uint8_t *)&v31,  0xCu);
  }

  v9[2](v9, 0LL);
  -[CNTokenAuthenticator handleResponse:result:](self, "handleResponse:result:", 1LL, 0LL);
LABEL_23:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10 = a6;
  id v11 = (void (**)(id, void *))a7;
  id v12 = a5;
  os_log_t v13 = sub_1000021D4();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  os_log_type_t v15 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v14, v15))
  {
    int v43 = 138412290;
    v44 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%@ willPerformHTTPRedirection", (uint8_t *)&v43, 0xCu);
  }

  -[CNTokenAuthenticator handleRedirectResponse:](self, "handleRedirectResponse:", v12);
  id v16 = v10;
  os_log_type_t v17 = v16;
  if (!self->_tokenAuthAttempted)
  {
    os_log_type_t v18 = objc_alloc(&OBJC_CLASS___NSURLComponents);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 URL]);
    os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]);
    id v21 = -[NSURLComponents initWithString:](v18, "initWithString:", v20);

    os_log_type_t v17 = v16;
    if (!v21)
    {
LABEL_18:

      goto LABEL_19;
    }

    os_log_t v22 = sub_1000021D4();
    os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = _SC_syslog_os_log_mapping(7LL);
    os_log_type_t v25 = v23;
    if (os_log_type_enabled(v25, v24))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v21, "string"));
      int v43 = 138412546;
      v44 = self;
      __int16 v45 = 2112;
      v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, v24, "%@ Current URL String: [%@]", (uint8_t *)&v43, 0x16u);
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v21, "queryItems"));
    id v28 = [v27 count];

    if (v28)
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v21, "queryItems"));
      os_log_type_t v30 = (NSMutableArray *)[v29 mutableCopy];

      os_log_type_t v17 = v16;
      if (-[NSMutableArray indexOfObjectPassingTest:](v30, "indexOfObjectPassingTest:", &stru_1000107E0) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_17:

        goto LABEL_18;
      }
    }

    else
    {
      os_log_type_t v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }

    int v31 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"authorized",  @"true");
    -[NSMutableArray addObject:](v30, "addObject:", v31);
    -[NSURLComponents setQueryItems:](v21, "setQueryItems:", v30);
    os_log_t v32 = objc_alloc(&OBJC_CLASS___NSURL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v21, "string"));
    os_log_type_t v34 = -[NSURL initWithString:](v32, "initWithString:", v33);

    os_log_t v35 = sub_1000021D4();
    os_log_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    os_log_type_t v37 = _SC_syslog_os_log_mapping(7LL);
    os_log_type_t v38 = v36;
    if (os_log_type_enabled(v38, v37))
    {
      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v21, "string"));
      int v43 = 138412546;
      v44 = self;
      __int16 v45 = 2112;
      v46 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, v37, "%@ New URL String: [%@]", (uint8_t *)&v43, 0x16u);
    }

    if (-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds")) {
      double v40 = (double)-[CNTokenAuthenticator timeoutSeconds](self, "timeoutSeconds");
    }
    else {
      double v40 = 60.0;
    }
    os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v34,  4LL,  v40));
    os_log_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator userAgent](self, "userAgent"));
    [v17 setValue:v41 forHTTPHeaderField:@"User-Agent"];

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CNTokenAuthenticator interfaceName](self, "interfaceName"));
    [v17 setBoundInterfaceIdentifier:v42];

    goto LABEL_17;
  }

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  os_log_t v7 = sub_1000021D4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_log_type_t v9 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v8, v9))
  {
    int v13 = 138412290;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ didReceiveData", (uint8_t *)&v13, 0xCu);
  }

  if (self->_isAuthorized && [v6 length])
  {
    receivedData = self->_receivedData;
    if (!receivedData)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      id v12 = self->_receivedData;
      self->_receivedData = v11;

      receivedData = self->_receivedData;
    }

    -[NSMutableData appendData:](receivedData, "appendData:", v6);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  os_log_t v7 = sub_1000021D4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_log_type_t v9 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v8, v9))
  {
    int v17 = 138412290;
    os_log_type_t v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ didCompleteWithError", (uint8_t *)&v17, 0xCu);
  }

  if (v6
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]),
        unsigned int v11 = [v10 isEqualToString:NSURLErrorDomain],
        v10,
        v11))
  {
    os_log_t v12 = sub_1000021D4();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v13, v14))
    {
      int v17 = 138412546;
      os_log_type_t v18 = self;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "%@ session task completed with error %@",  (uint8_t *)&v17,  0x16u);
    }

    switch((unint64_t)[v6 code])
    {
      case 0xFFFFFFFFFFFFFC0FLL:
      case 0xFFFFFFFFFFFFFC13LL:
        os_log_type_t v15 = self;
        uint64_t v16 = 8LL;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC12LL:
      case 0xFFFFFFFFFFFFFC15LL:
        os_log_type_t v15 = self;
        uint64_t v16 = 7LL;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC17LL:
        os_log_type_t v15 = self;
        uint64_t v16 = 6LL;
        goto LABEL_13;
      case 0xFFFFFFFFFFFFFC19LL:
        break;
      default:
        os_log_type_t v15 = self;
        uint64_t v16 = 13LL;
LABEL_13:
        -[CNTokenAuthenticator handleResponse:result:](v15, "handleResponse:result:", v16, 0LL);
        break;
    }
  }

  else
  {
    -[CNTokenAuthenticator handleTaskCompletion](self, "handleTaskCompletion");
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a4;
  os_log_t v6 = sub_1000021D4();
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  os_log_type_t v8 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v12 = 138412290;
    int v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ didBecomeInvalidWithError", (uint8_t *)&v12, 0xCu);
  }

  if (v5)
  {
    os_log_t v9 = sub_1000021D4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v10, v11))
    {
      int v12 = 138412546;
      int v13 = self;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "%@ session invalidated with error %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (unsigned)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(unsigned int)a3
{
  self->_timeoutSeconds = a3;
}

- (NSOperationQueue)opQueue
{
  return self->_opQueue;
}

- (void)setOpQueue:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionDataTask)loginDataTask
{
  return self->_loginDataTask;
}

- (void)setLoginDataTask:(id)a3
{
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 80LL, 1);
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end