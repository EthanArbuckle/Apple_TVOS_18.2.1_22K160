@interface AKInheritanceRequestProvider
- (AKInheritanceContext)inheritanceContext;
- (AKInheritanceRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)signWithIdentityToken;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (id)_bodyForBeneficiaryAliasEndpoint;
- (id)_bodyForBeneficiaryEndpoint;
- (id)authKitBody;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setInheritanceContext:(id)a3;
- (void)setSignWithIdentityToken:(BOOL)a3;
@end

@implementation AKInheritanceRequestProvider

- (AKInheritanceRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKInheritanceRequestProvider;
  v7 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( &v10,  "initWithContext:urlBagKey:shouldCacheResource:",  v6,  a4,  0LL);
  v8 = v7;
  if (v7) {
    -[AKInheritanceRequestProvider setInheritanceContext:](v7, "setInheritanceContext:", v6);
  }

  return v8;
}

- (unint64_t)expectedResponseType
{
  return 1LL;
}

- (unint64_t)requestBodyType
{
  return 1LL;
}

- (id)authKitBody
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  if ([v4 isEqualToString:AKURLBagKeyInheritanceUpdateBeneficiaryKey])
  {

LABEL_4:
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider _bodyForBeneficiaryEndpoint](self, "_bodyForBeneficiaryEndpoint"));
    return v5;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  unsigned __int8 v8 = [v7 isEqualToString:AKURLBagKeyInheritanceRemoveBeneficiaryKey];

  if ((v8 & 1) != 0) {
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  unsigned int v10 = [v9 isEqualToString:AKURLBagKeyInheritanceSetupBeneficiaryAliasKey];

  if (v10) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[AKInheritanceRequestProvider _bodyForBeneficiaryAliasEndpoint]( self,  "_bodyForBeneficiaryAliasEndpoint"));
  }
  else {
    v5 = 0LL;
  }
  return v5;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc(&OBJC_CLASS___AKDServerUIController);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl client](self, "client"));
  v9 = -[AKDServerUIController initWithClient:](v7, "initWithClient:", v8);

  unsigned int v10 = objc_alloc(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
  v12 = -[AKAppleIDAuthenticationContext initWithAuthenticatedServerRequestContext:]( v10,  "initWithAuthenticatedServerRequestContext:",  v11);

  -[AKAppleIDAuthenticationContext set_shouldSendIdentityTokenForRemoteUI:]( v12,  "set_shouldSendIdentityTokenForRemoteUI:",  -[AKInheritanceRequestProvider signWithIdentityToken](self, "signWithIdentityToken"));
  -[AKAppleIDAuthenticationContext set_shouldSendGrandSlamTokensForRemoteUI:]( v12,  "set_shouldSendGrandSlamTokensForRemoteUI:",  1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKDServerUIController resourceLoadDelegateWithContext:](v9, "resourceLoadDelegateWithContext:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v13 setInitialURLRequestKey:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  [v13 setBagUrlKey:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl dataCenterIdentifier](self, "dataCenterIdentifier"));
  [v13 setDataCenterIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 beneficiarySetupToken]);
  [v13 setServiceToken:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  LODWORD(v18) = [v19 isEqualToString:AKURLBagKeyInheritanceSetupBeneficiaryAliasKey];

  if ((_DWORD)v18) {
    [v13 setServiceToken:0];
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue([v13 heartbeatToken]);

  if (v20)
  {
    [v13 signRequestWithCommonHeaders:v6];
  }

  else
  {
    uint64_t v22 = _AKLogSystem(v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10012E704(self, v23);
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7042LL));
    }
  }

  return v20 != 0LL;
}

- (id)_bodyForBeneficiaryEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beneficiaryIdentifier]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryIdentifier]);
    [v3 setObject:v7 forKeyedSubscript:@"beneficiaryUUID"];
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accessKey]);

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessKey]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 claimTokenString]);
    [v3 setObject:v12 forKeyedSubscript:@"claimId"];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accessKey]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 wrappedKeyData]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);

    [v3 setObject:v16 forKeyedSubscript:@"beneficiaryWrappedKey"];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 manifest]);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 manifest]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 parsableRepresentation]);
    [v3 setObject:v21 forKeyedSubscript:@"selections"];
  }

  return v3;
}

- (id)_bodyForBeneficiaryAliasEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AKInheritanceCLIContext, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKInheritanceRequestProvider inheritanceContext](self, "inheritanceContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accessKeyString]);

    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accessKeyString]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uppercaseString]);
      [v3 setObject:v11 forKeyedSubscript:@"accessKey"];
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 beneficiaryPassword]);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 beneficiaryPassword]);
      [v3 setObject:v13 forKeyedSubscript:@"beneficiaryPassword"];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 beneficiaryFirstName]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 beneficiaryFirstName]);
      [v3 setObject:v15 forKeyedSubscript:@"beneficiaryFirstName"];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 beneficiaryLastName]);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 beneficiaryLastName]);
      [v3 setObject:v17 forKeyedSubscript:@"beneficiaryLastName"];
    }
  }

  return v3;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AKInheritanceRequestProvider;
  if (-[AKURLRequestProviderImpl validateResponseData:error:](&v19, "validateResponseData:error:", v6, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v6,  @"application/json"));
    unsigned __int8 v8 = v7;
    if (v7)
    {
      uint64_t v9 = AKErrorStatusCodeKey;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AKErrorStatusCodeKey]);
      v11 = v10;
      if (v10 && (id v12 = [v10 integerValue]) != 0)
      {
        uint64_t v13 = _AKLogSystem(v12);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10012E7B0(v11, v14);
        }

        v20[0] = NSLocalizedDescriptionKey;
        v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKErrorMessageKey]);
        v20[1] = v9;
        v21[0] = v15;
        v21[1] = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  -7010LL,  v16));
        BOOL v17 = 0;
      }

      else
      {
        BOOL v17 = 1;
      }
    }

    else
    {
      BOOL v17 = 1;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (AKInheritanceContext)inheritanceContext
{
  return self->_context;
}

- (void)setInheritanceContext:(id)a3
{
}

- (BOOL)signWithIdentityToken
{
  return self->_signWithIdentityToken;
}

- (void)setSignWithIdentityToken:(BOOL)a3
{
  self->_signWithIdentityToken = a3;
}

- (void).cxx_destruct
{
}

@end