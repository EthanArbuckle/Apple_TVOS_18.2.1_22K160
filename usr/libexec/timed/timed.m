void sub_10000428C()
{
  NSDictionary *v0;
  id v1;
  void v2[4];
  void v3[4];
  v2[0] = kCFUserNotificationAlertHeaderKey;
  v2[1] = kCFUserNotificationAlertMessageKey;
  v3[0] = @"timed problem detected";
  v3[1] = @"You have encountered a rare issue that is currently being investigated";
  v2[2] = kCFUserNotificationDefaultButtonTitleKey;
  v2[3] = kCFUserNotificationAlternateButtonTitleKey;
  v3[2] = @"File a radar";
  v3[3] = @"Dismiss";
  v0 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v3,  v2,  4LL);
  v1 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v1 setObject:@"timed is islanded" forKeyedSubscript:@"Title"];
  [v1 setObject:@"CoreTime | All" forKeyedSubscript:@"ComponentName"];
  [v1 setObject:@"1.0" forKeyedSubscript:@"ComponentVersion"];
  [v1 setObject:@"1332142" forKeyedSubscript:@"ComponentID"];
  [v1 setObject:@"Other Bug" forKeyedSubscript:@"Classification"];
  [v1 setObject:@"I Didn't Try" forKeyedSubscript:@"Reproducibility"];
  [v1 setObject:@"Island" forKeyedSubscript:@"Description"];
  sub_100004414((CFDictionaryRef)v0, v1);
}

void sub_100004414(CFDictionaryRef dictionary, void *a2)
{
  v3 = CFUserNotificationCreate(0LL, 0.0, 3uLL, 0LL, dictionary);
  CFOptionFlags responseFlags = 0LL;
  CFUserNotificationReceiveResponse(v3, 0.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    if (!v3) {
      return;
    }
  }

  else
  {
    sub_10000448C(a2);
    if (!v3) {
      return;
    }
  }

  CFRelease(v3);
}

void sub_10000448C(void *a1)
{
  v2 = -[NSURLComponents initWithString:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithString:",  @"tap-to-radar://new");
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend( v3,  "addObject:",  +[NSURLQueryItem queryItemWithName:value:]( NSURLQueryItem,  "queryItemWithName:value:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)v7),  objc_msgSend(a1, "objectForKeyedSubscript:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7))));
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[NSURLComponents setQueryItems:](v2, "setQueryItems:", v3);
  objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "openURL:configuration:completionHandler:",  -[NSURLComponents URL](v2, "URL"),  0,  0);
}
}

void sub_1000056BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000056D4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000056F0()
{
  v0 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Client exited", v1, 2u);
  }

void sub_100005754(_xpc_connection_s *a1)
{
  v3[0] = 0LL;
  v3[1] = v3;
  v3[2] = 0x2020000000LL;
  char v4 = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100005810;
  v2[3] = &unk_100028818;
  v2[4] = a1;
  v2[5] = v3;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_resume(a1);
  _Block_object_dispose(v3, 8);
}

void sub_1000057F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005810(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      v14 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        *(_DWORD *)v19 = 67109120;
        *(_DWORD *)&v19[4] = pid;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Client disconnected: %d", v19, 8u);
      }

      sub_1000056F0();
    }

    else if (object == &_xpc_error_termination_imminent)
    {
      v16 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Termination imminent!", v19, 2u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    }

    else
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A508();
      }
    }
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    char v4 = (xpc_connection_t *)(a1 + 32);
    xpc_connection_get_audit_token(v5, v19);
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    v7 = (void *)_CFXPCCreateCFObjectFromXPCObject(object);
    __int128 v8 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      pid_t v9 = xpc_connection_get_pid(*v4);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v9;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Client %d issued command: %@", buf, 0x12u);
    }

    int v10 = [(id)qword_1000337C0 shouldAllowTimeTool];
    *(_OWORD *)buf = *(_OWORD *)v19;
    *(_OWORD *)&buf[16] = v20;
    int v11 = sub_100010FB0(v7, buf, v10);
    v12 = (os_log_s *)qword_1000338F8;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
        sub_10001A568(v12);
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100005AF4;
      v17[3] = &unk_1000287F0;
      xpc_connection_t v13 = *v4;
      v17[4] = object;
      v17[5] = v13;
      [(id)qword_1000337B8 executeCommand:v7 withHandler:v17];
    }

    else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
    {
      sub_10001A5E8(v4, v12);
    }

    -[NSAutoreleasePool drain](v6, "drain");
  }

void sub_100005AF4(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
    sub_10001A6D4();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  uint64_t v5 = (void *)_CFXPCCreateXPCObjectFromCFObject(a2);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_100005BFC;
  applier[3] = &unk_1000287C8;
  applier[4] = reply;
  xpc_dictionary_apply(v5, applier);
  xpc_release(v5);
  uint64_t v6 = xpc_copy_description(reply);
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG))
  {
    sub_10001A670();
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (v6) {
LABEL_5:
  }
    free(v6);
LABEL_6:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_release(reply);
}

uint64_t sub_100005BFC(uint64_t a1, const char *a2, void *a3)
{
  return 1LL;
}

void start()
{
  v19 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  sub_100011FF8();
  qword_1000337C0 = -[TMPreferences initWithDefaults:]( objc_alloc(&OBJC_CLASS___TMPreferences),  "initWithDefaults:",  +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v0 = objc_alloc(&OBJC_CLASS___TMMonotonicClock);
  [(id)qword_1000337C0 RTCMachSyncInterval];
  v18 = -[TMMonotonicClock initWithSyncInterval:](v0, "initWithSyncInterval:");
  qword_1000337C8 = (uint64_t)dispatch_workloop_create("com.apple.timed.workloop");
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", (dispatch_queue_t)qword_1000337C8, 1uLL);
  if (([(id)qword_1000337C0 shouldCorrectOnWake] & 1) != 0
    || [(id)qword_1000337C0 shouldFetchOnWake])
  {
    sub_100010D00((uint64_t (*)(void))sub_100006010, (dispatch_queue_s *)qword_1000337C8);
  }

  xpc_set_event_stream_handler("com.apple.systemconfiguration", (dispatch_queue_t)qword_1000337C8, &stru_100028858);
  xpc_connection_enable_termination_imminent_event(mach_service);
  v2 = -[NSBundle pathForResource:ofType:]( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/CoreTime.framework"),  "pathForResource:ofType:",  @"TimeZoneRules",  @"plist");
  __int128 v20 = +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v2);
  if (!v20)
  {
    id v3 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "rules plist not found: %@!\n", buf, 0xCu);
    }

    __int128 v20 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  }

  xpc_connection_t v17 = mach_service;
  id v4 = [@"/System/Library/PrivateFrameworks/CoreTime.framework" stringByAppendingPathComponent:@"TimeSources"];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v5 = -[NSFileManager enumeratorAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtPath:",  v4);
  id v6 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v10, "pathExtension"), "isEqualToString:", @"bundle"))
        {
          int v11 = (os_log_s *)qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23[0] = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Loading source rules: %@", buf, 0xCu);
          }

          v12 = -[NSBundle pathForResource:ofType:]( +[NSBundle bundleWithPath:]( NSBundle,  "bundleWithPath:",  [v4 stringByAppendingPathComponent:v10]),  "pathForResource:ofType:",  @"TimeZoneRules",  @"plist");
          if (v12)
          {
            xpc_connection_t v13 = +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v12);
            if (v13)
            {
              v14 = v13;
              v15 = (os_log_s *)qword_1000338F8;
              if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
              {
                unsigned int v16 = -[NSMutableDictionary count](v14, "count");
                *(_DWORD *)buf = 67109378;
                LODWORD(v23[0]) = v16;
                WORD2(v23[0]) = 2112;
                *(void *)((char *)v23 + 6) = @"TimeZoneRules";
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Loaded %d rules from '%@'",  buf,  0x12u);
              }

              -[NSMutableDictionary addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v14);
            }
          }
        }
      }

      id v7 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
    }

    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006028;
  block[3] = &unk_1000288A8;
  block[4] = v20;
  block[5] = v18;
  block[6] = v4;
  block[7] = v17;
  dispatch_async_and_wait((dispatch_queue_t)qword_1000337C8, block);
  -[NSAutoreleasePool drain](v19, "drain");
  while (1)
    -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
}

void sub_100006010()
{
}

void sub_100006028(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___TMDaemonCore);
  qword_1000337B8 = -[TMDaemonCore initWithTimeZoneRules:monotonicClock:preferences:workloop:]( v2,  "initWithTimeZoneRules:monotonicClock:preferences:workloop:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  qword_1000337C0,  qword_1000337C8);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v3 = -[NSFileManager enumeratorAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtPath:",  *(void *)(a1 + 48));
  id v4 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v30,  16LL);
  if (v4)
  {
    uint64_t v6 = *(void *)v24;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v20 = v5;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v8, "pathExtension", v20), "isEqualToString:", @"bundle"))
        {
          pid_t v9 = (os_log_s *)qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = v20;
            *(void *)((char *)&buf + 4) = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Loading time source: %@",  (uint8_t *)&buf,  0xCu);
          }

          int v10 = -[NSBundle principalClass]( +[NSBundle bundleWithPath:]( NSBundle,  "bundleWithPath:",  [*(id *)(a1 + 48) stringByAppendingPathComponent:v8]),  "principalClass");
          unsigned int v11 = -[objc_class instancesRespondToSelector:]( v10,  "instancesRespondToSelector:",  "initWithClock:daemonCore:");
          v12 = (os_log_s *)qword_1000338F8;
          if (v11)
          {
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
            {
              xpc_connection_t v13 = NSStringFromClass(v10);
              LODWORD(buf) = v20;
              *(void *)((char *)&buf + 4) = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Loading plugin via [%@ -initWithClock:daemonCore:]",  (uint8_t *)&buf,  0xCu);
            }

            id v14 = objc_alloc(v10);
            id v15 = [v14 initWithClock:*(void *)(a1 + 40) daemonCore:qword_1000337B8];
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v16 = NSStringFromClass(v10);
              LODWORD(buf) = v20;
              *(void *)((char *)&buf + 4) = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Loading plugin via [%@ -init]",  (uint8_t *)&buf,  0xCu);
            }

            id v15 = objc_alloc_init(v10);
          }

          xpc_connection_t v17 = v15;
          if (v15)
          {
            [(id)qword_1000337B8 addPlugin:v15];
          }
        }
      }

      id v4 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v30,  16LL);
    }

    while (v4);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  v18 = *(_xpc_connection_s **)(a1 + 56);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000063B4;
  handler[3] = &unk_100028880;
  handler[4] = &buf;
  xpc_connection_set_event_handler(v18, handler);
  v19 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Starting XPC listener", v21, 2u);
  }

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 56));
  [(id)qword_1000337B8 testAndApplySystemTime];
  [(id)qword_1000337B8 checkActiveTimeSourceRequired];
  _Block_object_dispose(&buf, 8);
}

void sub_100006394( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000063B4(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      id v7 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Listener connection went invalid. Exiting.",  (uint8_t *)v8,  2u);
      }

      exit(0);
    }

    if (object == &_xpc_error_termination_imminent)
    {
      uint64_t v6 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Termination is imminent!",  (uint8_t *)v8,  2u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      [(id)qword_1000337B8 handleShutdown];
    }

    else
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A508();
      }
    }
  }

  else
  {
    __int128 v5 = (os_log_s *)qword_1000338F8;
    if (type == (xpc_type_t)&_xpc_type_connection)
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        v8[0] = 67109120;
        v8[1] = xpc_connection_get_pid((xpc_connection_t)object);
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "New connection from PID: %d",  (uint8_t *)v8,  8u);
      }

      sub_100005754((_xpc_connection_s *)object);
    }

    else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001A738(v5);
    }
  }

void sub_1000065C0(id a1)
{
  v1 = @"TMCommand";
  v2 = @"TMSystemWillWake";
  objc_msgSend( (id)qword_1000337B8,  "executeCommand:withHandler:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v2,  &v1,  1),  0);
}

void sub_100006650(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

__CFString *sub_10000665C(unint64_t a1)
{
  if (a1 >= 0x1C)
  {
    id v3 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001A778(a1, v3, v4, v5, v6, v7, v8, v9);
    }
    v2 = off_100029188;
  }

  else
  {
    v2 = off_100028AA8[a1];
  }

  return *v2;
}

uint64_t sub_1000066C8(uint64_t a1)
{
  if (qword_1000337D8 != -1) {
    dispatch_once(&qword_1000337D8, &stru_1000289E8);
  }
  id v2 = [(id)qword_1000337D0 objectForKeyedSubscript:a1];
  if (v2) {
    return (uint64_t)[v2 unsignedIntegerValue];
  }
  else {
    return 27LL;
  }
}

void sub_100006730(id a1)
{
  v1[0] = @"NITZ";
  v1[1] = @"CDMA";
  v2[0] = &off_10002C2B0;
  v2[1] = &off_10002C2C8;
  v1[2] = @"GPS";
  v1[3] = @"LocationServer";
  v2[2] = &off_10002C2E0;
  v2[3] = &off_10002C2F8;
  v1[4] = @"HarvestServer";
  v1[5] = @"NTP";
  v2[4] = &off_10002C310;
  v2[5] = &off_10002C328;
  v1[6] = @"NTPLowConfidence";
  v1[7] = @"NTPPacket";
  void v2[6] = &off_10002C340;
  v2[7] = &off_10002C358;
  v1[8] = @"MobileLockdown";
  v1[9] = @"iTunesStoreServer";
  v2[8] = &off_10002C370;
  v2[9] = &off_10002C388;
  v1[10] = @"Location";
  v1[11] = @"Computed";
  v2[10] = &off_10002C3A0;
  v2[11] = &off_10002C3B8;
  v1[12] = @"LocationAndNetwork";
  v1[13] = @"TimeSourceGnssValidPos";
  v2[12] = &off_10002C3D0;
  v2[13] = &off_10002C3E8;
  v1[14] = @"TimeSourceGnss";
  v1[15] = @"TimeSourceBBTimeTransfer";
  v2[14] = &off_10002C400;
  v2[15] = &off_10002C418;
  uint8_t v1[16] = @"TimeSourceBBTimeTagging";
  v1[17] = @"TimeSourceUnknown";
  v2[16] = &off_10002C430;
  v2[17] = &off_10002C448;
  v1[18] = @"TMLSSourceComputed";
  v1[19] = @"TMLSSourceComputedReliable";
  v2[18] = &off_10002C460;
  v2[19] = &off_10002C478;
  v1[20] = @"TMLSSourceUser";
  v1[21] = @"TMLSSourceDevice";
  v2[20] = &off_10002C490;
  v2[21] = &off_10002C4A8;
  v1[22] = @"FilesystemTimestamp";
  v1[23] = @"AirPlaySendingDeviceTime";
  v2[22] = &off_10002C4C0;
  v2[23] = &off_10002C4D8;
  v1[24] = @"ProxBuddy";
  v1[25] = @"APNS";
  v2[24] = &off_10002C4F0;
  v2[25] = &off_10002C508;
  v1[26] = @"Accessory";
  v1[27] = @"Unknown";
  v2[26] = &off_10002C520;
  v2[27] = &off_10002C538;
  qword_1000337D0 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v2,  v1,  28LL);
}

uint64_t sub_100006A40(uint64_t a1)
{
  if (qword_1000337E8 != -1) {
    dispatch_once(&qword_1000337E8, &stru_100028A08);
  }
  id v2 = [(id)qword_1000337E0 objectForKeyedSubscript:a1];
  if (v2) {
    return (uint64_t)[v2 unsignedIntegerValue];
  }
  else {
    return 23LL;
  }
}

void sub_100006AA4(id a1)
{
  v1[0] = @"TMSetSourceTime";
  v1[1] = @"TMSetSourceAvailable";
  v2[0] = &off_10002C550;
  v2[1] = &off_10002C568;
  v1[2] = @"TMSetSourceUnavailable";
  v1[3] = @"TMSetSourceTimeZone";
  v2[2] = &off_10002C580;
  v2[3] = &off_10002C598;
  v1[4] = @"TMSetAutomaticTimeEnabled";
  v1[5] = @"TMIsAutomaticTimeEnabled";
  v2[4] = &off_10002C5B0;
  v2[5] = &off_10002C5C8;
  v1[6] = @"TMSetAutomaticTimeZoneEnabled";
  v1[7] = @"TMIsAutomaticTimeZoneEnabled";
  void v2[6] = &off_10002C5E0;
  v2[7] = &off_10002C5F8;
  v1[8] = @"TMIsTimeZoneConfirmed";
  v1[9] = @"TMConfirmTimeZone";
  v2[8] = &off_10002C610;
  v2[9] = &off_10002C628;
  v1[10] = @"TMGetReferenceTime";
  v1[11] = @"TMSetReferenceUnreliable";
  v2[10] = &off_10002C640;
  v2[11] = &off_10002C658;
  v1[12] = @"TMIsLocationTimeZoneActive";
  v1[13] = @"TMIsBBTimeActive";
  v2[12] = &off_10002C670;
  v2[13] = &off_10002C688;
  v1[14] = @"TMProvideBBTime";
  v1[15] = @"TMReceiveNtpPacket";
  v2[14] = &off_10002C6A0;
  v2[15] = &off_10002C6B8;
  uint8_t v1[16] = @"TMSetupTime";
  v1[17] = @"TMSetupTimeZone";
  v2[16] = &off_10002C6D0;
  v2[17] = &off_10002C6E8;
  v1[18] = @"TMProvideCellularTimeZone";
  v1[19] = @"TMResetTimeZone";
  v2[18] = &off_10002C700;
  v2[19] = &off_10002C718;
  v1[20] = @"TMSystemWillWake";
  v1[21] = @"TMFetchNTP";
  v2[20] = &off_10002C730;
  v2[21] = &off_10002C748;
  v1[22] = @"TMResetToFirstLaunch";
  v1[23] = @"TMUnknown";
  v2[22] = &off_10002C760;
  v2[23] = &off_10002C778;
  qword_1000337E0 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v2,  v1,  24LL);
}

uint64_t sub_100006CF4()
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  return byte_1000337F8;
}

void sub_100006D34(id a1)
{
  size_t v1 = 8LL;
  byte_1000337F8 = sysctlnametomib("kern.monotonicclock_usecs", v2, &v1) == 0;
}

double sub_100006DA4()
{
  if (qword_100033808 != -1) {
    dispatch_once(&qword_100033808, &stru_100028A48);
  }
  return *(double *)&qword_100033800;
}

void sub_100006DE4(id a1)
{
  *(void *)uint64_t v9 = 8LL;
  size_t v10 = 8LL;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10001A850(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

  else if (sysctl(v12, v9[0], &v11, &v10, 0LL, 0LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A7DC();
    }
  }

  else
  {
    *(double *)&qword_100033800 = (double)v11 / 1000000.0;
  }

double sub_100006EBC()
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  if (!byte_1000337F8)
  {
    uint64_t v9 = mach_continuous_time();
    return TMConvertTicksToSeconds(v9);
  }

  if ((byte_100033810 & 1) != 0) {
    goto LABEL_12;
  }
  if (!sysctlnametomib("kern.monotonicclock_usecs", dword_100033814, (size_t *)&dword_1000334A8))
  {
    if (qword_100033808 != -1) {
      dispatch_once(&qword_100033808, &stru_100028A48);
    }
    *(double *)&qword_100033838 = *(double *)&qword_100033800 * 0.5;
    qword_100033840 = 0x412E848000000000LL;
    byte_100033810 = 1;
LABEL_12:
    size_t v11 = 8LL;
    if (!sysctl(dword_100033814, dword_1000334A8, &v12, &v11, 0LL, 0LL)) {
      return (double)v12 / *(double *)&qword_100033840 + *(double *)&qword_100033838;
    }
    double v8 = -1.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A884();
    }
    return v8;
  }

  BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  double v8 = -1.0;
  if (v0) {
    sub_10001A8F8(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return v8;
}

double TMConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&qword_100033888;
  if (*(double *)&qword_100033888 == 0.0)
  {
    sub_1000078F8(&v8, &v7);
    uint32_t v3 = v8;
    unsigned int v4 = 1000000000;
    do
    {
      uint32_t v5 = v4;
      unsigned int v4 = v3 % v4;
      uint32_t v3 = v5;
    }

    while (v4);
    double v2 = (double)(v8 / v5) / (double)(v7 * (unint64_t)(0x3B9ACA00 / v5));
    *(double *)&qword_100033888 = v2;
  }

  return v2 * (double)a1;
}

double sub_1000070E4(uint64_t *a1, double *a2)
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  if (byte_1000337F8)
  {
    if (qword_100033858 != -1) {
      dispatch_once(&qword_100033858, &stru_100028A68);
    }
    size_t v4 = 16LL;
    if (!a1) {
      size_t v4 = 8LL;
    }
    size_t v13 = v4;
    int v5 = 3;
    while (sysctl((int *)&unk_100033848, qword_100033850, &v17, &v13, 0LL, 0LL))
    {
      uint64_t v6 = __error();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v7 = *v6;
        uint32_t v8 = strerror(v7);
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v15 = 1024;
        int v16 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "CoreTime: Could not get kern.monotonicclock_usecs: %s(%d)\n",  buf,  0x12u);
      }

      if (!--v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10001A92C();
          if (a1) {
LABEL_26:
          }
            *a1 = 0LL;
        }

        else if (a1)
        {
          goto LABEL_26;
        }

        double v9 = -1.0;
        if (a2) {
          *a2 = -1.0;
        }
        return v9;
      }
    }

    double v10 = (double)v17;
    if (a2) {
      *a2 = 0.0005;
    }
    double v9 = v10 / 1000000.0;
    if (v13 != 16)
    {
      uint64_t v18 = mach_absolute_time();
      double v9 = v9 + *(double *)&qword_100033860;
      if (a2) {
        *a2 = *(double *)&qword_100033860 + *a2;
      }
    }

    if (a1) {
      *a1 = v18;
    }
  }

  else
  {
    mach_get_times(buf, &v17, 0LL);
    if (a1) {
      *a1 = *(void *)buf;
    }
    return TMConvertTicksToSeconds(v17);
  }

  return v9;
}

