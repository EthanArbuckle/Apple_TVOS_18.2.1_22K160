@interface PKDTransaction
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)marshalPaths:(id)a3;
- (BOOL)pluginShouldBeAutoEnabled:(id)a3;
- (BOOL)processPaths:(id)a3;
- (BOOL)processUuidList:(id)a3;
- (OS_xpc_object)connection;
- (OS_xpc_object)reply;
- (OS_xpc_object)request;
- (PKDServer)server;
- (PKDTransaction)initWithRequest:(id)a3 forClient:(id)a4;
- (PKDXpcClient)client;
- (id)findPlugInByPathURL:(id)a3;
- (id)findPlugInByUUID:(id)a3;
- (unint64_t)version;
- (void)accessPlugIns;
- (void)addAnnotationForPlugIn:(id)a3 in:(id)a4;
- (void)addPlugIns;
- (void)annotatePlugIns;
- (void)bulkAnnotatePlugIns;
- (void)bulkPlugIns;
- (void)dispatch;
- (void)done;
- (void)fail:(int64_t)a3 error:(id)a4;
- (void)fail:(int64_t)a3 message:(id)a4;
- (void)findPlugIn;
- (void)lockDownPlugIns;
- (void)matchPlugIns;
- (void)readyPlugIns;
- (void)removePlugIns;
- (void)setClient:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequest:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PKDTransaction

- (PKDTransaction)initWithRequest:(id)a3 forClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PKDTransaction;
  v9 = -[PKDTransaction init](&v30, "init");
  v10 = v9;
  if (!v9) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v9->_client, a4);
  objc_storeStrong((id *)&v10->_request, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](v10, "request"));
  reply = (OS_xpc_object *)xpc_dictionary_create_reply(v11);
  v13 = v10->_reply;
  v10->_reply = reply;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](v10, "request"));
  v10->_type = xpc_dictionary_get_string(v14, (const char *)&PKDRequestKey);

  uint64_t v16 = pklog_handle_for_category(1LL, v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v10->_os_signpost_id_t interval = os_signpost_id_make_with_pointer(v17, v10);

  type = v10->_type;
  if (!strcmp(type, (const char *)&PKDMatchRequest))
  {
    uuid = (NSUUID *)xpc_dictionary_get_uuid(v7, (const char *)&PKDUUIDKey);
    if (!uuid) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (strcmp(type, (const char *)&PKDReadyRequest))
  {
    uuid = 0LL;
    goto LABEL_7;
  }

  xpc_object_t array = xpc_dictionary_get_array(v7, (const char *)&PKDUUIDKey);
  v29 = (void *)objc_claimAutoreleasedReturnValue(array);
  uuid = (NSUUID *)xpc_array_get_uuid(v29, 0LL);

  if (uuid) {
LABEL_6:
  }
    uuid = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uuid);
LABEL_7:
  int v20 = PKGetThreadPriority();
  uint64_t v22 = pklog_handle_for_category(1LL, v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  os_signpost_id_t interval = v10->_interval;
  if (interval - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v26 = v10->_type;
    *(_DWORD *)buf = 136446722;
    v32 = v26;
    __int16 v33 = 2114;
    v34 = uuid;
    __int16 v35 = 1026;
    int v36 = v20;
    _os_signpost_emit_with_name_impl( &dword_0,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  interval,  "DaemonXPCRequest",  " command=%{public, signpost.description:attribute}s  uuid=%{public, signpost.description:attribute}@  priority=%{p ublic, signpost.description:attribute}d ",  buf,  0x1Cu);
  }

LABEL_11:
  return v10;
}

- (PKDServer)server
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);

  return (PKDServer *)v3;
}

- (OS_xpc_object)connection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 connection]);

  return (OS_xpc_object *)v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
  if (v4)
  {
    v6 = v4;
    [v4 auditToken];
    v4 = v6;
  }

  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (void)dispatch
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 client]);
  unsigned int v7 = OUTLINED_FUNCTION_6_0(v5, v6);
  uint64_t v8 = a1[1];
  v9[0] = 67109634;
  v9[1] = v7;
  __int16 v10 = 2082;
  uint64_t v11 = v8;
  __int16 v12 = 2080;
  label = dispatch_queue_get_label(0LL);
  _os_log_debug_impl( &dword_0,  a2,  OS_LOG_TYPE_DEBUG,  "client %d requested %{public}s on queue %s",  (uint8_t *)v9,  0x1Cu);
}

- (BOOL)marshalPaths:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  xpc_object_t array = xpc_dictionary_get_array(v5, (const char *)&PKDPathsKey);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(array);

  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_array)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __31__PKDTransaction_marshalPaths___block_invoke;
    v10[3] = &unk_24BF0;
    v10[4] = self;
    id v11 = v4;
    BOOL v8 = xpc_array_apply(v7, v10);
  }

  else
  {
    -[PKDTransaction fail:message:](self, "fail:message:", 4LL, @"invalid request format");
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __31__PKDTransaction_marshalPaths___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    v5 = string_ptr;
    if (*string_ptr == 47)
    {
      v6 = realpath_DARWIN_EXTSN(string_ptr, v14);
      uint64_t v7 = *(void *)(a1 + 40);
      if (v6)
      {
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
        uint64_t v9 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v8, 1LL);
      }

      else
      {
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
        uint64_t v9 = (*(uint64_t (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0LL);
      }

      uint64_t v10 = v9;
    }

    else
    {
      id v11 = *(void **)(a1 + 32);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"absolute path required: %s",  string_ptr));
      [v11 fail:9 message:v12];

      return 0LL;
    }
  }

  else
  {
    [*(id *)(a1 + 32) fail:4 message:@"invalid request format"];
    return 0LL;
  }

  return v10;
}

