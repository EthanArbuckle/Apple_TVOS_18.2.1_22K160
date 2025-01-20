@interface PKDaemonClient
+ (id)convertToXPC:(id)a3 version:(unint64_t)a4;
- (OS_dispatch_queue)replyQueue;
- (OS_xpc_object)pkd;
- (PKDaemonClient)initWithConnection:(id)a3 queue:(id)a4 user:(unsigned int)a5;
- (PKDaemonClient)initWithServiceName:(const char *)a3;
- (PKDaemonClient)initWithServiceName:(const char *)a3 user:(unsigned int)a4;
- (id)convertFromXPC:(id)a3;
- (id)errorInReply:(id)a3;
- (id)rawConnection;
- (id)request:(const char *)a3;
- (id)request:(const char *)a3 paths:(id)a4;
- (int64_t)protocolVersion;
- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 reply:(id)a6;
- (void)addPlugIns:(id)a3 reply:(id)a4;
- (void)bulkPlugins:(unint64_t)a3 reply:(id)a4;
- (void)bulkSetPluginAnnotations:(id)a3 reply:(id)a4;
- (void)findPlugInByPathURL:(id)a3 reply:(id)a4;
- (void)findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5;
- (void)holdPlugins:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 reply:(id)a7;
- (void)matchPlugIns:(id)a3 flags:(unint64_t)a4 uuid:(id)a5 reply:(id)a6;
- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 environment:(id)a6 languages:(id)a7 persona:(id)a8 sandbox:(id)a9 reply:(id)a10;
- (void)releaseHold:(id)a3 flags:(unint64_t)a4 reply:(id)a5;
- (void)removePlugIns:(id)a3 reply:(id)a4;
- (void)send:(id)a3 reply:(id)a4;
- (void)sendSynchronously:(BOOL)a3 request:(id)a4 reply:(id)a5;
- (void)sendSynchronously:(BOOL)a3 request:(id)a4 retry:(BOOL)a5 reply:(id)a6;
- (void)set:(id)a3 plugins:(id)a4;
- (void)set:(id)a3 uuids:(id)a4;
- (void)setPkd:(id)a3;
- (void)setPluginAnnotations:(id)a3 annotations:(id)a4 reply:(id)a5;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setReplyQueue:(id)a3;
@end

@implementation PKDaemonClient

- (PKDaemonClient)initWithServiceName:(const char *)a3
{
  return (PKDaemonClient *)objc_msgSend_initWithServiceName_user_(self, a2, (uint64_t)a3, 0, v3);
}

- (PKDaemonClient)initWithServiceName:(const char *)a3 user:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3) {
    v6 = a3;
  }
  else {
    v6 = "com.apple.pluginkit.pkd";
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("pkd_client", v7);

  xpc_connection_t mach_service = xpc_connection_create_mach_service(v6, v8, 0LL);
  v11 = (PKDaemonClient *)objc_msgSend_initWithConnection_queue_user_(self, v10, (uint64_t)mach_service, (uint64_t)v8, v4);

  return v11;
}

- (PKDaemonClient)initWithConnection:(id)a3 queue:(id)a4 user:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PKDaemonClient;
  v11 = -[PKDaemonClient init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_replyQueue, a4);
    objc_storeStrong((id *)&v12->_pkd, a3);
    objc_initWeak(&location, v12);
    pkd = v12->_pkd;
    uint64_t v18 = MEMORY[0x1895F87A8];
    uint64_t v19 = 3221225472LL;
    v20 = sub_186A1CDE4;
    v21 = &unk_189F20F98;
    objc_copyWeak(&v22, &location);
    xpc_connection_set_event_handler(pkd, &v18);
    if (a5) {
      xpc_connection_set_target_uid();
    }
    objc_msgSend_setProtocolVersion_(v12, v14, 3, v15, v16, v18, v19, v20, v21);
    xpc_connection_resume(v12->_pkd);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)rawConnection
{
  return self->_pkd;
}

- (id)errorInReply:(id)a3
{
  id v3 = a3;
  if (MEMORY[0x186E41954]() == MEMORY[0x1895F9268])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)string, v13, v14);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = 4LL;
