@interface CSRemoteXPCProxy
+ (BOOL)isDeviceWithUUIDAvailable:(id)a3;
+ (BOOL)isHost;
+ (id)description;
+ (id)getProxiesForDiagnosticID:(id)a3;
+ (id)getRemoteDeviceForUUIDStr:(id)a3;
+ (id)getService:(const char *)a3 forDevice:(id)a4;
+ (id)getUUIDStrForRemoteDevice:(id)a3;
+ (void)handleClientEvent:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5;
+ (void)handleRemoteConnection:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5;
+ (void)initRemoteServers;
+ (void)receiveFileFromRemote:(id)a3 forDiagnosticID:(id)a4 withCompletionBlock:(id)a5;
+ (void)remoteSendFile:(id)a3 toPeer:(id)a4 withTimeoutTarget:(unint64_t)a5;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3;
- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3 forServiceName:(const char *)a4;
- (CSRemoteXPCProxy)init;
- (OS_dispatch_group)remoteGroup;
- (OS_remote_device)device;
- (OS_xpc_remote_connection)connection;
- (id)_initWithDevice:(id)a3 forDiagnosticID:(id)a4;
- (unint64_t)getTimeoutSec;
- (unint64_t)getTimeoutTarget;
- (void)cancelConnection;
- (void)handleRemoteResponse:(id)a3;
- (void)safeLeaveRemoteGroup;
- (void)setConnection:(id)a3;
- (void)setDevice:(id)a3;
- (void)setRemoteGroup:(id)a3;
- (void)transferFileToHost:(id)a3;
- (void)waitToReceiveCoSysdiagnose;
@end

@implementation CSRemoteXPCProxy

- (CSRemoteXPCProxy)init
{
}

- (id)_initWithDevice:(id)a3 forDiagnosticID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___CSRemoteXPCProxy;
    v9 = -[CSProxy init](&v24, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_device, a3);
      connection = v10->_connection;
      v10->_connection = 0LL;

      remoteGroup = v10->_remoteGroup;
      v10->_remoteGroup = 0LL;

      -[CSProxy setDiagnosticID:](v10, "setDiagnosticID:", v8);
    }

    self = v10;
    v13 = self;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 logSubsystem]);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10005535C(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v13 = 0LL;
  }

  return v13;
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getRemoteUUIDsForDiagnosticID:v3]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:]( &OBJC_CLASS___CSRemoteXPCProxy,  "getRemoteDeviceForUUIDStr:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v11),  (void)v19));
        if (v12)
        {
          id v13 = -[CSRemoteXPCProxy _initWithDevice:forDiagnosticID:]( objc_alloc(&OBJC_CLASS___CSRemoteXPCProxy),  "_initWithDevice:forDiagnosticID:",  v12,  v3);
          -[NSMutableArray addObject:](v4, "addObject:", v13);
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 logSubsystem]);

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = -[NSMutableArray count](v4, "count");
    *(_DWORD *)buf = 134217984;
    id v24 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: getProxies found total: %lu",  buf,  0xCu);
  }

  id v17 = -[NSMutableArray copy](v4, "copy");
  return v17;
}

- (void)safeLeaveRemoteGroup
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](obj, "remoteGroup"));

  if (v2)
  {
    id v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](obj, "remoteGroup"));
    dispatch_group_leave(v3);
  }

  -[CSRemoteXPCProxy setRemoteGroup:](obj, "setRemoteGroup:", 0LL);
  objc_sync_exit(obj);
}

