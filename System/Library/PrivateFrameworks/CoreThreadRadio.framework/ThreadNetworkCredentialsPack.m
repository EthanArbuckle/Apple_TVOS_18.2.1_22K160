@interface ThreadNetworkCredentialsPack
+ (BOOL)supportsSecureCoding;
- (THThreadNetworkCredentials)credentials;
- (THThreadNetworkCredentialsDataSet)credentialsDataSet;
- (ThreadNetworkCredentialsPack)initWithCoder:(id)a3;
- (id)initCreds:(id)a3 credentialsDataSet:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentials:(id)a3;
- (void)setCredentialsDataSet:(id)a3;
@end

@implementation ThreadNetworkCredentialsPack

- (id)initCreds:(id)a3 credentialsDataSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ThreadNetworkCredentialsPack;
  v9 = -[ThreadNetworkCredentialsPack init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credentials, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (ThreadNetworkCredentialsPack)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(THThreadNetworkCredentials, v5),  @"creds");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(THThreadNetworkCredentialsDataSet, v8),  @"dscreds");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[ThreadNetworkCredentialsPack initCreds:credentialsDataSet:](self, "initCreds:credentialsDataSet:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ThreadNetworkCredentialsPack credentials](self, "credentials"));
  [v4 encodeObject:v5 forKey:@"creds"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ThreadNetworkCredentialsPack credentialsDataSet](self, "credentialsDataSet"));
  [v4 encodeObject:v6 forKey:@"dscreds"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetworkCredentials)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (void)setCredentialsDataSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end