void NENetworkRelayMonitorStart(uint64_t a1)
{
  uint64_t v1;
  os_log_s *v2;
  id v3;
  uint8_t v4[16];
  v1 = ne_log_obj(a1);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "starting networkrelay monitor", v4, 2u);
  }

  v3 = +[NRLaunchEventMonitor copySharedMonitor](&OBJC_CLASS___NRLaunchEventMonitor, "copySharedMonitor");
  [v3 start];
}

id sub_4A18()
{
  if (qword_8A98 != -1) {
    dispatch_once(&qword_8A98, &stru_8340);
  }
  return (id)qword_8A90;
}

void sub_4A5C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NEUserEventAgentNetworkDetection);
  v2 = (void *)qword_8A90;
  qword_8A90 = (uint64_t)v1;
}

void sub_4A84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_4A18();
  val = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (val) {
    BOOL v7 = a1 == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    val[3] = a2;
    BOOL v8 = xpc_dictionary_get_BOOL(v5, "init");
    if (v8)
    {
      uint64_t v9 = ne_log_obj(v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Registering for notifications and initializing nehelper",  buf,  2u);
      }

      sub_4BE4(val);
    }
  }
}

void sub_4BE4(id val)
{
  int out_token = -1;
  objc_initWeak(&location, val);
  xpc_event_provider_get_queue();
}

void sub_4D74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_4DB4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    int64_t v4 = a2;
    switch((int)a2)
    {
      case 0:
        a1 = ne_session_on_demand_configs_present();
        if ((a1 & 1) != 0) {
          goto LABEL_35;
        }
        a1 = ne_session_always_on_vpn_configs_present();
        if ((a1 & 1) != 0) {
          goto LABEL_35;
        }
        uint64_t v5 = ne_log_obj(a1);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v24 = inputNotification2String(0LL);
          _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Not generating a %s event because no configurations are present that need to react to network changes",  buf,  0xCu);
        }

        goto LABEL_43;
      case 1:
        if ((ne_session_on_demand_configs_present() & 1) != 0
          || (ne_session_content_filter_configs_present() & 1) != 0
          || (ne_session_always_on_vpn_configs_present() & 1) != 0
          || (ne_session_dns_proxy_configs_present() & 1) != 0
          || (ne_session_dns_settings_configs_present() & 1) != 0
          || (ne_session_path_controller_configs_present() & 1) != 0
          || (ne_session_app_vpn_configs_present() & 1) != 0
          || (ne_session_local_communication_configs_present() & 1) != 0
          || (uint64_t v7 = ne_session_relay_configs_present(), (v7 & 1) != 0))
        {
          char v8 = 1;
          goto LABEL_18;
        }

        if (*(_BYTE *)(v3 + 8))
        {
          char v8 = 0;
LABEL_18:
          *(_BYTE *)(v3 + 8) = v8;
          int v9 = ne_session_vod_evaluate_connection_present();
          a1 = *(void *)(v3 + 48);
          if (v9)
          {
            if (!a1) {
              xpc_event_provider_get_queue();
            }
          }

          else if (a1)
          {
            dispatch_source_cancel((dispatch_source_t)a1);
            v16 = *(void **)(v3 + 48);
            *(void *)(v3 + 48) = 0LL;
          }

LABEL_35:
          uint64_t v17 = ne_log_obj(a1);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = inputNotification2String(a2);
            *(_DWORD *)buf = 136315138;
            uint64_t v24 = v19;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Generating a %s event", buf, 0xCu);
          }

          xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_int64(v20, "network-origin-notification", v4);
          xpc_event_provider_token_fire();
        }

        uint64_t v21 = ne_log_obj(v7);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v24 = inputNotification2String(1LL);
          _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Not generating a %s event because no configurations are present that need active sessions",  buf,  0xCu);
        }

