@interface SecuritydXPCServerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (SecuritydXPCServerListener)init;
- (void)setListener:(id)a3;
@end

@implementation SecuritydXPCServerListener

- (SecuritydXPCServerListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SecuritydXPCServerListener;
  v2 = -[SecuritydXPCServerListener init](&v7, "init");
  if (v2)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.securityd.general");
    -[SecuritydXPCServerListener setListener:](v2, "setListener:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecuritydXPCServerListener listener](v2, "listener"));
    [v4 setDelegate:v2];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecuritydXPCServerListener listener](v2, "listener"));
    [v5 resume];
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.keychain.deny"]);

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SecuritydXPCProtocol));
    [v4 setExportedInterface:v6];

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 exportedInterface]);
    +[SecuritydXPCClient configureSecuritydXPCProtocol:]( &OBJC_CLASS___SecuritydXPCClient,  "configureSecuritydXPCProtocol:",  v7);

    v8 = -[SecuritydXPCServer initWithConnection:]( objc_alloc(&OBJC_CLASS___SecuritydXPCServer),  "initWithConnection:",  v4);
    [v4 setExportedObject:v8];

    [v4 resume];
  }

  return v5 == 0LL;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end