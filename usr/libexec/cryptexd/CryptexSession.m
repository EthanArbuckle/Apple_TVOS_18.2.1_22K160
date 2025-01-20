@interface CryptexSession
- (BOOL)sessionAddCptxWithBundleID:(const char *)a3 withType:(int64_t)a4 dmgFd:(int *)a5 trustCacheFD:(int *)a6 manifestFD:(int *)a7 volumeHashFD:(int *)a8 infoPlistFd:(int *)a9 cx1Properties:(id)a10;
- (BOOL)session_removal_begun;
- (CryptexSession)initWithCore:(id)a3;
- (NSMutableArray)peer_array;
- (NSMutableArray)quire_array;
- (NSString)name;
- (OS_dispatch_group)session_work_group;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (OS_session_core)cs;
- (OS_xpc_object)listener;
- (char)copySessionName;
- (int)activate;
- (int)error;
- (int64_t)stop_reason;
- (unint64_t)exit_code;
- (void)cancelPeerConnections;
- (void)parseCommandFromMessage:(id)a3 fromPeer:(id)a4;
- (void)sessionAddParseXPC:(id)a3;
- (void)sessionEventNotify:(int64_t)a3;
- (void)sessionMessageReply:(id)a3;
- (void)sessionStart;
- (void)sessionStopWithReason:(int64_t)a3 exitCode:(unint64_t)a4;
- (void)setCs:(id)a3;
- (void)setDq:(id)a3;
- (void)setError:(int)a3;
- (void)setExitReason:(int64_t)a3 withCode:(unint64_t)a4;
- (void)setExit_code:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setName:(id)a3;
- (void)setPeer_array:(id)a3;
- (void)setQuire_array:(id)a3;
- (void)setSession_removal_begun:(BOOL)a3;
- (void)setSession_work_group:(id)a3;
- (void)setStop_reason:(int64_t)a3;
- (void)setupHandler;
@end

@implementation CryptexSession

- (void)cancelPeerConnections
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
    *(_DWORD *)buf = 134217984;
    id v16 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling peer connections: %zu", buf, 0xCu);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        xpc_connection_cancel(*(xpc_connection_t *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)sessionStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  int uid = cryptex_session_core_get_uid();

  v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
  dispatch_group_enter(v6);

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Searching for LaunchAgents to add to the session",  (uint8_t *)&v18,  2u);
  }

  uint64_t v8 = sub_100014D14();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  uint64_t overrides = cryptex_session_core_get_overrides();
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(overrides);

  CFIndex v12 = sub_100015EE4((uint64_t)v8, uid, v11);
  if ((_DWORD)v12)
  {
    CFIndex v13 = v12;
    -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 32LL);
    -[CryptexSession setError:](self, "setError:", v13);
    int v14 = *__error();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = -[CryptexSession error](self, "error");
      int v18 = 138412546;
      v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to start session %@: %{darwin.errno}d",  (uint8_t *)&v18,  0x12u);
    }

    *__error() = v14;
    v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_leave(v17);
  }

  else
  {
    cryptex_async_f(v8, self, sub_10000AB28);
  }
}

