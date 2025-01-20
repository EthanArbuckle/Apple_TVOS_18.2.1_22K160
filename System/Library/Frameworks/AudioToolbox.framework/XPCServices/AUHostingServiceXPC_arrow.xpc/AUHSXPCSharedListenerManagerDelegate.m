@interface AUHSXPCSharedListenerManagerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (void)setListener:(id)a3;
@end

@implementation AUHSXPCSharedListenerManagerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHSXPCSharedListenerManager));
  [v4 setExportedInterface:v5];

  v6 = objc_alloc_init(&OBJC_CLASS___AUHSXPCSharedListenerManager);
  [v4 setExportedObject:v6];

  [v4 resume];
  return 1;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end