@interface DMDEmergencyModeListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DMDEmergencyModeListenerDelegate)initWithPolicyPersistence:(id)a3;
- (DMDPolicyPersistence)policyPersistence;
@end

@implementation DMDEmergencyModeListenerDelegate

- (DMDEmergencyModeListenerDelegate)initWithPolicyPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DMDEmergencyModeListenerDelegate;
  v6 = -[DMDEmergencyModeListenerDelegate init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policyPersistence, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.dmd.emergency-mode"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v6, v7) & 1) != 0 && ([v6 BOOLValue])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMFEmergencyModeMonitor remoteInterface](&OBJC_CLASS___DMFEmergencyModeMonitor, "remoteInterface"));
    [v5 setExportedInterface:v8];

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEmergencyModeListenerDelegate policyPersistence](self, "policyPersistence"));
    [v5 setExportedObject:v9];

    [v5 resume];
    BOOL v10 = 1;
  }

  else
  {
    uint64_t v11 = DMFEmergencyModeLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006388C((uint64_t)v5, v12);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (DMDPolicyPersistence)policyPersistence
{
  return self->_policyPersistence;
}

- (void).cxx_destruct
{
}

@end