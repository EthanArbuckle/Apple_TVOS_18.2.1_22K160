@interface UARPUpdaterServiceAFUDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation UARPUpdaterServiceAFUDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UARPUpdaterService));
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new(&OBJC_CLASS___UARPUpdaterServiceAFU);
  [v4 setExportedObject:v6];
  [v4 resume];

  return 1;
}

@end