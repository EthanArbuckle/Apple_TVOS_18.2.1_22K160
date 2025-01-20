@interface IPConfigurationHelperDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IPConfigurationHelperDelegate)init;
@end

@implementation IPConfigurationHelperDelegate

- (IPConfigurationHelperDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IPConfigurationHelperDelegate;
  v2 = -[IPConfigurationHelperDelegate init](&v4, "init");
  if (v2) {
    sub_10000315C((uint64_t)"Helper");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.IPConfigurationHelper.PvD"]);
  if (!v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }

  if (([v5 BOOLValue] & 1) == 0)
  {
    uint64_t v10 = sub_100009A18();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v11, v12))
    {
      memset(v18, 0, sizeof(v18));
      unsigned int v13 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v11, (os_log_type_t)v12)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 2LL;
      }
      v17[0] = 0;
      v15 = (_OWORD *)_os_log_send_and_compose_impl( v14,  0LL,  v18,  256LL,  &_mh_execute_header,  v11,  v12,  "rejecting new connection due to missing entitlement",  v17,  2);
      __SC_log_send2(5LL, v11, v12, 0LL, v15);
      if (v15 != v18) {
        free(v15);
      }
    }

    goto LABEL_12;
  }

  v7 = objc_opt_new(&OBJC_CLASS___IPHPvDInfoRequestServer);
  [v4 setExportedObject:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___IPHPvDInfoRequestProtocol));
  [v4 setExportedInterface:v8];

  [v4 resume];
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

@end