- (void)sessionMessageReply:(id)a3
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    if (-[CryptexSession error](self, "error"))
    {
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67109120;
        v17[1] = -[CryptexSession error](self, "error");
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Session has an error (code %d), reporting it.",  (uint8_t *)v17,  8u);
      }

      xpc_dictionary_set_int64(reply, "STATE", 1LL);
      int64_t v6 = -[CryptexSession error](self, "error");
      id v7 = "ERROR";
      uint64_t v8 = reply;
    }

    else
    {
      id v7 = "STATE";
      uint64_t v8 = reply;
      int64_t v6 = 0LL;
    }

    xpc_dictionary_set_int64(v8, v7, v6);
    xpc_dictionary_send_reply(reply);
  }

  else
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003E700(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)sessionStopWithReason:(int64_t)a3 exitCode:(unint64_t)a4
{
  id v7 = sub_100014D14();
  int v8 = *__error();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = -[CryptexSession error](self, "error");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "sessionStopWithReason occurred.: %{darwin.errno}d",  buf,  8u);
  }

  *__error() = v8;
  if (!-[CryptexSession session_removal_begun](self, "session_removal_begun"))
  {
    -[CryptexSession setSession_removal_begun:](self, "setSession_removal_begun:", 1LL);
    uint64_t v10 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_enter(v11);

    -[CryptexSession setExitReason:withCode:](self, "setExitReason:withCode:", a3, a4);
    -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 8LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession quire_array](self, "quire_array"));
    id v13 = [v12 count];

    if (v13)
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession quire_array](self, "quire_array"));
        id v16 = [v15 count];
        *(_DWORD *)buf = 134217984;
        id v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Taking down quires: count %zu", buf, 0xCu);
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession quire_array](self, "quire_array"));
      id v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v18)
      {
        id v20 = v18;
        uint64_t v21 = *(void *)v36;
        *(void *)&__int128 v19 = 134217984LL;
        __int128 v34 = v19;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log", v34));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              id v41 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "unmounting %p", buf, 0xCu);
            }

            v25 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
            dispatch_group_enter(v25);

            sub_100017570((uint64_t)v7, v23, 1uLL, self, sub_10000B1A0);
          }

          id v20 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }

        while (v20);
      }
    }

    else
    {
      -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 16LL);
      -[CryptexSession cancelPeerConnections](self, "cancelPeerConnections");
    }

    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Searching for LaunchAgents to remove from the session",  buf,  2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    uint64_t overrides = cryptex_session_core_get_overrides();
    v29 = (void *)objc_claimAutoreleasedReturnValue(overrides);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    int uid = cryptex_session_core_get_uid();

    sub_100016094((uint64_t)v7, uid);
    v32 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_leave(v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](&OBJC_CLASS___CryptexSessionList, "sharedList"));
    [v33 removeCryptexSession:self];
  }
}

- (void)sessionAddParseXPC:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[CryptexSession setError:](self, "setError:", 22LL);
    int v12 = *__error();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = -[CryptexSession error](self, "error");
      uint64_t v14 = "No payload sent for add.: %{darwin.errno}d";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 8u);
    }

- (BOOL)sessionAddCptxWithBundleID:(const char *)a3 withType:(int64_t)a4 dmgFd:(int *)a5 trustCacheFD:(int *)a6 manifestFD:(int *)a7 volumeHashFD:(int *)a8 infoPlistFd:(int *)a9 cx1Properties:(id)a10
{
  id v17 = a10;
  id v18 = (void *)cryptex_core_create(0LL);
  uint64_t v19 = cryptex_core_set_assets_from_fds(v18, a4, a5, a6, a9, a7, a8);
  if ((_DWORD)v19)
  {
    -[CryptexSession setError:](self, "setError:", v19);
    int v20 = *__error();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v31 = 67109120;
      LODWORD(v32) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "failed to add cryptex assets: %{darwin.errno}d",  (uint8_t *)&v31,  8u);
    }

    *__error() = v20;
  }

  else
  {
    if (v17) {
      cryptex_core_set_cryptex1_properties(v18);
    }
    v22 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
    dispatch_group_enter(v22);

    v23 = (void *)cryptex_host_create(0LL, 1LL);
    cryptex_core_attach_host(v18, v23);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315394;
      v32 = a3;
      __int16 v33 = 2112;
      __int128 v34 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Installing cryptex %s to %@",  (uint8_t *)&v31,  0x16u);
    }

    v25 = sub_100014D14();
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    int uid = cryptex_session_core_get_uid();
    v28 = sub_100037F1C(v25, 0LL, self, uid, 0LL, sub_10000BCC0);

    sub_1000161A8(v25, v18, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
    cryptex_session_core_append_to_array(v29, a3);
  }

  return (_DWORD)v19 == 0;
}

