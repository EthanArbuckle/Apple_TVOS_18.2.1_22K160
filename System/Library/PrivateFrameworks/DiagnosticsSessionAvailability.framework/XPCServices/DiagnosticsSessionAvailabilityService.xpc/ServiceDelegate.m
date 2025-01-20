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
  BOOL v9 = -[ServiceDelegate _auditToken:hasEntitlement:]( self,  "_auditToken:hasEntitlement:",  v13,  @"com.apple.private.DiagnosticsSessionAvailability.client");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DSDiagnosticsSessionAvailabilityServiceProtocol));
    [v8 setExportedInterface:v10];

    v11 = objc_opt_new(&OBJC_CLASS___DSDiagnosticsSessionAvailabilityService);
    [v8 setExportedObject:v11];
    [v8 activate];
  }

  else
  {
    [v8 invalidate];
  }

  return v9;
}

- (BOOL)_auditToken:(id *)a3 hasEntitlement:(id)a4
{
  id v5 = a4;
  id v6 = (void *)xpc_copy_entitlement_for_token([v5 UTF8String], a3);
  id v7 = v6;
  if (v6 && xpc_BOOL_get_value(v6))
  {
    BOOL v8 = 1;
  }

  else
  {
    id v9 = DSLogSessionAvailability();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000071F0(v10);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  0LL,  0LL));
    +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 5LL, v11);

    BOOL v8 = 0;
  }

  return v8;
}

@end