@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CoreMLModelSecurityProtocol));
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new(&OBJC_CLASS___CoreMLModelSecurity);
  id v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"com.apple.CoreMLModelSecurity.%lu", [v4 hash]));
  v8 = (void *)os_transaction_create([v7 UTF8String]);
  -[CoreMLModelSecurity setTxn:](v6, "setTxn:", v8);

  [v4 setExportedObject:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CoreMLModelSecurityServiceToClientProtocol));
  [v4 setRemoteObjectInterface:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_10000C328]);
  -[CoreMLModelSecurity setClientProxy:](v6, "setClientProxy:", v10);
  [v4 resume];

  return 1;
}

@end