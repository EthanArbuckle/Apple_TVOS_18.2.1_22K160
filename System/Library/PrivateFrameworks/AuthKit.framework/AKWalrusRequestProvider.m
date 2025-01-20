@interface AKWalrusRequestProvider
- (AKWalrusContext)walrusContext;
- (AKWalrusRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (BOOL)_validateDataForVerifyEnableWalrusAllowedRequest:(id)a3 error:(id *)a4;
- (BOOL)_validateDataForWalrusStateUpdateToServerRequest:(id)a3 error:(id *)a4;
- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (NSString)refreshUrl;
- (NSString)reqInterceptToken;
- (NSString)secondaryToken;
- (id)_AKAuthContextWithUsername:(id)a3 password:(id)a4;
- (id)parseRefreshUrl:(id)a3;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)getPETForUsername:(id)a3 password:(id)a4 completion:(id)a5;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)setRefreshUrl:(id)a3;
- (void)setReqInterceptToken:(id)a3;
- (void)setSecondaryToken:(id)a3;
- (void)setWalrusContext:(id)a3;
@end

@implementation AKWalrusRequestProvider

- (AKWalrusRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKWalrusRequestProvider;
  v8 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( &v11,  "initWithContext:urlBagKey:shouldCacheResource:",  v7,  a4,  0LL);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_walrusContext, a3);
  }

  return v9;
}

- (unint64_t)expectedResponseType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider reqInterceptToken](self, "reqInterceptToken"));
  if (v3)
  {

    return 0LL;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider refreshUrl](self, "refreshUrl"));

  return !v4;
}

- (unint64_t)requestBodyType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider refreshUrl](self, "refreshUrl"));

  return v2 == 0LL;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v8 = -[AKDServerUIController initWithClient:](v6, "initWithClient:", v7);

  v9 = objc_alloc(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider walrusContext](self, "walrusContext"));
  objc_super v11 = -[AKAppleIDAuthenticationContext initWithAuthenticatedServerRequestContext:]( v9,  "initWithAuthenticatedServerRequestContext:",  v10);

  -[AKAppleIDAuthenticationContext set_shouldSendIdentityTokenForRemoteUI:]( v11,  "set_shouldSendIdentityTokenForRemoteUI:",  1LL);
  -[AKAppleIDAuthenticationContext set_shouldSendGrandSlamTokensForRemoteUI:]( v11,  "set_shouldSendGrandSlamTokensForRemoteUI:",  1LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v8, "resourceLoadDelegateWithContext:", v11));
  [v12 setShouldSendPhoneNumber:1];
  [v12 setShouldSendSigningHeaders:1];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v12 setInitialURLRequestKey:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v12 setBagUrlKey:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl dataCenterIdentifier](self, "dataCenterIdentifier"));
  [v12 setDataCenterIdentifier:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider walrusContext](self, "walrusContext"));
  objc_msgSend(v12, "setCliMode:", objc_msgSend(v16, "cliMode"));

  [v12 signRequest:v5];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider secondaryToken](self, "secondaryToken"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider secondaryToken](self, "secondaryToken"));
    [v5 setValue:v18 forHTTPHeaderField:@"X-Apple-2SV-Authenticate"];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider reqInterceptToken](self, "reqInterceptToken"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider reqInterceptToken](self, "reqInterceptToken"));
    [v5 setValue:v20 forHTTPHeaderField:@"X-Apple-2SV-Req-Intercepted"];
  }

  else
  {
    [v5 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  }

  return 1;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider reqInterceptToken](self, "reqInterceptToken"));

  if (v7)
  {
    BOOL v8 = 1;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider secondaryToken](self, "secondaryToken"));

    if (v9
      || (v11.receiver = self,
          v11.super_class = (Class)&OBJC_CLASS___AKWalrusRequestProvider,
          -[AKURLRequestProviderImpl validateResponseData:error:](&v11, "validateResponseData:error:", v6, a4)))
    {
      BOOL v8 = -[AKWalrusRequestProvider _validateJSONResponseData:error:](self, "_validateJSONResponseData:error:", v6, a4);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  if ([v7 isEqualToString:AKURLBagKeyCustodianDataRecoveryServiceDisableComplete])
  {

LABEL_4:
    unsigned __int8 v10 = -[AKWalrusRequestProvider _validateDataForWalrusStateUpdateToServerRequest:error:]( self,  "_validateDataForWalrusStateUpdateToServerRequest:error:",  v6,  a4);
    goto LABEL_5;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  unsigned int v9 = [v8 isEqualToString:AKURLBagKeyCustodianDataRecoveryServiceEnableComplete];

  if (v9) {
    goto LABEL_4;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  unsigned int v14 = [v13 isEqualToString:AKURLBagKeyCustodianDataRecoveryServiceDisable];

  if (!v14)
  {
    BOOL v11 = 0;
    goto LABEL_6;
  }

  unsigned __int8 v10 = -[AKWalrusRequestProvider _validateDataForVerifyEnableWalrusAllowedRequest:error:]( self,  "_validateDataForVerifyEnableWalrusAllowedRequest:error:",  v6,  a4);
LABEL_5:
  BOOL v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)_validateDataForVerifyEnableWalrusAllowedRequest:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  a3,  @"application/json"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"eligibilityStatus"]);
  unsigned __int8 v7 = [v6 isEqualToString:@"eligible"];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"eligibilityStatus"]);
    unsigned int v9 = [v8 isEqualToString:@"ineligible"];

    if (v9)
    {
      if (a4)
      {
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ineligibilityReason"]);

        if (v10)
        {
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ineligibilityReason"]);
          uint64_t v12 = AKWalrusErrorDomain;
          NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
          v20 = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  -5001LL,  v13));
        }

        else
        {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKWalrusErrorDomain,  -5001LL,  0LL));
        }
      }
    }

    else if (a4)
    {
      uint64_t v14 = AKWalrusErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      v18 = @"Unknown error occurred while checking if enabling walrus is allowed.";
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  -5001LL,  v15));
    }
  }

  return v7;
}

