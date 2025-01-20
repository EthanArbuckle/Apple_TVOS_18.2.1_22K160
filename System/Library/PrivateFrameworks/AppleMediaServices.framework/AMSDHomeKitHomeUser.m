@interface AMSDHomeKitHomeUser
- (AMSDHomeKitHomeUser)initWithUser:(id)a3;
- (HMUser)user;
- (NSString)hashedDescription;
- (NSString)name;
- (NSUUID)identifier;
- (void)setUser:(id)a3;
@end

@implementation AMSDHomeKitHomeUser

- (AMSDHomeKitHomeUser)initWithUser:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDHomeKitHomeUser;
  v6 = -[AMSDHomeKitHomeUser init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_user, a3);
  }

  return v7;
}

- (NSUUID)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeUser user](self, "user"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);

  return (NSUUID *)v3;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeUser user](self, "user"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeUser name](self, "name"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeUser identifier](self, "identifier"));
  uint64_t v8 = AMSHashIfNeeded(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p name = %@ | identifier = %@>",  v3,  self,  v6,  v9));

  return (NSString *)v10;
}

- (HMUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end