+ (id)getRemoteDeviceForUUIDStr:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    memset(uu, 0, sizeof(uu));
    id v5 = v3;
    int v6 = uuid_parse((const char *)[v5 UTF8String], uu);
    if (v6)
    {
      int v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logSubsystem]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = (const char *)v5;
        __int16 v17 = 2048;
        uint64_t v18 = (unsigned __int8 *)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: uuid_parse failed to parse '%@' and returned %lu. Returning NULL for remote device",  (uint8_t *)&v15,  0x16u);
      }

      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v10 = (void *)remote_device_copy_device_with_uuid(uu);
      if (v10) {
        goto LABEL_11;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 logSubsystem]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = (const char *)v5;
        __int16 v17 = 2080;
        uint64_t v18 = uu;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: remote_device_copy_device_with_uuid failed for UUID '%@' (uuid_t '%s'). Returning NULL",  (uint8_t *)&v15,  0x16u);
      }
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logSubsystem]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "+[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: nil UUID str given to %s, returning NULL for remote device",  (uint8_t *)&v15,  0xCu);
    }

    uint64_t v10 = 0LL;
  }

+ (id)getUUIDStrForRemoteDevice:(id)a3
{
  *(void *)uuid_t uu = 0LL;
  uint64_t v14 = 0LL;
  remote_device_copy_uuid(a3, uu);
  id v3 = (char *)calloc(0x25uLL, 1uLL);
  if (v3)
  {
    v4 = v3;
    uuid_unparse(uu, v3);
    if (!strncmp(v4, "00000000-0000-0000-0000-000000000000", 0x25uLL))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failed to parse device uuid - not appending remote UUID",  (uint8_t *)&v11,  2u);
      }

      id v5 = 0LL;
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    }

    free(v4);
    return v5;
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logSubsystem]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "+[CSRemoteXPCProxy getUUIDStrForRemoteDevice:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failed to allocate uuidStr in %s",  (uint8_t *)&v11,  0xCu);
    }

    return 0LL;
  }

+ (BOOL)isDeviceWithUUIDAvailable:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSRemoteXPCProxy getRemoteDeviceForUUIDStr:]( &OBJC_CLASS___CSRemoteXPCProxy,  "getRemoteDeviceForUUIDStr:",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

+ (BOOL)isHost
{
  return 0;
}

+ (id)description
{
  if (+[CSRemoteXPCProxy isHost](&OBJC_CLASS___CSRemoteXPCProxy, "isHost")) {
    return @"RemoteXPCProxyRemote";
  }
  else {
    return @"RemoteXPCProxyHost";
  }
}

- (unint64_t)getTimeoutSec
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logSubsystem]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = 900LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: timeout target requested. Using %lus",  (uint8_t *)&v5,  0xCu);
  }

  return 900LL;
}

- (unint64_t)getTimeoutTarget
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  unsigned int v4 = [v3 noTimeout];

  if (!v4) {
    return dispatch_time(0LL, 1000000000 * -[CSRemoteXPCProxy getTimeoutSec](self, "getTimeoutSec"));
  }
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 logSubsystem]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: timeout target requested. noTimeout is set - using DISPATCH_TIME_FOREVER",  v8,  2u);
  }

  return dispatch_time(0LL, -1LL);
}

+ (void)handleClientEvent:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5
{
  id v7 = a3;
  id v8 = (char *)a4;
  if (xpc_dictionary_get_BOOL(v8, "initiatedByRemoteHost") && !a5)
  {
    if (qword_1000A5280 != -1) {
      dispatch_once(&qword_1000A5280, &stru_100089908);
    }
    if (dword_1000A5278)
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_1000A5278, @"stress-rack", 0LL, 0);
      if (CFProperty)
      {
        CFRelease(CFProperty);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
        int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logSubsystem]);

        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v12 = "CSRemoteXPCProxy: Allowing remote invocation because we are on a stress rack device";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
          goto LABEL_19;
        }

        goto LABEL_19;
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 logSubsystem]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "BOOL isStressRackDevice(void)";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: NVRAM is not supported on this system. Returning NO for %s",  buf,  0xCu);
      }
    }

    if (!sub_100040704())
    {
      int v16 = sub_100040760();
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 logSubsystem]);

      BOOL v18 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (!v16)
      {
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Returning default value of NO for RSD invocation",  buf,  2u);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 logSubsystem]);

        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 138412290;
        v31 = v8;
        v25 = "CSRemoteXPCProxy: Can't act as remote device. Rejecting request for message: %@";
        goto LABEL_24;
      }

      if (!v18) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      v12 = "CSRemoteXPCProxy: Allowing remote invocation because on compute module C";
      goto LABEL_18;
    }

    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logSubsystem]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "CSRemoteXPCProxy: Allowing remote invocation because on compute module B";
      goto LABEL_18;
    }

