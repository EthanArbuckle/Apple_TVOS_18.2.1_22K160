uint64_t start()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  IONotificationPort *v13;
  IONotificationPortRef *v14;
  io_object_t v15;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  dispatch_queue_s *v18;
  _xpc_connection_s *mach_service;
  id v21;
  int v22;
  int *v23;
  char *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void v40[5];
  void handler[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSFileAttributeKey v49;
  _UNKNOWN **v50;
  uint8_t buf[4];
  _BYTE v52[14];
  v43 = 0LL;
  v44 = &v43;
  v45 = 0x3010000000LL;
  v47 = 0LL;
  v48 = 0LL;
  v46 = "";
  if ((_set_user_dir_suffix("com.apple.mobile_storage_mounter") & 1) == 0)
  {
    v21 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *__error();
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v52 = v22;
      *(_WORD *)&v52[4] = 2080;
      *(void *)&v52[6] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set temporary directory subpath: %d (%s)",  buf,  0x12u);
    }

    v25 = *__error();
    v26 = __error();
    strerror(*v26);
    v30 = sub_1000139A0( (uint64_t)"main",  1394LL,  -2,  0LL,  @"Failed to set temporary directory subpath: %d (%s)",  v27,  v28,  v29,  v25);
    v31 = [(id)objc_claimAutoreleasedReturnValue(v30) description];
    v32 = objc_claimAutoreleasedReturnValue(v31);
    _os_crash([v32 UTF8String]);

    __break(1u);
    goto LABEL_14;
  }

  v1 = sub_1000177E0();
  v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  if (!v5)
  {
LABEL_14:
    v33 = sub_1000139A0((uint64_t)"main", 1402LL, -2, 0LL, @"Failed to query working directory.", v2, v3, v4, v39);
    v34 = [(id)objc_claimAutoreleasedReturnValue(v33) description];
    v5 = objc_claimAutoreleasedReturnValue(v34);
    _os_crash([v5 UTF8String]);

    __break(1u);
    goto LABEL_15;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v49 = NSFilePosixPermissions;
  v50 = &off_100030608;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
  v42 = 0LL;
  v8 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v7 error:&v42];
  v0 = v42;

  if ((v8 & 1) == 0)
  {
LABEL_15:
    v35 = sub_1000139A0((uint64_t)"main", 1407LL, -2, v0, @"Failed to create %@.", v9, v10, v11, (uint64_t)v5);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

    v37 = objc_claimAutoreleasedReturnValue([v36 description]);
    _os_crash([v37 UTF8String]);

    __break(1u);
    goto LABEL_16;
  }

  v12 = v44;
  v14 = (IONotificationPortRef *)(v44 + 4);
  v13 = (IONotificationPort *)v44[4];
  if (v13)
  {
    IONotificationPortDestroy(v13);
    *v14 = 0LL;
  }

  v15 = *((_DWORD *)v12 + 10);
  if (v15) {
    IOObjectRelease(v15);
  }
  *v14 = 0LL;
  v14[1] = 0LL;
  *v14 = IONotificationPortCreate(kIOMasterPortDefault);
  Main = CFRunLoopGetMain();
  RunLoopSource = IONotificationPortGetRunLoopSource(*v14);
  CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  if (!*v14)
  {
LABEL_16:
    sub_10001E0A0();
    v38 = _os_crash("Failed to init device ark.");
    sub_10001E09C(v38);
  }

  v18 = &_dispatch_main_q;
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.storage_mounter.xpc", &_dispatch_main_q, 1uLL);

  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v52 = "com.apple.mobile.storage_mounter.xpc";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create xpc listener for %s.",  buf,  0xCu);
    }

    exit(1);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003560;
  handler[3] = &unk_10002C8B0;
  handler[4] = &v43;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100004278;
  v40[3] = &unk_10002C8B0;
  v40[4] = &v43;
  xpc_set_event_stream_handler("com.apple.iokit.matching", &_dispatch_main_q, v40);

  CFRunLoopRun();
  _Block_object_dispose(&v43, 8);
  return 0LL;
}

void sub_10000353C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100003560(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E0F4(v3);
    }
    xpc_connection_set_target_queue((xpc_connection_t)v3, &_dispatch_main_q);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000364C;
    v7[3] = &unk_10002C888;
    uint64_t v9 = *(void *)(a1 + 32);
    id v6 = v3;
    id v8 = v6;
    xpc_connection_set_event_handler((xpc_connection_t)v6, v7);
    xpc_connection_resume((xpc_connection_t)v6);
  }

  else if (v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error)
  {
    sub_10001E170();
  }
}

void sub_10000364C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    BOOL v5 = v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error;
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E220(a1);
    }
    goto LABEL_46;
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  size_t length = 0LL;
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  if (!reply)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to create xpc reply dictionary.";
LABEL_27:
      uint32_t v24 = 2;
      goto LABEL_28;
    }

LABEL_44:
LABEL_45:
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    goto LABEL_46;
  }

  data = (const UInt8 *)xpc_dictionary_get_data(v8, "EncodedDictionary", &length);
  if (!data)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "EncodedDictionary";
      v23 = "Invalid or missing value for %s.";
      uint32_t v24 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
      goto LABEL_44;
    }

    goto LABEL_44;
  }

  v11 = data;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to create response dictionary.";
      goto LABEL_27;
    }

    goto LABEL_44;
  }

  v13 = Mutable;
  CFDictionarySetValue(Mutable, @"Status", @"Failure");
  v14 = CFDataCreate(0LL, v11, length);
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to encode buffer.",  buf,  2u);
    }

    v25 = v13;
    goto LABEL_43;
  }

  v15 = v14;
  v16 = (const __CFDictionary *)CFPropertyListCreateWithData(0LL, v14, 0LL, 0LL, 0LL);
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary with data.",  buf,  2u);
    }

    CFRelease(v13);
    v25 = v15;
LABEL_43:
    CFRelease(v25);
    goto LABEL_44;
  }

  v49 = v15;
  v50 = v16;
  Value = (const __CFString *)CFDictionaryGetValue(v16, @"RequestType");
  v18 = Value;
  if (!Value || (CFTypeID v19 = CFGetTypeID(Value), v19 != CFStringGetTypeID()))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412546;
    v53 = @"RequestType";
    __int16 v54 = 2112;
    v55 = v18;
    v26 = "Invalid value for %@: %@";
    uint32_t v27 = 22;
    goto LABEL_34;
  }

  uint64_t v20 = v6 + 32;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E188(v7, (uint64_t)v18);
  }
  if (CFEqual(v18, @"CopyDevices"))
  {
    if (sub_100009B8C(v7, @"CopyDevices"))
    {
      uint64_t v21 = v20;
      v22 = v13;
      sub_1000045CC(v21, v13);
      goto LABEL_95;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = sub_100009A14(v7);
      v32 = (char *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138412546;
      v53 = v32;
      __int16 v54 = 2112;
      v55 = @"CopyDevices";
LABEL_106:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ missing required entitlement: %@",  buf,  0x16u);

      goto LABEL_35;
    }

    goto LABEL_35;
  }

  if (!CFEqual(v18, @"Mount"))
  {
    if (CFEqual(v18, @"Unmount"))
    {
      if (!sub_100009B8C(v7, @"UnmountDevice"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = sub_100009A14(v7);
          v32 = (char *)objc_claimAutoreleasedReturnValue(v36);
          *(_DWORD *)buf = 138412546;
          v53 = v32;
          __int16 v54 = 2112;
          v55 = @"UnmountDevice";
          goto LABEL_106;
        }

        goto LABEL_35;
      }

      uint64_t v33 = v20;
      v22 = v13;
      sub_100006100(v33, v50, v13);
      goto LABEL_95;
    }

    if (CFEqual(v18, @"Sync"))
    {
      if (!sub_100009B8C(v7, @"SyncDevice"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = sub_100009A14(v7);
          v32 = (char *)objc_claimAutoreleasedReturnValue(v38);
          *(_DWORD *)buf = 138412546;
          v53 = v32;
          __int16 v54 = 2112;
          v55 = @"SyncDevice";
          goto LABEL_106;
        }

        goto LABEL_35;
      }

      uint64_t v35 = v20;
      v22 = v13;
      sub_100006C5C(v35, v50, v13);
      goto LABEL_95;
    }

    if (CFEqual(v18, @"CopyPersonalizationManifest"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v37 = v20;
        v22 = v13;
        sub_10000700C(v37, v50, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }

    if (CFEqual(v18, @"CopyPersonalizationNonce"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v39 = v20;
        v22 = v13;
        sub_1000076A0(v39, v50, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }

    if (CFEqual(v18, @"CopyPersonalizationIdentifiers"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v40 = v20;
        v22 = v13;
        sub_1000079D8(v40, v50, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }

    if (CFEqual(v18, @"CopyCryptexNonce"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v41 = v20;
        v22 = v13;
        sub_100007F60(v41, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }

    if (CFEqual(v18, @"RollPersonalizationNonce"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v42 = v20;
        v22 = v13;
        sub_1000081B8(v42, v50, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }

    if (CFEqual(v18, @"RollCryptexNonce"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v43 = v20;
        v22 = v13;
        sub_1000084CC(v43, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }

    if (CFEqual(v18, @"CopyDeveloperModeStatus"))
    {
      if (sub_100009B8C(v7, @"QueryNonce"))
      {
        uint64_t v44 = v20;
        v22 = v13;
        sub_100008704(v44, v13);
        goto LABEL_95;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
LABEL_105:
      id v48 = sub_100009A14(v7);
      v32 = (char *)objc_claimAutoreleasedReturnValue(v48);
      *(_DWORD *)buf = 138412546;
      v53 = v32;
      __int16 v54 = 2112;
      v55 = @"QueryNonce";
      goto LABEL_106;
    }

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    v53 = (const char *)v18;
    v26 = "Invalid request type: %@";
    uint32_t v27 = 12;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    goto LABEL_35;
  }

  if (!sub_100009B8C(v7, @"MountDevice"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = sub_100009A14(v7);
      v32 = (char *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138412546;
      v53 = v32;
      __int16 v54 = 2112;
      v55 = @"MountDevice";
      goto LABEL_106;
    }

LABEL_35:
    char v28 = 0;
    v29 = 0LL;
    v22 = v13;
    goto LABEL_36;
  }

  uint64_t v30 = v20;
  v22 = v13;
  sub_100004780(v30, v50, v13);
LABEL_95:
  v45 = CFPropertyListCreateData(0LL, v22, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (v45)
  {
    v29 = v45;
    BytePtr = CFDataGetBytePtr(v45);
    size_t v47 = CFDataGetLength(v29);
    xpc_dictionary_set_data(reply, "EncodedDictionary", BytePtr, v47);
    xpc_connection_send_message((xpc_connection_t)v7, reply);
    char v28 = 1;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary with data.",  buf,  2u);
    }

    char v28 = 0;
    v29 = 0LL;
  }

LABEL_36:
  CFRelease(v22);
  CFRelease(v50);
  CFRelease(v49);
  if (v29) {
    CFRelease(v29);
  }

  if ((v28 & 1) == 0) {
    goto LABEL_45;
  }
LABEL_46:
}

void sub_100004278(uint64_t a1, void *a2)
{
  kern_return_t v16;
  const char *v17;
  uint8_t *p_block;
  uint32_t v19;
  uint64_t v20;
  io_iterator_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  io_iterator_t notification;
  _DWORD v29[4];
  __int128 block;
  void (*v31)(uint64_t);
  void *v32;
  uint64_t *v33;
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string)
  {
    BOOL v5 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E308();
    }
    if (!-[NSString isEqualToString:](v5, "isEqualToString:", @"com.apple.mobile.ptp_camera"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001E2A0();
      }
      goto LABEL_18;
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    notification = 0;
    v22 = 0LL;
    v23 = &v22;
    uint32_t v24 = 0x3032000000LL;
    v25 = sub_100008850;
    v26 = sub_100008860;
    uint32_t v27 = 0LL;
    CFMutableDictionaryRef v7 = IOServiceMatching("IOUSBInterface");
    CFMutableDictionaryRef v8 = v7;
    if (v7)
    {
      -[__CFDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_100030620,  @"bInterfaceClass");
      -[__CFDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_100030638,  @"bInterfaceSubClass");
      -[__CFDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_100030638,  @"bInterfaceProtocol");
      uint64_t v9 = os_transaction_create("com.apple.mobile.storage_mounter.xpc");
      v10 = (void *)v23[5];
      v23[5] = v9;

      dispatch_time_t v11 = dispatch_time(0LL, 15000000000LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      *(void *)&block = _NSConcreteStackBlock;
      *((void *)&block + 1) = 3221225472LL;
      id v31 = sub_100008868;
      v32 = &unk_10002C8D8;
      uint64_t v33 = &v22;
      dispatch_after(v11, v13, &block);

      v14 = *(IONotificationPort **)(v6 + 32);
      v15 = v8;
      v16 = IOServiceAddMatchingNotification( v14,  "IOServiceFirstMatch",  v15,  (IOServiceMatchingCallback)sub_10000887C,  (void *)(v6 + 32),  &notification);

      if (!v16)
      {
        uint64_t v20 = *(unsigned int *)(v6 + 40);
        if ((_DWORD)v20)
        {
          uint64_t v20 = IOObjectRelease(v20);
          *(_DWORD *)(v6 + 40) = 0;
        }

        uint64_t v21 = notification;
        *(_DWORD *)(v6 + 40) = notification;
        sub_10000887C(v20, v21);
        goto LABEL_17;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v29[0] = 67109120;
        v29[1] = v16 & 0x3FFF;
        v17 = "IOServiceAddMatchingNotification failed: %04x";
        p_block = (uint8_t *)v29;
        CFTypeID v19 = 8;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, p_block, v19);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(block) = 136315138;
      *(void *)((char *)&block + 4) = "IOUSBInterface";
      v17 = "IOServiceMatching failed for %s.";
      p_block = (uint8_t *)&block;
      CFTypeID v19 = 12;
      goto LABEL_13;
    }

LABEL_17:
    _Block_object_dispose(&v22, 8);
LABEL_18:
  }
}
}
}

  if (v40) {
    goto LABEL_28;
  }
  uint64_t v41 = v41;
  uint64_t v43 = 0LL;
  *a5 = v41;
LABEL_29:
  v50 = v43;

  return v50;
}

    CFMutableDictionaryRef v7 = v7;
    CFMutableDictionaryRef v8 = 0LL;
    *a2 = v7;
    goto LABEL_24;
  }

  if (!objc_opt_class(&OBJC_CLASS___IXAppInstallCoordinator))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "InstallCoordination is not supported.",  buf,  2u);
    }

    v12 = @"InstallCoordination is not supported.";
    v13 = 38LL;
    goto LABEL_15;
  }

  v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create URL.",  buf,  2u);
    }

    v12 = @"Failed to create URL.";
    v13 = 44LL;
LABEL_15:
    v14 = -2;
    goto LABEL_16;
  }

  BOOL v5 = (void *)v4;
  v25 = 0LL;
  uint64_t v6 = +[IXAppInstallCoordinator registerContentsForDiskImageAtURL:options:withError:]( &OBJC_CLASS___IXAppInstallCoordinator,  "registerContentsForDiskImageAtURL:options:withError:",  v4,  0LL,  &v25);
  CFMutableDictionaryRef v7 = v25;
  if ((v6 & 1) == 0)
  {
    v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to register apps for %@.",  v3);
    if (v7)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)", v16, v7));

      v16 = (NSString *)v17;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint32_t v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v21 = sub_1000139A0( (uint64_t)"registerAppsForMountPoint",  49LL,  -2,  v7,  @"Failed to register apps for %@.",  v18,  v19,  v20,  (uint64_t)v3);
    v22 = objc_claimAutoreleasedReturnValue(v21);

    CFMutableDictionaryRef v7 = (id)v22;
    if (!a2) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }

  CFMutableDictionaryRef v8 = 1LL;
LABEL_24:

  return v8;
}

    v10 = v10;
    dispatch_time_t v11 = 0LL;
    *a2 = v10;
    goto LABEL_20;
  }

  if (!objc_opt_class(&OBJC_CLASS___IXAppInstallCoordinator))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "InstallCoordination is not supported.",  v25,  2u);
    }

    v15 = @"InstallCoordination is not supported.";
    v16 = 78LL;
    goto LABEL_15;
  }

  v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create URL.",  v24,  2u);
    }

    v15 = @"Failed to create URL.";
    v16 = 84LL;
LABEL_15:
    v17 = -2;
    goto LABEL_16;
  }

  BOOL v5 = (void *)v4;
  v23 = 0LL;
  uint64_t v6 = +[IXAppInstallCoordinator unregisterContentsForDiskImageAtURL:options:withError:]( &OBJC_CLASS___IXAppInstallCoordinator,  "unregisterContentsForDiskImageAtURL:options:withError:",  v4,  0LL,  &v23);
  v10 = v23;
  if ((v6 & 1) == 0)
  {
    CFTypeID v19 = sub_1000139A0( (uint64_t)"unregisterAppsForMountPoint",  89LL,  -2,  v10,  @"Failed to unregister apps for %@.",  v7,  v8,  v9,  (uint64_t)v3);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);

    v10 = (id)v20;
    if (!a2) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }

  dispatch_time_t v11 = 1LL;
LABEL_20:

  return v11;
}

  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0LL;
}

void sub_1000045AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_1000045CC(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    id v3 = sub_100016614(1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
    {
      BOOL v5 = v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
      CFDictionarySetValue(a2, @"EntryList", v6);
      CFDictionarySetValue(a2, @"Status", @"Success");

      goto LABEL_14;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve attached device list.",  (uint8_t *)&v14,  2u);
    }

    v10 = @"Failed to retrieve attached device list.";
    uint64_t v11 = 152LL;
    int v12 = -2;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    v10 = @"Invalid input(s)";
    uint64_t v11 = 145LL;
    int v12 = -3;
  }

  id v13 = sub_1000139A0((uint64_t)"handle_copy_devices", v11, v12, 0LL, v10, v7, v8, v9, v14);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v5) {
    return;
  }
  if (!CFDictionaryGetValue(a2, @"Error")) {
    CFDictionarySetValue(a2, @"Error", @"InternalError");
  }
  CFDictionarySetValue(a2, @"DetailedError", [v5 description]);
LABEL_14:
}

void sub_100004780(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  uint64_t v203 = 0LL;
  memset(v202, 0, sizeof(v202));
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v35 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  226LL,  -3,  0LL,  @"Invalid input(s)",  v32,  v33,  v34,  v165);
    id v36 = (id)objc_claimAutoreleasedReturnValue(v35);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    v178 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    id v43 = 0LL;
    v182 = 0LL;
    uint64_t v6 = 0LL;
    goto LABEL_23;
  }

  Value = CFDictionaryGetValue(theDict, @"DiskImageType");
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
  id v7 = sub_1000131C8(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = @"DiskImageType";
      __int16 v200 = 2112;
      v201 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
    }

    id v47 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  233LL,  -3,  0LL,  @"Invalid value for %@: %@",  v44,  v45,  v46,  (uint64_t)@"DiskImageType");
    id v36 = (id)objc_claimAutoreleasedReturnValue(v47);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    v178 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    id v43 = 0LL;
    v182 = 0LL;
    goto LABEL_23;
  }

  uint64_t v9 = CFDictionaryGetValue(theDict, @"ImageSignature");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_100013220(v10);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v182 = v10;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = @"ImageSignature";
      __int16 v200 = 2112;
      v201 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
    }

    id v51 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  240LL,  -3,  0LL,  @"Invalid value for %@: %@",  v48,  v49,  v50,  (uint64_t)@"ImageSignature");
    id v36 = (id)objc_claimAutoreleasedReturnValue(v51);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    v178 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    id v43 = 0LL;
LABEL_23:
    v179 = 0LL;
LABEL_24:
    v180 = 0LL;
    v181 = 0LL;
    goto LABEL_25;
  }

  id v13 = CFDictionaryGetValue(theDict, @"DiskImagePath");
  uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = sub_1000131C8(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v179 = v14;
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = @"DiskImagePath";
      __int16 v200 = 2112;
      v201 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
    }

    id v55 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  247LL,  -3,  0LL,  @"Invalid value for %@: %@",  v52,  v53,  v54,  (uint64_t)@"DiskImagePath");
    id v36 = (id)objc_claimAutoreleasedReturnValue(v55);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    v178 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    id v43 = 0LL;
    goto LABEL_24;
  }

  v17 = CFDictionaryGetValue(theDict, @"ImageTrustCache");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v17);
  CFTypeID v19 = v18;
  v180 = v18;
  if (v18)
  {
    id v20 = sub_100013220(v18);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (!v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v199 = @"ImageTrustCache";
        __int16 v200 = 2112;
        v201 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for option %@: %@",  buf,  0x16u);
      }

      id v70 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  253LL,  -3,  0LL,  @"Invalid value for option %@: %@",  v67,  v68,  v69,  (uint64_t)@"ImageTrustCache");
      goto LABEL_61;
    }
  }

  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", @"Cryptex"))
  {
LABEL_41:
    v181 = 0LL;
    goto LABEL_42;
  }

  id v22 = sub_100013220(v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = @"ImageTrustCache";
      __int16 v200 = 2112;
      v201 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for required option %@: %@",  buf,  0x16u);
    }

    id v70 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  259LL,  -3,  0LL,  @"Invalid value for required option %@: %@",  v71,  v72,  v73,  (uint64_t)@"ImageTrustCache");
LABEL_61:
    id v36 = (id)objc_claimAutoreleasedReturnValue(v70);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    v178 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    id v43 = 0LL;
    v181 = 0LL;
    goto LABEL_25;
  }

  uint32_t v24 = CFDictionaryGetValue(theDict, @"ImageInfoPlist");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
  if (!v25) {
    goto LABEL_41;
  }
  v181 = v25;
  id v26 = sub_100013220(v25);
  uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = @"ImageInfoPlist";
      __int16 v200 = 2112;
      v201 = v181;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for option %@: %@",  buf,  0x16u);
    }

    id v31 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  265LL,  -3,  0LL,  @"Invalid value for option %@: %@",  v28,  v29,  v30,  (uint64_t)@"ImageInfoPlist");
LABEL_65:
    id v36 = (id)objc_claimAutoreleasedReturnValue(v31);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
    v178 = 0LL;
    uint64_t v41 = 0LL;
LABEL_66:
    uint64_t v42 = 0LL;
    id v43 = 0LL;
    goto LABEL_25;
  }

LABEL_42:
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", @"Personalized"))
  {
    bzero(buf, 0x400uLL);
    *(void *)v190 = 0LL;
    v189[0] = 0LL;
    v56 = v182;
    uint64_t inited = Img4DecodeInitManifest( (uint64_t)-[__CFString bytes](v56, "bytes"),  (uint64_t)-[__CFString length](v56, "length"),  (uint64_t)v202);
    v173 = v56;
    if ((_DWORD)inited)
    {
      uint64_t v58 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v195 = 67109120;
        *(_DWORD *)&v195[4] = v58;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to decode img4 manifest: %d",  v195,  8u);
      }

      id v62 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  282LL,  -2,  0LL,  @"Failed to decode img4 manifest: %d",  v59,  v60,  v61,  v58);
LABEL_71:
      id v36 = (id)objc_claimAutoreleasedReturnValue(v62);
      uint64_t v39 = 0LL;
LABEL_72:
      BOOL v37 = 0;
      id v38 = 0LL;
      uint64_t v40 = 0LL;
      v178 = 0LL;
      uint64_t v41 = 0LL;
      uint64_t v42 = 0LL;
      id v43 = 0LL;
      v182 = v173;
      goto LABEL_25;
    }

    Img4DecodeGetObjectPropertyData((uint64_t)v202, 1885629799LL, 1885630061LL, v190, v189);
    if ((_DWORD)v77)
    {
      uint64_t v78 = v77;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v195 = 67109120;
        *(_DWORD *)&v195[4] = v78;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  v195,  8u);
      }

      id v62 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  288LL,  -2,  0LL,  @"Failed to retrieve data from manifest: %d",  v79,  v80,  v81,  v78);
      goto LABEL_71;
    }

    v83 = objc_alloc(&OBJC_CLASS___NSString);
    v84 = -[NSString initWithBytes:length:encoding:]( v83,  "initWithBytes:length:encoding:",  *(void *)v190,  v189[0],  4LL);
    if (!v84)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v114 = __error();
        v115 = strerror(*v114);
        *(_DWORD *)v195 = 136315138;
        *(void *)&v195[4] = v115;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string: %s",  v195,  0xCu);
      }

      v116 = __error();
      v117 = strerror(*v116);
      id v62 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  294LL,  -2,  0LL,  @"Failed to create string: %s",  v118,  v119,  v120,  (uint64_t)v117);
      goto LABEL_71;
    }

    uint64_t v39 = v84;
    if (-[NSString isEqualToString:](v84, "isEqualToString:", @"DebugDiskImage"))
    {
      v85 = "/private/var/personalized_debug";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"DemoDiskImage"))
    {
      v85 = "/private/var/personalized_demo";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"DeveloperDiskImage"))
    {
      v85 = "/System/Developer";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"FactoryDiskImage"))
    {
      v85 = "/private/var/personalized_factory";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"AutomationDiskImage") {
           || -[NSString isEqualToString:](v39, "isEqualToString:", @"ProdAutomationDiskImage"))
    }
    {
      v85 = "/private/var/personalized_automation";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"FieldServiceDiskImage"))
    {
      v85 = "/System/Volumes/FieldService";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"FieldServiceDiagnosticDiskImage"))
    {
      v85 = "/System/Volumes/FieldServiceDiagnostic";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"FieldServiceRepairDiskImage"))
    {
      v85 = "/System/Volumes/FieldServiceRepair";
    }

    else if (-[NSString isEqualToString:](v39, "isEqualToString:", @"QualityDiskImage"))
    {
      v85 = "/private/var/personalized_quality";
    }

    else
    {
      if (!-[NSString isEqualToString:](v39, "isEqualToString:", @"RepairDiskImage"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v195 = 138412290;
          *(void *)&v195[4] = v39;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid personalized disk image type: %@",  v195,  0xCu);
        }

        id v145 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  321LL,  -3,  0LL,  @"Invalid personalized disk image type: %@",  v162,  v163,  v164,  (uint64_t)v39);
        goto LABEL_154;
      }

      v85 = "/private/var/personalized_repair";
    }

    if (mkdir(v85, 0x1EDu) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v142 = __error();
        v143 = strerror(*v142);
        *(_DWORD *)v195 = 136315394;
        *(void *)&v195[4] = v85;
        *(_WORD *)&v195[12] = 2080;
        *(void *)&v195[14] = v143;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create mount path %s: %s",  v195,  0x16u);
      }

      v144 = __error();
      strerror(*v144);
      v140 = @"Failed to create mount path %s: %s";
      uint64_t v166 = (uint64_t)v85;
      uint64_t v141 = 327LL;
      goto LABEL_153;
    }

    if (-[NSString isEqualToString:](v39, "isEqualToString:", @"FactoryDiskImage"))
    {
      if (snprintf((char *)buf, 0x400uLL, "%s/%s", v85, "XXXXXXX") >= 0x400)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v195 = 134217984;
          *(void *)&v195[4] = 1024LL;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path: > %ld",  v195,  0xCu);
        }

        v140 = @"Failed to create path: > %ld";
        uint64_t v166 = 1024LL;
        uint64_t v141 = 336LL;
LABEL_153:
        id v145 = sub_1000139A0((uint64_t)"handle_mount_disk_image", v141, -2, 0LL, v140, v137, v138, v139, v166);
LABEL_154:
        id v36 = (id)objc_claimAutoreleasedReturnValue(v145);
        goto LABEL_72;
      }

      if (!mkdtemp((char *)buf))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v146 = __error();
          v147 = strerror(*v146);
          *(_DWORD *)v195 = 136315394;
          *(void *)&v195[4] = buf;
          *(_WORD *)&v195[12] = 2080;
          *(void *)&v195[14] = v147;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %s: %s",  v195,  0x16u);
        }

        v148 = __error();
        strerror(*v148);
        v140 = @"Failed to create %s: %s";
        uint64_t v166 = (uint64_t)buf;
        uint64_t v141 = 340LL;
        goto LABEL_153;
      }

      v85 = (const char *)buf;
      chmod((const char *)buf, 0x1EDu);
    }

    uint64_t v41 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v85);
    v178 = @"com.apple.mobile.personalized_image_mounted";
  }

  else
  {
    if (!-[__CFString isEqualToString:](v6, "isEqualToString:", @"Cryptex"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v199 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unsupported disk image type: %@",  buf,  0xCu);
      }

      id v31 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  357LL,  -3,  0LL,  @"Unsupported disk image type: %@",  v74,  v75,  v76,  (uint64_t)v6);
      goto LABEL_65;
    }

    v178 = @"com.apple.mobile.cryptex_mounted";
    uint64_t v39 = 0LL;
    uint64_t v41 = 0LL;
  }

  uint64_t v6 = v6;
  uint64_t v39 = v39;
  if (-[__CFString isEqual:](v6, "isEqual:", @"Developer"))
  {

LABEL_51:
    if (!sub_10001376C())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Developer mode is not enabled.",  buf,  2u);
      }

      id v66 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  371LL,  -4,  0LL,  @"Developer mode is not enabled.",  v63,  v64,  v65,  v165);
      id v36 = (id)objc_claimAutoreleasedReturnValue(v66);
      BOOL v37 = 0;
      id v38 = 0LL;
      uint64_t v40 = 0LL;
      goto LABEL_66;
    }

    goto LABEL_80;
  }

  if ((-[__CFString isEqual:](v6, "isEqual:", @"Personalized") & 1) == 0)
  {

    goto LABEL_80;
  }

  unsigned int v82 = -[NSString isEqual:](v39, "isEqual:", @"DeveloperDiskImage");

  if (v82) {
    goto LABEL_51;
  }
