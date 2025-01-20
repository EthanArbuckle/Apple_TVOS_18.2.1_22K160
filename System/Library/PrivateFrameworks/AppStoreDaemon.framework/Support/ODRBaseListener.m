@interface ODRBaseListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)odrEntitlementName;
- (NSString)odrServiceName;
@end

@implementation ODRBaseListener

- (NSString)odrEntitlementName
{
  return 0LL;
}

- (NSString)odrServiceName
{
  return 0LL;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ODRBaseListener odrEntitlementName](self, "odrEntitlementName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ODRBaseListener odrServiceName](self, "odrServiceName"));
  if (MKBDeviceUnlockedSinceBoot() != 1)
  {
    uint64_t v14 = ASDLogHandleForCategory(19LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      v18 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Connection to %@ interface failed: device has not been unlocked since boot",  (uint8_t *)&v17,  0xCu);
    }

    goto LABEL_12;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v6]);
  unsigned int v9 = [v8 BOOLValue];

  uint64_t v10 = ASDLogHandleForCategory(19LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      v18 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Connection to %@ interface failed: client is not suitably entitled",  (uint8_t *)&v17,  0xCu);
    }

LABEL_12:
    [v5 invalidate];
    BOOL v13 = 0;
    goto LABEL_13;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Connection to %@ interface permitted with suitable entitlements",  (uint8_t *)&v17,  0xCu);
  }

  -[ODRBaseListener configureClientWithConnection:](self, "configureClientWithConnection:", v5);
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

@end