void sub_100001AEC( uint64_t a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v11;
  CFStringRef v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  char buffer[2048];
  bzero(buffer, 0x800uLL);
  if (!a2) {
    a2 = "";
  }
  v11 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a3, &a9);
  v12 = v11;
  if (v11 && !CFStringGetCString(v11, buffer, 2048LL, 0x8000100u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve C string.",  buf,  2u);
    }

    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = a2;
    v15 = 2080;
    v16 = buffer;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
  }

  if (v12) {
LABEL_8:
  }
    CFRelease(v12);
}

BOOL sub_100001C50(int a1)
{
  int v10 = 1;
  int v1 = setsockopt(a1, 0xFFFF, 0x10000, &v10, 4u);
  if (v1 == -1)
  {
    v2 = __error();
    char v3 = strerror(*v2);
    sub_100001AEC( 0LL,  "_disable_wake_from_sleep",  @"setsockopt(SO_NOWAKEFROMSLEEP) failed: %s",  v4,  v5,  v6,  v7,  v8,  v3);
  }

  return v1 != -1;
}

BOOL sub_100001CC8(int a1)
{
  int v10 = 1;
  BOOL result = sub_100001C50(a1);
  if (result)
  {
    if (setsockopt(a1, 0xFFFF, 4388, &v10, 4u) == -1)
    {
      char v3 = __error();
      char v4 = strerror(*v3);
      sub_100001AEC( 0LL,  "set_socket_option_want_closed_event_no_wake",  @"setsockopt(SO_WANT_KEV_SOCKET_CLOSED) failed: %s",  v5,  v6,  v7,  v8,  v9,  v4);
      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

BOOL sub_100001D50(int a1, unsigned int a2)
{
  v11[0] = a2;
  v11[1] = 0LL;
  int v2 = setsockopt(a1, 0xFFFF, 4102, v11, 0x10u);
  if (v2 == -1)
  {
    char v3 = __error();
    char v4 = strerror(*v3);
    sub_100001AEC( 0LL,  "set_socket_option_recv_timeout",  @"setsockopt(SO_RCVTIMEO) failed: %s",  v5,  v6,  v7,  v8,  v9,  v4);
  }

  return v2 != -1;
}

BOOL sub_100001DC8(int a1, unsigned int a2)
{
  v11[0] = a2;
  v11[1] = 0LL;
  int v2 = setsockopt(a1, 0xFFFF, 4101, v11, 0x10u);
  if (v2 == -1)
  {
    char v3 = __error();
    char v4 = strerror(*v3);
    sub_100001AEC( 0LL,  "set_socket_option_send_timeout",  @"setsockopt(SO_SNDTIMEO) failed: %s",  v5,  v6,  v7,  v8,  v9,  v4);
  }

  return v2 != -1;
}

void sub_100001E40(const __CFString *a1, const __CFDictionary *a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, a1, 0LL, 1u);
  if (a2)
  {
    uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v5, a1, a1, a2, 1u);
  }
}

void sub_100001F18(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cleaning up for closed peer: %{public}@",  buf,  0xCu);
  }

  char v3 = (void *)qword_100010C10;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000200C;
  v4[3] = &unk_10000C4A8;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_10000200C(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 peerName]);
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138543362;
      uint64_t v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Host socket closed: %{public}@",  (uint8_t *)&v17,  0xCu);
    }

    unsigned int v10 = 1;
    [v6 setLockdownSockConfirmedClosed:1];
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 servicesAwaitingClose]);
    unsigned int v10 = [v11 containsObject:*(void *)(a1 + 32)];

    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v17 = 138543362;
        uint64_t v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Service socket closed: %{public}@",  (uint8_t *)&v17,  0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 servicesAwaitingClose]);
      [v13 removeObject:*(void *)(a1 + 32)];

      unsigned int v10 = 1;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100007EB0(v6);
  }
  if ([v6 aboutToSleep])
  {
    if ([v6 lockdownSockConfirmedClosed])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 servicesAwaitingClose]);
      id v15 = [v14 count];

      if (!v15)
      {
        v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 powerDownTimer]);
        dispatch_source_cancel(v16);
      }
    }
  }

  if (v10) {
    *a4 = 1;
  }
}

void sub_100002298(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100010C10 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  char v3 = *(void **)(a1 + 32);
  id v4 = v2;
  if (v2) {
    [v2 addService:v3];
  }
  else {
    [v3 invalidate];
  }
}

void sub_100002370(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100010C10 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v2 removeService:*(void *)(a1 + 32)];
}

void sub_10000257C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t sub_1000025A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000025B8(uint64_t a1)
{
}

void sub_1000025C0(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100010C10 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 hostID]);
  unsigned int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
}

id sub_10000263C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000269C;
  v2[3] = &unk_10000C548;
  v2[4] = *(void *)(a1 + 32);
  return [(id)qword_100010C10 enumerateKeysAndObjectsUsingBlock:v2];
}

id sub_10000269C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:");
}

id sub_100002708(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100002770;
  v2[3] = &unk_10000C5B0;
  v2[4] = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 40);
  return [(id)qword_100010C10 enumerateKeysAndObjectsUsingBlock:v2];
}

