void start()
{
  id v0;
  dispatch_queue_s *v1;
  _xpc_connection_s *mach_service;
  dispatch_time_t v3;
  id v4;
  dispatch_queue_s *v5;
  sub_1000013EC();
  v0 = sub_100001414();
  v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v1, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_100004270);
  xpc_connection_activate(mach_service);
  v3 = dispatch_time(0LL, 10000000000LL);
  v4 = sub_100001414();
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_after(v3, v5, &stru_1000042B0);

  dispatch_main();
}

void sub_1000013EC()
{
  if (qword_100008098 != -1) {
    dispatch_once(&qword_100008098, &stru_1000042D0);
  }
}

id sub_100001414()
{
  if (qword_1000080B0 != -1) {
    dispatch_once(&qword_1000080B0, &stru_100004310);
  }
  return (id)qword_1000080A8;
}

void sub_100001454(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    id v3 = sub_10000291C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = xpc_connection_get_pid(v2);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "XPC: Client started new connection: pid %d",  (uint8_t *)v8,  8u);
    }

    v5 = v2;
    id v6 = sub_100001414();
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    xpc_connection_set_target_queue(v5, v7);

    xpc_connection_set_event_handler(v5, &stru_100004330);
    xpc_connection_activate(v5);
  }
}

void sub_100001560(id a1)
{
  id v1 = sub_10000291C();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Calling xpc_transaction_exit_clean() now", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_1000015C8(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v2);
  v4 = (void *)qword_1000080A0;
  qword_1000080A0 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000080A0, &stru_1000042F0);
  dispatch_activate((dispatch_object_t)qword_1000080A0);
}

void sub_100001634(id a1)
{
  id v1 = sub_10000291C();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_source_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received SIGTERM, exiting", v3, 2u);
  }

  exit(0);
}

void sub_100001690(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.hangtelemetry", 0LL);
  v2 = (void *)qword_1000080A8;
  qword_1000080A8 = (uint64_t)v1;
}

void sub_1000016BC(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    dispatch_source_t v3 = v2;
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "command");
    if (uint64 == 1)
    {
      if (qword_1000080B8 != -1) {
        dispatch_once(&qword_1000080B8, &stru_100004350);
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v3);
      v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      v8 = v7;
      if (reply && v7)
      {
        xpc_connection_send_message(v7, reply);
      }

      else
      {
        id v11 = sub_10000291C();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_10000298C(reply != 0LL, v12);
        }
      }
    }

    else
    {
      uint64_t v9 = uint64;
      id v10 = sub_10000291C();
      xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)reply, OS_LOG_TYPE_FAULT)) {
        sub_100002A1C(v9, (os_log_s *)reply);
      }
    }
  }
}

void sub_1000017E4(id a1)
{
  int v1 = sub_10000283C();
  id v2 = sub_10000291C();
  dispatch_source_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100002A8C(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_54;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "New boot: Refreshing telemetry metadata and saving in settings",  buf,  2u);
  }

  if (qword_1000080C8 != -1) {
    dispatch_once(&qword_1000080C8, &stru_100004370);
  }
  unsigned int v12 = (unsigned __int16)word_1000080C0;
  if (qword_1000080D0 != -1) {
    dispatch_once(&qword_1000080D0, &stru_100004390);
  }
  uint64_t v13 = dword_1000080D8;
  size_t v43 = 8LL;
  v44 = 0LL;
  int v14 = sysctlbyname("kern.roots_installed", &v44, &v43, 0LL, 0LL);
  id v15 = sub_10000291C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to get installed root info kern.roots_installed: %{errno}d",  buf,  8u);
    }
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v46 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Installed root info kern.roots_installed: %llu",  buf,  0xCu);
    }

    if (v44)
    {
      unsigned int v28 = 257;
      word_1000080DC = 257;
      goto LABEL_33;
    }
  }

  if (objc_opt_class(&OBJC_CLASS___DUSession))
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___DUSession);
    id v42 = 0LL;
    unsigned __int8 v20 = [v19 openAndReturnError:&v42];
    id v21 = v42;
    id v22 = v21;
    if ((v20 & 1) == 0)
    {
      id v29 = sub_10000291C();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v22;
        v27 = "Unable to open darwinup: %@";
        goto LABEL_27;
      }

LABEL_28:
      unsigned int v28 = (unsigned __int16)word_1000080DC;
      goto LABEL_33;
    }

    id v41 = 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v19 allInstalledRootsAndReturnError:&v41]);
    id v22 = v41;
    id v24 = sub_10000291C();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (!v23 && v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v22;
        v27 = "Unable to get all installed roots via darwinup: %@";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        goto LABEL_28;
      }

      goto LABEL_28;
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100002B44(v23, v26);
    }

    LOBYTE(word_1000080DC) = 1;
    HIBYTE(word_1000080DC) = [v23 count] != 0;
  }

  else
  {
    word_1000080DC = 1;
  }

  unsigned int v28 = (unsigned __int16)word_1000080DC;
