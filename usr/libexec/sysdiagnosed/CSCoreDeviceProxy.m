@interface CSCoreDeviceProxy
+ (BOOL)isHost;
+ (id)description;
+ (id)getProxiesForDiagnosticID:(id)a3;
+ (void)initRemoteServers;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3;
- (unint64_t)getTimeoutSec;
@end

@implementation CSCoreDeviceProxy

+ (BOOL)isHost
{
  return 0;
}

+ (id)description
{
  if (+[CSCoreDeviceProxy isHost](&OBJC_CLASS___CSCoreDeviceProxy, "isHost")) {
    return @"CoreDeviceProxyRemote";
  }
  else {
    return @"CoreDeviceProxyHost";
  }
}

+ (void)initRemoteServers
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sysdiagnose.cosysdiagnose.CSCoreDeviceProxy", &_dispatch_queue_attr_concurrent);
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener( "com.apple.sysdiagnose.remote.trusted",  v2,  0LL);
  xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100089C48);
  xpc_remote_connection_activate(remote_service_listener);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logSubsystem]);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Remote server initialized.",  v6,  2u);
  }
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  unsigned __int8 v7 = [v6 getCollectAllTrustedForDiagnosticID:v4];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logSubsystem]);

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) == 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Did not detect the --collectAllTrusted flag, skipping proxies",  buf,  2u);
    }

    id v25 = -[NSMutableArray copy](v5, "copy");
    goto LABEL_18;
  }

  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Detected --collectAllTrusted flag, beginning to find all proxies of connected devices",  buf,  2u);
  }

  if (([a1 isHost] & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 logSubsystem]);

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Proxy is not host, skipping browseDevices",  buf,  2u);
    }

    id v25 = -[NSMutableArray copy](v5, "copy");
LABEL_18:
    id v24 = v25;
    goto LABEL_19;
  }

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  v40 = buf;
  uint64_t v41 = 0x2020000000LL;
  uint64_t v42 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v38 = 0LL;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10004B1F4;
  v29[3] = &unk_100089C70;
  v14 = v11;
  v30 = v14;
  v33 = buf;
  v34 = &v35;
  id v31 = v4;
  v15 = v5;
  v32 = v15;
  remote_device_browse_present(10LL, v13, v29);

  dispatch_time_t v16 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_semaphore_wait(v14, v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10005788C(v18);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logSubsystem]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *((void *)v40 + 3);
    uint64_t v22 = v36[3];
    uint64_t description = remote_device_type_get_description(10LL);
    *(_DWORD *)v43 = 134218498;
    uint64_t v44 = v21;
    __int16 v45 = 2048;
    uint64_t v46 = v22;
    __int16 v47 = 2080;
    uint64_t v48 = description;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: Finished browsing. Found %lu devices (%lu usable) of type %s",  v43,  0x20u);
  }

  id v24 = -[NSMutableArray copy](v15, "copy");
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:
  return v24;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  return -[CSRemoteXPCProxy triggerCoSysdiagnoseWithParams:forServiceName:]( self,  "triggerCoSysdiagnoseWithParams:forServiceName:",  a3,  "com.apple.sysdiagnose.remote.trusted");
}

- (unint64_t)getTimeoutSec
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logSubsystem]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = 60LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CSCoreDeviceProxy: timeout target requested. Using %lus",  (uint8_t *)&v5,  0xCu);
  }

  return 60LL;
}

@end