id sub_100002770(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000027D4;
  v4[3] = &unk_10000C590;
  void v4[4] = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 40);
  return [a3 enumerateServices:v4];
}

void sub_1000027D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    unsigned int v5 = [v3 hasHeartbeatRef:*(void *)(a1 + 32) pid:*(unsigned int *)(a1 + 40)];
    id v4 = v6;
    if (v5)
    {
      [v6 invalidate];
      id v4 = v6;
    }
  }
}

void sub_100002934(uint64_t a1)
{
  int v1 = (void *)qword_100010C10;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000029A4;
  v2[3] = &unk_10000C4A8;
  id v3 = *(id *)(a1 + 32);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void sub_1000029A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 hostID]);
  [v7 addObject:v8];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Watchers for host %{public}@:",  (uint8_t *)&v9,  0xCu);
    }

    [v6 enumerateServices:&stru_10000C610];
  }
}

void sub_100002A98(id a1, WatchedServiceInfo *a2)
{
  if (a2) {
    -[WatchedServiceInfo logService:](a2, "logService:", "    ");
  }
}

LABEL_11:
    uint64_t v12 = 0LL;
    v13 = 0LL;
    goto LABEL_12;
  }

  int v17 = bswap32(v28);
  v28 = v17;
  if (v17 > 0x2000)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v28;
    id v10 = "Message size of %d is too large.";
    v11 = 8;
    goto LABEL_10;
  }

  if (*a4 >= v17)
  {
    v19 = *a3;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v30 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Growing read buffer size to %d.",  buf,  8u);
    }

    *a4 = v28;
    free(*a3);
    uint64_t v18 = (char *)malloc(*a4);
    *a3 = v18;
    if (!v18)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      v26 = *a4;
      *(_DWORD *)buf = 134217984;
      *(void *)v30 = v26;
      id v10 = "Failed to allocate buffer of size %ld.";
      v11 = 12;
      goto LABEL_10;
    }

    v19 = v18;
    int v17 = v28;
  }

  if (-[HostWatcher receivePacket:size:](self, "receivePacket:size:", v19, v17))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v20;
    *(_WORD *)&v30[4] = 2082;
    *(void *)&v30[6] = v22;
    id v10 = "Failed to read message: %d %{public}s";
    goto LABEL_6;
  }

  v23 = objc_alloc(&OBJC_CLASS___NSData);
  v24 = -[NSData initWithBytes:length:](v23, "initWithBytes:length:", *a3, v28);
  if (!v24)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v10 = "Failed to allocate data.";
    goto LABEL_9;
  }

  uint64_t v12 = v24;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v24,  0LL,  0LL,  0LL));
  v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v13, v25) & 1) != 0)
  {
    v14 = v13;
    v13 = v14;
    goto LABEL_13;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher hostID](self, "hostID"));
    *(_DWORD *)buf = 138543618;
    *(void *)v30 = v13;
    *(_WORD *)&v30[8] = 2114;
    *(void *)&v30[10] = v27;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid message (%{public}@) received from host %{public}@.",  buf,  0x16u);
  }

    int v9 = -1;
    goto LABEL_12;
  }

  remote_connection = xpc_dictionary_get_remote_connection(v3);
  id v6 = objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      id v10 = "Failed to retrieve message from service.";
      v11 = (uint8_t *)&v13;
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  uint64_t v7 = (_xpc_connection_s *)v6;
  reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "HB_PARAM_REF", -[WatchedServiceInfo heartbeatRef](v4, "heartbeatRef"));
    xpc_connection_send_message(v7, reply);
  }

  -[WatchedServiceInfo logService:](v4, "logService:", "Watching");

  int v9 = 0;
LABEL_12:

  return v9;
}

LABEL_12:
  v14 = 0LL;
LABEL_13:
  id v15 = v14;

  return v15;
}

void sub_10000310C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000312C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained hostID]);

  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000031BC;
    block[3] = &unk_10000C658;
    uint64_t v3 = *(void *)(a1 + 32);
    block[4] = WeakRetained;
    block[5] = v3;
    dispatch_sync((dispatch_queue_t)qword_100010C18, block);
  }
}

void sub_1000031BC(uint64_t a1)
{
  id v2 = (void *)qword_100010C10;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hostID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (v4 == *(void **)(a1 + 32))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 hostID]);
    v16 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    int v17 = v7;
    sub_100001E40( @"com.apple.heartbeatd.host.detached",  (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

    unsigned int v8 = (void *)qword_100010C10;
    int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hostID]);
    [v8 removeObjectForKey:v9];

    [*(id *)(a1 + 32) setHostID:0];
  }

  else if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hostID]);
    int v12 = 138543618;
    v13 = v5;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Watcher for %{public}@ has already been replaced by %{public}@.",  (uint8_t *)&v12,  0x16u);
  }

  if ([*(id *)(a1 + 32) powerConn])
  {
    IOReturn v10 = IODeregisterForSystemPower((io_object_t *)(*(void *)(a1 + 32) + 20LL));
    if (v10)
    {
      IOReturn v11 = v10;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109120;
        LODWORD(v13) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODeregisterForSystemPower failed: %08x",  (uint8_t *)&v12,  8u);
      }
    }

    IONotificationPortDestroy((IONotificationPortRef)[*(id *)(a1 + 32) powerPort]);
    IOServiceClose((io_connect_t)[*(id *)(a1 + 32) powerConn]);
    [*(id *)(a1 + 32) setPowerPort:0];
    [*(id *)(a1 + 32) setPowerNotifier:0];
    [*(id *)(a1 + 32) setPowerConn:0];
  }

  [*(id *)(a1 + 32) enumerateServices:&stru_10000C630];
}

