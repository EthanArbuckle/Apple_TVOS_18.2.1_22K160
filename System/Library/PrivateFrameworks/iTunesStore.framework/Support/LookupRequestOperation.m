@interface LookupRequestOperation
- (BOOL)_performJSSignLookupWithURLBag:(id)a3 error:(id *)a4;
- (BOOL)_performLocationLookup:(id *)a3;
- (BOOL)_performPlatformLookup:(id *)a3;
- (BOOL)shouldSuppressCookies;
- (LookupRequestOperation)initWithLookupProperties:(id)a3;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSAuthenticationContext)authenticationContext;
- (SSLookupProperties)lookupProperties;
- (SSLookupResponse)lookupResponse;
- (id)_URLBagContext;
- (id)_authenticationContext;
- (id)_newLookupResponseWithResultsFromOperation:(id)a3;
- (id)_newStoreURLOperationWithBagKey:(id)a3;
- (int64_t)personalizationStyle;
- (void)_setAccountID:(id)a3;
- (void)_setLookupResponse:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 willSendRequest:(id)a4;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setShouldSuppressCookies:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation LookupRequestOperation

- (LookupRequestOperation)initWithLookupProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LookupRequestOperation;
  v4 = -[LookupRequestOperation init](&v6, "init");
  if (v4) {
    v4->_properties = (SSLookupProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LookupRequestOperation;
  -[LookupRequestOperation dealloc](&v3, "dealloc");
}

- (SSAuthenticationContext)authenticationContext
{
  objc_super v3 = self->_authenticationContext;
  -[LookupRequestOperation unlock](self, "unlock");
  return v3;
}

- (NSString)clientIdentifierHeader
{
  objc_super v3 = self->_clientIdentifierHeader;
  -[LookupRequestOperation unlock](self, "unlock");
  return v3;
}

- (SSLookupProperties)lookupProperties
{
  return (SSLookupProperties *)-[SSLookupProperties copy](self->_properties, "copy");
}

- (SSLookupResponse)lookupResponse
{
  objc_super v3 = self->_response;
  -[LookupRequestOperation unlock](self, "unlock");
  return v3;
}

- (int64_t)personalizationStyle
{
  int64_t personalizationStyle = self->_personalizationStyle;
  -[LookupRequestOperation unlock](self, "unlock");
  return personalizationStyle;
}

- (void)setAuthenticationContext:(id)a3
{
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  -[LookupRequestOperation unlock](self, "unlock");
}

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  -[LookupRequestOperation unlock](self, "unlock");
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_int64_t personalizationStyle = a3;
  -[LookupRequestOperation unlock](self, "unlock");
}

- (void)setShouldSuppressCookies:(BOOL)a3
{
  self->_shouldSuppressCookies = a3;
  -[LookupRequestOperation unlock](self, "unlock");
}

- (BOOL)shouldSuppressCookies
{
  BOOL shouldSuppressCookies = self->_shouldSuppressCookies;
  -[LookupRequestOperation unlock](self, "unlock");
  return shouldSuppressCookies;
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[LookupRequestOperation unlock](self, "unlock");
}

- (NSString)userAgent
{
  objc_super v3 = self->_userAgent;
  -[LookupRequestOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v17 = 0LL;
  id v3 = -[LookupRequestOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  -[LookupRequestOperation _URLBagContext](self, "_URLBagContext"),  &v17);
  if (v3)
  {
    id v4 = v3;
    if (-[SSLookupProperties location](self->_properties, "location"))
    {
      BOOL v5 = -[LookupRequestOperation _performLocationLookup:](self, "_performLocationLookup:", &v17);
    }

    else if ((id)-[LookupRequestOperation personalizationStyle](self, "personalizationStyle") == (id)2)
    {
      BOOL v5 = -[LookupRequestOperation _performJSSignLookupWithURLBag:error:]( self,  "_performJSSignLookupWithURLBag:error:",  v4,  &v17);
    }

    else
    {
      BOOL v5 = -[LookupRequestOperation _performPlatformLookup:](self, "_performPlatformLookup:", &v17);
    }

    BOOL v15 = v5;
  }

  else
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      uint64_t v11 = objc_opt_class(self);
      int v18 = 138412546;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Could not load URL bag: %@",  &v18,  22);
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        v16 = v14;
        *(void *)&double v6 = SSFileLog(v7, @"%@").n128_u64[0];
      }
    }

    BOOL v15 = 0LL;
  }

  -[LookupRequestOperation setError:](self, "setError:", v17, v6, v16);
  -[LookupRequestOperation setSuccess:](self, "setSuccess:", v15);
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  BOOL v5 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
  -[NSDateFormatter setLocale:](v7, "setLocale:", v5);
  -[NSDateFormatter setDateFormat:](v7, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss ZZZ");
  double v6 = -[NSDateFormatter stringFromDate:](v7, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v6) {
    [a4 setValue:v6 forHTTPHeaderField:@"X-Request-TimeStamp"];
  }
}