LABEL_43:
        break;
      case 2:
        a1 = ne_session_always_on_vpn_configs_present();
        if ((a1 & 1) != 0) {
          goto LABEL_35;
        }
        a1 = ne_session_dns_proxy_configs_present();
        if ((a1 & 1) != 0) {
          goto LABEL_35;
        }
        uint64_t v10 = ne_log_obj(a1);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v24 = inputNotification2String(2LL);
          _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Not generating a %s event because no configurations are present that need to react to changes in the install ed captive network plugins",  buf,  0xCu);
        }

        goto LABEL_43;
      case 4:
        id v11 = sub_5E50();
        id v22 = (id)objc_claimAutoreleasedReturnValue(v11);
        if (v22)
        {
          id v12 = v22;
          uint64_t v13 = objc_sync_enter(v12);
          uint64_t v14 = ne_log_obj(v13);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Current NE file handles: ", buf, 2u);
          }

          [v12 iterateFileHandlesWithBlock:&stru_84E8];
          objc_sync_exit(v12);
        }

        return;
      case 6:
        a1 = ne_session_vod_evaluate_connection_present();
        if (!(_DWORD)a1) {
          return;
        }
        goto LABEL_35;
      default:
        goto LABEL_35;
    }
  }
}

void sub_51C4(_Unwind_Exception *a1)
{
}

uint64_t sub_51E4(uint64_t a1)
{
  return sub_4DB4(*(void *)(a1 + 32), 6LL);
}

void sub_51F0(uint64_t a1)
{
  uint64_t v2 = ne_log_obj(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 136315138;
    uint64_t v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Received notification %s", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_4DB4((uint64_t)WeakRetained, *(unsigned int *)(a1 + 48));
}

void sub_52AC(uint64_t a1)
{
}

void sub_52B8(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NEUserEventAgentNetworkBlockedObserver);
  uint64_t v2 = (void *)qword_8AA0;
  qword_8AA0 = (uint64_t)v1;
}

void sub_52E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ne_log_obj(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v7;
    __int16 v45 = 2112;
    id v46 = v8;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Got local network blocked notification: pid: %@, uuid: %@, bundle_id: %@",  buf,  0x20u);
  }

  if (v9 && (xpc_type_t type = xpc_get_type(v9), type == (xpc_type_t)&_xpc_type_string))
  {
    uint64_t v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v9));
    xpc_type_t type = (xpc_type_t)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v13 = type;
    if (!v7) {
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
    if (!v7) {
      goto LABEL_9;
    }
  }

  xpc_type_t type = xpc_get_type(v7);
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    uint64_t value = xpc_uint64_get_value(v7);
    if (v8
      && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_uuid
      && (bytes = xpc_uuid_get_bytes(v8), proc_pidinfo(value, 17, 1uLL, buf, 56) == 56)
      && uuid_compare(bytes, buf))
    {
      uuid_unparse(bytes, out);
      uint64_t v18 = ne_log_obj(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v38 = 67109378;
        int v39 = value;
        __int16 v40 = 2080;
        v41 = out;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "LocalNetwork: PID %u does not match UUID %s, is delegating traffic",  v38,  0x12u);
      }
    }

    else
    {
      uint64_t v20 = NECopySigningIdentifierForPID(value);
      uint64_t v21 = (void *)v20;
      if (v20)
      {
        uint64_t v22 = ne_log_obj(v20);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v21;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "LocalNetwork: found bundle id %@ by PID", buf, 0xCu);
        }

        id v24 = v21;
        uint64_t v13 = v24;
      }

      if (!v8) {
        goto LABEL_24;
      }
    }

    goto LABEL_23;
  }

LABEL_9:
  uint64_t value = 0LL;
  if (!v8) {
    goto LABEL_24;
  }
