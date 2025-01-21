}

id sub_100002174(os_log_s *a1, uint64_t a2)
{
  id v3 = [*(id *)(a2 + 8) allClients];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v3;
  id result = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v23;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v7);
        if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
        {
          id v14 = objc_msgSend(objc_msgSend((id)v8, "processName"), "UTF8String");
          int v15 = *(_DWORD *)(v8 + 72);
          *(_DWORD *)buf = 136446466;
          id v27 = v14;
          __int16 v28 = 1024;
          int v29 = v15;
          _os_log_debug_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_DEBUG,  "Registrations: <%{public}s (%d)>",  buf,  0x12u);
        }

        uint64_t v9 = *(void *)(v8 + 24);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100002438;
        v21[3] = &unk_1000083E0;
        v21[4] = a1;
        CFXNotificationRegistrarEnumerate(v9, v21);
        if (xpc_array_get_count(*(xpc_object_t *)(v8 + 32)))
        {
          uint64_t v10 = _CFXPCCreateCFObjectFromXPCObject(*(void *)(v8 + 32));
          if (v10)
          {
            v11 = (void *)v10;
            if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v27 = v11;
              _os_log_debug_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_DEBUG,  "    Message Queue: %{public}@",  buf,  0xCu);
            }

            CFRelease(v11);
          }
        }

        uint64_t v12 = *(void *)(v8 + 64);
        if ((v12 & 0x8000000000000000LL) == 0)
        {
          uint64_t v13 = *(void *)(v8 + 64);
          if ((v13 & 0x8000000000000000LL) == 0
            && !sandbox_check_by_reference(v13)
            && os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            sub_10000506C(&v17, v18, a1);
          }
        }

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id result = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
      id v5 = result;
    }

    while (result);
  }

  return result;
}

void sub_100002438(uint64_t a1, uint64_t *a2)
{
  id v3 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000050CC(a2, v3);
  }
}