void sub_100007360(id a1)
{
  qword_100033850 = 2LL;
  if (sysctlnametomib("kern.monotonicclock_usecs", (int *)&unk_100033848, (size_t *)&qword_100033850))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10001A9A8(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    qword_100033850 = 0LL;
  }

  if (qword_100033808 != -1) {
    dispatch_once(&qword_100033808, &stru_100028A48);
  }
  *(double *)&qword_100033860 = *(double *)&qword_100033800 * 0.5;
}

unint64_t sub_1000073FC(uint64_t a1)
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  if (!byte_1000337F8)
  {
    mach_get_times(0LL, &v15, v14);
    uint64_t v10 = v14[1] + 1000000000LL * v14[0];
    return v10 - sub_100007594(v15);
  }

  if (a1 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001AAD8(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  v14[0] = a1 / 1000;
  if (qword_100033878 != -1) {
    dispatch_once(&qword_100033878, &stru_100028A88);
  }
  unint64_t v15 = 0LL;
  uint64_t v13 = 8LL;
  else {
    double v9 = 0LL;
  }
  if (sysctl( (int *)&unk_100033868,  qword_100033870,  &v15,  (size_t *)&v13,  v9,  8LL * ((unint64_t)(a1 + 999) > 0x7CE)))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001AA64();
    }
  }

  else
  {
    uint64_t v12 = v13;
    if (v13 == 8) {
      return 1000 * v15;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A9DC(v12);
    }
  }

  return 0LL;
}

unint64_t sub_100007594(unint64_t a1)
{
  unsigned int v2 = dword_100033880;
  if (!dword_100033880)
  {
    sub_1000078F8((uint32_t *)&dword_100033880, (uint32_t *)&dword_100033884);
    unsigned int v2 = dword_100033880;
    if (!dword_100033880) {
      sub_10001AB44();
    }
    if (!dword_100033884) {
      sub_10001AB6C();
    }
  }

  if (is_mul_ok(v2, a1))
  {
    unint64_t v3 = v2 * a1 / dword_100033884;
    if ((v3 & 0x8000000000000000LL) != 0) {
      panic("TMConvertTicksToNanoTime not possible due to signed overflow");
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Overflow during TMConvertTicksToNanoTime conversion, falling back to reciprocal ratio",  v5,  2u);
      unsigned int v2 = dword_100033880;
    }

    return a1 / (dword_100033884 / v2);
  }

  return v3;
}

void sub_10000768C(id a1)
{
  qword_100033870 = 2LL;
  if (sysctlnametomib("kern.monotoniclock_offset_usecs", (int *)&unk_100033868, (size_t *)&qword_100033870))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10001AB94(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    qword_100033870 = 0LL;
  }

BOOL sub_1000076E8(double a1)
{
  if (a1 >= -1.0 && a1 <= 1.0) {
    return 0LL;
  }
  BOOL v2 = -1.0 - kCFAbsoluteTimeIntervalSince1970 > a1 || 1.0 - kCFAbsoluteTimeIntervalSince1970 < a1;
  if (!v2 || a1 >= -6.31456128e10 && a1 <= -6.31456128e10) {
    return 0LL;
  }
  if (1.0 - kCFAbsoluteTimeIntervalSince1904 < a1) {
    return 1LL;
  }
  return -1.0 - kCFAbsoluteTimeIntervalSince1904 > a1;
}

BOOL sub_10000777C(int a1)
{
  return (a1 + 960) < 0x781;
}

BOOL sub_10000778C(unsigned int a1)
{
  return a1 < 0x3E8;
}

CFTimeInterval sub_100007798(uint64_t *a1, double a2)
{
  CFTimeInterval result = kCFAbsoluteTimeIntervalSince1970 + (double)*a1;
  *a1 = (uint64_t)result;
  return result;
}

uint64_t sub_1000077F4(uint64_t a1, double a2)
{
  double v3 = modf(a2, &v7);
  uint64_t result = 0LL;
  if (fabs(v7) != INFINITY)
  {
    if (v7 < 9.22337204e18)
    {
      BOOL v6 = v7 == -9.22337204e18;
      BOOL v5 = v7 >= -9.22337204e18;
    }

    else
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
    }

    if (!v6 && v5)
    {
      *(void *)a1 = (uint64_t)v7;
      *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = (int)(v3 * 1000000.0);
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

double sub_100007884(uint64_t a1, int a2)
{
  return (double)a2 / 1000000.0 + (double)(a1 - (uint64_t)kCFAbsoluteTimeIntervalSince1970);
}

double sub_1000078B4(double a1, double a2)
{
  if (a2 < 0.0) {
    a2 = -a2;
  }
  return a1 + a2 * 0.00002;
}

uint64_t sub_1000078D0(uint64_t a1, uint64_t a2)
{
  if (!(_DWORD)a2) {
    return a1;
  }
  do
  {
    uint64_t v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }

  while ((_DWORD)a2);
  return v2;
}

uint64_t sub_1000078F8(uint32_t *a1, uint32_t *a2)
{
  uint64_t result = mach_timebase_info(&info);
  if ((_DWORD)result) {
    sub_10001ABC8();
  }
  uint32_t denom = info.denom;
  if (info.denom)
  {
    uint32_t numer = info.numer;
    uint32_t v7 = info.denom;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = numer % v7;
      uint32_t numer = v8;
    }

    while (v7);
  }

  else
  {
    uint32_t v8 = info.numer;
  }

  *a1 = info.numer / v8;
  *a2 = denom / v8;
  return result;
}

double sub_10000796C(unint64_t a1, unint64_t a2)
{
  if (a2 >= a1) {
    return TMConvertTicksToSeconds(a2 - a1);
  }
  else {
    return -TMConvertTicksToSeconds(a1 - a2);
  }
}

double sub_100007998(unint64_t a1, unint64_t a2)
{
  if (a2 <= a1) {
    return TMConvertTicksToSeconds(a1 - a2);
  }
  else {
    return TMConvertTicksToSeconds(a2 - a1);
  }
}

void sub_1000079A8( __CFNotificationCenter *a1, const __CFString *a2, const void *a3, CFNotificationSuspensionBehavior a4, void *aBlock)
{
  double v9 = _Block_copy(aBlock);
  uint64_t v10 = _Block_copy(v9);
  CFNotificationCenterAddObserver(a1, v10, (CFNotificationCallback)sub_100007A00, a2, a3, a4);
}

void sub_100007A00( __CFNotificationCenter *a1, uint64_t (**a2)(void, void), const __CFString *a3, const void *a4)
{
  if ((((uint64_t (**)(void, __CFNotificationCenter *))a2)[2](a2, a1) & 1) == 0)
  {
    CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
    _Block_release(a2);
  }

void sub_100007A6C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100007A94( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

char *sub_100007AB8(int *a1)
{
  return strerror(*a1);
}

int *sub_100007AC0()
{
  return __error();
}

int *sub_100007AC8()
{
  return __error();
}

id *sub_100007AD0(id *result)
{
  if (result)
  {
    BOOL v1 = result;
    [result[16] emptyPath:@"/var/db/timed/com.apple.timed.plist"];
    [v1[2] reset];
    [v1[3] reset];
    return (id *)[v1[4] setLastReschedule:0.0];
  }

  return result;
}

void sub_100007B30(id *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v6 = [a2 code];
    if (v6 == (id)3)
    {
      uint32_t v8 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)size_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "soft reset due to rtc rollback", v11, 2u);
      }

      sub_100007AD0(a1);
      [a1 rtcDidReset];
      objc_msgSend(a1, "setSourceTime:", objc_msgSend(a3, "dictionary"));
    }

    else if (v6 == (id)5)
    {
      double v9 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "reset accessory uncertainty", v12, 2u);
      }

      objc_msgSend(a1, "setAccessoryUnc_s:", 1.79769313e308);
      [a1[4] setLastReschedule:0.0];
    }

    else if (v6 == (id)4)
    {
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"Accessory"))
      {
        uint32_t v7 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "reset accessory uncertainty", buf, 2u);
        }

        objc_msgSend(a1, "setAccessoryUnc_s:", 1.79769313e308);
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001ABF0(a2, v10);
      }
    }
  }

void sub_100007CF8(id *a1, void *a2, void *a3)
{
  if (a1)
  {
    if ([a2 code] == (id)6)
    {
      [a1[17] synthesizer:@"STF" rejectedTimeInput:a3];
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"Accessory"))
      {
        id v6 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "accessory input rejected by secure filter",  buf,  2u);
          id v6 = (os_log_s *)qword_1000338F8;
        }

        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint32_t v8 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "resetting secure filter, time filter, purging cache",  v8,  2u);
        }

        sub_100007AD0(a1);
        objc_msgSend(a1, "setSourceTime:", objc_msgSend(a3, "dictionary"));
      }
    }

    else
    {
      uint32_t v7 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001AC64(a2, v7);
      }
    }
  }

NSDictionary *sub_100007ECC(uint64_t a1)
{
  uint64_t v2 = @"rtcResetCount";
  double v3 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(*(void *)(a1 + 32) + 148LL));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

uint64_t sub_10000847C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(result + 104);
    if (!result)
    {
      size_t v2 = 37LL;
      if (!sysctlbyname("kern.bootsessionuuid", in, &v2, 0LL, 0LL))
      {
        if (v2 != 37) {
          sub_10001AD10();
        }
        if (!uuid_parse(in, uu))
        {
          *(void *)(v1 + 104) = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  uu);
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
            sub_10001ACD8();
          }
        }
      }

      return *(void *)(v1 + 104);
    }
  }

  return result;
}

void sub_100008564(uint64_t a1)
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMTimeZoneConfirmedNotification", 0LL, 0LL, 0);
  }

void *sub_100008598(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *((unsigned __int8 *)result + 40);
    double v3 = (void *)result[7];
    if (v2) {
      [v3 NTPSchedulingInterval];
    }
    else {
      [v3 NTPUnsetSchedulingInterval];
    }
    return objc_msgSend((id)v1[4], "setSchedulingInterval:");
  }

  return result;
}

void *sub_1000086C4(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    BOOL v5 = (void *)result[6];
    uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      id v6 = result;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint32_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          double v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
          if ((objc_opt_respondsToSelector(v9, a2) & 1) != 0) {
            [v9 performSelector:a2 withObject:a3];
          }
          uint32_t v8 = (void *)((char *)v8 + 1);
        }

        while (v6 != v8);
        uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v6 = result;
      }

      while (result);
    }
  }

  return result;
}

void *sub_100008810(void *a1, const char *a2)
{
  if (a1) {
    return [a1 isAutomaticTimeEnabled];
  }
  return a1;
}

BOOL sub_10000881C(BOOL result, uint64_t a2, double a3)
{
  if (result)
  {
    uint64_t v5 = result;
    sub_100007798(&v15.tv_sec, a3);
    if (!v6)
    {
      __int128 v10 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001AD38(a2, v10, v11, a3);
      }
      [*(id *)(v5 + 16) reset];
      return 0LL;
    }

    if (settimeofday(&v15, 0LL))
    {
      uint64_t v7 = __error();
      uint32_t v8 = (os_log_s *)qword_1000338F8;
      uint64_t result = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      int v9 = *v7;
      *(_DWORD *)__int128 buf = 134218754;
      __darwin_time_t tv_sec = v15.tv_sec;
      __int16 v18 = 2048;
      uint64_t tv_usec = v15.tv_usec;
      __int16 v20 = 1024;
      int v21 = v9;
      __int16 v22 = 2080;
      uint64_t v23 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "settimeofday(%lld.%.6lld) failed %{darwin.errno}d; cannot set system time from %s",
        buf,
        0x26u);
      return 0LL;
    }

    __int128 v12 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3);
      *(_DWORD *)__int128 buf = 138412546;
      __darwin_time_t tv_sec = (__darwin_time_t)v13;
      __int16 v18 = 2080;
      uint64_t tv_usec = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Setting system time to %@ from %s",  buf,  0x16u);
    }

    [*(id *)(v5 + 128) touchPath:@"/var/db/timed/com.apple.timed.plist" tv:&v15];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0LL, 0LL, 0);
    return 1LL;
  }

  return result;
}

void sub_100008A18(uint64_t a1)
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0LL, 0LL, 0);
  }

BOOL sub_100008A4C(double a1, double a2, double a3)
{
  if (a1 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a1);
  }
  if (a1 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a1);
  }
  double v6 = modf(a1, (double *)buf);
  uint64_t v7 = llround(v6 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf;
  v16.uint64_t offset = v7;
  v16.status = 129;
  if (a2 == 1.0)
  {
    uint64_t v8 = 0LL;
    unsigned int v9 = 8213;
  }

  else
  {
    uint64_t v8 = vcvtd_n_s64_f64((a2 + -1.0) * 1000000.0, 0x10uLL);
    v16.uint64_t freq = v8;
    unsigned int v9 = 8215;
  }

  v16.modes = v9;
  v16.uint64_t maxerror = (uint64_t)(a3 * 1000000.0);
  __int128 v10 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = v9;
    __int16 v18 = 2048;
    uint64_t offset = v7;
    __int16 v20 = 2048;
    uint64_t freq = v8;
    __int16 v22 = 2048;
    uint64_t maxerror = (uint64_t)(a3 * 1000000.0);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "cmd,ntp_adjtime:in,modes,%x,offset_us,%ld,freq_scaled,%ld,maxerror_us,%ld",  buf,  0x26u);
  }

  int v11 = ntp_adjtime(&v16);
  if (v11)
  {
    __int128 v12 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001ADAC(v11, v12, v13, a1);
    }
  }

  else
  {
    id v14 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109888;
      *(_DWORD *)&uint8_t buf[4] = v16.modes;
      __int16 v18 = 2048;
      uint64_t offset = v16.offset;
      __int16 v20 = 2048;
      uint64_t freq = v16.freq;
      __int16 v22 = 2048;
      uint64_t maxerror = v16.maxerror;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "cmd,ntp_adjtime:out,modes,%x,offset_us,%ld,freq_scaled,%ld,maxerror_us,%ld",  buf,  0x26u);
    }
  }

  return v11 == 0;
}

id sub_100008D48(id result)
{
  if (result)
  {
    uint64_t v1 = result;
    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"TMSystemTimeChanged",  result,  &__NSDictionary0__struct);
    return [v1 testAndApplySystemTime];
  }

  return result;
}

void sub_100008DD0(id *a1, int a2)
{
  if (a1)
  {
    int v3 = a2 - 1;
    if (a2 >= 1)
    {
      uint64_t v5 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 67109376;
        int v17 = a2;
        __int16 v18 = 1024;
        int v19 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "testAndApplySystemTime,previousCount,%d,retrySystemTimeCount,%d",  buf,  0xEu);
      }

      id v6 = [a1 timeProvider];
      objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
      id v7 = objc_msgSend(v6, "timeAtRtc:");
      if (v7)
      {
        id v8 = v7;
        if ([a1[3] isRunning]
          && [a1[7] shouldClamp]
          && v6 == a1[2]
          && ([a1[3] intersects:v8] & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001AE20();
          }
          [a1[2] reset];
        }

        else
        {
          uint64_t v9 = os_transaction_create("_testAndApplySystemTime");
          id v10 = objc_msgSend(objc_msgSend(a1, "clock"), "machTime");
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          id v12 = objc_msgSend(objc_msgSend(a1, "clock"), "machTime");
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472LL;
          void v14[2] = sub_100009028;
          v14[3] = &unk_100028BE8;
          v14[4] = v8;
          v14[5] = a1;
          *(CFAbsoluteTime *)&v14[7] = Current;
          v14[8] = sub_100007998((unint64_t)v10, (unint64_t)v12);
          v14[9] = v10;
          v14[10] = v12;
          int v15 = a2;
          v14[6] = v9;
          objc_msgSend( objc_msgSend(a1, "clock"),  "montonicTimeForMachTime:toQueue:withCompletionHandler:",  v10,  objc_msgSend(a1, "workloop"),  v14);
        }
      }

      else
      {
        uint64_t v13 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No time to use for system time", buf, 2u);
        }
      }
    }
  }

void sub_100009028(uint64_t a1, double a2, double a3)
{
  id v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "propagatedTimeAtRTC:");
  double v8 = v7;
  if (v7 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&v7);
  }
  if (v8 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&v8);
  }
  double v9 = modf(v8, (double *)buf);
  double v10 = *(double *)buf;
  if (a2 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a2);
  }
  if (a2 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a2);
  }
  double v11 = modf(a2, (double *)buf);
  double v12 = *(double *)buf;
  double v13 = modf(978307200.0, (double *)buf);
  if (a2 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001AFA4();
    }
LABEL_29:
    sub_100008DD0(*(void *)(a1 + 40), (*(_DWORD *)(a1 + 88) - 1));
    goto LABEL_30;
  }

  double v61 = a2;
  id v14 = *(void **)(a1 + 40);
  if (v14)
  {
    double v15 = v13;
    double v16 = a3;
    double v17 = *(double *)buf;
    if ([v14 isAutomaticTimeEnabled])
    {
      uint64_t v18 = (uint64_t)v10 - (uint64_t)v12 + (uint64_t)v17;
      unint64_t v19 = llround(v9 * 1000000000.0) - llround(v11 * 1000000000.0) + llround(v15 * 1000000000.0);
      double v20 = *(double *)(a1 + 64);
      double v21 = v8 - *(double *)(a1 + 56);
      if (v21 >= 0.0) {
        double v22 = v8 - *(double *)(a1 + 56);
      }
      else {
        double v22 = -v21;
      }
      double v23 = *(double *)(*(void *)(a1 + 40) + 64LL);
      BOOL v24 = v20 > 0.00416666667;
      if (v20 > fabs(v21 * 0.5)) {
        goto LABEL_16;
      }
      if (v22 <= v23)
      {
        [*v6 sf];
        double v47 = v46;
        objc_msgSend(*v6, "utcUnc_s");
        if (sub_100008A4C(v21, v47, v48))
        {
          int v60 = v24;
          int v26 = 1;
          [*(id *)(a1 + 40) setSystemTimeSet:1];
          __int128 v68 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v65 = 0u;
          v49 = *(void **)(*(void *)(a1 + 40) + 48LL);
          id v50 = [v49 countByEnumeratingWithState:&v65 objects:v89 count:16];
          if (v50)
          {
            id v51 = v50;
            unint64_t v58 = v19;
            uint64_t v59 = v18;
            uint64_t v52 = *(void *)v66;
            do
            {
              for (i = 0LL; i != v51; i = (char *)i + 1)
              {
                if (*(void *)v66 != v52) {
                  objc_enumerationMutation(v49);
                }
                v54 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
                if ((objc_opt_respondsToSelector(v54, "didSetTime:withUncertainty:fromSource:lastInput:") & 1) != 0)
                {
                  objc_msgSend(*(id *)(a1 + 32), "utcUnc_s");
                  objc_msgSend( v54,  "didSetTime:withUncertainty:fromSource:lastInput:",  objc_msgSend(*(id *)(a1 + 32), "source"),  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "lastInputSource"),  v8,  v55);
                }
              }

              id v51 = [v49 countByEnumeratingWithState:&v65 objects:v89 count:16];
            }

            while (v51);
            int v26 = 1;
            unint64_t v19 = v58;
            uint64_t v18 = v59;
          }

LABEL_20:
          [*v6 propagatedUncertaintyAtRTC:v61];
          uint64_t v28 = v27;
          char v29 = (os_log_s *)qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            v30 = @"adjtime";
            uint64_t v31 = *(void *)(a1 + 72);
            uint64_t v32 = *(void *)(a1 + 80);
            if (v22 > v23) {
              v30 = @"settimeofday";
            }
            *(_DWORD *)__int128 buf = 138414594;
            *(void *)&uint8_t buf[4] = @"apply";
            __int16 v71 = 2112;
            int64_t v72 = (int64_t)v30;
            __int16 v73 = 2048;
            v74 = *(const char **)&v61;
            __int16 v75 = 2048;
            double v76 = v16;
            __int16 v77 = 2048;
            double v78 = v8;
            __int16 v79 = 2048;
            uint64_t v80 = v28;
            __int16 v81 = 2048;
            uint64_t v82 = v31;
            __int16 v83 = 2048;
            double v84 = v21;
            __int16 v85 = 1024;
            int v86 = v26;
            __int16 v87 = 2048;
            uint64_t v88 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,adjust,%.9f,success,%d,after_m,%llu",  buf,  0x62u);
          }

          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472LL;
          v62[2] = sub_100009954;
          v62[3] = &unk_100028BC0;
          BOOL v63 = v22 > v23;
          *(double *)&v62[4] = v61;
          *(double *)&v62[5] = v8;
          v62[6] = v28;
          uint64_t v33 = *(void *)(a1 + 80);
          v62[7] = *(void *)(a1 + 72);
          *(double *)&v62[8] = v21;
          char v64 = v26;
          v62[9] = v33;
          AnalyticsSendEventLazy(@"com.apple.timed.applyTime", v62);
          int64_t v34 = sub_1000073FC(v19 + 1000000000 * v18);
          v35 = (os_log_s *)qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v36 = sub_1000073FC(0LL);
            *(_DWORD *)__int128 buf = 134218752;
            *(void *)&uint8_t buf[4] = v19 + 1000000000 * v18;
            __int16 v71 = 2048;
            int64_t v72 = v34;
            __int16 v73 = 2048;
            v74 = (const char *)v36;
            __int16 v75 = 1024;
            LODWORD(v76) = v34 > 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "cmd,rtc_offset,set,%lld,was,%lld,now,%lld,success,%d",  buf,  0x26u);
            if ((v60 & 1) == 0) {
              goto LABEL_30;
            }
          }

          else if (!v60)
          {
            goto LABEL_30;
          }

          goto LABEL_29;
        }

        goto LABEL_16;
      }

      IOReturn v40 = IOPMAssertionCreateWithDescription( @"NoIdleSleepAssertion",  @"com.apple.timed.settimeofday",  0LL,  0LL,  0LL,  62.0,  @"TimeoutActionTurnOff",  &AssertionID);
      if (v40)
      {
        int v41 = v40;
        v42 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001AECC(v41, v42);
        }
        if (![*(id *)(*(void *)(a1 + 40) + 56) shouldPowerAssertionsBeOptional])
        {
          v57 = (os_log_s *)qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Failed to take power assertion, not calling settimeofday",  buf,  2u);
          }

          goto LABEL_16;
        }
      }

      if (!objc_msgSend( objc_msgSend(*(id *)(a1 + 40), "clock"),  "isMachTimeValid:",  *(void *)(a1 + 72)))
      {
        v56 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Slept while computing time, not calling settimeofday",  buf,  2u);
        }

        IOPMAssertionRelease(AssertionID);
        goto LABEL_16;
      }

      double v43 = v8
          + sub_100007998( *(void *)(a1 + 72),  (unint64_t)objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "clock"), "machTime"));
      char v44 = sub_10000881C( *(void *)(a1 + 40),  (uint64_t)objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "source"), "UTF8String"),  v43);
      if ((objc_msgSend( objc_msgSend(*(id *)(a1 + 40), "clock"),  "isMachTimeValid:",  *(void *)(a1 + 72)) & 1) == 0 && (uint64_t v45 = qword_1000338F8, os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)))
      {
        if ((sub_10001AE80(v45, &AssertionID, v44) & 1) != 0) {
          goto LABEL_42;
        }
      }

      else
      {
        IOPMAssertionRelease(AssertionID);
        if ((v44 & 1) != 0)
        {
LABEL_42:
          int v26 = 1;
LABEL_19:
          int v60 = 1;
          goto LABEL_20;
        }
      }