LABEL_23:
  xpc_type_t type = xpc_get_type(v8);
  if (type != (xpc_type_t)&_xpc_type_uuid)
  {
LABEL_24:
    v25 = 0LL;
    goto LABEL_34;
  }

  v26 = xpc_uuid_get_bytes(v8);
  uuid_unparse(v26, (char *)buf);
  v25 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v26);
  xpc_type_t v27 = (xpc_type_t)NEHelperCacheCopySigningIdentifierMapping(v26);
  xpc_type_t v28 = v27;
  if (v27 && (xpc_type_t v27 = xpc_get_type(v27), v27 == (xpc_type_t)&_xpc_type_string))
  {
    v32 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v28));
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v32);
    uint64_t v33 = ne_log_obj(v31);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uuid_string_t out = 138412546;
      *(void *)&out[4] = v31;
      *(_WORD *)&out[12] = 2080;
      *(void *)&out[14] = buf;
      _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_DEFAULT,  "LocalNetwork: found bundle id %@ by UUID %s",  (uint8_t *)out,  0x16u);
    }

    v30 = (os_log_s *)v13;
  }

  else
  {
    uint64_t v29 = ne_log_obj(v27);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uuid_string_t out = 136315138;
      *(void *)&out[4] = buf;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "LocalNetwork: did not find bundle ID for UUID %s",  (uint8_t *)out,  0xCu);
    }

    uint64_t v31 = (uint64_t)v13;
  }

  uint64_t v13 = (void *)v31;
LABEL_34:
  uint64_t v35 = ne_log_obj(type);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  v37 = v36;
  if (v13)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v13;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Found bundle ID: %@", buf, 0xCu);
    }

    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager"));
    -[os_log_s showLocalNetworkAlertForApp:pid:uuid:query:hasEntitlement:completionQueue:handler:]( v37,  "showLocalNetworkAlertForApp:pid:uuid:query:hasEntitlement:completionQueue:handler:",  v13,  value,  v25,  0LL,  0LL,  *(void *)(a1 + 32),  &stru_83C8);
  }

  else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_0, v37, OS_LOG_TYPE_ERROR, "Failed to find bundle ID, ignoring", buf, 2u);
  }
}

void sub_57D8(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = ne_log_obj(a1);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Prompt response says: %u", (uint8_t *)v5, 8u);
  }
}