LABEL_6:
    pkError(v10, v9);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "errorcode");
  v5 = xpc_dictionary_get_string(v3, "error");
  if (uint64)
  {
    if (!v5)
    {
      pkError(uint64, @"unknown error returned by PlugInKit subsystem");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }

    objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)v5, v7, v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = uint64;
    goto LABEL_6;
  }

  if (v5) {
    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v6,  *MEMORY[0x189603A58],  (uint64_t)@"pkd reported error without a code: %s",  v8,  v5);
  }
  uint64_t v15 = 0LL;
LABEL_11:

  return v15;
}

- (void)addPlugIns:(id)a3 reply:(id)a4
{
  id v6 = a4;
  objc_msgSend_request_paths_(self, v7, (uint64_t)"add", (uint64_t)a3, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_send_reply_(self, v9, (uint64_t)v11, (uint64_t)v6, v10);
}

- (void)removePlugIns:(id)a3 reply:(id)a4
{
  id v6 = a4;
  objc_msgSend_request_paths_(self, v7, (uint64_t)"remove", (uint64_t)a3, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_send_reply_(self, v9, (uint64_t)v11, (uint64_t)v6, v10);
}

- (void)bulkPlugins:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  objc_msgSend_request_(self, v7, (uint64_t)"bulk", v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v12, "flags", a3);
  objc_msgSend_send_reply_(self, v10, (uint64_t)v12, (uint64_t)v6, v11);
}

- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 environment:(id)a6 languages:(id)a7 persona:(id)a8 sandbox:(id)a9 reply:(id)a10
{
  BOOL v14 = a4;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  objc_msgSend_request_(self, v22, (uint64_t)"ready", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v25, "flags", a5);
  if (v17)
  {
    v30 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v25, "environment", v30);
  }

  if (objc_msgSend_count(v18, v26, v27, v28, v29))
  {
    pklog_handle_for_category(1);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      int v55 = 138412290;
      id v56 = v18;
      _os_log_impl(&dword_186A04000, v35, OS_LOG_TYPE_INFO, "Setting app-specific languages: %@", (uint8_t *)&v55, 0xCu);
    }

    v36 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v25, "preferredlanguages", v36);
  }

  if (v19)
  {
    objc_msgSend_personaUniqueString(v19, v31, v32, v33, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      id v42 = objc_msgSend_personaUniqueString(v19, v38, v39, v40, v41);
      v47 = (const char *)objc_msgSend_UTF8String(v42, v43, v44, v45, v46);
      xpc_dictionary_set_string(v25, "persona", v47);
    }

    else
    {
      pklog_handle_for_category(1);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR)) {
        sub_186A267F0();
      }
    }
  }

  if (v20)
  {
    id v48 = v20;
    v53 = (const char *)objc_msgSend_UTF8String(v48, v49, v50, v51, v52);
    xpc_dictionary_set_string(v25, "sandbox", v53);
  }

  objc_msgSend_set_plugins_(self, v31, (uint64_t)v25, (uint64_t)v16, v34);
  objc_msgSend_sendSynchronously_request_reply_(self, v54, v14, (uint64_t)v25, (uint64_t)v21);
}

- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  objc_msgSend_request_(self, v12, (uint64_t)"access", v13, v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v18, "flags", a5);
  objc_msgSend_set_plugins_(self, v15, (uint64_t)v18, (uint64_t)v11, v16);

  objc_msgSend_sendSynchronously_request_reply_(self, v17, v7, (uint64_t)v18, (uint64_t)v10);
}

- (void)findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_request_(self, v10, (uint64_t)"find", v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getUUIDBytes_(v9, v14, (uint64_t)uuid, v15, v16);

  xpc_dictionary_set_uuid(v13, "uuids", uuid);
  objc_msgSend_sendSynchronously_request_reply_(self, v17, v5, (uint64_t)v13, (uint64_t)v8);
}

- (void)findPlugInByPathURL:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_request_(self, v8, (uint64_t)"find", v9, v10);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v7, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  id v16 = v15;
  id v21 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19, v20);
  xpc_dictionary_set_string(xdict, "paths", v21);

  objc_msgSend_send_reply_(self, v22, (uint64_t)xdict, (uint64_t)v6, v23);
}