LABEL_80:
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", @"Cryptex"))
  {
    v171 = a3;
    uint64_t v172 = (uint64_t)v6;
    v89 = sub_100016AD4(v6, 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    memset(v195, 0, sizeof(v195));
    __int128 v196 = 0u;
    __int128 v197 = 0u;
    id v43 = v90;
    id v91 = [v43 countByEnumeratingWithState:v195 objects:buf count:16];
    if (v91)
    {
      id v92 = v91;
      uint64_t v93 = **(void **)&v195[16];
      while (2)
      {
        for (i = 0LL; i != v92; i = (char *)i + 1)
        {
          if (**(void **)&v195[16] != v93) {
            objc_enumerationMutation(v43);
          }
          v95 = *(void **)(*(void *)&v195[8] + 8LL * (void)i);
          v96 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKeyedSubscript:@"MountPath"]);
          unsigned int v97 = [v96 isEqualToString:v41];

          if (v97)
          {
            uint64_t v6 = (__CFString *)v172;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v102 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKeyedSubscript:@"MountPath"]);
              *(_DWORD *)v190 = 138412802;
              *(void *)&v190[4] = v172;
              __int16 v191 = 2112;
              v192 = v39;
              __int16 v193 = 2112;
              v194 = v102;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "A disk image of type %@/%@ is already mounted at %@.",  v190,  0x20u);
            }

            v167 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKeyedSubscript:@"MountPath"]);
            id v106 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  393LL,  -3,  0LL,  @"A disk image of type %@/%@ is already mounted at %@.",  v103,  v104,  v105,  v172);
            id v36 = (id)objc_claimAutoreleasedReturnValue(v106);

            BOOL v37 = 0;
            id v38 = 0LL;
            uint64_t v40 = 0LL;
            uint64_t v42 = 0LL;
            a3 = v171;
            goto LABEL_25;
          }
        }

        id v92 = [v43 countByEnumeratingWithState:v195 objects:buf count:16];
        if (v92) {
          continue;
        }
        break;
      }
    }

    if (-[NSString isEqualToString:](v39, "isEqualToString:", @"FieldServiceDiskImage")
      || -[NSString isEqualToString:](v39, "isEqualToString:", @"FieldServiceDiagnosticDiskImage"))
    {
      a3 = v171;
      uint64_t v6 = (__CFString *)v172;
      v98 = v180;
      if (v180) {
        goto LABEL_100;
      }
    }

    else
    {
      unsigned __int8 v121 = -[NSString isEqualToString:](v39, "isEqualToString:", @"FieldServiceRepairDiskImage");
      a3 = v171;
      uint64_t v6 = (__CFString *)v172;
      v98 = v180;
      if (v180 || (v121 & 1) == 0)
      {
LABEL_100:
        id v186 = 0LL;
        id v187 = 0LL;
        id v99 = sub_10000EAB0(v179, v6, v182, v98, v41, &v187, &v186);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v99);
        uint64_t v42 = (NSString *)v187;
        id v100 = v186;
        id v36 = v100;
        if (!v40)
        {
          if (v42)
          {
            v126 = v42;

            uint64_t v41 = v126;
            int v88 = 0;
            id v38 = 0LL;
            uint64_t v40 = 0LL;
            uint64_t v42 = v41;
LABEL_88:
            CFDictionarySetValue(a3, @"MountPath", v41);
            CFDictionarySetValue(a3, @"Status", @"Success");
            BOOL v37 = v88 != 0;
            goto LABEL_25;
          }

          BOOL v37 = 0;
          id v38 = 0LL;
          uint64_t v40 = 0LL;
          goto LABEL_25;
        }

        id v185 = v100;
        char v101 = sub_100009E60(v41, &v185);
        id v170 = v185;

        if ((v101 & 1) != 0)
        {
          if (sub_100009F2C(v41, v6))
          {
            BOOL v37 = sub_1000128B8();
            if (v37)
            {
              id v184 = v170;
              char v176 = sub_1000128DC(v41, &v184);
              id v168 = v184;

              if ((v176 & 1) == 0)
              {
                v149 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to register apps.");
                if (v168)
                {
                  uint64_t v165 = (uint64_t)v149;
                  uint64_t v150 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

                  v149 = (NSString *)v150;
                }

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v190 = 138412290;
                  *(void *)&v190[4] = v149;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@",  v190,  0xCu);
                }

                id v154 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  439LL,  -2,  v168,  @"Failed to register apps.",  v151,  v152,  v153,  v165);
                id v36 = (id)objc_claimAutoreleasedReturnValue(v154);

                BOOL v37 = 0;
                id v38 = 0LL;
                goto LABEL_179;
              }

              int v177 = 1;
              id v170 = v168;
            }

            else
            {
              int v177 = 0;
            }

            if (!-[NSString isEqualToString:](v39, "isEqualToString:", @"DeveloperDiskImage"))
            {
              id v36 = v170;
              goto LABEL_166;
            }

            id v183 = v170;
            BOOL v169 = sub_100011C58(v39, v182, &v183);
            id v36 = v183;

            if (v169)
            {
              uint64_t v6 = (__CFString *)v172;
LABEL_166:
              int v87 = v177;
              goto LABEL_83;
            }

            v155 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to store image manifest.");
            if (v36)
            {
              uint64_t v165 = (uint64_t)v155;
              uint64_t v156 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

              v155 = (NSString *)v156;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v190 = 138412290;
              *(void *)&v190[4] = v155;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@",  v190,  0xCu);
            }

            id v160 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  450LL,  -2,  v36,  @"Failed to store image manifest.",  v157,  v158,  v159,  v165);
            uint64_t v161 = objc_claimAutoreleasedReturnValue(v160);

            id v38 = 0LL;
            id v36 = (id)v161;
LABEL_179:
            a3 = v171;
            uint64_t v6 = (__CFString *)v172;
            goto LABEL_25;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v190 = 138412290;
            *(void *)&v190[4] = v41;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to load launchd jobs for %@.",  v190,  0xCu);
          }

          id v136 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  432LL,  -2,  0LL,  @"Failed to load launchd jobs for %@.",  v133,  v134,  v135,  (uint64_t)v41);
          id v36 = (id)objc_claimAutoreleasedReturnValue(v136);
        }

        else
        {
          v127 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to load launchd jetsam properties for %@.",  v41);
          if (v170)
          {
            uint64_t v128 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@ (%@)",  v127,  v170));

            v127 = (NSString *)v128;
          }

          uint64_t v6 = (__CFString *)v172;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v190 = 138412290;
            *(void *)&v190[4] = v127;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v190, 0xCu);
          }

          id v132 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  427LL,  -2,  v170,  @"Failed to load launchd jetsam properties for %@.",  v129,  v130,  v131,  (uint64_t)v41);
          id v36 = (id)objc_claimAutoreleasedReturnValue(v132);
        }

        BOOL v37 = 0;
        id v38 = 0LL;
        goto LABEL_25;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v190 = 138412290;
      *(void *)&v190[4] = v39;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Personalized trust cache required for disk image of type '%@'.",  v190,  0xCu);
    }

    id v125 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  402LL,  -3,  0LL,  @"Personalized trust cache required for disk image of type '%@'.",  v122,  v123,  v124,  (uint64_t)v39);
    id v36 = (id)objc_claimAutoreleasedReturnValue(v125);
    BOOL v37 = 0;
    id v38 = 0LL;
    uint64_t v40 = 0LL;
    uint64_t v42 = 0LL;
    v180 = 0LL;
    goto LABEL_25;
  }

  *(void *)v195 = v41;
  id v187 = 0LL;
  id v86 = sub_10000DC74(v179, (uint64_t)v6, v182, v180, v181, v195, &v187);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v86);
  v174 = (NSString *)*(id *)v195;

  id v36 = v187;
  if (v40)
  {
    int v87 = 0;
    uint64_t v42 = 0LL;
    id v43 = 0LL;
    uint64_t v41 = v174;
LABEL_83:
    int v175 = v87;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v190 = 138412290;
      *(void *)&v190[4] = v178;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Posting notification: %@",  v190,  0xCu);
    }

    sub_10000BCB0(v178);
    v188[0] = @"DiskImageMountPath";
    v188[1] = @"DiskImageType";
    v189[0] = v41;
    v189[1] = v6;
    id v38 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v189,  v188,  2LL));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v190 = 138412546;
      *(void *)&v190[4] = @"com.apple.mobile.disk_image_mounted";
      __int16 v191 = 2112;
      v192 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Posting notification: %@ (%@)",  v190,  0x16u);
    }

    sub_10000BC24(@"com.apple.mobile.disk_image_mounted", v38);
    int v88 = v175;
    goto LABEL_88;
  }

  v107 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to mount %@.",  v179);
  if (v36)
  {
    uint64_t v108 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)", v107, v36));

    v107 = (NSString *)v108;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v199 = (const __CFString *)v107;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v112 = sub_1000139A0( (uint64_t)"handle_mount_disk_image",  381LL,  -2,  v36,  @"Failed to mount %@.",  v109,  v110,  v111,  (uint64_t)v179);
  uint64_t v113 = objc_claimAutoreleasedReturnValue(v112);

  BOOL v37 = 0;
  id v38 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v42 = 0LL;
  id v43 = 0LL;
  id v36 = (id)v113;
  uint64_t v41 = v174;
LABEL_25:
  if (v36)
  {
    if (v37) {
      sub_100012BC8(v41, 0LL);
    }
    if (v41 && v40 && (-[__CFString isEqualToString:](v6, "isEqualToString:", @"Cryptex") & 1) == 0)
    {
      unmount(-[NSString fileSystemRepresentation](v41, "fileSystemRepresentation"), 0x80000);
      sub_10000D73C((const char *)[v40 fileSystemRepresentation]);
    }

    if (-[NSString isEqualToString:](v39, "isEqualToString:", @"DeveloperDiskImage")) {
      sub_10001243C(v39, 0LL);
    }
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v36 description]);
  }
}

void sub_100006100(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  if (a1)
  {
    Value = CFDictionaryGetValue(theDict, @"MountPath");
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
    id v6 = sub_1000131C8(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      id v8 = sub_100016AF8(v5, 1);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (v9)
      {
        v10 = v9;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"DiskImageType"]);
        int v12 = v11;
        if (v11)
        {
          id v13 = sub_1000131C8(v11);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

          if (!v14)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query disk image type.",  buf,  2u);
            }

            id v58 = sub_1000139A0( (uint64_t)"handle_unmount",  539LL,  -2,  0LL,  @"Failed to query disk image type.",  v55,  v56,  v57,  v99);
            id v25 = (id)objc_claimAutoreleasedReturnValue(v58);
            goto LABEL_41;
          }
        }

        if ([v12 isEqualToString:@"Cryptex"])
        {
          id v15 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"CryptexName"]);
          int v16 = cryptex_uninstall_4MSM([v15 UTF8String], 1);

          if (v16)
          {
            id v17 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"CryptexName"]);
            int v18 = cryptex_uninstall_4MSM([v17 UTF8String], 0);

            if (v18)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                CFTypeID v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"CryptexName"]);
                *(_DWORD *)buf = 138412802;
                uint64_t v103 = v19;
                __int16 v104 = 1024;
                LODWORD(v105[0]) = v18;
                WORD2(v105[0]) = 2080;
                *(void *)((char *)v105 + 6) = strerror(v18);
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to uninstall cryptex (%@): %d (%s)",  buf,  0x1Cu);
              }

              id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"CryptexName"]);
              strerror(v18);
              id v24 = sub_1000139A0( (uint64_t)"handle_unmount",  551LL,  -2,  0LL,  @"Failed to uninstall cryptex (%@): %d (%s)",  v21,  v22,  v23,  (uint64_t)v20);
              id v25 = (id)objc_claimAutoreleasedReturnValue(v24);

LABEL_41:
              uint64_t v30 = 0LL;
              id v31 = 0LL;
              uint64_t v32 = 0LL;
              uint64_t v33 = 0LL;
              goto LABEL_22;
            }
          }

          uint64_t v30 = 0LL;
          id v31 = 0LL;
          id v25 = 0LL;
          uint64_t v32 = 0LL;
          uint64_t v33 = 0LL;
          goto LABEL_43;
        }

        uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"DeviceNode"]);
        id v41 = sub_1000131C8(v33);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

        if (v42)
        {
          id v31 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"BackingImage"]);
          id v43 = sub_1000131C8(v31);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

          if (v44)
          {
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"FilesystemType"]);
            id v45 = sub_1000131C8(v32);
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

            if (v46)
            {
              if (sub_10000A54C(v5))
              {
                if (sub_1000128B8())
                {
                  id v101 = 0LL;
                  char v47 = sub_100012BC8(v5, &v101);
                  id v25 = v101;
                  if ((v47 & 1) == 0)
                  {
                    uint64_t v48 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to unregister apps.");
                    if (v25)
                    {
                      uint64_t v99 = (uint64_t)v48;
                      uint64_t v49 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@ (%@)"));

                      uint64_t v48 = (NSString *)v49;
                    }

                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v103 = (const __CFString *)v48;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@",  buf,  0xCu);
                    }

                    id v53 = sub_1000139A0( (uint64_t)"handle_unmount",  584LL,  -2,  v25,  @"Failed to unregister apps.",  v50,  v51,  v52,  v99);
                    uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);

                    uint64_t v30 = 0LL;
                    id v25 = (id)v54;
                    goto LABEL_22;
                  }
                }

                else
                {
                  id v25 = 0LL;
                }

                unsigned int v82 = v5;
                if (unmount( (const char *)-[__CFString fileSystemRepresentation](v82, "fileSystemRepresentation"),  0x80000))
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    int v83 = *__error();
                    v84 = __error();
                    v85 = strerror(*v84);
                    *(_DWORD *)buf = 138412802;
                    uint64_t v103 = v82;
                    __int16 v104 = 1024;
                    LODWORD(v105[0]) = v83;
                    WORD2(v105[0]) = 2080;
                    *(void *)((char *)v105 + 6) = v85;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to force unmount %@: %d (%s)",  buf,  0x1Cu);
                  }

                  __error();
                  id v86 = __error();
                  strerror(*v86);
                  id v90 = sub_1000139A0( (uint64_t)"handle_unmount",  591LL,  -2,  0LL,  @"Failed to force unmount %@: %d (%s)",  v87,  v88,  v89,  (uint64_t)v82);
                  uint64_t v91 = objc_claimAutoreleasedReturnValue(v90);

                  uint64_t v30 = 0LL;
                  id v25 = (id)v91;
                  goto LABEL_65;
                }

                if ((-[__CFString hasPrefix:](v82, "hasPrefix:", @"/System/Volumes/FieldService") & 1) != 0
                  || (-[__CFString hasPrefix:]( v82, "hasPrefix:", @"/System/Volumes/FieldServiceDiagnostic") & 1) != 0 || (-[__CFString hasPrefix:]( v82, "hasPrefix:", @"/System/Volumes/FieldServiceRepair") & 1) != 0 || (-[__CFString hasPrefix:](v82, "hasPrefix:", @"/Developer") & 1) != 0 || (-[__CFString hasPrefix:](v82, "hasPrefix:", @"/System/Developer") & 1) != 0 || (id v100 = v82, rmdir((const char *)-[__CFString fileSystemRepresentation](v100, "fileSystemRepresentation")) != -1))
                {
                  if (![v32 isEqualToString:@"apfs"])
                  {
                    uint64_t v30 = 0LL;
                    goto LABEL_76;
                  }

                  id v92 = sub_100012E14(v33);
                  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
                  if (v93)
                  {
                    uint64_t v30 = v93;

                    uint64_t v33 = v30;
LABEL_76:
                    uint64_t v33 = v33;
                    sub_10000D73C((const char *)-[__CFString fileSystemRepresentation](v33, "fileSystemRepresentation"));
                    id v31 = v31;
                    unlink((const char *)[v31 UTF8String]);
LABEL_43:
                    BOOL v59 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                    if (v59) {
                      sub_10001E370(v59, v60, v61, v62, v63, v64, v65, v66);
                    }
                    sub_10000BCB0(@"com.apple.mobile.storage_unmounted");
                    CFDictionarySetValue(a3, @"Status", @"Success");
                    goto LABEL_22;
                  }

                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_80:
                    uint64_t v30 = 0LL;
LABEL_65:
                    BOOL v5 = v82;
                    goto LABEL_22;
                  }

                  *(_DWORD *)buf = 138412290;
                  uint64_t v103 = v33;
                  v94 = "Failed to copy APFS volume partition for %@.";
                  uint32_t v95 = 12;
                }

                else
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v30 = 0LL;
                    BOOL v5 = v100;
                    goto LABEL_22;
                  }

                  int v96 = *__error();
                  unsigned int v97 = __error();
                  v98 = strerror(*v97);
                  *(_DWORD *)buf = 138412802;
                  unsigned int v82 = v100;
                  uint64_t v103 = v100;
                  __int16 v104 = 1024;
                  LODWORD(v105[0]) = v96;
                  WORD2(v105[0]) = 2080;
                  *(void *)((char *)v105 + 6) = v98;
                  v94 = "Failed to remove %@: %d (%s)";
                  uint32_t v95 = 28;
                }

                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v94,  buf,  v95);
                goto LABEL_80;
              }

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to unload launchd jobs.",  buf,  2u);
              }

              id v78 = sub_1000139A0( (uint64_t)"handle_unmount",  578LL,  -2,  0LL,  @"Failed to unload launchd jobs.",  v79,  v80,  v81,  v99);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v103 = @"FilesystemType";
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not extract %@ from map entry",  buf,  0xCu);
              }

              id v78 = sub_1000139A0( (uint64_t)"handle_unmount",  572LL,  -2,  0LL,  @"Could not extract %@ from map entry",  v75,  v76,  v77,  (uint64_t)@"FilesystemType");
            }

            id v25 = (id)objc_claimAutoreleasedReturnValue(v78);
            uint64_t v30 = 0LL;
            goto LABEL_22;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query backing image path.",  buf,  2u);
          }

          id v74 = sub_1000139A0( (uint64_t)"handle_unmount",  566LL,  -2,  0LL,  @"Failed to query backing image path.",  v71,  v72,  v73,  v99);
          id v25 = (id)objc_claimAutoreleasedReturnValue(v74);
          uint64_t v30 = 0LL;
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v103 = @"DeviceNode";
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not extract %@ from map entry",  buf,  0xCu);
          }

          id v70 = sub_1000139A0( (uint64_t)"handle_unmount",  560LL,  -2,  0LL,  @"Could not extract %@ from map entry",  v67,  v68,  v69,  (uint64_t)@"DeviceNode");
          id v25 = (id)objc_claimAutoreleasedReturnValue(v70);
          uint64_t v30 = 0LL;
          id v31 = 0LL;
        }

        uint64_t v32 = 0LL;
        goto LABEL_22;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v103 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "There is no matching entry in the device map for %@.",  buf,  0xCu);
      }

      id v37 = sub_1000139A0( (uint64_t)"handle_unmount",  532LL,  -2,  0LL,  @"There is no matching entry in the device map for %@.",  v38,  v39,  v40,  (uint64_t)v5);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v103 = @"MountPath";
        __int16 v104 = 2112;
        v105[0] = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
      }

      id v37 = sub_1000139A0( (uint64_t)"handle_unmount",  525LL,  -3,  0LL,  @"Invalid value for %@: %@",  v34,  v35,  v36,  (uint64_t)@"MountPath");
    }

    id v25 = (id)objc_claimAutoreleasedReturnValue(v37);
    uint64_t v30 = 0LL;
    int v12 = 0LL;
    id v31 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    v10 = 0LL;
    goto LABEL_22;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
  }

  id v29 = sub_1000139A0((uint64_t)"handle_unmount", 518LL, -3, 0LL, @"Invalid input(s)", v26, v27, v28, v99);
  id v25 = (id)objc_claimAutoreleasedReturnValue(v29);
  uint64_t v30 = 0LL;
  int v12 = 0LL;
  id v31 = 0LL;
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  v10 = 0LL;
  BOOL v5 = 0LL;
LABEL_22:
  if (v25)
  {
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v25 description]);
  }
}

void sub_100006C5C(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  int v32 = 2;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v23 = sub_1000139A0((uint64_t)"handle_sync", 665LL, -3, 0LL, @"Invalid input(s)", v20, v21, v22, v31);
    CFTypeID v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v10 = 0LL;
    BOOL v5 = 0LL;
    if (!v19) {
      goto LABEL_25;
    }
LABEL_22:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v19 description]);

    goto LABEL_25;
  }

  Value = CFDictionaryGetValue(theDict, @"MountPath");
  BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
  id v6 = sub_1000131C8(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = @"MountPath";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to extract %@ from request",  buf,  0xCu);
    }

    id v27 = sub_1000139A0( (uint64_t)"handle_sync",  672LL,  -3,  0LL,  @"Failed to extract %@ from request",  v24,  v25,  v26,  (uint64_t)@"MountPath");
LABEL_21:
    CFTypeID v19 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v10 = 0LL;
    if (!v19) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }

  id v8 = sub_100016AF8(v5, 1);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "There is no matching entry for %@.",  buf,  0xCu);
    }

    id v27 = sub_1000139A0( (uint64_t)"handle_sync",  679LL,  -2,  0LL,  @"There is no matching entry for %@.",  v28,  v29,  v30,  (uint64_t)v5);
    goto LABEL_21;
  }

  v10 = (void *)v9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E3A4();
  }
  BOOL v5 = v5;
  if (!fsctl((const char *)-[__CFString UTF8String](v5, "UTF8String"), 0x80004101uLL, &v32, 4u))
  {
    CFDictionarySetValue(a3, @"Status", @"Success");
    goto LABEL_25;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *__error();
    int v12 = __error();
    id v13 = strerror(*v12);
    *(_DWORD *)buf = 138412802;
    uint64_t v34 = v5;
    __int16 v35 = 1024;
    int v36 = v11;
    __int16 v37 = 2080;
    uint64_t v38 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to force the sync %@: %d (%s)",  buf,  0x1Cu);
  }

  __error();
  uint64_t v14 = __error();
  strerror(*v14);
  id v18 = sub_1000139A0( (uint64_t)"handle_sync",  687LL,  -2,  0LL,  @"Failed to force the sync %@: %d (%s)",  v15,  v16,  v17,  (uint64_t)v5);
  CFTypeID v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19) {
    goto LABEL_22;
  }
LABEL_25:
}

void sub_10000700C(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  uint64_t v58 = 0LL;
  uint64_t v59 = 0LL;
  uint64_t v65 = 0LL;
  memset(v64, 0, sizeof(v64));
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v26 = sub_1000139A0( (uint64_t)"handle_copy_personalization_manifest",  793LL,  -3,  0LL,  @"Invalid input(s)",  v23,  v24,  v25,  v56);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v26);
    id v6 = 0LL;
LABEL_18:
    id v16 = 0LL;
    if (!v15) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }

  Value = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
  id v7 = sub_1000131C8(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v61 = @"PersonalizedImageType";
      __int16 v62 = 2112;
      uint64_t v63 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
    }

    id v30 = sub_1000139A0( (uint64_t)"handle_copy_personalization_manifest",  799LL,  -3,  0LL,  @"Invalid value for %@: %@",  v27,  v28,  v29,  (uint64_t)@"PersonalizedImageType");
    id v15 = (id)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_18;
  }

  uint64_t v9 = CFDictionaryGetValue(theDict, @"ImageSignature");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_100013220(v10);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v61 = @"ImageSignature";
      __int16 v62 = 2112;
      uint64_t v63 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
    }

    id v34 = sub_1000139A0( (uint64_t)"handle_copy_personalization_manifest",  805LL,  -3,  0LL,  @"Invalid value for %@: %@",  v31,  v32,  v33,  (uint64_t)@"ImageSignature");
    id v15 = (id)objc_claimAutoreleasedReturnValue(v34);

    goto LABEL_18;
  }

  id v57 = 0LL;
  id v13 = sub_1000115F4(v6, &v57);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v57;
  if (!v14)
  {
    __int16 v35 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to find a cached manifest (im4m) for variant %@ (personalization required).",  v6);
    if (v15)
    {
      uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)", v35, v15));

      __int16 v35 = (NSString *)v36;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v61 = (const __CFString *)v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v40 = sub_1000139A0( (uint64_t)"handle_copy_personalization_manifest",  811LL,  -2,  v15,  @"Failed to find a cached manifest (im4m) for variant %@ (personalization required).",  v37,  v38,  v39,  (uint64_t)v6);
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);

    id v16 = 0LL;
LABEL_32:
    id v15 = (id)v41;
    if (!v41) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }

  id v16 = v14;
  uint64_t inited = Img4DecodeInitManifest( (uint64_t)[v16 bytes],  (uint64_t)objc_msgSend(v16, "length"),  (uint64_t)v64);
  if ((_DWORD)inited)
  {
    uint64_t v18 = inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to init img4 manifest: %d",  buf,  8u);
    }

    id v22 = sub_1000139A0( (uint64_t)"handle_copy_personalization_manifest",  817LL,  -2,  0LL,  @"Failed to init img4 manifest: %d",  v19,  v20,  v21,  v18);
    goto LABEL_30;
  }

  Img4DecodeGetObjectPropertyData((uint64_t)v64, 1885629799LL, 1145525076LL, &v59, &v58);
  if ((_DWORD)v42)
  {
    uint64_t v43 = v42;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = v43;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  buf,  8u);
    }

    char v47 = @"Failed to retrieve data from manifest: %d";
    uint64_t v56 = v43;
    uint64_t v48 = 825LL;
LABEL_29:
    id v22 = sub_1000139A0((uint64_t)"handle_copy_personalization_manifest", v48, -2, 0LL, v47, v44, v45, v46, v56);
LABEL_30:
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v22);

LABEL_31:
    goto LABEL_32;
  }

  uint64_t v49 = objc_alloc(&OBJC_CLASS___NSData);
  uint64_t v50 = -[NSData initWithBytes:length:](v49, "initWithBytes:length:", v59, v58);
  if (!v50)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
    }

    char v47 = @"Failed to create data.";
    uint64_t v48 = 831LL;
    goto LABEL_29;
  }

  uint64_t v51 = v50;
  if (([v10 isEqualToData:v50] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Existing manifest's digest does not match.",  buf,  2u);
    }

    id v55 = sub_1000139A0( (uint64_t)"handle_copy_personalization_manifest",  836LL,  -2,  0LL,  @"Existing manifest's digest does not match.",  v52,  v53,  v54,  v56);
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v55);

    goto LABEL_31;
  }

  CFDictionarySetValue(a3, @"ImageSignature", v16);
  CFDictionarySetValue(a3, @"Status", @"Success");

  if (!v15) {
    goto LABEL_36;
  }
LABEL_33:
  if (!CFDictionaryGetValue(a3, @"Error")) {
    CFDictionarySetValue(a3, @"Error", @"InternalError");
  }
  CFDictionarySetValue(a3, @"DetailedError", [v15 description]);
LABEL_36:
}

void sub_1000076A0(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v15 = sub_1000139A0( (uint64_t)"handle_copy_personalization_nonce",  865LL,  -3,  0LL,  @"Invalid input(s)",  v12,  v13,  v14,  v27);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v15);
    id v6 = 0LL;
LABEL_19:
    v10 = 0LL;
    if (!v11) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }

  Value = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  id v6 = v5;
  if (v5)
  {
    id v7 = sub_1000131C8(v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = @"PersonalizedImageType";
        __int16 v31 = 2112;
        uint64_t v32 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
      }

      id v26 = sub_1000139A0( (uint64_t)"handle_copy_personalization_nonce",  871LL,  -3,  0LL,  @"Invalid value for %@: %@",  v23,  v24,  v25,  (uint64_t)@"PersonalizedImageType");
      id v11 = (id)objc_claimAutoreleasedReturnValue(v26);
      goto LABEL_19;
    }
  }

  id v28 = 0LL;
  id v9 = sub_1000107A4(v6, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v28;
  if (v10)
  {
    CFDictionarySetValue(a3, @"PersonalizationNonce", v10);
    CFDictionarySetValue(a3, @"Status", @"Success");
    if (!v11) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }

  id v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy personalization nonce.");
  if (v11)
  {
    uint64_t v27 = (uint64_t)v16;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

    id v16 = (NSString *)v17;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = (const __CFString *)v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v21 = sub_1000139A0( (uint64_t)"handle_copy_personalization_nonce",  877LL,  -2,  v11,  @"Failed to copy personalization nonce.",  v18,  v19,  v20,  v27);
  uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

  v10 = 0LL;
  id v11 = (id)v22;
  if (v22)
  {
LABEL_20:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v11 description]);
  }

LABEL_23:
}

void sub_1000079D8(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v49 = 0u;
  if (a1)
  {
    Value = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
    id v6 = v5;
    if (v5)
    {
      id v7 = sub_1000131C8(v5);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)uint64_t v48 = @"PersonalizedImageType";
          *(_WORD *)&v48[8] = 2112;
          *(void *)&v48[10] = v6;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
        }

        id v12 = sub_1000139A0( (uint64_t)"handle_copy_personalization_identifiers",  919LL,  -3,  0LL,  @"Invalid value for %@: %@",  v9,  v10,  v11,  (uint64_t)@"PersonalizedImageType");
        id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v14 = 0LL;
        if (!v13) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No disk image variant specified, assuming not the DDI.",  buf,  2u);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([@"IODeviceTree" stringByAppendingString:@":/chosen"]);
    id v20 = sub_1000179E0(v19, @"esdm-fuses", 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v20);

    uint64_t v21 = img4_chip_select_personalized_ap();
    if (v21)
    {
      uint64_t v22 = img4_chip_instantiate(v21, &v49);
      if (!(_DWORD)v22)
      {
        v45[0] = @"UniqueChipID";
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)&v51 + 1)));
        v46[0] = v44;
        v45[1] = @"ChipID";
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v51));
        v46[1] = v43;
        v45[2] = @"BoardId";
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  HIDWORD(v50)));
        v46[2] = v42;
        v45[3] = @"SecurityDomain";
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  DWORD1(v51)));
        v46[3] = v35;
        v45[4] = @"EffectiveSecurityModeAp";
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", BYTE3(v52)));
        v46[4] = v36;
        v45[5] = @"EffectiveProductionStatusAp";
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", BYTE2(v52)));
        v46[5] = v37;
        v45[6] = @"CertificateSecurityMode";
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", BYTE1(v52)));
        v46[6] = v38;
        v45[7] = @"CertificateProductionStatus";
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v52));
        v46[7] = v39;
        id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  8LL));
        id v13 = [v40 mutableCopy];

        if (v14) {
          [v13 setObject:v14 forKeyedSubscript:@"Ap,SikaFuse"];
        }
        CFDictionarySetValue(a3, @"PersonalizationIdentifiers", v13);
        id v34 = @"Status";
        uint64_t v32 = @"Success";
        uint64_t v33 = a3;
        goto LABEL_26;
      }

      uint64_t v23 = v22;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = strerror(v23);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v48 = v23;
        *(_WORD *)&v48[4] = 2080;
        *(void *)&v48[6] = v24;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to instantiate chip: 0x%08x (%s)",  buf,  0x12u);
      }

      strerror(v23);
      id v28 = sub_1000139A0( (uint64_t)"handle_copy_personalization_identifiers",  944LL,  -2,  0LL,  @"Failed to instantiate chip: 0x%08x (%s)",  v25,  v26,  v27,  v23);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to select chip.",  buf,  2u);
      }

      id v28 = sub_1000139A0( (uint64_t)"handle_copy_personalization_identifiers",  938LL,  -2,  0LL,  @"Failed to select chip.",  v29,  v30,  v31,  v41);
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue(v28);
    if (!v13) {
      goto LABEL_27;
    }
LABEL_23:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    uint64_t v32 = (const __CFString *)[v13 description];
    uint64_t v33 = a3;
    id v34 = @"DetailedError";
LABEL_26:
    CFDictionarySetValue(v33, v34, v32);

    goto LABEL_27;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
  }

  id v18 = sub_1000139A0( (uint64_t)"handle_copy_personalization_identifiers",  912LL,  -3,  0LL,  @"Invalid input(s)",  v15,  v16,  v17,  v41);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v14 = 0LL;
  id v6 = 0LL;
  if (v13) {
    goto LABEL_23;
  }
LABEL_27:
}

