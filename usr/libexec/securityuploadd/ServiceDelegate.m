@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.securityuploadd"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    unsigned int v7 = [v5 BOOLValue];
  }
  else {
    unsigned int v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.trustd.FileHelp"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (!v7) {
      goto LABEL_15;
    }
LABEL_11:
    v14 = sub_100010B50("xpc");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 67109120;
      unsigned int v21 = [v4 processIdentifier];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Client (pid: %d) properly entitled for supd interface, let's go",  (uint8_t *)&v20,  8u);
    }

    v13 = &protocolRef_supdProtocol;
    goto LABEL_14;
  }

  unsigned int v10 = [v8 BOOLValue];
  if ((v7 & 1) != 0) {
    goto LABEL_11;
  }
  if (v10)
  {
    v11 = sub_100010B50("xpc");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 67109120;
      unsigned int v21 = [v4 processIdentifier];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Client (pid: %d) properly entitled for trustd file helper interface, let's go",  (uint8_t *)&v20,  8u);
    }

    v13 = &protocolRef_TrustdFileHelper_protocol;
LABEL_14:

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  *v13));
    [v4 setExportedInterface:v15];

    v16 = -[supd initWithConnection:](objc_alloc(&OBJC_CLASS___supd), "initWithConnection:", v4);
    [v4 setExportedObject:v16];
    [v4 resume];
    BOOL v17 = 1;
    goto LABEL_18;
  }

@end