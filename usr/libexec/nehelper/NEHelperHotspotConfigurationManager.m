@interface NEHelperHotspotConfigurationManager
- (NEHelperHotspotConfigurationManager)initWithFirstMessage:(id)a3;
- (NSString)name;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperHotspotConfigurationManager

- (NEHelperHotspotConfigurationManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)(id)objc_claimAutoreleasedReturnValue(remote_connection);
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationManager);
  v8 = (void *)xpc_connection_copy_entitlement_value(v6, "com.apple.developer.networking.HotspotConfiguration");
  v9 = v8;
  if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v9))
  {
    pid_t pid = xpc_connection_get_pid(v6);
    int v18 = proc_name(pid, buf, 0x100u);
    uint64_t v19 = ne_log_obj();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v18 < 1)
    {
      if (v21)
      {
        *(_DWORD *)v28 = 138412546;
        id v29 = (id)objc_opt_class(v7);
        __int16 v30 = 1024;
        LODWORD(v31) = pid;
        id v22 = v29;
        v23 = "%@ process %d is missing the com.apple.developer.networking.HotspotConfiguration entitlement.";
        v24 = v20;
        uint32_t v25 = 18;
        goto LABEL_18;
      }
    }

    else if (v21)
    {
      *(_DWORD *)v28 = 138412802;
      id v29 = (id)objc_opt_class(v7);
      __int16 v30 = 2080;
      v31 = buf;
      __int16 v32 = 1024;
      pid_t v33 = pid;
      id v22 = v29;
      v23 = "%@ process %s[%d] is missing the com.apple.developer.networking.HotspotConfiguration entitlement.";
      v24 = v20;
      uint32_t v25 = 28;
LABEL_18:
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, v28, v25);
    }

    v16 = 0LL;
    goto LABEL_16;
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NEHelperHotspotConfigurationManager;
  v10 = -[NEHelperHotspotConfigurationManager init](&v27, "init");
  if (v10)
  {
    objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationManager);
    if (qword_10003EB20 != -1) {
      dispatch_once(&qword_10003EB20, &stru_100034C40);
    }
    uint64_t v11 = NECopySigningIdentifierForXPCMessage(v4);
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v11;

    uint64_t v13 = ne_log_obj();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v10->_bundleID;
      *(_DWORD *)buf = 138412290;
      v35 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Created new Hotspot configuration delegate with bundleID = %@",  buf,  0xCu);
    }
  }

  self = v10;
  v16 = self;
LABEL_16:

  return v16;
}

- (NSString)name
{
  return self->_bundleID;
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)(id)qword_10003EB10;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100008FE0((uint64_t)self, v4);
  if (!v5)
  {
    uint64_t v7 = ne_log_obj(v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = (id)objc_opt_class(self);
      id v9 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%@ failed to process request.",  (uint8_t *)&v10,  0xCu);
    }

    if (xpc_dictionary_get_BOOL(v4, "IsResponseExpected")) {
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 107LL, 0LL);
    }
  }
}

- (void).cxx_destruct
{
}

@end