@interface MobileInstallationHelperServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MobileInstallationHelperServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 valueForEntitlement:@"com.apple.private.MobileInstallationHelperService.allowed"]);

  if (v5)
  {
    id v6 = MobileInstallationHelperServiceProtocolInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new(&OBJC_CLASS___MobileInstallationHelperService);
    [v4 setExportedObject:v8];
    -[MobileInstallationHelperService setXpcConnection:](v8, "setXpcConnection:", v4);
    [v4 setInterruptionHandler:&stru_10001CAC8];
    [v4 setInvalidationHandler:&stru_10001CAE8];
    [v4 resume];
LABEL_6:

    goto LABEL_7;
  }

  int v9 = [v4 processIdentifier];
  uint64_t v10 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v11 = MICopyProcessNameForPid(v9);
    v8 = (MobileInstallationHelperService *)objc_claimAutoreleasedReturnValue(v11);
    MOLogWrite(v10);
    goto LABEL_6;
  }

@end