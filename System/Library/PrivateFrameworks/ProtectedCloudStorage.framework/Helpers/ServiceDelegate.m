@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PCSKeySyncing)manager;
- (void)setManager:(id)a3;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.protectedcloudstorage.keysyncing"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v5, v6) & 1) != 0 && ([v5 BOOLValue])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PCSSyncingProtocol));
    [v4 setExportedInterface:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 exportedInterface]);
    _PCSSyncingSetupInterface();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PCSSyncing defaultPCSSyncing](&OBJC_CLASS___PCSSyncing, "defaultPCSSyncing"));
    [v4 setExportedObject:v9];
    [v4 resume];

    BOOL v10 = 1;
  }

  else
  {
    v11 = (void *)qword_10002BDE0;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v14[0] = 67109378;
      v14[1] = [v4 processIdentifier];
      __int16 v15 = 2112;
      v16 = @"com.apple.private.protectedcloudstorage.keysyncing";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Client pid: %d doesn't have entitlement: %@",  (uint8_t *)v14,  0x12u);

      BOOL v10 = 0;
    }
  }

  return v10;
}

- (PCSKeySyncing)manager
{
  return (PCSKeySyncing *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end