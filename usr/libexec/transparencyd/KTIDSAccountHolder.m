@interface KTIDSAccountHolder
- (KTIDSAccountHolder)initWithIDSAccount:(id)a3;
- (KTIDSAccountHolder)initWithIDSDSID:(id)a3 type:(int)a4;
- (NSString)idsDSID;
- (int)accountType;
- (void)setAccountType:(int)a3;
- (void)setIdsDSID:(id)a3;
@end

@implementation KTIDSAccountHolder

- (KTIDSAccountHolder)initWithIDSDSID:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___KTIDSAccountHolder;
  v7 = -[KTIDSAccountHolder init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    -[KTIDSAccountHolder setIdsDSID:](v7, "setIdsDSID:", v6);
    -[KTIDSAccountHolder setAccountType:](v8, "setAccountType:", v4);
    v9 = v8;
  }

  return v8;
}

- (KTIDSAccountHolder)initWithIDSAccount:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
  id v6 = [v4 accountType];

  v7 = -[KTIDSAccountHolder initWithIDSDSID:type:](self, "initWithIDSDSID:type:", v5, v6);
  return v7;
}

- (NSString)idsDSID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdsDSID:(id)a3
{
}

- (int)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int)a3
{
  self->_accountType = a3;
}

- (void).cxx_destruct
{
}

@end