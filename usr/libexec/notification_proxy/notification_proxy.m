void sub_100003C28(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  int v3;
  os_log_s *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  v1 = (uint64_t *)(a1 + 32);
  v2 = (uint64_t *)(a1 + 40);
  v3 = lockdown_send_message(*(void *)(*(void *)(a1 + 32) + 8LL), *(void *)(a1 + 40), 100LL);
  v4 = (os_log_s *)qword_10000C958;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *v2;
      v6 = *v1;
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "lockdown_send_message error, message: %@, connection: %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
  {
    sub_10000622C(v1 + 1, v1, v4);
  }
}

id sub_100003D7C(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  int v2 = lockdown_send_message(*(void *)(*(void *)(a1 + 32) + 8LL), &off_100008800, 100LL);
  v3 = (os_log_s *)qword_10000C958;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *v1;
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "shutdown error, connection: %@",  (uint8_t *)&v12,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
  {
    sub_1000062A4((uint64_t)v1, v3, v5, v6, v7, v8, v9, v10);
  }

  return [*v1 cancel];
}

void sub_100004028( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100004048(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = lockdown_receive_message(*(void *)(*(void *)(a1 + 32) + 8LL), &cf);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = qword_10000C958;
    if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v4;
    uint64_t v6 = "lockdown_receive_message error: %d";
    uint64_t v7 = (os_log_s *)v5;
    uint32_t v8 = 8;
    goto LABEL_4;
  }

  if (cf)
  {
    CFTypeID v9 = CFGetTypeID(cf);
    if (v9 == CFDictionaryGetTypeID())
    {
      uint64_t v10 = (void *)cf;
      sub_1000041F8(WeakRetained, (void *)cf);

      goto LABEL_7;
    }

    uint64_t v12 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v15 = cf;
      uint64_t v6 = "lockdown_receive_message returned an unsupported object: %@!";
      uint64_t v7 = (os_log_s *)v12;
      uint32_t v8 = 12;
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v11 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "lockdown_receive_message returned NULL";
      uint64_t v7 = (os_log_s *)v11;
      uint32_t v8 = 2;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }

LABEL_5:
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16LL));
  if (cf) {
    CFRelease(cf);
  }
LABEL_7:
  CFTypeRef cf = 0LL;
}

void sub_1000041F8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_autoreleasePoolPush();
  if (!v4)
  {
    uint64_t v14 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v3;
      CFTypeRef v15 = "%@ - Disconnected";
      v16 = (os_log_s *)v14;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0xCu);
    }

LABEL_15:
    [v3 cancel];
    uint64_t v7 = 0LL;
    goto LABEL_29;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Command"]);
  if (!v6)
  {
    uint64_t v18 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v3;
      CFTypeRef v15 = "%@ - No command in the message";
      v16 = (os_log_s *)v18;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  uint64_t v7 = v6;
  if ([v6 isEqualToString:@"PostNotification"])
  {
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Name"]);
    CFTypeID v9 = (os_log_s *)qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v3;
      __int16 v30 = 2112;
      v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ - Got POST_NOTIFICATION command for notification: %@",  buf,  0x16u);
    }

    if (v8)
    {
      if (!qword_10000C968)
      {
        uint32_t v22 = notify_post((const char *)[v8 UTF8String]);
        if (!v22) {
          goto LABEL_28;
        }
        uint32_t v23 = v22;
        uint64_t v24 = qword_10000C958;
        if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412546;
        id v29 = v3;
        __int16 v30 = 1024;
        LODWORD(v31) = v23;
        uint64_t v11 = "%@ - Failed to post notification (%u)";
        uint64_t v12 = (os_log_s *)v24;
        uint32_t v13 = 18;
        goto LABEL_27;
      }

      uint64_t v10 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v3;
        __int16 v30 = 2112;
        v31 = v8;
        uint64_t v11 = "%@ - Insecure notification service cannot post notification '%@'";
        uint64_t v12 = (os_log_s *)v10;
        uint32_t v13 = 22;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }

    else
    {
      uint64_t v21 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v3;
        uint64_t v11 = "%@ - No name in post notification command";
        uint64_t v12 = (os_log_s *)v21;
        uint32_t v13 = 12;
        goto LABEL_27;
      }
    }

