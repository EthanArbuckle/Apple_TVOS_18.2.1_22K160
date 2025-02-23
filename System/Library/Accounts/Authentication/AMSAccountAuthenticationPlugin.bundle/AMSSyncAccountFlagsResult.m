@interface AMSSyncAccountFlagsResult
- (AMSSyncAccountFlagsResult)initWithAccountFlags:(id)a3;
- (NSDictionary)accountFlags;
- (void)setAccountFlags:(id)a3;
@end

@implementation AMSSyncAccountFlagsResult

- (AMSSyncAccountFlagsResult)initWithAccountFlags:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSSyncAccountFlagsResult;
  v6 = -[AMSSyncAccountFlagsResult init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountFlags, a3);
  }

  return v7;
}

- (NSDictionary)accountFlags
{
  return self->_accountFlags;
}

- (void)setAccountFlags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end