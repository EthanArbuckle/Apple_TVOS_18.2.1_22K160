@interface CKKSControlServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation CKKSControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.ckks"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0 || (uint64_t v8 = (uint64_t)[v5 BOOLValue], (v8 & 1) == 0))
  {
    id v15 = sub_1000AA6AC(@"ckks", 0LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 67109378;
      unsigned int v21 = [v4 processIdentifier];
      __int16 v22 = 2112;
      v23 = @"com.apple.private.ckks";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Client pid: %d doesn't have entitlement: %@",  (uint8_t *)&v20,  0x12u);
    }

    goto LABEL_8;
  }

  if ((sub_100098648(v8, v9) & 1) == 0)
  {
    id v18 = sub_1000AA6AC(@"ckks", 0LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 67109120;
      unsigned int v21 = [v4 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Client pid: %d attempted to use CKKS, but CKKS is not enabled.",  (uint8_t *)&v20,  8u);
    }

LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CKKSControlProtocol));
  uint64_t v11 = CKKSSetupControlProtocol();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v4 setExportedInterface:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  [v4 setExportedObject:v13];

  [v4 resume];
  BOOL v14 = 1;
LABEL_9:

  return v14;
}

@end