LABEL_16:
      __int128 v25 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to update time", buf, 2u);
      }

      int v26 = 0;
      goto LABEL_19;
    }
  }

  v37 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    v38 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v8);
    id v39 = objc_msgSend(objc_msgSend(*v6, "source"), "UTF8String");
    *(_DWORD *)__int128 buf = 138412802;
    *(void *)&uint8_t buf[4] = v38;
    __int16 v71 = 2080;
    int64_t v72 = (int64_t)v39;
    __int16 v73 = 2080;
    v74 = "should not set system time";
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Not setting system time to %@ from %s because %s\n",  buf,  0x20u);
  }

LABEL_30:
}

NSDictionary *sub_100009954(uint64_t a1)
{
  v3[0] = @"settimeofday";
  v4[0] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v3[1] = @"rtc_s";
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32));
  v3[2] = @"t_s";
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  void v3[3] = @"unc_s";
  v4[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48));
  v3[4] = @"mach";
  v4[4] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 56));
  v3[5] = @"adjust";
  v4[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64));
  v3[6] = @"didSet";
  v4[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v3[7] = @"after_mach";
  v4[7] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 72));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL);
}

void *sub_100009BD4(void *a1, const char *a2)
{
  if (a1) {
    return [a1 isAutomaticTimeZoneEnabled];
  }
  return a1;
}

id *sub_100009BE0(id *result)
{
  if (result) {
    return (id *)[result[7] areTimeZonePopupsEnabled];
  }
  return result;
}

BOOL sub_100009BF0(id *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001AFD0();
    }
    return 0LL;
  }

  uint64_t v4 = CFTimeZoneCopySystem();
  uint64_t v5 = (id)(id)CFTimeZoneGetName(v4);
  if (v4) {
    CFRelease(v4);
  }
  id v6 = a2;
  CFTimeZoneRef v7 = CFTimeZoneCreateWithName(kCFAllocatorDefault, v6, 0);
  if (!v7)
  {
    double v17 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001AFFC(a2, v17);
      if (!v6) {
        return 0LL;
      }
    }

    else if (!v6)
    {
      return 0LL;
    }

    CFRelease(v6);
    return 0LL;
  }

  double v8 = v7;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v10 = CFTimeZoneGetSecondsFromGMT(v8, Current) / 3600.0;
  CFRelease(v8);
  if ([a1[7] areTimeZonePopupsEnabled]) {
    CFUserNotificationDisplayNotice( 0.0,  0LL,  0LL,  0LL,  0LL,  @"Time Zone Change",  (CFStringRef)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"timed set your time zone to %@ (GMT%+.2f) was %@.\n",  a2,  *(void *)&v10,  v5),  0LL);
  }
  double v11 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v29 = [a2 UTF8String];
    __int16 v30 = 2048;
    double v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting time zone to %s (GMT%+.2f) was %@\n",  buf,  0x20u);
  }

  bzero(buf, 0x400uLL);
  readlink("/var/db/timezone/localtime", (char *)buf, 0x3FFuLL);
  double v12 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v26 = 136315138;
    uint64_t v27 = buf;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Before set, localtime symlink points to %s",  v26,  0xCu);
  }

  int v13 = tzlink([a2 UTF8String]);
  BOOL v14 = v13 == 0;
  if (v13)
  {
    int v15 = v13;
    double v16 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001B0E4(a2, v15, v16);
      if (!v6) {
        return v14;
      }
      goto LABEL_15;
    }

    if (v6) {
LABEL_15:
    }
      CFRelease(v6);
  }

  else
  {
    CFTimeZoneResetSystem();
    setenv("TZ", ":", 1);
    tzset();
    bzero(buf, 0x400uLL);
    readlink("/var/db/timezone/localtime", (char *)buf, 0x3FFuLL);
    unint64_t v19 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v26 = 136315138;
      uint64_t v27 = buf;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "After set, localtime symlink points to %s",  v26,  0xCu);
    }

    double v20 = CFTimeZoneCopySystem();
    Name = CFTimeZoneGetName(v20);
    double v22 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v26 = 138412290;
      uint64_t v27 = (uint8_t *)Name;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CF's name for the zone is %@", v26, 0xCu);
    }

    if (v20)
    {
      if (CFStringCompare(Name, v6, 0LL) && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001B070();
      }
      CFRelease(v20);
    }

    if (v6) {
      CFRelease(v6);
    }
    double v23 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v26 = 136315138;
      uint64_t v27 = (uint8_t *)tzname[0];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "tzname[0] is %s", v26, 0xCu);
      double v23 = (os_log_s *)qword_1000338F8;
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = tzname[1];
      *(_DWORD *)int v26 = 136315138;
      uint64_t v27 = (uint8_t *)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "tzname[1] is %s", v26, 0xCu);
    }

    [a1 setSystemTimeZoneSet:1];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"TimeZoneChangeNotification", 0LL, 0LL, 0);
  }

  return v14;
}

BOOL sub_10000A0D4(uint64_t a1, __CFString *a2)
{
  BOOL v2 = 0LL;
  if (a1 && a2)
  {
    CFTimeZoneResetSystem();
    CFTimeZoneRef v4 = CFTimeZoneCopySystem();
    CFTimeZoneRef v5 = CFTimeZoneCreateWithName(kCFAllocatorDefault, a2, 0);
    if (v5)
    {
      CFTimeZoneRef v6 = v5;
      BOOL v2 = CFEqual(v5, v4) != 0;
      CFRelease(v6);
    }

    else
    {
      CFTimeZoneRef v7 = (os_log_s *)qword_1000338F8;
      BOOL v2 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        id v10 = -[__CFString UTF8String](a2, "UTF8String");
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No entry in system for time zone %s\n",  (uint8_t *)&v9,  0xCu);
        BOOL v2 = 0LL;
      }
    }

    if (v4) {
      CFRelease(v4);
    }
  }

  return v2;
}

void sub_10000A1F0(id *a1, __CFString *a2)
{
  if (a1 && [a1 isAutomaticTimeZoneEnabled])
  {
    if (sub_10000A0D4((uint64_t)a1, a2) && ([a1 isSystemTimeZoneSet] & 1) != 0)
    {
      CFTimeZoneRef v4 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        CFTimeZoneRef v6 = a2;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Not setting time zone to %@ because time zone is unchanged\n",  (uint8_t *)&v5,  0xCu);
      }
    }

    else
    {
      sub_100009BF0(a1, a2);
    }
  }

id sub_10000A36C(id result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    -[NSUserDefaults synchronize]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "synchronize");
    objc_msgSend(objc_msgSend((id)v1, "clock"), "coarseMonotonicTime");
    *(void *)(v1 + 120) = v2;
    objc_msgSend(*(id *)(v1 + 128), "setLastRtcTime:");
    [*(id *)(v1 + 128) setBootUUID:sub_10000847C(v1)];
    objc_msgSend(*(id *)(v1 + 128), "setRtcResetCount:", objc_msgSend((id)v1, "rtcResetCount"));
    objc_msgSend((id)v1, "accessoryUnc_s");
    objc_msgSend(*(id *)(v1 + 128), "setAccessoryUnc_s:");
    objc_msgSend(*(id *)(v1 + 128), "setSystemTimeSet:", objc_msgSend((id)v1, "isSystemTimeSet"));
    [*(id *)(v1 + 32) lastFetchAttempt];
    objc_msgSend(*(id *)(v1 + 128), "setLastNTPFetchAttempt:");
    objc_msgSend(*(id *)(v1 + 128), "setSTF:", objc_msgSend(*(id *)(v1 + 24), "dataRepresentation"));
    objc_msgSend(*(id *)(v1 + 128), "setTDTF:", objc_msgSend(*(id *)(v1 + 16), "dataRepresentation"));
    [*(id *)(v1 + 128) setSystemTimeSet:*(unsigned __int8 *)(v1 + 40)];
    return [*(id *)(v1 + 128) savePath:@"/var/db/timed/com.apple.timed.plist"];
  }

  return result;
}

id sub_10000A458(id result, uint64_t a2)
{
  if (result)
  {
    if (qword_100033890 != -1) {
      dispatch_once(&qword_100033890, &stru_100028C08);
    }
    return objc_msgSend(objc_msgSend((id)qword_100033898, "objectForKeyedSubscript:", a2), "BOOLValue");
  }

  return result;
}

void sub_10000A4B4(id a1)
{
  v1[0] = @"TMSetSourceTime";
  v1[1] = @"TMSetSourceAvailable";
  v2[0] = &__kCFBooleanTrue;
  v2[1] = &__kCFBooleanTrue;
  v1[2] = @"TMSetSourceUnavailable";
  v1[3] = @"TMSetSourceTimeZone";
  v2[2] = &__kCFBooleanTrue;
  v2[3] = &__kCFBooleanTrue;
  v1[4] = @"TMProvideCellularTimeZone";
  v1[5] = @"TMProvideBBTime";
  v2[4] = &__kCFBooleanTrue;
  v2[5] = &__kCFBooleanTrue;
  qword_100033898 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v2,  v1,  6LL);
}

void sub_10000A774(NSDictionary *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  id v6 = [a2 objectForKey:@"TMCommand"];
  if ([v6 isEqualToString:@"TMSetManualTime"])
  {
    sub_10000B8F0(a1, a2);
LABEL_18:
    sub_10000A36C(a1);
    return;
  }

  if ([v6 isEqualToString:@"TMSetAuthenticatedSourceTime"])
  {
    sub_10000BB1C((uint64_t)a1, (uint64_t)a2);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMSetSourceTime"])
  {
    -[NSDictionary setSourceTime:](a1, "setSourceTime:", a2);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMSetSourceAvailable"])
  {
    -[NSDictionary setSourceAvailable:](a1, "setSourceAvailable:", a2);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMSetSourceUnavailable"])
  {
    -[NSDictionary setSourceUnavailable:](a1, "setSourceUnavailable:", a2);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMSetSourceTimeZone"])
  {
    -[NSDictionary setSourceTimeZone:](a1, "setSourceTimeZone:", a2);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMSetAutomaticTimeEnabled"])
  {
    id v7 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"TMAutomaticTimeEnabled"), "BOOLValue");
    double v8 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      *(_DWORD *)__int128 buf = 138413058;
      v49 = @"auto_time";
      __int16 v50 = 2112;
      double v51 = *(double *)&v9;
      __int16 v52 = 2048;
      uint64_t v53 = v10;
      __int16 v54 = 1024;
      LODWORD(v55) = (_DWORD)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,enabled,%d",  buf,  0x26u);
    }

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10000BC7C;
    v46[3] = &unk_100028C58;
    char v47 = (char)v7;
    v46[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.setAutomaticTimeEnabledCommand", v46);
    -[NSDictionary setAutomaticTimeEnabled:](a1, "setAutomaticTimeEnabled:", v7);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMIsAutomaticTimeEnabled"])
  {
    double v11 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSDictionary isAutomaticTimeEnabled](a1, "isAutomaticTimeEnabled"));
    double v12 = @"TMAutomaticTimeEnabled";
LABEL_22:
    int v13 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v11,  v12);
    goto LABEL_23;
  }

  if ([v6 isEqualToString:@"TMSetAutomaticTimeZoneEnabled"])
  {
    id v15 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"TMAutomaticTimeZoneEnabled"), "BOOLValue");
    double v16 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      *(_DWORD *)__int128 buf = 138413058;
      v49 = @"auto_tz";
      __int16 v50 = 2112;
      double v51 = *(double *)&v17;
      __int16 v52 = 2048;
      uint64_t v53 = v18;
      __int16 v54 = 1024;
      LODWORD(v55) = (_DWORD)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,enabled,%d",  buf,  0x26u);
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10000BD80;
    v44[3] = &unk_100028C58;
    char v45 = (char)v15;
    v44[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.setAutomaticTimeZoneEnabledCommand", v44);
    -[NSDictionary setAutomaticTimeZoneEnabled:](a1, "setAutomaticTimeZoneEnabled:", v15);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMIsAutomaticTimeZoneEnabled"])
  {
    double v11 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSDictionary isAutomaticTimeZoneEnabled](a1, "isAutomaticTimeZoneEnabled"));
    double v12 = @"TMAutomaticTimeZoneEnabled";
    goto LABEL_22;
  }

  if ([v6 isEqualToString:@"TMIsTimeZoneConfirmed"])
  {
    double v11 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[objc_class currentTimeZone](a1[1].super.isa, "currentTimeZone") != 0LL);
    double v12 = @"TMTimeZoneConfirmed";
    goto LABEL_22;
  }

  if ([v6 isEqualToString:@"TMConfirmTimeZone"])
  {
    sub_10000BEA8(a1, a2);
    goto LABEL_18;
  }

  if ([v6 isEqualToString:@"TMGetBAFinderTime"])
  {
    BOOL v14 = sub_10000BFF4(a1);
    unint64_t v19 = (os_log_s *)qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    *(_DWORD *)__int128 buf = 138412290;
    v49 = (const __CFString *)v14;
    double v20 = "Returning BA finder time to client: %@";
    goto LABEL_42;
  }

  if (![v6 isEqualToString:@"TMGetReferenceTime"])
  {
    if ([v6 isEqualToString:@"TMGetTrustedInterval"])
    {
      Class isa = a1[3].super.isa;
      objc_msgSend(-[NSDictionary clock](a1, "clock"), "coarseMonotonicTime");
      double v22 = (NSDictionary *)objc_msgSend(-[objc_class timeAtRtc:](isa, "timeAtRtc:"), "dictionary");
      if (v22) {
        BOOL v14 = v22;
      }
      else {
        BOOL v14 = (NSDictionary *)&__NSDictionary0__struct;
      }
      goto LABEL_25;
    }

    if ([v6 isEqualToString:@"TMGetRTCResetCount"])
    {
      char v64 = @"TMRTCResetCount";
      __int128 v65 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSDictionary rtcResetCount](a1, "rtcResetCount"));
      double v23 = &v65;
      BOOL v24 = &v64;
    }

    else
    {
      if ([v6 isEqualToString:@"TMIsBBTimeActive"])
      {
        int v13 = sub_10000C094(a1);
        goto LABEL_23;
      }

      if ([v6 isEqualToString:@"TMProvideBBTime"])
      {
        sub_10000C124((id *)&a1->super.isa, a2);
        goto LABEL_18;
      }

      if ([v6 isEqualToString:@"TMProvideCellularTimeZone"])
      {
        sub_1000086C4(a1, (uint64_t)"provideNetworkTimeZone:", (uint64_t)a2);
        goto LABEL_18;
      }

      if ([v6 isEqualToString:@"TMSetupTime"])
      {
        sub_10000C418(a1, a2, (uint64_t (**)(void, void))a3);
        return;
      }

      if ([v6 isEqualToString:@"TMSetupTimeZone"])
      {
        sub_10000C63C(a1, a2, a3);
        return;
      }

      if ([v6 isEqualToString:@"TMFetchNTP"])
      {
        -[objc_class fetchTime](a1[4].super.isa, "fetchTime");
        return;
      }

      if (![v6 isEqualToString:@"TMGetComputedTimeZone"])
      {
        if ([v6 isEqualToString:@"TMResetToFirstLaunch"])
        {
          sub_10000CA3C((id *)&a1->super.isa, a2);
          return;
        }

        if ([v6 isEqualToString:@"TMResetTimeZone"])
        {
          -[NSDictionary resetTimeZone:](a1, "resetTimeZone:", a2);
          goto LABEL_18;
        }

        unsigned int v26 = [v6 isEqualToString:@"TMSystemWillWake"];
        uint64_t v27 = (os_log_s *)qword_1000338F8;
        if (v26)
        {
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "System will wake", buf, 2u);
          }

          Class v28 = a1[2].super.isa;
          -[objc_class RTCWakeUncertainty](a1[7].super.isa, "RTCWakeUncertainty");
          -[objc_class inflateHistoricalDataBy:](v28, "inflateHistoricalDataBy:");
          if (-[objc_class shouldCorrectOnWake](a1[7].super.isa, "shouldCorrectOnWake")
            && -[objc_class shouldFetchOnWake](a1[7].super.isa, "shouldFetchOnWake")
            && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
          {
            sub_10001B244();
          }

          if (-[objc_class shouldFetchOnWake](a1[7].super.isa, "shouldFetchOnWake"))
          {
            double v30 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00);
            double v31 = *(double *)&qword_1000334B0;
            if (*(double *)&qword_1000334B0 > v30)
            {
              __int16 v32 = (os_log_s *)qword_1000338F8;
              if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_FAULT,  "CLOCK_MONOTONIC_RAW has stepped backward since last NTP fetch",  buf,  2u);
                double v31 = *(double *)&qword_1000334B0;
              }
            }

            if (v31 <= 0.0 || v31 >= v30 || (double v29 = v30 - v31, v30 - v31 >= 900.0))
            {
              qword_1000334B0 = *(void *)&v30;
              -[objc_class fetchTime](a1[4].super.isa, "fetchTime", v29);
            }

            else
            {
              uint64_t v33 = (os_log_s *)qword_1000338F8;
              if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 134218240;
                v49 = *(const __CFString **)&v31;
                __int16 v50 = 2048;
                double v51 = v30;
                _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Throttling power management triggered NTP fetch attempt lastFetch: %f currentTime: %f",  buf,  0x16u);
              }
            }
          }

          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_10000CC58;
          v43[3] = &unk_100028C80;
          v43[4] = a1;
          objc_msgSend( -[NSDictionary clock](a1, "clock"),  "montonicTimeForMachTime:toQueue:withCompletionHandler:",  mach_absolute_time(),  -[NSDictionary workloop](a1, "workloop"),  v43);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001B270();
          }
          int64_t v34 = (os_log_s *)qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = [a2 objectForKeyedSubscript:@"TMSource"];
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
            uint64_t v37 = v36;
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRTCConversionTimeError"), "doubleValue");
            uint64_t v39 = v38;
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
            uint64_t v41 = v40;
            objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
            *(_DWORD *)__int128 buf = 138413826;
            v49 = @"unknown";
            __int16 v50 = 2112;
            double v51 = *(double *)&v35;
            __int16 v52 = 2048;
            uint64_t v53 = v37;
            __int16 v54 = 2048;
            uint64_t v55 = v39;
            __int16 v56 = 2048;
            uint64_t v57 = v41;
            __int16 v58 = 2048;
            uint64_t v59 = v42;
            __int16 v60 = 2048;
            id v61 = objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"TMMachTime"),  "unsignedLongLongValue");
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu",  buf,  0x48u);
          }
        }

        return;
      }

      id v25 = objc_msgSend(-[NSDictionary computedTimeZone](a1, "computedTimeZone"), "olsonName");
      if (!v25)
      {
        BOOL v14 = (NSDictionary *)&__NSDictionary0__struct;
        goto LABEL_25;
      }

      v62 = @"TMTimeZone";
      id v63 = v25;
      double v23 = (NSNumber **)&v63;
      BOOL v24 = &v62;
    }

    int v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v24,  1LL);
LABEL_23:
    BOOL v14 = v13;
    goto LABEL_24;
  }

  BOOL v14 = sub_10000BFF4(a1);
  unint64_t v19 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    v49 = (const __CFString *)v14;
    double v20 = "Returning reference time to client: %@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
  }

LABEL_24:
  if (v14) {
LABEL_25:
  }
    (*(void (**)(uint64_t, NSDictionary *))(a3 + 16))(a3, v14);
}

void sub_10000B390(uint64_t a1, double a2, double a3)
{
  if (!*(_BYTE *)(a1 + 56))
  {
    uint64_t v10 = *(NSDictionary **)(a1 + 32);
    double v12 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
LABEL_9:
    sub_10000A774(v10, v12, v11);
    return;
  }

  if (a2 > 0.0)
  {
    id v6 = [*(id *)(a1 + 40) mutableCopy];
    objc_msgSend( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2),  @"TMRtcTime");
    objc_msgSend( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3),  @"TMRTCConversionTimeError");
    id v7 = [v6 objectForKeyedSubscript:@"TMTimeError"];
    if (v7)
    {
      [v7 doubleValue];
      objc_msgSend( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8 + a3),  @"TMTimeError");
    }

    id v9 = [v6 objectForKeyedSubscript:@"TMNanoTimeError"];
    if (v9) {
      objc_msgSend( v6,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  (char *)objc_msgSend(v9, "longLongValue") + (uint64_t)(a3 * 1000000000.0)),  @"TMNanoTimeError");
    }
    uint64_t v10 = *(NSDictionary **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    double v12 = v6;
    goto LABEL_9;
  }

  int v13 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
    sub_10001B2D0(a1, v13, v14, v15, v16, v17, v18, v19);
  }
  double v20 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    uint64_t v23 = v22;
    objc_msgSend( objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMRTCConversionTimeError"),  "doubleValue");
    uint64_t v25 = v24;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
    uint64_t v27 = v26;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
    uint64_t v29 = v28;
    id v30 = objc_msgSend( objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMMachTime"),  "unsignedLongLongValue");
    id v31 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"TMCommand"];
    *(_DWORD *)__int128 buf = 138414082;
    int64_t v34 = @"DROP";
    __int16 v35 = 2112;
    id v36 = v21;
    __int16 v37 = 2048;
    uint64_t v38 = v23;
    __int16 v39 = 2048;
    uint64_t v40 = v25;
    __int16 v41 = 2048;
    uint64_t v42 = v27;
    __int16 v43 = 2048;
    uint64_t v44 = v29;
    __int16 v45 = 2048;
    id v46 = v30;
    __int16 v47 = 2112;
    id v48 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,cmd,%@",  buf,  0x52u);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10000B728;
  v32[3] = &unk_100028BA0;
  v32[4] = *(void *)(a1 + 40);
  AnalyticsSendEventLazy(@"com.apple.timed.droppedCommand", v32);
}