void sub_100007F60(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    id v18 = 0LL;
    id v3 = sub_100010F90(&v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = v18;
    if (v4)
    {
      CFDictionarySetValue(a2, @"CryptexNonce", v4);
      CFDictionarySetValue(a2, @"Status", @"Success");

      if (!v5) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }

    uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to copy cryptex nonce.");
    if (v5)
    {
      uint64_t v17 = (uint64_t)v10;
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      uint64_t v10 = (NSString *)v11;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v15 = sub_1000139A0( (uint64_t)"handle_copy_cryptex_nonce",  995LL,  -2,  v5,  @"Failed to copy cryptex nonce.",  v12,  v13,  v14,  v17);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);

    id v5 = (id)v16;
    if (v16)
    {
LABEL_14:
      if (!CFDictionaryGetValue(a2, @"Error")) {
        CFDictionarySetValue(a2, @"Error", @"InternalError");
      }
      CFDictionarySetValue(a2, @"DetailedError", [v5 description]);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v9 = sub_1000139A0((uint64_t)"handle_copy_cryptex_nonce", 989LL, -3, 0LL, @"Invalid input(s)", v6, v7, v8, v17);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (v5) {
      goto LABEL_14;
    }
  }

void sub_1000081B8(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v14 = sub_1000139A0( (uint64_t)"handle_roll_personalization_nonce",  715LL,  -3,  0LL,  @"Invalid input(s)",  v11,  v12,  v13,  v26);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v6 = 0LL;
    if (!v10) {
      goto LABEL_23;
    }
LABEL_20:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v10 description]);
    goto LABEL_23;
  }

  Value = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = sub_1000131C8(v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v29 = @"PersonalizedImageType";
        __int16 v30 = 2112;
        uint64_t v31 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@: %@",  buf,  0x16u);
      }

      id v25 = sub_1000139A0( (uint64_t)"handle_roll_personalization_nonce",  721LL,  -3,  0LL,  @"Invalid value for %@: %@",  v22,  v23,  v24,  (uint64_t)@"PersonalizedImageType");
      id v10 = (id)objc_claimAutoreleasedReturnValue(v25);
      if (!v10) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
  }

  id v27 = 0LL;
  BOOL v9 = sub_100010C18(v6, &v27);
  id v10 = v27;
  if (v9)
  {
    CFDictionarySetValue(a3, @"Status", @"Success");
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }

  id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to roll personalization nonce.");
  if (v10)
  {
    uint64_t v26 = (uint64_t)v15;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

    id v15 = (NSString *)v16;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = (const __CFString *)v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v20 = sub_1000139A0( (uint64_t)"handle_roll_personalization_nonce",  726LL,  -2,  v10,  @"Failed to roll personalization nonce.",  v17,  v18,  v19,  v26);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

  id v10 = (id)v21;
  if (v21) {
    goto LABEL_20;
  }
LABEL_23:
}

void sub_1000084CC(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    id v17 = 0LL;
    BOOL v3 = sub_100011314(&v17);
    id v4 = v17;
    if (v3)
    {
      CFDictionarySetValue(a2, @"Status", @"Success");
      if (!v4) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }

    BOOL v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to roll cryptex nonce.");
    if (v4)
    {
      uint64_t v16 = (uint64_t)v9;
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

      BOOL v9 = (NSString *)v10;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v14 = sub_1000139A0( (uint64_t)"handle_roll_cryptex_nonce",  758LL,  -2,  v4,  @"Failed to roll cryptex nonce.",  v11,  v12,  v13,  v16);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

    id v4 = (id)v15;
    if (v15)
    {
LABEL_14:
      if (!CFDictionaryGetValue(a2, @"Error")) {
        CFDictionarySetValue(a2, @"Error", @"InternalError");
      }
      CFDictionarySetValue(a2, @"DetailedError", [v4 description]);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  buf,  2u);
    }

    id v8 = sub_1000139A0((uint64_t)"handle_roll_cryptex_nonce", 753LL, -3, 0LL, @"Invalid input(s)", v5, v6, v7, v16);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (v4) {
      goto LABEL_14;
    }
  }

void sub_100008704(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    BOOL v3 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_10001376C());
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    CFDictionarySetValue(a2, @"DeveloperModeStatus", v4);
    uint64_t v5 = @"Status";
    uint64_t v6 = @"Success";
    uint64_t v7 = a2;
LABEL_9:
    CFDictionarySetValue(v7, v5, v6);

    return;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s)",  (uint8_t *)&v13,  2u);
  }

  id v11 = sub_1000139A0( (uint64_t)"handle_copy_developer_mode_status",  1026LL,  -3,  0LL,  @"Invalid input(s)",  v8,  v9,  v10,  v13);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    id v4 = (void *)v12;
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    uint64_t v6 = (const __CFString *)[v4 description];
    uint64_t v7 = a2;
    uint64_t v5 = @"DetailedError";
    goto LABEL_9;
  }
}

uint64_t sub_100008850(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008860(uint64_t a1)
{
}

void sub_100008868(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_10000887C(uint64_t a1, io_iterator_t a2)
{
  kern_return_t v14;
  __int16 v15;
  const char *v16;
  uint32_t v17;
  const void *Value;
  void *v19;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v22;
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_10001E40C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v19 = (void *)os_transaction_create("com.apple.mobile.storage_mounter.xpc");
  io_object_t v11 = IOIteratorNext(a2);
  if (v11)
  {
    io_registry_entry_t v12 = v11;
    do
    {
      properties = 0LL;
      uint64_t v13 = sub_100012DF0();
      if (v13)
      {
        id v14 = IORegistryEntryCreateCFProperties(v12, &properties, 0LL, 0);
        if (v14)
        {
          uint64_t v15 = v14;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v22) = v15 & 0x3FFF;
            uint64_t v16 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
            id v17 = 8;
LABEL_11:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
          }
        }

        else
        {
          Value = CFDictionaryGetValue(properties, @"locationID");
          if (Value)
          {
            CFDictionarySetValue(v13, @"LocationID", Value);
            CFDictionarySetValue(v13, @"DeviceType", @"PTPCamera");
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = @"com.apple.mobile.camera_attached";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Posting notification: %@",  buf,  0xCu);
            }

            sub_10000BC24(@"com.apple.mobile.camera_attached", v13);
            goto LABEL_18;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v22 = "locationID";
            uint64_t v16 = "Failed to retrieve %s.";
            id v17 = 12;
            goto LABEL_11;
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Failed to create dictionary.";
        id v17 = 2;
        goto LABEL_11;
      }

LABEL_18:
      if (properties) {
        CFRelease(properties);
      }
      properties = 0LL;
      if (v13) {
        CFRelease(v13);
      }
      IOObjectRelease(v12);
      io_registry_entry_t v12 = IOIteratorNext(a2);
    }

    while (v12);
  }
}

void sub_100008B34( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100008B5C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_100008B7C(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"/private/var"])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue([v1 componentsSeparatedByString:@"/"]);
    id v3 = [v2 mutableCopy];

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
    unsigned int v5 = [v4 isEqualToString:&stru_10002F6C8];

    if (v5) {
      [v3 removeObjectAtIndex:0];
    }
    [v3 removeObjectAtIndex:0];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@"/"]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/%@", v6));

    id v1 = (id)v7;
  }

  return v1;
}

void sub_100008CB4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___PlistProcessor);
  v2 = (void *)qword_100034878;
  qword_100034878 = (uint64_t)v1;
}

LABEL_12:
}

        uint64_t v8 = 0LL;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *__error();
          uint64_t v10 = __error();
          io_object_t v11 = strerror(*v10);
          *(_DWORD *)buf = 136315650;
          *(void *)id v28 = v4;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = v9;
          *(_WORD *)&v28[14] = 2080;
          *(void *)&v28[16] = v11;
          io_registry_entry_t v12 = "Failed to lstat %s: %d (%s)";
          uint64_t v13 = 28;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
          uint64_t v8 = 0LL;
          goto LABEL_40;
        }

        goto LABEL_40;
      }

NSMutableArray *sub_10000922C(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"ProgramArguments"]);
  if (!v2) {
    v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"Program"]);
  }
  id v3 = sub_100013170(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
  }

  else
  {
    id v5 = sub_1000131C8(v2);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v2;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unexpected object: %@",  buf,  0xCu);
      }

      io_object_t v11 = 0LL;
      goto LABEL_11;
    }
  }

  id v7 = sub_100013170(v2);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    uint64_t v9 = (NSMutableArray *)[v2 mutableCopy];
LABEL_10:
    io_object_t v11 = v9;
    goto LABEL_11;
  }

  id v10 = sub_1000131C8(v2);
  io_object_t v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    uint64_t v9 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v2, 0LL);
    goto LABEL_10;
  }

LABEL_11:
  return v11;
}

    io_registry_entry_t v12 = 0LL;
    io_object_t v11 = 0LL;
    goto LABEL_12;
  }

  io_object_t v11 = v10;
  io_registry_entry_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", @"Program"));
  if (([v12 hasPrefix:a1[5]] & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
    id v14 = [v13 jobIsManagedByMSM:v11];

    if ((v14 & 1) == 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v9;
      uint64_t v15 = "Job '%@' was not loaded by MobileStorageMounter. Skipping unload.";
      goto LABEL_22;
    }
  }

  if (SMJobRemove(0LL, v9, 0LL, 1u, &outError))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v9;
    uint64_t v15 = "Removed launchd job: %@";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_12;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001E798((uint64_t)v9, (uint64_t)&outError, v18, v19, v20, v21, v22, v23);
  }
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
LABEL_12:
  if (outError) {
    CFRelease(outError);
  }
  outError = 0LL;
  uint64_t v16 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);

  return v16;
}

    uint64_t v9 = 0LL;
    uint64_t v4 = 0LL;
    id v7 = 0LL;
    id v5 = 0LL;
    id v3 = 0LL;
    goto LABEL_19;
  }

  v2 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v1));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Failed to create URL.";
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  id v3 = (void *)v2;
  id v14 = 0LL;
  uint64_t v4 = [[DIAttachParams alloc] initWithURL:v2 error:&v14];
  id v5 = v14;
  if (v4)
  {
    [v4 setAutoMount:0];
    [v4 setFileMode:2];
    io_registry_entry_t v12 = v5;
    uint64_t v13 = 0LL;
    uint64_t v6 = +[DiskImages2 attachWithParams:handle:error:]( &OBJC_CLASS___DiskImages2,  "attachWithParams:handle:error:",  v4,  &v13,  &v12);
    id v7 = v13;
    uint64_t v8 = v12;

    if ((v6 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 BSDName]);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v1;
        id v17 = 2112;
        uint64_t v18 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to attach %@: %@",  buf,  0x16u);
      }

      uint64_t v9 = 0LL;
    }

    id v5 = v8;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create attach parameters: %@",  buf,  0xCu);
    }

    uint64_t v9 = 0LL;
    uint64_t v4 = 0LL;
    id v7 = 0LL;
  }

    id v3 = 0LL;
LABEL_12:
    uint64_t v8 = 0LL;
    goto LABEL_13;
  }

  v2 = IONotificationPortCreate(kIOMasterPortDefault);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "IONotificationPortCreate failed.";
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  id v3 = v2;
  uint64_t v4 = IOServiceMatching("IOMedia");
  id v5 = IOServiceAddMatchingNotification(v3, "IOServiceMatched", v4, 0LL, a1, &notification);
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint64_t v16 = v6 & 0x3FFF;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IOServiceAddMatchingNotification failed: 0x%04x",  buf,  8u);
    }

    goto LABEL_12;
  }

  id v10 = IOIteratorNext(notification);
  if (v10)
  {
    io_object_t v11 = v10;
    do
    {
      io_registry_entry_t v12 = IORegistryEntrySearchCFProperty(v11, "IOService", @"hdik-unique-identifier", kCFAllocatorDefault, 3u);
      if (v12)
      {
        uint64_t v13 = v12;
        if (CFEqual(v12, *a1)) {
          a1[1] = IORegistryEntryCreateCFProperty(v11, @"BSD Name", kCFAllocatorDefault, 0);
        }
        CFRelease(v13);
      }

      IOObjectRelease(v11);
      io_object_t v11 = IOIteratorNext(notification);
    }

    while (v11);
  }

  uint64_t v8 = a1[1] != 0LL;
LABEL_13:
  if (notification) {
    IOObjectRelease(notification);
  }
  if (v3) {
    IONotificationPortDestroy(v3);
  }
  return v8;
}

LABEL_16:
    id v40 = v40;
    uint64_t v41 = 0;
    *a5 = v40;
    goto LABEL_21;
  }

  uint64_t v26 = sub_100008B7C(v12);
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (!v30)
  {
    __int128 v50 = sub_1000139A0( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  306LL,  -2,  0LL,  @"Failed to normalize %@.",  v27,  v28,  v29,  (uint64_t)v12);
    goto LABEL_19;
  }

  uint64_t v31 = sub_100008B7C(@"/Developer");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  uint64_t v33 = [v30 hasPrefix:v32];

  if (v33)
  {
    id v34 = sub_100008B7C(@"/Developer");
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    uint64_t v36 = [v25 hasPrefix:v35];

    if ((v36 & 1) == 0)
    {
      __int128 v50 = sub_1000139A0( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  315LL,  -2,  0LL,  @"Invalid program path: %@",  v37,  v38,  v39,  (uint64_t)v25);
LABEL_19:
      id v40 = (id)objc_claimAutoreleasedReturnValue(v50);
      if (!a5) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }

  id v40 = 0LL;
  uint64_t v41 = 1;
LABEL_21:

  return v41;
}

  return v14;
}

  if ((objc_msgSend(v3, "hasPrefix:", @"/dev/", *(void *)entry) & 1) == 0)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([@"/dev" stringByAppendingString:v3]);

    id v3 = (id)v16;
  }

  id v3 = v3;
  id v17 = open((const char *)[v3 UTF8String], 0);
  if (v17 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = *__error();
      *(_DWORD *)entry = 138412546;
      *(void *)&entry[4] = v3;
      uint64_t v26 = 1024;
      id v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to open %@: %{errno}d",  entry,  0x12u);
    }

void sub_1000099E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_100009A14(void *a1)
{
  id v1 = a1;
  bzero(buffer, 0x1000uLL);
  memset(v8, 0, sizeof(v8));
  if (v1)
  {
    uint64_t pid = xpc_connection_get_pid(v1);
    proc_pidpath(pid, buffer, 0x1000u);
    int v3 = strlen(buffer);
    if ((v3 & 0x80000000) == 0)
    {
      while (buffer[v3] != 47)
      {
        if (v3-- <= 0)
        {
          int v3 = -1;
          break;
        }
      }
    }

    __strcpy_chk(v8, &buffer[v3 + 1], 256LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s<%d>", v8, pid));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input.",  buf,  2u);
    }

    id v5 = 0LL;
  }

  return v5;
}

BOOL sub_100009B8C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  if (v3 && v4)
  {
    uint64_t v6 = (void *)xpc_connection_copy_entitlement_value( v3,  [@"com.apple.private.mobile_storage.allowedSPI" UTF8String]);
    id v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100009DCC;
      v11[3] = &unk_10002CE40;
      id v10 = v5;
      io_registry_entry_t v12 = (__CFString *)v10;
      uint64_t v13 = &v14;
      xpc_array_apply(v7, v11);

      if (!*((_BYTE *)v15 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v10;
        goto LABEL_7;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = @"com.apple.private.mobile_storage.allowedSPI";
LABEL_7:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid or missing entitlement: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid inputs.",  buf,  2u);
    }

    id v7 = 0LL;
  }

  BOOL v8 = *((_BYTE *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_100009DAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

BOOL sub_100009DCC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp( string_ptr, (const char *)[*(id *)(a1 + 32) fileSystemRepresentation])) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    }
  }

  BOOL v6 = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == 0;

  return v6;
}

uint64_t sub_100009E60(void *a1, void *a2)
{
  id v3 = a1;
  id v7 = v3;
  if (v3)
  {
    uint64_t mounted_jetsam_properties = launch_load_mounted_jetsam_properties([v3 UTF8String]);
    if (!(_DWORD)mounted_jetsam_properties)
    {
      id v14 = 0LL;
      uint64_t v15 = 1LL;
      goto LABEL_9;
    }

    uint64_t v9 = mounted_jetsam_properties;
    strerror(mounted_jetsam_properties);
    id v13 = sub_1000139A0( (uint64_t)"loadLaunchdJetsamPropertiesForMountPoint",  302LL,  -2,  0LL,  @"Failed to load mounted jetsam properties: %d (%s)",  v10,  v11,  v12,  v9);
  }

  else
  {
    id v13 = sub_1000139A0( (uint64_t)"loadLaunchdJetsamPropertiesForMountPoint",  296LL,  -3,  0LL,  @"Invalid input.",  v4,  v5,  v6,  v17);
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  if (a2)
  {
    id v14 = v14;
    uint64_t v15 = 0LL;
    *a2 = v14;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

LABEL_9:
  return v15;
}

  if (a7) {
    *a7 = v24;
  }
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  if (v29 != -1) {
    goto LABEL_12;
  }
LABEL_13:
  if (v28 != -1)
  {
    close(v28);
    unlink((const char *)[v141 UTF8String]);
  }

  if (v27 != -1)
  {
    close(v27);
    unlink((const char *)[v25 UTF8String]);
  }

  if ((_DWORD)v30 != -1) {
    close(v30);
  }
  if (v144) {
    cryptex_msm_destroy(&v144);
  }

  return v32;
}

    uint64_t v6 = 0LL;
    goto LABEL_10;
  }

  id v3 = v1;
  uint64_t v4 = container_system_group_path_for_identifier(0, [v3 UTF8String], &v10);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v3;
      id v13 = 1024;
      id v14 = v10;
      id v7 = "Failed to copy system group container (%@): %d";
      BOOL v8 = 18;
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  uint64_t v5 = (void *)v4;
  uint64_t v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v4);
  free(v5);
LABEL_10:

  return v6;
}

  return v8;
}

BOOL sub_100009F2C(void *a1, void *a2)
{
  id v3 = a1;
  id v17 = a2;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 1;
  context = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v3,  @"/Library/LaunchDaemons"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v3,  @"/System/Library/LaunchDaemons"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v3,  @"/AppleInternal/Library/LaunchDaemons"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v4, v5, v6, 0LL));

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000A1F4;
      v18[3] = &unk_10002CE68;
      id v19 = v3;
      id v20 = v17;
      uint64_t v21 = &v26;
      [(id)v13 scanPlistsAtPath:v12 execBlock:v18];

      LOBYTE(v13) = *((_BYTE *)v27 + 24) == 0;
      if ((v13 & 1) != 0) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
  BOOL v14 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v14;
}

void sub_10000A1C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_10000A1F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFErrorRef outError = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
  uint64_t v8 = *(void *)(a1 + 32);
  id v24 = 0LL;
  unsigned __int8 v9 = [v7 verifyPlist:v5 forMountPoint:v8 withError:&v24];
  id v10 = v24;

  if ((v9 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Label"]);
    if ([*(id *)(a1 + 40) isEqualToString:@"Personalized"]
      && [*(id *)(a1 + 32) hasPrefix:@"/private/var/personalized_factory"])
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
      uint64_t v13 = *(void *)(a1 + 32);
      id v23 = v10;
      id v14 = [v12 copyAndFixPlist:v5 forMountPoint:v13 withError:&v23];
      id v15 = v23;

      if (!v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10001E6C8();
        }
        goto LABEL_20;
      }

      id v10 = v15;
    }

    else
    {
      id v14 = v5;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
    id v22 = v10;
    uint64_t v16 = (const __CFDictionary *)[v17 copyPlistWithMSMKeys:v14 withError:&v22];
    id v15 = v22;

    if (v16)
    {
      int v18 = SMJobSubmit(0LL, v16, 0LL, &outError);
      BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Registered launchd job: %@",  buf,  0xCu);
        }

        goto LABEL_22;
      }

      if (v19)
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v11;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        CFErrorRef v31 = outError;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to register launchd job '%@' (%@): %@",  buf,  0x20u);
      }

LABEL_21:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      goto LABEL_22;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2114;
      id v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to add MobileStorageMounter keys to job %{public}@: %{public}@",  buf,  0x16u);
    }

          uint64_t v41 = 0LL;
          goto LABEL_22;
        }

        uint64_t v41 = v6;
        id v3 = getfsstat(v6, v5 + 2168, 2);
      }

      while ((v3 & 0x80000000) == 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
      }

LABEL_20:
    uint64_t v16 = 0LL;
    goto LABEL_21;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001E730();
  }
  uint64_t v11 = 0LL;
  uint64_t v16 = 0LL;
  id v15 = v10;
LABEL_22:
  if (outError) {
    CFRelease(outError);
  }
  CFErrorRef outError = 0LL;
  uint64_t v20 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);

  return v20;
}

  return v10;
}

  return v10;
}

  return a2;
}

BOOL sub_10000A54C(void *a1)
{
  id v1 = a1;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  id v2 = sub_100008B7C(v1);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v16)
  {
    context = objc_autoreleasePoolPush();
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v1,  @"/Library/LaunchDaemons"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v1,  @"/System/Library/LaunchDaemons"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v1,  @"/AppleInternal/Library/LaunchDaemons"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, v4, v5, 0LL));

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v12 = objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10000A870;
        v17[3] = &unk_10002CE68;
        id v18 = v1;
        id v19 = v16;
        uint64_t v20 = &v25;
        [(id)v12 scanPlistsAtPath:v11 execBlock:v17];

        LOBYTE(v12) = *((_BYTE *)v26 + 24) == 0;
        if ((v12 & 1) != 0) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    objc_autoreleasePoolPop(context);
    BOOL v13 = *((_BYTE *)v26 + 24) != 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to normalize mount point (%@)",  buf,  0xCu);
    }

    BOOL v13 = 0LL;
    *((_BYTE *)v26 + 24) = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v13;
}

void sub_10000A848( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_10000A870(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFErrorRef outError = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor"));
  unsigned __int8 v8 = [v7 verifyPlist:v5 forMountPoint:a1[4] withError:0];

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to verify %@. Skipping unload.",  buf,  0xCu);
    }

    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Label"]);
  CFDictionaryRef v10 = SMJobCopyDictionary(0LL, v9);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Job '%@' is not currently loaded. Skipping unload.",  buf,  0xCu);
    }

uint64_t sub_10000AB4C(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      __int16 v30 = "Invalid input.";
LABEL_21:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v30,  (uint8_t *)&v36,  2u);
    }

LABEL_22:
    BOOL v13 = 0LL;
    id v6 = 0LL;
    uint64_t v4 = 0LL;
LABEL_23:
    unsigned __int8 v8 = 0LL;
LABEL_24:
    id v15 = 0LL;
    goto LABEL_25;
  }

  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingPathComponent:]( v1,  "stringByAppendingPathComponent:",  @"/System/Library/CoreServices/SystemVersion.plist"));
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      __int16 v30 = "Failed to create string.";
      goto LABEL_21;
    }

    goto LABEL_22;
  }

  uint64_t v4 = (__CFString *)v3;
  id v5 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v3);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138412290;
      uint64_t v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to load %@.",  (uint8_t *)&v36,  0xCu);
    }

    BOOL v13 = 0LL;
    id v6 = 0LL;
    goto LABEL_23;
  }

  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"ProductVersion"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"."]);

  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v9)
    {
      int v36 = 138412290;
      uint64_t v37 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve disk image product version from %@.",  (uint8_t *)&v36,  0xCu);
    }

    BOOL v13 = 0LL;
    goto LABEL_23;
  }

  if (v9)
  {
    CFDictionaryRef v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    CFDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    int v36 = 138412546;
    uint64_t v37 = v10;
    __int16 v38 = 2112;
    uint64_t v39 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disk Image Product Version: %@.%@",  (uint8_t *)&v36,  0x16u);
  }

  uint64_t v12 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist");
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138412290;
      uint64_t v37 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to load %@.",  (uint8_t *)&v36,  0xCu);
    }

    BOOL v13 = 0LL;
    goto LABEL_24;
  }

  BOOL v13 = v12;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", @"ProductVersion"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@"."]);

  BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v16)
    {
      int v36 = 138412290;
      uint64_t v37 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve system product version from %@.",  (uint8_t *)&v36,  0xCu);
    }

    goto LABEL_24;
  }

  if (v16)
  {
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);
    int v36 = 138412546;
    uint64_t v37 = v17;
    __int16 v38 = 2112;
    uint64_t v39 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "System Product Version: %@.%@",  (uint8_t *)&v36,  0x16u);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);
  unsigned __int8 v21 = [v19 isEqualToString:v20];

  if ((v21 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    goto LABEL_25;
  }

  uint64_t v22 = 1LL;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:1]);
  unsigned __int8 v25 = [v23 isEqualToString:v24];

  if ((v25 & 1) != 0) {
    goto LABEL_26;
  }
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);
  if (![v26 isEqualToString:@"16"])
  {
LABEL_41:

    goto LABEL_42;
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:1]);
  if ([v27 compare:@"4" options:64] == (id)-1)
  {

    goto LABEL_41;
  }

  char v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
  unsigned __int8 v29 = [v28 isEqualToString:@"4"];

  uint64_t v22 = 1LL;
  if ((v29 & 1) == 0)
  {
LABEL_42:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:1]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
      int v36 = 138413314;
      uint64_t v37 = v2;
      __int16 v38 = 2112;
      uint64_t v39 = v32;
      __int16 v40 = 2112;
      uint64_t v41 = v33;
      __int16 v42 = 2112;
      uint64_t v43 = v34;
      __int16 v44 = 2112;
      uint64_t v45 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "System Version Mismatch for %@: (System: %@.%@ / Image: %@.%@)",  (uint8_t *)&v36,  0x34u);
    }

      if (v3 > 0)
      {
        CFDictionaryRef v11 = (void *)MGCopyAnswer(@"3kmXfug8VcxLI5yEmsqQKw", 0LL);
        uint64_t v12 = [v11 BOOLValue];

        if (((v12 | os_variant_is_recovery("com.apple.mobile.storage_mounter")) & 1) == 0)
        {
          unsigned __int8 v14 = cryptex_copy_list_4MSM(a1 ^ 1u, &v48, &v47, 0LL);
          if ((v14 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = strerror(v14);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v14;
              LOWORD(v54) = 2080;
              *(void *)((char *)&v54 + 2) = v15;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to copy cryptex list (%d (%s)), non-fatal.",  buf,  0x12u);
            }

            if (v48)
            {
              cryptex_msm_array_destroy(v48, v47);
              uint64_t v48 = 0LL;
            }

            char v47 = 0LL;
          }
        }

        BOOL v16 = 0LL;
        id v17 = 0LL;
        uint64_t v18 = v3;
        *(void *)&BOOL v13 = 136315138LL;
        uint64_t v39 = v13;
        while (1)
        {
          *(void *)buf = 0LL;
          *(void *)&__int128 v54 = buf;
          *((void *)&v54 + 1) = 0x2020000000LL;
          __int128 v55 = 0;
          uint64_t v19 = sub_100014678((uint64_t)&v41[v16], v48, v47);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          unsigned __int8 v21 = v20;
          if (!v20) {
            break;
          }
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"MountPath"]);
          if (!v22)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 v51 = 138412290;
              f_mntonname = @"MountPath";
              uint64_t v26 = "Map entry missing value for key %@.";
              uint64_t v27 = 12;
LABEL_39:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, v51, v27);
            }

            goto LABEL_40;
          }

          uint64_t v23 = v22;
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"DiskImageType"]);
          unsigned __int8 v25 = [v24 isEqualToString:@"Cryptex"];

          if (v25)
          {
            *(_BYTE *)(v54 + 24) = 1;
          }

          else
          {
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_100015388;
            v43[3] = &unk_10002CF60;
            uint64_t v32 = v23;
            __int16 v44 = v32;
            uint64_t v45 = v21;
            uint64_t v46 = buf;
            [&off_1000306E0 enumerateObjectsUsingBlock:v43];

            if (!*(_BYTE *)(v54 + 24))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_10001EA88(v49, (uint64_t)v32, &v50);
              }
              char v28 = 0LL;
              unsigned __int8 v29 = 0LL;
              __int16 v30 = 0LL;
              id v31 = 0LL;
              __int16 v42 = (uint64_t)v17;
              uint64_t v23 = v32;
              goto LABEL_62;
            }
          }

          __int16 v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", @"DeviceNode", v39));

          if (v42)
          {
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"DeviceType"]);
            if (v31)
            {
              if ([@"DiskImage" isEqualToString:v31])
              {
                uint64_t v33 = sub_10001540C((uint64_t)v41[v16].f_mntfromname);
                id v34 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);
                if (v34)
                {
                  [v21 setObject:v34 forKeyedSubscript:@"BackingImage"];
                  char v28 = (id)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"ImageSignature"]);
                  if (v28)
                  {
                    __int16 v30 = 0LL;
                    unsigned __int8 v29 = v34;
LABEL_61:
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v21, v42);
                    goto LABEL_62;
                  }

                  __int16 v35 = sub_10001540C((uint64_t)v41[v16].f_mntfromname);
                  unsigned __int8 v29 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);

                  if (v29)
                  {
                    int v36 = sub_1000155B0(v29);
                    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v36);
                    if (v30)
                    {
                      char v28 = -[NSMutableData initDataWithHexString:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initDataWithHexString:",  v30);
                      if (v28)
                      {
                        [v21 setObject:v28 forKeyedSubscript:@"ImageSignature"];
                        goto LABEL_61;
                      }

                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)__int128 v51 = 138412290;
                        f_mntonname = v29;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to convert signature from %@",  v51,  0xCu);
                      }
                    }

                    else
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)__int128 v51 = 138412290;
                        f_mntonname = v29;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to recover signature from %@",  v51,  0xCu);
                      }

                      __int16 v30 = 0LL;
                    }

                    goto LABEL_60;
                  }

                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_58:
                    *(_DWORD *)__int128 v51 = v39;
                    f_mntonname = (const __CFString *)v41[v16].f_mntonname;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get backing image path for %s",  v51,  0xCu);
                  }
                }

                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  goto LABEL_58;
                }
              }

              __int16 v30 = 0LL;
              unsigned __int8 v29 = 0LL;
LABEL_60:
              char v28 = 0LL;
              goto LABEL_61;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 v51 = 138412290;
              f_mntonname = @"DeviceType";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Map entry missing %@.",  v51,  0xCu);
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 v51 = 138412290;
              f_mntonname = @"DeviceNode";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Map entry missing %@.",  v51,  0xCu);
            }

            __int16 v42 = 0LL;
          }

          char v28 = 0LL;
          unsigned __int8 v29 = 0LL;
          __int16 v30 = 0LL;
          id v31 = 0LL;
LABEL_62:
          _Block_object_dispose(buf, 8);

          ++v16;
          unsigned __int8 v8 = (void *)v42;
          id v17 = (void *)v42;
          if (!--v18) {
            goto LABEL_78;
          }
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 v51 = 0;
          uint64_t v26 = "Failed to create map entry.";
          uint64_t v27 = 2;
          goto LABEL_39;
        }

LABEL_25:
    uint64_t v22 = 0LL;
  }
}

LABEL_26:
  return v22;
}

