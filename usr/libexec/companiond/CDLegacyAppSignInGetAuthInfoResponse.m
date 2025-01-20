@interface CDLegacyAppSignInGetAuthInfoResponse
- (AKCredentialRequestContext)credentialRequest;
- (CDLegacyAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setCredentialRequest:(id)a3;
@end

@implementation CDLegacyAppSignInGetAuthInfoResponse

- (CDLegacyAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CDLegacyAppSignInGetAuthInfoResponse;
  v5 = -[CDLegacyAppSignInGetAuthInfoResponse init](&v12, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___AKCredentialRequestContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"CredentialRequest", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    credentialRequest = v5->_credentialRequest;
    v5->_credentialRequest = (AKCredentialRequestContext *)v9;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_10001AFE4((uint64_t)self->_credentialRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"CredentialRequest"];

  id v6 = [v3 copy];
  return v6;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_credentialRequest withName:@"credentialRequest" skipIfNil:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v5;
}

- (AKCredentialRequestContext)credentialRequest
{
  return self->_credentialRequest;
}

- (void)setCredentialRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end