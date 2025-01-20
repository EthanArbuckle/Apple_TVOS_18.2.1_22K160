@interface UMSyncXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation UMSyncXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _xpcConnection]);
  __xpc_connection_set_logging(v5, 0LL);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UMSyncXPCProtocol));
  [v4 setExportedInterface:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMSyncService sharedService](&OBJC_CLASS___UMSyncService, "sharedService"));
  [v4 setExportedObject:v7];

  [v4 resume];
  return 1;
}

@end