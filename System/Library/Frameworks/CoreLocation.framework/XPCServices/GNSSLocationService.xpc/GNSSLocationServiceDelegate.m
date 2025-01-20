@interface GNSSLocationServiceDelegate
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isExecutableAllowed:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)executablePathOfConnection:(id)a3;
@end

@implementation GNSSLocationServiceDelegate

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:a4]);
  self->BOOL hasEntitlementToRunRaven = v5 != 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasEntitlementToRunRaven = self->hasEntitlementToRunRaven;
    v9[0] = 67109120;
    v9[1] = hasEntitlementToRunRaven;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLGLS,GNSSLocationService,returnValue,%d",  (uint8_t *)v9,  8u);
  }

  BOOL v7 = self->hasEntitlementToRunRaven;

  return v7;
}

- (id)executablePathOfConnection:(id)a3
{
  id v3 = a3;
  bzero(buffer, 0x1000uLL);
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }

  return v4;
}

- (BOOL)isExecutableAllowed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"locationd", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GNSSLocationServiceDelegate executablePathOfConnection:](self, "executablePathOfConnection:", v4));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);

  LOBYTE(v6) = [v5 containsObject:v7];
  return (char)v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if (!-[GNSSLocationServiceDelegate clientConnection:hasEntitlement:]( self,  "clientConnection:hasEntitlement:",  v5,  @"com.apple.private.corelocation.GNSSLocationService"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLGLS,GNSSLocationService,Application does not have correct entitlement",  (uint8_t *)&v12,  2u);
    }

    goto LABEL_8;
  }

  if (!-[GNSSLocationServiceDelegate isExecutableAllowed:](self, "isExecutableAllowed:", v5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GNSSLocationServiceDelegate executablePathOfConnection:](self, "executablePathOfConnection:", v5));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLGLS,GNSSLocationService,Application not allowed to establish connection,%@",  (uint8_t *)&v12,  0xCu);
    }

@end