NSDictionary *sub_10000B728(uint64_t a1)
{
  v3[0] = @"cmd";
  v4[0] = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  sub_100006A40((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMCommand"]));
  v3[1] = @"src";
  v4[1] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[2] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v3[3] = @"t_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
  v4[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v3[4] = @"unc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
  v4[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v3[5] = @"mach";
  v4[5] = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime"),  "unsignedLongLongValue"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL);
}

void sub_10000B8F0(void *a1, void *a2)
{
  if (a1)
  {
    unsigned int v4 = [a1 isAutomaticTimeEnabled];
    int v5 = (os_log_s *)qword_1000338F8;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001B338();
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)a2;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting manual time with dictionary %@",  (uint8_t *)&buf,  0xCu);
      }

      objc_msgSend(objc_msgSend(a2, "objectForKey:", @"TMCurrentTime"), "doubleValue");
      double v7 = v6;
      sub_100007798(&buf.tv_sec, v6);
      if ((v8 & 1) != 0)
      {
        if (settimeofday(&buf, 0LL))
        {
          id v9 = (os_log_s *)qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001B364(&buf.tv_sec, v9, v10);
          }
        }

        else
        {
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          uint64_t v11 = (void *)a1[6];
          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
                if ((objc_opt_respondsToSelector(v16, "didSetManualTime:") & 1) != 0) {
                  [v16 didSetManualTime:v7];
                }
              }

              id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
            }

            while (v13);
          }

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"SignificantTimeChangeNotification",  0LL,  0LL,  1u);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
      {
        sub_10001B3E0();
      }
    }
  }

void sub_10000BB1C(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  unsigned int v4 = +[TMTime timeWithDictionary:](&OBJC_CLASS___TMTime, "timeWithDictionary:", a2);
  int v5 = *(void **)(a1 + 24);
  if (!v5)
  {
    id v9 = objc_alloc(&OBJC_CLASS___TMTimeSynthesizer);
    [*(id *)(a1 + 56) RTCFrequencyTolerance];
    double v11 = v10;
    [*(id *)(a1 + 56) RTCFrequencyNoiseDensity];
    double v7 = -[TMTimeSynthesizer initWithClockAccuracy:noiseDensity:name:]( v9,  "initWithClockAccuracy:noiseDensity:name:",  @"STF",  v11,  v12);
    *(void *)(a1 + 24) = v7;
    goto LABEL_7;
  }

  unsigned int v6 = [v5 isRunning];
  double v7 = *(TMTimeSynthesizer **)(a1 + 24);
  if (!v6)
  {
LABEL_7:
    id v13 = 0LL;
    -[TMTimeSynthesizer update:withError:](v7, "update:withError:", v4, &v13);
    if (v13) {
      sub_100007CF8((id *)a1, v13, v4);
    }
    [(id)a1 setSourceTime:a2];
    return;
  }

  if (-[TMTimeSynthesizer intersects:](v7, "intersects:", v4))
  {
    char v8 = *(void **)(a1 + 136);
    -[TMTime rtc_s](v4, "rtc_s");
    objc_msgSend(v8, "resetRejectCountsForReason:rtc:", 1);
    double v7 = *(TMTimeSynthesizer **)(a1 + 24);
    goto LABEL_7;
  }

  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
    sub_10001B40C();
  }
  sub_100007CF8( (id *)a1,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kTimedErrorDomain",  6LL,  0LL),  v4);
}

NSDictionary *sub_10000BC7C(uint64_t a1)
{
  v3[0] = @"BOOL";
  v4[0] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3[1] = @"src";
  v4[1] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[2] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL);
}

NSDictionary *sub_10000BD80(uint64_t a1)
{
  v3[0] = @"BOOL";
  v4[0] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3[1] = @"src";
  v4[1] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[2] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL);
}

BOOL sub_10000BE84(BOOL result)
{
  if (result) {
    return [*(id *)(result + 8) currentTimeZone] != 0;
  }
  return result;
}

id sub_10000BEA8(id result, void *a2)
{
  if (result)
  {
    int v3 = result;
    unsigned int v4 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      *(_DWORD *)timeval buf = 138412802;
      id v9 = @"confirm_tz";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000E218;
    v7[3] = &unk_100028BA0;
    v7[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.confirmTimeZoneCommand", v7);
    return [v3 resetTimeZone:a2];
  }

  return result;
}

NSDictionary *sub_10000BFF4(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = (void *)a1[2];
  objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
  id v2 = objc_msgSend(objc_msgSend(v1, "timeAtRtc:"), "dictionary");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000EB58;
  void v4[3] = &unk_100028BA0;
  v4[4] = v2;
  AnalyticsSendEventLazy(@"com.apple.timed.referenceTime", v4);
  if (!v2) {
    return +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  return (NSDictionary *)v2;
}

NSDictionary *sub_10000C094(NSDictionary *result)
{
  if (result)
  {
    uint64_t v1 = @"TMBBTimeActive";
    id v2 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSDictionary requiresActiveBBTime](result, "requiresActiveBBTime"));
    return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v2,  &v1,  1LL);
  }

  return result;
}

id *sub_10000C124(id *result, void *a2)
{
  if (result)
  {
    int v3 = result;
    unsigned int v4 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      uint64_t v7 = v6;
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRTCConversionTimeError"), "doubleValue");
      uint64_t v9 = v8;
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
      uint64_t v11 = v10;
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
      *(_DWORD *)timeval buf = 138414850;
      *(void *)&uint8_t buf[4] = @"BB";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      __int16 v26 = 2048;
      id v27 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMMachTime"), "unsignedLongLongValue");
      __int16 v28 = 2048;
      id v29 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMAbsoluteNanoTime"), "longLongValue");
      __int16 v30 = 2048;
      id v31 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMNanoTimeError"), "longLongValue");
      __int16 v32 = 2048;
      id v33 = objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMMachTime"), "unsignedLongLongValue");
      __int16 v34 = 2048;
      id v35 = objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"TMMachTimeAfter"),  "unsignedLongLongValue");
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,t_ns,%lld,unc_ns,%lld,before_m,%llu,after_m,%llu",  buf,  0x70u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_10000EB60;
    v14[3] = &unk_100028BA0;
    v14[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.BBTimeCommand", v14);
    uint64_t v13 = +[TMTime timeWithDictionary:](&OBJC_CLASS___TMTime, "timeWithDictionary:", a2);
    *(void *)timeval buf = 0LL;
    [v3[2] update:v13 withError:buf];
    if (*(void *)buf) {
      sub_100007B30(v3, *(void **)buf, v13);
    }
    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"TMSystemTimeChanged",  v3,  &__NSDictionary0__struct);
    [v3 testAndApplySystemTime];
    return (id *)[v3 checkActiveTimeSourceRequired];
  }

  return result;
}

id sub_10000C418(id result, void *a2, uint64_t (**a3)(void, void))
{
  if (result)
  {
    id v5 = result;
    uint64_t v6 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup time request.\n", buf, 2u);
    }

    uint64_t v7 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      *(_DWORD *)timeval buf = 138412802;
      uint64_t v13 = @"setup_time";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000EE3C;
    v11[3] = &unk_100028BA0;
    v11[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.setupTimeCommand", v11);
    if ([v5 isSystemTimeSet])
    {
      uint64_t v10 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)timeval buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TMSetupTime: time already set.", buf, 2u);
      }

      return (id)((uint64_t (**)(void, NSDictionary *))a3)[2]( a3,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"TMSetupSuccessful"));
    }

    else
    {
      return sub_10000CEF8(v5, a3);
    }
  }

  return result;
}

void sub_10000C63C(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup timezone request.\n", buf, 2u);
    }

    uint64_t v7 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      *(_DWORD *)timeval buf = 138412802;
      *(void *)&uint8_t buf[4] = @"setup_tz";
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000EF24;
    void v23[3] = &unk_100028BA0;
    v23[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.setupTimeZoneCommand", v23);
    if ([a1 isSystemTimeZoneSet])
    {
      uint64_t v10 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)timeval buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "TMSetupTimeZone: timezone already set.",  buf,  2u);
      }

      (*(void (**)(uint64_t, NSDictionary *))(a3 + 16))( a3,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"TMSetupSuccessful"));
    }

    else
    {
      *(void *)timeval buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000LL;
      LOBYTE(v25) = 0;
      v21[0] = 0LL;
      v21[1] = v21;
      v21[2] = 0x2020000000LL;
      char v22 = 0;
      v19[0] = 0LL;
      v19[1] = v19;
      v19[2] = 0x2020000000LL;
      char v20 = 0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000F00C;
      v18[3] = &unk_100028E60;
      v18[6] = buf;
      v18[7] = v21;
      v18[4] = a3;
      v18[5] = v19;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472LL;
      aBlock[2] = sub_10000F184;
      aBlock[3] = &unk_100028E88;
      aBlock[4] = v18;
      aBlock[5] = buf;
      sub_1000079A8( DarwinNotifyCenter,  @"AutomaticTimeZoneUpdateFailed",  0LL,  (CFNotificationSuspensionBehavior)0LL,  aBlock);
      LocalCenter = CFNotificationCenterGetLocalCenter();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000F1B4;
      v16[3] = &unk_100028EB0;
      v16[4] = v18;
      v16[5] = v21;
      v16[6] = v19;
      sub_1000079A8( LocalCenter,  @"TimeZoneChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately,  v16);
      dispatch_time_t v13 = dispatch_time(0LL, 20000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000F200;
      block[3] = &unk_100028ED8;
      block[6] = v19;
      block[7] = v21;
      void block[8] = buf;
      block[4] = a1;
      block[5] = v18;
      dispatch_after(v13, (dispatch_queue_t)[a1 workloop], block);
      __int16 v14 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v14, @"AutomaticTimeZoneUpdateNeeded", 0LL, 0LL, 1u);
      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v21, 8);
      _Block_object_dispose(buf, 8);
    }
  }

void sub_10000CA00(_Unwind_Exception *a1)
{
}

id *sub_10000CA3C(id *result, void *a2)
{
  if (result)
  {
    int v3 = result;
    unsigned int v4 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting timed.\n", buf, 2u);
    }

    id v5 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [a2 objectForKeyedSubscript:@"TMSource"];
      objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
      *(_DWORD *)timeval buf = 138412802;
      uint64_t v12 = @"reset";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000F318;
    v10[3] = &unk_100028BA0;
    v10[4] = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.resetToFirstLaunch", v10);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TimedResetNotification", 0LL, 0LL, 0);
    xpc_activity_unregister("com.apple.timed.check-active");
    [v3[16] emptyPath:@"/var/db/timed/com.apple.timed.plist"];
    [v3 setSystemTimeZoneSet:0];
    uint64_t v9 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Reset complete.", buf, 2u);
    }

    exit(0);
  }

  return result;
}

void *sub_10000CC58(void *result, double a2, double a3)
{
  uint64_t v3 = result[4];
  if (*(_BYTE *)(v3 + 40) && *(double *)(v3 + 120) > a2 + a3)
  {
    id v5 = result;
    id v6 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "RTC has walked backwards during sleep, resetting synthesizer",  v9,  2u);
      uint64_t v3 = v5[4];
    }

    [(id)v3 rtcDidReset];
    uint64_t v7 = objc_alloc(&OBJC_CLASS___TMMonotonicClock);
    [*(id *)(v5[4] + 56) RTCMachSyncInterval];
    id v8 = -[TMMonotonicClock initWithSyncInterval:](v7, "initWithSyncInterval:");
    [(id)v5[4] setClock:v8];

    sub_100007AD0((id *)v5[4]);
    *(double *)(v5[4] + 120LL) = a2;
    return [*(id *)(v5[4] + 32) fetchTime];
  }

  return result;
}

void sub_10000CE48(id a1, NSDictionary *a2)
{
  uint64_t v3 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = -[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", @"TMSetupSuccessful");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Did setup time after automatic time enabled: %@",  (uint8_t *)&v4,  0xCu);
  }

id sub_10000CEF8(id result, void *aBlock)
{
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    if (aBlock)
    {
      uint64_t v3 = _Block_copy(aBlock);
      [*(id *)(v2 + 72) addObject:v3];
    }

    return [*(id *)(v2 + 32) fetchTime];
  }

  return result;
}

void sub_10000D0D8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "Sending TMLocationTimeZoneActiveNotification",  v3,  2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMLocationTimeZoneActive", 0LL, 0LL, 0);
  }

void sub_10000D160(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      uint64_t v9 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Got a response when none expected.\nMessage: %@.\nResponse: %@",  (uint8_t *)&v6,  0x16u);
    }
  }

void sub_10000D288(uint64_t a1)
{
  double v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 56) NTPWantedThreshold];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 32) timeProvider];
  [v6 rtcWhenBeyondUncertainty:v3];
  double v8 = v7;
  [v6 rtcWhenBeyondUncertainty:v5];
  double v10 = v9;
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "clock"), "coarseMonotonicTime");
  double v12 = v11;
  __int16 v13 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timeval buf = 134219008;
    double v39 = v12;
    __int16 v40 = 2048;
    double v41 = v3;
    __int16 v42 = 2048;
    double v43 = v5;
    __int16 v44 = 2048;
    double v45 = v8;
    __int16 v46 = 2048;
    double v47 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "cmd,checkActiveTimeSourceRequired,rtc_s,%f,bb_want_unc_s,%f,want_unc_s,%f,bb_want_rtc_s,%f,want_rtc_s,%f",  buf,  0x34u);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000D7C8;
  v37[3] = &unk_100028D10;
  *(double *)&v37[5] = v12;
  *(double *)&v37[6] = v8;
  *(double *)&v37[7] = v10;
  v37[4] = *(void *)(a1 + 32);
  AnalyticsSendEventLazy(@"com.apple.timed.checkActiveTimeSourceRequired", v37);
  [*(id *)(*(void *)(a1 + 32) + 8) sendStateAnalytics];
  if (([*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeZoneEnabled] & 1) == 0)
  {
    id v14 = +[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone");
    __int16 v15 = -[NSTimeZone name](v14, "name");
    uint64_t v16 = @"Unresolved";
    if (v15) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = @"Unresolved";
    }
    NSInteger v18 = -[NSTimeZone secondsFromGMT](v14, "secondsFromGMT");
    uint64_t v19 = (const __CFString *)objc_msgSend( objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "currentTimeZone"),  "olsonName");
    if (v19) {
      uint64_t v16 = v19;
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10000D91C;
    v36[3] = &unk_100028D38;
    v36[4] = v17;
    v36[5] = v16;
    v36[6] = v18;
    v36[7] = -[NSTimeZone secondsFromGMT]( +[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v16),  "secondsFromGMT");
    AnalyticsSendEventLazy(@"com.apple.timed.tzChange", v36);
  }

  if (([*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeEnabled] & 1) == 0)
  {
    id v20 = [*(id *)(*(void *)(a1 + 32) + 16) synthesizedTimeAtLastRTC];
    objc_msgSend(v20, "utc_s");
    uint64_t v22 = v21;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10000D9EC;
    v35[3] = &unk_100028D60;
    v35[5] = CFAbsoluteTimeGetCurrent();
    v35[6] = v22;
    v35[4] = v20;
    AnalyticsSendEventLazy(@"com.apple.timed.ManualTime", v35);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  double v24 = v10 - v12;
  if (v10 - v12 < 0.0) {
    double v24 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setWantedTime:v24 + Current];
  uint64_t v25 = *(void **)(a1 + 32);
  if (v8 < v12 + 300.0)
  {
    [v25 setRequiresActiveBBTime:1];
    if (*(double *)(*(void *)(a1 + 32) + 80LL) > -2.0)
    {
      __int16 v26 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)timeval buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Unscheduling proactive time check", buf, 2u);
      }

      xpc_activity_unregister("com.apple.timed.check-active");
      *(void *)(*(void *)(a1 + 32) + 80LL) = 0xC000000000000000LL;
    }

    return;
  }

  [v25 setRequiresActiveBBTime:0];
  double v27 = fabs(v8);
  if (v27 >= INFINITY && v27 <= INFINITY)
  {
    __int16 v28 = (os_log_s *)qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)timeval buf = 0;
    id v29 = "Proactive time is not necessary, dropping job with infinite start time";
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
    return;
  }

  double v30 = v8 - *(double *)(*(void *)(a1 + 32) + 80LL);
  if (v30 < 0.0) {
    double v30 = -v30;
  }
  if (v30 < 300.0)
  {
    __int16 v28 = (os_log_s *)qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)timeval buf = 0;
    id v29 = "Not rescheduling proactive time check";
    goto LABEL_28;
  }

  double v31 = v8 - v12;
  __int16 v32 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)timeval buf = 134217984;
    double v39 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "Scheduling proactive time check after %f seconds",  buf,  0xCu);
  }

  xpc_object_t v33 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v33, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v33, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(v33, XPC_ACTIVITY_DELAY, (uint64_t)v31);
  xpc_dictionary_set_int64(v33, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_activity_unregister("com.apple.timed.check-active");
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10000DADC;
  v34[3] = &unk_100028D88;
  v34[4] = *(void *)(a1 + 32);
  xpc_activity_register("com.apple.timed.check-active", v33, v34);
  xpc_release(v33);
  *(double *)(*(void *)(a1 + 32) + 80LL) = v8;
}

NSDictionary *sub_10000D7C8(uint64_t a1)
{
  v5[0] = @"rtc_s";
  v6[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  v5[1] = @"bb_want_rtc_s";
  double v2 = *(double *)(a1 + 48);
  if (fabs(v2) == INFINITY) {
    double v2 = 0.0;
  }
  v6[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v2);
  v5[2] = @"want_rtc_s";
  double v3 = *(double *)(a1 + 56);
  if (v3 == -INFINITY) {
    double v3 = 0.0;
  }
  v6[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3);
  v5[3] = @"manual_time";
  v6[3] = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeEnabled] ^ 1);
  v5[4] = @"manual_time_zone";
  v6[4] = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeZoneEnabled] ^ 1);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  5LL);
}

NSDictionary *sub_10000D91C(uint64_t a1)
{
  v3[0] = @"setTimeZone";
  v3[1] = @"computedTimeZone";
  __int128 v4 = *(_OWORD *)(a1 + 32);
  double v5 = +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  *(void *)(a1 + 48) - *(void *)(a1 + 56),  @"setTimeZone",  @"computedTimeZone",  @"computedManualTZOffsetSec");
  void v3[3] = @"timeZoneDisagreement";
  id v6 = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 32)] ^ 1);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  v3,  4LL);
}

NSDictionary *sub_10000D9EC(uint64_t a1)
{
  v3[0] = @"manualUTC";
  v4[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  v3[1] = @"computedUTC";
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48));
  v3[2] = @"computedUncertainty";
  objc_msgSend(*(id *)(a1 + 32), "utcUnc_s");
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v3[3] = @"difference";
  void v4[3] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 40) - *(double *)(a1 + 48));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL);
}

void sub_10000DADC(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  __int128 v4 = (os_log_s *)qword_1000338F8;
  if (state == 2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Handling proactive time check", v5, 2u);
    }

    [*(id *)(a1 + 32) checkActiveTimeSourceRequired];
  }

  else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B46C();
  }

void sub_10000DBF0(uint64_t a1)
{
  double v3 = v2;
  __int128 v4 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v3);
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"TMTimeError"), "doubleValue");
    double v7 = v6;
    id v8 = [*(id *)(a1 + 32) objectForKey:@"TMSource"];
    *(_DWORD *)timeval buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v28 = 2048;
    id v29 = v7;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received time %@±%.2f from %@\n",  buf,  0x20u);
  }

  double v9 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    double v12 = v11;
    objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRTCConversionTimeError"),  "doubleValue");
    uint64_t v14 = v13;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
    uint64_t v16 = v15;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
    uint64_t v18 = v17;
    id v19 = objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime"),  "unsignedLongLongValue");
    *(_DWORD *)timeval buf = 138413826;
    *(void *)&uint8_t buf[4] = @"T";
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2048;
    id v31 = v12;
    __int16 v32 = 2048;
    uint64_t v33 = v14;
    __int16 v34 = 2048;
    uint64_t v35 = v16;
    __int16 v36 = 2048;
    uint64_t v37 = v18;
    __int16 v38 = 2048;
    id v39 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu",  buf,  0x48u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000E078;
  v26[3] = &unk_100028BA0;
  uint8_t v26[4] = *(void *)(a1 + 32);
  AnalyticsSendEventLazy(@"com.apple.timed.timeCommand", v26);
  if (sub_1000076E8(v3))
  {
    id v20 = +[TMTime timeWithDictionary:](&OBJC_CLASS___TMTime, "timeWithDictionary:", *(void *)(a1 + 32));
    if (![*(id *)(*(void *)(a1 + 40) + 24) isRunning]
      || ![*(id *)(*(void *)(a1 + 40) + 56) shouldClamp])
    {
      uint64_t v22 = 0LL;
      goto LABEL_14;
    }

    if ([*(id *)(*(void *)(a1 + 40) + 24) intersects:v20])
    {
      uint64_t v21 = *(void *)(a1 + 40);
      if (*(void *)(v21 + 112) > 9uLL)
      {
        uint64_t v22 = 2LL;
        goto LABEL_15;
      }

      *(void *)(v21 + 112) = 0LL;
      uint64_t v22 = 2LL;
LABEL_14:
      uint64_t v21 = *(void *)(a1 + 40);
LABEL_15:
      uint64_t v23 = *(void **)(v21 + 136);
      -[TMTime rtc_s](v20, "rtc_s");
      objc_msgSend(v23, "resetRejectCountsForReason:rtc:", v22);
      *(void *)timeval buf = 0LL;
      [*(id *)(*(void *)(a1 + 40) + 16) update:v20 withError:buf];
      if (*(void *)buf) {
        sub_100007B30(*(id **)(a1 + 40), *(void **)buf, v20);
      }
      double v24 = *(void **)(a1 + 40);
      if (v24)
      {
        -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"TMSystemTimeChanged",  v24,  &__NSDictionary0__struct);
        [v24 testAndApplySystemTime];
        uint64_t v25 = *(void **)(a1 + 40);
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      [v25 checkActiveTimeSourceRequired];
      return;
    }

    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B4F8();
    }
    if ([*(id *)(*(void *)(a1 + 40) + 56) shouldAlertWhenIslanded])
    {
      if (++*(void *)(*(void *)(a1 + 40) + 112LL) == 10LL)
      {
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
          sub_10001B4CC();
        }
        AnalyticsSendEventLazy(@"com.apple.timed.islandAlert", &stru_100028DF0);
      }
    }

    sub_100007CF8( *(id **)(a1 + 40),  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kTimedErrorDomain",  6LL,  0LL),  v20);
  }

  else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B558();
  }