- (BOOL)processPaths:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __31__PKDTransaction_processPaths___block_invoke;
  v7[3] = &unk_24C18;
  id v4 = a3;
  id v8 = v4;
  BOOL v5 = -[PKDTransaction marshalPaths:](self, "marshalPaths:", v7);
  if (v5) {
    -[PKDTransaction done](self, "done");
  }

  return v5;
}

uint64_t __31__PKDTransaction_processPaths___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)addPlugIns
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 client]);
  [v1 pid];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 8u);

  OUTLINED_FUNCTION_2_4();
}

BOOL __28__PKDTransaction_addPlugIns__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  if ((a3 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 addPlugIn:v8]);

    BOOL v11 = v9 == 0LL;
    if (v9)
    {
      uint64_t v12 = pklog_handle_for_category(3LL, v10);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __28__PKDTransaction_addPlugIns__block_invoke_cold_1();
      }

      v14 = *(void **)(a1 + 32);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to register plug-in at %@",  v5));
      [v14 fail:2 message:v15];
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid plugin path: %@",  v5));
    [v6 fail:9 message:v9];
    BOOL v11 = 0LL;
  }

  return v11;
}

- (void)removePlugIns
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = __31__PKDTransaction_removePlugIns__block_invoke;
  v2[3] = &unk_24C40;
  v2[4] = self;
  -[PKDTransaction processPaths:](self, "processPaths:", v2);
}

BOOL __31__PKDTransaction_removePlugIns__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_type_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  unsigned __int8 v5 = [v4 hasEntitlement:PKManagerEntitlement];

  if ((v5 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 removePlugIn:v8]);

    BOOL v10 = v9 == 0LL;
    if (v9)
    {
      BOOL v11 = *(void **)(a1 + 32);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no plugin at %@",  v3));
      [v11 fail:9 message:v12];
    }
  }

  else
  {
    uint64_t v13 = pklog_handle_for_category(3LL, v6);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __31__PKDTransaction_removePlugIns__block_invoke_cold_1((id *)(a1 + 32));
    }

    [*(id *)(a1 + 32) fail:11 message:@"caller lacks entitlement for this operation"];
    BOOL v10 = 0LL;
  }

  return v10;
}

- (void)bulkPlugIns
{
}

- (BOOL)processUuidList:(id)a3
{
  id v4 = a3;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  char v39 = 0;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  xpc_object_t array = xpc_dictionary_get_array(v5, (const char *)&PKDUUIDKey);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(array);

  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
    xpc_object_t v10 = xpc_dictionary_get_array(v9, (const char *)&PKDPathsKey);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11 && xpc_get_type(v11) != (xpc_type_t)&_xpc_type_array)
    {
      uint64_t v13 = pklog_handle_for_category(1LL, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Paths present but not an array (ignoring values)", buf, 2u);
      }

      BOOL v11 = 0LL;
    }

    if (v11)
    {
      size_t count = xpc_array_get_count(v11);
      if (count != xpc_array_get_count(v7))
      {
        uint64_t v17 = pklog_handle_for_category(1LL, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Paths present but has different count than UUIDs (ignoring)",  buf,  2u);
        }

        BOOL v11 = 0LL;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
    xpc_object_t v20 = xpc_dictionary_get_array(v19, (const char *)&PKDOneShotUUIDsKey);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (v21 && xpc_get_type(v21) != (xpc_type_t)&_xpc_type_array)
    {
      uint64_t v23 = pklog_handle_for_category(1LL, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "Multi-instance UUID array present but not an array (ignoring values)",  buf,  2u);
      }

      uint64_t v21 = 0LL;
    }

    if (v21)
    {
      size_t v25 = xpc_array_get_count(v21);
      if (v25 != xpc_array_get_count(v7))
      {
        uint64_t v27 = pklog_handle_for_category(1LL, v26);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "Multi-instance UUID array present but has different count than UUIDs (ignoring)",  buf,  2u);
        }

        uint64_t v21 = 0LL;
      }
    }

    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = __34__PKDTransaction_processUuidList___block_invoke;
    applier[3] = &unk_24C90;
    applier[4] = self;
    id v29 = v11;
    id v33 = v29;
    int v36 = v38;
    id v30 = v21;
    id v34 = v30;
    id v35 = v4;
    BOOL v8 = xpc_array_apply(v7, applier);
  }

  else
  {
    -[PKDTransaction fail:message:](self, "fail:message:", 4LL, @"invalid request format (uuid)");
    BOOL v8 = 0;
  }

  _Block_object_dispose(v38, 8);
  return v8;
}