void sub_100002704(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (*(void *)a2) {
    xpc_dictionary_set_string(v4, "name", (const char *)[*(id *)a2 UTF8String]);
  }
  id v5 = *(void **)(a2 + 8);
  if (v5) {
    xpc_dictionary_set_string(v4, "object", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_int64(v4, "token", *(void *)(a2 + 48));
  xpc_dictionary_set_int64(v4, "options", *(void *)(a2 + 24));
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
}

id sub_1000029A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000029AC(id a1)
{
}

void sub_1000029CC(uint64_t a1, void *a2)
{
  xpc_object_t v4 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isLoginWindow])
  {
    uint64_t v5 = _CFXPCCreateCFObjectFromXPCObject(a2);
    if (v5)
    {
      uint64_t v6 = (const void *)v5;
      uint64_t v32 = v5;
      CFLog(4LL, @"loginwindow msg = %@");
      CFRelease(v6);
    }
  }

  string = xpc_dictionary_get_string(a2, "method");
  if (string)
  {
    uint64_t v8 = string;
    if (strcmp(string, "post"))
    {
      if (strcmp(v8, "register"))
      {
        if (!strcmp(v8, "unregister"))
        {
          if (xpc_dictionary_get_uint64(a2, "version") == 1)
          {
            xpc_object_t value = xpc_dictionary_get_value(a2, "tokens");
            if (value)
            {
              uint8_t v17 = value;
              -[ClientOfLocalNoteServer forward:]( +[ClientOfLocalNoteServer monitor](&OBJC_CLASS___ClientOfLocalNoteServer, "monitor"),  "forward:",  a2);
              applier[0] = _NSConcreteStackBlock;
              applier[1] = 3221225472LL;
              applier[2] = sub_1000034B0;
              applier[3] = &unk_100008480;
              applier[4] = *v4;
              xpc_array_apply(v17, applier);
            }
          }
        }

        else if (!strcmp(v8, "suspend"))
        {
        }

        else if (!strcmp(v8, "unsuspend"))
        {
          if (xpc_dictionary_get_uint64(a2, "version") == 1)
          {
            *((_BYTE *)*v4 + 40) = 0;
            id v23 = *v4;
            __int128 v24 = (void *)*((void *)*v4 + 4);
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_1000035B0;
            v33[3] = &unk_100008480;
            v33[4] = v23;
            xpc_array_apply(v24, v33);
            xpc_release(*((xpc_object_t *)*v4 + 4));
            *((void *)*v4 + 4) = xpc_array_create(0LL, 0LL);
          }
        }

        else if (!strcmp(v8, "monitor"))
        {
          [*v4 startMonitoring];
        }

        else if (!strcmp(v8, "dump"))
        {
          [*v4 dump];
        }

        return;
      }

      -[ClientOfLocalNoteServer forward:]( +[ClientOfLocalNoteServer monitor](&OBJC_CLASS___ClientOfLocalNoteServer, "monitor"),  "forward:",  a2);
      v11 = xpc_dictionary_get_string(a2, "name");
      uint64_t v12 = xpc_dictionary_get_string(a2, "object");
      uint64_t v13 = v12;
      if (v11)
      {
        CFStringRef v14 = CFStringCreateWithCString(kCFAllocatorSystemDefault, v11, 0x8000100u);
        if (v13) {
          goto LABEL_24;
        }
      }

      else
      {
        CFStringRef v14 = (CFStringRef)kCFNotificationAnyName;
        if (v12)
        {
LABEL_24:
          CFStringRef v15 = CFStringCreateWithCString(kCFAllocatorSystemDefault, v13, 0x8000100u);
          if (!v14) {
            goto LABEL_53;
          }
LABEL_43:
          if (v15)
          {
            __int128 v25 = (const __CFString *)kCFNotificationAnyName;
            if (CFEqual(v14, kCFNotificationAnyName))
            {
              CFRelease(v14);
              CFStringRef v14 = v25;
            }

            v26 = (const __CFString *)kCFNotificationAnyObject;
            if (CFEqual(v15, kCFNotificationAnyObject))
            {
              CFRelease(v15);
              CFStringRef v15 = v26;
            }

            uint64_t v27 = *((void *)*v4 + 8);
            if (v27 < 0 || sandbox_check_by_reference(v27) || v14 != v25 || v15 != v26)
            {
              uint64_t uint64 = xpc_dictionary_get_uint64(a2, "token");
              if (qword_10000CDF8 != -1) {
                dispatch_once(&qword_10000CDF8, &stru_100008580);
              }
              int v29 = (os_log_s *)qword_10000CE00;
              if (os_log_type_enabled((os_log_t)qword_10000CE00, OS_LOG_TYPE_DEFAULT))
              {
                int v30 = *((_DWORD *)*v4 + 18);
                *(_DWORD *)buf = 138544130;
                CFStringRef v40 = v14;
                __int16 v41 = 2114;
                CFStringRef v42 = v15;
                __int16 v43 = 2048;
                uint64_t v44 = uint64;
                __int16 v45 = 1024;
                int v46 = v30;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "register name: %{public}@ object: %{public}@ token: %llx pid: %d",  buf,  0x26u);
              }

              char v31 = xpc_dictionary_get_uint64(a2, "options");
              CFXNotificationRegistrarAddRemoteToken( *((void *)*v4 + 3),  uint64,  v14,  v15,  kCFNotificationAnyObserver,  v31 & 0xF | 0x20000LL,  kCFXNotificationEmptyHandler[0],  kCFXNotificationEmptyHandler[1],  v32);
              CFRelease(v14);
              CFRelease(v15);
            }

            else
            {
              CFRelease(v25);
              CFRelease(v26);
            }

            return;
          }

LABEL_53:
          if (v14) {
            CFRelease(v14);
          }
          if (v15) {
            CFRelease(v15);
          }
          return;
        }
      }

      CFStringRef v15 = (CFStringRef)kCFNotificationAnyName;
      if (!v14) {
        goto LABEL_53;
      }
      goto LABEL_43;
    }

    if (xpc_dictionary_get_uint64(a2, "version") == 1)
    {
      if (xpc_dictionary_get_value(a2, "userinfo")
        && (uint64_t v9 = *((void *)*v4 + 8), (v9 & 0x8000000000000000LL) == 0)
        && sandbox_check_by_reference(v9))
      {
        if (qword_10000CDE8 != -1) {
          dispatch_once(&qword_10000CDE8, &stru_100008560);
        }
        uint64_t v10 = (os_log_s *)qword_10000CDF0;
        if (os_log_type_enabled((os_log_t)qword_10000CDF0, OS_LOG_TYPE_ERROR)) {
          sub_10000516C((id *)(a1 + 32), v10);
        }
      }

      else
      {
        id v18 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "allClients", v32);
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v19 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v36;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v36 != v21) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * (void)i) handlePost:a2];
            }

            id v20 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
          }

          while (v20);
        }
      }
    }
  }