LABEL_28:
    goto LABEL_29;
  }

  if ([v7 isEqualToString:@"ObserveNotification"])
  {
    v19 = (dispatch_queue_s *)qword_10000C960;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000052BC;
    v25[3] = &unk_100008330;
    id v26 = v4;
    id v27 = v3;
    dispatch_async(v19, v25);
  }

  else if ([v7 isEqualToString:@"Shutdown"])
  {
    v20 = (os_log_s *)qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ - Got SHUTDOWN command", buf, 0xCu);
    }

    [v3 shutdown];
  }

LABEL_29:
  objc_autoreleasePoolPop(v5);
}

void sub_1000045D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_1000045FC(WeakRetained);
}

void sub_1000045FC(void *a1)
{
  id v1 = a1;
  int v2 = (dispatch_queue_s *)qword_10000C960;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005D70;
  block[3] = &unk_100008358;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

uint64_t sub_1000048B0(uint64_t a1)
{
  return xpc_remote_connection_send_message(*(void *)(*(void *)(a1 + 32) + 8LL), *(void *)(a1 + 40));
}

id sub_100004928(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_1000049D4(_Unwind_Exception *a1)
{
}

void sub_1000049F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      uint64_t v18 = (os_log_s *)qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
        sub_10000630C(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    else if (v3 == &_xpc_error_connection_interrupted)
    {
      id v26 = (os_log_s *)qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
        sub_100006340(v26, v27, v28, v29, v30, v31, v32, v33);
      }
    }

    else
    {
      uint32_t v13 = xpc_copy_description(v3);
      uint64_t v14 = (os_log_s *)qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 136446210;
        v36 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Unexpected RemoteXPC error: %{public}s",  (uint8_t *)&v35,  0xCu);
      }

      if (v13) {
        free(v13);
      }
    }

    sub_1000045FC(WeakRetained);
    xpc_remote_connection_cancel(*(void *)(*(void *)(a1 + 32) + 8LL), v34);
  }

  else
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v5)
    {
      uint64_t v6 = v5;
      string = xpc_dictionary_get_string(v3, (const char *)[@"Command" UTF8String]);
      if (string)
      {
        uint32_t v8 = string;
        CFTypeID v9 = xpc_dictionary_get_string(v3, (const char *)[@"Name" UTF8String]);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, @"Command");

          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"Name");

          sub_1000041F8(WeakRetained, v6);
LABEL_21:

          goto LABEL_25;
        }

        v16 = (os_log_s *)qword_10000C958;
        if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        LOWORD(v35) = 0;
        os_log_type_t v17 = "Failed to read name.";
      }

      else
      {
        v16 = (os_log_s *)qword_10000C958;
        if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        LOWORD(v35) = 0;
        os_log_type_t v17 = "Failed to read command.";
      }

      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v35, 2u);
      goto LABEL_21;
    }

    CFTypeRef v15 = (os_log_s *)qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  (uint8_t *)&v35,  2u);
    }
  }

LABEL_25:
}

