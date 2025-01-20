@interface DMDPolicyServerListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DMDPolicyPersistence)policyPersistence;
- (DMDPolicyServerListenerDelegate)initWithPolicyPersistence:(id)a3;
@end

@implementation DMDPolicyServerListenerDelegate

- (DMDPolicyServerListenerDelegate)initWithPolicyPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DMDPolicyServerListenerDelegate;
  v6 = -[DMDPolicyServerListenerDelegate init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policyPersistence, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.dmd.policy"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v7);
  if (isKindOfClass & 1) != 0 && (uint64_t isKindOfClass = (uint64_t)[v6 BOOLValue], (isKindOfClass))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMFPolicyMonitor remoteInterface](&OBJC_CLASS___DMFPolicyMonitor, "remoteInterface"));
    [v5 setExportedInterface:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyServerListenerDelegate policyPersistence](self, "policyPersistence"));
    [v5 setExportedObject:v12];

    [v5 resume];
    BOOL v13 = 1;
  }

  else
  {
    uint64_t v14 = DMFPolicyLog(isKindOfClass, v9, v10);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000664FC((uint64_t)v5, v15);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (DMDPolicyPersistence)policyPersistence
{
  return self->_policyPersistence;
}

- (void).cxx_destruct
{
}

@end