uint64_t __34__PKDTransaction_processUuidList___block_invoke(uint64_t a1, size_t a2, xpc_object_t xuuid)
{
  bytes = xpc_uuid_get_bytes(xuuid);
  if (bytes)
  {
    uint64_t v6 = bytes;
    uint64_t v7 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", bytes);
    BOOL v8 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 server]);
      string = (char *)objc_claimAutoreleasedReturnValue([v9 findPlugInWithUUID:v7]);

      if (!string)
      {
        if (*(void *)(a1 + 40))
        {
          uint64_t v17 = pklog_handle_for_category(1LL, v11);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(void *)buf = 0x1004100202LL;
            __int16 v35 = 2096;
            int v36 = v6;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Failed to find plugin by %{uuid_t}.16P", buf, 0x12u);
          }

          string = (char *)xpc_array_get_string(*(xpc_object_t *)(a1 + 40), a2);
          if (string)
          {
            uint64_t v20 = pklog_handle_for_category(1LL, v19);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(void *)buf = 0x1004100302LL;
              __int16 v35 = 2096;
              int v36 = v6;
              __int16 v37 = 2080;
              v38 = string;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Looking for plugin %{uuid_t}.16P by path %s", buf, 0x1Cu);
            }

            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v23));
            string = (char *)objc_claimAutoreleasedReturnValue([v22 findPlugInAtPath:v24]);

            if (string)
            {
              *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
              size_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
              unsigned __int8 v26 = [v25 hasEntitlement:@"com.apple.pluginkit.test"];

              if ((v26 & 1) == 0)
              {
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(*(void *)(a1 + 32) + 8LL)));
                v31[0] = _NSConcreteStackBlock;
                v31[1] = 3221225472LL;
                v31[2] = __34__PKDTransaction_processUuidList___block_invoke_31;
                v31[3] = &unk_24C68;
                v31[4] = *(void *)(a1 + 32);
                string = string;
                v32 = string;
                id v33 = v27;
                id v28 = v27;
                AnalyticsSendEventLazy(@"com.apple.pluginkit.PKDPlugInPathBasedFallback", v31);
              }
            }
          }
        }

        else
        {
          string = 0LL;
        }
      }

      if (string)
      {
        if (zeroUUID_onceToken != -1) {
          dispatch_once(&zeroUUID_onceToken, &__block_literal_global_1);
        }
        uint64_t v12 = (NSUUID *)(id)zeroUUID_zero;

        uint64_t v13 = *(void **)(a1 + 48);
        if (!v13)
        {
          uint64_t v7 = v12;
LABEL_29:
          uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
          goto LABEL_30;
        }

        uuid = xpc_array_get_uuid(v13, a2);
        if (uuid)
        {
          uint64_t v7 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uuid);

          if (v7) {
            goto LABEL_29;
          }
          uint64_t v12 = 0LL;
          id v29 = @"invalid request (multi-instance uuid allocation failure)";
        }

        else
        {
          id v29 = @"invalid request (bad uuid array)";
        }

        [*(id *)(a1 + 32) fail:4 message:v29];
        uint64_t v7 = v12;
        uint64_t v16 = 0LL;
      }

      else
      {
        [*(id *)(a1 + 32) fail:4 message:@"no such plugin (uuid not found)"];
        uint64_t v16 = 0LL;
      }

id __34__PKDTransaction_processUuidList___block_invoke_31(uint64_t a1)
{
  v20[0] = @"clientBundleID";
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundle]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  unsigned __int8 v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (const __CFString *)v4;
  }
  else {
    uint64_t v6 = @"(nil)";
  }
  v21[0] = v6;
  v20[1] = @"clientPath";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 path]);
  uint64_t v9 = (void *)v8;
  if (v8) {
    xpc_object_t v10 = (const __CFString *)v8;
  }
  else {
    xpc_object_t v10 = @"(nil)";
  }
  v21[1] = v10;
  v20[2] = @"plugInBundleID";
  uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (const __CFString *)v11;
  }
  else {
    uint64_t v13 = @"(nil)";
  }
  v21[2] = v13;
  v20[3] = @"plugInPath";
  uint64_t v14 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (const __CFString *)v14;
  }
  else {
    uint64_t v16 = @"(nil)";
  }
  v20[4] = @"requestType";
  uint64_t v17 = *(void *)(a1 + 48);
  v21[3] = v16;
  v21[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));

  return v18;
}