char *sub_100003158(void *a1)
{
  uint64_t v9 = 0LL;
  string = xpc_dictionary_get_string(a1, "method");
  if (!string) {
    goto LABEL_10;
  }
  id v3 = string;
  if (!strcmp(string, "post") || !strcmp(v3, "post_all"))
  {
    xpc_dictionary_get_uint64(a1, "options");
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    xpc_dictionary_get_string(a1, "name");
    xpc_dictionary_get_string(a1, "object");
    asprintf(&v9, "[ %s v%llu '%s' '%s' %s ]");
  }

  else if (!strcmp(v3, "post_token") || !strcmp(v3, "register"))
  {
    xpc_dictionary_get_uint64(a1, "options");
    strcmp(v3, "register");
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    xpc_dictionary_get_string(a1, "name");
    xpc_dictionary_get_string(a1, "object");
    xpc_dictionary_get_uint64(a1, "token");
    asprintf(&v9, "[ %s v%llu '%s' '%s' %s %llu ]");
  }

  else if (!strcmp(v3, "unregister"))
  {
    xpc_object_t value = xpc_dictionary_get_value(a1, "tokens");
    uint64_t v5 = xpc_copy_description(value);
    uint64_t v6 = xpc_dictionary_get_string(a1, "method");
    uint64_t uint64 = xpc_dictionary_get_uint64(a1, "version");
    asprintf(&v9, "[ %s v%llu %s ]", v6, uint64, v5);
    free(v5);
  }

  else
  {
    if (strcmp(v3, "ping") && strcmp(v3, "suspend") && strcmp(v3, "unsuspend"))
    {
LABEL_10:
      uint64_t v9 = xpc_copy_description(a1);
      goto LABEL_15;
    }

    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    asprintf(&v9, "[ %s v%llu ]");
  }

LABEL_15:
  if (v9) {
    return v9;
  }
  else {
    return "[ ??? ]";
  }
}

uint64_t sub_1000034B0(uint64_t a1, int a2, xpc_object_t xuint)
{
  uint64_t value = xpc_uint64_get_value(xuint);
  if (qword_10000CDF8 != -1) {
    dispatch_once(&qword_10000CDF8, &stru_100008580);
  }
  uint64_t v5 = (os_log_s *)qword_10000CE00;
  if (os_log_type_enabled((os_log_t)qword_10000CE00, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 72LL);
    int v8 = 134218240;
    uint64_t v9 = value;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "unregister token: %llx pid: %d",  (uint8_t *)&v8,  0x12u);
  }

  CFXNotificationRegistrarRemoveRemoteToken(*(void *)(*(void *)(a1 + 32) + 24LL), value);
  return 1LL;
}

uint64_t sub_1000035B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1LL;
}

uint64_t sub_1000038E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1LL;
}

uint64_t sub_100003CC8(uint64_t a1, int a2, xpc_object_t xdict)
{
  if (*(void *)(a1 + 48) != xpc_dictionary_get_uint64(xdict, "token")
    || (string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "name")) == 0LL
    || strcmp(*(const char **)(a1 + 56), string)
    || (int v6 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "object"), strcmp(*(const char **)(a1 + 64), v6)))
  {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 40), xdict);
  }

  return 1LL;
}