uint64_t sub_10000B210(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      id v5 = 0LL;
      id v6 = 0LL;
      id v7 = 0LL;
      uint64_t v4 = 0LL;
LABEL_10:
      CFDictionaryRef v10 = 0LL;
LABEL_11:
      CFDictionaryRef v11 = 0LL;
      goto LABEL_12;
    }

    *(_WORD *)buf = 0;
    unsigned __int8 v8 = "Invalid input.";
    uint32_t v9 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    goto LABEL_9;
  }

  uint64_t v3 = objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:@"/System/Library/CoreServices/SystemVersion.plist"]);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    id v5 = 0LL;
    id v6 = 0LL;
    id v7 = 0LL;
    goto LABEL_10;
  }

  unsigned __int8 v14 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", 0LL);
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    char v28 = 0LL;
    unsigned __int8 v8 = "Failed to load %@.";
    uint32_t v9 = 12;
    goto LABEL_8;
  }

  id v5 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", @"ProductVersion"));
  CFDictionaryRef v10 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsSeparatedByString:@"."]);

  if (!v10 || [v10 count] != (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v28 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve disk image product version from %@.",  buf,  0xCu);
    }

    id v6 = 0LL;
    id v7 = 0LL;
    uint64_t v4 = 0LL;
    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
    *(_DWORD *)buf = 138412546;
    char v28 = v16;
    __int16 v29 = 2112;
    __int16 v30 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disk Image Product Version: %@.%@",  buf,  0x16u);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", off_1000344B8));
  CFDictionaryRef v11 = (void *)objc_claimAutoreleasedReturnValue([v18 componentsSeparatedByString:@"."]);

  if (v11 && [v11 count] == (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
      uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
      *(_DWORD *)buf = 138412546;
      char v28 = v19;
      __int16 v29 = 2112;
      __int16 v30 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Required Disk Image Product Version: %@.%@",  buf,  0x16u);
    }

    unsigned __int8 v21 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
    uint64_t v12 = 1LL;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
    id v7 = -[NSString initWithFormat:](v21, "initWithFormat:", @"%@.%@", v22, v23);

    __int128 v24 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
    id v6 = -[NSString initWithFormat:](v24, "initWithFormat:", @"%@.%@", v25, v26);

    if ((id)-[NSString compare:options:](v7, "compare:options:", v6, 64LL) != (id)1)
    {
      uint64_t v4 = 0LL;
      goto LABEL_13;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      char v28 = v6;
      __int16 v29 = 2112;
      __int16 v30 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Current DDI version (%@) is lower than OS version (%@).",  buf,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve required DDI version.",  buf,  2u);
    }

    id v6 = 0LL;
    id v7 = 0LL;
  }

  uint64_t v4 = 0LL;
LABEL_12:
  uint64_t v12 = 0LL;
LABEL_13:

  return v12;
}

uint64_t sub_10000B748(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  memset(&v26, 0, sizeof(v26));
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = (const char *)[v3 UTF8String];
    if (lstat(v4, &v26))
    {
      if (*__error() != 2
        || ([v3 hasPrefix:@"/System/Volumes/FieldService"] & 1) != 0
        || ([v3 hasPrefix:@"/System/Volumes/FieldServiceDiagnostic"] & 1) != 0
        || ([v3 hasPrefix:@"/System/Volumes/FieldServiceRepair"] & 1) != 0
        || ([v3 hasPrefix:@"/Developer"] & 1) != 0
        || ([v3 hasPrefix:@"/System/Developer"] & 1) != 0)
      {
        goto LABEL_12;
      }

      if (mkdir(v4, 0x1EDu))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v5 = *__error();
          id v6 = __error();
          id v7 = strerror(*v6);
          *(_DWORD *)buf = 136315650;
          *(void *)char v28 = v4;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = v5;
          *(_WORD *)&v28[14] = 2080;
          *(void *)&v28[16] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %s: %d (%s)",  buf,  0x1Cu);
        }

LABEL_41:
      uint64_t v8 = 1LL;
      goto LABEL_40;
    }

    if ((v26.st_mode & 0xF000) == 0x4000)
    {
      v29[0] = (char *)v4;
      v29[1] = 0LL;
      unsigned __int8 v14 = fts_open(v29, 17, 0LL);
      uint64_t v8 = (uint64_t)v14;
      if (v14)
      {
        id v15 = fts_read(v14);
        if (v15)
        {
          BOOL v16 = v15;
          char v17 = 1;
          do
          {
            if (strcmp(v16->fts_path, v4))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                fts_path = v16->fts_path;
                *(_DWORD *)buf = 136315394;
                *(void *)char v28 = v4;
                *(_WORD *)&v28[8] = 2080;
                *(void *)&v28[10] = fts_path;
                _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Mount path %s is not empty: %s",  buf,  0x16u);
              }

              char v17 = 0;
            }

            BOOL v16 = fts_read((FTS *)v8);
          }

          while (v16);
          if (!fts_close((FTS *)v8))
          {
            if ((v17 & 1) != 0) {
              goto LABEL_41;
            }
            uint64_t v8 = 0LL;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 136315138;
            *(void *)char v28 = v4;
            uint64_t v12 = "%s is not empty.";
LABEL_28:
            uint32_t v13 = 12;
            goto LABEL_39;
          }
        }

        else if (!fts_close((FTS *)v8))
        {
          goto LABEL_41;
        }

        uint64_t v8 = 0LL;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        int v22 = *__error();
        uint64_t v23 = __error();
        __int128 v24 = strerror(*v23);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)char v28 = v22;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = v24;
        uint64_t v12 = "Failed to close file traversal handle: %d (%s)";
      }

      else
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        int v19 = *__error();
        uint64_t v20 = __error();
        unsigned __int8 v21 = strerror(*v20);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)char v28 = v19;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = v21;
        uint64_t v12 = "Failed to open path for traversal: %d (%s)";
      }

      uint32_t v13 = 18;
      goto LABEL_39;
    }

    uint64_t v8 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)char v28 = v4;
    uint64_t v12 = "%s is not a directory.";
    goto LABEL_28;
  }

  uint64_t v8 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid input.";
    uint32_t v13 = 2;
    goto LABEL_39;
  }

LABEL_40:
  return v8;
}

        char v28 = 0LL;
        __int16 v29 = 0LL;
        uint64_t v23 = 0LL;
        __int16 v30 = 0LL;
        id v31 = 0LL;
        __int16 v42 = (uint64_t)v17;
        goto LABEL_62;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v37;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
    }

    uint64_t v8 = 0LL;
LABEL_78:
    if (v41) {
      free(v41);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
    }

    uint64_t v8 = 0LL;
  }

  if (v48) {
    cryptex_msm_array_destroy(v48, v47);
  }

  return v40;
}

void sub_10000BC24(void *a1, void *a2)
{
  object = a1;
  id v3 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, object, object, 0LL, 1u);
  if (v3)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v5 postNotificationName:object object:@"MobileStorageMounter" userInfo:v3 deliverImmediately:1];
  }
}

void sub_10000BCB0(void *a1)
{
}

NSData *sub_10000BCB8(void *a1)
{
  id v1 = a1;
  memset(&v16, 0, sizeof(v16));
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Invalid input.";
      uint32_t v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }

LABEL_13:
    CFDictionaryRef v10 = 0LL;
    id v3 = 0LL;
    goto LABEL_20;
  }

  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v1,  *(_OWORD *)&v16.h0,  *(_OWORD *)&v16.h4,  *(_OWORD *)&v16.data[1],  *(_OWORD *)&v16.data[5],  *(_OWORD *)&v16.data[9],  *(_OWORD *)&v16.data[13]));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v1;
      uint64_t v12 = "Failed to create file handle for %@.";
      uint32_t v13 = 12;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  id v3 = (void *)v2;
  CC_SHA1_Init(&v16);
  uint64_t v4 = (unsigned __int8 *)malloc(0x14uLL);
  if (v4)
  {
    int v5 = v4;
    do
    {
      id v6 = objc_autoreleasePoolPush();
      id v7 = objc_claimAutoreleasedReturnValue([v3 readDataOfLength:1024]);
      CC_SHA1_Update(&v16, [v7 bytes], (CC_LONG)objc_msgSend(v7, "length"));
      id v8 = [v7 length];

      objc_autoreleasePoolPop(v6);
    }

    while (v8);
    CC_SHA1_Final(v5, &v16);
    int v9 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v5, 20LL);
    CFDictionaryRef v10 = v9;
    if (v9)
    {
      CFDictionaryRef v11 = v9;
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
    }

    free(v5);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v1_Block_object_dispose(va, 8) = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %{errno}d",  buf,  8u);
    }

    CFDictionaryRef v10 = 0LL;
  }

    CFDictionaryRef v10 = 0LL;
    id v3 = 0LL;
    goto LABEL_20;
  }

  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v1,  *(_OWORD *)v16.count,  *(_OWORD *)v16.hash,  *(_OWORD *)&v16.hash[2],  *(_OWORD *)&v16.hash[4],  *(_OWORD *)&v16.hash[6],  *(_OWORD *)v16.wbuf,  *(_OWORD *)&v16.wbuf[2],  *(_OWORD *)&v16.wbuf[4],  *(_OWORD *)&v16.wbuf[6],  *(_OWORD *)&v16.wbuf[8],  *(_OWORD *)&v16.wbuf[10],  *(_OWORD *)&v16.wbuf[12],  *(_OWORD *)&v16.wbuf[14]));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v1;
      uint64_t v12 = "Failed to create file handle for %@.";
      uint32_t v13 = 12;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  id v3 = (void *)v2;
  CC_SHA384_Init(&v16);
  uint64_t v4 = (unsigned __int8 *)malloc(0x30uLL);
  if (v4)
  {
    int v5 = v4;
    do
    {
      id v6 = objc_autoreleasePoolPush();
      id v7 = objc_claimAutoreleasedReturnValue([v3 readDataOfLength:1024]);
      CC_SHA384_Update(&v16, [v7 bytes], (CC_LONG)objc_msgSend(v7, "length"));
      id v8 = [v7 length];

      objc_autoreleasePoolPop(v6);
    }

    while (v8);
    CC_SHA384_Final(v5, &v16);
    int v9 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v5, 48LL);
    CFDictionaryRef v10 = v9;
    if (v9)
    {
      CFDictionaryRef v11 = v9;
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
    }

    free(v5);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v1_Block_object_dispose(va, 8) = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %{errno}d",  buf,  8u);
    }

    CFDictionaryRef v10 = 0LL;
  }

        a2 = 0LL;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        LOWORD(v17) = 0;
        int v9 = "Failed to digest data.";
        goto LABEL_15;
      }

      id v7 = sub_10000BCB8(v5);
      id v8 = objc_claimAutoreleasedReturnValue(v7);
    }

    CFDictionaryRef v11 = (void *)v8;
    if (v8)
    {
      uint64_t v12 = malloc(a3);
      if (v12)
      {
        uint32_t v13 = v12;
        int v14 = v11;
        memcpy(v13, [v14 bytes], (size_t)objc_msgSend(v14, "length"));
        *(void *)a2 = v13;

        a2 = 1LL;
        goto LABEL_20;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = *__error();
        char v17 = 67109120;
        LODWORD(v1_Block_object_dispose(va, 8) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %{errno}d",  (uint8_t *)&v17,  8u);
      }

LABEL_19:
      a2 = 0LL;
      goto LABEL_20;
    }

    goto LABEL_13;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    int v9 = "Invalid input";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 2u);
    goto LABEL_19;
  }

NSData *sub_10000BF40(void *a1)
{
  id v1 = a1;
  memset(&v16, 0, sizeof(v16));
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Invalid input.";
      uint32_t v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }

uint64_t sub_10000C1E0(void *a1, uint64_t a2, size_t a3)
{
  id v5 = a1;
  id v6 = v5;
  if (a2)
  {
    if (a3 == 48)
    {
      CFDictionaryRef v10 = sub_10000BF40(v5);
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      if (a3 != 20)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 134217984;
          size_t v18 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unsupported digest size: %ld",  (uint8_t *)&v17,  0xCu);
        }

uint64_t sub_10000C3FC(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a5;
  int v17 = v13;
  int v56 = -1;
  uint64_t v55 = 0LL;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  uint64_t v58 = 0LL;
  memset(v57, 0, sizeof(v57));
  int __errnum = 0;
  __int16 v49 = 1;
  __int128 v50 = sub_10000C76C;
  p_errnum = &__errnum;
  if (!v11 || !v12 || !a4 || !v13)
  {
    id v31 = @"Invalid input(s).";
    uint64_t v32 = 921LL;
    int v33 = -3;
LABEL_15:
    id v35 = sub_1000139A0((uint64_t)"verify_disk_image_img4_ticket", v32, v33, 0LL, v31, v14, v15, v16, v48);
    int v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    uint64_t v22 = 0LL;
LABEL_24:
    uint64_t v45 = 0LL;
    goto LABEL_25;
  }

  id v18 = v11;
  int v56 = open((const char *)[v18 UTF8String], 0);
  if (v56 == -1)
  {
    __error();
    id v34 = __error();
    strerror(*v34);
    id v31 = @"Failed to open %@: %d (%s)";
    uint64_t v48 = (uint64_t)v18;
    uint64_t v32 = 929LL;
    int v33 = -2;
    goto LABEL_15;
  }

  uint64_t v22 = img4_firmware_new_from_fd_4MSM(&_img4_runtime_default, &v49, a3, &v56, 2LL);
  uint64_t v55 = v22;
  if (!v22)
  {
    uint64_t v37 = @"Failed to create img4 firmware object.";
    uint64_t v38 = 935LL;
LABEL_22:
    id v30 = sub_1000139A0((uint64_t)"verify_disk_image_img4_ticket", v38, -2, 0LL, v37, v19, v20, v21, v48);
    goto LABEL_23;
  }

  id v23 = v17;
  *((void *)&v53 + 1) = [v23 bytes];
  *(void *)&__int128 v54 = [v23 length];
  img4_firmware_attach_manifest(v22, &v53);
  uint64_t v24 = img4_nonce_domain_copy_nonce(a4, v57);
  if (!(_DWORD)v24) {
    goto LABEL_20;
  }
  uint64_t v25 = v24;
  if ((_DWORD)v24 != 45)
  {
    strerror(v24);
    id v30 = sub_1000139A0( (uint64_t)"verify_disk_image_img4_ticket",  964LL,  -2,  0LL,  @"Failed to query img4 nonce: %d (%s)",  v39,  v40,  v41,  v25);
    goto LABEL_23;
  }

  if (!qword_1000348B8 || ![(id)qword_1000348B8 length])
  {
    uint64_t v37 = @"Invalid personalization nonce.";
    uint64_t v38 = 951LL;
    goto LABEL_22;
  }

  if ((unint64_t)[(id)qword_1000348B8 length] >= 0x31)
  {
    id v26 = [(id)qword_1000348B8 length];
    id v30 = sub_1000139A0( (uint64_t)"verify_disk_image_img4_ticket",  956LL,  -2,  0LL,  @"Invalid nonce size (%ld > %ld)",  v27,  v28,  v29,  (uint64_t)v26);
LABEL_23:
    int v36 = (void *)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_24;
  }

  id v42 = [(id)qword_1000348B8 bytes];
  __memcpy_chk((char *)v57 + 2, v42, [(id)qword_1000348B8 length], 54);
  HIDWORD(v5_Block_object_dispose(va, 8) = [(id)qword_1000348B8 length];
LABEL_20:
  uint64_t v43 = img4_chip_select_personalized_ap();
  img4_firmware_execute(v22, v43, v57);
  uint64_t v44 = __errnum;
  if (__errnum)
  {
    strerror(__errnum);
    uint64_t v37 = @"img4_firmware_execute failed: %d (%s)";
    uint64_t v48 = v44;
    uint64_t v38 = 984LL;
    goto LABEL_22;
  }

  int v36 = 0LL;
  uint64_t v45 = 1LL;
LABEL_25:
  if (v56 != -1) {
    close(v56);
  }
  if (v22) {
    img4_firmware_destroy(&v55);
  }
  if (a6) {
    char v46 = v45;
  }
  else {
    char v46 = 1;
  }
  if ((v46 & 1) == 0) {
    *a6 = v36;
  }

  return v45;
}

void sub_10000C76C(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a4) {
    *a4 = a3;
  }
}

uint64_t sub_10000C778(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  memset(&v32, 0, sizeof(v32));
  if (v1)
  {
    id v3 = v1;
    int v4 = open( (const char *)objc_msgSend( v3,  "UTF8String",  *(_OWORD *)&v32.st_dev,  *(_OWORD *)&v32.st_uid,  *(_OWORD *)&v32.st_atimespec,  *(_OWORD *)&v32.st_mtimespec,  *(_OWORD *)&v32.st_ctimespec,  *(_OWORD *)&v32.st_birthtimespec),  0);
    if (v4 != -1)
    {
      int v5 = v4;
      if (fstat(v4, &v32) == -1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = *__error();
          uint64_t v19 = __error();
          uint64_t v20 = strerror(*v19);
          *(_DWORD *)buf = 138412802;
          *(void *)id v34 = v3;
          *(_WORD *)&v34[8] = 1024;
          *(_DWORD *)&v34[10] = v18;
          __int16 v35 = 2080;
          int v36 = v20;
          uint64_t v21 = "Failed to fstat %@: %d (%s)";
          uint32_t v22 = 28;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        }
      }

      else
      {
        off_t st_size = v32.st_size;
        id v7 = (UInt8 *)malloc(v32.st_size);
        if (v7)
        {
          uint64_t v8 = v7;
          ssize_t v9 = read(v5, v7, st_size);
          if (v9 == v32.st_size)
          {
            CFDataRef v10 = CFDataCreate(kCFAllocatorDefault, v8, v9);
            if (v10)
            {
              CFDataRef v11 = v10;
              uint64_t v12 = SecCertificateCreateWithPEM(kCFAllocatorDefault, v10);
              if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create certificate with PEM data.",  buf,  2u);
              }

              CFRelease(v11);
              goto LABEL_29;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v29 = "Failed to create data.";
              uint32_t v30 = 2;
              goto LABEL_27;
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = *__error();
            uint64_t v27 = __error();
            uint64_t v28 = strerror(*v27);
            *(_DWORD *)buf = 138412802;
            *(void *)id v34 = v3;
            *(_WORD *)&v34[8] = 1024;
            *(_DWORD *)&v34[10] = v26;
            __int16 v35 = 2080;
            int v36 = v28;
            uint64_t v29 = "Failed to read %@: %d (%s)";
            uint32_t v30 = 28;
LABEL_27:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
          }

          uint64_t v12 = 0LL;
LABEL_29:
          free(v8);
          goto LABEL_30;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = *__error();
          uint64_t v24 = __error();
          uint64_t v25 = strerror(*v24);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v34 = v23;
          *(_WORD *)&v34[4] = 2080;
          *(void *)&v34[6] = v25;
          uint64_t v21 = "Failed to allocate memory: %d (%s)";
          uint32_t v22 = 18;
          goto LABEL_21;
        }
      }

      uint64_t v12 = 0LL;
LABEL_30:
      close(v5);
      goto LABEL_31;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *__error();
      uint64_t v16 = __error();
      int v17 = strerror(*v16);
      *(_DWORD *)buf = 138412802;
      *(void *)id v34 = v3;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v15;
      __int16 v35 = 2080;
      int v36 = v17;
      id v13 = "Failed to open %@: %d (%s)";
      uint32_t v14 = 28;
      goto LABEL_15;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v13 = "Invalid input.";
    uint32_t v14 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
  }

  uint64_t v12 = 0LL;
LABEL_31:

  return v12;
}

SecKeyRef sub_10000CB6C(const void *a1)
{
  CFTypeRef cf = 0LL;
  SecTrustRef trust = 0LL;
  uint64_t v2 = sub_10000C778(@"/System/Library/Lockdown/iPhoneCA.pem");
  if (v2)
  {
    id v3 = (const void *)v2;
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    int v5 = Mutable;
    if (Mutable)
    {
      CFArrayAppendValue(Mutable, a1);
      CFArrayAppendValue(v5, v3);
      SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
      if (BasicX509)
      {
        SecPolicyRef v7 = BasicX509;
        if (SecTrustCreateWithCertificates(v5, BasicX509, &trust))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_17:
            CFRelease(v3);
            SecKeyRef v9 = 0LL;
            goto LABEL_18;
          }

          *(_WORD *)buf = 0;
          uint64_t v8 = "Failed to create trust with policy.";
LABEL_7:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
          goto LABEL_17;
        }

        uint64_t v12 = CFDateCreate(0LL, 418863330.0);
        if (!v12)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          *(_WORD *)buf = 0;
          uint64_t v8 = "Failed to create verification date.";
          goto LABEL_7;
        }

        id v13 = v12;
        if (SecTrustSetVerifyDate(trust, v12))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint32_t v14 = "Failed to set trust verify date.";
LABEL_31:
            uint32_t v15 = 2;
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
          }
        }

        else if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
        {
          SecKeyRef v9 = SecTrustCopyKey(trust);
          if (v9)
          {
LABEL_42:
            CFRelease(v3);
            CFRelease(v13);
            goto LABEL_18;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint32_t v14 = "Failed to copy the public key from the trust.";
            goto LABEL_31;
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = (const __CFString *)cf;
          uint32_t v14 = "Failed to evaluate trust: %@";
          uint32_t v15 = 12;
          goto LABEL_40;
        }

        SecKeyRef v9 = 0LL;
        goto LABEL_42;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFDataRef v10 = "Failed to create basic X509 policy.";
        goto LABEL_15;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFDataRef v10 = "Failed to create array.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }

    SecPolicyRef v7 = 0LL;
    goto LABEL_17;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = @"/System/Library/Lockdown/iPhoneCA.pem";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to load %@.",  buf,  0xCu);
  }

  SecKeyRef v9 = 0LL;
  SecPolicyRef v7 = 0LL;
  int v5 = 0LL;
LABEL_18:
  if (trust) {
    CFRelease(trust);
  }
  SecTrustRef trust = 0LL;
  if (v7) {
    CFRelease(v7);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

id sub_10000CEF0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      SecPolicyRef v7 = "Invalid input(s).";
      uint32_t v8 = 2;
LABEL_14:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v7,  (uint8_t *)&v16,  v8);
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  id v6 = v3;
  if (sub_100016F44((const char *)[v6 fileSystemRepresentation]))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      SecPolicyRef v7 = "Path is bad: %@";
LABEL_13:
      uint32_t v8 = 12;
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  id v9 = sub_10000D104(v6);
  CFDataRef v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      SecPolicyRef v7 = "Failed to attach %@.";
      goto LABEL_13;
    }

LABEL_15:
    id v14 = 0LL;
    id v11 = 0LL;
    goto LABEL_16;
  }

  id v11 = v10;
  uint64_t v12 = sub_10000D38C(v10, v5);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    id v14 = v13;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to mount %@ on %@.",  (uint8_t *)&v16,  0x16u);
    }

    id v11 = v11;
    sub_10000D73C((const char *)[v11 UTF8String]);
    id v14 = 0LL;
  }

  id v14 = 0LL;
LABEL_16:
  uint32_t v15 = v14;

  return v15;
}

id sub_10000D104(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFDataRef v10 = "Invalid input.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }

LABEL_19:
  return v9;
}

NSString *sub_10000D38C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v22 = 0u;
  __int128 v51 = 0u;
  memset(v52, 0, sizeof(v52));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  v21.tv_sec = 0LL;
  *(void *)&v21.tv_usec = 0LL;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "Invalid inputs.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }

LABEL_14:
    id v9 = 0LL;
    id v7 = 0LL;
    goto LABEL_15;
  }

  unsigned __int8 v6 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"/dev/%@", v3);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "Failed to create string.";
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  id v7 = v6;
  id v20 = 0LL;
  int v8 = sub_1000132D0(v3, &v20);
  id v9 = v20;
  else {
    int v10 = 1048577;
  }
  if (v8 == 6)
  {
    *(void *)&__int128 v33 = [v9 UTF8String];
    id v11 = &v33;
    *(void *)&v52[5] = 0LL;
    LOWORD(v34) = 1;
    DWORD2(v33) = v10;
    id v12 = "apfs";
  }

  else
  {
    __int16 v17 = v7;
    __int128 v22 = (unint64_t)-[NSString UTF8String](v17, "UTF8String");
    LOWORD(v23) = 511;
    DWORD1(v23) = sub_10000DB10(-[NSString UTF8String](v17, "UTF8String"));
    LODWORD(v24) = 4;
    id v11 = &v22;
    gettimeofday(&v21, (char *)&v23 + 8);
    id v12 = "hfs";
  }

  id v18 = v5;
  if (mount(v12, (const char *)[v18 UTF8String], v10, v11) == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *__error();
      *(_DWORD *)buf = 138413058;
      int v26 = v7;
      __int16 v27 = 2112;
      id v28 = v18;
      __int16 v29 = 2080;
      uint32_t v30 = v12;
      __int16 v31 = 1024;
      int v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to mount %@ on %@ (type %s): %{errno}d",  buf,  0x26u);
    }
  }

  else
  {
    if (![v18 hasPrefix:@"/Developer"] || (sub_10000AB4C(v18) & 1) != 0)
    {
      id v14 = v7;
      id v7 = v14;
      goto LABEL_16;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v26 = (NSString *)v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "System version verification failed for %@.",  buf,  0xCu);
    }

    unmount((const char *)[v18 fileSystemRepresentation], 0x80000);
    id v7 = v7;
    sub_10000D73C(-[NSString UTF8String](v7, "UTF8String"));
  }

void sub_10000D73C(const char *a1)
{
  int v2 = open(a1, 0);
  int v3 = v2;
  if ((v2 & 0x80000000) == 0)
  {
    if (ioctl(v2, 0x20006415uLL) == -1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *__error();
      id v5 = __error();
      unsigned __int8 v6 = strerror(*v5);
      int v10 = 136315650;
      id v11 = a1;
      __int16 v12 = 1024;
      int v13 = v4;
      __int16 v14 = 2080;
      uint32_t v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to eject %s : %d (%s)",  (uint8_t *)&v10,  0x1Cu);
    }

LABEL_8:
    close(v3);
    return;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *__error();
    int v8 = __error();
    id v9 = strerror(*v8);
    int v10 = 136315650;
    id v11 = a1;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 2080;
    uint32_t v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to open %s: %d (%s)",  (uint8_t *)&v10,  0x1Cu);
  }

  if (v3 != -1) {
    goto LABEL_8;
  }
}

BOOL sub_10000D8C0(CFTypeRef *a1)
{
  kern_return_t v5;
  __int16 v6;
  const char *v7;
  BOOL v8;
  io_object_t v10;
  io_registry_entry_t v11;
  CFTypeRef v12;
  const void *v13;
  io_iterator_t notification;
  uint8_t buf[4];
  int v16;
  notification = 0;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v7 = "Invalid input.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }

uint64_t sub_10000DB10(const char *a1)
{
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
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  memset(__buf, 0, sizeof(__buf));
  int v1 = open(a1, 4, 0LL);
  if (v1 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (pread(v1, __buf, 0x200uLL, 1024LL) == 512 && LOWORD(__buf[0]) == 17474 && WORD6(v8) != 11080)
  {
    if ((HIDWORD(v7) & 0xFFFFFF) == 0x636E65)
    {
      uint64_t v3 = HIBYTE(HIDWORD(v7));
    }

    else
    {
      uint64_t v3 = sub_100010604();
    }

    uint64_t v4 = &dword_100000010;
    while (*(void *)&aArabic[v4] != (int)v3)
    {
      v4 += 24LL;
      if ((_DWORD)v4 == 928)
      {
        uint64_t v3 = 0LL;
        break;
      }
    }
  }

  close(v2);
  return v3;
}

id sub_10000DC74(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v139 = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v144 = 0LL;
  unint64_t v153 = -1LL;
  uint64_t v154 = -1LL;
  uint64_t v152 = 0LL;
  memset(v151, 0, sizeof(v151));
  uint64_t v142 = 0LL;
  uint64_t v143 = 0LL;
  id v15 = v12;
  uint64_t inited = Img4DecodeInitManifest( (uint64_t)[v15 bytes],  (uint64_t)objc_msgSend(v15, "length"),  (uint64_t)v151);
  uint64_t v138 = v13;
  v140 = v14;
  if ((_DWORD)inited)
  {
    __int128 v17 = (void *)inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v146) = (_DWORD)v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to decode img4 manifest: %d",  buf,  8u);
    }

    __int128 v21 = @"Failed to decode img4 manifest: %d";
    uint64_t v129 = v17;
    uint64_t v22 = 1471LL;
LABEL_5:
    id v23 = sub_1000139A0((uint64_t)"perform_disk_image_mount_cryptex", v22, -2, 0LL, v21, v18, v19, v20, (uint64_t)v129);
LABEL_6:
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int128 v25 = 0LL;
    id v141 = 0LL;
    id v26 = 0LL;
LABEL_7:
    int v27 = -1;
    int v28 = -1;
    int v29 = -1;
LABEL_8:
    LODWORD(v30) = -1;
    goto LABEL_9;
  }

  Img4DecodeGetObjectPropertyData((uint64_t)v151, 1668315236LL, 1668834414LL, &v143, &v142);
  if (v34)
  {
    Img4DecodeGetObjectPropertyData((uint64_t)v151, 1885629799LL, 1885630061LL, &v143, &v142);
    if ((_DWORD)v35)
    {
      uint64_t v36 = v35;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v146) = v36;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  buf,  8u);
      }

      id v23 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1487LL,  -2,  0LL,  @"Failed to retrieve data from manifest: %d",  v37,  v38,  v39,  v36);
      goto LABEL_6;
    }

    uint64_t v136 = 0LL;
  }

  else
  {
    uint64_t v136 = 1LL;
  }

  __int128 v40 = NSTemporaryDirectory();
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue([v42 UUIDString]);
  id v26 = (id)objc_claimAutoreleasedReturnValue([v41 stringByAppendingFormat:@"%@"]);

  if (!v26)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    __int128 v21 = @"Failed to create string.";
    uint64_t v22 = 1496LL;
    goto LABEL_5;
  }

  uint64_t v137 = a7;
  __int128 v43 = NSTemporaryDirectory();
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v130 = (void *)objc_claimAutoreleasedReturnValue([v45 UUIDString]);
  uint64_t v46 = objc_claimAutoreleasedReturnValue([v44 stringByAppendingFormat:@"%@"]);

  id v141 = (id)v46;
  if (!v46)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    id v65 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1502LL,  -2,  0LL,  @"Failed to create string.",  v62,  v63,  v64,  (uint64_t)v130);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v65);
    __int128 v25 = 0LL;
    id v141 = 0LL;
    int v27 = -1;
    int v28 = -1;
    int v29 = -1;
    LODWORD(v30) = -1;
    a7 = v137;
    goto LABEL_9;
  }

  __int128 v47 = NSTemporaryDirectory();
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue([v49 UUIDString]);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v48 stringByAppendingFormat:@"%@"]);

  if (!v25)
  {
    a7 = v137;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    id v69 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1508LL,  -2,  0LL,  @"Failed to create string.",  v66,  v67,  v68,  (uint64_t)v131);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v69);
    __int128 v25 = 0LL;
    goto LABEL_7;
  }

  a7 = v137;
  if (([v13 writeToFile:v26 atomically:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v146 = (uint64_t)v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to write to %@.",  buf,  0xCu);
    }

    id v73 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1515LL,  -2,  0LL,  @"Failed to write to %@.",  v70,  v71,  v72,  (uint64_t)v26);
    goto LABEL_64;
  }

  if (([v15 writeToFile:v141 atomically:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v146 = (uint64_t)v141;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to write to %@.",  buf,  0xCu);
    }

    id v73 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1520LL,  -2,  0LL,  @"Failed to write to %@.",  v74,  v75,  v76,  (uint64_t)v141);
    goto LABEL_64;
  }

  if (v14 && ([v14 writeToFile:v25 atomically:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v146 = (uint64_t)v25;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to write to %@.",  buf,  0xCu);
    }

    id v73 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1526LL,  -2,  0LL,  @"Failed to write to %@.",  v77,  v78,  v79,  (uint64_t)v25);
    goto LABEL_64;
  }

  id v26 = v26;
  int v50 = open((const char *)[v26 UTF8String], 0, 420);
  if (v50 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v80 = *__error();
      uint64_t v81 = __error();
      unsigned int v82 = strerror(*v81);
      *(_DWORD *)buf = 138412802;
      uint64_t v146 = (uint64_t)v26;
      __int16 v147 = 1024;
      int v148 = v80;
      __int16 v149 = 2080;
      uint64_t v150 = v82;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %@: %d (%s)",  buf,  0x1Cu);
    }

    __error();
    int v83 = __error();
    strerror(*v83);
    id v73 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1535LL,  -2,  0LL,  @"Failed to create %@: %d (%s)",  v84,  v85,  v86,  (uint64_t)v26);
