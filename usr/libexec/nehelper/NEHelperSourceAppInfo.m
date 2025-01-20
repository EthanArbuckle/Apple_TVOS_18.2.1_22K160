@interface NEHelperSourceAppInfo
- (NEHelperSourceAppInfo)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperSourceAppInfo

- (NEHelperSourceAppInfo)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NEHelperSourceAppInfo;
  v5 = -[NEHelperSourceAppInfo init](&v32, "init");
  if (!v5) {
    goto LABEL_10;
  }
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  v8 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.nehelper.privileged");
  v9 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.neagent");
  if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL value = xpc_BOOL_get_value(v8);
    if (!v9) {
      goto LABEL_8;
    }
  }

  else
  {
    BOOL value = 0;
    if (!v9) {
      goto LABEL_8;
    }
  }

  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL v16 = xpc_BOOL_get_value(v9);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("NEHelperSourceAppInfo", v18);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v19;

    if (v16 || value) {
      goto LABEL_9;
    }
LABEL_12:
    pid_t pid = xpc_connection_get_pid(v7);
    uint64_t v22 = proc_name(pid, buffer, 0x100u);
    int v23 = v22;
    uint64_t v25 = ne_log_obj(v22, v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v23 < 1)
    {
      if (v27)
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v34 = pid;
        *(_WORD *)&v34[4] = 2080;
        *(void *)&v34[6] = "com.apple.private.nehelper.privileged";
        __int16 v35 = 2080;
        v36 = "com.apple.private.neagent";
        v28 = "Denying connection from process %d because it is missing the %s entitlement and %s entitlement";
        v29 = v26;
        uint32_t v30 = 28;
        goto LABEL_19;
      }
    }

    else if (v27)
    {
      *(_DWORD *)buf = 136315906;
      *(void *)v34 = buffer;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = pid;
      __int16 v35 = 2080;
      v36 = "com.apple.private.nehelper.privileged";
      __int16 v37 = 2080;
      v38 = "com.apple.private.neagent";
      v28 = "Denying connection from %s (%d) because it is missing the %s entitlement and %s entitlement";
      v29 = v26;
      uint32_t v30 = 38;
LABEL_19:
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    }

    v15 = 0LL;
    goto LABEL_17;
  }

- (OS_dispatch_queue)handlerQueue
{
  if (self) {
    self = (NEHelperSourceAppInfo *)objc_getProperty(self, a2, 8LL, 1);
  }
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  memset(dst, 0, sizeof(dst));
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "pid");
  string = xpc_dictionary_get_string(v3, "app-identifier");
  v6 = (void *)string;
  if ((_DWORD)uint64)
  {
    if (!string)
    {
LABEL_8:
      v8 = (void *)ne_copy_signature_info_for_pid(uint64);
      v9 = v8;
      if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t value = xpc_dictionary_get_value(v9, "SourceAppSigningIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue(value);
        xpc_object_t v40 = xpc_dictionary_get_value(v9, "SourceAppUniqueIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        if (!v6 && v10) {
          v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v10);
        }
        if (v41)
        {
          dispatch_queue_attr_t v11 = (void *)_CFXPCCreateCFObjectFromXPCObject(v41);

LABEL_12:
          uint64_t v12 = proc_pidinfo(uint64, 17, 1uLL, buffer, 56);
          if ((_DWORD)v12 == 56)
          {
            uuid_copy(dst, (const unsigned __int8 *)buffer);
            memset(out, 0, sizeof(out));
            uuid_unparse(dst, out);
            uint64_t v16 = ne_log_obj(v14, v15);
            dispatch_queue_attr_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_18;
            }
            int v53 = 136315394;
            v54 = out;
            __int16 v55 = 1024;
            int v56 = uint64;
            v18 = "Found UUID: %s by lookup for pid: %d";
            dispatch_queue_t v19 = (char *)&v53;
            v20 = v17;
            uint32_t v21 = 18;
          }

          else
          {
            uint64_t v22 = ne_log_obj(v12, v13);
            int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uuid_string_t out = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Could not convert from PID to UUID",  (uint8_t *)out,  2u);
            }

            uint64_t v26 = ne_log_obj(v24, v25);
            dispatch_queue_attr_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
LABEL_18:

              if (!v6) {
                goto LABEL_26;
              }
              goto LABEL_19;
            }

            *(_DWORD *)uuid_string_t out = 67109120;
            *(_DWORD *)&out[4] = uint64;
            v18 = "Could not convert from PID (%d) to UUID";
            dispatch_queue_t v19 = out;
            v20 = v17;
            uint32_t v21 = 8;
          }

          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)v19, v21);
          goto LABEL_18;
        }
      }

      else
      {
        v10 = 0LL;
      }

      dispatch_queue_attr_t v11 = 0LL;
      goto LABEL_12;
    }

    if (!*string)
    {
      v6 = 0LL;
      goto LABEL_8;
    }
  }

  else if (!string || !*string)
  {
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v3, 22LL, 0LL);
    goto LABEL_53;
  }

  v7 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
  v6 = v7;
  dispatch_queue_attr_t v11 = 0LL;
  if (!v7) {
    goto LABEL_26;
  }
LABEL_19:
  if ([v6 length])
  {
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));
    v28 = v27;
    if (v27)
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue([v27 shortVersionString]);
      uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 teamID]);
      id v31 = [v30 length];

      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue([v28 teamID]);
      id v33 = [v32 compare:@"0000000000"];

      v34 = objc_alloc(&OBJC_CLASS___NSString);
      __int16 v35 = v34;
      if (v33 && v31)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue([v28 teamID]);
        __int16 v37 = -[NSString initWithFormat:](v35, "initWithFormat:", @"%@.%@", v36, v6);
      }

      else
      {
        __int16 v37 = -[NSString initWithFormat:](v34, "initWithFormat:", @"%@.%@", &stru_100036298, v6);
      }
    }

    else
    {
      __int16 v37 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @".%@", v6);
      id v29 = 0LL;
    }

    xpc_object_t v38 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v37 && -[NSString length](v37, "length")) {
      xpc_dictionary_set_string( v38, "app-identifier", -[NSString UTF8String](v37, "UTF8String"));
    }
    if (v29 && [v29 length])
    {
      id v29 = v29;
      xpc_dictionary_set_string(v38, "version-string", (const char *)[v29 UTF8String]);
    }

    goto LABEL_40;
  }

- (void).cxx_destruct
{
}

@end