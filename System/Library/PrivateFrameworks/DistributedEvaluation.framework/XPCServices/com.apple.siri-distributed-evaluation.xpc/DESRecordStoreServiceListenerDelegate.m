@interface DESRecordStoreServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation DESRecordStoreServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = -[DESRecordStoreServiceProxy initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___DESRecordStoreServiceProxy),  "initWithXPCConnection:",  v4);
  uint64_t XPCInterface = DESServiceGetXPCInterface(0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
  [v4 setExportedInterface:v7];

  [v4 setExportedObject:v5];
  [v4 resume];

  return 1;
}

@end