- (void)readyPlugIns
{
  uint64_t v3 = pklog_handle_for_category(7LL, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = geteuid();
    LOWORD(v61) = 1024;
    *(_DWORD *)((char *)&v61 + 2) = getuid();
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Ready plugins received as euid = %d, uid = %d, (persona not available)",  buf,  0xEu);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, (const char *)&PKDEnvironmentKey);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  uint64_t v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
    uint64_t v10 = PKEnvironmentProvisionEntitlement;
    unsigned __int8 v11 = [v9 hasEntitlement:PKEnvironmentProvisionEntitlement];

    if ((v11 & 1) == 0)
    {
      string = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Transmission of environment variables requires the %@ host entitlement",  v10));
      -[PKDTransaction fail:message:](self, "fail:message:", 11LL, string);
      goto LABEL_28;
    }

    uint64_t v13 = pklog_handle_for_category(7LL, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
      unsigned int v16 = [v15 pid];
      unsigned int v17 = [v8 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v16;
      LOWORD(v61) = 1024;
      *(_DWORD *)((char *)&v61 + 2) = v17;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "pid %d provided %d environment entries", buf, 0xEu);
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  string = (char *)xpc_dictionary_get_string(v18, (const char *)&PKDSandboxOverrideKey);

  if (string)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
    uint64_t v21 = PKSandboxOverrideEntitlement;
    unsigned __int8 v22 = [v20 hasEntitlement:PKSandboxOverrideEntitlement];

    if ((v22 & 1) == 0)
    {
      string = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Overriding default sandbox requires the %@ host entitlement",  v21));
      -[PKDTransaction fail:message:](self, "fail:message:", 11LL, string);
      goto LABEL_28;
    }

    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    uint64_t v24 = pklog_handle_for_category(7LL, v23);
    size_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction client](self, "client"));
      unsigned int v27 = [v26 pid];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v27;
      LOWORD(v61) = 2112;
      *(void *)((char *)&v61 + 2) = string;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "pid %d requested sandbox profile override %@", buf, 0x12u);
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  xpc_object_t array = xpc_dictionary_get_array(v28, (const char *)&PKDPreferredLanguagesKey);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(array);
  v46 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  v31 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v32 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  id v34 = xpc_dictionary_get_string(v33, (const char *)&PKDLaunchPersonaKey);

  if (v34) {
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v34));
  }
  else {
    __int16 v35 = 0LL;
  }
  id v45 = v35;
  if (v34) {

  }
  *(void *)buf = 0LL;
  *(void *)&__int128 v61 = buf;
  *((void *)&v61 + 1) = 0x2020000000LL;
  char v62 = 0;
  xpc_object_t empty = xpc_array_create_empty();
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = __30__PKDTransaction_readyPlugIns__block_invoke;
  v56[3] = &unk_24CB8;
  v59 = buf;
  v56[4] = self;
  __int16 v37 = v31;
  v57 = v37;
  v38 = v32;
  v58 = v38;
  if (-[PKDTransaction processUuidList:](self, "processUuidList:", v56))
  {
    char v39 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = __30__PKDTransaction_readyPlugIns__block_invoke_60;
    v47[3] = &unk_24CE0;
    v48 = v38;
    v49 = self;
    id v50 = v8;
    id v51 = v46;
    id v52 = v45;
    v53 = string;
    v40 = v39;
    v54 = v40;
    id v41 = empty;
    id v55 = v41;
    -[NSMutableArray enumerateObjectsUsingBlock:](v37, "enumerateObjectsUsingBlock:", v47);
    if (-[NSMutableArray count](v40, "count"))
    {
      v42 = (void *)_CFXPCCreateXPCObjectFromCFObject(v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply"));
      xpc_dictionary_set_value(v43, (const char *)&PKDPidArrayKey, v42);
    }

    if (*(_BYTE *)(v61 + 24) && xpc_array_get_count(v41))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply"));
      xpc_dictionary_set_value(v44, (const char *)&PKDUUIDKey, v41);
    }

    -[PKDTransaction done](self, "done");
  }

  _Block_object_dispose(buf, 8);
LABEL_28:
}

BOOL __30__PKDTransaction_readyPlugIns__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 holdOnPlugIn:v7]);

  if (v10)
  {
    uint64_t v12 = pklog_handle_for_category(7LL, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 version]);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
      *(_DWORD *)buf = 138544386;
      int v36 = v14;
      __int16 v37 = 2112;
      v38 = v15;
      __int16 v39 = 2112;
      v40 = v16;
      __int16 v41 = 1024;
      unsigned int v42 = [v17 pid];
      __int16 v43 = 2112;
      v44 = v10;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] denied access to %d; the plugin is on hold by %@",
        buf,
        0x30u);
    }

    v18 = *(void **)(a1 + 32);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"access to plugin %@ denied: the plug-in is on hold",  v19));
    [v18 fail:11 message:v20];

    BOOL v21 = 0LL;
  }

  else
  {
    if ([v7 isData])
    {
      BOOL v21 = 1LL;
      goto LABEL_8;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryInstanceUUID]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 allowForClient:v23 discoveryInstanceUUID:v24]);

    BOOL v21 = v19 == 0LL;
    if (v19)
    {
      uint64_t v26 = pklog_handle_for_category(7LL, v25);
      unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v7 version]);
        id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
        *(_DWORD *)buf = 138544386;
        int v36 = v28;
        __int16 v37 = 2112;
        v38 = v29;
        __int16 v39 = 2112;
        v40 = v30;
        __int16 v41 = 1024;
        unsigned int v42 = [v34 pid];
        __int16 v43 = 2114;
        v44 = v19;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] denied access to %d; %{public}@",
          buf,
          0x30u);
      }

      v31 = *(void **)(a1 + 32);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"access to plugin %@ denied: %@",  v32,  v19));
      [v31 fail:11 message:v33];
    }

    else
    {
      [*(id *)(a1 + 40) addObject:v7];
      [*(id *)(a1 + 48) addObject:v8];
    }
  }

LABEL_8:
  return v21;
}