void sub_100003438(id a1, WatchedServiceInfo *a2)
{
}

LABEL_31:
    IOReturn v10 = 0LL;
    id v6 = 0LL;
LABEL_36:
    -[HostWatcher invalidate](self, "invalidate");
    goto LABEL_37;
  }

  if (qword_100010C48 != -1) {
    dispatch_once(&qword_100010C48, &stru_10000C878);
  }
  id v4 = qword_100010C50;
  if (qword_100010C50)
  {
    id v5 = qword_100010C58;
    goto LABEL_6;
  }

  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
    || (*(_WORD *)buf = 0,
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to ping create message.",  buf,  2u),  (id v4 = qword_100010C50) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Failed to allocate write buffer.";
      goto LABEL_30;
    }

    goto LABEL_31;
  }

  id v5 = 0LL;
LABEL_6:
  id v6 = dispatch_queue_create("com.apple.mobile.heartbeat.lastPing", 0LL);
  if (!v34[3])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Failed to allocate queue.";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }

LABEL_35:
    IOReturn v10 = 0LL;
    goto LABEL_36;
  }

  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Failed to create timer.";
      goto LABEL_34;
    }

    goto LABEL_35;
  }

  unsigned int v8 = v7;
  int v9 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer(v8, v9, 0x2540BE400uLL, 0x12A05F200uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003B78;
  handler[3] = &unk_10000C6A8;
  objc_copyWeak(&v31, &location);
  v30 = &v33;
  IOReturn v10 = v8;
  v29 = v10;
  dispatch_source_set_event_handler(v10, handler);

  objc_destroyWeak(&v31);
  dispatch_resume(v10);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v40 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting loop for %{public}@",  buf,  0xCu);
  }

  LODWORD(v12) = 0;
  *(void *)&IOReturn v11 = 134218242LL;
  v24 = v11;
  while (!-[HostWatcher invalidated](self, "invalidated", v24) && !-[HostWatcher aboutToSleep](self, "aboutToSleep"))
  {
    if (-[HostWatcher sendPacket:size:](self, "sendPacket:size:", v4, v5))
    {
      v20 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *__error();
        v22 = __error();
        v23 = strerror(*v22);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v40 = v21;
        *(_WORD *)&v40[4] = 2082;
        *(void *)&v40[6] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to send ping: %d %{public}s",  buf,  0x12u);
      }

      LODWORD(v12) = 0;
      break;
    }

    v13 = objc_autoreleasePoolPush();
    int v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HostWatcher receiveMessage:size:](self, "receiveMessage:size:", &v37, &v38));
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100003CC0;
      block[3] = &unk_10000C570;
      block[4] = &v33;
      dispatch_sync(v6, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        __int16 v14 = v34[3];
        *(_DWORD *)buf = v24;
        *(void *)v40 = v14;
        *(_WORD *)&v40[8] = 2114;
        *(void *)&v40[10] = v12;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received response at %llu: %{public}@",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to receive ping response.",  buf,  2u);
    }

    objc_autoreleasePoolPop(v13);
    if (!v12) {
      break;
    }
    id v15 = dispatch_time(0LL, 10000000000LL);
    global_queue = dispatch_get_global_queue(0LL, 0LL);
    int v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100003CEC;
    v25[3] = &unk_10000C6D0;
    objc_copyWeak(&v26, &location);
    dispatch_after(v15, v17, v25);

    int v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HostWatcher pingSem](self, "pingSem"));
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v26);
    LODWORD(v12) = 1;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v40 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Ended loop for %{public}@",  buf,  0xCu);
  }

  dispatch_source_cancel(v10);
  if (!(_DWORD)v12) {
    goto LABEL_36;
  }
LABEL_37:
  if (v37) {
    free(v37);
  }
  v37 = 0LL;
  objc_destroyWeak(&location);

  _Block_object_dispose(&v33, 8);
}

void sub_100003AC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id location, char a29)
{
}

unint64_t sub_100003B0C()
{
  if (qword_100010C40 != -1) {
    dispatch_once(&qword_100010C40, &stru_10000C858);
  }
  uint64_t v0 = mach_absolute_time();
  LODWORD(v1) = dword_100010C38;
  LODWORD(v2) = *(_DWORD *)algn_100010C3C;
  return (unint64_t)((double)v0 * (double)v1 / (double)v2 / 1000000000.0);
}