uint64_t start(int a1, char **a2)
{
  id v4 = "com.apple.mobile.notification_proxy";
  label = "com.apple.mobile.notification_proxy.remote";
  while (1)
  {
    int v5 = getopt(a1, a2, "i");
    if (v5 != 105) {
      break;
    }
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.mobile.lockdown.request_host_buid",  @"com.apple.mobile.lockdown.request_pair",  @"com.apple.datamigrator.migrationDidFinish",  @"com.apple.mobile.lockdown.trust",  @"com.apple.mobile.lockdown.do_not_trust",  @"com.apple.mobile.lockdown.open_trust_dialog",  @"com.apple.mobile.lockdown.cancel_trust_dialog",  0LL));
    uint64_t v7 = (void *)qword_10000C968;
    qword_10000C968 = v6;

    label = "com.apple.mobile.insecure_notification_proxy.remote";
    id v4 = "com.apple.mobile.insecure_notification_proxy";
  }

  if (v5 != -1)
  {
    syslog(3, "unknown option '%c'\n", (char)v5);
    goto LABEL_10;
  }

  uint64_t v8 = (uint64_t)v4;
  os_log_t v9 = os_log_create(v4, "default");
  uint64_t v10 = (void *)qword_10000C958;
  qword_10000C958 = (uint64_t)v9;

  v38[0] = @"com.apple.mobile.application_installed";
  v38[1] = @"com.apple.mobile.application_uninstalled";
  v39[0] = @"com.apple.LaunchServices.applicationRegistered";
  v39[1] = @"com.apple.LaunchServices.applicationUnregistered";
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  2LL));
  uint64_t v12 = (void *)qword_10000C970;
  qword_10000C970 = v11;

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  CFTypeRef v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v14);

  dispatch_source_set_event_handler(v15, &stru_100008410);
  dispatch_resume(v15);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  os_log_type_t v17 = (void *)qword_10000C978;
  qword_10000C978 = v16;

  uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v19 = (void *)qword_10000C980;
  qword_10000C980 = v18;

  uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v21 = (void *)qword_10000C988;
  qword_10000C988 = v20;

  dispatch_queue_t v22 = dispatch_queue_create("com.apple.mobile.notification_proxy_observer_queue", 0LL);
  uint64_t v23 = (void *)qword_10000C960;
  qword_10000C960 = (uint64_t)v22;

  dispatch_queue_t v24 = dispatch_queue_create_with_target_V2(label, &_dispatch_queue_attr_concurrent, &_dispatch_main_q);
  if (!v24)
  {
    int v35 = (os_log_s *)qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to create queue.", buf, 2u);
    }

LABEL_10:
    exit(1);
  }

  dispatch_queue_t v25 = v24;
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener(label, v24, 0LL);
  xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100008450);
  xpc_remote_connection_activate(remote_service_listener);
  uint64_t v27 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
    sub_100006374(v8, v27, v28, v29, v30, v31, v32, v33);
  }
  lockdown_checkin_xpc(v8, 0LL, 0LL, &stru_100008490);
  CFRunLoopRun();

  return 0LL;
}

void sub_1000050C4(id a1)
{
  id v1 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, exiting now.\n", v2, 2u);
  }

  exit(0);
}

void sub_10000511C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_remote_connection)
  {
    uint64_t v8 = v2;
    os_log_t v9 = -[MNPRemoteServiceConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___MNPRemoteServiceConnection),  "initWithConnection:",  v8);

    -[MNPRemoteServiceConnection listen](v9, "listen");
    goto LABEL_11;
  }

  xpc_type_t type = xpc_get_type(v2);
  id v4 = xpc_copy_description(v2);
  int v5 = (os_log_s *)qword_10000C958;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (!v6) {
      goto LABEL_9;
    }
    int v10 = 136446210;
    uint64_t v11 = v4;
    uint64_t v7 = "Error in remote service listener: %{public}s";
  }

  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    int v10 = 136446210;
    uint64_t v11 = v4;
    uint64_t v7 = "Unexpected event in remote service listener: %{public}s";
  }

  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
LABEL_9:
  if (v4) {
    free(v4);
  }
LABEL_11:
}

void sub_100005278(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  id v3 = -[MNPLockdownConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___MNPLockdownConnection),  "initWithConnection:",  a2);
  -[MNPLockdownConnection listen](v3, "listen");
}