void __30__PKDTransaction_readyPlugIns__block_invoke_60(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  int v20 = -1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:a3]);
  if (zeroUUID_onceToken != -1) {
    dispatch_once(&zeroUUID_onceToken, &__block_literal_global_1);
  }
  if ([v8 isEqual:zeroUUID_zero])
  {

    id v8 = 0LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) client]);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  id v19 = 0LL;
  unsigned __int8 v14 = [v7 enableForClient:v9 environment:v10 languages:v11 oneShotUUID:v8 persona:v12 sandbox:v13 pid:&v20 error:&v19];
  id v15 = v19;

  if ((v14 & 1) != 0)
  {
    if (v20 >= 1)
    {
      unsigned int v16 = *(void **)(a1 + 80);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      [v16 addObject:v17];

      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      [v18 getUUIDBytes:uuid];

      xpc_array_set_uuid(*(xpc_object_t *)(a1 + 88), 0xFFFFFFFFFFFFFFFFLL, uuid);
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "fail:error:", objc_msgSend(v15, "code"), v15);
    *a4 = 1;
  }
}

- (void)accessPlugIns
{
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = __31__PKDTransaction_accessPlugIns__block_invoke;
  uint64_t v9 = &unk_24D08;
  uint64_t v10 = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = v3;
  if (-[PKDTransaction processUuidList:](v10, "processUuidList:", &v6))
  {
    uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject(v3);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply", v6, v7, v8, v9, v10));
    xpc_dictionary_set_value(v5, (const char *)&PKDExtensionsKey, v4);

    -[PKDTransaction done](self, "done");
  }
}

BOOL __31__PKDTransaction_accessPlugIns__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  uint64_t v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  uint64_t v7 = pkIssueSandboxExtensionForURL(v4, v14);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
  }

  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot create file extension to %@: %d",  v10,  *__error());
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v9 fail:4 message:v12];
  }

  return v8 != 0LL;
}

- (void)annotatePlugIns
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction request](self, "request"));
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, (const char *)&PKDAnnotationsKey);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(dictionary);

  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v8 = PKAnnotationElectionKey;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationElectionKey]);
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        -[PKDTransaction fail:message:]( self,  "fail:message:",  4LL,  @"invalid request format (annotation election)");
LABEL_18:

        goto LABEL_19;
      }

      [v7 setObject:v9 forKeyedSubscript:v8];
      uint64_t v11 = PKAnnotationBootInstanceKey;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationBootInstanceKey]);
      [v7 setObject:v12 forKeyedSubscript:v11];

      uint64_t v13 = PKAnnotationTimestampKey;
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationTimestampKey]);
      [v7 setObject:v14 forKeyedSubscript:v13];
    }

    uint64_t v15 = PKAnnotationExtensionKey;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationExtensionKey]);
    if (v16)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
      {
        -[PKDTransaction fail:message:]( self,  "fail:message:",  4LL,  @"invalid request format (annotation extension)");
LABEL_17:

        goto LABEL_18;
      }

      [v7 setObject:v16 forKeyedSubscript:v15];
      uint64_t v18 = PKAnnotationBootInstanceKey;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationBootInstanceKey]);
      [v7 setObject:v19 forKeyedSubscript:v18];

      uint64_t v20 = PKAnnotationTimestampKey;
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:PKAnnotationTimestampKey]);
      [v7 setObject:v21 forKeyedSubscript:v20];
    }

    if ([v7 count])
    {
      uint64_t v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472LL;
      uint64_t v25 = __33__PKDTransaction_annotatePlugIns__block_invoke;
      uint64_t v26 = &unk_24D08;
      unsigned int v27 = self;
      id v28 = v7;
      if (-[PKDTransaction processUuidList:](self, "processUuidList:", &v23))
      {
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction server](self, "server", v23, v24, v25, v26, v27));
        [v22 notifyAnnotationChange];

        -[PKDTransaction done](self, "done");
      }
    }

    else
    {
      -[PKDTransaction done](self, "done");
    }

    goto LABEL_17;
  }

  -[PKDTransaction fail:message:]( self,  "fail:message:",  4LL,  @"invalid request format (bad annotations dictionary)");
LABEL_19:
}

uint64_t __33__PKDTransaction_annotatePlugIns__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = pklog_handle_for_category(10LL, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __33__PKDTransaction_annotatePlugIns__block_invoke_cold_1(v3, a1, v6);
  }

  uint64_t v7 = PKAnnotationElectionKey;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:PKAnnotationElectionKey]);

  if (v8)
  {
    uint64_t v10 = pklog_handle_for_category(10LL, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 version]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
      unsigned int v16 = [v15 pid];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v7]);
      int v21 = 138544386;
      unsigned __int8 v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 1024;
      unsigned int v28 = v16;
      __int16 v29 = 2112;
      id v30 = v17;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] client pid %d election := %@",  (uint8_t *)&v21,  0x30u);
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  id v19 = [v18 setAnnotation:*(void *)(a1 + 40) forPlugIn:v3];

  return 1LL;
}

- (void)bulkAnnotatePlugIns
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 client]);
  v8[0] = 67109376;
  v8[1] = OUTLINED_FUNCTION_6_0(v6, v7);
  __int16 v9 = 1024;
  unsigned int v10 = [a2 count];
  _os_log_debug_impl( &dword_0,  a3,  OS_LOG_TYPE_DEBUG,  "bulk change requested by client pid %d for %u plugins",  (uint8_t *)v8,  0xEu);

  OUTLINED_FUNCTION_4_1();
}

- (void)lockDownPlugIns
{
}