NSDictionary *sub_10000E078(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v3[2] = @"t_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v3[3] = @"unc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
  void v4[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v3[4] = @"mach";
  void v4[4] = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime"),  "unsignedLongLongValue"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL);
}

NSDictionary *__cdecl sub_10000E20C(id a1)
{
  return (NSDictionary *)&off_10002C8D8;
}

NSDictionary *sub_10000E218(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_10000E4C8(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_10000E778(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_10000EAB8(uint64_t a1)
{
  double v2 = @"src";
  double v3 = +[NSString stringWithString:]( NSString,  "stringWithString:",  [*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

uint64_t sub_10000EB58(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

NSDictionary *sub_10000EB60(uint64_t a1)
{
  v3[0] = @"t_ns";
  v4[0] = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMAbsoluteNanoTime"),  "longLongValue"));
  v3[1] = @"unc_ns";
  v4[1] = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMNanoTimeError"),  "longLongValue"));
  void v3[2] = @"before_mach";
  void v4[2] = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime"),  "unsignedLongLongValue"));
  void v3[3] = @"after_mach";
  void v4[3] = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTimeAfter"),  "unsignedLongLongValue"));
  void v3[4] = @"src";
  void v4[4] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  void v3[5] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  void v4[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL);
}

NSDictionary *sub_10000EDBC(uint64_t a1)
{
  double v2 = @"required";
  double v3 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

NSDictionary *sub_10000EE3C(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_10000EF24(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

void sub_10000F00C(void *a1)
{
  if (*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL)) {
    return;
  }
  if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL))
    {
LABEL_9:
      uint64_t v2 = 0LL;
      goto LABEL_10;
    }

LABEL_7:
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B584();
    }
    goto LABEL_9;
  }

  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL)) {
    goto LABEL_7;
  }
  uint64_t v2 = 1LL;
LABEL_10:
  (*(void (**)(void, NSDictionary *))(a1[4] + 16LL))( a1[4],  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v2),  @"TMSetupSuccessful"));
  double v3 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v4 = "failed";
    if ((_DWORD)v2) {
      __int128 v4 = "succeeded";
    }
    int v5 = 136315138;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: %s.", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
}

uint64_t sub_10000F184(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  return 0LL;
}

BOOL sub_10000F1B4(void *a1)
{
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  (*(void (**)(void))(a1[4] + 16LL))();
  return *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) == 0;
}

uint64_t sub_10000F200(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: timed out.", v4, 2u);
    }

    else {
      uint64_t v3 = *(void *)(v1 + 64);
    }
    *(_BYTE *)(*(void *)(v3 + 8) + 24LL) = 1;
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16LL))();
  }

  return result;
}

id *sub_10000F308(uint64_t a1)
{
  return sub_10000CA3C(*(id **)(a1 + 32), &__NSDictionary0__struct);
}

NSDictionary *sub_10000F318(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_10000F56C(uint64_t a1)
{
  v6[0] = @"reason";
  uint64_t v2 = *(void *)(a1 + 32);
  if (qword_1000338A8 != -1) {
    dispatch_once(&qword_1000338A8, &stru_100028F20);
  }
  id v3 = [(id)qword_1000338A0 objectForKeyedSubscript:v2];
  if (v3) {
    uint64_t v4 = (uint64_t)[v3 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 2LL;
  }
  v7[0] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4);
  v6[1] = @"src";
  v7[1] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 40) objectForKeyedSubscript:@"TMSource"]));
  v6[2] = @"rtc_s";
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  v7[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL);
}

void sub_10000F9C0(id a1)
{
  v1[0] = @"AutomaticTimeZoneEnabled";
  v1[1] = @"AirplaneMode";
  v2[0] = &off_10002C7A8;
  v2[1] = &off_10002C7C0;
  v1[2] = @"Unknown";
  v2[2] = &off_10002C7D8;
  qword_1000338A0 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v2,  v1,  3LL);
}

void sub_10000FA68(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000FA80(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000FA8C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000FA9C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id *sub_10000FAA8(id *result, id *a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      double v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
    }

    int v5 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      double v7 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TZ,fetch,src,%@", (uint8_t *)&v6, 0xCu);
    }

    return (id *)[v3[5] timeZoneManager:v3 shouldFetch:a2];
  }

  return result;
}

id *sub_10000FBB4(id *result, id *a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timeval buf = 138412290;
      double v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    int v5 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timeval buf = 138412290;
      double v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TZ,recompute,src,%@", buf, 0xCu);
    }

    int v6 = (id *)sub_10000FE24((uint64_t)v3);
    id v7 = [v3[1] objectForKeyedSubscript:a2];
    if (!v7) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  "recomputeDueToSource:",  v3,  @"TMTimeZoneManager.m",  39LL,  @"Cannot recompute based on source %@, when there is no recorded input for it.",  a2);
    }
    if ([v6 isEqualToString:a2])
    {
      [v3 setCurrentTimeZone:v7];
      id v8 = (os_log_s *)qword_100033900;
      if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = (id *)[v7 olsonName];
        *(_DWORD *)timeval buf = 138412290;
        double v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TZ,computed,result,%@", buf, 0xCu);
      }

      return (id *)[v3[5] timeZoneManager:v3 didComputeResult:v7];
    }

    else
    {
      uint64_t result = (id *)objc_msgSend(v7, "hasSameOlsonNameAs:", objc_msgSend(v3[1], "objectForKeyedSubscript:", v6));
      if ((result & 1) == 0)
      {
        if (v6 && [v3[1] objectForKeyedSubscript:v6])
        {
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472LL;
          v10[2] = sub_10000FF6C;
          v10[3] = &unk_100028F48;
          v10[4] = a2;
          void v10[5] = v7;
          v10[6] = v6;
          v10[7] = v3;
          AnalyticsSendEventLazy(@"com.apple.timed.tzInputDisagreeWithHighestSource", v10);
        }

        [v3 setCurrentTimeZone:0];
        return sub_10000FAA8(v3, v6);
      }
    }
  }

  return result;
}

uint64_t sub_10000FE24(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v2 = *(void **)(a1 + 24);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3)
  {
LABEL_10:
    id v8 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TZ,starved", v10, 2u);
    }

    return 0LL;
  }

  id v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_4:
  uint64_t v6 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(v2);
    }
    uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
    if (v4 == (id)++v6)
    {
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

NSDictionary *sub_10000FF6C(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  v9[0] = v3;
  v8[0] = @"culprit_src";
  v8[1] = @"culprit_tz";
  id v4 = [v2 olsonName];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v9[1] = v4;
  u_int v9[2] = v5;
  _DWORD v8[2] = @"highest_src";
  v8[3] = @"highest_tz";
  v9[3] = objc_msgSend(objc_msgSend(*(id *)(v6 + 8), "objectForKeyedSubscript:"), "olsonName");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL);
}

id sub_100010300(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend( objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", a1), "objectForKeyedSubscript:", @"Order"),  "compare:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", a2), "objectForKeyedSubscript:", @"Order"));
}

uint64_t sub_100010CD4(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_100010D00(uint64_t (*a1)(void), dispatch_queue_s *a2)
{
  if (!a1) {
    sub_10001B6F0();
  }
  if (off_1000338B0) {
    sub_10001B758();
  }
  off_1000338B0 = a1;
  dword_1000338C4 = IORegisterForSystemPower( 0LL,  (IONotificationPortRef *)&qword_1000338B8,  (IOServiceInterestCallback)sub_100010D9C,  &dword_1000338C0);
  if (dword_1000338C4)
  {
    uint64_t v3 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
      sub_10001B718(v3);
    }
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_1000338B8, a2);
  }

uint64_t sub_100010D9C(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t v6 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
    sub_10001B780(a3, v6);
  }
  uint64_t v7 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timeval buf = 67109120;
    int v14 = a3 & 0xFFF;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,PmCallback,msg,0x%03x", buf, 8u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100010EFC;
  v11[3] = &unk_100028F90;
  int v12 = a3;
  uint64_t result = AnalyticsSendEventLazy(@"com.apple.timed.PMCallback", v11);
  HIDWORD(v10) = a3;
  LODWORD(v10) = a3 + 536870288;
  unsigned int v9 = v10 >> 4;
  if (v9 == 11) {
    return off_1000338B0(result);
  }
  if (v9 <= 1) {
    return IOAllowPowerChange(dword_1000338C4, a4);
  }
  return result;
}

NSDictionary *sub_100010EFC(uint64_t a1)
{
  v2[0] = @"msg";
  v3[0] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(_DWORD *)(a1 + 32) & 0xFFF);
  v2[1] = @"mach";
  v3[1] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v3,  v2,  2LL);
}

uint64_t sub_100010FB0(void *a1, _OWORD *a2, int a3)
{
  id v6 = [a1 objectForKeyedSubscript:@"TMCommand"];
  if (qword_1000338D0 != -1) {
    dispatch_once(&qword_1000338D0, &stru_100028FB0);
  }
  __int128 v8 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v8;
  if ((sub_1000111E0(@"com.apple.timed", &atoken) & 1) == 0)
  {
    __int128 v9 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v9;
    audit_token_to_au32(&atoken, 0LL, euidp.val, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (euidp.val[0]) {
      return 0LL;
    }
  }

  id v10 = [a1 objectForKeyedSubscript:@"TMSource"];
  __int128 v11 = a2[1];
  *(_OWORD *)euidp.val = *a2;
  *(_OWORD *)&euidp.val[4] = v11;
  if (a3)
  {
    __int128 v12 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v12;
    if ((sub_1000111E0(@"com.apple.private.timetool", &atoken) & 1) != 0) {
      return 1LL;
    }
  }

  if ([v6 isEqualToString:@"TMSetAuthenticatedSourceTime"])
  {
    audit_token_t atoken = euidp;
    __int128 v13 = @"com.apple.private.timed.sources";
  }

  else
  {
    if (([v6 isEqualToString:@"TMSetSourceTime"] & 1) == 0
      && ![v6 isEqualToString:@"TMSetSourceTimeZone"])
    {
      return 1LL;
    }

    audit_token_t atoken = euidp;
    __int128 v13 = @"com.apple.timed.sources";
  }

  CFTypeRef v14 = sub_1000112E0(v13, &atoken);
  uint64_t v15 = v14;
  if (v14)
  {
    CFTypeID v16 = CFGetTypeID(v14);
    if (v16 != CFArrayGetTypeID())
    {
      uint64_t v18 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
        sub_10001B7F8(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      CFRelease(v15);
      return 0LL;
    }

    v28.length = CFArrayGetCount((CFArrayRef)v15);
    v28.location = 0LL;
    int v17 = CFArrayContainsValue((CFArrayRef)v15, v28, v10);
    CFRelease(v15);
    if (v17) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t sub_1000111E0(const __CFString *a1, _OWORD *a2)
{
  __int128 v3 = a2[1];
  v10[0] = *a2;
  v10[1] = v3;
  CFTypeRef v4 = sub_1000112E0(a1, v10);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFBooleanGetTypeID() && CFEqual(v5, kCFBooleanTrue))
  {
    uint64_t v7 = 1LL;
  }

  else
  {
    __int128 v8 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
      sub_10001B82C((uint64_t)a1, v8);
    }
    uint64_t v7 = 0LL;
  }

  CFRelease(v5);
  return v7;
}

void sub_10001129C(id a1)
{
  qword_1000338C8 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"TMIsAutomaticTimeEnabled",  @"TMIsAutomaticTimeZoneEnabled",  0LL);
}

CFTypeRef sub_1000112E0(const __CFString *a1, _OWORD *a2)
{
  __int128 v3 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v3;
  CFTypeRef v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v4)
  {
    uint64_t v5 = v4;
    CFErrorRef error = 0LL;
    CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a1, &error);
    CFErrorRef v7 = error;
    if (error)
    {
      __int128 v8 = (os_log_s *)qword_1000338F8;
      if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT)
        || (token.val[0] = 138412290,
            *(void *)&token.val[1] = v7,
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SecTaskCopyValueForEntitlement failed with error: %@",  (uint8_t *)&token,  0xCu),  (CFErrorRef v7 = error) != 0LL))
      {
        CFRelease(v7);
      }
    }

    CFRelease(v5);
  }

  else
  {
    __int128 v9 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
      sub_10001B8A0(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0LL;
  }

  return v6;
}

void sub_100011804(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  double v15 = 0.0;
  uint64_t v16 = 0LL;
  double v3 = sub_10000796C(*(void *)(*(void *)(a1 + 32) + 32LL), *(void *)(a1 + 56));
  if (v3 > 0.0
    && (uint64_t v4 = *(void *)(a1 + 32), v3 < *(double *)(v4 + 56))
    && [(id)v4 isMachTimeValid:*(void *)(v4 + 32)])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v5 + 32);
    double v15 = *(double *)(v5 + 40);
    double v6 = *(double *)(v5 + 24);
  }

  else
  {
    double v6 = sub_1000070E4(&v16, &v15);
    CFErrorRef v7 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timeval buf = 134218496;
      double v18 = v6;
      __int16 v19 = 2048;
      double v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cmd,SYNC,rtc_s,%.9f,unc_s,%.9f,mach,%llu",  buf,  0x20u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_100011A34;
    v14[3] = &unk_1000291B0;
    *(double *)&v14[4] = v6;
    void v14[5] = v16;
    AnalyticsSendEventLazy(@"com.apple.timed.monotonicTimeForMachTime", v14);
    *(double *)(*(void *)(a1 + 32) + 24LL) = v6;
    *(void *)(*(void *)(a1 + 32) + 32LL) = v16;
    *(double *)(*(void *)(a1 + 32) + 40LL) = v15;
  }

  double v8 = -1.0;
  if (v6 >= 0.0)
  {
    unsigned int v10 = [*(id *)(a1 + 32) isMachTimeValid:*(void *)(a1 + 56)];
    double v9 = -1.0;
    if (v10)
    {
      double v11 = sub_10000796C(*(void *)(a1 + 56), v16);
      double v8 = v6 - v11;
      double v9 = v15 + fabs(v11) * 0.00002;
    }
  }

  else
  {
    double v9 = -1.0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011AE0;
  block[3] = &unk_1000291D8;
  uint64_t v12 = *(dispatch_queue_s **)(a1 + 40);
  block[4] = *(void *)(a1 + 48);
  *(double *)&block[5] = v8;
  *(double *)&block[6] = v9;
  dispatch_async(v12, block);
  objc_autoreleasePoolPop(v2);
}

NSDictionary *sub_100011A34(uint64_t a1)
{
  v3[0] = @"rtc_s";
  v4[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32));
  v3[1] = @"mach";
  v4[1] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

void sub_100011AE0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16LL))(*(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

void sub_100011E68(id a1)
{
  qword_1000338E0 = 2LL;
  if (sysctlnametomib("machdep.wake_abstime", (int *)&unk_1000338D8, (size_t *)&qword_1000338E0))
  {
    uint64_t v1 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Could not get mib for machdep.wake_abstime, falling back to kern.wake_abs_time.",  v10,  2u);
    }

    if (sysctlnametomib("kern.wake_abs_time", (int *)&unk_1000338D8, (size_t *)&qword_1000338E0))
    {
      uint64_t v2 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001B908(v2, v3, v4, v5, v6, v7, v8, v9);
      }
      qword_1000338E0 = 0LL;
    }
  }

NSDictionary *sub_100011F3C(uint64_t a1)
{
  uint64_t v2 = @"mach";
  uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 32));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

uint64_t sub_100011FF8()
{
  qword_1000338F8 = (uint64_t)os_log_create("com.apple.timed", "text");
  BOOL v0 = os_log_create("com.apple.timed", "data");
  qword_100033900 = (uint64_t)v0;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timeval buf = 136315394;
    double v18 = "334.0.2";
    __int16 v19 = 2080;
    double v20 = &unk_10002137D;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "cmd,build,version,%s,git,%s", buf, 0x16u);
    BOOL v0 = (os_log_s *)qword_100033900;
  }

  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    pid_t v1 = getpid();
    *(_DWORD *)timeval buf = 67109120;
    LODWORD(v1_Block_object_dispose((const void *)(v1 - 128), 8) = v1;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "cmd,process,pid,%d", buf, 8u);
  }

  uint64_t v2 = -[NSUserDefaults persistentDomainForName:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "persistentDomainForName:",  @"com.apple.timed");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v13,  v23,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (os_log_s *)qword_100033900;
        if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v9 = -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8);
          *(_DWORD *)timeval buf = 138412802;
          double v18 = @"com.apple.timed";
          __int16 v19 = 2112;
          double v20 = v8;
          __int16 v21 = 2112;
          id v22 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cmd,default,d,%@,k,%@,v,%@",  buf,  0x20u);
        }
      }

      id v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v13,  v23,  16LL);
    }

    while (v4);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000122EC;
  v12[3] = &unk_100028BA0;
  v12[4] = v2;
  AnalyticsSendEventLazy(@"com.apple.timed.startupDefaults", v12);
  unsigned int v10 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)timeval buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cmd,start", buf, 2u);
  }

  return AnalyticsSendEventLazy(@"com.apple.timed.start", &stru_100029288);
}

uint64_t sub_1000122EC(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

NSDictionary *__cdecl sub_1000122F4(id a1)
{
  v2[0] = @"pid";
  v2[1] = @"mach";
  v3[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
  v3[1] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v3,  v2,  2LL);
}

void sub_1000129FC(_Unwind_Exception *a1)
{
}

void sub_100012A18()
{
  int v1 = v0;
  objc_begin_catch(v2);
  if (v1 == 2) {
    sub_10001B93C();
  }
  JUMPOUT(0x100012978LL);
}

void sub_100012AC8(uint64_t a1)
{
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  uint64_t v2 = *(void **)(a1 + 88);
  objc_sync_enter(v2);
  if ([(id)a1 reachabilityTransaction])
  {
    id v3 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "We are already waiting on the network",  (uint8_t *)&buf,  2u);
    }

    objc_sync_exit(v2);
    return;
  }

  *(void *)(a1 + 104) = os_transaction_create("waitForNetworkBeyondWantedThreshold");
  objc_sync_exit(v2);
  id v4 = [*(id *)(a1 + 72) NTPServerAddress];
  if (*(void *)(a1 + 8))
  {
    uint64_t v5 = *(const void **)(a1 + 8);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 112);
    LODWORD(buf.version) = 134218242;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v5;
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Creating new reachability target. target:%p _address:%@",  (uint8_t *)&buf,  0x16u);
    uint64_t v5 = *(const void **)(a1 + 8);
  }

  if (v5) {
    CFRelease(v5);
  }
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 128), 8) = SCNetworkReachabilityCreateWithName(0, (const char *)[v4 UTF8String]);
  [(id)a1 setAddress:v4];
LABEL_16:
  uint64_t v8 = *(const __SCNetworkReachability **)(a1 + 8);
  if (v8)
  {
    SCNetworkReachabilityFlags flags = 0;
    if (SCNetworkReachabilityGetFlags(v8, &flags))
    {
      SCNetworkReachabilityFlags v9 = flags;
      unsigned int v10 = (os_log_s *)qword_1000338F8;
      if ((flags & 6) == 2)
      {
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Current reachability flags are %u. So, I'm going to try for NTP now!",  (uint8_t *)&buf,  8u);
          SCNetworkReachabilityFlags v9 = flags;
        }

        double v11 = *(dispatch_queue_s **)(a1 + 24);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100012E8C;
        v12[3] = &unk_100029320;
        v12[4] = a1;
        SCNetworkReachabilityFlags v13 = v9;
        dispatch_async(v11, v12);
        return;
      }

      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.version) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "We want time and don't have network! Keeping timed alive until network comes up, since we are beyond our wanted threshold.",  (uint8_t *)&buf,  2u);
      }

      buf.version = 0LL;
      buf.mach_timebase_info info = (void *)a1;
      buf.retain = (const void *(__cdecl *)(const void *))&CFRetain;
      buf.release = (void (__cdecl *)(const void *))sub_100012E80;
      buf.copyDescription = 0LL;
      if (SCNetworkReachabilitySetCallback( *(SCNetworkReachabilityRef *)(a1 + 8),  (SCNetworkReachabilityCallBack)sub_100012E98,  &buf))
      {
        if (SCNetworkReachabilitySetDispatchQueue( *(SCNetworkReachabilityRef *)(a1 + 8),  *(dispatch_queue_t *)(a1 + 24)))
        {
          return;
        }

        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001BBC4();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
      {
        sub_10001BB50();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001BADC();
    }

    [(id)a1 setReachabilityTransaction:0];
    return;
  }

  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
    sub_10001BA6C();
  }
  [(id)a1 setReachabilityTransaction:0];
}