+ (void)handleRemoteConnection:(id)a3 forMsg:(id)a4 isTrusted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v8, "MSG_TYPE");
  unsigned __int16 v10 = xpc_dictionary_get_uint64(v8, "RESPONSE_TYPE");
  if (!uint64)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logSubsystem]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Unknown message type. Mismatched os versions.",  buf,  2u);
    }

    else {
      unsigned __int16 uint64 = 2;
    }
  }

  int v13 = uint64;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  int v15 = v14;
  if (v13 == 1)
  {
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 logSubsystem]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Deduced msg type: Request, triggering local sysdiagnose",  v24,  2u);
    }

    +[CSRemoteXPCProxy handleClientEvent:forMsg:isTrusted:]( &OBJC_CLASS___CSRemoteXPCProxy,  "handleClientEvent:forMsg:isTrusted:",  v7,  v8,  v5);
  }

  else
  {
    unsigned int v17 = [v14 isHost];

    if (v13 == 2 && v17)
    {
      uint64_t v18 = v10;
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logSubsystem]);

      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18 == 1)
      {
        if (v21)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Deduced response type: success. Asking for file from remote",  v23,  2u);
        }

        +[CSRemoteXPCProxy receiveFileFromRemote:forDiagnosticID:withCompletionBlock:]( &OBJC_CLASS___CSRemoteXPCProxy,  "receiveFileFromRemote:forDiagnosticID:withCompletionBlock:",  v8,  0LL,  &stru_100089850);
      }

      else
      {
        if (v21)
        {
          *(_WORD *)__int128 v22 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Deduced response type: failure",  v22,  2u);
        }
      }
    }
  }
}

+ (void)initRemoteServers
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sysdiagnose.cosysdiagnose.CSRemoteXPCProxy", &_dispatch_queue_attr_concurrent);
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener( "com.apple.sysdiagnose.remote",  v2,  0LL);
  xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100089870);
  xpc_remote_connection_activate(remote_service_listener);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 logSubsystem]);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Remote server initialized.",  v6,  2u);
  }
}

+ (void)receiveFileFromRemote:(id)a3 forDiagnosticID:(id)a4 withCompletionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  xpc_object_t value = xpc_dictionary_get_value(v7, "FILE_TX");
  int v11 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (v11)
  {
    id v12 = v7;
    string = xpc_dictionary_get_string(v12, "FILE_NAME");
    if (!string)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 logSubsystem]);

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100055434(v30, v31, v32, v33, v34, v35, v36, v37);
      }
      v38 = 0LL;
      goto LABEL_27;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);

    if (!sub_10002A92C(v15))
    {
      int v16 = xpc_dictionary_get_string(v12, "udid");
      if (v16)
      {
        unsigned int v17 = v16;
        uint64_t v18 = (void *)remote_device_copy_device_with_name();
        id v61 = v8;
        if (!v18)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 logSubsystem]);

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v70 = (char *)v17;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failed to fetch device for UDID '%s'. Not appending remote UUID",  buf,  0xCu);
          }

          v30 = v15;
          goto LABEL_26;
        }

        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[CSRemoteXPCProxy getUUIDStrForRemoteDevice:]( &OBJC_CLASS___CSRemoteXPCProxy,  "getUUIDStrForRemoteDevice:",  v18));
        v60 = (void *)v19;
        if (v19)
        {
          uint64_t v20 = v19;
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByDeletingPathExtension]);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByDeletingPathExtension]);

          int v15 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingFormat:@"_%@.tar.gz", v20]);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 logSubsystem]);

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v70 = (char *)v15;
            v25 = "CSRemoteXPCProxy: Found remote UUID. New tarball name: %@";