- (void)matchPlugIns:(id)a3 flags:(unint64_t)a4 uuid:(id)a5 reply:(id)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  *(void *)uuid = 0LL;
  uint64_t v22 = 0LL;
  id v10 = a6;
  id v11 = a3;
  objc_msgSend_getUUIDBytes_(a5, v12, (uint64_t)uuid, v13, v14);
  objc_msgSend_request_(self, v15, (uint64_t)"match", v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(v18, "rules", v19);
  xpc_dictionary_set_uint64(v18, "flags", a4);
  xpc_dictionary_set_uuid(v18, "uuids", uuid);
  objc_msgSend_sendSynchronously_request_retry_reply_(self, v20, (a4 >> 10) & 1, (uint64_t)v18, 1, v10);
}

- (void)setPluginAnnotations:(id)a3 annotations:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend_request_(self, v11, (uint64_t)"annotate", v12, v13);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set_uuids_(self, v14, (uint64_t)xdict, (uint64_t)v10, v15);

  uint64_t v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(xdict, "annotations", v16);
  objc_msgSend_send_reply_(self, v17, (uint64_t)xdict, (uint64_t)v8, v18);
}

- (void)bulkSetPluginAnnotations:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_request_(self, v8, (uint64_t)"bulk-annotate", v9, v10);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(xdict, "annotations", v11);
  objc_msgSend_send_reply_(self, v12, (uint64_t)xdict, (uint64_t)v6, v13);
}

- (void)holdPlugins:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 reply:(id)a7
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v18 = a7;
  if (v12) {
    objc_msgSend_request_paths_(self, v15, (uint64_t)"lock", (uint64_t)v12, v17);
  }
  else {
    objc_msgSend_request_(self, v15, (uint64_t)"lock", v16, v17);
  }
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v20 = v13;
    v25 = (const char *)objc_msgSend_UTF8String(v20, v21, v22, v23, v24);
    xpc_dictionary_set_string(v19, "extensionpoint", v25);
    if (objc_msgSend_count(v14, v26, v27, v28, v29))
    {
      v43 = self;
      unint64_t v44 = a6;
      xpc_object_t v30 = xpc_array_create(0LL, 0LL);
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id v31 = v14;
      unint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v45, (uint64_t)v49, 16);
      if (v33)
      {
        uint64_t v38 = *(void *)v46;
        do
        {
          uint64_t v39 = 0LL;
          if (v33 <= 1) {
            uint64_t v40 = 1LL;
          }
          else {
            uint64_t v40 = v33;
          }
          do
          {
            if (*(void *)v46 != v38) {
              objc_enumerationMutation(v31);
            }
            uint64_t v41 = objc_msgSend_unsignedLongLongValue( *(void **)(*((void *)&v45 + 1) + 8 * v39),  v34,  v35,  v36,  v37,  v43,  v44,  (void)v45);
            xpc_array_set_uint64(v30, 0xFFFFFFFFFFFFFFFFLL, v41);
            ++v39;
          }

          while (v40 != v39);
          unint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v45, (uint64_t)v49, 16);
        }

        while (v33);
      }

      xpc_dictionary_set_value(v19, "platforms", v30);
      self = v43;
      a6 = v44;
    }
  }

  xpc_dictionary_set_uint64(v19, "flags", a6);
  objc_msgSend_sendSynchronously_request_reply_(self, v42, (a6 >> 3) & 1, (uint64_t)v19, (uint64_t)v18);
}

- (void)releaseHold:(id)a3 flags:(unint64_t)a4 reply:(id)a5
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_request_(self, v10, (uint64_t)"lock", v11, v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v14, (uint64_t)v20, 1, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_set_uuids_(self, v17, (uint64_t)v13, (uint64_t)v16, v18);
  xpc_dictionary_set_uint64(v13, "flags", a4);
  objc_msgSend_sendSynchronously_request_reply_(self, v19, (a4 >> 3) & 1, (uint64_t)v13, (uint64_t)v8);
}