- (id)_authenticationContext
{
  id v3 = -[LookupRequestOperation authenticationContext](self, "authenticationContext");
  id v4 = -[SSAuthenticationContext HTTPHeaders](v3, "HTTPHeaders");
  uint64_t v5 = SSHTTPHeaderUserAgent;
  if ([v4 objectForKey:SSHTTPHeaderUserAgent]) {
    return v3;
  }
  id v7 = -[LookupRequestOperation userAgent](self, "userAgent");
  if (!v7) {
    return v3;
  }
  unsigned int v8 = v7;
  id v9 = -[SSAuthenticationContext mutableCopy](v3, "mutableCopy");
  [v9 setValue:v8 forHTTPHeaderField:v5];
  return v9;
}

- (id)_newLookupResponseWithResultsFromOperation:(id)a3
{
  id v4 = -[SSLookupResponse initWithResponseDictionary:]( [SSLookupResponse alloc],  "initWithResponseDictionary:",  objc_msgSend(objc_msgSend(a3, "dataProvider"), "output"));
  id v5 = [a3 response];
  if (v5)
  {
    objc_msgSend(v5, "itunes_expirationInterval");
    if (v6 >= 0.0) {
      -[SSLookupResponse setExpirationDate:]( v4,  "setExpirationDate:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
    }
  }

  return v4;
}

- (id)_newStoreURLOperationWithBagKey:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v5,  "setAuthenticationContext:",  -[LookupRequestOperation authenticationContext](self, "authenticationContext"));
  [v5 setCanSendGUIDParameter:0];
  objc_msgSend(v5, "setDataProvider:", +[ISJSONDataProvider provider](ISJSONDataProvider, "provider"));
  double v6 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setClientIdentifier:]( v6,  "setClientIdentifier:",  -[LookupRequestOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  -[SSMutableURLRequestProperties setURLBagKey:](v6, "setURLBagKey:", a3);
  id v7 = -[SSLookupProperties timeoutInterval](self->_properties, "timeoutInterval");
  if (v7)
  {
    unsigned int v8 = v7;
    -[SSMutableURLRequestProperties setAllowedRetryCount:](v6, "setAllowedRetryCount:", 0LL);
    [v8 doubleValue];
    -[SSMutableURLRequestProperties setTimeoutInterval:](v6, "setTimeoutInterval:");
  }

  else
  {
    -[SSMutableURLRequestProperties setAllowedRetryCount:](v6, "setAllowedRetryCount:", 2LL);
  }

  id v9 = -[LookupRequestOperation userAgent](self, "userAgent");
  if (!v9)
  {
    if (a3 != @"nearby-apps") {
      goto LABEL_7;
    }
    id v9 = (NSString *)objc_msgSend( +[SSDevice currentDevice](SSDevice, "currentDevice"),  "userAgentWithClientName:version:",  @"AppStore",  @"2.0");
  }

  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v6,  "setValue:forHTTPHeaderField:",  v9,  SSHTTPHeaderUserAgent);
LABEL_7:
  id v10 = -[SSLookupProperties copyRequestParameters](self->_properties, "copyRequestParameters");
  -[SSMutableURLRequestProperties setRequestParameters:](v6, "setRequestParameters:", v10);

  [v5 setRequestProperties:v6];
  return v5;
}