LABEL_64:
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v73);
    goto LABEL_7;
  }

  int v29 = v50;
  id v141 = v141;
  int v51 = open((const char *)[v141 UTF8String], 0, 420);
  if (v51 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v87 = *__error();
      uint64_t v88 = __error();
      uint64_t v89 = strerror(*v88);
      *(_DWORD *)buf = 138412802;
      uint64_t v146 = (uint64_t)v141;
      __int16 v147 = 1024;
      int v148 = v87;
      __int16 v149 = 2080;
      uint64_t v150 = v89;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %@: %d (%s)",  buf,  0x1Cu);
    }

    __error();
    id v90 = __error();
    strerror(*v90);
    id v94 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1541LL,  -2,  0LL,  @"Failed to create %@: %d (%s)",  v91,  v92,  v93,  (uint64_t)v141);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v94);
    int v27 = -1;
    int v28 = -1;
    goto LABEL_8;
  }

  int v28 = v51;
  if (v140)
  {
    id v52 = v25;
    int v27 = open((const char *)[v52 UTF8String], 0, 420);
    uint64_t v53 = v136;
    if (v27 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v54 = *__error();
        uint64_t v55 = __error();
        int v56 = strerror(*v55);
        *(_DWORD *)buf = 138412802;
        uint64_t v146 = (uint64_t)v52;
        __int16 v147 = 1024;
        int v148 = v54;
        __int16 v149 = 2080;
        uint64_t v150 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %@: %d (%s)",  buf,  0x1Cu);
      }

      __error();
      __int128 v57 = __error();
      strerror(*v57);
      id v61 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1548LL,  -2,  0LL,  @"Failed to create %@: %d (%s)",  v58,  v59,  v60,  (uint64_t)v52);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v61);
      int v27 = -1;
      __int128 v25 = v52;
      goto LABEL_8;
    }
  }

  else
  {
    int v27 = -1;
    uint64_t v53 = v136;
  }

  id v134 = v139;
  uint64_t v132 = 420LL;
  uint64_t v95 = open((const char *)[v134 UTF8String], 0);
  if ((_DWORD)v95 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v112 = *__error();
      uint64_t v113 = __error();
      v114 = strerror(*v113);
      *(_DWORD *)buf = 138412802;
      uint64_t v146 = (uint64_t)v134;
      __int16 v147 = 1024;
      int v148 = v112;
      __int16 v149 = 2080;
      uint64_t v150 = v114;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create %@: %d (%s)",  buf,  0x1Cu);
    }

    __error();
    v115 = __error();
    strerror(*v115);
    id v119 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1555LL,  -2,  0LL,  @"Failed to create %@: %d (%s)",  v116,  v117,  v118,  (uint64_t)v134);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v119);
    goto LABEL_8;
  }

  uint64_t v30 = v95;
  unint64_t v153 = __PAIR64__(v29, v95);
  HIDWORD(v154) = v28;
  if (v27 != -1) {
    LODWORD(v154) = v27;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001EA10(v30, v96, v97, v98, v99, v100, v101, v102);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E9A0();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E930();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E8C0();
  }
  int v103 = cryptex_install_4MSM(&v153, v53, &v144);
  if (v103)
  {
    int v104 = v103;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v105 = strerror(v104);
      *(_DWORD *)buf = 138412802;
      uint64_t v146 = (uint64_t)v134;
      __int16 v147 = 1024;
      int v148 = v104;
      __int16 v149 = 2080;
      uint64_t v150 = v105;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to install cryptex (%@): %d (%s)",  buf,  0x1Cu);
    }

    strerror(v104);
    uint64_t v109 = @"Failed to install cryptex (%@): %d (%s)";
    uint64_t v132 = (uint64_t)v134;
    uint64_t v110 = 1575LL;
LABEL_84:
    id v111 = sub_1000139A0((uint64_t)"perform_disk_image_mount_cryptex", v110, -2, 0LL, v109, v106, v107, v108, v132);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v111);
    goto LABEL_9;
  }

  uint64_t string = cryptex_msm_get_string(v144, 0LL);
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve cryptex name.",  buf,  2u);
    }

    uint64_t v109 = @"Failed to retrieve cryptex name.";
    uint64_t v110 = 1581LL;
    goto LABEL_84;
  }

  uint64_t v120 = cryptex_msm_get_string(v144, 2LL);
  if (v120)
  {
    uint64_t v133 = v120;
    uint64_t v121 = cryptex_msm_get_string(v144, 4LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v146 = v121;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "cryptex mount point = %s",  buf,  0xCu);
    }

    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v121));
    }
    uint64_t v122 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v133));
    __int128 v24 = 0LL;
    if (v122)
    {
      __int128 v31 = (void *)v122;
LABEL_12:
      close(v29);
      id v26 = v26;
      unlink((const char *)[v26 UTF8String]);
      __int128 v32 = v31;
      goto LABEL_13;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve cryptex devpath.",  buf,  2u);
    }

    id v126 = sub_1000139A0( (uint64_t)"perform_disk_image_mount_cryptex",  1587LL,  -2,  0LL,  @"Failed to retrieve cryptex devpath.",  v123,  v124,  v125,  420LL);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v126);
  }

  int v127 = cryptex_uninstall_4MSM(string, v136);
  if (v127)
  {
    int v128 = v127;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10001E814(string, v128);
    }
  }

id sub_10000EAB0(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = v17;
  memset(&v155, 0, sizeof(v155));
  uint64_t v160 = 0LL;
  memset(v159, 0, sizeof(v159));
  uint64_t v153 = 0LL;
  uint64_t v154 = 0LL;
  uint64_t v151 = 0LL;
  size_t v152 = 0LL;
  size_t v150 = 0LL;
  v140 = v16;
  if (v14 && v15 && a6 && v17 && v13)
  {
    if (!v16 && [v14 isEqualToString:@"Cryptex"])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Missing trust cache.",  buf,  2u);
      }

      uint64_t v22 = @"Missing trust cache.";
      uint64_t v23 = 1682LL;
      int v24 = -3;
      goto LABEL_44;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v158 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Preparing to mount disk image at %@.",  buf,  0xCu);
    }

    id v33 = v13;
    if (lstat((const char *)[v33 UTF8String], &v155))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = *__error();
        uint64_t v35 = __error();
        uint64_t v36 = strerror(*v35);
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v158 = v33;
        *(_WORD *)&v158[8] = 1024;
        *(_DWORD *)&v158[10] = v34;
        *(_WORD *)&v158[14] = 2080;
        *(void *)&v158[16] = v36;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to lstat %@: %d (%s)",  buf,  0x1Cu);
      }

      __error();
      uint64_t v37 = __error();
      strerror(*v37);
      uint64_t v22 = @"Failed to lstat %@: %d (%s)";
      uint64_t v131 = (uint64_t)v33;
      uint64_t v23 = 1690LL;
LABEL_43:
      int v24 = -2;
LABEL_44:
      id v45 = sub_1000139A0((uint64_t)"perform_disk_image_mount", v23, v24, 0LL, v22, v19, v20, v21, v131);
      id obj = 0LL;
      id v142 = (id)objc_claimAutoreleasedReturnValue(v45);
      __int128 v32 = 0LL;
      __int128 v31 = 0LL;
      uint64_t v30 = 0LL;
      id v143 = 0LL;
      id v29 = 0LL;
      goto LABEL_45;
    }

    if ((v155.st_mode & 0xF000) != 0x8000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v158 = v33;
        *(_WORD *)&v158[8] = 1024;
        *(_DWORD *)&v158[10] = v155.st_mode & 0xF000;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ is not a regular file (mode: 0x%04x).",  buf,  0x12u);
      }

      uint64_t v22 = @"%@ is not a regular file (mode: 0x%04x).";
      uint64_t v131 = (uint64_t)v33;
      uint64_t v23 = 1695LL;
      goto LABEL_43;
    }

    if (([v14 isEqualToString:@"Personalized"] & 1) == 0
      && ([v14 isEqualToString:@"Cryptex"] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v158 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unsupported disk image type: %@",  buf,  0xCu);
      }

      uint64_t v22 = @"Unsupported disk image type: %@";
      uint64_t v131 = (uint64_t)v14;
      uint64_t v23 = 1701LL;
      goto LABEL_43;
    }

    id v38 = v15;
    uint64_t inited = Img4DecodeInitManifest( (uint64_t)[v38 bytes],  (uint64_t)objc_msgSend(v38, "length"),  (uint64_t)v159);
    if ((_DWORD)inited)
    {
      uint64_t v40 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v158 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to decode img4 manifest: %d",  buf,  8u);
      }

      uint64_t v22 = @"Failed to decode img4 manifest: %d";
      uint64_t v131 = v40;
      uint64_t v23 = 1713LL;
      goto LABEL_43;
    }

    uint64_t v144 = v38;
    Img4DecodeGetObjectPropertyData((uint64_t)v159, 1885629799LL, 1145525076LL, &v153, &v152);
    if ((_DWORD)v41)
    {
      uint64_t v42 = v41;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v158 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  buf,  8u);
      }

      uint64_t v22 = @"Failed to retrieve data from manifest: %d";
      uint64_t v131 = v42;
      uint64_t v23 = 1719LL;
      goto LABEL_43;
    }

    Img4DecodeGetObjectPropertyData((uint64_t)v159, 1885629799LL, 1885630061LL, &v151, &v150);
    if ((_DWORD)v43)
    {
      uint64_t v44 = v43;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v158 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data from manifest: %d",  buf,  8u);
      }

      uint64_t v22 = @"Failed to retrieve data from manifest: %d";
      uint64_t v131 = v44;
      uint64_t v23 = 1725LL;
      goto LABEL_43;
    }

    int v56 = (char *)calloc(1uLL, v150 + 1);
    if (!v56)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v74 = *__error();
        uint64_t v75 = __error();
        uint64_t v76 = strerror(*v75);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v158 = v74;
        *(_WORD *)&v158[4] = 2080;
        *(void *)&v158[6] = v76;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %d (%s)",  buf,  0x12u);
      }

      uint64_t v77 = *__error();
      uint64_t v78 = __error();
      strerror(*v78);
      uint64_t v22 = @"Failed to allocate memory: %d (%s)";
      uint64_t v131 = v77;
      uint64_t v23 = 1731LL;
      goto LABEL_43;
    }

    __int128 v32 = v56;
    id v134 = a7;
    strncpy(v56, v151, v150);
    __int128 v57 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v32);
    if (!v57)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
      }

      id v82 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1739LL,  -2,  0LL,  @"Failed to create string.",  v79,  v80,  v81,  v131);
      id obj = 0LL;
      id v142 = (id)objc_claimAutoreleasedReturnValue(v82);
      __int128 v31 = 0LL;
      uint64_t v30 = 0LL;
      id v143 = 0LL;
      id v29 = 0LL;
      goto LABEL_45;
    }

    __int128 v31 = v57;
    id v139 = v32;
    else {
      uint64_t v58 = &_img4_nonce_domain_pdi;
    }
    if ((sub_10000C1E0(v33, (uint64_t)&v154, v152) & 1) != 0)
    {
      uint64_t v59 = objc_alloc(&OBJC_CLASS___NSData);
      uint64_t v135 = -[NSData initWithBytes:length:](v59, "initWithBytes:length:", v154, v152);
      if (v135)
      {
        id v149 = 0LL;
        uint64_t v132 = v31;
        char v60 = sub_10000C3FC(v33, v31, 1885629799LL, (uint64_t)v58, v144, &v149);
        id v61 = v149;
        id v62 = v61;
        if ((v60 & 1) == 0)
        {
          id v90 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to validate server ticket with this device/image.");
          if (v62)
          {
            uint64_t v91 = v62;
            uint64_t v131 = (uint64_t)v90;
            uint64_t v92 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@ (%@)"));

            id v90 = (NSString *)v92;
          }

          else
          {
            uint64_t v91 = 0LL;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v158 = v90;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          id v101 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1760LL,  -2,  v91,  @"Failed to validate server ticket with this device/image.",  v98,  v99,  v100,  v131);
          uint64_t v102 = objc_claimAutoreleasedReturnValue(v101);

          id obj = 0LL;
          id v142 = (id)v102;
          id v143 = 0LL;
          id v29 = 0LL;
          __int128 v31 = v132;
          uint64_t v30 = v135;
          goto LABEL_45;
        }

        id v142 = v61;
        uint64_t v63 = sub_100016AD4(v14, 1);
        __int128 v145 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(v63);
        id v64 = [obj countByEnumeratingWithState:&v145 objects:v156 count:16];
        if (v64)
        {
          id v65 = v64;
          uint64_t v133 = *(void *)v146;
          while (2)
          {
            for (i = 0LL; i != v65; i = (char *)i + 1)
            {
              if (*(void *)v146 != v133) {
                objc_enumerationMutation(obj);
              }
              uint64_t v67 = *(void **)(*((void *)&v145 + 1) + 8LL * (void)i);
              uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"ImageSignature"]);
              unsigned int v136 = [v68 isEqual:v135];

              if (v136)
              {
                *a6 = (id)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"MountPath"]);

                __int128 v32 = v139;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)uint64_t v158 = v14;
                  *(_WORD *)&v158[8] = 2080;
                  *(void *)&v158[10] = v139;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Matching image of type %@/%s found.",  buf,  0x16u);
                }

                id v96 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1776LL,  -2,  0LL,  @"Matching image of type %@/%s found.",  v93,  v94,  v95,  (uint64_t)v14);
                uint64_t v97 = objc_claimAutoreleasedReturnValue(v96);

                id v29 = 0LL;
                id v142 = (id)v97;
                id v143 = 0LL;
                a7 = v134;
                goto LABEL_116;
              }
            }

            id v65 = [obj countByEnumeratingWithState:&v145 objects:v156 count:16];
            if (v65) {
              continue;
            }
            break;
          }
        }

        uint64_t v137 = v18;
        if ((sub_10000B748(v18) & 1) != 0)
        {
          id v69 = v33;
          if (sub_100016F44((const char *)[v69 fileSystemRepresentation]))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)uint64_t v158 = v69;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disk image path is bad: %@",  buf,  0xCu);
            }

            id v73 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1787LL,  -2,  0LL,  @"Disk image path is bad: %@",  v70,  v71,  v72,  (uint64_t)v69);
LABEL_113:
            uint64_t v114 = objc_claimAutoreleasedReturnValue(v73);

            id v29 = 0LL;
            id v142 = (id)v114;
            id v143 = 0LL;
            goto LABEL_114;
          }

          if (v140 && (sub_10000FCFC(v140, v144, v18) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to load trust cache.",  buf,  2u);
            }

            id v73 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1796LL,  -2,  0LL,  @"Failed to load trust cache.",  v111,  v112,  v113,  v131);
            goto LABEL_113;
          }

          id v108 = sub_10000CEF0(v69, v18);
          uint64_t v109 = objc_claimAutoreleasedReturnValue(v108);
          if (v109)
          {
            uint64_t v110 = (void *)v109;
            if (v140 || (sub_10000FCFC(0LL, 0LL, v18) & 1) != 0)
            {
              id v29 = v110;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)uint64_t v158 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully mounted disk image at %@.",  buf,  0xCu);
                id v143 = v29;
                goto LABEL_115;
              }

              id v143 = v29;
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)uint64_t v158 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to load trust caches at %@.",  buf,  0xCu);
              }

              id v121 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1815LL,  -2,  0LL,  @"Failed to load trust caches at %@.",  v118,  v119,  v120,  (uint64_t)v18);
              uint64_t v122 = objc_claimAutoreleasedReturnValue(v121);

              id v123 = v137;
              if (unmount((const char *)[v123 fileSystemRepresentation], 0x80000)
                && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v124 = *__error();
                uint64_t v125 = __error();
                id v126 = strerror(*v125);
                *(_DWORD *)buf = 138412802;
                *(void *)uint64_t v158 = v123;
                *(_WORD *)&v158[8] = 1024;
                *(_DWORD *)&v158[10] = v124;
                *(_WORD *)&v158[14] = 2080;
                *(void *)&v158[16] = v126;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to force unmount %@: %d (%s)",  buf,  0x1Cu);
              }

              if (([v123 hasPrefix:@"/System/Volumes/FieldService"] & 1) == 0
                && ([v123 hasPrefix:@"/System/Volumes/FieldServiceDiagnostic"] & 1) == 0
                && ([v123 hasPrefix:@"/System/Volumes/FieldServiceRepair"] & 1) == 0
                && ([v123 hasPrefix:@"/Developer"] & 1) == 0
                && ([v123 hasPrefix:@"/System/Developer"] & 1) == 0)
              {
                id v127 = v123;
                if (rmdir((const char *)[v127 fileSystemRepresentation]) == -1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  int v128 = *__error();
                  uint64_t v129 = __error();
                  uint64_t v130 = strerror(*v129);
                  *(_DWORD *)buf = 138412802;
                  *(void *)uint64_t v158 = v127;
                  *(_WORD *)&v158[8] = 1024;
                  *(_DWORD *)&v158[10] = v128;
                  *(_WORD *)&v158[14] = 2080;
                  *(void *)&v158[16] = v130;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to remove %@: %d (%s)",  buf,  0x1Cu);
                }
              }

              id v143 = v110;
              sub_10000D73C((const char *)[v143 fileSystemRepresentation]);
              id v29 = 0LL;
              id v142 = (id)v122;
            }

LABEL_114:
            uint64_t v18 = v137;
LABEL_115:
            a7 = v134;
            __int128 v32 = v139;
LABEL_116:
            __int128 v31 = v132;
            uint64_t v30 = v135;
            goto LABEL_45;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)uint64_t v158 = v69;
            *(_WORD *)&v158[8] = 2112;
            *(void *)&v158[10] = v18;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to mount %@ at %@.",  buf,  0x16u);
          }

          id v106 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1806LL,  -2,  0LL,  @"Failed to mount %@ at %@.",  v115,  v116,  v117,  (uint64_t)v69);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v158 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to verify the disk image mount path %@.",  buf,  0xCu);
          }

          id v106 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1782LL,  -2,  0LL,  @"Failed to verify the disk image mount path %@.",  v103,  v104,  v105,  (uint64_t)v18);
        }

        uint64_t v107 = objc_claimAutoreleasedReturnValue(v106);

        id v29 = 0LL;
        id v142 = (id)v107;
        id v143 = 0LL;
        goto LABEL_115;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
      }

      id v86 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1754LL,  -2,  0LL,  @"Failed to create data.",  v87,  v88,  v89,  v131);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v158 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to digest %@.",  buf,  0xCu);
      }

      id v86 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1748LL,  -2,  0LL,  @"Failed to digest %@.",  v83,  v84,  v85,  (uint64_t)v33);
    }

    id obj = 0LL;
    id v142 = (id)objc_claimAutoreleasedReturnValue(v86);
    uint64_t v30 = 0LL;
    id v143 = 0LL;
    id v29 = 0LL;
    goto LABEL_45;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
  }

  id v28 = sub_1000139A0( (uint64_t)"perform_disk_image_mount",  1677LL,  -3,  0LL,  @"Invalid input(s).",  v25,  v26,  v27,  v131);
  id v142 = (id)objc_claimAutoreleasedReturnValue(v28);
  id v143 = 0LL;
  id v29 = 0LL;
  id obj = 0LL;
  uint64_t v30 = 0LL;
  __int128 v31 = 0LL;
  __int128 v32 = 0LL;
  if (!v13)
  {
    if (!a7) {
      goto LABEL_51;
    }
    goto LABEL_49;
  }

LABEL_45:
  uint64_t v46 = v30;
  __int128 v47 = v31;
  id v48 = v13;
  if (unlink((const char *)[v48 UTF8String])
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v138 = v32;
    id v49 = v14;
    id v50 = v15;
    int v51 = *__error();
    id v52 = __error();
    uint64_t v53 = strerror(*v52);
    *(_DWORD *)buf = 138412802;
    *(void *)uint64_t v158 = v48;
    *(_WORD *)&v158[8] = 1024;
    *(_DWORD *)&v158[10] = v51;
    id v15 = v50;
    id v14 = v49;
    __int128 v32 = v138;
    *(_WORD *)&v158[14] = 2080;
    *(void *)&v158[16] = v53;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to unlink %@: %d (%s)",  buf,  0x1Cu);
  }

  __int128 v31 = v47;
  uint64_t v30 = v46;
  if (a7)
  {
LABEL_49:
    if (!v143) {
      *a7 = v142;
    }
  }

LABEL_51:
  if (v32) {
    free(v32);
  }
  if (v154) {
    free(v154);
  }
  id v54 = v29;

  return v54;
}

uint64_t sub_10000FCFC(void *a1, void *a2, void *a3)
{
  kern_return_t v13;
  __int16 v14;
  const char *v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  NSData *v22;
  NSData *v23;
  id v25;
  char *v26;
  void *v27;
  char *v28;
  BOOL v29;
  id v30;
  int v31;
  int v32;
  const char *v33;
  uint32_t v34;
  int v35;
  int *v36;
  char *v37;
  io_connect_t v38;
  kern_return_t v39;
  kern_return_t v40;
  int v41;
  int *v42;
  char *v43;
  int v44;
  int *v45;
  char *v46;
  int v47;
  int *v48;
  char *v49;
  kern_return_t v50;
  kern_return_t v51;
  id v52;
  size_t inputStructCnt;
  id v54;
  BOOL v55;
  io_connect_t connect;
  stat v57;
  uint8_t buf[4];
  _BYTE v59[14];
  __int16 v60;
  char *v61;
  char __str[1024];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  bzero(__str, 0x400uLL);
  memset(&v57, 0, sizeof(v57));
  connect = 0;
  uint64_t v55 = 0;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input.",  buf,  2u);
    }

    id v17 = 0LL;
    io_object_t v12 = 0;
    uint64_t v8 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_14;
  }

  if (v5)
  {
    uint64_t v8 = 0LL;
    int v9 = -1;
    goto LABEL_4;
  }

  snprintf(__str, 0x400uLL, "%s/.TrustCache", (const char *)[v7 UTF8String]);
  uint64_t v20 = open(__str, 0);
  if (v20 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *__error();
      uint64_t v36 = __error();
      uint64_t v37 = strerror(*v36);
      *(_DWORD *)buf = 136315650;
      *(void *)uint64_t v59 = __str;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v35;
      char v60 = 2080;
      id v61 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to open %s: %d (%s)",  buf,  0x1Cu);
    }

    id v17 = 0LL;
    io_object_t v12 = 0;
    uint64_t v8 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    id v5 = 0LL;
LABEL_14:
    int v9 = -1;
    goto LABEL_24;
  }

  int v9 = v20;
  if (fstat(v20, &v57) == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = *__error();
      uint64_t v42 = __error();
      uint64_t v43 = strerror(*v42);
      *(_DWORD *)buf = 136315650;
      *(void *)uint64_t v59 = __str;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v41;
      char v60 = 2080;
      id v61 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to fstat %s: %d (%s)",  buf,  0x1Cu);
    }

    id v17 = 0LL;
    io_object_t v12 = 0;
    uint64_t v8 = 0LL;
    goto LABEL_63;
  }

  uint64_t v21 = mmap(0LL, v57.st_size, 1, 1026, v9, 0LL);
  if (v21 != (void *)-1LL)
  {
    uint64_t v8 = (uint64_t)v21;
    uint64_t v22 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v23 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v22,  "initWithBytesNoCopy:length:freeWhenDone:",  v8,  v57.st_size,  0LL);
    if (v23)
    {
      id v5 = v23;
LABEL_4:
      __int128 v10 = IOServiceMatching("AppleMobileFileIntegrity");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
      if (!MatchingService)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IOServiceGetMatchingService failed.",  buf,  2u);
        }

        id v17 = 0LL;
        io_object_t v12 = 0;
        goto LABEL_23;
      }

      io_object_t v12 = MatchingService;
      id v13 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      if (v13)
      {
        id v14 = v13;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_10:
          id v17 = 0LL;
LABEL_23:
          uint64_t v18 = 0LL;
          uint64_t v19 = 0LL;
          goto LABEL_24;
        }

        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v59 = v14 & 0x3FFF;
        id v15 = "IOServiceOpen failed: 0x%04x";
        goto LABEL_8;
      }

      if (v6 && [v6 length])
      {
        uint64_t v25 = [v6 length];
        uint64_t v26 = (char *)-[NSData length](v5, "length") + (void)v25 + 16;
        uint64_t v27 = malloc((size_t)v26);
        if (!v27)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          __int128 v47 = *__error();
          id v48 = __error();
          id v49 = strerror(*v48);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v59 = v47;
          *(_WORD *)&v59[4] = 2080;
          *(void *)&v59[6] = v49;
          id v15 = "Failed to allocate memory: %d (%s)";
          id v16 = 18;
          goto LABEL_9;
        }

        id v17 = v27;
        inputStructCnt = (size_t)v26;
        *uint64_t v27 = [v6 length];
        id v52 = v6;
        memcpy(v17 + 2, [v52 bytes], (size_t)objc_msgSend(v52, "length"));
        v17[1] = -[NSData length](v5, "length");
        id v28 = (char *)v17 + *v17 + 16;
        id v5 = v5;
        memcpy(v28, -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
        id v54 = 0LL;
        id v29 = sub_100013854(&v55, &v54);
        uint64_t v19 = v54;
        if (!v29)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)uint64_t v59 = v19;
            id v33 = "Failed to check support for Restricted Execution Mode: %{public}@";
            int v34 = 12;
            goto LABEL_73;
          }

LABEL_74:
          uint64_t v18 = 0LL;
          goto LABEL_24;
        }

        if (v55)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sealing trust cache will invalidate the system's attestation.",  buf,  2u);
          }

          if (!sub_100013B14())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              id v33 = "Bailing in order to protect attestation integrity.";
              int v34 = 2;
              goto LABEL_73;
            }

            goto LABEL_74;
          }

          uint64_t v30 = v52;
          __int128 v31 = aks_measure_and_seal_cryptex_manifest([v30 bytes], objc_msgSend(v30, "length"));
          if (v31)
          {
            __int128 v32 = v31;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)uint64_t v59 = v32;
              *(_WORD *)&v59[4] = 1024;
              *(_DWORD *)&v59[6] = v32;
              id v33 = "Failed to measure and seal im4m: %d (0x%08x)";
              int v34 = 14;
LABEL_73:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
              goto LABEL_74;
            }

            goto LABEL_74;
          }
        }

        id v50 = IOConnectCallMethod(connect, 7u, 0LL, 0, v17, inputStructCnt, 0LL, 0LL, 0LL, 0LL);
        if (v50)
        {
          int v51 = v50;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)uint64_t v59 = v51;
            id v33 = "IOConnectCallMethod failed: 0x%08x";
            int v34 = 8;
            goto LABEL_73;
          }

          goto LABEL_74;
        }
      }

      else
      {
        id v38 = connect;
        id v5 = v5;
        uint64_t v39 = IOConnectCallMethod( v38,  2u,  0LL,  0,  -[NSData bytes](v5, "bytes"),  -[NSData length](v5, "length"),  0LL,  0LL,  0LL,  0LL);
        if (v39)
        {
          uint64_t v40 = v39;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v59 = v40;
          id v15 = "IOConnectCallMethod failed: 0x%08x";
LABEL_8:
          id v16 = 8;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
          goto LABEL_10;
        }

        id v17 = 0LL;
        uint64_t v19 = 0LL;
      }

      uint64_t v18 = 1LL;
      goto LABEL_24;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
    }

    id v17 = 0LL;
    io_object_t v12 = 0;
LABEL_63:
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    id v5 = 0LL;
    goto LABEL_24;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = *__error();
    id v45 = __error();
    uint64_t v46 = strerror(*v45);
    *(_DWORD *)buf = 136315650;
    *(void *)uint64_t v59 = __str;
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = v44;
    char v60 = 2080;
    id v61 = v46;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to mmap %s: %d (%s)",  buf,  0x1Cu);
  }

  id v17 = 0LL;
  io_object_t v12 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  id v5 = 0LL;
  uint64_t v8 = -1LL;
LABEL_24:
  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }

  if (v12) {
    IOObjectRelease(v12);
  }
  if (v8) {
    munmap((void *)v8, v57.st_size);
  }
  if (v9 != -1) {
    close(v9);
  }
  if (v17) {
    free(v17);
  }

  return v18;
}

