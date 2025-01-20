void sub_1000038E4(id a1)
{
  IDSCredentialsDaemonIDSInterface *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___IDSCredentialsDaemonIDSInterface);
  v2 = (void *)qword_1000157E8;
  qword_1000157E8 = (uint64_t)v1;
}

uint64_t sub_100003BE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100003DB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004068(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_10000A708(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000043FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004754(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000059A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKey:v5]);
  if ((objc_opt_isKindOfClass(v6, a1) & 1) != 0)
  {
    id v7 = v6;
  }

  else
  {
    if (v6)
    {
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10000A778((uint64_t)v5, a1, v8);
      }
    }

    id v7 = 0LL;
  }

  return v7;
}

void sub_100005F90(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), IDSRemoteCredentialKeyAccountMap, v3);
  }
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "FetchRA - Sending my device AccountInfo For services requested: %@",  (uint8_t *)&v6,  0xCu);
  }

  if (([*(id *)(a1 + 40) _storeIDSMessageForLaterDeliveryIfNecessary:*(void *)(a1 + 32) completionBlock:0 isPairing:0] & 1) == 0) {
    [*(id *)(a1 + 40) _sendIDSMessage:*(void *)(a1 + 32)];
  }
}

void sub_1000063A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    value = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSDevicePropertyIdentifier]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyEncryptionKey]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyEncryptionClassAKey]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyEncryptionClassCKey]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyPrivateDeviceData]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyName]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyHardwareVersion]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    v11 = (const void *)IDSRemoteCredentialKeyUniqueID;
    id v12 = sub_1000059A0(v10, *(void **)(a1 + 32), IDSRemoteCredentialKeyUniqueID);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyCommand, &off_1000112F0);
    if (v13) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, v11, v13);
    }
    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyIdentifier, value);
    }
    if (v16) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyEncryptionKey, v16);
    }
    if (v5) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyEncryptionClassAKey, v5);
    }
    if (v6) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyEncryptionClassCKey, v6);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeySuccess, &__kCFBooleanTrue);
    if (v7) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyPrivateDeviceData, v7);
    }
    if (v8) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyDeviceName, v8);
    }
    if (v9) {
      CFDictionarySetValue((CFMutableDictionaryRef)v14, IDSRemoteCredentialKeyHardwareVersion, v9);
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog NRPairing](&OBJC_CLASS___IMRGLog, "NRPairing"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sending my device info: %@", buf, 0xCu);
    }

    if (([*(id *)(a1 + 40) _storeIDSMessageForLaterDeliveryIfNecessary:v14 completionBlock:0 isPairing:1] & 1) == 0) {
      [*(id *)(a1 + 40) _sendIDSPairingMessage:v14];
    }
  }
}

id -[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:]( IDSCredentialsDaemonIDSInterface *self, SEL a2, id a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMOrderedMutableDictionary orderedObjectForKey:](self->_uniqueIDToInfo, "orderedObjectForKey:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"block"]);

  return v4;
}
}

LABEL_13:
  }

LABEL_14:
}

  _IMWarn(@"Unhandled signal: %d");
}

void sub_1000082A8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000082B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008308(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___IDSCredentialsDaemon);
  v2 = (void *)qword_1000157F8;
  qword_1000157F8 = (uint64_t)v1;
}

void sub_100008868(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Application state changed: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v8)
    && _IDSShouldLog(2LL, @"IDSCredentialsDaemon"))
  {
    id v18 = v3;
    _IDSLogV(2LL, @"IDSFoundation", @"IDSCredentialsDaemon", @"Application state changed: %@");
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", BKSApplicationStateProcessIDKey, v18));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:BKSApplicationStateKey]);
  v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 && [v10 intValue] == 2)
  {
    uint64_t v14 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v9 intValue];
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, " => Pid %d suspended!", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled(v17)
      && _IDSShouldLog(0LL, @"IDSCredentialsDaemon"))
    {
      id v19 = [v9 intValue];
      _IDSLogV(0LL, @"IDSFoundation", @"IDSCredentialsDaemon", @" => Pid %d suspended!");
    }

    objc_msgSend(WeakRetained, "_pidSuspended:", objc_msgSend(v9, "intValue", v19));
  }
}

