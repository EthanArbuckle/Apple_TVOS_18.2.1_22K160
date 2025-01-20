@interface ASXListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ASXListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.siri.acousticsignature"]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASXSignatureExtracting));
    [v4 setExportedInterface:v6];

    v7 = objc_alloc_init(&OBJC_CLASS___ASXConnection);
    [v4 setExportedObject:v7];

    [v4 resume];
  }

  return v5 != 0LL;
}

@end