uint64_t sub_100010604()
{
  size_t v2 = 4LL;
  unsigned int v1 = 0;
  if (getvfsbyname("hfs", &v3) < 0) {
    return 0xFFFFFFFFLL;
  }
  v4[0] = 3;
  v4[1] = v3.vfc_typenum;
  v4[2] = 1;
  if (sysctl(v4, 3u, &v1, &v2, 0LL, 0LL) < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

passwd *sub_1000106AC()
{
  result = getpwuid(0);
  if (result)
  {
    __strcpy_chk(__str, result->pw_dir, 1024LL);
    __strcat_chk(__str, "/.CFUserTextEncoding", 1024LL);
    int v1 = open(__str, 0, 0LL);
    int v2 = v1;
    if (v1 < 0)
    {
      uint64_t v4 = 0LL;
      result = 0LL;
      if (v2 == -1) {
        return result;
      }
    }

    else
    {
      ssize_t v3 = read(v1, __str, 0x400uLL);
      __str[v3 & ~(v3 >> 63)] = 0;
      uint64_t v4 = strtol(__str, 0LL, 0);
    }

    close(v2);
    return (passwd *)v4;
  }

  return result;
}

id sub_1000107A4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1000108E0;
  int v24 = sub_1000108F0;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1000108E0;
  uint64_t v18 = sub_1000108F0;
  id v19 = 0LL;
  id v4 = sub_1000108F8();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010938;
  block[3] = &unk_10002CE90;
  id v6 = v3;
  id v11 = v6;
  io_object_t v12 = &v20;
  id v13 = &v14;
  dispatch_sync(v5, block);

  id v7 = (void *)v15[5];
  if (a2 && !v7)
  {
    *a2 = (id) v21[5];
    id v7 = (void *)v15[5];
  }

  id v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

uint64_t sub_1000108E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000108F0(uint64_t a1)
{
}

id sub_1000108F8()
{
  if (qword_100034888 != -1) {
    dispatch_once(&qword_100034888, &stru_10002CF00);
  }
  return (id)qword_100034890;
}

void sub_100010938(uint64_t a1)
{
  uint64_t v38 = 0LL;
  memset(v37, 0, sizeof(v37));
  id v2 = sub_1000131C8(*(void **)(a1 + 32));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  id v4 = &_img4_nonce_domain_pdi;
  id v5 = "PDI";
  if (v3)
  {
    id v6 = (void *)v3;
    unsigned int v7 = [*(id *)(a1 + 32) isEqual:@"DeveloperDiskImage"];

    if (v7)
    {
      id v5 = "DDI";
      id v4 = &_img4_nonce_domain_ddi;
    }
  }

  int v8 = img4_nonce_domain_copy_nonce(v4, v37);
  if (!v8)
  {
    id v15 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v14 = -[NSData initWithBytes:length:](v15, "initWithBytes:length:", (char *)v37 + 2, HIDWORD(v38));
    if (v14) {
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
    }

    uint64_t v26 = @"Failed to create data.";
    uint64_t v27 = 2206LL;
    goto LABEL_19;
  }

  int v9 = v8;
  if (v8 != 45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v32 = v5;
      __int16 v33 = 1024;
      int v34 = v9;
      __int16 v35 = 2080;
      uint64_t v36 = strerror(v9);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query img4 %s nonce: %d (%s)",  buf,  0x1Cu);
    }

    strerror(v9);
    id v22 = sub_1000139A0( (uint64_t)"copy_personalization_nonce_for_image_type_block_invoke",  2198LL,  -2,  0LL,  @"Failed to query img4 %s nonce: %d (%s)",  v19,  v20,  v21,  (uint64_t)v5);
    goto LABEL_20;
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
  id v13 = (void *)qword_1000348B8;
  qword_1000348B8 = v12;

  if (!qword_1000348B8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create nonce.",  buf,  2u);
    }

    uint64_t v26 = @"Failed to create nonce.";
    uint64_t v27 = 2191LL;
LABEL_19:
    id v22 = sub_1000139A0( (uint64_t)"copy_personalization_nonce_for_image_type_block_invoke",  v27,  -2,  0LL,  v26,  v23,  v24,  v25,  v30);
LABEL_20:
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v22);
    uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v18 = *(NSData **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
    goto LABEL_21;
  }

  uint64_t v14 = (NSData *)(id)qword_1000348B8;
LABEL_9:
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;
  uint64_t v18 = v14;

LABEL_21:
}

BOOL sub_100010C18(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1000108E0;
  uint64_t v18 = sub_1000108F0;
  id v19 = 0LL;
  id v4 = sub_1000108F8();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010D50;
  block[3] = &unk_10002CE90;
  id v6 = v3;
  id v11 = v6;
  uint64_t v12 = &v14;
  id v13 = &v20;
  dispatch_sync(v5, block);

  int v7 = *((unsigned __int8 *)v21 + 24);
  if (a2 && !*((_BYTE *)v21 + 24))
  {
    *a2 = (id) v15[5];
    int v7 = *((unsigned __int8 *)v21 + 24);
  }

  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void sub_100010D50(uint64_t a1)
{
  id v2 = sub_1000131C8(*(void **)(a1 + 32));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  id v4 = &_img4_nonce_domain_pdi;
  id v5 = "PDI";
  if (v3)
  {
    id v6 = (void *)v3;
    unsigned int v7 = [*(id *)(a1 + 32) isEqual:@"DeveloperDiskImage"];

    if (v7)
    {
      id v5 = "DDI";
      id v4 = &_img4_nonce_domain_ddi;
    }
  }

  int v8 = img4_nonce_domain_roll_nonce(v4);
  if (!v8) {
    goto LABEL_7;
  }
  int v9 = v8;
  if (v8 == 45)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);
    id v13 = (void *)qword_1000348B8;
    qword_1000348B8 = v12;

    if (qword_1000348B8)
    {
LABEL_7:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      return;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create nonce.",  buf,  2u);
    }

    id v17 = sub_1000139A0( (uint64_t)"roll_personalization_nonce_for_image_type_block_invoke",  2244LL,  -2,  0LL,  @"Failed to create nonce.",  v18,  v19,  v20,  v24);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v5;
      __int16 v27 = 1024;
      int v28 = v9;
      __int16 v29 = 2080;
      uint64_t v30 = strerror(v9);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to roll img4 %s nonce: %d (%s)",  buf,  0x1Cu);
    }

    strerror(v9);
    id v17 = sub_1000139A0( (uint64_t)"roll_personalization_nonce_for_image_type_block_invoke",  2249LL,  -2,  0LL,  @"Failed to roll img4 %s nonce: %d (%s)",  v14,  v15,  v16,  (uint64_t)v5);
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue(v17);
  uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
  char v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;
}

id sub_100010F90(void *a1)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1000108E0;
  uint64_t v18 = sub_1000108F0;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_1000108E0;
  uint64_t v12 = sub_1000108F0;
  id v13 = 0LL;
  id v2 = sub_1000108F8();
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000110A0;
  v7[3] = &unk_10002CEB8;
  void v7[4] = &v14;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  id v4 = (void *)v9[5];
  if (a1 && !v4)
  {
    *a1 = (id) v15[5];
    id v4 = (void *)v9[5];
  }

  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_1000110A0(uint64_t a1)
{
  uint64_t v30 = 0LL;
  memset(v29, 0, sizeof(v29));
  uint64_t v2 = img4_nonce_domain_copy_nonce(&_img4_nonce_domain_cryptex, v29);
  if (!(_DWORD)v2)
  {
    int v9 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v8 = -[NSData initWithBytes:length:](v9, "initWithBytes:length:", (char *)v29 + 2, HIDWORD(v30));
    if (v8) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create data.",  buf,  2u);
    }

    uint64_t v20 = @"Failed to create data.";
    uint64_t v21 = 2298LL;
    goto LABEL_16;
  }

  uint64_t v3 = v2;
  if ((_DWORD)v2 != 45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v26 = v3;
      __int16 v27 = 2080;
      int v28 = strerror(v3);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query img4 nonce: %d (%s)",  buf,  0x12u);
    }

    strerror(v3);
    id v16 = sub_1000139A0( (uint64_t)"copy_cryptex_nonce_block_invoke",  2290LL,  -2,  0LL,  @"Failed to query img4 nonce: %d (%s)",  v13,  v14,  v15,  v3);
    goto LABEL_17;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
  unsigned int v7 = (void *)qword_1000348B8;
  qword_1000348B8 = v6;

  if (!qword_1000348B8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create nonce.",  buf,  2u);
    }

    uint64_t v20 = @"Failed to create nonce.";
    uint64_t v21 = 2283LL;
LABEL_16:
    id v16 = sub_1000139A0((uint64_t)"copy_cryptex_nonce_block_invoke", v21, -2, 0LL, v20, v17, v18, v19, v24);
LABEL_17:
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v16);
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v12 = *(NSData **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
    goto LABEL_18;
  }

  uint64_t v8 = (NSData *)(id)qword_1000348B8;
LABEL_6:
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  uint64_t v12 = v8;

LABEL_18:
}

BOOL sub_100011314(void *a1)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_1000108E0;
  uint64_t v12 = sub_1000108F0;
  id v13 = 0LL;
  id v2 = sub_1000108F8();
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100011420;
  v7[3] = &unk_10002CEB8;
  void v7[4] = &v8;
  v7[5] = &v14;
  dispatch_sync(v3, v7);

  int v4 = *((unsigned __int8 *)v15 + 24);
  if (a1 && !*((_BYTE *)v15 + 24))
  {
    *a1 = (id) v9[5];
    int v4 = *((unsigned __int8 *)v15 + 24);
  }

  BOOL v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_100011420(uint64_t a1)
{
  uint64_t v2 = img4_nonce_domain_roll_nonce(&_img4_nonce_domain_cryptex);
  if (!(_DWORD)v2) {
    goto LABEL_4;
  }
  uint64_t v3 = v2;
  if ((_DWORD)v2 == 45)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
    unsigned int v7 = (void *)qword_1000348B8;
    qword_1000348B8 = v6;

    if (qword_1000348B8)
    {
LABEL_4:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      return;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create nonce.",  buf,  2u);
    }

    id v11 = sub_1000139A0( (uint64_t)"roll_cryptex_nonce_block_invoke",  2328LL,  -2,  0LL,  @"Failed to create nonce.",  v12,  v13,  v14,  v18);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v20 = v3;
      __int16 v21 = 2080;
      uint64_t v22 = strerror(v3);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to roll img4 cryptex nonce: %d (%s)",  buf,  0x12u);
    }

    strerror(v3);
    id v11 = sub_1000139A0( (uint64_t)"roll_cryptex_nonce_block_invoke",  2333LL,  -2,  0LL,  @"Failed to roll img4 cryptex nonce: %d (%s)",  v8,  v9,  v10,  v3);
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue(v11);
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8LL);
  char v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

id sub_1000115F4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v20 = 0LL;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1000108E0;
  uint64_t v24 = sub_1000108F0;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  char v17 = sub_1000108E0;
  uint64_t v18 = sub_1000108F0;
  id v19 = 0LL;
  id v4 = sub_100011730();
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011770;
  block[3] = &unk_10002CE90;
  id v6 = v3;
  id v11 = v6;
  uint64_t v12 = &v14;
  uint64_t v13 = &v20;
  dispatch_sync(v5, block);

  unsigned int v7 = (void *)v21[5];
  if (a2 && !v7)
  {
    *a2 = (id) v15[5];
    unsigned int v7 = (void *)v21[5];
  }

  id v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

id sub_100011730()
{
  if (qword_100034898 != -1) {
    dispatch_once(&qword_100034898, &stru_10002CF20);
  }
  return (id)qword_1000348A0;
}

void sub_100011770( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v100 = 0LL;
  memset(v99, 0, sizeof(v99));
  uint64_t v97 = 0LL;
  uint64_t v98 = 0LL;
  if (!a1[4])
  {
    uint64_t v46 = @"Invalid input(s).";
    uint64_t v47 = 2373LL;
LABEL_12:
    id v48 = sub_1000139A0((uint64_t)"copy_personalized_image_manifest_block_invoke", v47, -2, 0LL, v46, a6, a7, a8, v93);
    uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);
    uint64_t v50 = *(void *)(a1[5] + 8LL);
    int v51 = *(void **)(v50 + 40);
    *(void *)(v50 + 40) = v49;

    return;
  }

  id v9 = sub_1000177E0();
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    uint64_t v46 = @"Failed to query working directory.";
    uint64_t v47 = 2379LL;
    goto LABEL_12;
  }

  id v11 = (void *)v10;
  uint64_t v12 = (void *)a1[4];
  uint64_t v13 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v13 + 40);
  id v14 = sub_1000107A4(v12, &obj);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_storeStrong((id *)(v13 + 40), obj);
  if (v15)
  {
    id v19 = -[NSString initHexStringWithData:](objc_alloc(&OBJC_CLASS___NSString), "initHexStringWithData:", v15);
    if (v19)
    {
      uint64_t v23 = v19;
      uint64_t v94 = a1[4];
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v11 stringByAppendingFormat:@"/%@/%@.im4m"]);
      if (v24)
      {
        int v28 = (void *)v24;
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned __int8 v30 = [v29 fileExistsAtPath:v28];

        if ((v30 & 1) != 0)
        {
          int v34 = objc_alloc(&OBJC_CLASS___NSData);
          uint64_t v35 = *(void *)(a1[5] + 8LL);
          id v95 = *(id *)(v35 + 40);
          uint64_t v36 = -[NSData initWithContentsOfFile:options:error:]( v34,  "initWithContentsOfFile:options:error:",  v28,  0LL,  &v95);
          objc_storeStrong((id *)(v35 + 40), v95);
          if (v36)
          {
            uint64_t v40 = v36;
            uint64_t inited = Img4DecodeInitManifest( (uint64_t)-[NSData bytes](v40, "bytes"),  -[NSData length](v40, "length"),  (uint64_t)v99);
            if ((_DWORD)inited)
            {
              id v45 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2414LL,  -2,  0LL,  @"Failed to decode img4 manifest: %d",  v42,  v43,  v44,  inited);
            }

            else
            {
              Img4DecodeGetObjectPropertyData((uint64_t)v99, 1885629799LL, 1885630061LL, &v98, &v97);
              if ((_DWORD)v68)
              {
                id v45 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2420LL,  -2,  0LL,  @"Failed to retrieve data from manifest: %d",  v69,  v70,  v71,  v68);
              }

              else
              {
                uint64_t v75 = objc_alloc(&OBJC_CLASS___NSString);
                uint64_t v76 = -[NSString initWithBytes:length:encoding:](v75, "initWithBytes:length:encoding:", v98, v97, 4LL);
                if (v76)
                {
                  uint64_t v77 = v76;
                  if (-[NSString isEqualToString:](v76, "isEqualToString:", a1[4]))
                  {
                    uint64_t v81 = *(void *)(a1[6] + 8LL);
                    id v82 = *(void **)(v81 + 40);
                    *(void *)(v81 + 40) = v40;
                    uint64_t v83 = v40;
                  }

                  else
                  {
                    id v89 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2431LL,  -2,  0LL,  @"Manifest type does not match.",  v78,  v79,  v80,  v94);
                    uint64_t v90 = objc_claimAutoreleasedReturnValue(v89);
                    uint64_t v91 = *(void *)(a1[5] + 8LL);
                    uint64_t v92 = *(void **)(v91 + 40);
                    *(void *)(v91 + 40) = v90;
                  }

                  goto LABEL_24;
                }

                uint64_t v84 = __error();
                uint64_t v85 = strerror(*v84);
                id v45 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2426LL,  -2,  0LL,  @"Failed to create string: %s",  v86,  v87,  v88,  (uint64_t)v85);
              }
            }

            uint64_t v72 = objc_claimAutoreleasedReturnValue(v45);
            uint64_t v73 = *(void *)(a1[5] + 8LL);
            int v74 = *(void **)(v73 + 40);
            *(void *)(v73 + 40) = v72;

LABEL_23:
LABEL_24:

            goto LABEL_25;
          }

          id v64 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2408LL,  -2,  *(void **)(*(void *)(a1[5] + 8LL) + 40LL),  @"Failed to load manifest at %@.",  v37,  v38,  v39,  (uint64_t)v28);
        }

        else
        {
          id v64 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2402LL,  -2,  0LL,  @"%@ does not exist.",  v31,  v32,  v33,  (uint64_t)v28);
        }

        uint64_t v65 = objc_claimAutoreleasedReturnValue(v64);
        uint64_t v66 = *(void *)(a1[5] + 8LL);
        uint64_t v67 = *(void **)(v66 + 40);
        *(void *)(v66 + 40) = v65;

        goto LABEL_23;
      }

      id v60 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2397LL,  -2,  0LL,  @"Failed to create manifest path.",  v25,  v26,  v27,  v94);
      uint64_t v61 = objc_claimAutoreleasedReturnValue(v60);
      uint64_t v62 = *(void *)(a1[5] + 8LL);
      uint64_t v63 = *(void **)(v62 + 40);
      *(void *)(v62 + 40) = v61;
    }

    else
    {
      id v56 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2391LL,  -2,  0LL,  @"Failed to create hex string.",  v20,  v21,  v22,  v93);
      uint64_t v57 = objc_claimAutoreleasedReturnValue(v56);
      uint64_t v58 = *(void *)(a1[5] + 8LL);
      uint64_t v59 = *(void **)(v58 + 40);
      *(void *)(v58 + 40) = v57;
    }
  }

  else
  {
    id v52 = sub_1000139A0( (uint64_t)"copy_personalized_image_manifest_block_invoke",  2385LL,  -2,  *(void **)(*(void *)(a1[5] + 8LL) + 40LL),  @"Failed to copy personalization nonce.",  v16,  v17,  v18,  v93);
    uint64_t v53 = objc_claimAutoreleasedReturnValue(v52);
    uint64_t v54 = *(void *)(a1[5] + 8LL);
    uint64_t v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;
  }

BOOL sub_100011C58(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_1000108E0;
  uint64_t v27 = sub_1000108F0;
  id v28 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  id v7 = sub_100011730();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100011DBC;
  v14[3] = &unk_10002CEE0;
  id v9 = v5;
  id v15 = v9;
  id v10 = v6;
  id v16 = v10;
  uint64_t v17 = &v23;
  uint64_t v18 = &v19;
  dispatch_sync(v8, v14);

  int v11 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = (id) v24[5];
    int v11 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void sub_100011DBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v121 = 0LL;
  memset(v120, 0, sizeof(v120));
  uint64_t v112 = 0LL;
  uint64_t v113 = 0LL;
  if (!*(void *)(a1 + 32) || (id v9 = *(void **)(a1 + 40)) == 0LL)
  {
    id v15 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2469LL,  -2,  0LL,  @"Invalid input(s).",  a6,  a7,  a8,  v107);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    return;
  }

  uint64_t inited = Img4DecodeInitManifest( (uint64_t)[v9 bytes], (uint64_t)objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)v120);
  if (!(_DWORD)inited)
  {
    Img4DecodeGetObjectPropertyData((uint64_t)v120, 1885629799LL, 1885630061LL, &v113, &v112);
    if ((_DWORD)v19)
    {
      id v14 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2481LL,  -2,  0LL,  @"Failed to retrieve data from manifest: %d",  v20,  v21,  v22,  v19);
      goto LABEL_8;
    }

    uint64_t v26 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v27 = -[NSString initWithBytes:length:encoding:](v26, "initWithBytes:length:encoding:", v113, v112, 4LL);
    if (!v27)
    {
      uint64_t v75 = __error();
      uint64_t v76 = strerror(*v75);
      id v14 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2487LL,  -2,  0LL,  @"Failed to create string: %s",  v77,  v78,  v79,  (uint64_t)v76);
      goto LABEL_8;
    }

    id v28 = v27;
    if (-[NSString isEqualToString:](v27, "isEqualToString:", *(void *)(a1 + 32)))
    {
      id v32 = sub_1000177E0();
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
      if (v33)
      {
        int v34 = (void *)v33;
        uint64_t v35 = *(void **)(a1 + 32);
        uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8LL);
        id obj = *(id *)(v36 + 40);
        id v37 = sub_1000107A4(v35, &obj);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        objc_storeStrong((id *)(v36 + 40), obj);
        if (!v38)
        {
          id v86 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2504LL,  -2,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  @"Failed to copy personalization nonce.",  v39,  v40,  v41,  v107);
          uint64_t v87 = objc_claimAutoreleasedReturnValue(v86);
          uint64_t v88 = *(void *)(*(void *)(a1 + 48) + 8LL);
          id v89 = *(void **)(v88 + 40);
          *(void *)(v88 + 40) = v87;

          return;
        }

        id v42 = -[NSString initHexStringWithData:](objc_alloc(&OBJC_CLASS___NSString), "initHexStringWithData:", v38);
        if (!v42)
        {
          id v90 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2510LL,  -2,  0LL,  @"Failed to create hex string.",  v43,  v44,  v45,  v107);
          uint64_t v91 = objc_claimAutoreleasedReturnValue(v90);
          uint64_t v92 = *(void *)(*(void *)(a1 + 48) + 8LL);
          uint64_t v93 = *(void **)(v92 + 40);
          *(void *)(v92 + 40) = v91;

LABEL_39:
          return;
        }

        uint64_t v46 = v42;
        uint64_t v47 = objc_claimAutoreleasedReturnValue([v34 stringByAppendingPathComponent:*(void *)(a1 + 32)]);
        if (v47)
        {
          int v51 = (void *)v47;
          id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v53 = [v52 fileExistsAtPath:v51];

          if (v53
            && (uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
                uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8LL),
                id v110 = *(id *)(v55 + 40),
                unsigned __int8 v56 = [v54 removeItemAtPath:v51 error:&v110],
                objc_storeStrong((id *)(v55 + 40), v110),
                v54,
                (v56 & 1) == 0))
          {
            id v99 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2522LL,  -2,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  @"Failed to delete manifest folder at %@.",  v57,  v58,  v59,  (uint64_t)v51);
          }

          else
          {
            id v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            NSFileAttributeKey v118 = NSFilePosixPermissions;
            uint64_t v119 = &off_100030650;
            uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
            uint64_t v62 = *(void *)(*(void *)(a1 + 48) + 8LL);
            id v109 = *(id *)(v62 + 40);
            unsigned __int8 v63 = [v60 createDirectoryAtPath:v51 withIntermediateDirectories:1 attributes:v61 error:&v109];
            objc_storeStrong((id *)(v62 + 40), v109);

            if ((v63 & 1) != 0)
            {
              uint64_t v107 = (uint64_t)v46;
              uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v51 stringByAppendingFormat:@"/%@.im4m"]);

              if (v67)
              {
                uint64_t v68 = *(void **)(a1 + 40);
                uint64_t v69 = *(void *)(*(void *)(a1 + 48) + 8LL);
                id v108 = *(id *)(v69 + 40);
                unsigned __int8 v70 = [v68 writeToFile:v67 options:0 error:&v108];
                objc_storeStrong((id *)(v69 + 40), v108);
                if ((v70 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v74 = *(void *)(a1 + 32);
                    *(_DWORD *)buf = 138412546;
                    uint64_t v115 = v74;
                    __int16 v116 = 2112;
                    uint64_t v117 = v67;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully stored %@ manifest at %@.",  buf,  0x16u);
                  }

                  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
                }

                else
                {
                  id v103 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2539LL,  -2,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  @"Failed to write manifest to %@.",  v71,  v72,  v73,  (uint64_t)v67);
                  uint64_t v104 = objc_claimAutoreleasedReturnValue(v103);
                  uint64_t v105 = *(void *)(*(void *)(a1 + 48) + 8LL);
                  id v106 = *(void **)(v105 + 40);
                  *(void *)(v105 + 40) = v104;
                }

                goto LABEL_38;
              }

              uint64_t v94 = 2534LL;
              goto LABEL_31;
            }

            id v99 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2528LL,  -2,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  @"Failed to create %@.",  v64,  v65,  v66,  (uint64_t)v51);
          }

          uint64_t v100 = objc_claimAutoreleasedReturnValue(v99);
          uint64_t v101 = *(void *)(*(void *)(a1 + 48) + 8LL);
          uint64_t v102 = *(void **)(v101 + 40);
          *(void *)(v101 + 40) = v100;

          goto LABEL_38;
        }

        uint64_t v94 = 2516LL;
LABEL_31:
        id v95 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  v94,  -2,  0LL,  @"Failed to create manifest path.",  v48,  v49,  v50,  v107);
        uint64_t v96 = objc_claimAutoreleasedReturnValue(v95);
        uint64_t v97 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v98 = *(void **)(v97 + 40);
        *(void *)(v97 + 40) = v96;

LABEL_38:
        goto LABEL_39;
      }

      uint64_t v80 = @"Failed to query working directory.";
      uint64_t v81 = 2498LL;
    }

    else
    {
      uint64_t v80 = @"Manifest type does not match.";
      uint64_t v81 = 2492LL;
    }

    id v82 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  v81,  -2,  0LL,  v80,  v29,  v30,  v31,  v107);
    uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);
    uint64_t v84 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v85 = *(void **)(v84 + 40);
    *(void *)(v84 + 40) = v83;

    return;
  }

  id v14 = sub_1000139A0( (uint64_t)"store_personalized_image_manifest_block_invoke",  2475LL,  -2,  0LL,  @"Failed to decode img4 manifest: %d",  v11,  v12,  v13,  inited);
LABEL_8:
  uint64_t v23 = objc_claimAutoreleasedReturnValue(v14);
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
}

BOOL sub_10001243C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_1000108E0;
  uint64_t v22 = sub_1000108F0;
  id v23 = 0LL;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v4 = sub_100011730();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012574;
  block[3] = &unk_10002CE90;
  id v6 = v3;
  id v11 = v6;
  uint64_t v12 = &v18;
  uint64_t v13 = &v14;
  dispatch_sync(v5, block);

  int v7 = *((unsigned __int8 *)v15 + 24);
  if (a2 && !*((_BYTE *)v15 + 24))
  {
    *a2 = (id) v19[5];
    int v7 = *((unsigned __int8 *)v15 + 24);
  }

  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void sub_100012574( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1[4])
  {
    uint64_t v25 = @"Invalid input(s).";
    uint64_t v26 = 2570LL;
LABEL_11:
    id v27 = sub_1000139A0((uint64_t)"delete_personalized_image_manifest_block_invoke", v26, -2, 0LL, v25, a6, a7, a8, v39);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = *(void *)(a1[5] + 8LL);
    uint64_t v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    return;
  }

  id v9 = sub_1000177E0();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    uint64_t v25 = @"Failed to query working directory.";
    uint64_t v26 = 2576LL;
    goto LABEL_11;
  }

  id v40 = v10;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:a1[4]]);
  if (!v11)
  {
    id v31 = sub_1000139A0( (uint64_t)"delete_personalized_image_manifest_block_invoke",  2582LL,  -2,  0LL,  @"Failed to create manifest path.",  v12,  v13,  v14,  v39);
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = *(void *)(a1[5] + 8LL);
    int v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    return;
  }

  id v15 = (void *)v11;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v17 = [v16 fileExistsAtPath:v15];

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v19 = *(void *)(a1[5] + 8LL);
    id obj = *(id *)(v19 + 40);
    unsigned __int8 v20 = [v18 removeItemAtPath:v15 error:&obj];
    objc_storeStrong((id *)(v19 + 40), obj);

    if ((v20 & 1) == 0)
    {
      id v35 = sub_1000139A0( (uint64_t)"delete_personalized_image_manifest_block_invoke",  2588LL,  -2,  *(void **)(*(void *)(a1[5] + 8LL) + 40LL),  @"Failed to remove manifest at %@.",  v21,  v22,  v23,  (uint64_t)v15);
      uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
      uint64_t v37 = *(void *)(a1[5] + 8LL);
      uint64_t v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = v36;

      goto LABEL_14;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v24;
      __int16 v44 = 2112;
      uint64_t v45 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully deleted %@ manifest at %@.",  buf,  0x16u);
    }
  }

  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
LABEL_14:
}

void sub_100012814(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.storage_mounter.nonce", 0LL);
  uint64_t v2 = (void *)qword_100034890;
  qword_100034890 = (uint64_t)v1;
}

void sub_100012840(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.storage_mounter.manifest", 0LL);
  uint64_t v2 = (void *)qword_1000348A0;
  qword_1000348A0 = (uint64_t)v1;
}

void sub_10001286C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001287C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

BOOL sub_1000128B8()
{
  return objc_opt_class(&OBJC_CLASS___IXAppInstallCoordinator) != 0;
}

uint64_t sub_1000128DC(void *a1, void *a2)
{
  id v3 = a1;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid argument.",  buf,  2u);
    }

    uint64_t v12 = @"Invalid argument.";
    uint64_t v13 = 33LL;
    int v14 = -3;
LABEL_16:
    id v15 = sub_1000139A0((uint64_t)"registerAppsForMountPoint", v13, v14, 0LL, v12, v9, v10, v11, v24);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v15);
    id v5 = 0LL;
    if (!a2)
    {
LABEL_23:
      uint64_t v8 = 0LL;
      goto LABEL_24;
    }

uint64_t sub_100012BC8(void *a1, void *a2)
{
  id v3 = a1;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid argument.",  buf,  2u);
    }

    id v15 = @"Invalid argument.";
    uint64_t v16 = 73LL;
    int v17 = -3;
LABEL_16:
    id v18 = sub_1000139A0((uint64_t)"unregisterAppsForMountPoint", v16, v17, 0LL, v15, v12, v13, v14, v22);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v18);
    id v5 = 0LL;
    if (!a2)
    {
LABEL_19:
      uint64_t v11 = 0LL;
      goto LABEL_20;
    }

CFMutableDictionaryRef sub_100012DF0()
{
  return CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
}

NSString *sub_100012E14(void *a1)
{
  io_registry_entry_t entry = 0;
  id v1 = sub_100012F84(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = IOBSDNameMatching( kIOMasterPortDefault, 0, (const char *)[v2 UTF8String]);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    io_registry_entry_t entry = MatchingService;
    if (MatchingService)
    {
      io_registry_entry_t v6 = MatchingService;
      if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
      {
        uint64_t v9 = 0LL;
        CFProperty = 0LL;
LABEL_17:
        IOObjectRelease(v6);
        goto LABEL_18;
      }

      if (sub_100013024(&entry, "AppleAPFSContainer")
        && sub_100013024(&entry, "AppleAPFSMedia")
        && sub_100013024(&entry, "AppleAPFSContainerScheme")
        && sub_100013024(&entry, "IOMedia"))
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"BSD Name", kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/dev/%@",  CFProperty);
          if (v8)
          {
            uint64_t v9 = v8;
            goto LABEL_14;
          }
        }
      }

      else
      {
        CFProperty = 0LL;
      }

      uint64_t v9 = 0LL;
LABEL_14:
      io_registry_entry_t v6 = entry;
      if (!entry) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  uint64_t v9 = 0LL;
  CFProperty = 0LL;
LABEL_18:

  return v9;
}

id sub_100012F84(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = @"/dev/r";
    if (([v3 hasPrefix:@"/dev/r"] & 1) != 0
      || (uint64_t v4 = @"/dev/", [v3 hasPrefix:@"/dev/"]))
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v4, "length")));

      id v3 = (id)v5;
    }

    id v6 = v3;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

uint64_t sub_100013024(io_object_t *a1, const char *a2)
{
  uint64_t result = 0LL;
  io_registry_entry_t parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      uint64_t result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0LL;
      }
    }

    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1LL;
    }
  }

  return result;
}

id sub_1000130AC(void *a1)
{
  return a1;
}

id sub_1000130C0(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_100013118(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_100013170(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_1000131C8(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_100013220(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_100013278(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSURL), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t sub_1000132D0(void *a1, void *a2)
{
  id v3 = a1;
  bzero(v28, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_registry_entry_t entry = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  entry,  2u);
    }

    id v3 = 0LL;
    goto LABEL_32;
  }

  id v4 = sub_100012F84(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (!v5
    || (id v7 = v5,
        uint64_t v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v7 UTF8String]),
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8),
        (*(_DWORD *)io_registry_entry_t entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }

  io_object_t v10 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v10);

    goto LABEL_16;
  }

  if (!sub_100017AB4((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !sub_100017AB4((io_object_t *)entry, "AppleAPFSMedia"))
  {
    char v22 = 0;
    uint64_t v11 = 0LL;
LABEL_45:
    id CFProperty = 0LL;
    goto LABEL_46;
  }

  uint64_t v11 = (void *)IORegistryEntrySearchCFProperty( *(io_registry_entry_t *)entry,  "IOService",  @"Content Hint",  kCFAllocatorDefault,  0);
  if (!a2)
  {
    id CFProperty = 0LL;
    goto LABEL_55;
  }

  if (!sub_100017AB4((io_object_t *)entry, "AppleAPFSContainer")
    || !sub_100017AB4((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    char v22 = 0;
    goto LABEL_45;
  }

  id CFProperty = (id)IORegistryEntryCreateCFProperty( *(io_registry_entry_t *)entry,  @"BSD Name",  kCFAllocatorDefault,  0);
  id v13 = sub_1000131C8(CFProperty);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([@"/dev/" stringByAppendingString:CFProperty]);

    if (v15)
    {
      id CFProperty = v15;
      *a2 = CFProperty;
LABEL_55:
      char v22 = 1;
      goto LABEL_46;
    }

    goto LABEL_44;
  }

  char v22 = 0;
LABEL_46:
  if (*(_DWORD *)entry) {
    IOObjectRelease(*(io_object_t *)entry);
  }

  if ((v22 & 1) != 0)
  {
    uint64_t v19 = 6LL;
    goto LABEL_53;
  }

LABEL_32:
    uint64_t v19 = 0LL;
    goto LABEL_53;
  }

  int v18 = v17;
  if (read(v17, v28, 0x1000uLL) == 4096)
  {
    if (v28[0] == 233 || v28[0] == 235 && v28[2] == 144)
    {
      if (v29 == 0x202020205346544ELL)
      {
        uint64_t v19 = 5LL;
      }

      else if (v29 == 0x2020205441465845LL)
      {
        uint64_t v19 = 4LL;
      }

      else
      {
        uint64_t v19 = 1LL;
      }
    }

    else if (v30 == 11080)
    {
      uint64_t v19 = 2 * (v31 == 4);
    }

    else if (v31 == 5 && v30 == 22600)
    {
      uint64_t v19 = 3LL;
    }

    else
    {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v26 = 1024;
      int v27 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to read %@ volume header: %{errno}d",  entry,  0x12u);
      uint64_t v19 = 0LL;
    }
  }

  close(v18);
LABEL_53:

  return v19;
}

  return v31;
}

BOOL sub_10001376C()
{
  size_t v4 = 8LL;
  uint64_t v5 = 0LL;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0LL, 0LL)) {
    return v5 == 1;
  }
  v0 = __error();
  BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0LL;
  if (v1)
  {
    int v3 = *v0;
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to read developer mode status: %{darwin.errno}d",  buf,  8u);
    return 0LL;
  }

  return result;
}