- (id)request:(const char *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "request", a3);
  uint64_t v10 = objc_msgSend_protocolVersion(self, v6, v7, v8, v9);
  xpc_dictionary_set_uint64(v5, "version", v10);
  return v5;
}

- (id)request:(const char *)a3 paths:(id)a4
{
  id v6 = a4;
  objc_msgSend_request_(self, v7, (uint64_t)a3, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(v10, "paths", v11);
  return v10;
}

- (void)send:(id)a3 reply:(id)a4
{
}

- (void)sendSynchronously:(BOOL)a3 request:(id)a4 reply:(id)a5
{
}

- (void)sendSynchronously:(BOOL)a3 request:(id)a4 retry:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a6;
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = sub_186A1DEA8;
  v27[3] = &unk_189F20FC0;
  objc_copyWeak(&v29, &location);
  id v13 = v11;
  id v28 = v13;
  id v14 = (void (**)(void, void))MEMORY[0x186E4154C](v27);
  if (v8)
  {
    xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(self->_pkd, v10);
    xpc_object_t v16 = (xpc_object_t)MEMORY[0x1895F9198];
    if (v15 == (xpc_object_t)MEMORY[0x1895F9198] && v7)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v10, "flags");
      xpc_dictionary_set_uint64(v10, "flags", uint64 & 0xFFFFFFFFFFFF7FFFLL);
      int v18 = 1;
      while (1)
      {
        pklog_handle_for_category(1);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = self;
          _os_log_error_impl(&dword_186A04000, v19, OS_LOG_TYPE_ERROR, "%@: retrying sync request", buf, 0xCu);
        }

        xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(self->_pkd, v10);
        if (v15 != v16) {
          break;
        }
        if (--v18)
        {
          xpc_object_t v15 = v16;
          break;
        }
      }
    }

    ((void (**)(void, xpc_object_t))v14)[2](v14, v15);
  }

  else
  {
    pkd = self->_pkd;
    replyQueue = self->_replyQueue;
    handler[0] = v12;
    handler[1] = 3221225472LL;
    handler[2] = sub_186A1DF48;
    handler[3] = &unk_189F21010;
    objc_copyWeak(&v25, &location);
    BOOL v26 = v7;
    id v23 = v10;
    uint64_t v24 = v14;
    xpc_connection_send_message_with_reply(pkd, v23, (dispatch_queue_t)replyQueue, handler);

    objc_destroyWeak(&v25);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)set:(id)a3 plugins:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  xpc_object_t v8 = xpc_array_create(0LL, 0LL);
  xpc_object_t v9 = xpc_array_create(0LL, 0LL);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = sub_186A1E21C;
  v16[3] = &unk_189F21038;
  id v17 = v8;
  id v18 = v7;
  id v19 = v9;
  id v10 = v9;
  id v11 = v7;
  xpc_object_t value = v8;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v12, (uint64_t)v16, v13, v14);

  xpc_dictionary_set_value(v6, "uuids", value);
  xpc_dictionary_set_value(v6, "paths", v11);
  xpc_dictionary_set_value(v6, "oneshotuuids", v10);
}

- (void)set:(id)a3 uuids:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  unint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, (uint64_t)v22, 16);
  if (v10)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0LL;
      if (v10 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v10;
      }
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_getUUIDBytes_( *(void **)(*((void *)&v17 + 1) + 8 * v15),  v11,  (uint64_t)uuid,  v12,  v13,  (void)v17);
        xpc_array_set_uuid(v7, 0xFFFFFFFFFFFFFFFFLL, uuid);
        ++v15;
      }

      while (v16 != v15);
      unint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v17, (uint64_t)v22, 16);
    }

    while (v10);
  }

  xpc_dictionary_set_value(v5, "uuids", v7);
}

+ (id)convertToXPC:(id)a3 version:(unint64_t)a4
{
  if (a4 == 3) {
    return (id)_CFXPCCreateXPCMessageWithCFObject();
  }
  else {
    return 0LL;
  }
}

- (id)convertFromXPC:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_protocolVersion(self, v5, v6, v7, v8) == 3) {
    xpc_object_t v9 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  }
  else {
    xpc_object_t v9 = 0LL;
  }

  return v9;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (OS_xpc_object)pkd
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPkd:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end