void sub_10000909C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) allKeys]);
  id v3 = [v2 count];

  if (!v3)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("IDSCredentialsDaemon", v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Idle exiting, we're done here", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v7))
    {
    }

    [*(id *)(a1 + 32) _terminate];
  }

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  if (qword_100015800 != -1) {
    dispatch_once(&qword_100015800, &stru_100010728);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100010708);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCredentialsDaemon sharedInstance](&OBJC_CLASS___IDSCredentialsDaemon, "sharedInstance"));

  objc_autoreleasePoolPop(v0);
  if (v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v2 run];
  }

  return 0LL;
}

void sub_100009420(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    int v4 = dword_10000BFE4[i];
    uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v4, 0LL, v2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100009528;
    handler[3] = &unk_100010748;
    int v9 = v4;
    dispatch_source_set_event_handler(v5, handler);
    uint64_t v6 = (void *)qword_100015820[i];
    qword_100015820[i] = v5;
    uint64_t v7 = v5;

    dispatch_resume(v7);
    signal(v4, (void (__cdecl *)(int))1);
  }
}

void sub_100009528(uint64_t a1)
{
}

void sub_100009530(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009588;
  block[3] = &unk_100010748;
  int v2 = a1;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100009588(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 14)
  {
    if (v1 != 1 && v1 != 3)
    {
      if (v1 == 13)
      {
        signal(2, (void (__cdecl *)(int))sub_100009530);
        return;
      }

      goto LABEL_14;
    }

LABEL_11:
    _IMLog(@"Quit - notifying about shutdown");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "__mainThreadPostNotificationName:object:", @"IMAVDaemonShutdownNotification", 0);

    _IMLog(@"Quit - shutting down daemon");
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCredentialsDaemon sharedInstance](&OBJC_CLASS___IDSCredentialsDaemon, "sharedInstance"));
    [v4 shutdown];

    _IMLog(@"Quit - goodbye!");
    return;
  }

  switch(v1)
  {
    case 31:
      uint64_t v5 = _IMLog(@"Reloading Logging Settings");
      uint64_t v6 = _IMSyncLoggingSettings(v5);
      MarcoSyncLoggingsPreferences(v6);
      return;
    case 30:
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[IDSCredentialsDaemon sharedInstance](&OBJC_CLASS___IDSCredentialsDaemon, "sharedInstance"));
      [v7 logState];

      return;
    case 15:
      goto LABEL_11;
  }

void sub_10000970C(id a1)
{
  int v1 = objc_alloc_init(&OBJC_CLASS___IDSCredentialsDaemonMIGInterface);
  int v2 = (void *)qword_100015810;
  qword_100015810 = (uint64_t)v1;
}

uint64_t sub_1000099B4(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 16LL))
  {
    _IMWarn(@"IDSRemoteURLConnectionDaemonMIGInterface auth port died: %@");
    exit(-1);
  }

  return result;
}