LABEL_33:
  if (qword_1000080E0 != -1) {
    dispatch_once(&qword_1000080E0, &stru_1000043B0);
  }
  unsigned int v30 = (unsigned __int16)word_1000080DE;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v31, "addObject:", @"HangTracerTelemetryBootSessionUUID");
  if ((v30 & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v30 >> 8) & 1));
    -[os_log_s setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v33,  @"HangTracerTelemetryHaveNonDefaultFeatureFlags");

    if ((v12 & 1) != 0) {
      goto LABEL_37;
    }
  }

  else
  {
    -[NSMutableArray addObject:](v31, "addObject:", @"HangTracerTelemetryHaveNonDefaultFeatureFlags");
    if ((v12 & 1) != 0)
    {
LABEL_37:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v12 >> 8) & 1));
      -[os_log_s setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v32,  @"HangTracerTelemetrySerialLoggingEnabled");

      goto LABEL_40;
    }
  }

  -[NSMutableArray addObject:](v31, "addObject:", @"HangTracerTelemetrySerialLoggingEnabled");
LABEL_40:
  if ((int)v13 < 1)
  {
    -[NSMutableArray addObject:](v31, "addObject:", @"HangTracerTelemetryNumOSCryptexFileExtents");
    if ((v28 & 1) == 0) {
      goto LABEL_42;
    }
LABEL_44:
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v28 >> 8) & 1));
    -[os_log_s setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v35,  @"HangTracerTelemetryHaveRootsInstalled");

    goto LABEL_45;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
  -[os_log_s setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v34,  @"HangTracerTelemetryNumOSCryptexFileExtents");

  if ((v28 & 1) != 0) {
    goto LABEL_44;
  }
LABEL_42:
  -[NSMutableArray addObject:](v31, "addObject:", @"HangTracerTelemetryHaveRootsInstalled");
LABEL_45:
  CFPreferencesSetMultiple(v4, (CFArrayRef)v31, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  v36 = sem_open("hangtelemetryd.onceatboot", 2560, 292LL, 1LL);
  if (v36 == (sem_t *)-1LL)
  {
    int v37 = *__error();
    id v38 = sub_10000291C();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    v40 = v39;
    if (v37 == 17)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "HTTelemetrySetRanThisBoot called twice",  buf,  2u);
      }
    }

    else if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      sub_100002ABC(v40);
    }
  }

  else
  {
    sem_close(v36);
  }

  notify_post(off_100008090);

LABEL_54:
}

void sub_100001DE8(id a1)
{
  vm_size_t v1 = vm_page_size;
  __chkstk_darwin(a1);
  id v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  size_t v37 = v1;
  int v3 = sysctlbyname("kern.bootargs", v2, &v37, 0LL, 0LL);
  size_t v4 = v37;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v37 >= v1;
  }
  if (v5)
  {
    id v6 = sub_10000291C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to get kern.bootargs: %{errno}d",  buf,  8u);
    }
  }

  else
  {
    v2[v37] = 0;
    LOBYTE(word_1000080C0) = 1;
    if (v4 < 9)
    {
LABEL_28:
      id v18 = sub_10000291C();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100002C2C(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      BOOL v27 = 0;
    }

    else
    {
      size_t v9 = 0LL;
      while (1)
      {
        uint64_t v10 = &v2[v9];
        if (!strncmp(&v2[v9], "serial=", 7uLL)) {
          break;
        }
        if (v9 < v4)
        {
          while (1)
          {
            unsigned int v11 = v2[v9];
            BOOL v12 = v11 > 0x20;
            uint64_t v13 = (1LL << v11) & 0x100000201LL;
            if (!v12 && v13 != 0) {
              break;
            }
            if (v4 == ++v9)
            {
LABEL_26:
              size_t v9 = v4;
              goto LABEL_27;
            }
          }
        }

        if (v9 < v4)
        {
          while (1)
          {
            unsigned int v15 = v2[v9];
            BOOL v12 = v15 > 0x20;
            uint64_t v16 = (1LL << v15) & 0x100000201LL;
            if (v12 || v16 == 0) {
              break;
            }
            if (v4 == ++v9) {
              goto LABEL_26;
            }
          }
        }

LABEL_27:
        if (v9 + 8 >= v4) {
          goto LABEL_28;
        }
      }

      *__error() = 0;
      unsigned int v28 = v10 + 7;
      unint64_t v29 = strtoull(v10 + 7, 0LL, 0);
      int v30 = *__error();
      id v31 = sub_10000291C();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v30)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = *__error();
          *(_DWORD *)buf = 136315394;
          v39 = v28;
          __int16 v40 = 1024;
          int v41 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Non-integer serial=%s (error %{errno}d), assuming enabled",  buf,  0x12u);
        }

        BOOL v27 = 1;
      }

      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_100002BC4(v29, v33, v35);
        }

        BOOL v27 = v29 != 0;
      }
    }

    HIBYTE(word_1000080C0) = v27;
  }
}