void sub_100012E64(_Unwind_Exception *a1)
{
}

void sub_100012E80(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_100012E8C(uint64_t a1)
{
}

void sub_100012E98(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TMBackgroundNtpSource);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0) {
    sub_10001BC38();
  }
  uint64_t v6 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)SCNetworkReachabilityContext buf = 67109120;
    int v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reachability changed to flags:%u", buf, 8u);
  }

  if ((a2 & 6) == 2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100014690;
    void v7[3] = &unk_100028F90;
    int v8 = a2;
    AnalyticsSendEventLazy(@"com.apple.timed.proactiveNTPTime", v7);
    sub_1000132C8(a3);
  }

void sub_100012FB8(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v4 = os_transaction_create("_executeNTPJob");
    xpc_retain(a2);
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013044;
    block[3] = &unk_100029348;
    block[4] = a2;
    block[5] = a1;
    block[6] = v4;
    dispatch_async(v5, block);
  }

void sub_100013044(uint64_t a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  xpc_activity_state_t v3 = state;
  if (state == 5 || state == 2)
  {
    uint64_t v5 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      xpc_activity_state_t v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "NTP job satisfied, state: %lu",  (uint8_t *)&v13,  0xCu);
    }

    if (([*(id *)(a1 + 40) isFetchingTime] & 1) == 0)
    {
      sub_100012AC8(*(void *)(a1 + 40));
      goto LABEL_15;
    }

    uint64_t v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      uint64_t v7 = "Already fetching NTP.";
      int v8 = (os_log_s *)v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v13, v10);
    }
  }

  else
  {
    uint64_t v11 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      xpc_activity_state_t v14 = v3;
      uint64_t v7 = "Received unknown job status %lu";
      int v8 = (os_log_s *)v11;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
      goto LABEL_13;
    }
  }

LABEL_15:
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

unint64_t sub_100013244()
{
  v4.tv_sec += 2208988800LL;
  unsigned int v0 = sntp_datestamp_from_timespec(v4.tv_sec, v4.tv_nsec);
  unint64_t v2 = sntp_timestamp_from_datestamp(v0, v1);
  return (dword_1000338F0 + v2) | ((unint64_t)(dword_1000338F4 + HIDWORD(v2)) << 32);
}

double sub_1000132A4(unsigned int a1)
{
  return (double)(unsigned __int16)a1 * 0.0000152587891 + (double)HIWORD(a1);
}

id sub_1000132C8(id result)
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)result + 3));
    uint64_t result = [v1 isFetchingTime];
    if ((result & 1) == 0)
    {
      [v1 setFetchingTime:1];
      objc_msgSend(objc_msgSend(v1, "clock"), "coarseMonotonicTime");
      objc_msgSend(v1, "setLastFetchAttempt:");
      id v59 = objc_msgSend(objc_msgSend(v1, "clock"), "machTime");
      unint64_t v2 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)SCNetworkReachabilityContext buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Fetching NTP time.", buf, 2u);
      }

      __int128 v80 = xmmword_10001FCE0;
      uint64_t v3 = IOPMAssertionCreateWithDescription( @"NoIdleSleepAssertion",  @"com.apple.timed.ntp",  0LL,  0LL,  0LL,  110.0,  @"TimeoutActionTurnOff",  &AssertionID);
      if (!(_DWORD)v3) {
        goto LABEL_9;
      }
      uint64_t v4 = v3;
      uint64_t v5 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001BD88(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      if (([v1[9] shouldPowerAssertionsBeOptional] & 1) == 0)
      {
        return [v1 setReachabilityTransaction:0];
      }

      else
      {
LABEL_9:
        int v63 = [v1[9] NTPUseServicePort];
        __int16 v58 = (const char *)objc_msgSend(objc_msgSend(v1[9], "NTPServerAddress"), "UTF8String");
        int v62 = objc_msgSend(objc_msgSend(v1[9], "NTPServerPort"), "intValue");
        uint64_t v12 = calloc(3uLL, 0x50uLL);
        uint64_t v13 = 0LL;
        xpc_activity_state_t v14 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
        __int128 v15 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
        *(void *)&__int128 v16 = 67109378LL;
        __int128 v56 = v16;
        uint64_t v57 = (uint64_t)v1;
        while (1)
        {
          v14[572] = arc4random();
          v15[573] = arc4random();
          sntp_client_unicast(v58, v13, v62, (timeval *)&v80, (uint64_t (*)(void))sub_100013244, v63, (uint64_t)&v74);
          if ((_DWORD)v74)
          {
            int v17 = (os_log_s *)qword_1000338F8;
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
            {
              int v43 = *__error();
              __int16 v44 = __error();
              double v45 = strerror(*v44);
              *(_DWORD *)SCNetworkReachabilityContext buf = v56;
              *(_DWORD *)uint64_t v82 = v43;
              *(_WORD *)&v82[4] = 2080;
              *(void *)&v82[6] = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "errno is %d %s", buf, 0x12u);
            }
          }

          int v18 = v14[572];
          int v19 = v15[573];
          DWORD1(v74) -= v18;
          DWORD2(v74) -= v19;
          HIDWORD(v75) -= v18;
          LODWORD(v76) = v76 - v19;
          uint64_t v61 = mach_absolute_time();
          unsigned int v20 = objc_msgSend(objc_msgSend(v1, "clock"), "isMachTimeValid:", v59);
          uint64_t v21 = sntp_calc_delay((uint64_t)&v74);
          double v23 = sntp_datestamp_to_double(v21, v22);
          unint64_t v24 = sntp_calc_mean((uint64_t)&v74);
          uint64_t v26 = sntp_datestamp_to_timeval(v24, v25);
          uint64_t v28 = v27;
          unint64_t v60 = v60 & 0xFFFFFFFF00000000LL | HIDWORD(v76);
          unint64_t v29 = sntp_timestamp_from_shortstamp(SHIDWORD(v76));
          uint64_t v30 = sntp_timestamp_to_datestamp(v29);
          double v32 = sntp_datestamp_to_double(v30, v31);
          sntp_exchange_ntop(v96, 0x2Eu, (uint64_t)&v74);
          uint64_t v33 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v96);
          __int16 v34 = (os_log_s *)qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = 67112448;
            *(_DWORD *)uint64_t v82 = v74;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = DWORD1(v74);
            *(_WORD *)&v82[10] = 1024;
            *(_DWORD *)&v82[12] = DWORD2(v74);
            *(_WORD *)&v82[16] = 1024;
            *(_DWORD *)&v82[18] = HIDWORD(v74);
            LOWORD(v83) = 1024;
            *(_DWORD *)((char *)&v83 + 2) = v75;
            HIWORD(v83) = 1024;
            *(_DWORD *)double v84 = DWORD1(v75);
            *(_WORD *)&v84[4] = 1024;
            *(_DWORD *)&v84[6] = DWORD2(v75);
            __int16 v85 = 1024;
            *(_DWORD *)int v86 = HIDWORD(v75);
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = v76;
            LOWORD(v87) = 1024;
            *(_DWORD *)((char *)&v87 + 2) = BYTE4(v76) >> 6;
            HIWORD(v87) = 1024;
            *(_DWORD *)uint64_t v88 = WORD4(v76);
            *(_WORD *)&v88[4] = 1024;
            *(_DWORD *)v89 = WORD5(v76);
            *(_WORD *)&v89[4] = 1024;
            *(_DWORD *)&v89[6] = WORD6(v76);
            __int16 v90 = 1024;
            int v91 = HIWORD(v76);
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "cmd,ntpPacket,result,%d,t1,%x.%x,t2,%x.%x,t3,%x.%x,t4,%x.%x,leap,%02x,delay,%02hx.%02hx,dispersion,%02hx.%02hx,",  buf,  0x56u);
            __int16 v34 = (os_log_s *)qword_100033900;
          }

          uint64_t v35 = v26 - 2208988800LL;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = 67111938;
            *(_DWORD *)uint64_t v82 = v13;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = v74;
            *(_WORD *)&v82[10] = 2048;
            *(void *)&v82[12] = v61;
            *(_WORD *)&v82[20] = 2048;
            uint64_t v83 = v35;
            *(_WORD *)double v84 = 2048;
            *(void *)&v84[2] = (int)v28;
            __int16 v85 = 2048;
            *(double *)int v86 = v23;
            *(_WORD *)&v86[8] = 2048;
            double v87 = v32;
            *(_WORD *)uint64_t v88 = 1024;
            *(_DWORD *)&v88[2] = 1;
            *(_WORD *)v89 = 2080;
            *(void *)&v89[2] = v96;
            __int16 v90 = 1024;
            int v91 = v62;
            __int16 v92 = 1024;
            int v93 = v20 ^ 1;
            __int16 v94 = 1024;
            int v95 = v63;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "cmd,fetchTime,num,%d,result,%d,mach,%llu,tv_sec,%lld,tv_usec,%lld,delay,%lf,dispersion,%lf,more,%d,ip,%s,p ort,%d,slept,%d,use_service_port,%d",  buf,  0x62u);
          }

          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = sub_100013A7C;
          v64[3] = &unk_100029370;
          __int128 v68 = v76;
          __int128 v69 = v77;
          __int128 v70 = v78;
          __int128 v66 = v74;
          __int128 v67 = v75;
          v64[6] = v35;
          v64[7] = v28;
          *(double *)&v64[8] = v23;
          *(double *)&v64[9] = v32;
          v64[4] = v33;
          v64[5] = v61;
          int v65 = v13;
          int v71 = v62;
          char v72 = v20 ^ 1;
          char v73 = v63;
          AnalyticsSendEventLazy(@"com.apple.timed.SNTP", v64);
          if ((v20 & 1) == 0) {
            break;
          }
          __int128 v36 = v77;
          v12[2] = v76;
          v12[3] = v36;
          v12[4] = v78;
          __int128 v37 = v75;
          _OWORD *v12 = v74;
          v12[1] = v37;
          uint64_t v1 = (id *)v57;
          xpc_activity_state_t v14 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
          __int128 v15 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
          if (v74 > 0xA || ((1 << v74) & 0x507) == 0)
          {
            uint64_t v38 = *(void *)(v57 + 96);
            *(void *)(v57 + 96) = v38 + 1;
            if (v38 >= (uint64_t)objc_msgSend(*(id *)(v57 + 72), "NTPServicePortMaxRetries", v56))
            {
              id v39 = (os_log_s *)qword_1000338F8;
              if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v40 = *(void *)(v57 + 96);
                unsigned int v41 = [*(id *)(v57 + 72) NTPUseServicePort];
                *(_DWORD *)SCNetworkReachabilityContext buf = 134218242;
                __int16 v42 = "high";
                if (v41) {
                  __int16 v42 = "low";
                }
                *(void *)uint64_t v82 = v40;
                *(_WORD *)&v82[8] = 2080;
                *(void *)&v82[10] = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "NTP failed %lld times, switching off of %s source port.",  buf,  0x16u);
              }

              *(void *)(v57 + 96) = 0LL;
              objc_msgSend( *(id *)(v57 + 72),  "setNTPUseServicePort:",  objc_msgSend(*(id *)(v57 + 72), "NTPUseServicePort") ^ 1);
            }
          }

          ++v13;
          v12 += 5;
          if (v13 == 3) {
            return objc_msgSend( objc_msgSend(v1, "clock", v56),  "montonicTimeForMachTime:toQueue:withCompletionHandler:");
          }
        }

        __int16 v46 = (os_log_s *)qword_1000338F8;
        uint64_t v1 = (id *)v57;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001BD4C(v46);
        }
        objc_msgSend((id)v57, "setFetchingTime:", 0, v56);
        uint64_t v47 = IOPMAssertionRelease(AssertionID);
        if ((_DWORD)v47)
        {
          uint64_t v48 = v47;
          v49 = (os_log_s *)qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001BCE8(v48, v49, v50, v51, v52, v53, v54, v55);
          }
        }

        sub_100013C34(v57);
        return objc_msgSend(objc_msgSend(v1, "clock", v56), "montonicTimeForMachTime:toQueue:withCompletionHandler:");
      }
    }
  }

  return result;
}

NSDictionary *sub_100013A7C(uint64_t a1)
{
  v5[0] = @"num";
  v6[0] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 80));
  v5[1] = @"result";
  v6[1] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 84));
  v5[2] = @"mach";
  v6[2] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40));
  v5[3] = @"tv_sec";
  void v6[3] = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", *(void *)(a1 + 48));
  v5[4] = @"tv_usec";
  v6[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56));
  void v5[5] = @"delay";
  void v6[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64));
  v5[6] = @"dispersion";
  unint64_t v2 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  v6[6] = v2;
  v6[7] = v3;
  v5[7] = @"ip";
  v5[8] = @"port";
  v6[8] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 164));
  v5[9] = @"slept";
  v6[9] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 168));
  v5[10] = @"use_service_port";
  v6[10] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 169));
  v5[11] = @"ipv6";
  v6[11] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(_DWORD *)(a1 + 160) == 30);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  12LL);
}

void sub_100013C34(uint64_t a1)
{
  if (a1)
  {
    if ((uint64_t)[(id)a1 burstRetryCount] < 1)
    {
      uint64_t v6 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Done bursting", v7, 2u);
        uint64_t v6 = (os_log_s *)qword_1000338F8;
      }

      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Finishing transaction after unsuccessful exchange",  v7,  2u);
      }

      [(id)a1 setReachabilityTransaction:0];
      [*(id *)(a1 + 80) checkActiveTimeSourceRequired];
    }

    else
    {
      objc_msgSend((id)a1, "setBurstRetryCount:", (char *)objc_msgSend((id)a1, "burstRetryCount") - 1);
      uint64_t v2 = os_transaction_create("TMBackgroundNtpSource retry");
      [*(id *)(a1 + 72) NTPBurstRetryInterval];
      dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(v3 * 1000000000.0));
      uint64_t v5 = *(dispatch_queue_s **)(a1 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100014030;
      block[3] = &unk_100028E18;
      block[4] = a1;
      block[5] = v2;
      dispatch_after(v4, v5, block);
    }
  }

void sub_100013D88(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = mach_absolute_time();
  unint64_t v7 = sntp_clock_select(*(void *)(a1 + 40), *(_DWORD *)(a1 + 56));
  if (a2 <= 0.0 || v7 == 0)
  {
    sub_100013C34(*(void *)(a1 + 32));
  }

  else
  {
    uint64_t v9 = v7;
    unint64_t v10 = *(void *)(a1 + 48);
    if (v6 <= v10) {
      sub_10001BDEC();
    }
    double v11 = sub_100007998(v10, v6) + a2;
    uint64_t v12 = sntp_calc_error(v9);
    double v14 = sntp_datestamp_to_double(v12, v13);
    uint64_t v15 = sntp_calc_delay(v9);
    double v17 = v14 + sntp_datestamp_to_double(v15, v16) + a3;
    uint64_t v18 = sntp_calc_mean(v9);
    v31[0] = @"TMCommand";
    v31[1] = @"TMSource";
    v32[0] = @"TMSetSourceTime";
    v32[1] = @"NTP";
    v31[2] = @"TMCurrentTime";
    v32[2] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sntp_datestamp_to_double(v18, v19) - (kCFAbsoluteTimeIntervalSince1970 + 2208988800.0));
    v31[3] = @"TMTimeError";
    v32[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17);
    v31[4] = @"TMMachTime";
    v32[4] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6);
    v31[5] = @"TMRtcTime";
    void v32[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11);
    objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "setSourceTime:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  6));
    [*(id *)(a1 + 32) setBurstRetryCount:0];
    SCNetworkReachabilitySetCallback(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 8LL), 0LL, 0LL);
    SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 8LL), 0LL);
    unsigned int v20 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Finishing transaction after successful exchange",  v30,  2u);
    }

    [*(id *)(a1 + 32) setReachabilityTransaction:0];
  }

  [*(id *)(a1 + 32) setFetchingTime:0];
  free(*(void **)(a1 + 40));
  uint64_t v21 = IOPMAssertionRelease(*(_DWORD *)(a1 + 60));
  if ((_DWORD)v21)
  {
    uint64_t v22 = v21;
    double v23 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001BCE8(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

void sub_100014030(uint64_t a1)
{
}

double sub_1000144E0(void *a1)
{
  double v1 = 0.0;
  if (a1)
  {
    [a1 lastFetchAttempt];
    if (v3 >= 0.1)
    {
      objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
      double v5 = v4;
      [a1 lastFetchAttempt];
      double v7 = v5 - v6;
      [a1 schedulingInterval];
      double v9 = v8 - v7;
      if (v9 >= 0.0) {
        return v9;
      }
      else {
        return 0.0;
      }
    }
  }

  return v1;
}

void sub_100014558(uint64_t a1)
{
}

double sub_100014560(void *a1)
{
  double v1 = 0.0;
  if (a1)
  {
    [a1 lastReschedule];
    if (v3 >= 0.1)
    {
      objc_msgSend(objc_msgSend(a1, "clock"), "coarseMonotonicTime");
      double v5 = v4;
      [a1 lastReschedule];
      double v7 = v6 - v5 + 300.0;
      if (v7 >= 0.0) {
        return v7;
      }
      else {
        return 0.0;
      }
    }
  }

  return v1;
}

void sub_1000145D8(uint64_t a1, void *a2)
{
}

NSDictionary *sub_100014690(uint64_t a1)
{
  uint64_t v2 = @"networkReachabilityFlags";
  double v3 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

void sub_100014710( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100014724( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

NSDictionary *sub_100015578(uint64_t a1)
{
  v4[0] = @"clamp_difference";
  double v2 = *(double *)(a1 + 40);
  if (v2 >= 0.0) {
    double v2 = *(double *)(a1 + 48);
  }
  v5[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(v2));
  v4[1] = @"src";
  v5[1] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8(*(void *)(a1 + 32)));
  void v4[2] = @"input_unc";
  v5[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 56));
  void v4[3] = @"estimate_unc";
  v5[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  4LL);
}

uint64_t sub_100015BBC(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

id *sub_100015CA8(id *result)
{
  if (!result) {
    return result;
  }
  double v1 = result;
  id v2 = [result[1] objectForKey:@"TMAutomaticTimeEnabled"];
  if (v2)
  {
    id v3 = v2;
    double v4 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
      id v24 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating old coupled value (%@)\n",  buf,  0xCu);
    }

    id v5 = [v1[1] objectForKey:@"TMAutomaticTimeZoneEnabled"];
    id v6 = [v1[1] objectForKey:@"TMAutomaticTimeOnlyEnabled"];
    if (v5)
    {
      double v7 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
        id v24 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Time zone key present (%@), not migrating\n",  buf,  0xCu);
      }

      if (v6) {
        goto LABEL_9;
      }
    }

    else
    {
      [v1[1] setObject:v3 forKey:@"TMAutomaticTimeZoneEnabled"];
      if (v6)
      {
LABEL_9:
        double v8 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001BE14((uint64_t)v6, v8);
        }
        goto LABEL_13;
      }
    }

    [v1[1] setObject:v3 forKey:@"TMAutomaticTimeOnlyEnabled"];
LABEL_13:
    [v1[1] removeObjectForKey:@"TMAutomaticTimeEnabled"];
    [v1[1] synchronize];
  }

  v22[0] = &__kCFBooleanTrue;
  v22[1] = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( v1,  "isAppleTV",  @"TMAutomaticTimeOnlyEnabled",  @"TMAutomaticTimeZoneEnabled") ^ 1);
  v21[2] = @"NtpSchedulingInterval";
  unsigned int v9 = [v1 isAppleTV];
  double v10 = 900.0;
  if (v9) {
    double v10 = 10.0;
  }
  v22[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10);
  void v21[3] = @"NtpBurstRetryAttempts";
  else {
    uint64_t v11 = 3LL;
  }
  v22[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11);
  v22[4] = &off_10002C288;
  v21[4] = @"NtpBurstRetryInterval";
  v21[5] = @"NtpUnsetSchedulingInterval";
  unsigned int v12 = [v1 isAppleTV];
  double v13 = 300.0;
  if (v12) {
    double v13 = 10.0;
  }
  v22[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13);
  v22[6] = &__kCFBooleanTrue;
  v21[6] = @"NtpUseServicePort";
  v21[7] = @"NtpServicePortMaxRetries";
  v22[7] = &off_10002C808;
  v22[8] = @"123";
  uint8_t v21[8] = @"NtpTimeServerPort";
  v21[9] = @"FetchTimeOnWake";
  v22[9] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isMac]);
  v21[10] = @"UseFilesystemTimestamp";
  v22[10] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_100006CF4());
  v22[11] = &off_10002C278;
  v21[11] = @"SettimeofdayThreshold";
  v21[12] = @"TimeProvider";
  v22[12] = @"Filtered";
  v21[13] = @"RTCWakeUncertainty";
  int v14 = sub_100006CF4();
  double v15 = 0.5;
  if (v14) {
    double v15 = 0.0;
  }
  v22[13] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15);
  v21[14] = @"CommandHistorySize";
  else {
    uint64_t v16 = 0LL;
  }
  v22[14] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16);
  v21[15] = @"RTCMachSyncInterval";
  v22[15] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100006DA4() * 5.0);
  v21[16] = @"RTCFrequencyTolerance";
  unsigned int v17 = [v1 isWatch];
  double v18 = 0.00003;
  if (v17) {
    double v18 = 0.000008;
  }
  v22[16] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18);
  v21[17] = @"RTCFrequencyNoiseDensity";
  unsigned int v19 = [v1 isWatch];
  double v20 = 2.78e-14;
  if (v19) {
    double v20 = 2.78e-16;
  }
  v22[17] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20);
  objc_msgSend( v1[1],  "registerDefaults:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  18));
  return (id *)objc_msgSend(v1, "setAccurateThresholds:", objc_msgSend(v1, "shouldUseAccurateThresholdsByDefault"));
}