void init_networkextension(uint64_t a1)
{
  v1 = (os_log_s *)ne_log_obj(a1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Initializing NetworkExtension event agent plugin", buf, 2u);
  }

  int out_token = -1;
  uint64_t v2 = notify_register_check("com.apple.networkextension.disable-restrictions", &out_token);
  if ((_DWORD)v2)
  {
    int v3 = v2;
    uint64_t v4 = (os_log_s *)ne_log_obj(v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "com.apple.networkextension.disable-restrictions";
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }

  int out_token = -1;
  uint64_t v5 = notify_register_check("com.apple.networkextension.fallback-default", &out_token);
  if ((_DWORD)v5)
  {
    int v6 = v5;
    id v7 = (os_log_s *)ne_log_obj(v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "com.apple.networkextension.fallback-default";
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }

  int out_token = -1;
  uint64_t v8 = notify_register_check("com.apple.networkextension.disable-nexus", &out_token);
  if ((_DWORD)v8)
  {
    int v9 = v8;
    uint64_t v10 = (os_log_s *)ne_log_obj(v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "com.apple.networkextension.disable-nexus";
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }

  int out_token = -1;
  uint64_t v11 = notify_register_check("com.apple.networkextension.uuidcache", &out_token);
  if ((_DWORD)v11)
  {
    int v12 = v11;
    uint64_t v13 = (os_log_s *)ne_log_obj(v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "com.apple.networkextension.uuidcache";
      __int16 v18 = 1024;
      int v19 = v12;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }

  NEUserEventAgentNetworkDetectionStart();
  NEFileHandleMaintainerStart();
  NENetworkRelayMonitorStart(v14);
}

void NEFileHandleMaintainerStart()
{
  id v0 = sub_5E50();
  if (objc_claimAutoreleasedReturnValue(v0))
  {
    v1 = @"com.apple.networkextension.file-descriptor-maintainer";
    uint64_t v2 = @"com.apple.networkextension.file-descriptor-maintainer";
    [@"com.apple.networkextension.file-descriptor-maintainer" UTF8String];
    xpc_event_provider_create();
  }
}

void NEUserEventAgentNetworkDetectionStart()
{
  id v0 = sub_4A18();
  id v3 = (id)objc_claimAutoreleasedReturnValue(v0);
  v1 = @"com.apple.networkextension.network-detection";
  if (v3)
  {
    uint64_t v2 = @"com.apple.networkextension.network-detection";
    [@"com.apple.networkextension.network-detection" UTF8String];
    xpc_event_provider_create();
  }
}

void NEUserEventAgentNetworkBlockedObserverStart()
{
  if (qword_8AA8 != -1) {
    dispatch_once(&qword_8AA8, &stru_8388);
  }
  uint64_t v5 = (id)qword_8AA0;
  if (v5)
  {
    dispatch_queue_attr_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v1 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v0);
    dispatch_queue_t v2 = dispatch_queue_create("NEUserEventAgentNetworkBlockedObserver", v1);

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager"));
    [v3 repopulateNetworkPrivacyConfigurationResetAll:0];

    uint64_t v4 = v2;
    v5[1] = network_config_local_network_blocked_observer_create();
  }
}

id sub_5E50()
{
  if (qword_8AB8 != -1) {
    dispatch_once(&qword_8AB8, &stru_8430);
  }
  return (id)qword_8AB0;
}

void sub_5E94(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NEUserEventAgentFileHandleMaintainer);
  dispatch_queue_t v2 = (void *)qword_8AB0;
  qword_8AB0 = (uint64_t)v1;
}

void sub_5EBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_5E50();
  id v16 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = v5;
  if (v16)
  {
    id v8 = v16;
    uint64_t v9 = objc_sync_enter(v8);
    uint64_t v10 = ne_log_obj(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v18 = a1;
      __int16 v19 = 2048;
      uint64_t v20 = a2;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "File Handle Maintainer got a %ld action with token %llu",  buf,  0x16u);
    }

    if (a1 == 1)
    {
      *((void *)v8 + 3) = a2;
      int64_t int64 = xpc_dictionary_get_int64(v7, "nesm-pid");
      int v13 = int64;
      if ((int)int64 >= 1)
      {
        uint64_t v14 = ne_log_obj(int64);
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v18) = v13;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Got nesessionmanager pid %d", buf, 8u);
        }

        sub_60B0((uint64_t)v8, v13);
        sub_63F8(v8);
      }

      [v8 resetFileHandlesFromEvent:v7];
      sub_64D4(v8);
      *((_BYTE *)v8 + 8) = 1;
    }

    objc_sync_exit(v8);
  }
}

void sub_608C(_Unwind_Exception *a1)
{
}

void sub_60B0(uint64_t a1, int a2)
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    if (v4
      && (id v5 = v4, handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32)), v5, handle == a2))
    {
      uint64_t v8 = ne_log_obj(v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Not setting the PID state because the PID didn't change",  buf,  2u);
      }
    }

    else
    {
      if (*(_DWORD *)(a1 + 12) == -1)
      {
        uint64_t v10 = notify_register_check("com.apple.nesessionmanager", (int *)(a1 + 12));
        if ((_DWORD)v10)
        {
          uint64_t v11 = ne_log_obj(v10);
          int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v25 = "com.apple.nesessionmanager";
            _os_log_error_impl( &dword_0,  v12,  OS_LOG_TYPE_ERROR,  "Failed to register for the %s notification",  buf,  0xCu);
          }

          *(_DWORD *)(a1 + 12) = -1;
        }
      }

      int v13 = *(_DWORD *)(a1 + 12);
      if (v13 != -1)
      {
        uint64_t v14 = notify_set_state(v13, a2);
        if ((_DWORD)v14)
        {
          int v15 = v14;
          uint64_t v16 = ne_log_obj(v14);
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "com.apple.nesessionmanager";
            __int16 v26 = 1024;
            int v27 = v15;
            _os_log_error_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "Failed to set the %s notification state: %u",  buf,  0x12u);
          }

          notify_cancel(*(_DWORD *)(a1 + 12));
          *(_DWORD *)(a1 + 12) = -1;
        }
      }

      uint64_t v18 = notify_post("com.apple.nesessionmanager");
      if ((_DWORD)v18)
      {
        int v19 = v18;
        uint64_t v20 = ne_log_obj(v18);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "com.apple.nesessionmanager";
          __int16 v26 = 1024;
          int v27 = v19;
          _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Failed to post the %s notification: %u", buf, 0x12u);
        }
      }

      uint64_t v22 = *(dispatch_source_s **)(a1 + 32);
      if (v22)
      {
        dispatch_source_cancel(v22);
        v23 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = 0LL;
      }

      if (a2 >= 1) {
        xpc_event_provider_get_queue();
      }
    }
  }

