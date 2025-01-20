@interface CLPCPolicyInterfaceHelper
+ (id)sharedInstance;
- (CLPCPolicyAccess)clpcClient;
- (CLPCPolicyInterfaceHelper)init;
- (NSString)currentActiveMode;
- (OS_os_log)log;
- (void)setClpcClient:(id)a3;
- (void)setCurrentActiveMode:(id)a3;
- (void)setLog:(id)a3;
- (void)updatePowerTargetForMode:(id)a3 withState:(BOOL)a4;
@end

@implementation CLPCPolicyInterfaceHelper

+ (id)sharedInstance
{
  if (qword_10001B788 != -1) {
    dispatch_once(&qword_10001B788, &stru_100014768);
  }
  return (id)qword_10001B790;
}

- (CLPCPolicyInterfaceHelper)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLPCPolicyInterfaceHelper;
  v2 = -[CLPCPolicyInterfaceHelper init](&v12, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerexperienced", "CLPCPolicyInterfaceHelper");
    log = v2->_log;
    v2->_log = v3;

    if ((MGGetBoolAnswer(@"IsVirtualDevice") & 1) == 0)
    {
      id v11 = 0LL;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CLPCPolicyInterface createClient:](&OBJC_CLASS___CLPCPolicyInterface, "createClient:", &v11));
      id v6 = v11;
      -[CLPCPolicyInterfaceHelper setClpcClient:](v2, "setClpcClient:", v5);

      v7 = v2->_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initialized CLPC Policy Interface", v10, 2u);
      }

      if (v6)
      {
        v8 = v2->_log;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10000D40C((uint64_t)v6, v8);
        }
      }
    }
  }

  return v2;
}

- (void)updatePowerTargetForMode:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));

  if (!v7)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D88C(v10);
    }
    goto LABEL_20;
  }

  if ([v6 isEqualToString:@"RestrictedPerfMode"])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));
    uint64_t v19 = 0LL;
    v9 = (id *)&v19;
    [v8 setHotInPocketMode:v4 options:0 error:&v19];
    goto LABEL_11;
  }

  if ([v6 isEqualToString:@"AcceleratedChargingMode"])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));
    v8 = v11;
    uint64_t v18 = 0LL;
    v9 = (id *)&v18;
    objc_super v12 = &v18;
    BOOL v13 = v4;
    uint64_t v14 = 2LL;
LABEL_10:
    [v11 setContextualPowerMode:v13 options:v14 error:v12];
LABEL_11:
    v10 = (os_log_s *)*v9;

    if (v10)
    {
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper log](self, "log"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10000D8CC((uint64_t)v6, (uint64_t)v10, v15);
      }
      goto LABEL_19;
    }

    goto LABEL_14;
  }

  if ([v6 isEqualToString:@"LongChargingMode"])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLPCPolicyInterfaceHelper clpcClient](self, "clpcClient"));
    v8 = v11;
    uint64_t v17 = 0LL;
    v9 = (id *)&v17;
    objc_super v12 = &v17;
    BOOL v13 = v4;
    uint64_t v14 = 1LL;
    goto LABEL_10;
  }

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLog:(id)a3
{
}

- (CLPCPolicyAccess)clpcClient
{
  return (CLPCPolicyAccess *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClpcClient:(id)a3
{
}

- (NSString)currentActiveMode
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCurrentActiveMode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end