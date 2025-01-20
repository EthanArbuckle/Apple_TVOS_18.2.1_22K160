@interface MobileInstallationServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MobileInstallationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = sub_10000A3E4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setExportedInterface:v6];

  v7 = objc_opt_new(&OBJC_CLASS___MIClientConnection);
  [v4 setExportedObject:v7];
  id v8 = sub_10000A370();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setRemoteObjectInterface:v9];

  -[MIClientConnection setXpcConnection:](v7, "setXpcConnection:", v4);
  [v4 setInterruptionHandler:&stru_1000810A8];
  [v4 setInvalidationHandler:&stru_1000810C8];
  [v4 resume];

  return 1;
}

@end