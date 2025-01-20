@interface PolicyResponse
+ (BOOL)supportsSecureCoding;
- (NSString)privacyPolicyText;
- (NSString)termsOfService;
- (NSURL)privacyPolicyURL;
- (PolicyResponse)initWithCoder:(id)a3;
- (PolicyResponse)initWithTermsOfService:(id)a3 privacyPolicyText:(id)a4 privacyPolicyURL:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PolicyResponse

- (PolicyResponse)initWithTermsOfService:(id)a3 privacyPolicyText:(id)a4 privacyPolicyURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PolicyResponse;
  v12 = -[PolicyResponse init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_termsOfService, a3);
    objc_storeStrong((id *)&v13->_privacyPolicyText, a4);
    objc_storeStrong((id *)&v13->_privacyPolicyURL, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyResponse termsOfService](self, "termsOfService"));
  [v4 encodeObject:v5 forKey:@"termsOfService"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PolicyResponse privacyPolicyText](self, "privacyPolicyText"));
  [v4 encodeObject:v6 forKey:@"privacyPolicyText"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PolicyResponse privacyPolicyURL](self, "privacyPolicyURL"));
  [v4 encodeObject:v7 forKey:@"privacyPolicyURL"];
}

- (PolicyResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"termsOfService"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"privacyPolicyText"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"privacyPolicyURL"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = -[PolicyResponse initWithTermsOfService:privacyPolicyText:privacyPolicyURL:]( self,  "initWithTermsOfService:privacyPolicyText:privacyPolicyURL:",  v6,  v8,  v10);
  return v11;
}

- (NSString)termsOfService
{
  return self->_termsOfService;
}

- (NSString)privacyPolicyText
{
  return self->_privacyPolicyText;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void).cxx_destruct
{
}

@end