@interface AMSDHomeKitHomeCloudShare
- (AMSDCloudDataShareToken)token;
- (AMSDHomeKitHomeCloudShare)initWithShareInvitation:(id)a3;
- (HMUserCloudShareInvitation)shareInvitation;
- (NSString)containerIdentifier;
- (NSString)hashedDescription;
- (NSURL)URL;
- (NSUUID)homeIdentifier;
- (void)setShareInvitation:(id)a3;
@end

@implementation AMSDHomeKitHomeCloudShare

- (AMSDHomeKitHomeCloudShare)initWithShareInvitation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDHomeKitHomeCloudShare;
  v6 = -[AMSDHomeKitHomeCloudShare init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareInvitation, a3);
  }

  return v7;
}

- (NSString)containerIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare shareInvitation](self, "shareInvitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 containerID]);

  return (NSString *)v3;
}

- (NSUUID)homeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare shareInvitation](self, "shareInvitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 home]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);

  return (NSUUID *)v4;
}

- (AMSDCloudDataShareToken)token
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare shareInvitation](self, "shareInvitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 shareToken]);

  return (AMSDCloudDataShareToken *)v3;
}

- (NSURL)URL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare shareInvitation](self, "shareInvitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 shareURL]);

  return (NSURL *)v3;
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare URL](self, "URL"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare containerIdentifier](self, "containerIdentifier"));
  uint64_t v8 = AMSHashIfNeeded(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare homeIdentifier](self, "homeIdentifier"));
  uint64_t v11 = AMSHashIfNeeded(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeCloudShare token](self, "token"));
  uint64_t v14 = AMSHashIfNeeded(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p URL = %@ | containerIdentifier = %@ | token = %@ | home = %@",  v3,  self,  v6,  v9,  v12,  v15));

  return (NSString *)v16;
}

- (HMUserCloudShareInvitation)shareInvitation
{
  return self->_shareInvitation;
}

- (void)setShareInvitation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end