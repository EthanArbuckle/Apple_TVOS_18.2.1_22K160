@interface RXSyncXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation RXSyncXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _xpcConnection]);
  __xpc_connection_set_logging(v5, 0LL);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedXPCInterface](&OBJC_CLASS___RDServer, "sharedXPCInterface"));
  [v4 setExportedInterface:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](&OBJC_CLASS___RDServer, "sharedServer"));
  [v4 setExportedObject:v7];

  [v4 resume];
  return 1;
}

@end