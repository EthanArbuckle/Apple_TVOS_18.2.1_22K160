@interface AKFidoRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (NSString)recoveryToken;
- (id)loadDelegate;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setRecoveryToken:(id)a3;
@end

@implementation AKFidoRequestProvider

- (id)loadDelegate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  objc_msgSend(v3, "set_shouldSendIdentityTokenForRemoteUI:", 1);

  v4 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v6 = -[AKDServerUIController initWithClient:](v4, "initWithClient:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v6, "resourceLoadDelegateWithContext:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v8 setInitialURLRequestKey:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v8 setBagUrlKey:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl dataCenterIdentifier](self, "dataCenterIdentifier"));
  [v8 setDataCenterIdentifier:v11];

  [v8 setShouldSendPhoneNumber:1];
  [v8 setShouldSendSigningHeaders:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _identityToken]);
  [v8 setIdentityToken:v13];

  return v8;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKFidoRequestProvider;
  BOOL v7 = -[AKGrandSlamRequestProvider signRequest:error:](&v11, "signRequest:error:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKFidoRequestProvider recoveryToken](self, "recoveryToken"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKFidoRequestProvider recoveryToken](self, "recoveryToken"));
      objc_msgSend(v6, "ak_addFidoRecoveryTokenHeader:", v9);
    }
  }

  return v7;
}

- (unint64_t)expectedResponseType
{
  return 1LL;
}

- (unint64_t)requestBodyType
{
  return 1LL;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AKFidoRequestProvider;
  if (-[AKGrandSlamRequestProvider validateResponseData:error:](&v18, "validateResponseData:error:", v6, a4))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v6,  @"application/json"));
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = AKErrorStatusCodeKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AKErrorStatusCodeKey]);
      objc_super v11 = v10;
      if (v10 && [v10 integerValue])
      {
        uint64_t v12 = _AKLogFido();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10012FFE4(v11, v13);
        }

        v19[0] = NSLocalizedDescriptionKey;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKErrorMessageKey]);
        v19[1] = v9;
        v20[0] = v14;
        v20[1] = v11;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));

        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  -7010LL,  v15));
        BOOL v16 = 0;
      }

      else
      {
        BOOL v16 = 1;
      }
    }

    else
    {
      BOOL v16 = 1;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSString)recoveryToken
{
  return self->_recoveryToken;
}

- (void)setRecoveryToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end