CFStringRef sub_100016474(uint64_t a1)
{
  if (a1) {
    return @"time.apple.com";
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10001682C(uint64_t a1, void *a2)
{
  if (([a2 isEqualToString:@"TimeSourceGnssValidPos"] & 1) != 0
    || ([a2 isEqualToString:@"GPS"] & 1) != 0
    || ([a2 isEqualToString:@"TimeSourceGnss"] & 1) != 0
    || ([a2 isEqualToString:@"NTP"] & 1) != 0)
  {
    return 1LL;
  }

  else
  {
    return (uint64_t)[a2 isEqualToString:@"TMLSSourceComputedReliable"];
  }

uint64_t sub_100016C14(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    id v4 = [a1 lastQualityTime];
    if (v4)
    {
      objc_msgSend(a2, "utc_s");
      double v6 = v5;
      objc_msgSend(v4, "utc_s");
      double v8 = vabdd_f64(v6, v7);
      double v9 = *(double *)(v2 + 96);
      objc_msgSend(v4, "utcUnc_s");
      double v11 = v10 + v8 * v9;
      objc_msgSend(a2, "rtc_s");
      double v13 = v12;
      objc_msgSend(v4, "rtc_s");
      double v15 = v13 - v14;
      objc_msgSend(a2, "utc_s");
      double v17 = v16;
      objc_msgSend(v4, "utc_s");
      if (vabdd_f64(v15, v17 - v18) <= v11 * 5.0)
      {
        uint64_t v2 = 1LL;
LABEL_9:

        return v2;
      }

      unsigned int v19 = (os_log_s *)qword_100033900;
      if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(v2 + 128);
        objc_msgSend(a2, "rtc_s");
        uint64_t v22 = v21;
        objc_msgSend(a2, "utc_s");
        uint64_t v24 = v23;
        objc_msgSend(a2, "utcUnc_s");
        uint64_t v26 = v25;
        objc_msgSend(v4, "rtc_s");
        uint64_t v28 = v27;
        objc_msgSend(v4, "utc_s");
        uint64_t v30 = v29;
        objc_msgSend(v4, "utcUnc_s");
        int v33 = 138414082;
        uint64_t v34 = v20;
        __int16 v35 = 2048;
        uint64_t v36 = v22;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v26;
        __int16 v41 = 2048;
        uint64_t v42 = v28;
        __int16 v43 = 2048;
        uint64_t v44 = v30;
        __int16 v45 = 2048;
        uint64_t v46 = v31;
        __int16 v47 = 2112;
        id v48 = [v4 source];
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@,BadReliability,rtc,%.6lf,utc,%.6lf,unc,%.6lf,Rtc,%.6lf,Utc,%.6lf,Unc,%.6lf,Src,%@",  (uint8_t *)&v33,  0x52u);
      }

      [(id)v2 displayLastQualityTime];
    }

    uint64_t v2 = 0LL;
    goto LABEL_9;
  }

  return v2;
}

id sub_100016E14(id result, void *a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t result = (id)sub_10001682C((uint64_t)TMTimeSynthesizer, [a2 source]);
    if ((_DWORD)result) {
      return [v3 setLastQualityTime:a2];
    }
  }

  return result;
}

TMTimeSynthesizerStates *sub_1000170F0(uint64_t a1, double a2)
{
  if (!a1 || !*(_BYTE *)(a1 + 120)) {
    return 0LL;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___TMTimeSynthesizerStates);
  double v5 = a2 - *(double *)(a1 + 8);
  -[TMTimeSynthesizerStates setRtc:](v4, "setRtc:", a2);
  -[TMTimeSynthesizerStates setUtc:](v4, "setUtc:", *(double *)(a1 + 16) + *(double *)(a1 + 24) * v5);
  -[TMTimeSynthesizerStates setRateSf:](v4, "setRateSf:", *(double *)(a1 + 24));
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  else {
    double v6 = -v5;
  }
  double v7 = *(double *)(a1 + 88);
  double v8 = v6 * v6 * v7 * 0.5;
  double v9 = v6 * v7;
  -[TMTimeSynthesizerStates setUtc_var:]( v4,  "setUtc_var:",  v6 * (v6 * v6) * v7 / 3.0 + *(double *)(a1 + 48)
  + (*(double *)(a1 + 64) + *(double *)(a1 + 64)) * v6
  + *(double *)(a1 + 56) * (v6 * v6));
  -[TMTimeSynthesizerStates setUtc_sf_cov:](v4, "setUtc_sf_cov:", v8 + *(double *)(a1 + 64) + *(double *)(a1 + 56) * v6);
  -[TMTimeSynthesizerStates setSf_var:](v4, "setSf_var:", v9 + *(double *)(a1 + 56));
  return v4;
}

void *sub_1000172E0(void *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    result[9] = 0LL;
    objc_msgSend(a2, "rtc_s");
    *((void *)v3 + 1) = v4;
    objc_msgSend(a2, "utc_s");
    *((void *)v3 + 2) = v5;
    objc_msgSend(a2, "utcUnc_s");
    double v7 = v6;
    objc_msgSend(a2, "utcUnc_s");
    *((double *)v3 + 6) = v7 * v8;
    double v9 = *((double *)v3 + 12);
    if (v9 < 0.00001) {
      *((void *)v3 + 3) = 0x3FF0000000000000LL;
    }
    *((double *)v3 + 7) = v9 * v9;
    *((void *)v3 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    *((_BYTE *)v3 + 120) = 1;
    *((_DWORD *)v3 + 26) = 1;
    objc_msgSend(v3, "setLastInputSource:", objc_msgSend(a2, "source"));
    double v10 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *((void *)v3 + 16);
      uint64_t v12 = *((void *)v3 + 1);
      uint64_t v13 = *((void *)v3 + 2);
      double v14 = sqrt(*((double *)v3 + 6));
      uint64_t v15 = *((void *)v3 + 3);
      double v16 = sqrt(*((double *)v3 + 7));
      double v17 = sqrt(*((double *)v3 + 8));
      double v18 = log10(*((double *)v3 + 11));
      objc_msgSend(a2, "rtc_s");
      uint64_t v20 = v19;
      objc_msgSend(a2, "utc_s");
      uint64_t v22 = v21;
      objc_msgSend(a2, "utcUnc_s");
      uint64_t v24 = v23;
      id v25 = [a2 source];
      uint64_t v26 = *((void *)v3 + 2);
      uint64_t v27 = *((void *)v3 + 3);
      double v28 = *((double *)v3 + 7);
      double v29 = sqrt(*((double *)v3 + 6));
      int v30 = *((_DWORD *)v3 + 26);
      *(_DWORD *)SCNetworkReachabilityContext buf = 138416386;
      uint64_t v33 = v11;
      __int16 v34 = 2048;
      uint64_t v35 = v12;
      __int16 v36 = 2048;
      uint64_t v37 = v13;
      __int16 v38 = 2048;
      double v39 = v14;
      __int16 v40 = 2048;
      uint64_t v41 = v15;
      __int16 v42 = 2048;
      double v43 = v16;
      __int16 v44 = 2048;
      double v45 = v17;
      __int16 v46 = 2048;
      double v47 = v18;
      __int16 v48 = 2048;
      uint64_t v49 = v20;
      __int16 v50 = 2048;
      uint64_t v51 = v22;
      __int16 v52 = 2048;
      uint64_t v53 = v24;
      __int16 v54 = 2112;
      id v55 = v25;
      __int16 v56 = 2048;
      uint64_t v57 = v26;
      __int16 v58 = 2048;
      double v59 = v29;
      __int16 v60 = 2048;
      uint64_t v61 = v27;
      __int16 v62 = 2048;
      double v63 = sqrt(v28);
      __int16 v64 = 1024;
      int v65 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@,SynthesizedClock,rtc,%.6lf,utc,%.6lf,utcUnc,%.6lf,sf,%.8lf,sfUnc,%.8lf,utcSfCov,%.8lf,logNoise,%.6lf,timeRtc, %.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@,predUtc,%.6lf,predUtcUnc,%.6lf,predSf,%.8lf,predSfUnc,%.8lf,measNumber,%d",  buf,  0xA8u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000175C4;
    v31[3] = &unk_100028BA0;
    v31[4] = v3;
    AnalyticsSendEventLazy(@"com.apple.timed.TDTFStartWithQuality", v31);
    [v3 setLastQualityTime:0];
    return [v3 displayLastQualityTime];
  }

  return result;
}

NSDictionary *sub_1000175C4(uint64_t a1)
{
  v3[0] = @"_rtc";
  v4[0] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 8LL));
  v3[1] = @"_utc";
  v4[1] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 16LL));
  void v3[2] = @"_utc_var";
  void v4[2] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 48LL));
  void v3[3] = @"_rateSf";
  void v4[3] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 24LL));
  void v3[4] = @"_sf_var";
  void v4[4] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 56LL));
  void v3[5] = @"_utc_sf_cov";
  void v4[5] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 64LL));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL);
}

uint64_t sub_1000176F0(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = *(double *)(result + 24);
    uint64_t v3 = *(void *)(result + 56);
    if (*(double *)(result + 96) >= 0.000015)
    {
      uint64_t v4 = 0x3FF0001F75104D55LL;
      if (v2 <= 1.00003)
      {
        uint64_t v4 = 0x3FEFFF822BBECAACLL;
        if (v2 >= 0.99994) {
          return result;
        }
        uint64_t v5 = 0x3E2EEC7BD512B572LL;
      }

      else
      {
        uint64_t v5 = 0x3E0EEC7BD512B572LL;
      }
    }

    else
    {
      uint64_t v4 = 0x3FF0000DA1A93294LL;
      if (v2 <= 1.000013)
      {
        uint64_t v4 = 0x3FEFFFEB074A771DLL;
        if (v2 >= 0.99999) {
          return result;
        }
        uint64_t v5 = 0x3DDB7CDFD9D7BDBCLL;
      }

      else
      {
        uint64_t v5 = 0x3DE73A28AC8E9F0ALL;
      }
    }

    *(void *)(result + 24) = v4;
    *(void *)(result + 56) = v5;
    double v6 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001BE88(v6, v2);
    }
    double v7 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v1 + 128);
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      double v13 = v2;
      __int16 v14 = 2048;
      uint64_t v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@,clamped,_rateSf,%f,_sf_var,%f", buf, 0x20u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    u_int v9[2] = sub_1000178B0;
    v9[3] = &unk_1000291B0;
    *(double *)&void v9[4] = v2;
    v9[5] = v3;
    return AnalyticsSendEventLazy(@"com.apple.timed.TDTFClamped", v9);
  }

  return result;
}

NSDictionary *sub_1000178B0(uint64_t a1)
{
  v4[0] = @"_rateSf";
  double v2 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32));
  v4[1] = @"_sf_var";
  v5[0] = v2;
  v5[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL);
}

NSDictionary *sub_100018568(uint64_t a1)
{
  v3[0] = @"_rtc";
  v4[0] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 8LL));
  v3[1] = @"rtc_s";
  objc_msgSend(*(id *)(a1 + 40), "rtc_s");
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_10001861C(uint64_t a1)
{
  v5[0] = @"rtc_s";
  [*(id *)(a1 + 32) rtc];
  v6[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[1] = @"t_s";
  [*(id *)(a1 + 32) utc];
  v6[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v5[2] = @"rateSf";
  [*(id *)(a1 + 32) rateSf];
  v6[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[3] = @"utc_var";
  objc_msgSend(*(id *)(a1 + 32), "utc_var");
  void v6[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v5[4] = @"sf_var";
  objc_msgSend(*(id *)(a1 + 32), "sf_var");
  v6[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  void v5[5] = @"utc_sf_cov";
  objc_msgSend(*(id *)(a1 + 32), "utc_sf_cov");
  void v6[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[6] = @"src";
  v6[6] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 40) source]));
  v5[7] = @"input_unc";
  objc_msgSend(*(id *)(a1 + 40), "utcUnc_s");
  double v2 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v5[8] = @"_name";
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 128LL);
  v6[7] = v2;
  v6[8] = v3;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  9LL);
}

NSDictionary *sub_1000187D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = *(void *)(v2 + 128);
  v4[0] = @"_name";
  v4[1] = @"_rejects";
  v5[1] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(v2 + 72));
  void v4[2] = @"innv";
  void v5[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48));
  void v4[3] = @"src";
  v5[3] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 40) source]));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  4LL);
}

NSDictionary *sub_1000188C0(uint64_t a1)
{
  v3[0] = @"rtc_s";
  [*(id *)(a1 + 32) rtc];
  v4[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v3[1] = @"t_s";
  [*(id *)(a1 + 32) utc];
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_100018984(uint64_t a1)
{
  v3[0] = @"rtc_s";
  [*(id *)(a1 + 32) rtc];
  v4[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v3[1] = @"t_s";
  [*(id *)(a1 + 32) utc];
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL);
}

NSDictionary *sub_100018A48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = *(void *)(v2 + 128);
  v4[0] = @"_name";
  v4[1] = @"_rtc";
  v5[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(v2 + 8));
  void v4[2] = @"_utc";
  void v5[2] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 16LL));
  void v4[3] = @"_utc_unc";
  v5[3] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sqrt(*(double *)(*(void *)(a1 + 32) + 48LL)));
  void v4[4] = @"_rateSf";
  void v5[4] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 24LL));
  void v4[5] = @"_sf_var";
  void v5[5] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 56LL));
  void v4[6] = @"_utc_sf_cov";
  v5[6] = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 64LL));
  v4[7] = @"src";
  v5[7] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  sub_1000066C8((uint64_t)[*(id *)(a1 + 40) source]));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  8LL);
}

uint64_t sntp_shortstamp_hton(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_from_shortstamp(int a1)
{
  return (unsigned __int16)a1 | ((unint64_t)HIWORD(a1) << 48);
}

uint64_t sntp_timestamp_to_shortstamp(uint64_t a1)
{
  return HIDWORD(a1) & 0xFFFF0000 | (unsigned __int16)a1;
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000LL | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
}

uint64_t sntp_datestamp_subsecs_to_nsec(unint64_t a1)
{
  uint64_t v1 = (a1 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
  if (1000000000 * a1 < 0x8000000000000000LL) {
    return v1;
  }
  else {
    return (v1 + 1);
  }
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t sntp_datestamp_to_timeval(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
}

double sntp_datestamp_to_double(uint64_t a1, unint64_t a2)
{
  return (double)a2 * 5.42101086e-20 + (double)a1;
}

double sntp_datestamp_from_double(double a1)
{
  return a1 - (double)(uint64_t)a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  uint64_t v11 = v10;
  uint64_t v12 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  unsigned __int128 v14 = __PAIR128__( v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9,  v8 - v4 + v11)
      - v13;
  return (__CFADD__((void)v14, (unint64_t)(*((void *)&v14 + 1) - v12) >> 63) + *((void *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  unint64_t v11 = v10;
  uint64_t v12 = -v9;
  uint64_t v13 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

uint64_t sntp_calc_mean(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v4 = v3;
  uint64_t v5 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  if (__CFADD__(v4, v6)) {
    uint64_t v7 = v2 + 1;
  }
  else {
    uint64_t v7 = v2;
  }
  return (uint64_t)((__PAIR128__(v7, v4 + v6) + __PAIR128__(v5, (v2 + (unint64_t)__CFADD__(v4, v6) + v5) >> 63)) >> 64) >> 1;
}

uint64_t sntp_calc_error(uint64_t a1)
{
  unint64_t v2 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 40));
  unint64_t v3 = sntp_timestamp_to_datestamp(v2);
  uint64_t v5 = v4;
  unint64_t v6 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 44));
  uint64_t v7 = sntp_timestamp_to_datestamp(v6);
  if (__CFADD__(v5, v3 >> 63)) {
    unint64_t v9 = v3 + 1;
  }
  else {
    unint64_t v9 = v3;
  }
  *((void *)&v10 + 1) = v9;
  *(void *)&__int128 v10 = v5 + (v3 >> 63);
  return ((v10 >> 1) + __PAIR128__(v7, v8)) >> 64;
}

unint64_t sntp_clock_select(unint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v2 = a1;
  unsigned int v3 = 0;
  unint64_t v4 = a1 + 80LL * a2;
  unint64_t v5 = a1;
  do
  {
    if (!*(_DWORD *)v5 && *(_BYTE *)(v5 + 37)) {
      ++v3;
    }
    v5 += 80LL;
  }

  while (v5 < v4);
  unint64_t result = 0LL;
  unint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  unsigned int v31 = v3 >> 1;
  do
  {
    if (!*(_DWORD *)v2 && *(_BYTE *)(v2 + 37))
    {
      uint64_t v32 = v8;
      unint64_t v33 = v7;
      unint64_t v34 = result;
      uint64_t v9 = sntp_calc_delay(v2);
      __int128 v10 = (_DWORD *)(v2 + 80);
      unint64_t v37 = v11;
      if (v2 + 80 >= v4)
      {
        unsigned int v36 = 1;
        unint64_t v35 = v2;
      }

      else
      {
        unsigned int v36 = 1;
        unint64_t v35 = v2;
        do
        {
          if (!*v10)
          {
            uint64_t v12 = sntp_calc_offset(v2);
            unint64_t v14 = v13;
            uint64_t v15 = sntp_calc_offset((uint64_t)v10);
            unint64_t v17 = v16;
            uint64_t v18 = sntp_calc_delay(v2);
            unint64_t v20 = v19;
            uint64_t v21 = sntp_calc_delay((uint64_t)v10);
            if ((__int128)(__PAIR128__(v18, v20) + __PAIR128__(v12, v14)) >= (__int128)(__PAIR128__(v15, v17)
                                                                                       - __PAIR128__(v21, v22))
              && (__int128)(__PAIR128__(v21, v22) + __PAIR128__(v15, v17)) >= (__int128)(__PAIR128__(v12, v14)
                                                                                       - __PAIR128__(v18, v20)))
            {
              ++v36;
              uint64_t v23 = sntp_calc_delay((uint64_t)v10);
              unint64_t v25 = v37;
              uint64_t v26 = (_DWORD *)v35;
              unint64_t v35 = (unint64_t)v26;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37))
              {
                uint64_t v9 = v23;
                unint64_t v25 = v24;
              }

              unint64_t v37 = v25;
            }
          }

          v10 += 20;
        }

        while ((unint64_t)v10 < v4);
      }

      uint64_t v8 = v32;
      unint64_t v7 = v33;
      unint64_t v27 = v37;
      unint64_t result = v34;
      unint64_t v28 = v35;
      BOOL v29 = (__int128)__PAIR128__(v9, v37) < (__int128)__PAIR128__(v32, v33) || v34 == 0;
      if (v29) {
        uint64_t v30 = v9;
      }
      else {
        uint64_t v30 = v32;
      }
      if (!v29)
      {
        unint64_t v27 = v33;
        unint64_t v28 = v34;
      }

      if (v36 > v31)
      {
        unint64_t v7 = v27;
        uint64_t v8 = v30;
        unint64_t result = v28;
      }
    }

    v2 += 80LL;
  }

  while (v2 < v4);
  return result;
}

unint64_t sntp_packet_hton@<X0>(__int128 *a1@<X0>, void *a2@<X8>)
{
  __int128 v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_hton((int *)&v5, (uint64_t)a2);
  a2[3] = sntp_timestamp_hton(*((void *)a1 + 3));
  a2[4] = sntp_timestamp_hton(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_hton(*((void *)a1 + 5));
  a2[5] = result;
  return result;
}

unint64_t sntp_packet_ntoh@<X0>(__int128 *a1@<X0>, void *a2@<X8>)
{
  __int128 v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_ntoh((int *)&v5, (uint64_t)a2);
  a2[3] = sntp_timestamp_ntoh(*((void *)a1 + 3));
  a2[4] = sntp_timestamp_ntoh(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 5));
  a2[5] = result;
  return result;
}

const char *sntp_exchange_ntop(char *a1, socklen_t a2, uint64_t a3)
{
  return inet_ntop(*(_DWORD *)(a3 + 76), (const void *)(a3 + 60), a1, a2);
}

uint64_t sntp_print_timestamp(int a1, const char *a2, unint64_t a3)
{
  int v3 = a3;
  unint64_t v6 = HIDWORD(a3);
  unint64_t v7 = sntp_timestamp_to_datestamp(a3);
  uint64_t v9 = sntp_datestamp_to_timespec(v7, v8);
  return printf("%*s: %08X.%08X (%ld.%09lu)\n", a1, a2, v3, v6, v9, v10);
}

uint64_t sntp_print_shortstamp(int a1, const char *a2, int a3)
{
  int v5 = HIWORD(a3);
  int v6 = (unsigned __int16)a3;
  unint64_t v7 = sntp_timestamp_from_shortstamp(a3);
  uint64_t v8 = sntp_timestamp_to_datestamp(v7);
  double v10 = sntp_datestamp_to_double(v8, v9);
  return printf("%*s: %04X.%04X (%.9lf)\n", a1, a2, v6, v5, v10);
}

uint64_t sntp_print_datestamp(int a1, const char *a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  unint64_t v6 = a3[1];
  double v7 = sntp_datestamp_to_double(*a3, v6);
  return printf("%*s: %016llX.%016llX (%.9lf)\n", a1, a2, v5, v6, v7);
}

uint64_t sntp_print_header(int a1, unsigned __int8 *a2)
{
  unsigned int v6 = *((_DWORD *)a2 + 3);
  unint64_t v4 = (char *)(a2 + 12);
  unsigned int v5 = v6;
  if (*(v4 - 11) > 1u)
  {
    inet_ntop(2, v4, __str, 0x10u);
  }

  else
  {
    unsigned int v7 = bswap32(v5);
    else {
      __uint32_t v8 = _DefaultRuneLocale.__runetype[v7] & 0x40000;
    }
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 32LL;
    }
    if (BYTE1(v7) > 0x7Fu) {
      __uint32_t v10 = __maskrune(BYTE1(v7), 0x40000uLL);
    }
    else {
      __uint32_t v10 = _DefaultRuneLocale.__runetype[BYTE1(v7)] & 0x40000;
    }
    if (v10) {
      uint64_t v11 = BYTE1(v7);
    }
    else {
      uint64_t v11 = 32LL;
    }
    if (BYTE2(v7) > 0x7Fu) {
      __uint32_t v12 = __maskrune(BYTE2(v7), 0x40000uLL);
    }
    else {
      __uint32_t v12 = _DefaultRuneLocale.__runetype[BYTE2(v7)] & 0x40000;
    }
    unsigned int v13 = HIBYTE(v7);
    if (v12) {
      uint64_t v14 = BYTE2(v7);
    }
    else {
      uint64_t v14 = 32LL;
    }
    if ((v7 & 0x80000000) != 0) {
      __uint32_t v15 = __maskrune(HIBYTE(v7), 0x40000uLL);
    }
    else {
      __uint32_t v15 = _DefaultRuneLocale.__runetype[v13] & 0x40000;
    }
    if (v15) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 32LL;
    }
    snprintf(__str, 7uLL, "%c%c%c%c", v9, v11, v14, v16);
  }

  unsigned int v17 = *a2;
  int v18 = a2[1];
  int v19 = a2[2];
  int v20 = (char)a2[3];
  float v21 = sntp_precision_decode(v20);
  printf( "%*s: %02X (li:%d vn:%d mode:%d)\n%*s: %02X (%u)\n%*s: %02X (%u)\n%*s: %02X (%e)\n",  a1,  "header",  v17,  v17 >> 6,  (v17 >> 3) & 7,  v17 & 7,  a1,  "stratum",  v18,  v18,  a1,  "poll",  v19,  1 << v19,  a1,  "precision",  v20,  v21);
  sntp_print_shortstamp(a1, "delay", *((_DWORD *)a2 + 1));
  sntp_print_shortstamp(a1, "dispersion", *((_DWORD *)a2 + 2));
  printf("%*s: %08X (%s)\n", a1, "ref", *((_DWORD *)a2 + 3), __str);
  return sntp_print_timestamp(a1, "t_ref", *((void *)a2 + 2));
}

