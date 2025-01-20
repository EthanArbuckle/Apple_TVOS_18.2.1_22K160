@interface CDAppSignInDidFinishAuthRequest
- (AKAuthorization)appleIDAuthorization;
- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion;
- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration;
- (CASPasswordCredential)passwordCredential;
- (CDAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSURL)webCallbackURL;
- (id)makeRapportDictionary;
- (void)setAppleIDAuthorization:(id)a3;
- (void)setError:(id)a3;
- (void)setPasswordCredential:(id)a3;
- (void)setPlatformKeyCredentialAssertion:(id)a3;
- (void)setPlatformKeyCredentialRegistration:(id)a3;
- (void)setWebCallbackURL:(id)a3;
@end

@implementation CDAppSignInDidFinishAuthRequest

- (CDAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CDAppSignInDidFinishAuthRequest;
  v5 = -[CDAppSignInDidFinishAuthRequest init](&v37, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___AKAuthorization);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"appleIDAuthorization", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    appleIDAuthorization = v5->_appleIDAuthorization;
    v5->_appleIDAuthorization = (AKAuthorization *)v9;

    uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = sub_10001AD0C(v4, @"authError", (uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v5->_error;
    v5->_error = (NSError *)v14;

    uint64_t v16 = objc_opt_self(&OBJC_CLASS___CASPasswordCredential);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_10001AD0C(v4, @"passwordCredential", (uint64_t)v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    passwordCredential = v5->_passwordCredential;
    v5->_passwordCredential = (CASPasswordCredential *)v19;

    uint64_t v21 = objc_opt_self(&OBJC_CLASS___NSURL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = sub_10001AD0C(v4, @"webCallbackURL", (uint64_t)v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    webCallbackURL = v5->_webCallbackURL;
    v5->_webCallbackURL = (NSURL *)v24;

    uint64_t v26 = objc_opt_self(&OBJC_CLASS___ASCPlatformPublicKeyCredentialAssertion);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = sub_10001AD0C(v4, @"platformKeyCredentialAssertion", (uint64_t)v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    platformKeyCredentialAssertion = v5->_platformKeyCredentialAssertion;
    v5->_platformKeyCredentialAssertion = (ASCPlatformPublicKeyCredentialAssertion *)v29;

    uint64_t v31 = objc_opt_self(&OBJC_CLASS___ASCPlatformPublicKeyCredentialRegistration);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    id v33 = sub_10001AD0C(v4, @"platformKeyCredentialRegistration", (uint64_t)v32);
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    platformKeyCredentialRegistration = v5->_platformKeyCredentialRegistration;
    v5->_platformKeyCredentialRegistration = (ASCPlatformPublicKeyCredentialRegistration *)v34;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_10001AFE4((uint64_t)self->_appleIDAuthorization);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"appleIDAuthorization"];

  id v6 = sub_10001AFE4((uint64_t)self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setObject:v7 forKeyedSubscript:@"authError"];

  id v8 = sub_10001AFE4((uint64_t)self->_passwordCredential);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setObject:v9 forKeyedSubscript:@"passwordCredential"];

  id v10 = sub_10001AFE4((uint64_t)self->_webCallbackURL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v3 setObject:v11 forKeyedSubscript:@"webCallbackURL"];

  id v12 = sub_10001AFE4((uint64_t)self->_platformKeyCredentialAssertion);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v3 setObject:v13 forKeyedSubscript:@"platformKeyCredentialAssertion"];

  id v14 = sub_10001AFE4((uint64_t)self->_platformKeyCredentialRegistration);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v3 setObject:v15 forKeyedSubscript:@"platformKeyCredentialRegistration"];

  id v16 = [v3 copy];
  return v16;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  [v3 appendObject:self->_appleIDAuthorization withName:@"appleIDAuthorization" skipIfNil:1];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  id v6 =  [v3 appendObject:self->_passwordCredential withName:@"passwordCredential" skipIfNil:1];
  if (self->_webCallbackURL)
  {
    uint64_t v7 = CUPrintNSObjectMasked();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v3 appendString:v8 withName:@"webCallbackURL"];
  }

  id v9 =  [v3 appendObject:self->_platformKeyCredentialAssertion withName:@"platformKeyCredentialAssertion" skipIfNil:1];
  id v10 =  [v3 appendObject:self->_platformKeyCredentialRegistration withName:@"platformKeyCredentialRegistration" skipIfNil:1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v11;
}

- (AKAuthorization)appleIDAuthorization
{
  return self->_appleIDAuthorization;
}

- (void)setAppleIDAuthorization:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (CASPasswordCredential)passwordCredential
{
  return self->_passwordCredential;
}

- (void)setPasswordCredential:(id)a3
{
}

- (NSURL)webCallbackURL
{
  return self->_webCallbackURL;
}

- (void)setWebCallbackURL:(id)a3
{
}

- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion
{
  return self->_platformKeyCredentialAssertion;
}

- (void)setPlatformKeyCredentialAssertion:(id)a3
{
}

- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration
{
  return self->_platformKeyCredentialRegistration;
}

- (void)setPlatformKeyCredentialRegistration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end