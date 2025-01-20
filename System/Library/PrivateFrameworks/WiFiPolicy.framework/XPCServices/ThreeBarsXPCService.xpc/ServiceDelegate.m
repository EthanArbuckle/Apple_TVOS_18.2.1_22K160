@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TBXPCServiceProtocol));
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new(&OBJC_CLASS___TBXPCService);
  [v4 setExportedObject:v6];
  [v4 resume];

  NSLog(@"%s: new connection has resumed", "-[ServiceDelegate listener:shouldAcceptNewConnection:]");
  return 1;
}

@end