LABEL_24:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          }
        }

        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 logSubsystem]);

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v70 = (char *)v17;
            v25 = "CSRemoteXPCProxy: Failed to fetch uuidStr for device with UDID '%s'. Not appending remote UUID";
            goto LABEL_24;
          }
        }

        v30 = v15;
LABEL_26:
        id v8 = v61;

        v38 = v30;
        goto LABEL_27;
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 logSubsystem]);

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = (char *)v15;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: UDID not found in xpc dict for name: %@ - assuming legacy client and not appending remote UUID",  buf,  0xCu);
      }
    }

    v30 = v15;
    v38 = v30;
LABEL_27:

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v45 = (id)objc_claimAutoreleasedReturnValue([v44 waitForHostOutputDirForDiagnosticID:v8]);

    if (v45)
    {
      if (!sub_10002A92C(v38))
      {
        id v62 = v8;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v45 stringByAppendingPathComponent:@"/co-sysdiagnoses/"]);
        NSFileAttributeKey v67 = NSFilePosixPermissions;
        v68 = &off_10009A498;
        v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
        id v66 = 0LL;
        unsigned int v49 = [v46 createDirectoryAtPath:v47 withIntermediateDirectories:1 attributes:v48 error:&v66];
        id v50 = v66;

        if (v49)
        {
          v51 = v45;
          id v45 = v47;
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10005538C((uint64_t)v47, v50);
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v55 = (void *)objc_claimAutoreleasedReturnValue([v50 localizedDescription]);
          [v54 stderrWrite:@"Unable to create co-sysdiagnose directory at: %@ with error: %@", v47, v55];

          v51 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v56 = (void *)objc_claimAutoreleasedReturnValue([v50 localizedDescription]);
          [v51 log:@"Unable to create co-sysdiagnose directory at: %@ with error: %@", v47, v56];
        }

        id v8 = v62;
      }

      id v57 = objc_claimAutoreleasedReturnValue([v45 stringByAppendingPathComponent:v38]);
      id v58 = [v57 fileSystemRepresentation];
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_10002A970;
      v63[3] = &unk_100089898;
      id v64 = v57;
      v65 = v9;
      id v59 = v57;
      xpc_file_transfer_write_to_path(v11, v58, v63);
    }

    else
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 logSubsystem]);

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = (char *)v38;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failed to write remote archive %@ because host dir is not set",  buf,  0xCu);
      }

      v9[2](v9);
    }

    goto LABEL_40;
  }

  v26 = xpc_copy_description(v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 logSubsystem]);

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Did not receive any file transfer object. Got xpc response: %s",  buf,  0xCu);
  }

  free(v26);
  v9[2](v9);
LABEL_40:
}

+ (void)remoteSendFile:(id)a3 toPeer:(id)a4 withTimeoutTarget:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  unsigned __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logSubsystem]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Transferring %@ to host",  buf,  0xCu);
  }

  dispatch_group_t v11 = dispatch_group_create();
  id v12 = v7;
  int v13 = basename((char *)[v12 fileSystemRepresentation]);
  if (v13)
  {
    uint64_t v14 = v13;
    xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v15, "MSG_TYPE", 2uLL);
    xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 1uLL);
    xpc_dictionary_set_string(v15, "FILE_NAME", v14);
    id v16 = sub_100020D50();
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = v17;
    if (v17) {
      xpc_dictionary_set_string(v15, "udid", (const char *)[v17 UTF8String]);
    }
    id v19 = [v12 fileSystemRepresentation];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10002ADE4;
    v34[3] = &unk_1000898C0;
    uint64_t v20 = v11;
    uint64_t v35 = v20;
    BOOL v21 = (void *)xpc_file_transfer_create_with_path(v19, v34);
    if (v21)
    {
      dispatch_group_enter(v20);
      xpc_dictionary_set_value(v15, "FILE_TX", v21);
      xpc_remote_connection_send_message(v8, v15);
      if (!a5 || !dispatch_group_wait(v20, a5)) {
        goto LABEL_17;
      }
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 logSubsystem]);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v24 = "CSRemoteXPCProxy: Timed out waiting to send file to host";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      }
    }

    else
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 logSubsystem]);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v24 = "CSRemoteXPCProxy: Couldn't create transfer object. Skipping file transfer";
        goto LABEL_15;
      }
    }