void sub_1000020B4(id a1)
{
  vm_size_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSUDataAccessor sharedDataAccessor](&OBJC_CLASS___MSUDataAccessor, "sharedDataAccessor"));
  id v34 = 0LL;
  id v2 = [v1 copyPathForPersonalizedData:11 error:&v34];
  id v3 = v34;

  if (!v2)
  {
    id v16 = sub_10000291C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    v42.st_dev = 138412290;
    *(void *)&v42.st_mode = v3;
    id v18 = "Unable to get path for MSUDA_CRYPTEX1_OS_CRYPTEX: (%@)";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v42, 0xCu);
    goto LABEL_21;
  }

  id v4 = v2;
  BOOL v5 = (const char *)[v4 fileSystemRepresentation];
  if (!v5)
  {
    id v19 = sub_10000291C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    v42.st_dev = 138412290;
    *(void *)&v42.st_mode = v4;
    id v18 = "Unable to get fileSystemRepresentation for cryptex path %@";
    goto LABEL_15;
  }

  uint64_t v6 = (uint64_t)v5;
  int v7 = open(v5, 0, 0LL);
  if (v7 < 0)
  {
    id v20 = sub_10000291C();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = *__error();
      v42.st_dev = 136315394;
      *(void *)&v42.st_mode = v6;
      WORD2(v42.st_ino) = 1024;
      *(_DWORD *)((char *)&v42.st_ino + 6) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "FileExtent: error opening %s: %{errno}d",  (uint8_t *)&v42,  0x12u);
    }

    int v15 = 0;
    goto LABEL_19;
  }

  int v8 = v7;
  if (fstat(v7, &v42))
  {
    id v9 = sub_10000291C();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      goto LABEL_9;
    }

    int v11 = *__error();
    *(_DWORD *)buf = 136315394;
    uint64_t v39 = v6;
    __int16 v40 = 1024;
    LODWORD(v41) = v11;
    BOOL v12 = "FileExtent: failed to get file size for %s: %{errno}d";
    uint64_t v13 = (os_log_s *)v10;
    uint32_t v14 = 18;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    goto LABEL_8;
  }

  off_t st_size = v42.st_size;
  if (!v42.st_size)
  {
    id v26 = sub_10000291C();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v39 = v6;
    BOOL v12 = "FileExtent: no extents for %s (empty file)\n";
    uint64_t v13 = (os_log_s *)v10;
    uint32_t v14 = 12;
    goto LABEL_7;
  }

  if (v42.st_size >= 1)
  {
    int v15 = 0;
    off_t v25 = 0LL;
    while (1)
    {
      int v35 = 0;
      off_t v36 = st_size - v25;
      off_t v37 = v25;
      if (fcntl(v8, 65, &v35))
      {
        id v27 = sub_10000291C();
        unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        int v29 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v29;
        int v30 = "FileExtent: error in fcntl(): %{errno}d";
        id v31 = v28;
        uint32_t v32 = 8;
        goto LABEL_35;
      }

      if (!v36) {
        break;
      }
      v25 += v36;
      ++v15;
      if (v25 >= st_size) {
        goto LABEL_10;
      }
    }

    id v33 = sub_10000291C();
    unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v39 = v25;
    __int16 v40 = 2048;
    off_t v41 = st_size;
    int v30 = "FileExtent: 0 contigbytes fcntl() at offset %lld out of %lld";
    id v31 = v28;
    uint32_t v32 = 22;
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
LABEL_36:

    goto LABEL_10;
  }

LABEL_9:
  int v15 = 0;
LABEL_10:
  close(v8);
LABEL_19:
  dword_1000080D8 = v15;
  id v23 = sub_10000291C();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100002C5C(v6, v17);
  }
LABEL_21:
}

