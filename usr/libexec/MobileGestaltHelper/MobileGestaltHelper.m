void sub_100001498( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v9;
  CFStringRef v10;
  CFIndex Length;
  CFIndex v12;
  char *v13;
  v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"libMobileGestalt %s:%d: %@", a1, a2, a3);
  v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v9, &a9);
  Length = CFStringGetLength(v10);
  v12 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v13 = (char *)calloc(1uLL, v12);
  if (v13)
  {
    if (CFStringGetCString(v10, v13, v12, 0x8000100u) == 1 && off_100008788 != 0LL) {
      off_100008788(v13);
    }
  }

  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  free(v13);
}

LABEL_10:
  return v6;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  _MGSetServer();
  +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  v1 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mobilegestalt.xpc");
  v2 = objc_alloc_init(&OBJC_CLASS___MobileGestaltHelperListener);
  uint64_t v3 = os_transaction_create("com.apple.mobilegestalt.xpc.wakeup");
  v4 = (void *)qword_100008790;
  qword_100008790 = v3;

  dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v5, v7, &stru_100004298);

  -[NSXPCListener setDelegate:](v1, "setDelegate:", v2);
  -[NSXPCListener resume](v1, "resume");
  v8 = (void *)os_transaction_create("Write MGCache");
  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000027B0;
  v13[3] = &unk_1000042C0;
  v10 = v2;
  v14 = v10;
  id v15 = v8;
  id v11 = v8;
  dispatch_after(v9, v7, v13);

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();

  return 0LL;
}

void sub_100002788(id a1)
{
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
}

id sub_1000027B0(uint64_t a1)
{
  char v2 = _MGCacheValid();
  id result = [*(id *)(a1 + 32) needsNewCachePostBoot];
  if ((v2 & 1) != 0)
  {
    if ((_DWORD)result)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Rebuild MGCache on boot was requested. Rebuilding cache.",  v4,  2u);
      }

      return (id)_MGRebuildCache();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MGCache was not valid. Writing new cache.",  buf,  2u);
    }

    return (id)_MGWriteCache();
  }

  return result;
}

void sub_100002878(id a1)
{
  v1 = (void *)qword_100008790;
  qword_100008790 = 0LL;
}

  ;
}

void sub_100002894( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000028A4(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 processNameForConnection:a2]);
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "asked question: p = %@, q = AppleTVMode, a = %@",  (uint8_t *)&v5,  0x16u);

  sub_100002888();
}

void sub_100002944()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to query boot uuid",  v0,  2u);
}

void sub_100002988(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to write %@ to %@ with error %@",  (uint8_t *)&v6,  0x20u);
}

void sub_100002A44(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100002894( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "File exists, but couldnt be read. Error: %@",  v3,  v4,  v5,  v6,  2u);

  sub_100002888();
}

void sub_100002AC4(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100002894( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Failed to remove sentinel %@",  v3,  v4,  v5,  v6,  2u);

  sub_100002888();
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}