void sub_100003B78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v3 = sub_100003B0C();
  if (v3 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0x14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained hostID]);
      int v6 = 134218498;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      unint64_t v9 = v3;
      __int16 v10 = 2114;
      IOReturn v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "lastPing was at %llu, now %llu; timing out host %{public}@",
        (uint8_t *)&v6,
        0x20u);
    }

    [WeakRetained invalidate];
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100007F7C(a1 + 40, WeakRetained);
  }
}

unint64_t sub_100003CC0(uint64_t a1)
{
  unint64_t result = sub_100003B0C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_100003CEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pingSem]);

  if (v1)
  {
    unint64_t v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([WeakRetained pingSem]);
    dispatch_semaphore_signal(v2);
  }
}

void sub_100004118( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100004160(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained servicesAwaitingClose]);
    [v3 removeAllObjects];

    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000041E8;
    v4[3] = &unk_10000C6F8;
    void v4[4] = v2;
    [v2 enumerateServices:v4];
  }
}

void sub_1000041E8(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 servicesAwaitingClose]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 peerName]);

  [v5 addObject:v4];
}

void sub_10000424C(uint64_t a1)
{
  unint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v24 = 256LL;
  if (WeakRetained)
  {
    uint64_t v4 = malloc(0x100uLL);
    v23 = v4;
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (!v4)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate read buffer.",  buf,  2u);
      }

      goto LABEL_31;
    }

    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v26[0] = 5LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Holding off sleep for at most %lld seconds.",  buf,  0xCu);
    }

    sub_100001D50((int)[WeakRetained sock], 1u);
    sub_100001DC8((int)[WeakRetained sock], 1u);
    if (qword_100010C60 != -1) {
      dispatch_once(&qword_100010C60, &stru_10000C898);
    }
    if (!qword_100010C68)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
        || (*(_WORD *)buf = 0,
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create sleep message.",  buf,  2u),  !qword_100010C68))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          IOReturn v11 = "Failed to create SleepyTime message.";
          uint32_t v12 = 2;
          goto LABEL_25;
        }

LABEL_30:
        free(v4);
        goto LABEL_31;
      }
    }

    unsigned int v6 = objc_msgSend(WeakRetained, "sendPacket:size:");
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        int v8 = *__error();
        unint64_t v9 = __error();
        __int16 v10 = strerror(*v9);
        *(_DWORD *)buf = 67109378;
        LODWORD(v26[0]) = v8;
        WORD2(v26[0]) = 2082;
        *(void *)((char *)v26 + 6) = v10;
        IOReturn v11 = "Failed to send SleepyTime message: %d %{public}s";
        uint32_t v12 = 18;
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
        goto LABEL_30;
      }

      goto LABEL_30;
    }

    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sent SleepyTime.",  buf,  2u);
    }

    v13 = objc_autoreleasePoolPush();
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained receiveMessage:&v23 size:&v24]);
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (!v15) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 138543362;
      v26[0] = v14;
      v16 = "Received SleepyTime response: %{public}@";
      uint32_t v17 = 12;
    }

    else
    {
      if (!v15) {
        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v16 = "Failed to receive SleepyTime response.";
      uint32_t v17 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
LABEL_29:

    objc_autoreleasePoolPop(v13);
    uint64_t v4 = v23;
    if (!v23)
    {
LABEL_31:
      v23 = 0LL;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004744;
      block[3] = &unk_10000C4D0;
      block[4] = WeakRetained;
      dispatch_sync((dispatch_queue_t)qword_100010C18, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting power down timer to monitor sockets closing.",  buf,  2u);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000047A4;
      v20[3] = &unk_10000C740;
      objc_copyWeak(v21, v2);
      v21[1] = *(id *)(a1 + 40);
      [WeakRetained setSleepHandler:v20];
      [WeakRetained setSleepTimerEnabled:1];
      uint64_t v18 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained powerDownTimer]);
      dispatch_time_t v19 = dispatch_time(0LL, 5000000000LL);
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      objc_destroyWeak(v21);
      goto LABEL_34;
    }

    goto LABEL_30;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid object.",  buf,  2u);
  }

LABEL_34:
}

void sub_100004724(_Unwind_Exception *a1)
{
}

id sub_100004744(uint64_t a1)
{
  if ([*(id *)(a1 + 32) ldConn])
  {
    lockdown_disconnect([*(id *)(a1 + 32) ldConn]);
    [*(id *)(a1 + 32) setLdConn:0];
    [*(id *)(a1 + 32) setSock:0xFFFFFFFFLL];
  }

  return [*(id *)(a1 + 32) enumerateServices:&stru_10000C718];
}

void sub_10000479C(id a1, WatchedServiceInfo *a2)
{
}

void sub_1000047A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained sleepTimerEnabled])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Allowing power change for sleep.",  (uint8_t *)v5,  2u);
    }

    IOReturn v3 = IOAllowPowerChange((io_connect_t)[WeakRetained powerConn], *(void *)(a1 + 40));
    if (v3)
    {
      IOReturn v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IOAllowPowerChange failed: %08x",  (uint8_t *)v5,  8u);
      }
    }

    [WeakRetained setSleepTimerEnabled:0];
    [WeakRetained invalidate];
  }
}

