@interface LocalSecuritydXPCServer
- (BOOL)clientHasBooleanEntitlement:(id)a3;
- (LocalSecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3 fakeEntitlements:(id)a4;
- (NSMutableDictionary)fakeEntitlements;
- (void)setFakeEntitlements:(id)a3;
@end

@implementation LocalSecuritydXPCServer

- (LocalSecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3 fakeEntitlements:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LocalSecuritydXPCServer;
  v7 = -[SecuritydXPCServer initWithSecurityClient:](&v11, "initWithSecurityClient:", a3);
  if (v7)
  {
    v8 = (NSMutableDictionary *)[v6 mutableCopy];
    fakeEntitlements = v7->_fakeEntitlements;
    v7->_fakeEntitlements = v8;
  }

  return v7;
}

- (BOOL)clientHasBooleanEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSecuritydXPCServer fakeEntitlements](self, "fakeEntitlements"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSecuritydXPCServer fakeEntitlements](self, "fakeEntitlements"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
    unsigned __int8 v8 = [v7 isEqual:&__kCFBooleanTrue];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)fakeEntitlements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFakeEntitlements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end