BOOL __33__PKDTransaction_lockDownPlugIns__block_invoke(uint64_t a1, int a2, xpc_object_t xuuid)
{
  bytes = xpc_uuid_get_bytes(xuuid);
  uint64_t v5 = *(void **)(a1 + 32);
  if (bytes)
  {
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
    uint64_t v7 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", bytes);
    [v6 unholdToken:v7 silent:*(unsigned __int8 *)(a1 + 40)];
  }

  else
  {
    [v5 fail:4 message:@"could not get uuid bytes"];
  }

  return bytes != 0LL;
}

BOOL __33__PKDTransaction_lockDownPlugIns__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    __int16 v9 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  xpc_uint64_get_value(v5));
    [*(id *)(a1 + 32) setObject:v9 atIndexedSubscript:a2];
  }

  else
  {
    uint64_t v8 = pklog_handle_for_category(11LL, v6);
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __33__PKDTransaction_lockDownPlugIns__block_invoke_2_cold_1();
    }
  }

  return type == (xpc_type_t)&_xpc_type_uint64;
}

uint64_t __33__PKDTransaction_lockDownPlugIns__block_invoke_84(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  if ((a3 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 findPlugInAtPath:v9]);

      if (v13)
      {
        [*(id *)(a1 + 40) addObject:v13];
      }

      else
      {
        uint64_t v15 = pklog_handle_for_category(11LL, v14);
        unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          id v19 = v6;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "no plugin at path:%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
      __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 plugInsWithinApplication:v8]);

      unsigned int v10 = *(void **)(a1 + 40);
      if (v10) {
        [v10 addObjectsFromArray:v9];
      }
    }
  }

  else
  {
    uint64_t v11 = pklog_handle_for_category(11LL, v5);
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "invalid path: %@", (uint8_t *)&v18, 0xCu);
    }
  }

  return 1LL;
}

id __33__PKDTransaction_lockDownPlugIns__block_invoke_88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = pklog_handle_for_category(11LL, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    int v8 = 138543362;
    __int16 v9 = v6;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "forced termination complete; hold request granted token: %{public}@",
      (uint8_t *)&v8,
      0xCu);
  }

  return [*(id *)(a1 + 40) done];
}

- (id)findPlugInByUUID:(id)a3
{
  bytes = xpc_uuid_get_bytes(a3);
  if (bytes)
  {
    id v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", bytes);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction server](self, "server"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 findPlugInWithUUID:v6]);
  }

  else
  {
    uint64_t v9 = pklog_handle_for_category(6LL, v5);
    id v6 = (NSUUID *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      -[PKDTransaction findPlugInByUUID:].cold.1((os_log_t)v6);
    }
    int v8 = 0LL;
  }

  return v8;
}

- (id)findPlugInByPathURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
  string_ptr = xpc_string_get_string_ptr(v4);

  uint64_t v7 = -[NSString initWithUTF8String:](v5, "initWithUTF8String:", string_ptr);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction server](self, "server"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 findPlugInAtPath:v8]);

  return v10;
}

- (void)findPlugIn
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 uuid]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 version]);
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x2Au);

  OUTLINED_FUNCTION_3_1();
}

- (void)matchPlugIns
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, a1, OS_LOG_TYPE_DEFAULT, "interrupting connection due to interrupt flag in request", v2, 2u);
  }

  OUTLINED_FUNCTION_2_4();
}

id __30__PKDTransaction_matchPlugIns__block_invoke(uint64_t a1)
{
  v17[0] = @"clientBundleID";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundle]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (const __CFString *)v4;
  }
  else {
    id v6 = @"(nil)";
  }
  v18[0] = v6;
  v17[1] = @"clientPath";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 path]);
  uint64_t v9 = (void *)v8;
  if (v8) {
    unsigned int v10 = (const __CFString *)v8;
  }
  else {
    unsigned int v10 = @"(nil)";
  }
  v18[1] = v10;
  v17[2] = @"isClientSandboxed";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 isSandboxed]));
  v18[2] = v12;
  v17[3] = @"clientPID";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 pid]));
  v18[3] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  4LL));

  return v15;
}

void __30__PKDTransaction_matchPlugIns__block_invoke_108(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 25LL) & 2) != 0) {
    goto LABEL_25;
  }
  if (([v3 onSystemVolume] & 1) == 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containingUrl]);

    if (v5)
    {
      if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) & 8) == 0) {
        goto LABEL_5;
      }
      uint64_t v28 = pklog_handle_for_category(6LL, v6);
      unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = *(void *)(a1 + 32);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        v31 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        v98 = v31;
        *(_WORD *)v99 = 2112;
        *(void *)&v99[2] = v32;
        _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "[d %@] [u %{public}@] [%@(%@)] rejecting; plugin is not a system plugin, but client requested only system plugins",
          buf,
          0x2Au);
      }
    }

    else
    {
      uint64_t v21 = pklog_handle_for_category(6LL, v6);
      unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        __int16 v25 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v98 = v25;
        *(_WORD *)v99 = 2112;
        *(void *)&v99[2] = v26;
        _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "[d %@] [u %{public}@] [%@(%@)] rejecting; non-system plugins must have a containing app",
          buf,
          0x2Au);
      }
    }

    goto LABEL_48;
  }