void sub_1000052BC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"Name"]);
  if (!v2)
  {
    uint64_t v11 = qword_10000C958;
    if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v57 = v12;
    uint32_t v13 = "%@ - No name in observe notification command";
    uint64_t v14 = (os_log_s *)v11;
    uint32_t v15 = 12;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_41;
  }

  if (qword_10000C968 && ([(id)qword_10000C968 containsObject:v2] & 1) == 0)
  {
    uint64_t v16 = qword_10000C958;
    if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v57 = v17;
    __int16 v58 = 2112;
    v59 = v2;
    uint32_t v13 = "%@ - Notification '%@' is not on the allowed list";
    uint64_t v14 = (os_log_s *)v16;
    uint32_t v15 = 22;
    goto LABEL_16;
  }

  id v3 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v57 = v4;
    __int16 v58 = 2112;
    v59 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%@ - Got OBSERVE_NOTIFICATION command for notification: %@",  buf,  0x16u);
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue([(id)qword_10000C970 objectForKeyedSubscript:v2]);
  if (!v5)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10000C978 objectForKeyedSubscript:v2]);
    if (v18)
    {
      BOOL v6 = v18;
      [v18 addObject:*(void *)(a1 + 40)];
    }

    else
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", *(void *)(a1 + 40)));
      [(id)qword_10000C978 setObject:v6 forKeyedSubscript:v2];
      id v33 = v2;
      uint64_t v34 = (const char *)[v33 UTF8String];
      int v35 = (dispatch_queue_s *)qword_10000C960;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100005ACC;
      handler[3] = &unk_1000084E0;
      id v36 = v33;
      id v45 = v36;
      uint32_t v37 = notify_register_dispatch(v34, &out_token, v35, handler);
      if (v37)
      {
        uint32_t v38 = v37;
        v39 = (os_log_s *)qword_10000C958;
        if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v57 = v40;
          __int16 v58 = 1024;
          LODWORD(v59) = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%@ - Failed to register for notification (%u)",  buf,  0x12u);
        }

        goto LABEL_40;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", out_token));
      [(id)qword_10000C988 setObject:v43 forKeyedSubscript:v36];
    }

    uint64_t v19 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = v20;
      __int16 v58 = 2112;
      v59 = v2;
      uint64_t v21 = "%@ - Watching for bsd notification %@";
      dispatch_queue_t v22 = (os_log_s *)v19;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, 0x16u);
    }

LABEL_40:
    goto LABEL_41;
  }

  BOOL v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10000C980 objectForKeyedSubscript:v5]);
  if (!v7)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10000C970 allKeysForObject:v6]);
    id v25 = [v24 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = 0LL;
      uint64_t v28 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          if ([v30 isEqualToString:v2])
          {
            id v31 = v30;

            uint64_t v27 = v31;
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }

      while (v26);

      if (v27)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObject:]( &OBJC_CLASS___NSMutableSet,  "setWithObject:",  *(void *)(a1 + 40)));
        [(id)qword_10000C980 setObject:v8 forKeyedSubscript:v6];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100005880;
        block[3] = &unk_1000084B8;
        id v48 = *(id *)(a1 + 40);
        id v49 = v6;
        id v50 = v27;
        id v32 = v27;
        dispatch_sync(&_dispatch_main_q, block);

        goto LABEL_9;
      }
    }

    else
    {
    }

    uint64_t v41 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = v42;
      __int16 v58 = 2112;
      v59 = v2;
      uint64_t v21 = "%@ - Couldn't find key for %@, not registering notification";
      dispatch_queue_t v22 = (os_log_s *)v41;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_39;
    }

    goto LABEL_40;
  }

  uint64_t v8 = v7;
  [v7 addObject:*(void *)(a1 + 40)];
LABEL_9:
  os_log_t v9 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v57 = v10;
    __int16 v58 = 2112;
    v59 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ - Watching for NSNotification %@", buf, 0x16u);
  }

LABEL_41:
}

