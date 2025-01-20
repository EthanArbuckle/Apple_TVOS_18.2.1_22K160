@interface EscrowRequestXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation EscrowRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.escrow-update"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  if (objc_opt_isKindOfClass(v5, v7) & 1) != 0 && ([v5 BOOLValue])
  {
    v8 = sub_10001267C("escrowrequest");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109376;
      unsigned int v19 = [v4 processIdentifier];
      __int16 v20 = 1024;
      LODWORD(v21) = [v4 effectiveUserIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "received connection from client pid %d (euid %u)",  (uint8_t *)&v18,  0xEu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___EscrowRequestXPCProtocol));
    uint64_t v11 = SecEscrowRequestSetupControlProtocol();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v4 setExportedInterface:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EscrowRequestServer server](&OBJC_CLASS___EscrowRequestServer, "server"));
    [v4 setExportedObject:v13];

    [v4 resume];
    BOOL v14 = 1;
  }

  else
  {
    v15 = sub_10001267C("SecError");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109378;
      unsigned int v19 = [v4 processIdentifier];
      __int16 v20 = 2112;
      v21 = @"com.apple.private.escrow-update";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "escrow-update: Client pid: %d doesn't have entitlement: %@",  (uint8_t *)&v18,  0x12u);
    }

    BOOL v14 = 0;
  }

  return v14;
}

@end