LABEL_71:
                      goto LABEL_46;
                    }

                    int v8 = 0;
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_47;
                    }
                    *(_WORD *)buf = 0;
                    unint64_t v9 = "Failed to create string.";
                  }

                  else
                  {
                    int v8 = 0;
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_47;
                    }
                    *(_WORD *)buf = 0;
                    unint64_t v9 = "Failed to register for system power notifications.";
                  }
                }

                else
                {
                  int v8 = 0;
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_47;
                  }
                  *(_WORD *)buf = 0;
                  unint64_t v9 = "Failed to create string.";
                }
              }

              else
              {
                int v8 = 0;
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_47;
                }
                *(_WORD *)buf = 0;
                unint64_t v9 = "Failed to get _peerName from socket.";
              }
            }

            else
            {
              int v8 = 0;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_47;
              }
              *(_WORD *)buf = 0;
              unint64_t v9 = "Failed setting _sock options";
            }
          }

          else
          {
            int v8 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_47;
            }
            *(_WORD *)buf = 0;
            unint64_t v9 = "Failed to create set.";
          }
        }

        else
        {
          int v8 = 0;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          *(_WORD *)buf = 0;
          unint64_t v9 = "Failed to create set.";
        }
      }
    }

    else
    {
      int v8 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      unint64_t v9 = "Checkin info did not contain host ID.";
    }

    __int16 v10 = 2;
    goto LABEL_45;
  }

  BOOL v7 = v6;
  int v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v66) = v7;
    unint64_t v9 = "Failed to checkin: %d";
    __int16 v10 = 8;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
LABEL_46:
    int v8 = 0;
  }

LABEL_47:
LABEL_48:
  if (theDict) {
    CFRelease(theDict);
  }
  theDict = 0LL;
  if (v4) {
    v52 = v8;
  }
  else {
    v52 = 1;
  }
  if ((v52 & 1) == 0)
  {
    if (*((_DWORD *)v4 + 4))
    {
      v53 = IODeregisterForSystemPower((io_object_t *)v4 + 5);
      if (v53)
      {
        v54 = v53;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v66) = v54;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODeregisterForSystemPower failed: %08x",  buf,  8u);
        }
      }

      IONotificationPortDestroy(*((IONotificationPortRef *)v4 + 15));
      IOServiceClose(*((_DWORD *)v4 + 4));
      *((void *)v4 + 15) = 0LL;
      *((void *)v4 + 2) = 0LL;
    }

    v55 = *((void *)v4 + 8);
    if (v55)
    {
      lockdown_disconnect(v55);
      *((void *)v4 + 8) = 0LL;
    }

    return 0LL;
  }

  return (HostWatcher *)v4;
}

id sub_100005218(int a1)
{
  int v35 = 0;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  sockaddr v4 = (sockaddr)0;
  __int128 v5 = 0u;
  socklen_t v3 = 499;
  if (getpeername(a1, &v4, &v3)) {
    return 0LL;
  }
  unint64_t v2 = sub_100007AB8(&v4);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

id sub_1000052DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 handleSleepNotification:a3 service:a2 messageArgument:a4];
}

void sub_1000052E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    socklen_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained servicesAwaitingClose]);
    id v4 = [v3 count];

    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v2 servicesAwaitingClose]);
      id v6 = [v5 count];
      __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v2 peerName]);
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v2 servicesAwaitingClose]);
      int v10 = 134218498;
      id v11 = v6;
      __int16 v12 = 2114;
      __int128 v13 = v7;
      __int16 v14 = 2114;
      __int128 v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%ld services never got closed socket event for peer '%{public}@': %{public}@",  (uint8_t *)&v10,  0x20u);
    }

    __int128 v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v2 powerDownTimer]);
    dispatch_source_cancel(v9);
  }
}

void sub_100005434(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sleepHandler]);

  if (v1)
  {
    unint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained sleepHandler]);
    v2[2]();
  }
}

void sub_1000055F8(id a1, id a2, BOOL *a3)
{
}

uint64_t sub_100005A4C(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

LABEL_23:
  objc_destroyWeak(&location);
  __int128 v22 = 0LL;
LABEL_51:

  return v22;
}

void sub_100006468( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location)
{
}

void sub_100006498(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_1000065D8(_Unwind_Exception *a1)
{
}

void sub_1000065EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained procExitSource]);

    if (v1)
    {
      unint64_t v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([WeakRetained procExitSource]);
      dispatch_source_cancel(v2);

      [WeakRetained setProcExitSource:0];
    }

    socklen_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained hostID]);
    +[HostWatcher removeService:forHostID:](&OBJC_CLASS___HostWatcher, "removeService:forHostID:", WeakRetained, v3);
  }
}