void __30__PKDTransaction_matchPlugIns__block_invoke_110(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) version]);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 version]);
    unint64_t v13 = (unint64_t)[v11 compareVersionString:v12];

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = __30__PKDTransaction_matchPlugIns__block_invoke_2;
    v63[3] = &unk_24DF8;
    uint64_t v66 = *(void *)(a1 + 48);
    id v14 = v7;
    id v64 = v14;
    id v65 = *(id *)(a1 + 32);
    uint64_t v15 = objc_retainBlock(v63);
    uint64_t v17 = v15;
    if ((*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) & 1) != 0)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) & 4LL | v13)
      {
LABEL_24:

        goto LABEL_25;
      }

      int v18 = ((uint64_t (*)(void *))v15[2])(v15);
      uint64_t v20 = pklog_handle_for_category(6LL, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (!v18)
      {
        if (v22)
        {
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
          v57 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          v44 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
          uint64_t v53 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138413826;
          uint64_t v68 = v61;
          __int16 v69 = 2114;
          uint64_t v70 = v57;
          __int16 v71 = 2112;
          v72 = v44;
          __int16 v73 = 2112;
          uint64_t v74 = v53;
          __int16 v75 = 2114;
          v76 = v45;
          __int16 v77 = 2112;
          v78 = v46;
          __int16 v79 = 2112;
          v80 = v47;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] rejecting; another plugin has precedent: [u %{public}@] [%@(%@)] ",
            buf,
            0x48u);
        }

        goto LABEL_22;
      }

      if (v22)
      {
        uint64_t v54 = *(void *)(a1 + 32);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
        *(_DWORD *)buf = 138413826;
        uint64_t v68 = v58;
        __int16 v69 = 2114;
        uint64_t v70 = v23;
        __int16 v71 = 2112;
        v72 = v24;
        __int16 v73 = 2112;
        uint64_t v74 = v54;
        __int16 v75 = 2114;
        v76 = v50;
        __int16 v77 = 2112;
        v78 = v25;
        __int16 v79 = 2112;
        v80 = v26;
        _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] rejecting; better tie breaker: another plugin has precedent: [u %{public}@] [%@(%@)] ",
          buf,
          0x48u);
      }
    }

    else if (v13)
    {
      if (v13 != 1) {
        goto LABEL_16;
      }
    }

    else
    {
      if (!((unsigned int (*)(void *))v15[2])(v15))
      {
LABEL_16:
        uint64_t v33 = pklog_handle_for_category(6LL, v16);
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
          *(_DWORD *)buf = 138412546;
          uint64_t v68 = v35;
          __int16 v69 = 2112;
          uint64_t v70 = v36;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "ignoring %@, preferring %@", buf, 0x16u);
        }

        uint64_t v38 = pklog_handle_for_category(6LL, v37);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          v60 = v17;
          v40 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
          uint64_t v52 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138413826;
          uint64_t v68 = v39;
          __int16 v69 = 2114;
          uint64_t v70 = v56;
          __int16 v71 = 2112;
          v72 = v40;
          __int16 v73 = 2112;
          uint64_t v74 = v52;
          __int16 v75 = 2114;
          v76 = v41;
          __int16 v77 = 2112;
          v78 = v42;
          __int16 v79 = 2112;
          v80 = v43;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] rejecting; ignoring plugin: another plugin has precedent: [u %{public}@] [%@(%@)] ",
            buf,
            0x48u);

          uint64_t v17 = v60;
        }

uint64_t __30__PKDTransaction_matchPlugIns__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) onSystemVolume] & 1) == 0
    && [*(id *)(a1 + 32) onSystemVolume])
  {
    uint64_t v3 = pklog_handle_for_category(6LL, v2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) version]);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uuid]);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) version]);
      int v30 = 138413826;
      v31 = v5;
      __int16 v32 = 2114;
      uint64_t v33 = v6;
      __int16 v34 = 2112;
      uint64_t v35 = v7;
      __int16 v36 = 2112;
      uint64_t v37 = v8;
      __int16 v38 = 2114;
      __int16 v39 = v9;
      __int16 v40 = 2112;
      __int16 v41 = v10;
      __int16 v42 = 2112;
      unsigned int v43 = v11;
      unsigned __int8 v12 = "[d %@] [u %{public}@] [%@(%@)] a system plugin has precedent: [u %{public}@] [%@(%@)] ";
LABEL_12:
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v30, 0x48u);

      goto LABEL_13;
    }

    goto LABEL_13;
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) onSystemVolume]
    && ([*(id *)(a1 + 32) onSystemVolume] & 1) == 0)
  {
    uint64_t v21 = pklog_handle_for_category(6LL, v13);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uuid]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) version]);
      uint64_t v25 = *(void *)(a1 + 40);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) version]);
      int v30 = 138413826;
      v31 = v22;
      __int16 v32 = 2114;
      uint64_t v33 = v23;
      __int16 v34 = 2112;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      uint64_t v37 = v25;
      __int16 v38 = 2114;
      __int16 v39 = v26;
      __int16 v40 = 2112;
      __int16 v41 = v27;
      __int16 v42 = 2112;
      unsigned int v43 = v28;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] detected another plugin with a newer modification date: [u %{public}@] [%@(%@)] ",  (uint8_t *)&v30,  0x48u);
    }