BOOL sub_100013854(BOOL *a1, void *a2)
{
  int v13 = 0;
  size_t v12 = 4LL;
  if (sysctlbyname("security.codesigning.config", &v13, &v12, 0LL, 0LL))
  {
    int v4 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "security.codesigning.config";
      __int16 v16 = 1024;
      int v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to read sysctl (%s): %{darwin.errno}d",  buf,  0x12u);
    }

    id v8 = sub_1000139A0( (uint64_t)"systemSupportsRestrictedExecutionMode",  773LL,  -2,  0LL,  @"Failed to read sysctl (%s): %{darwin.errno}d",  v5,  v6,  v7,  (uint64_t)"security.codesigning.config");
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (a2 && v9)
    {
      id v9 = v9;
      *a2 = v9;
    }
  }

  else
  {
    id v9 = 0LL;
    if (a1) {
      *a1 = (v13 & 0x2000000) != 0;
    }
  }

  BOOL v10 = v9 == 0LL;

  return v10;
}

id sub_1000139A0( uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  id v14 = a5;
  id v15 = -[NSMutableString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:arguments:",  v14,  &a9);

  __int16 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v17 = v16;
  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v15,  NSLocalizedDescriptionKey);
  }
  if (v13) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);
  }
  if (os_variant_allows_internal_security_policies(0LL))
  {
    if (a1)
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  @"FunctionName");
    }

    if ((_DWORD)a2)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, @"SourceLine");
    }
  }

  int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileStorage.ErrorDomain",  a3,  v17));

  return v20;
}

BOOL sub_100013B14()
{
  uint64_t v4 = 0LL;
  if ((os_parse_boot_arg_int("allow_msm_to_invalidate_attestations", &v4) & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v0 = "";
      *(_DWORD *)buf = 136315650;
      if (!v4) {
        v0 = " not";
      }
      uint64_t v6 = v0;
      __int16 v7 = 2080;
      id v8 = "allow_msm_to_invalidate_attestations";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      BOOL v1 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      uint32_t v2 = 32;
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v6 = "allow_msm_to_invalidate_attestations";
      BOOL v1 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
      uint32_t v2 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v1, buf, v2);
    }
  }

  return v4 != 0;
}

BOOL sub_100013C58(io_registry_entry_t a1)
{
  BOOL v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"Protocol Characteristics",  kCFAllocatorDefault,  3u);
  if (!v1) {
    return 0LL;
  }
  uint32_t v2 = v1;
  Value = (const __CFString *)CFDictionaryGetValue(v1, @"Physical Interconnect");
  if (Value) {
    BOOL v4 = CFStringCompare(Value, @"Virtual Interface", 0LL) == kCFCompareEqualTo;
  }
  else {
    BOOL v4 = 0LL;
  }
  CFRelease(v2);
  return v4;
}

NSMutableDictionary *sub_100013CE0(int a1)
{
  uint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v40)
  {
    int v2 = getfsstat(0LL, 0, 2);
    if (v2 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
      }

      uint64_t v41 = 0LL;
    }

    else
    {
      int v3 = v2;
      unint64_t v4 = 0LL;
      uint64_t v41 = 0LL;
      do
      {
        unint64_t v5 = 2168LL * v3;
        if (v4 > v5)
        {
          if (v41) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }

        if (v41) {
          free(v41);
        }
        unint64_t v4 = v5 + 2168;
        uint64_t v6 = (statfs *)malloc(v5 + 2168);
        if (!v6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v10;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %{errno}d",  buf,  8u);
          }

void sub_100014658(_Unwind_Exception *a1)
{
}

NSMutableDictionary *sub_100014678(uint64_t a1, CFDictionaryRef *a2, uint64_t a3)
{
  if (!a1 || (uint64_t v3 = a3, (v4 = a2) == 0LL) && a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      int v7 = 0LL;
      id v8 = 0LL;
      int v9 = 0LL;
      int v10 = 0LL;
      unint64_t v4 = 0LL;
      uint64_t v11 = 0LL;
      unsigned int v12 = 0LL;
      __int128 v13 = 0LL;
      int v14 = 0LL;
LABEL_8:
      id v15 = 0LL;
      goto LABEL_9;
    }

    *(_WORD *)buf = 0;
    uint64_t v6 = "Invalid intput.";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_7;
  }

  int v17 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a1 + 1112,  4LL);
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Failed to create string.";
    goto LABEL_6;
  }

  int v14 = v17;
  uint64_t v18 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a1 + 88,  4LL);
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    unsigned int v12 = 0LL;
    __int128 v13 = 0LL;
    goto LABEL_8;
  }

  __int128 v13 = v18;
  uint64_t v19 = -[NSString UTF8String](v13, "UTF8String");
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v35 = "Failed to get C string.";
LABEL_51:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    }

LABEL_52:
    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    unsigned int v12 = 0LL;
    goto LABEL_8;
  }

  int v20 = v19;
  int v21 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a1 + 72,  4LL);
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v35 = "Failed to create string.";
      goto LABEL_51;
    }

    goto LABEL_52;
  }

  unsigned int v12 = v21;
  char v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_8;
  }

  id v15 = v22;
  __s2 = v20;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", @"MassStorage");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, @"DeviceNode");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, @"MountPath");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, @"FilesystemType");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"IsMounted");
  id v23 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v14);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v58 = v14;
      __int16 v59 = 2080;
      id v60 = (NSString *)(a1 + 88);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create URL (%@ / %s).",  buf,  0x16u);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
    int v10 = 0LL;
    goto LABEL_62;
  }

  int v10 = v23;
  id v24 = objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v23, "lastPathComponent"));
  matching = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v24 UTF8String]);

  if (!matching)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v10, "lastPathComponent"));
      *(_DWORD *)buf = 138412290;
      CFStringRef v58 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create a BSD matching dictionary for %@.",  buf,  0xCu);
    }

    int v7 = 0LL;
    id v8 = 0LL;
    int v9 = 0LL;
LABEL_62:
    unint64_t v4 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_9;
  }

  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  mach_port_t mainPort = MatchingService;
  if (!MatchingService || !sub_100013C58(MatchingService)) {
    goto LABEL_99;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"DiskImage",  @"DeviceType");
  if (!strcmp("/Developer", __s2))
  {
    int v37 = @"Developer";
    uint64_t v38 = &off_10002CC38;
LABEL_98:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v37, *v38);
    goto LABEL_99;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
    __int128 v39 = &off_10002CC80;
LABEL_97:
    int v37 = *v39;
    uint64_t v38 = &off_10002CC58;
    goto LABEL_98;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
    __int128 v39 = &off_10002CC70;
    goto LABEL_97;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
    __int128 v39 = &off_10002CC60;
    goto LABEL_97;
  }

  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = &off_10002CC78;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = &off_10002CC90;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = &off_10002CC98;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = &off_10002CCA0;
    }

    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = &off_10002CCA8;
    }

    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          CFDictionaryRef matchingb = 0LL;
          id v8 = 0LL;
          int v9 = 0LL;
          goto LABEL_100;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Cryptex",  @"DiskImageType");
        if (v3)
        {
          while (1)
          {
            CFDictionaryRef matchinga = *v4;
            uint64_t v26 = ((uint64_t (*)(void))cryptex_msm_get_string)();
            if (v26)
            {
              uint32_t v27 = (const char *)v26;
              size_t v28 = strlen((const char *)(a1 + 1112));
              if (strnstr(v27, (const char *)(a1 + 1112), v28))
              {
                uint64_t string = cryptex_msm_get_string(matchinga, 1LL);
                if (string)
                {
                  uint64_t v30 = string;
                  uint64_t v31 = cryptex_msm_get_string(matchinga, 0LL);
                  if (v31) {
                    break;
                  }
                }
              }
            }

            ++v4;
            if (!--v3) {
              goto LABEL_37;
            }
          }

          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v49,  @"CryptexName");

          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v30));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v50,  @"CryptexVersion");
        }

LABEL_37:
        uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"CryptexName"));
        if (!v32
          || (id v33 = (void *)v32,
              int v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15,  "objectForKeyedSubscript:",  @"CryptexVersion")),  v34,  v33,  !v34))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v58 = v14;
            __int16 v59 = 2112;
            id v60 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).",  buf,  0x16u);
          }

          int v7 = 0LL;
          CFDictionaryRef matchingb = 0LL;
          id v8 = 0LL;
          int v9 = 0LL;
          unint64_t v4 = 0LL;
          uint64_t v11 = 0LL;
LABEL_108:
          io_object_t v46 = mainPort;
          if (!mainPort) {
            goto LABEL_110;
          }
          goto LABEL_109;
        }

LABEL_99:
        CFDictionaryRef matchingb = 0LL;
        id v8 = 0LL;
        int v9 = 0LL;
        unint64_t v4 = 0LL;
LABEL_100:
        uint64_t v11 = 0LL;
        goto LABEL_101;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
      __int128 v39 = &off_10002CCB0;
    }

    goto LABEL_97;
  }

  uint64_t v40 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v13,  "stringByAppendingPathComponent:",  @"Library/Frameworks/DTRemoteServices.framework"));
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path.",  buf,  2u);
    }

    uint64_t v11 = 0LL;
    unint64_t v4 = 0LL;
    goto LABEL_86;
  }

  unint64_t v4 = (CFDictionaryRef *)v40;
  Unique = (__CFBundle *)_CFBundleCreateUnique( 0LL,  +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v40,  0LL));
  if (!Unique)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query bundle for DTRemoteServices.framework.",  buf,  2u);
    }

    uint64_t v11 = 0LL;
LABEL_86:
    int v9 = 0LL;
    id v8 = 0LL;
    CFDictionaryRef matchingb = 0LL;
    goto LABEL_95;
  }

  CFDictionaryRef matchingb = Unique;
  CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(Unique, kCFBundleVersionKey);
  uint64_t v43 = objc_claimAutoreleasedReturnValue(ValueForInfoDictionaryKey);
  if (v43)
  {
    uint64_t v11 = (void *)v43;
    uint64_t v44 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", @"version.plist"));
    if (v44)
    {
      id v8 = (void *)v44;
      id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int __s2a = [v45 fileExistsAtPath:v8];

      if (__s2a)
      {
        int v9 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  v8);
        if (v9)
        {
LABEL_76:
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v11,  @"PersonalizedImageVersion");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v9,  @"PersonalizedImageVersionInfo");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"Personalized",  @"DiskImageType");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"DeveloperDiskImage",  @"PersonalizedImageType");
LABEL_101:
          if ((*(_DWORD *)(a1 + 64) & 1) != 0) {
            uint64_t v47 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v47 = &__kCFBooleanFalse;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v47,  @"IsReadOnly");
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0) {
            uint64_t v48 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v48 = &__kCFBooleanFalse;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v48,  @"SupportsContentProtection");
          int v7 = v15;
          goto LABEL_108;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10001EAC8((uint64_t)v8, (uint64_t)v11);
        }
      }

      int v9 = 0LL;
      goto LABEL_76;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create path.",  buf,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v58 = kCFBundleVersionKey;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query bundle key %@.",  buf,  0xCu);
    }

    uint64_t v11 = 0LL;
  }

  int v9 = 0LL;
  id v8 = 0LL;
LABEL_95:
  int v7 = 0LL;
  io_object_t v46 = mainPort;
LABEL_109:
  IOObjectRelease(v46);
LABEL_110:
  if (matchingb) {
    CFRelease(matchingb);
  }
LABEL_9:

  return v7;
}

void sub_100015388(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (([*(id *)(a1 + 32) hasPrefix:a2] & 1) != 0
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"DiskImageType"]),
        unsigned int v7 = [v6 isEqualToString:@"Cryptex"],
        v6,
        v7))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

id sub_10001540C(uint64_t a1)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Invalid input.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }

LABEL_10:
    unint64_t v5 = 0LL;
    int v2 = 0LL;
    id v4 = 0LL;
LABEL_11:
    uint64_t v3 = 0LL;
    goto LABEL_12;
  }

  uint64_t v1 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a1);
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Failed to create string.";
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  int v2 = v1;
  id v8 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[DiskImages2 imageURLFromDevice:error:]( &OBJC_CLASS___DiskImages2,  "imageURLFromDevice:error:",  v1,  &v8));
  id v4 = v8;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve image URL: %@",  buf,  0xCu);
    }

    unint64_t v5 = 0LL;
    goto LABEL_11;
  }

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
LABEL_12:

  return v5;
}

  unint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  BOOL result = 0LL;
  *a2 = v5;
  return result;
}

NSString *sub_1000155B0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 pathComponents]);
  if ((unint64_t)[v1 count] >= 4)
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 3));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 2));
    int v2 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@%@", v4, v5);
  }

  else
  {
    int v2 = 0LL;
  }

  return v2;
}

NSMutableDictionary *sub_100015668()
{
  kern_return_t v8;
  __int16 v9;
  void *Value;
  NSMutableDictionary *v11;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;
  properties = 0LL;
  existing = 0;
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v0)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (CFMutableDictionaryRef v2 = v1,
          -[__CFDictionary setObject:forKeyedSubscript:]( v1,  "setObject:forKeyedSubscript:",  &off_100030668,  @"bInterfaceClass"),  -[__CFDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &off_100030680,  @"bInterfaceSubClass"),  -[__CFDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &off_100030680,  @"bInterfaceProtocol"),  !IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))
      && (io_object_t v6 = IOIteratorNext(existing)) != 0)
    {
      io_registry_entry_t v7 = v6;
      id v4 = 0LL;
      uint64_t v3 = 0LL;
      do
      {
        id v8 = IORegistryEntryCreateCFProperties(v7, &properties, 0LL, 0);
        if (v8)
        {
          int v9 = v8;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v15) = v9 & 0x3FFF;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryCreateCFProperties failed: 0x%04x",  buf,  8u);
          }
        }

        else
        {
          Value = (void *)CFDictionaryGetValue(properties, @"locationID");

          if (Value)
          {
            uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

            if (v11)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  Value,  @"LocationID");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  @"PTPCamera",  @"DeviceType");
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v0,  "setObject:forKeyedSubscript:",  v11,  @"PTPNode");
              uint64_t v3 = v11;
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
              }

              uint64_t v3 = 0LL;
            }

            id v4 = Value;
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v15 = "locationID";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve %s.",  buf,  0xCu);
            }

            id v4 = 0LL;
          }
        }

        if (properties) {
          CFRelease(properties);
        }
        properties = 0LL;
        IOObjectRelease(v7);
        io_registry_entry_t v7 = IOIteratorNext(existing);
      }

      while (v7);
    }

    else
    {
      uint64_t v3 = 0LL;
      id v4 = 0LL;
    }

    if (existing) {
      IOObjectRelease(existing);
    }
  }

  else
  {
    id v4 = 0LL;
    uint64_t v3 = 0LL;
  }

  return v0;
}

NSMutableDictionary *sub_100015990()
{
  kern_return_t v12;
  __int16 v13;
  const char *v14;
  uint32_t v15;
  const void *Value;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  const void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  void *v28;
  id v29;
  void *v30;
  const void *v31;
  void *v32;
  id v33;
  void *v34;
  const void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  int v41;
  NSMutableDictionary *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v46;
  char v47;
  NSMutableDictionary *v48;
  NSMutableDictionary *v49;
  uint8_t v50;
  char v51[15];
  uint8_t v52;
  char v53[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v56[4];
  uint64_t v57;
  uint8_t v58[4];
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const char *v63;
  _BYTE v64[72];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  properties = 0LL;
  existing = 0;
  bzero(v64, 0x878uLL);
  v0 = IOServiceMatching("IOMedia");
  CFMutableDictionaryRef v1 = 0LL;
  CFMutableDictionaryRef v2 = 0LL;
  uint64_t v3 = 0LL;
  id v4 = 0LL;
  unint64_t v5 = 0LL;
  io_object_t v6 = 0LL;
  io_registry_entry_t v7 = 0LL;
  id v8 = 0LL;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
  {
    int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v9)
    {
      CFMutableDictionaryRef v1 = v9;
      io_object_t v10 = IOIteratorNext(existing);
      if (v10)
      {
        io_registry_entry_t v11 = v10;
        uint64_t v48 = v1;
        uint64_t v49 = 0LL;
        id v8 = 0LL;
        io_registry_entry_t v7 = 0LL;
        io_object_t v6 = 0LL;
        unint64_t v5 = 0LL;
        id v4 = 0LL;
        uint64_t v3 = 0LL;
        uint64_t v47 = 1;
        while (1)
        {
          if (!sub_100013C58(v11))
          {
            unsigned int v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0LL, 0);
            if (v12)
            {
              __int128 v13 = v12;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v61) = v13 & 0x3FFF;
                int v14 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                id v15 = 8;
LABEL_9:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v14,  buf,  v15);
              }
            }

            else
            {
              if (properties)
              {
                Value = CFDictionaryGetValue(properties, @"BSD Name");
                int v17 = (void *)objc_claimAutoreleasedReturnValue(Value);

                uint64_t v18 = sub_1000131C8(v17);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

                if (v19)
                {
                  int v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/dev/%@",  v17);

                  if (v20)
                  {
                    int v21 = CFDictionaryGetValue(properties, @"Content");
                    char v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

                    id v23 = sub_1000131C8(v22);
                    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                    if (v24)
                    {
                      if ([@"C12A7328-F81F-11D2-BA4B-00A0C93EC93B" isEqualToString:v22])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_10001EB50(&v52, v53, v25);
                        }
LABEL_32:
                        uint64_t v3 = v20;
                        unint64_t v5 = v22;
                        io_object_t v6 = v17;
                        goto LABEL_33;
                      }

                      if ([@"Apple_partition_map" isEqualToString:v22])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_10001EB88(&v50, v51, v26);
                        }
                        goto LABEL_32;
                      }

                      uint32_t v27 = CFDictionaryGetValue(properties, @"Removable");
                      size_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

                      uint64_t v29 = sub_1000130C0(v28);
                      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

                      if (v30)
                      {
                        if (([v28 BOOLValue] & 1) == 0 && (sub_100016434(v11) & 1) == 0)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                            sub_10001EC00(v58, (uint64_t)v17, &v59);
                          }
                          uint64_t v3 = v20;
                          unint64_t v5 = v22;
                          io_object_t v6 = v17;
LABEL_59:
                          id v8 = v28;
                          goto LABEL_33;
                        }

                        uint64_t v31 = CFDictionaryGetValue(properties, @"Leaf");
                        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

                        id v33 = sub_1000130C0(v32);
                        int v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

                        if (v34)
                        {
                          if ([v32 BOOLValue])
                          {
                            io_object_t v46 = v32;
                            id v35 = CFDictionaryGetValue(properties, @"Writable");
                            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

                            int v37 = sub_1000130C0(v36);
                            uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
                            if (v38)
                            {
                              __int128 v39 = (void *)v38;
                              uint64_t v40 = [v36 BOOLValue];

                              v47 &= v40 ^ 1;
                            }

                            uint64_t v41 = sub_1000132D0(v20, 0LL);
                            if (v41 == 4 || (v41 & 3) == 1)
                            {
                              uint64_t v3 = v20;
                              if ((unint64_t)__strlcpy_chk( &v66,  -[NSString UTF8String](v3, "UTF8String"),  1024LL,  1024LL) >= 0x400)
                              {
                                id v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
LABEL_71:
                                *(_WORD *)buf = 0;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid string size.",  buf,  2u);
                                goto LABEL_72;
                              }

                              uint64_t v3 = v3;
                              if ((unint64_t)__strlcpy_chk( &v67,  -[NSString UTF8String](v3, "UTF8String"),  1024LL,  1024LL) >= 0x400)
                              {
                                id v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
                                goto LABEL_71;
                              }

                              if ((unint64_t)__strlcpy_chk(&v65, "exfat", 16LL, 16LL) >= 0x10)
                              {
                                id v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_71;
                                }
LABEL_72:
                                id v4 = v36;
                                unint64_t v5 = v22;
                                io_object_t v6 = v17;
                                io_registry_entry_t v7 = v46;
                                goto LABEL_33;
                              }

                              uint64_t v44 = sub_100014678((uint64_t)v64, 0LL, 0LL);
                              uint64_t v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v44);

                              if (!v42)
                              {
                                id v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  uint64_t v49 = 0LL;
                                  id v4 = v36;
                                  unint64_t v5 = v22;
                                  io_object_t v6 = v17;
                                  io_registry_entry_t v7 = v46;
                                  goto LABEL_33;
                                }

                                *(_DWORD *)buf = 138412290;
                                uint64_t v61 = (const char *)v3;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create map entry for %@.",  buf,  0xCu);
                                uint64_t v49 = 0LL;
                                goto LABEL_72;
                              }
                            }

                            else
                            {
                              uint64_t v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

                              if (!v42)
                              {
                                id v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
                                }

                                uint64_t v49 = 0LL;
                                uint64_t v3 = v20;
                                goto LABEL_72;
                              }

                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  @"MassStorage",  @"DeviceType");
                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  v20,  @"DeviceNode");
                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"IsMounted");
                              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v47 & 1));
                              -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  v43,  @"IsReadOnly");
                            }

                            -[NSMutableDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  v42,  v20);
                            uint64_t v49 = v42;
                            uint64_t v3 = v20;
                            id v4 = v36;
                            unint64_t v5 = v22;
                            io_object_t v6 = v17;
                            io_registry_entry_t v7 = v32;
                          }

                          else
                          {
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                              sub_10001EBC0(v56, (uint64_t)v17, &v57);
                            }
                            uint64_t v3 = v20;
                            unint64_t v5 = v22;
                            io_object_t v6 = v17;
                            io_registry_entry_t v7 = v32;
                          }

                          goto LABEL_59;
                        }

                        io_registry_entry_t v7 = v32;
                        id v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v61 = (const char *)v17;
                          uint64_t v62 = 2080;
                          unsigned __int8 v63 = "Leaf";
LABEL_26:
                          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The attached media object %@ does not have a '%s' flag.",  buf,  0x16u);
                        }
                      }

                      else
                      {
                        id v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v61 = (const char *)v17;
                          uint64_t v62 = 2080;
                          unsigned __int8 v63 = "Removable";
                          goto LABEL_26;
                        }
                      }
                    }

                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v61 = (const char *)v17;
                      uint64_t v62 = 2080;
                      unsigned __int8 v63 = "Content";
                      goto LABEL_26;
                    }

                    uint64_t v3 = v20;
                    unint64_t v5 = v22;
                  }

                  else
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create string.",  buf,  2u);
                    }

                    uint64_t v3 = 0LL;
                  }
                }

                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  uint64_t v61 = "BSD Name";
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve %s.",  buf,  0xCu);
                }

                io_object_t v6 = v17;
                goto LABEL_33;
              }

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                int v14 = "Failed to retrieve any properties for the matched service.";
                id v15 = 2;
                goto LABEL_9;
              }
            }
          }

LABEL_33:
          IOObjectRelease(v11);
          if (properties) {
            CFRelease(properties);
          }
          properties = 0LL;
          io_registry_entry_t v11 = IOIteratorNext(existing);
          if (!v11)
          {
            CFMutableDictionaryRef v1 = v48;
            CFMutableDictionaryRef v2 = v49;
            goto LABEL_81;
          }
        }
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
      }

      CFMutableDictionaryRef v1 = 0LL;
    }

    CFMutableDictionaryRef v2 = 0LL;
    uint64_t v3 = 0LL;
    id v4 = 0LL;
    unint64_t v5 = 0LL;
    io_object_t v6 = 0LL;
    io_registry_entry_t v7 = 0LL;
    id v8 = 0LL;
  }

LABEL_81:
  if (existing) {
    IOObjectRelease(existing);
  }

  return v1;
}

uint64_t sub_100016434(io_registry_entry_t a1)
{
  kern_return_t ParentEntry;
  void v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;
  unsigned int v12 = 0LL;
  __int128 v13 = &v12;
  int v14 = 0x2020000000LL;
  id v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  int v9 = (void (*)(void))sub_100016CD8;
  io_object_t v10 = &unk_10002CF88;
  io_registry_entry_t v11 = &v12;
  CFMutableDictionaryRef v2 = v8;
  int v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        io_registry_entry_t parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0) {
          break;
        }
        a1 = parent;
        if (!parent) {
          goto LABEL_3;
        }
        ((void (*)(void *, void, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v19 = ParentEntry & 0x3FFF;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryGetParentEntry failed: 0x%04x",  buf,  8u);
      }
    }
  }

LABEL_3:
  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_1000165F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

NSMutableDictionary *sub_100016614(int a1)
{
  CFMutableDictionaryRef v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v2)
  {
    uint64_t v3 = sub_100015668();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4) {
      -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v4);
    }
    unint64_t v5 = sub_100015990();
    io_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (v6) {
      -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v6);
    }
    io_registry_entry_t v7 = sub_100013CE0(a1);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](v2, "addEntriesFromDictionary:", v8);
    }
  }

  return v2;
}

id sub_1000166B4(void *a1)
{
  CFMutableDictionaryRef v1 = sub_100016760(@"MassStorage", @"DeviceNode", a1, 0);
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = v2;
  if (v2
    && [v2 count]
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]),
        id v5 = sub_100013118(v4),
        io_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v6,
        v4,
        v6))
  {
    io_registry_entry_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
  }

  else
  {
    io_registry_entry_t v7 = 0LL;
  }

  return v7;
}

NSMutableArray *sub_100016760(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v33 = a2;
  id v32 = a3;
  if (!v7 || !v33 || !v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid input(s).",  buf,  2u);
    }

    goto LABEL_26;
  }

  id v8 = sub_100016614(a4);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v26) {
      sub_10001EC40(v26, v27, v28);
    }
LABEL_26:
    uint64_t v31 = 0LL;
    uint64_t v29 = 0LL;
    __int128 v13 = 0LL;
    id v10 = 0LL;
    goto LABEL_32;
  }

  id v10 = (id)v9;
  uint64_t v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v31)
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v10 = v10;
    id v11 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v11)
    {
      id v12 = v11;
      id v35 = 0LL;
      __int128 v13 = 0LL;
      uint64_t v14 = *(void *)v37;
      do
      {
        id v15 = 0LL;
        id v34 = v12;
        do
        {
          uint64_t v16 = v13;
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v10);
          }
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * (void)v15)]);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"DeviceType"]);

          if (v13)
          {
            if ([v13 isEqual:v7])
            {
              uint64_t v18 = v14;
              id v19 = v10;
              id v20 = v7;
              int v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v33]);

              id v22 = sub_1000131C8(v21);
              uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
              if (v23)
              {
                id v24 = (void *)v23;
                unsigned int v25 = [v21 isEqual:v32];

                if (v25) {
                  -[NSMutableArray addObject:](v31, "addObject:", v17);
                }
              }

              id v35 = v21;
              id v7 = v20;
              id v10 = v19;
              uint64_t v14 = v18;
              id v12 = v34;
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = @"DeviceType";
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid value for %@.",  buf,  0xCu);
          }

          id v15 = (char *)v15 + 1;
        }

        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }

      while (v12);
    }

    else
    {
      id v35 = 0LL;
      __int128 v13 = 0LL;
    }

    uint64_t v29 = v35;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create array.",  buf,  2u);
    }

    uint64_t v31 = 0LL;
    uint64_t v29 = 0LL;
    __int128 v13 = 0LL;
  }

NSMutableArray *sub_100016AD4(void *a1, int a2)
{
  return sub_100016760(@"DiskImage", @"DiskImageType", a1, a2);
}

id sub_100016AF8(void *a1, int a2)
{
  id v3 = a1;
  id v4 = sub_100016614(a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  io_object_t v6 = v5;
  if (v5)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      unsigned int v25 = v6;
      id v10 = 0LL;
      uint64_t v11 = *(void *)v27;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v12)]);
        id v14 = sub_100013118(v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MountPath"]);

          id v10 = (void *)v16;
        }

        id v17 = sub_1000131C8(v10);
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          id v19 = (void *)v18;
          unsigned __int8 v20 = [v10 isEqualToString:v3];

          if ((v20 & 1) != 0) {
            break;
          }
        }

        if (v9 == (id)++v12)
        {
          id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v9) {
            goto LABEL_4;
          }
          __int128 v13 = 0LL;
          break;
        }
      }

      io_object_t v6 = v25;
    }

    else
    {
      id v10 = 0LL;
      __int128 v13 = 0LL;
    }
  }

  else
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v21) {
      sub_10001EC40(v21, v22, v23);
    }
    id v10 = 0LL;
    __int128 v13 = 0LL;
  }

  return v13;
}

void sub_100016CD8(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0LL, 0);
  if (CFProperty)
  {
    io_object_t v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      *a3 = 1;
    }

    CFRelease(v6);
  }

NSString *sub_100016D60(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = -[NSString initHexStringWithData:](objc_alloc(&OBJC_CLASS___NSString), "initHexStringWithData:", v3);
  io_object_t v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      id v8 = 0LL;
      id v7 = 0LL;
      id v9 = 0LL;
      goto LABEL_10;
    }

    *(_WORD *)buf = 0;
    id v10 = "Failed to create hex string with data.";
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }

  if ([v5 length] != (id)256
    && [v6 length] != (id)96
    && [v6 length] != (id)40)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = [v6 length];
    __int16 v16 = 2112;
    id v17 = v3;
    id v10 = "Unsupported signature length: %d characters (%@)";
    uint32_t v11 = 18;
    goto LABEL_8;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  id v9 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@/%@/%@", v4, v7, v8);
LABEL_10:
  uint64_t v12 = v9;

  return v12;
}

