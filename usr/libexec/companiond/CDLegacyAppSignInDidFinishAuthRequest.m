@interface CDLegacyAppSignInDidFinishAuthRequest
- (AKAuthorization)authorization;
- (CDLegacyAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setAuthorization:(id)a3;
- (void)setError:(id)a3;
@end

@implementation CDLegacyAppSignInDidFinishAuthRequest

- (CDLegacyAppSignInDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CDLegacyAppSignInDidFinishAuthRequest;
  v5 = -[CDLegacyAppSignInDidFinishAuthRequest init](&v17, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___AKAuthorization);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"Authorization", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    authorization = v5->_authorization;
    v5->_authorization = (AKAuthorization *)v9;

    uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = sub_10001AD0C(v4, @"Error", (uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v5->_error;
    v5->_error = (NSError *)v14;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_10001AFE4((uint64_t)self->_authorization);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"Authorization"];

  id v6 = sub_10001AFE4((uint64_t)self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setObject:v7 forKeyedSubscript:@"Error"];

  id v8 = [v3 copy];
  return v8;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_authorization withName:@"authorization" skipIfNil:1];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end