- (void)parseCommandFromMessage:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    v30 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(daemon) delivering to %@",  (uint8_t *)&v29,  0xCu);
  }

  xpc_type_t type = xpc_get_type(v6);
  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_4;
  }
  xpc_object_t value = xpc_dictionary_get_value(v6, "COMMAND");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (!v19)
  {
    if (xpc_dictionary_get_BOOL(v6, "REMOVE"))
    {
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Recieved Peer Remove Message",  (uint8_t *)&v29,  2u);
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
      [v10 removeObject:v7];
      goto LABEL_20;
    }

- (void)setupHandler
{
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession listener](self, "listener"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000C424;
  handler[3] = &unk_100055580;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);

  id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession listener](self, "listener"));
  xpc_connection_activate(v4);

  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession listener](self, "listener"));
  xpc_endpoint_t v6 = xpc_endpoint_create(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  cryptex_session_core_set_endpoint(v7, v6);
}

- (CryptexSession)initWithCore:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CryptexSession;
  v5 = -[CryptexSession init](&v18, "init");
  if (v5)
  {
    xpc_endpoint_t v6 = sub_100014D14();
    id v7 = (void *)cryptex_session_core_copy_name(v4);
    -[CryptexSession setCs:](v5, "setCs:", v4);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    -[CryptexSession setName:](v5, "setName:", v8);

    os_log_t v9 = os_log_create("com.apple.libcryptex", "session_item");
    -[CryptexSession setLog:](v5, "setLog:", v9);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[CryptexSession setPeer_array:](v5, "setPeer_array:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[CryptexSession setQuire_array:](v5, "setQuire_array:", v11);

    -[CryptexSession setError:](v5, "setError:", 0LL);
    uint64_t v12 = cryptex_queue_create_with_target("session_handler", 0LL, v6);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[CryptexSession setDq:](v5, "setDq:", v13);

    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession dq](v5, "dq"));
    xpc_connection_t v15 = xpc_connection_create(0LL, v14);
    -[CryptexSession setListener:](v5, "setListener:", v15);

    dispatch_group_t v16 = dispatch_group_create();
    -[CryptexSession setSession_work_group:](v5, "setSession_work_group:", v16);

    -[CryptexSession setSession_removal_begun:](v5, "setSession_removal_begun:", 0LL);
    free(v7);
  }

  return v5;
}

- (void)sessionEventNotify:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  uint64_t value = cryptex_session_core_get_state();

  LODWORD(v5) = -[CryptexSession error](self, "error");
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  id v7 = (void *)v6;
  int64_t v25 = a3;
  if ((_DWORD)v5) {
    int64_t v8 = 32LL;
  }
  else {
    int64_t v8 = a3;
  }
  int64_t v9 = cryptex_session_core_transition(v6, v8);

  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int64_t v32 = a3;
    __int16 v33 = 2048;
    unint64_t v34 = -[CryptexSession exit_code](self, "exit_code");
    __int16 v35 = 2048;
    int64_t v36 = -[CryptexSession stop_reason](self, "stop_reason");
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "sessionNotify event:%lld code: %llu reason: %lld",  buf,  0x20u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
  id v12 = [v11 count];

  if (v12)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[CryptexSession peer_array](self, "peer_array"));
    id v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(_xpc_connection_s **)(*((void *)&v26 + 1) + 8LL * (void)i);
          objc_super v18 = objc_autoreleasePoolPush();
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
          int v20 = (void *)cryptex_session_core_copy_xpc_object(v19);

          xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_value(v21, "object", v20);
          int64_t v22 = v25;
          if (v9 == 6)
          {
            xpc_dictionary_set_int64(v21, "error_event", -[CryptexSession error](self, "error"));
            int64_t v22 = 32LL;
          }

          xpc_dictionary_set_int64(v21, "start", value);
          xpc_dictionary_set_int64(v21, "event", v22);
          xpc_dictionary_set_int64(v21, "reason", -[CryptexSession stop_reason](self, "stop_reason"));
          xpc_dictionary_set_uint64(v21, "code", -[CryptexSession exit_code](self, "exit_code"));
          xpc_dictionary_set_int64(v21, "state", v9);
          xpc_connection_send_message(v17, v21);

          objc_autoreleasePoolPop(v18);
        }

        id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v14);
    }
  }