void sub_1000099F0(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  int v4 = a2;
  uint64_t v5 = a3;
  uint64_t v7 = OSLogHandleForIDSCategory("RemoteCredentialsAgent", v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Incoming peer auth grant request", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v9)
    && _IDSShouldLog(1LL, @"RemoteCredentialsAgent"))
  {
    _IDSLogV(1LL, @"IDSFoundation", @"RemoteCredentialsAgent", @"Incoming peer auth grant request");
  }

  uint64_t v10 = v4;
  v11 = v5;
  xpc_type_t type = xpc_get_type(v11);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v11 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      uint64_t v43 = OSLogHandleForIDSCategory("RemoteCredentialsAgent", v12);
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(v10);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = pid;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "peer(%d) received XPC_ERROR_CONNECTION_INVALID",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v46)
        && _IDSShouldLog(0LL, @"RemoteCredentialsAgent"))
      {
        xpc_connection_get_pid(v10);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteCredentialsAgent",  @"peer(%d) received XPC_ERROR_CONNECTION_INVALID");
      }
    }

    else if (v11 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
    {
      uint64_t v47 = OSLogHandleForIDSCategory("RemoteCredentialsAgent", v12);
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v49 = xpc_connection_get_pid(v10);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v50)
        && _IDSShouldLog(0LL, @"RemoteCredentialsAgent"))
      {
        xpc_connection_get_pid(v10);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteCredentialsAgent",  @"peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED");
      }
    }

    else if (v11 == (OS_xpc_object *)&_xpc_error_termination_imminent)
    {
      uint64_t v27 = OSLogHandleForIDSCategory("RemoteCredentialsAgent", v12);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v29 = xpc_connection_get_pid(v10);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v30)
        && _IDSShouldLog(0LL, @"RemoteCredentialsAgent"))
      {
        xpc_connection_get_pid(v10);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteCredentialsAgent",  @"peer(%d) received XPC_ERROR_TERMINATION_IMMINENT");
      }
    }
  }

  else
  {
    uint64_t v14 = v10;
    *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&buf[16] = v15;
    xpc_connection_get_audit_token();
    uint64_t v16 = kIDSRemoteCredentialsEntitlement;
    if ((IMDAuditTokenTaskHasEntitlement(buf, kIDSRemoteCredentialsEntitlement) & 1) != 0)
    {

      if (type != (xpc_type_t)&_xpc_type_dictionary) {
        sub_10000A908();
      }
      uint64_t v17 = v11;
      id v18 = xpc_copy_description(v17);
      uint64_t v20 = OSLogHandleForIDSCategory("RemoteCredentialsAgent", v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v22 = xpc_connection_get_pid(v14);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "received message from peer(%d): %s",  buf,  0x12u);
      }

      if (os_log_shim_legacy_logging_enabled(v23)
        && _IDSShouldLog(0LL, @"RemoteCredentialsAgent"))
      {
        xpc_connection_get_pid(v14);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteCredentialsAgent",  @"received message from peer(%d): %s");
      }

      free(v18);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10000A1EC;
      *(void *)&buf[24] = &unk_1000107D0;
      v24 = v17;
      v57 = v24;
      v58 = v14;
      *(void *)v52 = _NSConcreteStackBlock;
      *(void *)&v52[8] = 3221225472LL;
      *(void *)&v52[16] = sub_10000A48C;
      v53 = &unk_1000107F8;
      v54 = v24;
      id v55 = [buf copy];
      v25 = v24;
      id v26 = v55;
      im_dispatch_after_primary_queue(v52, 0.0);
    }

    else
    {
      uint64_t v31 = xpc_connection_get_pid(v14);
      uint64_t v33 = OSLogHandleForIDSCategory("Warning", v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = IMProcessNameForPid(v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        *(_DWORD *)v52 = 138412802;
        *(void *)&v52[4] = v16;
        *(_WORD *)&v52[12] = 2112;
        *(void *)&v52[14] = v36;
        *(_WORD *)&v52[22] = 1024;
        LODWORD(v53) = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Denying xpc connection, task does not have entitlement: %@  (%@:%d)",  v52,  0x1Cu);
      }

      if (os_log_shim_legacy_logging_enabled(v37))
      {
        uint64_t v38 = IMProcessNameForPid(v31);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        _IDSWarnV(@"IDSFoundation", @"Denying xpc connection, task does not have entitlement: %@  (%@:%d)");

        uint64_t v40 = IMProcessNameForPid(v31);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Denying xpc connection, task does not have entitlement: %@  (%@:%d)");

        uint64_t v42 = IMProcessNameForPid(v31);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v42);
        _IDSLogTransport( @"Warning",  @"IDS",  @"Denying xpc connection, task does not have entitlement: %@  (%@:%d)");
      }

      xpc_connection_cancel(v14);
    }
  }
}