void sub_100005880(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  uint64_t v4 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ - Registering for %@", (uint8_t *)&v7, 0x16u);
  }

  CFNotificationCenterAddObserver( DistributedCenter,  *(const void **)(a1 + 48),  (CFNotificationCallback)sub_100005968,  *(CFStringRef *)(a1 + 40),  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_autoreleasePoolPop(v2);
}

void sub_100005968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v7 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a2);
  uint64_t v8 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a3);
  __int16 v9 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = a3;
    __int16 v18 = 2112;
    uint64_t v19 = a5;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Distributed Notification: %@, user info: %@, bsdName %@",  buf,  0x20u);
  }

  uint64_t v10 = (dispatch_queue_s *)qword_10000C960;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005D24;
  v13[3] = &unk_100008330;
  uint64_t v14 = v7;
  uint32_t v15 = v8;
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  dispatch_async(v10, v13);
}

void sub_100005ACC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([(id)qword_10000C978 objectForKeyedSubscript:v1]);
  sub_100005B18(v1, v2);
}

void sub_100005B18(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C960);
  uint64_t v5 = (os_log_s *)qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
    sub_100006488((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = objc_autoreleasePoolPush();
  uint32_t v13 = (void *)qword_10000C958;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
      sub_1000063D8(v13, v4, (uint64_t)v3);
    }
    v25[0] = @"Command";
    v25[1] = @"Name";
    v26[0] = @"RelayNotification";
    v26[1] = v3;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)i), "sendMessage:", v14, (void)v20);
        }

        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v17);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "No listeners for %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v12);
}

void sub_100005D24(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([(id)qword_10000C980 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  sub_100005B18(v1, v2);
}

void sub_100005D70(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)qword_10000C978;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100006040;
  v8[3] = &unk_100008508;
  id v9 = v2;
  sub_100005E34(v9, v3, v8);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)qword_10000C980;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006168;
  v6[3] = &unk_100008508;
  id v7 = v4;
  sub_100005E34(v7, v5, v6);
}

void sub_100005E34(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v19;
    *(void *)&__int128 v9 = 138412546LL;
    __int128 v17 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v14, v17));
        if ([v15 containsObject:v5])
        {
          id v16 = (os_log_s *)qword_10000C958;
          if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            id v23 = v5;
            __int16 v24 = 2112;
            uint64_t v25 = v14;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%@ - removing notification %@",  buf,  0x16u);
          }

          [v15 removeObject:v5];
          if (![v15 count])
          {
            v7[2](v7, v14);
            if (v11) {
              [v11 addObject:v14];
            }
            else {
              uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v14));
            }
          }
        }
      }

      id v10 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v10);
    if (v11)
    {
      [v6 removeObjectsForKeys:v11];
    }
  }
}

void sub_100006040(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
    sub_1000064EC();
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10000C988 objectForKeyedSubscript:v3]);
  uint32_t v5 = notify_cancel((int)[v4 intValue]);
  if (v5)
  {
    uint32_t v6 = v5;
    id v7 = (os_log_s *)qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 1024;
      uint32_t v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ - Failed to cancel notification with status: %u",  (uint8_t *)&v9,  0x12u);
    }
  }

  [(id)qword_10000C988 removeObjectForKey:v3];
}

void sub_100006168(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG)) {
    sub_100006550();
  }
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, 0LL, v2, 0LL);
}

void sub_1000061D8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1000061EC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100006204( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000622C(void *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  sub_1000061D8( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "  Sent the notification %@ to the host via connection: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_1000061FC();
}

void sub_1000062A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000630C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006340( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006374( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000063D8(void *a1, void *a2, uint64_t a3)
{
  uint32_t v5 = a1;
  int v6 = 134218242;
  id v7 = [a2 count];
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%ld watchers for %@", (uint8_t *)&v6, 0x16u);
}

void sub_100006488( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000064EC()
{
}

void sub_100006550()
{
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}