- (int)activate
{
  id v3 = objc_claimAutoreleasedReturnValue(-[CryptexSession name](self, "name"));
  [v3 UTF8String];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  v5 = (void *)cryptex_session_core_copy_homedir();

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  cryptex_session_core_get_attributes();

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  cryptex_session_core_get_homedir_size();

  uint64_t v8 = sub_10000E104();
  if ((_DWORD)v8)
  {
    int v9 = *__error();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      __int16 v24 = 1024;
      int v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to create user for %@: %{darwin.errno}d",  buf,  0x12u);
    }

    uint64_t v11 = 0LL;
    *__error() = v9;
  }

  else
  {
    uint64_t v12 = sub_10000E10C();
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
      cryptex_session_core_set_homedir(v13, v12);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
      cryptex_session_core_set_uid(v14, 0LL);

      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = (CryptexSession *)v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created homedir %s", buf, 0xCu);
      }

      uint64_t v8 = sub_100038080();
      if ((_DWORD)v8)
      {
        int v16 = *__error();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v23 = self;
          __int16 v24 = 1024;
          int v25 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to create launchd session for %@: %{darwin.errno}d",  buf,  0x12u);
        }

        *__error() = v16;
      }

      else
      {
        sub_10001ED20();
        uint64_t v8 = 0LL;
      }

      uint64_t v11 = (void *)v12;
    }

    else
    {
      int v18 = *__error();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = 22;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to find homedir for user.: %{darwin.errno}d",  buf,  8u);
      }

      uint64_t v11 = 0LL;
      *__error() = v18;
      uint64_t v8 = 22LL;
    }
  }

  -[CryptexSession setError:](self, "setError:", v8);
  -[CryptexSession sessionEventNotify:](self, "sessionEventNotify:", 1LL);
  int v20 = -[CryptexSession error](self, "error");
  free(v11);
  free(v5);
  return v20;
}

- (char)copySessionName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession cs](self, "cs"));
  id v3 = (char *)cryptex_session_core_copy_name(v2);

  return v3;
}

- (void)setExitReason:(int64_t)a3 withCode:(unint64_t)a4
{
  if (!-[CryptexSession stop_reason](self, "stop_reason"))
  {
    -[CryptexSession setStop_reason:](self, "setStop_reason:", a3);
    -[CryptexSession setExit_code:](self, "setExit_code:", a4);
  }

- (OS_session_core)cs
{
  return self->_cs;
}

- (void)setCs:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
}

- (NSMutableArray)peer_array
{
  return self->_peer_array;
}

- (void)setPeer_array:(id)a3
{
}

- (NSMutableArray)quire_array
{
  return self->_quire_array;
}

- (void)setQuire_array:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (OS_dispatch_group)session_work_group
{
  return self->_session_work_group;
}

- (void)setSession_work_group:(id)a3
{
}

- (BOOL)session_removal_begun
{
  return self->_session_removal_begun;
}

- (void)setSession_removal_begun:(BOOL)a3
{
  self->_session_removal_begun = a3;
}

- (int64_t)stop_reason
{
  return self->_stop_reason;
}

- (void)setStop_reason:(int64_t)a3
{
  self->_stop_reason = a3;
}

- (unint64_t)exit_code
{
  return self->_exit_code;
}

- (void)setExit_code:(unint64_t)a3
{
  self->_exit_code = a3;
}

- (void).cxx_destruct
{
}

@end