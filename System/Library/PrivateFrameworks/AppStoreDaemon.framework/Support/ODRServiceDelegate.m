@interface ODRServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ODRServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  uint64_t v5 = ASDLogHandleForCategory(19LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "appstored is pondering accepting a new connection...",  buf,  2u);
  }

  int v7 = MKBDeviceUnlockedSinceBoot();
  if (v7 == 1)
  {
  }

  else
  {
    uint64_t v8 = ASDLogHandleForCategory(19LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Refusing connection to the foundation interface. This device has not been unlocked since boot, and we can do no useful work.",  v11,  2u);
    }

    [v4 invalidate];
  }

  return v7 == 1;
}

- (void).cxx_destruct
{
}

@end