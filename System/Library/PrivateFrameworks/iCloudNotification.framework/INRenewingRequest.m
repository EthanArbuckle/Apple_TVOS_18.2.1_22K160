@interface INRenewingRequest
- (ACAccount)account;
- (void)performRequestWithSession:(id)a3 withHandler:(id)a4;
- (void)setAccount:(id)a3;
@end

@implementation INRenewingRequest

- (void)performRequestWithSession:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[INRenewingRequest urlString](self, "urlString"));

  if (v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___INRenewingRequest;
    -[INRenewingRequest performRequestWithSession:withHandler:](&v10, "performRequestWithSession:withHandler:", v6, v7);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[INRenewingRequest account](self, "account"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100005C40;
    v11[3] = &unk_100024C60;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    +[INBagRenewal attemptRenewCredentialsWithAccount:completion:]( &OBJC_CLASS___INBagRenewal,  "attemptRenewCredentialsWithAccount:completion:",  v9,  v11);
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end