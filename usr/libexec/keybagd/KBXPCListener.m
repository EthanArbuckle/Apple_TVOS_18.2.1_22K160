@interface KBXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation KBXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___KBXPCProtocol));
  [v4 setExportedInterface:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[KBXPCService sharedService](&OBJC_CLASS___KBXPCService, "sharedService"));
  [v4 setExportedObject:v6];

  [v4 resume];
  return 1;
}

@end