_BYTE *sub_100003EE0(_BYTE *result)
{
  if ((*result & 6) != 0)
  {
    v1 = result;
    v2 = -[_NSDNXPCServer initWithConfiguration:]( objc_alloc(&OBJC_CLASS____NSDNXPCServer),  "initWithConfiguration:",  result);
    *((void *)v1 + 1) = v2;
    uint64_t v3 = 32LL;
    if ((*(void *)v1 & 1LL) == 0) {
      uint64_t v3 = 40LL;
    }
    -[_NSDNXPCServer setServiceName:](v2, "setServiceName:", *(void *)&v1[v3]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100003FBC;
    v6[3] = &unk_1000084F0;
    v6[4] = v1;
    [*((id *)v1 + 1) setMakeNewClient:v6];
    if ((*v1 & 1) != 0) {
      [*((id *)v1 + 1) setPrivileged:1];
    }
    [*((id *)v1 + 1) start:*((void *)v1 + 10)];
    uint64_t v4 = *(void *)v1;
    id result = [*((id *)v1 + 1) createEndpoint];
    uint64_t v5 = 56LL;
    if ((v4 & 1) == 0) {
      uint64_t v5 = 64LL;
    }
    *(void *)&v1[v5] = result;
  }

  return result;
}

ClientOfLocalNoteServer *sub_100003FBC(uint64_t a1, uint64_t a2)
{
  return  -[ClientOfLocalNoteServer initWithClientConnection:configuration:]( objc_alloc(&OBJC_CLASS___ClientOfLocalNoteServer),  "initWithClientConnection:configuration:",  a2,  *(void *)(a1 + 32));
}

void sub_100003FF4(uint64_t a1, _xpc_connection_s *object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24LL);
    uint64_t v21 = 0LL;
    __int128 v22 = &v21;
    uint64_t v23 = 0x3052000000LL;
    __int128 v24 = sub_100004308;
    __int128 v25 = sub_100004318;
    uint64_t v26 = 0LL;
    v7 = (void *)(*(uint64_t (**)(void))(v6 + 16))();
    v22[5] = (uint64_t)v7;
    id v8 = v7;
    if (v22[5])
    {
      [*(id *)(*(void *)(a1 + 32) + 32) addObject:];
      uint64_t v9 = (void *)v22[5];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100004324;
      v20[3] = &unk_100008518;
      v20[4] = *(void *)(a1 + 32);
      v20[5] = &v21;
      [v9 addInvalidationHandler:v20];
      [(id)v22[5] start:*(void *)(a1 + 40)];
    }

    else
    {
      xpc_connection_cancel(object);
    }

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_error)
    {
      uint64_t v4 = xpc_copy_description(object);
      BOOL v5 = v4 == 0LL;
      CFLog(3LL, @"Error: Received mysterious event type: %s");
LABEL_4:
      if (!v5) {
        free(v4);
      }
      return;
    }

    if (object != (_xpc_connection_s *)&_xpc_error_connection_invalid)
    {
      if (object == (_xpc_connection_s *)&_xpc_error_termination_imminent) {
        return;
      }
      uint64_t v4 = xpc_copy_description(object);
      BOOL v5 = v4 == 0LL;
      CFLog(3LL, @"Unknown or mysterious error received: %s");
      goto LABEL_4;
    }

    ++*(_DWORD *)(*(void *)(a1 + 32) + 52LL);
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 8);
    if (v11)
    {
      xpc_release(v11);
      uint64_t v10 = *(void *)(a1 + 32);
    }

    *(void *)(v10 + 8) = 0LL;
    id v12 = objc_msgSend(*(id *)(a1 + 32), "__invalidate");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v16 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i) + 16LL))();
        }

        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v27 count:16];
      }

      while (v13);
    }
  }

void sub_1000042E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_100004308(uint64_t a1, uint64_t a2)
{
}

void sub_100004318(uint64_t a1)
{
}