uint64_t start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  if (qword_100010C30 != -1) {
    dispatch_once(&qword_100010C30, &stru_10000C7E8);
  }
  if (qword_100010C08) {
    BOOL v1 = qword_100010C18 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1 && qword_100010C10 != 0 && qword_100010C20 != 0)
  {
    int v5 = socket(32, 3, 1);
    unsigned int v6 = v5;
    if (v5 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *__error();
        __int16 v12 = __error();
        __int128 v13 = strerror(*v12);
        *(_DWORD *)buf = 67109378;
        int v35 = v11;
        __int16 v36 = 2082;
        v37 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "socket call failed: %d (%{public}s)",  buf,  0x12u);
      }

      if (v6 == -1)
      {
LABEL_30:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)handler = 0;
          id v4 = "Failed to intialize kevent monitor.";
          goto LABEL_32;
        }

        goto LABEL_33;
      }
    }

    else
    {
      int v33 = 4;
      uint64_t v32 = 0x100000001LL;
      if (ioctl(v5, 0x800C6502uLL, &v32))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = *__error();
          __int128 v8 = __error();
          __int128 v9 = strerror(*v8);
          *(_DWORD *)buf = 67109378;
          int v35 = v7;
          __int16 v36 = 2082;
          v37 = v9;
          int v10 = "ioctl(SIOCSKEVFILT) failed: %d (%{public}s)";
LABEL_27:
          uint32_t v17 = 18;
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v17);
        }
      }

      else
      {
        if (!ioctl(v6, 0x8004667EuLL, &v32))
        {
          dispatch_source_t v19 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v6,  0LL,  (dispatch_queue_t)qword_100010C20);
          __int128 v20 = (void *)qword_100010C28;
          qword_100010C28 = (uint64_t)v19;

          if (qword_100010C28)
          {
            *(void *)handler = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472LL;
            __int128 v29 = sub_100007C24;
            __int128 v30 = &unk_10000C8B8;
            unsigned int v31 = v6;
            dispatch_source_set_cancel_handler((dispatch_source_t)qword_100010C28, handler);
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472LL;
            v25[2] = sub_100007C2C;
            v25[3] = &unk_10000C8B8;
            unsigned int v26 = v6;
            dispatch_source_set_event_handler((dispatch_source_t)qword_100010C28, v25);
            dispatch_resume((dispatch_object_t)qword_100010C28);
            xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.mobile.heartbeat",  (dispatch_queue_t)qword_100010C08,  1uLL);
            if (mach_service)
            {
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472LL;
              v23[2] = sub_100006E6C;
              v23[3] = &unk_10000C838;
              __int128 v22 = mach_service;
              __int128 v24 = v22;
              xpc_connection_set_event_handler(v22, v23);

              xpc_connection_resume(v22);
              objc_autoreleasePoolPop(v0);
              CFRunLoopRun();

              return 1LL;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)handler = 0;
              id v4 = "Failed to create xpc listener.";
              goto LABEL_32;
            }

            goto LABEL_33;
          }

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          *(_WORD *)buf = 0;
          int v10 = "Failed to dispatch source.";
          uint32_t v17 = 2;
          goto LABEL_28;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = *__error();
          __int128 v15 = __error();
          __int128 v16 = strerror(*v15);
          *(_DWORD *)buf = 67109378;
          int v35 = v14;
          __int16 v36 = 2082;
          v37 = v16;
          int v10 = "ioctl(FIONBIO) failed: %d (%{public}s)";
          goto LABEL_27;
        }
      }
    }

LABEL_29:
    close(v6);
    goto LABEL_30;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)handler = 0;
    id v4 = "Failed to intialize globals.";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, handler, 2u);
  }

LABEL_33:
  objc_autoreleasePoolPop(v0);
  return 1LL;
}

void sub_100006D94(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobile.heartbeat", v2);
  id v4 = (void *)qword_100010C08;
  qword_100010C08 = (uint64_t)v3;

  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned int v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobile.heartbeat.hostwatchers", v6);
  __int128 v8 = (void *)qword_100010C18;
  qword_100010C18 = (uint64_t)v7;

  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.heartbeatd.KernelEventMonitor", v10);
  __int16 v12 = (void *)qword_100010C20;
  qword_100010C20 = (uint64_t)v11;

  __int128 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v14 = (void *)qword_100010C10;
  qword_100010C10 = (uint64_t)v13;
}

void sub_100006E6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0LL;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  xpc_type_t type = xpc_get_type(v3);
  id v4 = (void *)v12[3];
  if (v4 == &_xpc_type_connection)
  {
    unsigned int v6 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)qword_100010C08);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100007080;
    v8[3] = &unk_10000C810;
    int v10 = &v11;
    dispatch_queue_t v7 = v6;
    dispatch_queue_attr_t v9 = v7;
    xpc_connection_set_event_handler(v7, v8);
    xpc_connection_resume(v7);
  }

  else if (v4 == &_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC connection is invalid, verify mach service name is set in xpc plist.",  buf,  2u);
      }
    }

    else
    {
      dispatch_queue_attr_t v5 = xpc_copy_description(v3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        __int128 v16 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unexpected XPC event '%{public}s':",  buf,  0xCu);
      }

      free(v5);
    }

    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }

  _Block_object_dispose(&v11, 8);
}