void __30__PKDTransaction_matchPlugIns__block_invoke_114(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v34 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 export:&v34]);
  id v6 = v34;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) UUIDString]);
    [v7 setObject:v8 forKeyedSubscript:PKDiscoveryInstanceUUIDFormKey];

    [*(id *)(a1 + 48) addAnnotationForPlugIn:v4 in:v7];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) client]);
    [v4 augmentForm:v7 host:v9];

    [*(id *)(a1 + 56) addObject:v7];
    id v10 = v7;

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:PKOverrideEntitlement]);
    if (v11)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        [*(id *)(a1 + 64) setObject:v10 forKeyedSubscript:v11];
      }

      else
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v11, v21) & 1) != 0)
        {
          id v29 = v6;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          id v22 = v11;
          id v23 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v31;
            do
            {
              uint64_t v25 = 0LL;
              else {
                uint64_t v26 = (uint64_t)v23;
              }
              do
              {
                if (*(void *)v31 != v24) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * v25);
                uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString);
                if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
                  [*(id *)(a1 + 64) setObject:v10 forKeyedSubscript:v27];
                }
                ++v25;
              }

              while (v26 != v25);
              id v23 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
            }

            while (v23);
          }

          id v6 = v29;
        }
      }
    }
  }

  else
  {
    uint64_t v13 = *(void **)(a1 + 32);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    [v13 addObject:v14];

    uint64_t v16 = pklog_handle_for_category(6LL, v15);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
      *(_DWORD *)buf = 138413314;
      uint64_t v37 = v17;
      __int16 v38 = 2114;
      __int16 v39 = v18;
      __int16 v40 = 2112;
      __int16 v41 = v19;
      __int16 v42 = 2112;
      unsigned int v43 = v20;
      __int16 v44 = 2114;
      id v45 = v6;
      _os_log_error_impl( &dword_0,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "[d %@] [u %{public}@] [%@(%@)] rejecting; failed to export matching plugin: %{public}@",
        buf,
        0x34u);
    }
  }
}

- (BOOL)pluginShouldBeAutoEnabled:(id)a3
{
  return 0;
}

- (void)addAnnotationForPlugIn:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction server](self, "server"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 annotationForPlugIn:v6]);

  if (!v9)
  {
    if (-[PKDTransaction pluginShouldBeAutoEnabled:](self, "pluginShouldBeAutoEnabled:", v6))
    {
      uint64_t v10 = PKAnnotationElectionKey;
      uint64_t v11 = &off_26008;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    }

    else
    {
      uint64_t v9 = &__NSDictionary0__struct;
    }
  }

  [v7 setObject:v9 forKeyedSubscript:PKAnnotationsFormKey];
}

- (void)done
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply"));
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, (const char *)&PKDErrorCodeKey);

  uint64_t v6 = pklog_handle_for_category(1LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  os_signpost_id_t interval = self->_interval;
  if (interval - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    xpc_type_t type = self->_type;
    int v13 = 136446466;
    id v14 = type;
    __int16 v15 = 2050;
    uint64_t v16 = uint64;
    _os_signpost_emit_with_name_impl( &dword_0,  v8,  OS_SIGNPOST_INTERVAL_END,  interval,  "DaemonXPCRequest",  " command=%{public, signpost.description:attribute}s  error=%{public, signpost.description:attribute}llu ",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[PKDTransaction connection](self, "connection"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply"));
  xpc_connection_send_message(v11, v12);
}

- (void)fail:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply"));
  xpc_dictionary_set_uint64(v7, (const char *)&PKDErrorCodeKey, a3);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDTransaction reply](self, "reply"));
  id v9 = v6;
  uint64_t v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, (const char *)&PKDErrorKey, v10);
  -[PKDTransaction done](self, "done");
}

- (void)fail:(int64_t)a3 error:(id)a4
{
  id v11 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  id v7 = (void *)PKPlugInKitErrorDomain;

  if (v6 == v7)
  {
    id v9 = [v11 code];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    -[PKDTransaction fail:message:](self, "fail:message:", v9, v10);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
    -[PKDTransaction fail:message:](self, "fail:message:", a3, v8);
  }
}

- (PKDXpcClient)client
{
  return (PKDXpcClient *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClient:(id)a3
{
}

- (OS_xpc_object)request
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (OS_xpc_object)reply
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setReply:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
}

void __28__PKDTransaction_addPlugIns__block_invoke_cold_1()
{
}

void __31__PKDTransaction_removePlugIns__block_invoke_cold_1(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*a1 client]);
  OUTLINED_FUNCTION_6_0(v2, v3);
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x12u);

  OUTLINED_FUNCTION_4_1();
}

void __33__PKDTransaction_annotatePlugIns__block_invoke_cold_1(void *a1, uint64_t a2, os_log_s *a3)
{
  os_log_type_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 uuid]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 version]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a2 + 32) client]);
  unsigned int v10 = [v9 pid];
  uint64_t v11 = *(void *)(a2 + 40);
  int v12 = 138544386;
  int v13 = v6;
  __int16 v14 = 2112;
  __int16 v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = v8;
  __int16 v18 = 1024;
  unsigned int v19 = v10;
  __int16 v20 = 2112;
  uint64_t v21 = v11;
  _os_log_debug_impl( &dword_0,  a3,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] client pid %d requested annotation change: %@",  (uint8_t *)&v12,  0x30u);

  OUTLINED_FUNCTION_3_1();
}

void __33__PKDTransaction_lockDownPlugIns__block_invoke_2_cold_1()
{
}

- (void)findPlugInByUUID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "could not get uuid bytes", v1, 2u);
}

@end