void sub_100002490(id a1)
{
  vm_size_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[FFConfiguration shared](&OBJC_CLASS___FFConfiguration, "shared"));
  if (v1)
  {
    id v2 = v1;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 domains]);
    id v4 = [v3 count];

    if (v4)
    {
      LOBYTE(word_1000080DE) = 1;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v2 domains]);
      id v35 = [v5 countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v35)
      {
        uint64_t v6 = *(void *)v44;
        off_t v37 = v5;
        uint64_t v34 = *(void *)v44;
        do
        {
          uint64_t v7 = 0LL;
          do
          {
            if (*(void *)v44 != v6) {
              objc_enumerationMutation(v5);
            }
            uint64_t v36 = v7;
            uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * v7);
            context = objc_autoreleasePoolPush();
            id v9 = (void *)objc_claimAutoreleasedReturnValue([v2 featuresForDomain:v8]);
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            id v10 = v9;
            id v11 = [v10 countByEnumeratingWithState:&v39 objects:v53 count:16];
            if (v11)
            {
              id v12 = v11;
              uint64_t v13 = *(void *)v40;
              while (2)
              {
                for (i = 0LL; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v40 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
                  id v16 = (void *)objc_claimAutoreleasedReturnValue([v2 stateForFeature:v15 domain:v8 level:4]);
                  if (v16)
                  {
                    v17 = (void *)objc_claimAutoreleasedReturnValue([v2 defaultStateForFeature:v15 domain:v8]);
                    id v18 = v17;
                    if (!v17 || (id v19 = [v17 value], v19 != objc_msgSend(v16, "value")))
                    {
                      id v29 = sub_10000291C();
                      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                      {
                        id v31 = [v16 value];
                        id v32 = [v18 value];
                        *(_DWORD *)buf = 138412802;
                        uint64_t v48 = v15;
                        __int16 v49 = 2048;
                        id v50 = v31;
                        __int16 v51 = 2048;
                        id v52 = v32;
                        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Found non-default feature flag for %@: %ld (default %ld)",  buf,  0x20u);
                      }

                      HIBYTE(word_1000080DE) = 1;
                      [v2 invalidateCache];

                      objc_autoreleasePoolPop(context);
                      id v2 = v37;
                      goto LABEL_29;
                    }
                  }
                }

                id v12 = [v10 countByEnumeratingWithState:&v39 objects:v53 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            objc_autoreleasePoolPop(context);
            uint64_t v7 = v36 + 1;
            BOOL v5 = v37;
            uint64_t v6 = v34;
          }

          while ((id)(v36 + 1) != v35);
          id v35 = [v37 countByEnumeratingWithState:&v43 objects:v54 count:16];
        }

        while (v35);
      }

      id v20 = sub_10000291C();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100002CE0(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }

    else
    {
      id v33 = sub_10000291C();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to get feature flags", buf, 2u);
      }
    }

    [v2 invalidateCache];
LABEL_29:
  }

void sub_100002810( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100002830(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_10000283C()
{
  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1LL)
  {
    if (*__error() == 2) {
      return 0LL;
    }
    id v2 = sub_10000291C();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *__error();
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "sem_open() failed: %{errno}d",  (uint8_t *)v5,  8u);
    }
  }

  else
  {
    sem_close(v0);
  }

  return 1LL;
}

id sub_10000291C()
{
  if (qword_1000080F0 != -1) {
    dispatch_once(&qword_1000080F0, &stru_100004400);
  }
  return (id)qword_1000080E8;
}

void sub_10000295C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", (const char *)&unk_1000033BD);
  id v2 = (void *)qword_1000080E8;
  qword_1000080E8 = (uint64_t)v1;
}

void sub_10000298C(char a1, os_log_s *a2)
{
  v2[0] = 67109632;
  v2[1] = a1 & 1;
  __int16 v3 = 1024;
  int v4 = 1;
  __int16 v5 = 2048;
  uint64_t v6 = 1LL;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "No reply:%d or no connection:%d for command %llu",  (uint8_t *)v2,  0x18u);
  sub_100002820();
}

void sub_100002A1C(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unknown command %llu", (uint8_t *)&v2, 0xCu);
  sub_100002820();
}

void sub_100002A8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002ABC(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_FAULT,  "sem_open() creation failed: %{errno}d",  (uint8_t *)v3,  8u);
  sub_100002820();
}

void sub_100002B44(void *a1, os_log_s *a2)
{
  int v4 = 134217984;
  id v5 = [a1 count];
  sub_100002830((void *)&_mh_execute_header, a2, v3, "%lu darwinup roots are installed", (uint8_t *)&v4);
}

void sub_100002BC4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_100002830((void *)&_mh_execute_header, a2, a3, "Found serial=%llu", (uint8_t *)&v3);
  sub_100002820();
}

void sub_100002C2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002C5C(uint64_t a1, os_log_s *a2)
{
  v2[0] = 67109378;
  v2[1] = dword_1000080D8;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Shared cache fragmentation OS Cryptex File Extents count is %d for file: (%s)",  (uint8_t *)v2,  0x12u);
  sub_100002820();
}

void sub_100002CE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}