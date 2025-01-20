@interface SOSControlServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)internalSOSClient;
@end

@implementation SOSControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"keychain-cloud-circle"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0 || (uint64_t v7 = (uint64_t)[v5 BOOLValue], (v7 & 1) == 0))
  {
    v16 = sub_10001267C("SecError");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109378;
      unsigned int v21 = [v4 processIdentifier];
      __int16 v22 = 2112;
      v23 = @"keychain-cloud-circle";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sos: Client pid: %d doesn't have entitlement: %@",  (uint8_t *)&v20,  0x12u);
    }

    goto LABEL_10;
  }

  v9 = sub_1001C41CC(v7, v8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    v17 = sub_10001267C("SecError");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109120;
      unsigned int v21 = [v4 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "sos: SOS have not launched yet, come later, pid: %d",  (uint8_t *)&v20,  8u);
    }

    v11 = 0LL;
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_11;
  }

  v11 = (os_log_s *)v10;
  id v12 = -[SOSClientRemote initSOSConnectionWithConnection:account:]( objc_alloc(&OBJC_CLASS___SOSClientRemote),  "initSOSConnectionWithConnection:account:",  v4,  v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SOSControlProtocol));
  [v4 setExportedInterface:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 exportedInterface]);
  _SOSControlSetupInterface();

  [v4 setExportedObject:v12];
  [v4 resume];

  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (id)internalSOSClient
{
  v2 = objc_alloc(&OBJC_CLASS___SOSClient);
  return -[SOSClient initSOSClientWithAccount:](v2, "initSOSClientWithAccount:", sub_1001C41CC((uint64_t)v2, v3));
}

@end