@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = -[LSRConnection initWithXPCConnection:](objc_alloc(&OBJC_CLASS___LSRConnection), "initWithXPCConnection:", v4);
  uint64_t v6 = SFLSRGetInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 setExportedInterface:v7];

  uint64_t Interface = SFLSRDelegateGetInterface([v4 setExportedObject:v5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(Interface);
  [v4 setRemoteObjectInterface:v9];

  [v4 resume];
  return 1;
}

@end