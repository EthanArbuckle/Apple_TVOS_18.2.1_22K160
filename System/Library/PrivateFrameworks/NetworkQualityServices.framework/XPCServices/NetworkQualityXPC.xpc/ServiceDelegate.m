@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.networkQuality"]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NetworkQualityXPCProtocol));
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new(&OBJC_CLASS___NetworkQualityXPC);
    [v4 setExportedObject:v8];
    [v4 resume];
  }

  return v6;
}

@end