uint64_t sub_100016F44(const char *a1)
{
  if (strlen(a1) > 0x400) {
    goto LABEL_18;
  }
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  char v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  __int16 v16 = sub_100017B60;
  id v17 = &unk_10002CFD0;
  uint64_t v18 = buf;
  id v19 = a1;
  CFMutableDictionaryRef v2 = v15;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = [v3 stringWithFileSystemRepresentation:a1 length:strlen(a1)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  io_object_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathComponents]);
  id v7 = [v6 mutableCopy];

  if (v7)
  {
    id v8 = (char *)[v7 count];
    if (v8)
    {
      do
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v7));
        id v10 = v9;
        if (v9)
        {
          id v11 = v9;
          id v12 = [v11 fileSystemRepresentation];
          if (!((unsigned int (*)(void *, id))v16)(v2, v12))
          {

            break;
          }

          [v7 removeLastObject];
        }
      }

      while (--v8);
    }
  }

  int v13 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  if (v13 || !realpath_DARWIN_EXTSN(a1, __s1) || (uint64_t result = strcmp(__s1, a1), (_DWORD)result))
  {
LABEL_18:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Paths don't match: (%s/%s)",  buf,  0x16u);
    }

    return 1LL;
  }

  return result;
}

void sub_100017190(_Unwind_Exception *a1)
{
}

uint64_t sub_1000171B4(const char *a1, removefile_flags_t a2)
{
  int value = 0;
  id v4 = removefile_state_alloc();
  if (v4)
  {
    id v5 = v4;
    if (removefile_state_set(v4, 3u, sub_1000173EC)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      id v7 = __error();
      id v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      int v19 = v6;
      __int16 v20 = 2080;
      BOOL v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_set failed: %d (%s)",  buf,  0x12u);
    }

    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *__error();
      id v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      int v19 = v9;
      __int16 v20 = 2080;
      BOOL v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_set failed: %d (%s)",  buf,  0x12u);
    }

    if (removefile(a1, v5, a2))
    {
      uint64_t v12 = 0LL;
      if (*__error() != 2 || value) {
        goto LABEL_17;
      }
    }

    else if (value)
    {
      uint64_t v12 = 0LL;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }

    uint64_t v12 = 1LL;
    goto LABEL_17;
  }

  uint64_t v12 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *__error();
    id v14 = __error();
    unsigned int v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    int v19 = v13;
    __int16 v20 = 2080;
    BOOL v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_alloc failed: %d (%s)",  buf,  0x12u);
    return 0LL;
  }

  return v12;
}

uint64_t sub_1000173EC(_removefile_state *a1, const char *a2, int *a3)
{
  int dst = 0;
  memset(&v17, 0, sizeof(v17));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "removefile_state_get failed: %{errno}d",  buf,  8u);
    }

    int dst = 2;
    goto LABEL_17;
  }

  if (dst == 1)
  {
    if (lstat(a2, &v17))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *__error();
        id v7 = __error();
        id v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v6;
        __int16 v23 = 2080;
        id v24 = v8;
        int v9 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
      }
    }

    else
    {
      if ((v17.st_flags & 2) == 0) {
        goto LABEL_17;
      }
      if (lchflags(a2, v17.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v10 = *__error();
        id v11 = __error();
        uint64_t v12 = strerror(*v11);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 2080;
        id v24 = v12;
        int v9 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }

      if (!unlink(a2)) {
        return 0LL;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        id v14 = __error();
        unsigned int v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 2080;
        id v24 = v15;
        int v9 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }

NSString *sub_100017684(void *a1)
{
  id v1 = a1;
  CFMutableDictionaryRef v2 = v1;
  uint64_t v10 = 1LL;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Invalid input.";
      uint32_t v8 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
    }

id sub_1000177E0()
{
  if (qword_1000348A8 != -1) {
    dispatch_once(&qword_1000348A8, &stru_10002CFA8);
  }
  return (id)qword_1000348B0;
}

void sub_100017820(id a1)
{
  id v1 = sub_100017684(@"systemgroup.com.apple.mobilestorageproxy");
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"backingStore"]);
  id v3 = (void *)qword_1000348B0;
  qword_1000348B0 = v2;
}

uint64_t sub_100017874(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0LL;
  if (v5 && v6)
  {
    do
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
      if ([v9 isEqualToString:v7])
      {
        id v10 = [v5 code];

        if (v10 == a3)
        {
          uint64_t v8 = 1LL;
          goto LABEL_9;
        }
      }

      else
      {
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      id v5 = (id)v12;
    }

    while (v12);
    uint64_t v8 = 0LL;
  }

id sub_100017950(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  CFTypeRef CFProperty = 0LL;
  if (a1 && v3)
  {
    io_registry_entry_t v6 = IORegistryEntryFromPath( kIOMainPortDefault, (const char *)[a1 fileSystemRepresentation]);
    if (v6)
    {
      io_object_t v7 = v6;
      CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0LL, 0);
      IOObjectRelease(v7);
    }

    else
    {
      CFTypeRef CFProperty = 0LL;
    }
  }

  return CFProperty;
}

id sub_1000179E0(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  io_registry_entry_t v6 = v5;
  io_object_t v7 = 0LL;
  unsigned int v15 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v8 = v5;
  if (a2)
  {
    id v9 = sub_100017950(a1, a2);
    io_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v10 = sub_100013220(v7);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      id v13 = [v7 length];

      if (v13 == (id)4)
      {
        [v7 getBytes:&v15 length:4];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));

        goto LABEL_7;
      }
    }

LABEL_6:
    uint64_t v8 = v6;
  }

LABEL_7:
  return v8;
}

uint64_t sub_100017AB4(io_object_t *a1, const char *a2)
{
  uint64_t v2 = 0LL;
  io_iterator_t iterator = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      uint64_t v2 = 0LL;
    }

    else
    {
      while (1)
      {
        uint64_t v5 = IOIteratorNext(iterator);
        uint64_t v2 = v5;
        if (!(_DWORD)v5) {
          break;
        }
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          uint64_t v2 = 1LL;
          break;
        }

        IOObjectRelease(v2);
      }
    }

    if (iterator) {
      IOObjectRelease(iterator);
    }
  }

  return v2;
}

uint64_t sub_100017B60(uint64_t a1)
{
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    uint64_t result = 1LL;
    if ((v8.st_mode & 0xF000) != 0xA000) {
      return result;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  if (*__error() == 2) {
    return 1LL;
  }
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *__error();
    io_registry_entry_t v6 = __error();
    io_object_t v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2080;
    int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "lstat failed for %s: %d (%s)",  buf,  0x1Cu);
    return 0LL;
  }

  return result;
}

void sub_100017CA8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100017CB4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100020CC8, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100020ED6, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust( unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0LL;
  __int128 v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }

  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1LL;
  }
  unsigned int v5 = 0;
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010LL)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }

          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0LL);
            if (!(_DWORD)result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }

          else
          {
            return 7LL;
          }
        }

        else
        {
          return 2LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject( a1,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)a2,  0x20uLL,  0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1) {
            return 0LL;
          }
          else {
            return 6LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else if (!*(void *)(a2 + 80) {
               || (__int128 v7 = 0u,
        }
                   __int128 v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0LL;
          }
          __int128 v7 = 0u;
          __int128 v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0LL;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }

    else
    {
      __int128 v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      __int128 v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = v8;
      __int128 v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }

  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_1000185C4(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0LL;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }

    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0LL);
    if (!(_DWORD)result)
    {
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v9 > 2) {
        return 2LL;
      }
      return 0LL;
    }
  }

  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              __int128 v16 = 0u;
              __int128 v17 = 0u;
              __int128 v14 = 0u;
              __int128 v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011LL) {
                  return 2LL;
                }
                if (!DERParseSequenceContentToObject( &v19,  2u,  (uint64_t)&DERIM4CItemSpecs,  (unint64_t)&v16,  0x20uLL,  0LL))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010LL) {
                    return 2LL;
                  }
                  if (!DERParseSequenceContentToObject( &v19,  2u,  (uint64_t)&DERCRTPSequenceItemSpecs,  (unint64_t)&v14,  0x20uLL,  0LL))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0LL;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }

                    return 2LL;
                  }
                }

                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0LL;
      __int128 v15 = 0uLL;
      __int128 v13 = 0uLL;
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010LL) {
          return 2LL;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result) {
          return result;
        }
        if (v14 != 22) {
          return 2LL;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result) {
          return result;
        }
        if ((v8 | 0xE000000000000000LL) != a2) {
          return 2LL;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1) {
          return 2LL;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }

        else if (v11 == *a1 + v7)
        {
          return 0LL;
        }

        else
        {
          return 7LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0LL;
  v9[2] = 0LL;
  v9[1] = 22LL;
  v9[3] = 24LL;
  __int128 v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000LL) == a2)
      {
        uint64_t result = 0LL;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000LL;
        *(void *)(a4 + 40) = a3;
      }

      else
      {
        return 2LL;
      }
    }
  }

  return result;
}

void DERImg4DecodeFindPropertyInSequence( unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  __int128 v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0LL;
  v7[1] = 0LL;
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_100018B50(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0LL;
      v15[0] = 0LL;
      v15[1] = 0LL;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011LL
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010LL : 0x2000000000000011LL;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000LL, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty( (unint64_t *)&v13[1] + 1,  0xE00000004D414E50LL,  0x2000000000000011uLL,  (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  v16[0] = 0LL;
  v16[1] = 0LL;
  v14[1] = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0LL;
  v14[0] = 0LL;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010LL) {
            return 2LL;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7LL;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }

              else
              {
                uint64_t result = 0LL;
                *a4 = v10;
              }

              return result;
            }

            return 2LL;
          }
        }

        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6LL;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }

  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }

  uint64_t result = 1LL;
  if (!a2) {
    return result;
  }
LABEL_7:
  if ((_DWORD)result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6LL;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1LL;
    goto LABEL_14;
  }

  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }

    return result;
  }

  uint64_t result = DERParseSequenceContentToObject( v7,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)&v9,  0x20uLL,  0LL);
  if ((_DWORD)result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }

  return result;
}

double Img4DecodeCopyPayloadHashWithCallback( uint64_t a1, void (*a2)(void, void, __int128 *), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    return *(double *)&v7;
  }

  BOOL v9 = 0;
  if (*(_BYTE *)a1)
  {
    __int128 v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }

  else
  {
    __int128 v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&__int128 v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }

  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest( uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7LL;
                }

                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0LL;
                }

                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }

              else
              {
                return 1LL;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(void *)(a1 + 24) != 0LL;
    }
  }

  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    return *(double *)&v5;
  }

  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 1))
  {
    __int128 v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }

  else
  {
    a2();
    *(void *)&__int128 v5 = 0LL;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }

  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest( uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          __int128 v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7LL;
              }

              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0LL;
              }

              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }

            else
            {
              return 1LL;
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }

  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6LL;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }

    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }

    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0LL;
    *a3 = v4;
  }

  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
      uint64_t v4 = v6;
      if (!(_DWORD)v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }

  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6LL;
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = 6LL;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result) {
        *a2 = (void)v8 != 0LL;
      }
    }
  }

  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v10 = 0uLL;
        __int128 v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010LL, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0uLL;
    __int128 v9 = 0uLL;
    __int128 v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v19 = 0uLL;
        __int128 v20 = 0uLL;
        __int128 v17 = 0uLL;
        __int128 v18 = 0uLL;
        __int128 v15 = 0uLL;
        __int128 v16 = 0uLL;
        __int128 v13 = 0uLL;
        __int128 v14 = 0uLL;
        __int128 v11 = 0uLL;
        __int128 v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010LL, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  if (!a1) {
    return 6LL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t result = 6LL;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((void)v9)
        {
          uint64_t result = 0LL;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }

        return 6LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest( void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7LL;
    }

    else if (a4)
    {
      __int128 v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0LL;
        }
      }
    }
  }

  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v22[0] = 0LL;
    v22[1] = 0LL;
    v21[0] = 0LL;
    v21[1] = 0LL;
    unint64_t v20 = 0LL;
    v19[0] = 0LL;
    v19[1] = 0LL;
    unint64_t v18 = 0LL;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    unint64_t v14 = 0LL;
    __int128 v13 = 0uLL;
    __int128 v12 = 0uLL;
    __int128 v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010LL, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22LL, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011LL, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }

                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22LL, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }

                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0LL;
  v14[1] = 0LL;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0LL);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000LL, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
    if (!(_DWORD)v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }

  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
    }
  }

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
    }
  }

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }

    *a5 = v8;
  }

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }

    *a5 = v8;
  }

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0LL;
    v15[0] = 0LL;
    v15[1] = 0LL;
    memset(v13, 0, sizeof(v13));
    __int128 v12 = 0uLL;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0LL;
      *a3 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }

    *a4 = v8;
  }

double Img4DecodeGetPropertyFromSection( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)__int128 v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)__int128 v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }

      DERImg4DecodeParseManifestProperties(a1, 0LL, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }

    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }

  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) != 2LL)
    {
      uint64_t result = 2LL;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }

    if (!a3) {
      return 6LL;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }

  if (!a3) {
    return result;
  }
LABEL_6:
  if ((_DWORD)result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) != 2LL)
    {
      uint64_t result = 2LL;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }

    if (!a3) {
      return 6LL;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }

  if (!a3) {
    return result;
  }
LABEL_6:
  if ((_DWORD)result) {
    *a3 = 0LL;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) == 1LL)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6LL;
      }
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  uint64_t result = 6LL;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000LL, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((void *)&v14 + 1) == 4LL)
      {
        uint64_t result = 0LL;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }

      uint64_t result = 2LL;
    }

    int v10 = 0;
    *a3 = 0LL;
    goto LABEL_6;
  }

  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_10001A5A4(void *a1, _OWORD *a2)
{
  v21[0] = 0LL;
  v21[1] = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  uint64_t v19 = 0LL;
  __int128 v18 = 0uLL;
  size_t __n = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v14 = 0LL;
  __s1 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __int128 __s2 = 0uLL;
  __int128 v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011LL)
  {
    while (1)
    {
      uint64_t v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50LL:
LABEL_11:
          __int128 v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011LL
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }

          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1LL << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }

            else if (*((void *)&v10 + 1) != 0xA000000000000000LL)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001LL || v6 != 1) {
                return;
              }
              int v6 = 0;
            }

            if (v6) {
              return;
            }
          }

          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78LL:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50LL:
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement( void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&__int128 v13 = &unk_100022178;
        *((void *)&v13 + 1) = 156LL;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        sub_10001A5A4(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              __int128 v12 = v17;
              if (!((unsigned int (*)(void, _BYTE **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties( a1 + 7,  0LL,  (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))sub_10001B69C,  (uint64_t)v11)
                && !((unsigned int (*)(void, _BYTE **, uint64_t, _BYTE *))v15[2])( *(void *)(v14 + 32),  &v12,  48LL,  v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeEvaluateManifestProperties( uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0LL, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties( unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v14 = 0LL;
  v13[0] = 0LL;
  v13[1] = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  memset(v8, 0, sizeof(v8));
  __int128 v9 = 0u;
  if (!a3) {
    return 6LL;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1) {
        return 0LL;
      }
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = 2LL;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1LL << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000LL) == 0)
      {
        return result;
      }

      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 7LL;
  }

  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties( uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1LL, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      __int128 v5 = 0u;
      __int128 v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 20_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 28_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 36_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 44_Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }

  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&__int128 v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 20_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 28_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 36_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 44_Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + _Block_object_dispose((const void *)(v1 - 128), 8) = v5;
    }
  }

  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_10001AC70(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 12_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 20_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 28_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 36_Block_object_dispose((const void *)(v1 - 128), 8) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 44_Block_object_dispose((const void *)(v1 - 128), 8) = 0LL;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }

    else
    {
      if (a5 != 1229796429) {
        return 2LL;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }

    if (!(_DWORD)result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0LL);
        if (!(_DWORD)result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }

          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0LL;
            }
            else {
              return 7LL;
            }
          }
        }
      }

      else
      {
        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3LL;
    }
  }

  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks( unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4( *(void *)(a2 + 296),  *(unsigned int *)(a2 + 304),  *(void *)(a2 + 280),  *(unsigned int *)(a2 + 288),  a2 + 376,  20LL,  a2 + 312,  a2 + 320,  a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty( (unint64_t *)(a2 + 40),  a1 | 0xE000000000000000LL,  0x2000000000000011uLL,  (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }

                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0LL, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1LL, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[0] = a3;
  sub_10001B3D8(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[0] = a3;
  sub_10001B3D8(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = 0LL;
  __int128 v39 = 0u;
  memset(v40, 0, sizeof(v40));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
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
  uint64_t result = 6LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (sub_10001AC70(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)( *((void *)&v33 + 1),  v34,  (char *)v40 + 8,  **(void **)(a9 + 32),  a9)
      || (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))( a1,  a2,  *((void *)&v34 + 1),  v35,  (char *)v40 + 8,  **(void **)(a9 + 32),  a9,  a10,  v17,  *((void *)&v17 + 1),  v18,  *((void *)&v18 + 1),  v19,  *((void *)&v19 + 1),  v20,  *((void *)&v20 + 1),  v21,  *((void *)&v21 + 1),  v22,  *((void *)&v22 + 1),  v23,  *((void *)&v23 + 1),  v24,  *((void *)&v24 + 1),  v25,  *((void *)&v25 + 1),  v26,  *((void *)&v26 + 1),  v27,  *((void *)&v27 + 1),  v28,  *((void *)&v28 + 1),  v29,  *((void *)&v29 + 1),  v30,  *((void *)&v30 + 1),  v31,  *((void *)&v31 + 1),  v32,  *((void *)&v32 + 1),  v33))
    {
      return 0xFFFFFFFFLL;
    }

    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_10001B3D8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0LL
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }

                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))( *(void *)(a2 + 296),  *(void *)(a2 + 304),  &v22,  &v23,  a2 + 312,  a2 + 320,  a4,  a6)
                          || **(void **)(a4 + 32) > 0x30uLL
                          || (*(unsigned int (**)(void, void, uint64_t))a4)( *(void *)(a2 + 264),  *(void *)(a2 + 272),  a2 + 376)
                          || (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))( v22,  v23,  *(void *)(a2 + 280),  *(void *)(a2 + 288),  a2 + 376,  **(void **)(a4 + 32),  a4,  a6))
                        {
                          return;
                        }

                        int v15 = 1;
                      }

                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        __int128 v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000LL;
                        __int128 v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011LL, v24, a6)) {
                            return;
                          }
                        }

                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }

                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }

                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)( *(void *)(a2 + 8),  *(void *)(a2 + 16),  a2 + 184,  **(void **)(a4 + 32),  a4))
                          {
                            return;
                          }

                          *(_BYTE *)a2 = 1;
                        }

                        if (!Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 56),  0LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6)
                          && (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 72),  1LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10001B69C(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void **)a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  v12[0] = 0LL;
  v12[1] = 0LL;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78LL, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011LL
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000LL;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24LL) + 8LL))( *(void *)(*(void *)(*(void *)a4 + 16LL) + 32LL),  a4 + 24,  4LL,  &v10);
        return 0LL;
      }
    }
  }

  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24LL) + 8LL))( *(void *)(*(void *)(*(void *)a4 + 16LL) + 32LL),  a4 + 24,  *(unsigned int *)(a2 + 8),  *(void *)a2);
  return 0LL;
}

uint64_t sha1_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ccdigest(sha1_digest_info, a2, a1, a3);
}

uint64_t verify_signature_rsa3k( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_10001B854((uint64_t)v13, v9[4], v11, v12, 3072LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10001B854(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v24[0] = 0LL;
  v24[1] = 0LL;
  unint64_t v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  uint64_t v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  unint64_t *v11 = v9;
  uint64_t v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(void *)a1;
  v23[1] = v12;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t result = DERParseSequenceToObject( (uint64_t)v23,  (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs,  (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs,  (unint64_t)&v21,  0x20uLL,  0x20uLL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v14 = *((void *)&v21 + 1);
  __int128 v15 = (_BYTE *)v21;
  for (__int128 i = v22; v14; --v14)
  {
    if (*v15) {
      break;
    }
    if (v15 == (_BYTE *)-1LL) {
      __break(0x5513u);
    }
    ++v15;
  }

  if (v14 >= 0xFFFFFFFFFFFFFFF8LL)
  {
    __break(0x5500u);
    return result;
  }

  unint64_t v17 = (v14 + 7) >> 3;
  if (v17 > *v11) {
    return 0xFFFFFFFFLL;
  }
  unint64_t *v11 = v17;
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v18 = &CCRSA_PKCS1_FAULT_CANARY == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    int v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    return 0xFFFFFFFFLL;
  }

  LOBYTE(v21) = 0;
  int v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21) {
    return 0LL;
  }
  return result;
}

uint64_t verify_signature_rsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_10001B854((uint64_t)v13, v9[4], v11, v12, 4096LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6)
                  {
                    v10[0] = a1;
                    v10[1] = a2;
                    v9[0] = a3;
                    v9[1] = a4;
                    v8[0] = a5;
                    v8[1] = a6;
                    sub_10001BB80(v10, v8, v9);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void sub_10001BB80(void *a1, void *a2, void *a3)
{
  char v18 = 0;
  uint64_t v6 = ccec_x963_import_pub_size(a1[1]);
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp(v6);
    uint64_t v8 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v8, 3uLL))
    {
      __break(0x550Cu);
    }

    else
    {
      uint64_t v9 = 24 * v8;
      BOOL v10 = __CFADD__(v9, 16LL);
      uint64_t v11 = v9 + 16;
      if (!v10)
      {
        BOOL v10 = __CFADD__(v11, 16LL);
        uint64_t v12 = v11 + 16;
        if (!v10)
        {
          __int128 v13 = cp;
          unint64_t v14 = v12 - 1;
          __chkstk_darwin();
          int v16 = &v17[-v15];
          bzero(&v17[-v15], v15);
          if (v14 < 0x10)
          {
            __break(1u);
          }

          else
          {
            void *v16 = v13;
          }

          return;
        }
      }
    }

    __break(0x5500u);
  }

uint64_t verify_chain_img4_v1( unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215LL;
        if (!sub_10001D164(v26, (uint64_t)v27, 3u)
          && !sub_10001BFC8((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          __int128 v24 = a6;
          uint64_t v15 = 0LL;
          int v16 = (const void **)v32;
          unint64_t v17 = &v30;
          char v18 = (const void **)v32;
          while (1)
          {
            int v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            __int128 v21 = *v18;
            v18 += 20;
            uint64_t result = sub_10001C22C(&v34[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              __int128 v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }

              v42[0] = 0LL;
              v42[1] = 0LL;
              unint64_t v40 = 0LL;
              v41[0] = 0LL;
              v41[1] = 0LL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011LL)
              {
                v47[0] = 0LL;
                v47[1] = 0LL;
                unint64_t v45 = 0LL;
                v46[0] = 0LL;
                v46[1] = 0LL;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }

                    if (v45 != 0x2000000000000010LL
                      || DERParseSequenceContentToObject( v46,  (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs,  (uint64_t)&DERAttributeTypeAndValueItemSpecs,  (unint64_t)&v43,  0x20uLL,  0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }

                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  __int128 v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_10002D558, (uint64_t)&v25);
                  if (!(_DWORD)result) {
                    return 0xFFFFFFFFLL;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if (!v38) {
                    return 0LL;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0LL;
                  }
                  uint64_t result = 0LL;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0LL;
                      *a5 = v38;
                      *__int128 v24 = v23;
                    }
                  }

                  return result;
                }
              }

              return 0xFFFFFFFFLL;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_10001BFC8(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( v15 + 16 * v8,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + 48 * v8,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + 48 * v8,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + 160 * v8,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    char v21 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + 160 * v8 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v22,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v22,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v19,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2LL || *(_BYTE *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1LL) {
        break;
      }
      if (*(_BYTE *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_10001D23C(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_10001C22C(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  __int128 v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject( a2 + 2,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v11,  0x20uLL,  0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }

  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2LL || *(_BYTE *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1LL)
      {
        __break(0x5513u);
        return result;
      }

      if (*(_BYTE *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)( *a2,  a2[1],  v13,  **(void **)(a3 + 32),  a3))
  {
    return 0xFFFFFFFFLL;
  }

  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))( *a1,  a1[1],  v8,  v9,  v13,  **(void **)(a3 + 32),  a3,  0LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C56C);
}

uint64_t sub_10001C3DC( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2LL)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = sub_10001BFC8((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }

        else
        {
          char v16 = 1;
          uint64_t v17 = 1LL;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = sub_10001C22C(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2LL;
              if (!(_DWORD)result) {
                continue;
              }
            }

            return 0xFFFFFFFFLL;
          }

          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }

          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0LL;
            if (a5 && a6)
            {
              uint64_t result = 0LL;
              *a5 = v29;
              *a6 = v19;
            }
          }

          else
          {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10001C56C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C5AC);
}

uint64_t sub_10001C5AC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_global( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C5EC);
}

uint64_t sub_10001C5EC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_fake( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C62C);
}

uint64_t sub_10001C62C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_fake_global( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C66C);
}

uint64_t sub_10001C66C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_avp( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C6AC);
}

uint64_t sub_10001C6AC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C6EC);
}

uint64_t sub_10001C6EC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C72C);
}

uint64_t sub_10001C72C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_rsa3k( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C76C);
}

uint64_t sub_10001C76C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C7AC);
}

uint64_t sub_10001C7AC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_AWG1( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C7EC);
}

uint64_t sub_10001C7EC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_PED( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C3DC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001C82C);
}

uint64_t sub_10001C82C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ec_v1( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3LL)
          && !sub_10001CA10( (uint64_t)v27,  3u,  (uint64_t)&v28,  (uint64_t)&v30,  (unint64_t)v32,  (unint64_t)&v35,  (uint64_t)v36))
        {
          __int128 v25 = a4;
          uint64_t v15 = 0LL;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            uint64_t result = sub_10001C22C(&v32[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, void *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }

              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0LL;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0LL;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }

              else
              {
                return 0LL;
              }

              return result;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_10001CA10( uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16LL * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject( v21 + v11,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + v10,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + v10,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + v9,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    char v30 = 0;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + v9 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v31,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v31,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v28,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    void *v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = sub_10001D23C(a4 + v9, (void *)(a7 + v11));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16LL;
    v10 += 48LL;
    v9 += 160LL;
    if (v15 == v11) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001CC8C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001CE0C);
}

uint64_t sub_10001CC8C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2LL)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_10001CA10( (uint64_t)v20,  2u,  (uint64_t)v21,  (uint64_t)v23,  (unint64_t)v28,  (unint64_t)&v29,  (uint64_t)v30);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }

  uint64_t result = sub_10001C22C(v28, v22, a7);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if (!v31) {
    return 0LL;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0LL;
      *a5 = v31;
      *a6 = v17;
    }
  }

  return result;
}

uint64_t sub_10001CE0C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001CC8C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001CE4C);
}

uint64_t sub_10001CE4C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001CEA4);
}

uint64_t sub_10001CEA4(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001CE4C);
}

uint64_t verify_chain_img4_ecdsa384_qa( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_10001CF20);
}

uint64_t sub_10001CF20(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540LL;
  else {
    return 0LL;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = *(void **)(a1 + 16);
  if (!v2 || !*v2) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init(*v2, *a2);
  return 0LL;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = **(void **)(a1 + 16);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update(v2, *a2);
  return 0LL;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0LL;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void **)v8[2]) != 0LL && *v8 == a4 && (v10 = *v9) != 0LL && *v10 == a4)
    {
      ccdigest(v10, a2, a1, a3);
      return 0LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t img4_verify_signature_with_chain( unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10001D164(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16LL * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0LL;
      }
      return 0xFFFFFFFFLL;
    }
  }

  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_10001D23C(uint64_t a1, void *a2)
{
  v11[0] = 0LL;
  v11[1] = 0LL;
  v9[1] = 0LL;
  uint64_t v10 = 0LL;
  unint64_t v8 = 0LL;
  v9[0] = 0LL;
  __int128 v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(a1 + 152)) {
    return 0LL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010LL
      || DERParseSequenceContentToObject( v9,  (unsigned __int16)DERNumExtensionItemSpecs,  (uint64_t)&DERExtensionItemSpecs,  (unint64_t)v6,  0x30uLL,  0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }

    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }

  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  int v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            uint64_t result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          __int128 v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  int v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_54;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3LL;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7LL;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0LL;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }

        goto LABEL_55;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }

      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3LL;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }

LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  *a3 = 0;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(result + 8)) {
    return 3LL;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }

      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }

      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1LL)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }

        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0LL;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }

        goto LABEL_19;
      }
    }

    return 3LL;
  }

  if (v3) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3LL;
  }
  uint64_t result = 0LL;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0LL;
      *a3 = a2;
      return result;
    }
  }

  return 3LL;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008LL)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }

      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0LL;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }

      __break(0x5519u);
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent( unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0LL);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012LL >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }

  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result) {
      break;
    }
    if (v7) {
      return 0LL;
    }
  }

  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }

  return result;
}

void sub_10001E0A0()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IONotificationPortCreate failed.",  v0,  2u);
  }

  sub_100008B6C();
}

void sub_10001E0F4(void *a1)
{
  id v1 = sub_100009A14(a1);
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100008B50();
  sub_100008B34( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "new xpc connection: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100008B44();
}

void sub_10001E170()
{
}

void sub_10001E188(void *a1, uint64_t a2)
{
  id v3 = sub_100009A14(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100008B50();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Processing XPC request [%@]: %@",  v5,  0x16u);

  sub_100008B44();
}

void sub_10001E220(uint64_t a1)
{
  id v1 = sub_100009A14(*(void **)(a1 + 32));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100008B50();
  sub_100008B34( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "connection closed: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100008B44();
}

void sub_10001E2A0()
{
}

void sub_10001E308()
{
}

void sub_10001E370( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E3A4()
{
}

void sub_10001E40C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E440()
{
}

void sub_10001E4B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E4EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E524()
{
  uint64_t v1 = @"_AdditionalProperties";
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Job '%@' lacks a '%@' dictionary.",  v0,  0x16u);
}

void sub_10001E5A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E638( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E6C8()
{
}

void sub_10001E730()
{
}

void sub_10001E798( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E814(uint64_t a1, int __errnum)
{
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = __errnum;
  __int16 v6 = 2080;
  uint64_t v7 = strerror(__errnum);
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to uninstall cryptex (%s): %d (%s)",  (uint8_t *)&v2,  0x1Cu);
}

void sub_10001E8C0()
{
  sub_10001286C((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
  sub_100008B74();
}

void sub_10001E930()
{
  sub_10001286C((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
  sub_100008B74();
}

void sub_10001E9A0()
{
  sub_10001286C((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
  sub_100008B74();
}

void sub_10001EA10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001286C((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, a3, "FDSET[%lld] = %d", a5, a6, a7, a8, 0);
  sub_100008B74();
}

void sub_10001EA88(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_100017CB4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "Skipping %@, as we didn't mount it.",  a1);
}

void sub_10001EAC8(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to load version dictionary at %@ (image version: %@).",  (uint8_t *)&v2,  0x16u);
}

void sub_10001EB50(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100017CA8((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, a3, "Ignoring EFI partition.", a1);
}

void sub_10001EB88(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100017CA8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Ignoring Apple_partition_map partition.",  a1);
}

void sub_10001EBC0(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_100017CB4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "The attached media %@ is not a leaf, ignoring.",  a1);
}

void sub_10001EC00(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_100017CB4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "The attached media %@ is not removable, ignoring.",  a1);
}

void sub_10001EC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100017CA8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Failed to retrieve the list of attached devices.",  v3);
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}