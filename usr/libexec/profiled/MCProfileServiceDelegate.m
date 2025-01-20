@interface MCProfileServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MCProfileServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionTracker]);
  objc_msgSend(v6, "trackConnectionFromPID:", objc_msgSend(v4, "processIdentifier"));

  v7 = objc_opt_new(&OBJC_CLASS___MCProfileServicer);
  -[MCProfileServicer setXpcConnection:](v7, "setXpcConnection:", v4);
  uint64_t v8 = MCXPCProtocolInterface([v4 setExportedObject:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setExportedInterface:v9];

  uint64_t v10 = MCProfileConnectionXPCProtocolInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v4 setRemoteObjectInterface:v11];

  [v4 resume];
  return 1;
}

@end