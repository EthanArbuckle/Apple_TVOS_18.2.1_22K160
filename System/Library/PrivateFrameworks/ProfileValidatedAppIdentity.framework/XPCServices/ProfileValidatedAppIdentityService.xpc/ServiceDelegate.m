@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PVAppIdentityServiceProtocol));
  [v4 setExportedInterface:v5];

  v6 = -[PVAppIdentityService initWithConnection:]( objc_alloc(&OBJC_CLASS___PVAppIdentityService),  "initWithConnection:",  v4);
  [v4 setExportedObject:v6];
  [v4 resume];

  return 1;
}

@end