@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MFAANetworkProtocol));
  [v4 setExportedInterface:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFAANetwork sharedInstance](&OBJC_CLASS___MFAANetwork, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedObject]);
  [v4 setExportedObject:v7];

  [v4 resume];
  return 1;
}

@end