void sub_63F8(void *a1)
{
  if (a1)
  {
    v1 = a1;
    uint64_t v2 = objc_sync_enter(v1);
    if ((v1[8] & 1) != 0)
    {
      uint64_t v3 = ne_log_obj(v2);
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Sending file handles to nesessionmanager", v5, 2u);
      }

      objc_claimAutoreleasedReturnValue([v1 createEvent]);
      xpc_event_provider_token_fire();
    }

    objc_sync_exit(v1);
  }

void sub_64BC(_Unwind_Exception *a1)
{
}

void sub_64D4(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_6560;
    v2[3] = &unk_84A8;
    v2[4] = v1;
    [v1 iterateFileHandlesWithBlock:v2];
    objc_sync_exit(v1);
  }

void sub_654C(_Unwind_Exception *a1)
{
}

uint64_t sub_6560(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 launchOwnerWhenReadable];
  if ((_DWORD)v4)
  {
    uint64_t v5 = ne_log_obj(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_debug_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "File Handle Maintainer listening for readable events on %@",  buf,  0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_667C;
    v11[3] = &unk_8480;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = v7;
    uint64_t v13 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle", _NSConcreteStackBlock, 3221225472, sub_667C, &unk_8480));
    [v9 setReadabilityHandler:v11];
  }

  return 1LL;
}

void sub_667C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ne_log_obj(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v6;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "File Handle Maintainer got a readable event on %@, launching owner",  buf,  0xCu);
  }

  [v3 setReadabilityHandler:0];
  dispatch_time(0LL, 1000000000LL);
  xpc_event_provider_get_queue();
}

uint64_t sub_67CC(uint64_t a1)
{
  return sub_64D4(*(void *)(a1 + 32));
}

void sub_67D4(uint64_t a1)
{
  uint64_t v2 = ne_log_obj(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "nesessionmanager(%d) exited", (uint8_t *)v11, 8u);
  }

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  uint64_t v6 = sub_60B0(*(void *)(a1 + 32), 0LL);
  uint64_t has_active_sessions = ne_session_manager_has_active_sessions(v6);
  if ((has_active_sessions & 1) != 0
    || (uint64_t has_active_sessions = ne_session_dns_proxy_configs_present(), (has_active_sessions & 1) != 0)
    || (uint64_t has_active_sessions = ne_session_content_filter_configs_present(), (has_active_sessions & 1) != 0)
    || (uint64_t has_active_sessions = ne_session_always_on_vpn_configs_present(), (has_active_sessions & 1) != 0)
    || (uint64_t has_active_sessions = ne_session_local_communication_configs_present(), (_DWORD)has_active_sessions))
  {
    uint64_t v8 = ne_log_obj(has_active_sessions);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "nesessionmanager exited with active sessions, re-launching nesessionmanager to clear agent status",  (uint8_t *)v11,  2u);
    }

    sub_63F8(*(void **)(a1 + 32));
    id v10 = sub_4A18();
    if (objc_claimAutoreleasedReturnValue(v10)) {
      xpc_event_provider_get_queue();
    }
  }

  objc_sync_exit(v5);
}

void sub_6984(_Unwind_Exception *a1)
{
}

BOOL sub_69A4(id a1, NEFileHandle *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = ne_log_obj(v2);
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "    %@", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

id objc_msgSend_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showLocalNetworkAlertForApp:pid:uuid:query:hasEntitlement:completionQueue:handler:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}