void sub_100007058( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007080(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_get_type(v3);
  if (v3 != &_xpc_error_connection_invalid
    && *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == &_xpc_type_dictionary)
  {
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v33 = 0LL;
    __int128 v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    __int16 v36 = sub_1000025A8;
    v37 = sub_1000025B8;
    if (!lockdown_copy_checkin_info(v3, &v39))
    {
      uint64_t v8 = os_transaction_create("com.apple.mobile.lockdownd");
      dispatch_queue_attr_t v9 = (void *)v34[5];
      v34[5] = v8;

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100007680;
      block[3] = &unk_10000C520;
      block[4] = &v33;
      void block[5] = v39;
      dispatch_async(v11, block);

LABEL_24:
      _Block_object_dispose(&v33, 8);

      goto LABEL_25;
    }

    id v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v5 = v3;
    unsigned int v6 = v5;
    if (v5 && v4)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v5, "HB_PARAM_COMMAND");
      switch(uint64)
      {
        case 1uLL:
          +[WatchedServiceInfo processWatchCommand:](&OBJC_CLASS___WatchedServiceInfo, "processWatchCommand:", v6);
          goto LABEL_22;
        case 2uLL:
          string = (char *)xpc_dictionary_get_string(v6, "HB_PARAM_HOSTID");
          if (!string
            || (string = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  string,  4LL)) != 0LL)
          {
            +[HostWatcher invalidateWatcherForHost:](&OBJC_CLASS___HostWatcher, "invalidateWatcherForHost:", string);

            goto LABEL_22;
          }

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_WORD *)buf = 0;
          __int16 v12 = "Failed to create string.";
          break;
        case 3uLL:
          id v15 = v6;
          xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v15);
          uint32_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
          __int128 v18 = v17;
          if (v17)
          {
            uint64_t pid = xpc_connection_get_pid(v17);
            +[HostWatcher invalidateServiceWithPID:heartBeatRef:]( &OBJC_CLASS___HostWatcher,  "invalidateServiceWithPID:heartBeatRef:",  pid,  xpc_dictionary_get_uint64(v15, "HB_PARAM_REF"));
          }

          goto LABEL_22;
        case 4uLL:
          id v41 = 0LL;
          +[HostWatcher dumpConnectedHosts:](&OBJC_CLASS___HostWatcher, "dumpConnectedHosts:", &v41);
          __int128 v21 = (char *)v41;
          uint64_t v13 = v21;
          if (!v21 || ![v21 count]) {
            goto LABEL_38;
          }
          id v40 = 0LL;
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v13,  200LL,  0LL,  &v40));
          id v23 = v40;
          if (v22)
          {
            id v20 = v22;
            id v24 = [v20 bytes];
            id v25 = [v20 length];
            dispatch_queue_global_t v26 = dispatch_get_global_queue(0LL, 0LL);
            __int128 v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
            uint64_t v28 = dispatch_data_create(v24, (size_t)v25, v27, &stru_10000C8D8);

            if (v28)
            {
              xpc_object_t v29 = xpc_data_create_with_dispatch_data(v28);
              if (v29)
              {
                xpc_object_t reply = xpc_dictionary_create_reply(v6);
                unsigned int v31 = reply;
                if (reply)
                {
                  xpc_dictionary_set_value(reply, "HB_PARAM_OBJECT", v29);
                  xpc_connection_send_message(v4, v31);
                }

                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to create xpc reply dictionary",  buf,  2u);
                  }
                }
              }

              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to create xpc data",  buf,  2u);
                }
              }
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to create dispatch data",  buf,  2u);
              }
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = (char *)v23;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to serialize data: %{public}@",  buf,  0xCu);
            }

LABEL_38:
            id v20 = 0LL;
          }

          goto LABEL_23;
        default:
          uint64_t v13 = xpc_copy_description(v6);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v43 = v13;
            __int16 v44 = 2048;
            uint64_t v45 = uint64;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid command (%{public}s): %lld",  buf,  0x16u);
          }

          if (!v13) {
            goto LABEL_38;
          }
          free(v13);
          goto LABEL_22;
      }
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      __int16 v12 = "Invalid input(s).";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_22:
    id v20 = 0LL;
    uint64_t v13 = 0LL;
LABEL_23:

    goto LABEL_24;
  }

LABEL_25:
}

void sub_100007660( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_100007680(uint64_t a1)
{
  unint64_t v2 = -[HostWatcher initWithCheckinGoop:]( objc_alloc(&OBJC_CLASS___HostWatcher),  "initWithCheckinGoop:",  *(void *)(a1 + 40));
  id v3 = v2;
  if (v2)
  {
    id v4 = (dispatch_queue_s *)qword_100010C18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007790;
    block[3] = &unk_10000C4D0;
    id v5 = v2;
    __int16 v12 = v5;
    dispatch_sync(v4, block);
    unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HostWatcher pingQueue](v5, "pingQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000078C0;
    v9[3] = &unk_10000C4D0;
    int v10 = v5;
    dispatch_async(v6, v9);
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;
}

void sub_100007790(uint64_t a1)
{
  unint64_t v2 = (void *)qword_100010C10;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hostID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hostID]);
      int v9 = 138543618;
      int v10 = v5;
      __int16 v11 = 2114;
      __int16 v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Replacing old hostWatcher %{public}@ with %{public}@",  (uint8_t *)&v9,  0x16u);
    }

    [v4 invalidate];
  }

  unsigned int v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)qword_100010C10;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 hostID]);
  [v7 setObject:v6 forKeyedSubscript:v8];
}

