@interface _LSInstallerClient
+ (id)makeServerInstallerConnection;
+ (id)syncServerInstallerProxyForShim;
+ (void)makeServerInstallerConnection;
@end

@implementation _LSInstallerClient

+ (id)makeServerInstallerConnection
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    +[_LSInstallerClient makeServerInstallerConnection].cold.3();
  }

  [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:6];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = _LSGetAuditTokenForSelf();
  int v3 = _LSCheckMachPortAccessForAuditToken(v2, v1);

  _LSDefaultLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      +[_LSInstallerClient makeServerInstallerConnection].cold.2();
    }

    id v6 = objc_alloc(MEMORY[0x189607B30]);
    [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:6];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v6 initWithMachServiceName:v7 options:4096];

    uint64_t v9 = installationInterface();
  }

  else
  {
    if (v5) {
      +[_LSInstallerClient makeServerInstallerConnection].cold.1();
    }

    id v10 = objc_alloc(MEMORY[0x189607B30]);
    [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v10 initWithMachServiceName:v11 options:4096];

    uint64_t v9 = +[_LSDModifyService XPCInterface](&OBJC_CLASS____LSDModifyService, "XPCInterface");
  }

  v12 = (void *)v9;
  [v8 setRemoteObjectInterface:v9];

  [v8 setInterruptionHandler:&__block_literal_global_45];
  [v8 setInvalidationHandler:&__block_literal_global_3];
  return v8;
}

+ (id)syncServerInstallerProxyForShim
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_5_0];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 resume];

  return v1;
}

+ (void)makeServerInstallerConnection
{
}

@end