id sub_100004324(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_100004338(id a1)
{
  qword_10000CDF0 = (uint64_t)os_log_create("com.apple.distnoted", "info");
}

void sub_100004364(id a1)
{
  qword_10000CE00 = (uint64_t)os_log_create("com.apple.distnoted", "diagnostic");
}

void sub_100004390(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

uint64_t start()
{
  time_t v4 = time(0LL);
  getuid();
  ctime_r(&v4, v5);
  v5[24] = 0;
  getpid();
  CFLog(4LL, @"# distnote server %s  absolute time: %.9f   civil time: %s   pid: %ld uid: %ld  root: %s");
  v0 = objc_autoreleasePoolPush();
  qword_10000CD88 = 3LL;
  dispatch_workloop_t v1 = dispatch_workloop_create("com.apple.distnoted.work");
  qword_10000CDD8 = (uint64_t)dispatch_queue_create("com.apple.distnote.work.target", 0LL);
  dispatch_set_target_queue((dispatch_object_t)qword_10000CDD8, v1);
  sub_100003EE0(&qword_10000CD88);
  signal(30, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0LL, 0LL);
  dispatch_source_set_event_handler(v2, &stru_1000085E0);
  dispatch_resume(v2);
  CFRunLoopRun();
  dispatch_release(v2);

  objc_autoreleasePoolPop(v0);
  getpid();
  CFLog( 4LL,  @"# exiting at end of run loop: distnote server %s  absolute time: %.9f   civil time: %s   pid: %ld uid: %ld  root: %s");
  return 0LL;
}

void sub_100004568(id a1)
{
  if (qword_10000CE10 != -1) {
    dispatch_once(&qword_10000CE10, &stru_100008600);
  }
  sub_100002174((os_log_s *)qword_10000CE08, (uint64_t)&qword_10000CD88);
}

void sub_1000045B0(id a1)
{
  qword_10000CE08 = (uint64_t)os_log_create("com.apple.distnoted.agent", "debug-info");
}

void sub_100004D84(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(object, "com.apple.NSXPC.msg_needs_ack"))
    {
      xpc_dictionary_set_value(object, "com.apple.NSXPC.msg_needs_ack", 0LL);
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      if (reply)
      {
        uint64_t v6 = reply;
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
        xpc_release(v6);
      }
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 24LL);
    if (v7) {
      (*(void (**)(uint64_t, xpc_object_t))(v7 + 16))(v7, object);
    }
  }

  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      ++*(_DWORD *)(*(void *)(a1 + 40) + 52LL);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(v8 + 8);
      if (v9)
      {
        xpc_release(v9);
        uint64_t v8 = *(void *)(a1 + 40);
      }

      *(void *)(v8 + 8) = 0LL;
      id v10 = [*(id *)(a1 + 40) __invalidate];
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i) + 16LL))();
          }

          id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v12);
      }
    }

    else if (object == &_xpc_error_connection_interrupted)
    {
      if ((*(_DWORD *)(a1 + 48) & 0xFFFFFFFE) == 4)
      {
        CFStringRef v15 = *(_xpc_connection_s **)(*(void *)(a1 + 40) + 8LL);
        if (v15) {
          xpc_connection_cancel(v15);
        }
      }
    }

    else if (object == &_xpc_error_termination_imminent)
    {
      [*(id *)(a1 + 40) __terminationImminent];
      CFLog(6LL, @"Connection %p received termination imminent");
    }

    else
    {
      time_t v4 = xpc_copy_description(object);
      CFLog(3LL, @"Unknown or mysterious error received: %s");
      if (v4) {
        free(v4);
      }
    }
  }

  else
  {
    __break(1u);
  }

void sub_10000506C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100004390((void *)&_mh_execute_header, (int)a2, a3, "    Register-all Forbidden: true", a1);
}

void sub_10000509C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100004390((void *)&_mh_execute_header, (int)a2, a3, "    Broadcasting Forbidden: true", a1);
}

void sub_1000050CC(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[3];
  int v6 = 138544130;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "    name: %{public}@ object: %{public}@ token: %llu options: %lX",  (uint8_t *)&v6,  0x2Au);
}

void sub_10000516C(id *a1, os_log_s *a2)
{
  id v4 = objc_msgSend(objc_msgSend(*a1, "processName"), "UTF8String");
  int v5 = *((_DWORD *)*a1 + 18);
  int v6 = 136446466;
  id v7 = v4;
  __int16 v8 = 1026;
  int v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s (%{public}d) restricted from sending userInfo payloads due to sandboxing",  (uint8_t *)&v6,  0x12u);
}

id objc_msgSend_start_(void *a1, const char *a2, ...)
{
  return [a1 start:];
}