- (BOOL)_validateDataForWalrusStateUpdateToServerRequest:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  a3,  @"application/json"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"status"]);
  unsigned int v7 = [v6 isEqualToString:@"failure"];

  if (a4 && v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"error"]);

    if (v8)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"error"]);
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"code"]);

      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"code"]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"text"]);

      uint64_t v13 = AKWalrusErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v17 = v12;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v10,  v14));
    }

    else
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKWalrusErrorDomain,  -5001LL,  0LL));
    }
  }

  return v7 ^ 1;
}

- (id)parseRefreshUrl:(id)a3
{
  id v4 = a3;
  id v5 = -[NSXMLParser initWithData:](objc_alloc(&OBJC_CLASS___NSXMLParser), "initWithData:", v4);

  -[NSXMLParser setDelegate:](v5, "setDelegate:", self);
  -[NSXMLParser parse](v5, "parse");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider refreshUrl](self, "refreshUrl"));

  return v6;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10 = a7;
  if ([a4 isEqualToString:@"clientInfo"])
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"refreshUrl"]);
    -[AKWalrusRequestProvider setRefreshUrl:](self, "setRefreshUrl:", v9);
  }
}

- (id)_AKAuthContextWithUsername:(id)a3 password:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKWalrusRequestProvider walrusContext](self, "walrusContext"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
  -[AKAppleIDAuthenticationContext setAltDSID:](v8, "setAltDSID:", v10);

  -[AKAppleIDAuthenticationContext setUsername:](v8, "setUsername:", v7);
  -[AKAppleIDAuthenticationContext _setPassword:](v8, "_setPassword:", v6);

  -[AKAppleIDAuthenticationContext setAuthenticationType:](v8, "setAuthenticationType:", 1LL);
  return v8;
}

- (void)getPETForUsername:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKWalrusRequestProvider _AKAuthContextWithUsername:password:]( self,  "_AKAuthContextWithUsername:password:",  a3,  a4));
  id v10 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000AACBC;
  v12[3] = &unk_1001C7B60;
  id v13 = v8;
  id v11 = v8;
  [v10 authenticateWithContext:v9 completion:v12];
}

- (AKWalrusContext)walrusContext
{
  return self->_walrusContext;
}

- (void)setWalrusContext:(id)a3
{
}

- (NSString)refreshUrl
{
  return self->_refreshUrl;
}

- (void)setRefreshUrl:(id)a3
{
}

- (NSString)secondaryToken
{
  return self->_secondaryToken;
}

- (void)setSecondaryToken:(id)a3
{
}

- (NSString)reqInterceptToken
{
  return self->_reqInterceptToken;
}

- (void)setReqInterceptToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end