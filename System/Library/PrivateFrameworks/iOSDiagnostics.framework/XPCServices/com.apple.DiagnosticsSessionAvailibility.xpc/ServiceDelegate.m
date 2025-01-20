@interface ServiceDelegate
- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  BOOL v9 = -[ServiceDelegate _auditToken:hasEntitlement:]( self,  "_auditToken:hasEntitlement:",  v13,  @"com.apple.DiagnosticsSessionAvailability.client");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DADiagnosticsSessionAvailabilityProtocol));
    [v8 setExportedInterface:v10];

    v11 = objc_opt_new(&OBJC_CLASS___DADiagnosticsSessionAvailability);
    [v8 setExportedObject:v11];
    [v8 setInterruptionHandler:&stru_10000C3D0];
    [v8 setInvalidationHandler:&stru_10000C3F0];
    [v8 resume];
  }

  return v9;
}

- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4
{
  id v5 = a4;
  id v6 = (void *)xpc_copy_entitlement_for_token([v5 UTF8String], a3);
  id v7 = v6;
  if (v6)
  {
    BOOL value = xpc_BOOL_get_value(v6);
  }

  else
  {
    uint64_t v9 = DiagnosticLogHandleForCategory(8LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000073DC(v10);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  0LL,  0LL));
    +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 5LL, v11);

    BOOL value = 0;
  }

  return value;
}

@end