- (BOOL)_performJSSignLookupWithURLBag:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  uint64_t v21 = sub_1000FE544;
  v22 = sub_1000FE554;
  uint64_t v23 = 0LL;
  id v7 = objc_msgSend( [SSVPlatformContext alloc],  "initWithBagDictionary:",  objc_msgSend(a3, "URLBagDictionary"));
  if ([v7 unpersonalizedLookupURLString])
  {
    id v8 = [[SSVPlatformRequestOperation alloc] initWithPlatformContext:v7];
    objc_msgSend(v8, "setKeyProfile:", -[SSLookupProperties keyProfile](self->_properties, "keyProfile"));
    objc_msgSend(v8, "setStoreFrontSuffix:", objc_msgSend(a3, "valueForKey:", @"storefront-header-suffix"));
    objc_msgSend(v8, "_setUserAgent:", -[LookupRequestOperation userAgent](self, "userAgent"));
    if ((id)-[LookupRequestOperation personalizationStyle](self, "personalizationStyle") == (id)2) {
      [v8 setShouldSuppressUserInfo:1];
    }
    objc_msgSend( v8,  "setShouldSuppressCookies:",  -[LookupRequestOperation shouldSuppressCookies](self, "shouldSuppressCookies"));
    id v9 = -[SSLookupProperties copyRequestParameters](self->_properties, "copyRequestParameters");
    [v9 removeObjectForKey:SSLookupParameterKeyProfile];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000FE560;
    v17[3] = &unk_10034E8F0;
    v17[4] = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v17];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000FE608;
    v16[3] = &unk_10034E918;
    v16[4] = self;
    v16[5] = &v18;
    v16[6] = &v24;
    [v8 setResponseBlock:v16];
    [v8 main];
    id v10 = (id)v19[5];
  }

  else
  {
    uint64_t v11 = SSError(SSErrorDomain, 124LL, 0LL, 0LL);
    v19[5] = v11;
  }

  uint64_t v12 = v25;
  int v13 = *((unsigned __int8 *)v25 + 24);
  if (a4 && !*((_BYTE *)v25 + 24))
  {
    *a4 = (id)v19[5];
    int v13 = *((unsigned __int8 *)v12 + 24);
  }

  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

- (BOOL)_performLocationLookup:(id *)a3
{
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  uint64_t v26 = 0LL;
  char v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  v29 = sub_1000FE544;
  v30 = sub_1000FE554;
  uint64_t v31 = 0LL;
  id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  LODWORD(v6) = [v5 shouldLog];
  unsigned int v7 = [v5 shouldLogToDisk];
  id v8 = (os_log_s *)[v5 OSLogObject];
  id v9 = v8;
  if (v7) {
    LODWORD(v6) = v6 | 2;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    uint64_t v11 = objc_opt_class(self);
    int v36 = 138412290;
    uint64_t v37 = v11;
    uint64_t v12 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Performing location lookup",  &v36,  12);
    if (v12)
    {
      int v13 = (void *)v12;
      BOOL v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      uint64_t v24 = v14;
      *(void *)&double v10 = SSFileLog(v5, @"%@").n128_u64[0];
    }
  }

  id v15 = -[LookupRequestOperation _URLBagContext](self, "_URLBagContext", v10, v24);
  id v16 = objc_msgSend( -[LookupRequestOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v15,  v27 + 5),  "valueForKey:",  @"nearby-apps");
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    id v18 = objc_msgSend( [SSVLoadNearbyAppsOperation alloc],  "initWithBaseURL:location:",  v16,  -[SSLookupProperties location](self->_properties, "location"));
    objc_msgSend( v18,  "setPointOfInterestIdentifier:",  -[SSLookupProperties valueForRequestParameter:]( self->_properties,  "valueForRequestParameter:",  SSLookupParameterPointOfInterestIdentifier));
    objc_msgSend( v18,  "setPointOfInterestProviderIdentifier:",  -[SSLookupProperties valueForRequestParameter:]( self->_properties,  "valueForRequestParameter:",  SSLookupParameterPointOfInterestProviderIdentifier));
    objc_msgSend( v18,  "setPointOfInterestProviderURL:",  -[SSLookupProperties valueForRequestParameter:]( self->_properties,  "valueForRequestParameter:",  SSLookupParameterPointOfInterestProviderURLString));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000FE9CC;
    v25[3] = &unk_10034E918;
    v25[4] = self;
    v25[5] = &v26;
    v25[6] = &v32;
    [v18 setResponseBlock:v25];
    [v18 main];
    id v19 = (id)v27[5];
  }

  uint64_t v20 = v33;
  int v21 = *((unsigned __int8 *)v33 + 24);
  if (a3 && !*((_BYTE *)v33 + 24))
  {
    *a3 = (id)v27[5];
    int v21 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v22 = v21 != 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v22;
}