void sub_10000A098(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100009D54LL);
  }

  _Unwind_Resume(a1);
}

id sub_10000A194(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__setupServer");
}

void sub_10000A1EC(uint64_t a1, int a2, void *a3, int a4)
{
  id v16 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (a4)
  {
    switch(a2)
    {
      case 10:
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
        id v10 = sub_10000A3E4(v9, v16, IDSRemoteCredentialKeyiMessageAccountInfo);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        IMInsertArraysToXPCDictionary(reply, "imessage-account-info");
        goto LABEL_7;
      case 12:
      case 16:
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:IDSRemoteCredentialKeySuccess]);
        [v8 BOOLValue];

        IMInsertBoolsToXPCDictionary(reply, "success");
        break;
      case 14:
        v11 = (void *)objc_claimAutoreleasedReturnValue([v16 _dictionaryForKey:IDSRemoteCredentialKeyIdStatusUpdates]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:IDSRemoteCredentialKeySuccess]);
        [v12 BOOLValue];

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v16 _stringForKey:IDSRemoteCredentialKeyFromURI]);
        IMInsertBoolsToXPCDictionary(reply, "success");
        IMInsertDictionariesToXPCDictionary(reply, "idStatusUpdates");
        IMInsertNSStringsToXPCDictionary(reply, "fromURI");

        goto LABEL_7;
      case 18:
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v15 = sub_10000A3E4(v14, v16, IDSRemoteCredentialKeyAccountMap);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
        IMInsertDictionariesToXPCDictionary(reply, "accountMap");
LABEL_7:

        break;
      default:
        break;
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
}

id sub_10000A3E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKey:v5]);
  if ((objc_opt_isKindOfClass(v6, a1) & 1) != 0)
  {
    id v7 = v6;
  }

  else
  {
    if (v6)
    {
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10000A930((uint64_t)v5, a1, v8);
      }
    }

    id v7 = 0LL;
  }

  return v7;
}

void sub_10000A48C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IDSCredentialsDaemonIDSInterface sharedInstance]( &OBJC_CLASS___IDSCredentialsDaemonIDSInterface,  "sharedInstance"));
  [v2 forwardIPCRequestToIDS:*(void *)(a1 + 32) withCompletionBlock:*(void *)(a1 + 40)];
}

void sub_10000A698( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A708( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A778(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "About to send device info request to IDS",  (uint8_t *)&v3,  0x16u);
  sub_1000082A0();
}

void sub_10000A7F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A880( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A908()
{
  __assert_rtn("auth_peer_event_handler", "IDSCredentialsDaemonMIGInterface.m", 59, "type == XPC_TYPE_DICTIONARY");
}

void sub_10000A930(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Denying xpc connection, task does not have entitlement: %@  (%@:%d)",  (uint8_t *)&v3,  0x16u);
}

id objc_msgSend__sendIDSMessage_timeOut_queueOneIdentifier_forcedIdentifier_options_identifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendIDSMessage:timeOut:queueOneIdentifier:forcedIdentifier:options:identifier:");
}

id objc_msgSend__storeIDSMessageForLaterDeliveryIfNecessary_queueOneIdentifier_completionBlock_isPairing_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeIDSMessageForLaterDeliveryIfNecessary:queueOneIdentifier:completionBlock:isPairing:");
}

id objc_msgSend__storeIDSMessageForLaterDeliveryIfNecessary_timeOut_queueOneIdentifier_forcedIdentifier_completionBlock_isPairing_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_storeIDSMessageForLaterDeliveryIfNecessary:timeOut:queueOneIdentifier:forcedIdentifier:completionBlock:isPairing:");
}

id objc_msgSend_watchPairing(void *a1, const char *a2, ...)
{
  return [a1 watchPairing];
}