@interface AMSSyncAccountFlagsTask
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4;
- (id)performSync;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation AMSSyncAccountFlagsTask

- (AMSSyncAccountFlagsTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSSyncAccountFlagsTask;
  v9 = -[AMSSyncAccountFlagsTask init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performSync
{
  v5[1] = 3221225472LL;
  v5[2] = sub_68E4;
  v5[3] = &unk_144B0;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AMSSyncAccountFlagsTask;
  v5[0] = _NSConcreteStackBlock;
  id v2 = -[AMSSyncAccountFlagsTask performTaskWithBlock:](&v4, "performTaskWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end