- (BOOL)_performPlatformLookup:(id *)a3
{
  v63 = 0LL;
  id v5 = -[LookupRequestOperation _newStoreURLOperationWithBagKey:]( self,  "_newStoreURLOperationWithBagKey:",  @"storeplatform-lookup-url");
  [v5 setDelegate:self];
  id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  id v9 = (os_log_s *)[v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if ((_DWORD)v8)
  {
    int v64 = 138412290;
    uint64_t v65 = objc_opt_class(self);
    uint64_t v11 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Performing platform lookup",  &v64,  12);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      int v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      v57 = v13;
      *(void *)&double v10 = SSFileLog(v6, @"%@").n128_u64[0];
    }
  }

  unsigned int v14 = -[LookupRequestOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v63,  v10,  v57);
  if (v14)
  {
    id v15 = -[LookupRequestOperation _newLookupResponseWithResultsFromOperation:]( self,  "_newLookupResponseWithResultsFromOperation:",  v5);
    -[LookupRequestOperation _setLookupResponse:](self, "_setLookupResponse:", v15);
    id v16 = [v15 valueForProperty:SSLookupPropertyIsAuthenticated];
    if ((id)-[LookupRequestOperation personalizationStyle](self, "personalizationStyle") == (id)1
      && (objc_opt_respondsToSelector(v16, "BOOLValue") & 1) != 0
      && ([v16 BOOLValue] & 1) == 0)
    {
      id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v18 = [v17 shouldLog];
      else {
        LODWORD(v19) = v18;
      }
      uint64_t v20 = (os_log_s *)[v17 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        uint64_t v19 = v19;
      }
      else {
        v19 &= 2u;
      }
      if ((_DWORD)v19)
      {
        uint64_t v22 = objc_opt_class(self);
        int v64 = 138412290;
        uint64_t v65 = v22;
        LODWORD(v60) = 12;
        uint64_t v23 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "%@: Authenticating to personalize response",  &v64,  v60);
        if (v23)
        {
          uint64_t v24 = (void *)v23;
          v25 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
          free(v24);
          v58 = v25;
          *(void *)&double v21 = SSFileLog(v17, @"%@").n128_u64[0];
        }
      }

      id v62 = 0LL;
      v61 = 0LL;
      unsigned __int8 v26 = -[LookupRequestOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  &v62,  0LL,  -[LookupRequestOperation _authenticationContext]( self,  "_authenticationContext",  v21,  v58),  &v61);
      id v27 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      id v28 = v27;
      if ((v26 & 1) != 0)
      {
        if (!v27) {
          id v28 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v29 = [v28 shouldLog];
        else {
          LODWORD(v30) = v29;
        }
        uint64_t v31 = (os_log_s *)[v28 OSLogObject];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          uint64_t v30 = v30;
        }
        else {
          v30 &= 2u;
        }
        if ((_DWORD)v30)
        {
          uint64_t v33 = objc_opt_class(self);
          int v64 = 138412546;
          uint64_t v65 = v33;
          __int16 v66 = 2112;
          id v67 = v62;
          LODWORD(v60) = 22;
          uint64_t v34 = _os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  1LL,  "%@: Authenticated for account: %@",  &v64,  v60);
          if (v34)
          {
            char v35 = (void *)v34;
            int v36 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL);
            free(v35);
            v58 = v36;
            *(void *)&double v32 = SSFileLog(v28, @"%@").n128_u64[0];
          }
        }

        -[LookupRequestOperation _setAccountID:](self, "_setAccountID:", v62, v32, v58);
        id v37 = -[LookupRequestOperation _newStoreURLOperationWithBagKey:]( self,  "_newStoreURLOperationWithBagKey:",  @"storeplatform-lookup-url");
        [v37 setDelegate:self];
        id v38 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v38) {
          id v38 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v39 = [v38 shouldLog];
        else {
          LODWORD(v40) = v39;
        }
        v41 = (os_log_s *)[v38 OSLogObject];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
          uint64_t v40 = v40;
        }
        else {
          v40 &= 2u;
        }
        if ((_DWORD)v40)
        {
          uint64_t v43 = objc_opt_class(self);
          int v64 = 138412290;
          uint64_t v65 = v43;
          LODWORD(v60) = 12;
          uint64_t v44 = _os_log_send_and_compose_impl( v40,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  1LL,  "%@: Performing personalization lookup",  &v64,  v60);
          if (v44)
          {
            v45 = (void *)v44;
            v46 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL);
            free(v45);
            v59 = v46;
            *(void *)&double v42 = SSFileLog(v38, @"%@").n128_u64[0];
          }
        }

        if (-[LookupRequestOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v37,  0LL,  v42,  v59))
        {
          id v47 = -[LookupRequestOperation _newLookupResponseWithResultsFromOperation:]( self,  "_newLookupResponseWithResultsFromOperation:",  v37);
          -[LookupRequestOperation _setLookupResponse:](self, "_setLookupResponse:", v47);
        }

        [v37 setDelegate:0];
      }

      else
      {
        if (!v27) {
          id v28 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v48 = [v28 shouldLog];
        else {
          LODWORD(v49) = v48;
        }
        v50 = (os_log_s *)[v28 OSLogObject];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v49 = v49;
        }
        else {
          v49 &= 2u;
        }
        if ((_DWORD)v49)
        {
          uint64_t v51 = objc_opt_class(self);
          int v64 = 138412546;
          uint64_t v65 = v51;
          __int16 v66 = 2112;
          id v67 = v61;
          LODWORD(v60) = 22;
          uint64_t v52 = _os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v50,  0LL,  "%@: Authentication failed: %@",  &v64,  v60);
          if (v52)
          {
            v53 = (void *)v52;
            v54 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v52,  4LL);
            free(v53);
            v58 = v54;
            SSFileLog(v28, @"%@");
          }
        }
      }
    }
  }

  objc_msgSend(v5, "setDelegate:", 0, v58);

  if (a3) {
    char v55 = v14;
  }
  else {
    char v55 = 1;
  }
  if ((v55 & 1) == 0) {
    *a3 = v63;
  }
  return v14;
}