LABEL_17:
    goto LABEL_18;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  xpc_object_t v15 = (xpc_object_t)objc_claimAutoreleasedReturnValue([v25 logSubsystem]);

  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
    sub_100055464((os_log_s *)v15, v26, v27, v28, v29, v30, v31, v32);
  }
LABEL_18:
}

+ (id)getService:(const char *)a3 forDevice:(id)a4
{
  id v5 = a4;
  uint64_t name = remote_device_get_name();
  if (remote_device_get_state(v5) == 2)
  {
    id v7 = (id)remote_device_copy_service(v5, a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logSubsystem]);

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        int v14 = 136315394;
        xpc_object_t v15 = a3;
        __int16 v16 = 2080;
        uint64_t v17 = name;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Found service '%s' on connected device '%s'. Device is usable",  (uint8_t *)&v14,  0x16u);
      }

      id v7 = v7;
      dispatch_group_t v11 = v7;
    }

    else
    {
      if (v10)
      {
        int v14 = 136315394;
        xpc_object_t v15 = a3;
        __int16 v16 = 2080;
        uint64_t v17 = name;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Service '%s' not found for device %s",  (uint8_t *)&v14,  0x16u);
      }

      dispatch_group_t v11 = 0LL;
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v12 logSubsystem]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      xpc_object_t v15 = (const char *)name;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Device %s not connected",  (uint8_t *)&v14,  0xCu);
    }

    dispatch_group_t v11 = 0LL;
  }

  return v11;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3 forServiceName:(const char *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy device](self, "device"));
  uint64_t type = remote_device_get_type();

  uint64_t description = remote_device_type_get_description(type);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy device](self, "device"));
  dispatch_group_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSRemoteXPCProxy getService:forDevice:]( &OBJC_CLASS___CSRemoteXPCProxy,  "getService:forDevice:",  a4,  v10));

  if (!v11)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 logSubsystem]);

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failing to trigger co-sysdiagnose: device is not usable",  buf,  2u);
    }

    goto LABEL_18;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  int v14 = (void *)xpc_remote_connection_create_with_remote_service(v11, v13, 0LL);
  -[CSRemoteXPCProxy setConnection:](self, "setConnection:", v14);

  xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 logSubsystem]);

  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failing to trigger co-sysdiagnose: failed to create remote xpc connection",  buf,  2u);
    }

LABEL_18:
    BOOL v30 = 0;
    goto LABEL_19;
  }

  if (v18)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Triggering co-sysdiagnose",  buf,  2u);
  }

  -[CSRemoteXPCProxy safeLeaveRemoteGroup](self, "safeLeaveRemoteGroup");
  dispatch_group_t v19 = dispatch_group_create();
  -[CSRemoteXPCProxy setRemoteGroup:](self, "setRemoteGroup:", v19);

  uint64_t v20 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](self, "remoteGroup"));
  dispatch_group_enter(v20);

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10002B4FC;
  v34[3] = &unk_1000898E8;
  void v34[4] = self;
  v34[5] = description;
  xpc_remote_connection_set_event_handler(v21, v34);

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  xpc_remote_connection_activate(v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  LODWORD(v21) = [v23 isHost];

  if ((_DWORD)v21)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 logSubsystem]);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Forcing remote to not act as host",  buf,  2u);
    }

    xpc_dictionary_set_BOOL(v6, "initiatedByRemoteHost", 1);
  }

  xpc_dictionary_set_uint64(v6, "MSG_TYPE", 1uLL);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 1uLL);
  uint64_t v26 = xpc_copy_description(v6);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 logSubsystem]);

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v36 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Forwarding to remote device: %s",  buf,  0xCu);
  }

  free(v26);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
  xpc_remote_connection_send_message(v29, v6);

  BOOL v30 = 1;
