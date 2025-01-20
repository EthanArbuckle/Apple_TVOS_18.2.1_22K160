@interface CDServiceClient
+ (CDServiceClient)currentClient;
- (BOOL)hasAMSDelegatePurchaseEntitlement;
- (BOOL)hasAppSignInOverrideBundleIdentifierEntitlement;
- (BOOL)hasDaemonStatusEntitlement;
- (BOOL)hasRestrictedAccessEntitlement;
- (BOOL)hasStoreAuthenticationEntitlement;
- (BOOL)hasStorePurchaseEntitlement;
- (BOOL)hasSystemAuthenticationEntitlement;
- (BOOL)shouldReceiveDeviceEvents;
- (BSAuditToken)auditToken;
- (CDServiceClient)initWithAuditToken:(id)a3;
- (CDServiceClient)initWithConnection:(id)a3;
- (NSString)bundleIdentifier;
@end

@implementation CDServiceClient

- (CDServiceClient)initWithAuditToken:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CDServiceClient;
  v5 = -[CDServiceClient init](&v9, "init");
  if (v5)
  {
    v6 = (BSAuditToken *)[v4 copy];
    auditToken = v5->_auditToken;
    v5->_auditToken = v6;
  }

  return v5;
}

- (CDServiceClient)initWithConnection:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromNSXPCConnection:](&OBJC_CLASS___BSAuditToken, "tokenFromNSXPCConnection:", a3));
  v5 = -[CDServiceClient initWithAuditToken:](self, "initWithAuditToken:", v4);

  return v5;
}

+ (CDServiceClient)currentClient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (v2) {
    v3 = -[CDServiceClient initWithConnection:](objc_alloc(&OBJC_CLASS___CDServiceClient), "initWithConnection:", v2);
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[BSAuditToken bundleID](self->_auditToken, "bundleID");
}

- (BOOL)hasDaemonStatusEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.daemon-status");
}

- (BOOL)hasStorePurchaseEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.store-purchase");
}

- (BOOL)hasAppSignInOverrideBundleIdentifierEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.app-sign-in.override-bundle-identifier");
}

- (BOOL)hasAMSDelegatePurchaseEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.ams-delegate-purchase");
}

- (BOOL)hasSystemAuthenticationEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.system-service");
}

- (BOOL)hasRestrictedAccessEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.restricted-access");
}

- (BOOL)hasStoreAuthenticationEntitlement
{
  return -[BSAuditToken hasEntitlement:]( self->_auditToken,  "hasEntitlement:",  @"com.apple.companion-authentication.store-authentication");
}

- (BOOL)shouldReceiveDeviceEvents
{
  if (-[CDServiceClient hasStorePurchaseEntitlement](self, "hasStorePurchaseEntitlement")) {
    return 1;
  }
  else {
    return -[CDServiceClient hasSystemAuthenticationEntitlement](self, "hasSystemAuthenticationEntitlement");
  }
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
}

@end