- (void)_setAccountID:(id)a3
{
  id v5 = -[LookupRequestOperation authenticationContext](self, "authenticationContext");
  if ((objc_msgSend( a3,  "isEqual:",  -[SSAuthenticationContext requiredUniqueIdentifier](v5, "requiredUniqueIdentifier")) & 1) == 0)
  {
    id v6 = (SSMutableAuthenticationContext *)-[SSAuthenticationContext mutableCopy](v5, "mutableCopy");
    if (!v6) {
      id v6 = objc_alloc_init(&OBJC_CLASS___SSMutableAuthenticationContext);
    }
    unsigned int v7 = v6;
    -[SSMutableAuthenticationContext setRequiredUniqueIdentifier:](v6, "setRequiredUniqueIdentifier:", a3);
    -[LookupRequestOperation setAuthenticationContext:](self, "setAuthenticationContext:", v7);
  }

- (void)_setLookupResponse:(id)a3
{
  response = self->_response;
  if (response != a3)
  {

    self->_response = (SSLookupResponse *)a3;
  }

  -[LookupRequestOperation unlock](self, "unlock");
}

- (id)_URLBagContext
{
  id v3 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
  id v4 = -[LookupRequestOperation userAgent](self, "userAgent");
  -[SSURLBagContext setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v4, SSHTTPHeaderUserAgent);
  return v3;
}

@end