uint64_t sntp_print_exchange(unsigned int *a1)
{
  *(_OWORD *)int v19 = *(_OWORD *)(a1 + 9);
  uint64_t v20 = *(void *)(a1 + 13);
  sntp_print_header(14, (unsigned __int8 *)v19);
  sntp_print_timestamp(14, "t1", *(void *)(a1 + 1));
  sntp_print_timestamp(14, "t2", *(void *)(a1 + 3));
  sntp_print_timestamp(14, "t3", *(void *)(a1 + 5));
  sntp_print_timestamp(14, "t4", *(void *)(a1 + 7));
  uint64_t v2 = sntp_calc_offset((uint64_t)a1);
  unint64_t v4 = v3;
  double v5 = sntp_datestamp_to_double(v2, v3);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "offset", v2, v4, v5);
  uint64_t v6 = sntp_calc_delay((uint64_t)a1);
  unint64_t v8 = v7;
  double v9 = sntp_datestamp_to_double(v6, v7);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "delay", v6, v8, v9);
  uint64_t v10 = sntp_calc_mean((uint64_t)a1);
  unint64_t v12 = v11;
  double v13 = sntp_datestamp_to_double(v10, v11);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "mean", v10, v12, v13);
  uint64_t v14 = sntp_calc_error((uint64_t)a1);
  unint64_t v16 = v15;
  double v17 = sntp_datestamp_to_double(v14, v15);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "error", v14, v16, v17);
  inet_ntop(a1[19], a1 + 15, v19, 0x2Eu);
  printf("%14s: %s\n", "addr", v19);
  return puts("}");
}

uint64_t sntp_print_packet(__int128 *a1)
{
  __int128 v3 = *a1;
  uint64_t v4 = *((void *)a1 + 2);
  sntp_print_header(14, (unsigned __int8 *)&v3);
  sntp_print_timestamp(14, "t_orig", *((void *)a1 + 3));
  sntp_print_timestamp(14, "t_rx", *((void *)a1 + 4));
  sntp_print_timestamp(14, "t_tx", *((void *)a1 + 5));
  return puts("}");
}

unint64_t sntp_header_hton@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_hton(v4);
  int v6 = sntp_shortstamp_hton(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_hton(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  int v6 = sntp_shortstamp_ntoh(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

void *sntp_header_mmap(const char *a1, uint64_t a2, int a3)
{
  int v6 = open(a1, 2);
  if (v6 < 0)
  {
    if (*__error() != 2 || (mode_t v8 = umask(0), v7 = open(a1, 514, 436LL), umask(v8), v7 < 0))
    {
      warn("open");
      return 0LL;
    }

    unsigned int v9 = *(_DWORD *)(a2 + 8);
    unsigned int v10 = *(_DWORD *)(a2 + 12);
    unint64_t v11 = *(void *)(a2 + 16);
    unsigned int v12 = *(_DWORD *)(a2 + 4);
    __buf[0] = *(_DWORD *)a2;
    __buf[1] = sntp_shortstamp_hton(v12);
    __buf[2] = sntp_shortstamp_hton(v9);
    __buf[3] = bswap32(v10);
    unint64_t v17 = sntp_timestamp_hton(v11);
    if (write(v7, __buf, 0x18uLL) != 24)
    {
      warn("write");
      return 0LL;
    }
  }

  else
  {
    int v7 = v6;
    if (ftruncate(v6, 24LL))
    {
      warn("ftruncate");
      return 0LL;
    }
  }

  if (a3) {
    int v13 = 3;
  }
  else {
    int v13 = 1;
  }
  uint64_t v14 = mmap(0LL, 0x18uLL, v13, 1, v7, 0LL);
  if (v14 == (void *)-1LL)
  {
    warn("mmap");
    uint64_t v14 = 0LL;
  }

  if (close(v7)) {
    warn("close");
  }
  return v14;
}

void sntp_header_unmap(void *a1)
{
  if (munmap(a1, 0x18uLL)) {
    warn("munmap");
  }
}

float sntp_precision_decode(int a1)
{
  LODWORD(result) = (a1 << 23) + 1065353216;
  return result;
}

unint64_t sntp_server_respond@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  *(void *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = sntp_timestamp_hton(v8);
  unint64_t v10 = a3();
  unint64_t result = sntp_timestamp_hton(v10);
  *(void *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(_BYTE *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }

  return result;
}

uint64_t sntp_server_exchange@<X0>( sockaddr *a1@<X1>, socklen_t *a2@<X2>, int a3@<W0>, __int128 *a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  *(_OWORD *)(a6 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  if (!a5) {
    sub_10001A228();
  }
  uint64_t result = recvfrom(a3, &v23, 0x30uLL, 64, a1, a2);
  if (result == 48)
  {
    if (a1 && a2)
    {
      socklen_t v13 = *a2;
      int sa_family = a1->sa_family;
      *(_DWORD *)(a6 + 76) = sa_family;
      if (v13 == 16 && sa_family == 2)
      {
        *(_DWORD *)(a6 + 60) = *(_DWORD *)&a1->sa_data[2];
      }

      else if (v13 == 28 && sa_family == 30)
      {
        *(sockaddr *)(a6 + 60) = *(sockaddr *)&a1->sa_data[6];
      }
    }

    v19[0] = v23;
    v19[1] = v24;
    v19[2] = v25;
    __int128 v17 = *a4;
    uint64_t v18 = *((void *)a4 + 2);
    sntp_server_respond((uint64_t)v19, (uint64_t)&v17, a5, (uint64_t)v20);
    if (a2) {
      socklen_t v15 = *a2;
    }
    else {
      socklen_t v15 = 0;
    }
    if (sendto(a3, v20, 0x30uLL, 0, a1, v15) != 48) {
      *(_DWORD *)a6 = 5;
    }
    *(_OWORD *)(a6 + 36) = v23;
    unint64_t v16 = *((void *)&v25 + 1);
    *(void *)(a6 + 52) = v24;
    *(void *)(a6 + 4) = sntp_timestamp_ntoh(v16);
    *(void *)(a6 + 12) = sntp_timestamp_ntoh(v21);
    uint64_t result = sntp_timestamp_ntoh(v22);
    *(void *)(a6 + 20) = result;
  }

  else
  {
    *(_DWORD *)a6 = 7;
  }

  return result;
}

__n128 sntp_client_exchange@<Q0>(int a1@<W0>, timeval *a2@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  memset(v16, 0, sizeof(v16));
  memset(&v15, 0, sizeof(v15));
  if (__darwin_check_fd_set_overflow(a1, &v15, 0)) {
    *(__int32_t *)((char *)v15.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  __int128 v14 = 0u;
  memset(v13, 0, sizeof(v13));
  LOBYTE(v13[0]) = 35;
  if (a3)
  {
    *(void *)((char *)v16 + 4) = a3();
    *((void *)&v14 + 1) = sntp_timestamp_hton(*(unint64_t *)((char *)v16 + 4));
  }

  if (send(a1, v13, 0x30uLL, 0) != 48)
  {
    int v9 = 5;
LABEL_17:
    LODWORD(v16[0]) = v9;
    __int128 v10 = v17;
    *(_OWORD *)(a4 + 32) = v16[2];
    *(_OWORD *)(a4 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = v10;
    *(_OWORD *)(a4 + 64) = v18;
    __n128 result = (__n128)v16[1];
    *(_OWORD *)a4 = v16[0];
    *(__n128 *)(a4 + 16) = result;
    return result;
  }

  if (a2 && (a2->tv_sec || a2->tv_usec) && select(a1 + 1, &v15, 0LL, &v15, a2) != 1)
  {
    int v9 = 6;
    goto LABEL_17;
  }

  if (recv(a1, v12, 0x30uLL, 0) != 48)
  {
    int v9 = 7;
    goto LABEL_17;
  }

  if (a3) {
    *(void *)((char *)&v16[1] + 12) = a3();
  }
  v11[0] = v12[0];
  v11[1] = v12[1];
  v11[2] = v12[2];
  sntp_client_process_response( (unsigned __int8 *)v11,  (unint64_t *)((char *)v16 + 4),  (_OWORD *)((char *)&v16[1] + 12),  a4);
  return result;
}

unint64_t sntp_client_process_response@<X0>( unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    unint64_t v8 = *a2;
    *(void *)(a4 + 4) = *a2;
    unint64_t v9 = HIDWORD(v8);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  LODWORD(v9) = 0;
  LODWORD(v_Block_object_dispose((const void *)(v1 - 128), 8) = 0;
  if (a3) {
LABEL_3:
  }
    *(void *)(a4 + 2_Block_object_dispose((const void *)(v1 - 128), 8) = *a3;
LABEL_4:
  __int128 v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  unint64_t result = sntp_packet_ntoh(v16, v17);
  __int128 v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(void *)(a4 + 52) = *((void *)a1 + 2);
  uint64_t v13 = *((void *)a1 + 4);
  uint64_t v14 = *((void *)a1 + 5);
  *(void *)(a4 + 12) = v13;
  *(void *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != (_DWORD)v8 || *((_DWORD *)a1 + 7) != (_DWORD)v9)
          {
            int v15 = 10;
            goto LABEL_19;
          }

          if (a3)
          {
            unint64_t result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000LL) != 0)
            {
              int v15 = 11;
              goto LABEL_19;
            }
          }
        }

        int v15 = 0;
      }

      else
      {
        int v15 = 12;
      }
    }

    else
    {
      int v15 = 8;
    }
  }

  else
  {
    int v15 = 9;
  }

LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

void sntp_client_unicast( const char *a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, timeval *a4@<X3>, uint64_t (*a5)(void)@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(_OWORD *)(a7 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)a7 = 0u;
  snprintf(__str, 6uLL, "%u", a3);
  if (getaddrinfo(a1, __str, 0LL, &v28))
  {
    *(_DWORD *)a7 = 1;
    return;
  }

  if (!v28) {
    sub_10001A250();
  }
  if (a2)
  {
    int v13 = 0;
    uint64_t v14 = v28;
    while (1)
    {
      uint64_t v14 = v14->ai_next;
      if (!v14) {
        break;
      }
      if (++v13 >= a2) {
        goto LABEL_10;
      }
    }
  }

  uint64_t v14 = v28;
LABEL_10:
  int ai_family = v14->ai_family;
  socklen_t ai_addrlen = v14->ai_addrlen;
  ai_addr = v14->ai_addr;
  int sa_family = ai_addr->sa_family;
  *(_DWORD *)(a7 + 76) = sa_family;
  if (ai_addrlen == 16 && sa_family == 2)
  {
    *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
  }

  else if (ai_addrlen == 28 && sa_family == 30)
  {
    *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
  }

  int v21 = socket(ai_family, 2, 17);
  if (v21)
  {
    int v22 = v21;
    if (!a6) {
      goto LABEL_29;
    }
    if (ai_family == 2)
    {
      v30[0] = 2063598080LL;
      v30[1] = 0LL;
      __int128 v23 = (const sockaddr *)v30;
      socklen_t v24 = 16;
    }

    else
    {
      memset(&v27[1], 0, 24);
      *(in6_addr *)&v27[2] = in6addr_any;
      v27[0] = 2063605276;
      __int128 v23 = (const sockaddr *)v27;
      socklen_t v24 = 28;
    }

    if (bind(v21, v23, v24))
    {
      int v25 = 3;
    }

    else
    {
LABEL_29:
      if (!connect(v22, ai_addr, ai_addrlen))
      {
        sntp_client_exchange(v22, a4, a5, a7);
        int v26 = ai_addr->sa_family;
        *(_DWORD *)(a7 + 76) = v26;
        if (ai_addrlen == 16 && v26 == 2)
        {
          *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
        }

        else if (ai_addrlen == 28 && v26 == 30)
        {
          *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
        }

        goto LABEL_32;
      }

      int v25 = 4;
    }

    *(_DWORD *)a7 = v25;
LABEL_32:
    close(v22);
    goto LABEL_33;
  }

  *(_DWORD *)a7 = 2;
LABEL_33:
  freeaddrinfo(v28);
}

void sub_10001A228()
{
}

void sub_10001A250()
{
}

void sub_10001A278()
{
}

void sub_10001A2D8()
{
}

void sub_10001A338( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A3A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get cache URL", v1, 2u);
}

void sub_10001A3E0()
{
}

void sub_10001A440( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A4A8()
{
}

void sub_10001A508()
{
}

void sub_10001A568(os_log_s *a1)
{
}

void sub_10001A5E8(xpc_connection_t *a1, os_log_s *a2)
{
  pid_t pid = xpc_connection_get_pid(*a1);
  v4[0] = 67109120;
  v4[1] = pid;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Client lacks authorization, pid: %d",  (uint8_t *)v4,  8u);
  sub_1000056CC();
}

void sub_10001A670()
{
}

void sub_10001A6D4()
{
}

void sub_10001A738(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Should not message ourselves", v1, 2u);
}

void sub_10001A778( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A7DC()
{
  unsigned int v0 = sub_100007AC0();
  sub_100007AB8(v0);
  sub_100007A7C();
  sub_100007A94( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "CoreTime: Error occurred %d %s\n",  v2,  v3,  v4,  v5,  v6);
  sub_100007AA4();
}

void sub_10001A850( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A884()
{
  unsigned int v0 = sub_100007AC0();
  sub_100007AB8(v0);
  sub_100007A7C();
  sub_100007A94( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Error occurred %d %s\n",  v2,  v3,  v4,  v5,  v6);
  sub_100007AA4();
}

void sub_10001A8F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A92C()
{
  v0[0] = 67109120;
  v0[1] = 3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "CoreTime: ERROR: Could not get kern.monotonicclock_usecs after %d attempts\n",  (uint8_t *)v0,  8u);
  sub_100007AB0();
}

void sub_10001A9A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A9DC(uint64_t a1)
{
  int v1 = 134218240;
  uint64_t v2 = 8LL;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "CoreTime: ERROR: Expected %lld bytes from kern.monotoniclock_offset_usecs but got %lld\n",  (uint8_t *)&v1,  0x16u);
  sub_1000056CC();
}

void sub_10001AA64()
{
  unsigned int v0 = sub_100007AC0();
  sub_100007AB8(v0);
  sub_100007A7C();
  sub_100007A94( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "CoreTime: ERROR: Could not get/set kern.monotoniclock_offset_usecs %d %s\n",  v2,  v3,  v4,  v5,  v6);
  sub_100007AA4();
}

void sub_10001AAD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AB44()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 515, "numer != 0");
}

void sub_10001AB6C()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 516, "denom != 0");
}

void sub_10001AB94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001ABC8()
{
  __assert_rtn("TMGetMachTimebase", "TMUtilities.m", 494, "timebaseResult == KERN_SUCCESS");
}

void sub_10001ABF0(void *a1, os_log_s *a2)
{
}

void sub_10001AC64(void *a1, os_log_s *a2)
{
}

void sub_10001ACD8()
{
}

void sub_10001AD10()
{
  __assert_rtn("-[TMDaemonCore bootUUID]", "TMDaemonCore.m", 764, "len == sizeof(uuidString)");
}

void sub_10001AD38(uint64_t a1, os_log_s *a2, uint64_t a3, double a4)
{
  int v4 = 134218242;
  double v5 = a4;
  __int16 v6 = 2080;
  uint64_t v7 = a1;
  sub_10000FA9C( (void *)&_mh_execute_header,  a2,  a3,  "TMCFAbsoluteTimeToTimeval(%f) failed: cannot set system time from %s",  (uint8_t *)&v4);
  sub_1000056CC();
}

void sub_10001ADAC(int a1, os_log_s *a2, uint64_t a3, double a4)
{
  int v4 = 134218240;
  double v5 = a4;
  __int16 v6 = 1024;
  int v7 = a1;
  sub_10000FA80( (void *)&_mh_execute_header,  a2,  a3,  "ntp_adjtime(%lf) failed %d; cannot set system time",
    (uint8_t *)&v4);
  sub_1000056CC();
}

void sub_10001AE20()
{
}

uint64_t sub_10001AE80(uint64_t a1, IOPMAssertionID *a2, char a3)
{
  return a3 & 1;
}

void sub_10001AECC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "_testAndApplySystemTime IOPMAssertionCreate failed with return code %d",  (uint8_t *)v2,  8u);
  sub_100007AB0();
}

void sub_10001AF3C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AFA4()
{
}

void sub_10001AFD0()
{
}

void sub_10001AFFC(void *a1, os_log_s *a2)
{
}

void sub_10001B070()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10000FA9C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "CFTimeZoneCopySystem returned %@ after attempting to set %@",  v2);
  sub_1000056CC();
}

void sub_10001B0E4(void *a1, int a2, os_log_s *a3)
{
  __int16 v7 = 1024;
  int v8 = a2;
  sub_10000FA80((void *)&_mh_execute_header, a3, v5, "Couldn't set time zone to %s: %{darwin.errno}d\n", v6);
  sub_100007AA4();
}

void sub_10001B168()
{
}

void sub_10001B1C8(void *a1, os_log_s *a2)
{
}

void sub_10001B244()
{
}

void sub_10001B270()
{
}

void sub_10001B2D0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_1000056CC();
}

void sub_10001B338()
{
}

void sub_10001B364(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  sub_10000FA80( (void *)&_mh_execute_header,  a2,  a3,  "TMSetManualTime failed to settimeofday. tv = {%ld, %d}",  (uint8_t *)&v5);
  sub_1000056CC();
}

void sub_10001B3E0()
{
}

void sub_10001B40C()
{
}

void sub_10001B46C()
{
}

void sub_10001B4CC()
{
}

void sub_10001B4F8()
{
}

void sub_10001B558()
{
}

void sub_10001B584()
{
}

void sub_10001B5B0()
{
}

void sub_10001B61C()
{
}

void sub_10001B67C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Source %@ gave an input without marking itself as available!",  (uint8_t *)&v2,  0xCu);
}

void sub_10001B6F0()
{
}

void sub_10001B718(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "IO Connection established, scheduling",  v1,  2u);
}

void sub_10001B758()
{
}

void sub_10001B780(__int16 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 0xFFF;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "System power message: 0x%03x",  (uint8_t *)v2,  8u);
}

void sub_10001B7F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B82C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%@ entitlement must be a true BOOLean",  (uint8_t *)&v2,  0xCu);
}

void sub_10001B8A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B8D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B908( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B93C()
{
  os_log_t v0 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Expected to decode object of class TMTimeSynthesizer",  v1,  2u);
  }

  objc_end_catch();
  sub_1000056CC();
}

void sub_10001B9A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BA08( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BA6C()
{
}

void sub_10001BADC()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000056E4();
  sub_100014710( (void *)&_mh_execute_header,  v1,  v2,  "Could not determine current network reachability flags, not going to try and keep us awake: %s",  v3,  v4,  v5,  v6,  v7);
  sub_100007AA4();
}

void sub_10001BB50()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000056E4();
  sub_100014710( (void *)&_mh_execute_header,  v1,  v2,  "Could not SCNetworkReachabilitySetCallback: %s",  v3,  v4,  v5,  v6,  v7);
  sub_100007AA4();
}

void sub_10001BBC4()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000056E4();
  sub_100014710( (void *)&_mh_execute_header,  v1,  v2,  "Could not SCNetworkReachabilitySetDispatchQueue to schedule reachability notification: %s",  v3,  v4,  v5,  v6,  v7);
  sub_100007AA4();
}

void sub_10001BC38()
{
}

void sub_10001BC60(unsigned __int8 a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "setFetchingTime:%d called when _fetchingTime=%d",  (uint8_t *)v3,  0xEu);
}

void sub_10001BCE8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014724( (void *)&_mh_execute_header,  a2,  a3,  "IOPMAssertionRelease failed with return code %d",  a5,  a6,  a7,  a8,  0);
  sub_100007AB0();
}

void sub_10001BD4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Slept during NTP request", v1, 2u);
  sub_100007AB0();
}

void sub_10001BD88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014724( (void *)&_mh_execute_header,  a2,  a3,  "IOPMAssertionCreate failed with return code %d",  a5,  a6,  a7,  a8,  0);
  sub_100007AB0();
}

void sub_10001BDEC()
{
}

void sub_10001BE14(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Time key present (%@), not migrating\n",  (uint8_t *)&v2,  0xCu);
}

void sub_10001BE88(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "rateSf clamped: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10001BF00(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Time input isSynthesized, suspect feedback loop",  v1,  2u);
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}