LABEL_19:

  return v30;
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  return -[CSRemoteXPCProxy triggerCoSysdiagnoseWithParams:forServiceName:]( self,  "triggerCoSysdiagnoseWithParams:forServiceName:",  a3,  "com.apple.sysdiagnose.remote");
}

- (void)cancelConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));

  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
    xpc_remote_connection_cancel(v4);
  }

  -[CSRemoteXPCProxy setConnection:](self, "setConnection:", 0LL);
}

- (void)handleRemoteResponse:(id)a3
{
  id v4 = a3;
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v4, "REQUEST_TYPE");
  unsigned __int16 v6 = xpc_dictionary_get_uint64(v4, "RESPONSE_TYPE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logSubsystem]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_100020FDC(v6);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_group_t v11 = sub_100020FB4(uint64);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    __int128 v22 = v10;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Received response: %@ from remote for request: %@",  buf,  0x16u);
  }

  if (v6 == 2)
  {
    uint64_t v14 = xpc_dictionary_get_uint64(v4, "FAILURE_REASON");
    xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logSubsystem]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = sub_100020398(v14);
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412290;
      __int128 v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Failed response from remote, error: %@",  buf,  0xCu);
    }

    goto LABEL_10;
  }

  if (v6 != 1)
  {
    dispatch_group_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logSubsystem]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Unknown response type received: %d",  buf,  8u);
    }

- (void)waitToReceiveCoSysdiagnose
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](self, "remoteGroup"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));

    if (v4)
    {
      id v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy remoteGroup](self, "remoteGroup"));
      uint64_t v6 = dispatch_group_wait(v5, -[CSRemoteXPCProxy getTimeoutTarget](self, "getTimeoutTarget"));

      if (!v6) {
        return;
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logSubsystem]);

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        id v9 = "CSRemoteXPCProxy: Timed out waiting for remote co-sysdiagnose";
        BOOL v10 = (uint8_t *)&v13;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 logSubsystem]);

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v9 = "CSRemoteXPCProxy: self.connection is nil - connection has been cancelled. Skipping waiting";
        BOOL v10 = buf;
        goto LABEL_10;
      }
    }
  }

  else
  {
    dispatch_group_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logSubsystem]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v9 = "CSRemoteXPCProxy: Remote sysdiagnose wasn't triggered or is done transferring. Skipping waiting";
      BOOL v10 = (uint8_t *)&v15;
      goto LABEL_10;
    }
  }
}

- (void)transferFileToHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoteXPCProxy connection](self, "connection"));
    +[CSRemoteXPCProxy remoteSendFile:toPeer:withTimeoutTarget:]( &OBJC_CLASS___CSRemoteXPCProxy,  "remoteSendFile:toPeer:withTimeoutTarget:",  v4,  v6,  -[CSRemoteXPCProxy getTimeoutTarget](self, "getTimeoutTarget"));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](&OBJC_CLASS___CSCoordinator, "sharedInstance"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logSubsystem]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CSRemoteXPCProxy: Didn't create connection to host - stopping file transfer",  v9,  2u);
    }
  }
}

- (OS_dispatch_group)remoteGroup
{
  return self->_remoteGroup;
}

- (void)setRemoteGroup:(id)a3
{
}

- (OS_remote_device)device
{
  return (OS_remote_device *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (OS_xpc_remote_connection)connection
{
  return (OS_xpc_remote_connection *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end