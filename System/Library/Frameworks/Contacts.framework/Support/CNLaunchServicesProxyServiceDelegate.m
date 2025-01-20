@interface CNLaunchServicesProxyServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CNLaunchServices)launchServices;
- (CNLaunchServicesProxyServiceDelegate)init;
- (CNLaunchServicesProxyServiceDelegate)initWithLaunchServices:(id)a3;
- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4;
- (void)applicationsAvailableForDefaultAppCategory:(id)a3 withReply:(id)a4;
- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4;
- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4;
- (void)defaultApplicationForDefaultAppCategory:(id)a3 withReply:(id)a4;
- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5;
- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5;
- (void)setLaunchServices:(id)a3;
@end

@implementation CNLaunchServicesProxyServiceDelegate

- (CNLaunchServicesProxyServiceDelegate)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___CNLaunchServices);
  v4 = -[CNLaunchServicesProxyServiceDelegate initWithLaunchServices:](self, "initWithLaunchServices:", v3);

  return v4;
}

- (CNLaunchServicesProxyServiceDelegate)initWithLaunchServices:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CNLaunchServicesProxyServiceDelegate;
  v6 = -[CNLaunchServicesProxyServiceDelegate init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_launchServices, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlementVerifier]);
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  uint64_t v11 = 0LL;
  unsigned int v8 = [v7 auditToken:v12 hasBooleanEntitlement:CNEntitlementNameContactsUIFrameworkSPI error:&v11];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNLaunchServicesRemoteAdapter launchServicesAdapterInterface]( &OBJC_CLASS___CNLaunchServicesRemoteAdapter,  "launchServicesAdapterInterface"));
    [v5 setExportedInterface:v9];
    [v5 setExportedObject:self];
    [v5 resume];
  }

  return v8;
}

- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationsForUserActivityType:v8]);

  (*((void (**)(id, void *, void))a4 + 2))(v7, v9, 0LL);
}

- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationsAvailableForHandlingURLScheme:v8]);

  (*((void (**)(id, void *, void))a4 + 2))(v7, v9, 0LL);
}

- (void)applicationsAvailableForDefaultAppCategory:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = [a3 integerValue];
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationsAvailableForDefaultAppCategory:v7]);
  v6[2](v6, v8, 0LL);
}

- (void)defaultApplicationForDefaultAppCategory:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = [a3 integerValue];
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultApplicationForDefaultAppCategory:v7]);
  v6[2](v6, v8, 0LL);
}

- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationForBundleIdentifier:v8]);

  (*((void (**)(id, void *, void))a4 + 2))(v7, v9, 0LL);
}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  [v11 openUserActivityData:v10 inApplication:v9 completionHandler:v8];
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CNLaunchServicesProxyServiceDelegate launchServices](self, "launchServices"));
  [v11 openSensitiveURLInBackground:v10 withOptions:v9 completionHandler:v8];
}

- (CNLaunchServices)launchServices
{
  return self->_launchServices;
}

- (void)setLaunchServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end