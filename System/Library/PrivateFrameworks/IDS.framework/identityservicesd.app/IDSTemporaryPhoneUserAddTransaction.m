@interface IDSTemporaryPhoneUserAddTransaction
- (IDSTemporaryPhoneUser)user;
- (IDSTemporaryPhoneUserAddTransaction)initWithUser:(id)a3 credential:(id)a4;
- (IDSTemporaryPhoneUserCredential)credential;
- (NSString)description;
- (int64_t)type;
- (void)setCredential:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation IDSTemporaryPhoneUserAddTransaction

- (IDSTemporaryPhoneUserAddTransaction)initWithUser:(id)a3 credential:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSTemporaryPhoneUserAddTransaction;
  v9 = -[IDSTemporaryPhoneUserAddTransaction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_credential, a4);
  }

  return v10;
}

- (int64_t)type
{
  return 0LL;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserAddTransaction user](self, "user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserAddTransaction credential](self, "credential"));
  v6 = @"YES";
  if (!v5) {
    v6 = @"NO";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p user: %@, credential: %@>",  v3,  self,  v4,  v6));

  return (NSString *)v7;
}

- (IDSTemporaryPhoneUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (IDSTemporaryPhoneUserCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (void).cxx_destruct
{
}

@end