id sub_1000078C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) runWatcher];
}

void sub_1000078C8(id a1)
{
}

void sub_1000078D4(id a1)
{
  qword_100010C50 = (uint64_t)sub_1000078FC(0, &qword_100010C58);
}

_DWORD *sub_1000078FC(int a1, void *a2)
{
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      __int16 v12 = "Invalid input.";
      uint64_t v13 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }

    return 0LL;
  }

  id v3 = &off_10000CD40;
  if (a1 != 1) {
    id v3 = 0LL;
  }
  if (a1) {
    id v4 = v3;
  }
  else {
    id v4 = &off_10000CD18;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  100LL,  0LL,  0LL));
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v12 = "Failed to create data.";
      uint64_t v13 = buf;
      goto LABEL_14;
    }

    return 0LL;
  }

  unsigned int v6 = v5;
  uint64_t v7 = (char *)[v5 length];
  uint64_t v8 = malloc((size_t)(v7 + 4));
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate buffer.",  (uint8_t *)v15,  2u);
    }

    return 0LL;
  }

  int v9 = v8;
  *uint64_t v8 = bswap32(v7);
  int v10 = v8 + 1;
  id v11 = v6;
  memcpy(v10, [v11 bytes], (size_t)v7);
  *a2 = v7 + 4;

  return v9;
}

void sub_100007A90(id a1)
{
  qword_100010C68 = (uint64_t)sub_1000078FC(1, &qword_100010C70);
}

NSString *sub_100007AB8(const sockaddr *a1)
{
  *(_OWORD *)uint64_t v13 = 0u;
  __int128 v14 = 0u;
  if (getnameinfo(a1, a1->sa_len, v15, 0x401u, v13, 0x20u, 10))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return (NSString *)0LL;
    }
    int v2 = *__error();
    id v3 = __error();
    id v4 = strerror(*v3);
    *(_DWORD *)buf = 67109378;
    int v10 = v2;
    __int16 v11 = 2082;
    __int16 v12 = v4;
    id v5 = "getnameinfo failed: %d (%{public}s)";
    uint32_t v6 = 18;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
    return (NSString *)0LL;
  }

  uint64_t v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s:%s", v15, v13);
  if (!v8)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return (NSString *)0LL;
    }
    *(_WORD *)buf = 0;
    id v5 = "Failed to create string.";
    uint32_t v6 = 2;
    goto LABEL_4;
  }

  return v8;
}

uint64_t sub_100007C24(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100007C2C(uint64_t a1)
{
  ssize_t v2 = recv(*(_DWORD *)(a1 + 32), v19, 0x8000uLL, 0);
  if (v2 == -1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = *__error();
    int v10 = __error();
    __int16 v11 = strerror(*v10);
    int v15 = 67109378;
    int v16 = v9;
    __int16 v17 = 2082;
    __int128 v18 = v11;
    __int16 v12 = "Failed to receive kernel event message: %d (%{public}s)";
    uint32_t v13 = 18;
    goto LABEL_20;
  }

  ssize_t v3 = v2;
  if (v2 >= 1)
  {
    ssize_t v4 = 0LL;
    id v5 = v19;
    while (v3 - v4 >= *(unsigned int *)&v19[v4])
    {
      if (v3 - v4 >= 80
        && *((_DWORD *)v5 + 1) == 1
        && *((_DWORD *)v5 + 2) == 1
        && *((_DWORD *)v5 + 3) == 4
        && *((_DWORD *)v5 + 5) == 1)
      {
        uint32_t v6 = sub_100007AB8((const sockaddr *)(v5 + 52));
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          +[HostWatcher cleanupClosedSocketForPeer:](&OBJC_CLASS___HostWatcher, "cleanupClosedSocketForPeer:", v7);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to copy socket description.",  (uint8_t *)&v15,  2u);
        }
      }

      v4 += *(unsigned int *)&v19[v4];
      id v5 = &v19[v4];
      if (v4 >= v3) {
        return;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((_DWORD *)v5 + 5);
      int v15 = 67109120;
      int v16 = v14;
      __int16 v12 = "Failed to process kernel event message (%d): buffer too small.";
      uint32_t v13 = 8;
LABEL_20:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v12,  (uint8_t *)&v15,  v13);
    }
  }

void sub_100007E78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100007E98( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100007EB0(void *a1)
{
  ssize_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 servicesAwaitingClose]);
  [v2 count];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 peerName]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([a1 servicesAwaitingClose]);
  sub_100007E98( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%lu remaining watchers for peer '%{public}@': %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100007E88();
}

void sub_100007F7C(uint64_t a1, void *a2)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 hostID]);
  sub_100007E98( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "lastPing was at %llu, now %llu, host %{public}@ is still alive",  v3,  v4,  v5,  v6,  2u);

  sub_100007E88();
}

void sub_10000802C(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Services awaiting close for peer '%{public}@': %{public}@",  buf,  0x16u);
}

void sub_100008098( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000080CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008100( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008134(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Initialized watch command: %{public}@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_watchedServices(void *a1, const char *a2, ...)
{
  return [a1 watchedServices];
}