@interface FAFamilyDetailsRequest
- (FAFamilyDetailsRequest)initWithAccount:(id)a3;
- (id)urlRequest;
@end

@implementation FAFamilyDetailsRequest

- (FAFamilyDetailsRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAFamilyDetailsRequest;
  v6 = -[FAFamilyDetailsRequest initWithAccount:](&v9, "initWithAccount:", v5);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlRequest
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAFamilyDetailsRequest;
  id v3 = -[FAFamilyDetailsRequest urlRequest](&v9, "urlRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = [[FARequestConfigurator alloc] initWithAccount:self->_account];
  [v6 addFresnoPayloadToRequest:v5 additionalPayload:0];
  id v7 = [v5 copy];

  return v7;
}

- (void).cxx_destruct
{
}

@end