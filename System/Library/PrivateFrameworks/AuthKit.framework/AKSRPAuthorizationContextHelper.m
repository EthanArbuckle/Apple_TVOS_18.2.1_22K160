@interface AKSRPAuthorizationContextHelper
- (AKAuthorizationContext)authContext;
- (AKSRPAuthorizationContextHelper)initWithContext:(id)a3;
- (void)authenticationParametersWithCompletion:(id)a3;
- (void)setAuthContext:(id)a3;
@end

@implementation AKSRPAuthorizationContextHelper

- (AKSRPAuthorizationContextHelper)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKSRPAuthorizationContextHelper;
  v6 = -[AKSRPContextHelper initWithContext:](&v9, "initWithContext:", v5);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (void)authenticationParametersWithCompletion:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1000900C8;
  v5[3] = &unk_1001C7640;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___AKSRPAuthorizationContextHelper;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[AKSRPContextHelper authenticationParametersWithCompletion:](&v4, "authenticationParametersWithCompletion:", v5);
}

- (AKAuthorizationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end