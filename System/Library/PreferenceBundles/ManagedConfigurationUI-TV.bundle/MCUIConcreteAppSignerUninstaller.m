@interface MCUIConcreteAppSignerUninstaller
- (void)uninstallApplicationWithBundleID:(id)a3;
- (void)uninstallProvisioningProfileWithUUID:(id)a3;
@end

@implementation MCUIConcreteAppSignerUninstaller

- (void)uninstallProvisioningProfileWithUUID:(id)a3
{
  id v3 = a3;
  NSLog(@"MCUIAppSignerUninstaller uninstalling provisioning profile with UUID '%@'...", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = 0LL;
  [v4 removeProvisioningProfileWithUUID:v3 outError:&v6];
  id v5 = v6;

  if (v5) {
    NSLog( @"MCUIAppSignerUninstaller failed to uninstall provisioning profile with UUID '%@' through MCProfileConnection with error: %@",  v3,  v5);
  }
}

- (void)uninstallApplicationWithBundleID:(id)a3
{
  id v3 = a3;
  NSLog(@"MCUIAppSignerUninstaller uninstalling app with bundle ID '%@'...", v3);
  v4 = (void *)objc_opt_new(&OBJC_CLASS___IXUninstallOptions);
  id v6 = 0LL;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:options:disposition:error:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:options:disposition:error:",  v3,  v4,  0LL,  &v6);
  id v5 = v6;

  if (v5) {
    NSLog( @"MCUIAppSignerUninstaller failed to uninstall app with bundle ID '%@' through IXAppInstallCoordinator with error: %@",  v3,  v5);
  }
}

@end