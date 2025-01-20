@interface CDSharingDidFinishAuthRequest
- (CDSharingDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setError:(id)a3;
@end

@implementation CDSharingDidFinishAuthRequest

- (CDSharingDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CDSharingDidFinishAuthRequest;
  v5 = -[CDSharingDidFinishAuthRequest init](&v12, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSError);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"authError", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    error = v5->_error;
    v5->_error = (NSError *)v9;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_10001AFE4((uint64_t)self->_error);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"authError"];

  id v6 = [v3 copy];
  return v6;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v5;
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