uint64_t start()
{
  passwd *v0;
  uid_t pw_uid;
  gid_t pw_gid;
  NSString *v3;
  void *v4;
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void (__cdecl *v7)(int);
  uint64_t v8;
  os_log_s *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[8];
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  v0 = getpwnam("mobile");
  pw_uid = v0->pw_uid;
  pw_gid = v0->pw_gid;
  if (!_set_user_dir_suffix("com.apple.heard")
    || (v3 = NSTemporaryDirectory(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(v3),
        v5 = [v4 length],
        v4,
        !v5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002DE4();
    }
    exit(1);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_100002C84,  @"AppleLanguagePreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  if (!pw_uid || !pw_gid || (getgid() == pw_gid || !setgid(pw_gid)) && (getuid() == pw_uid || !setuid(pw_uid)))
  {
    v7 = signal(15, (void (__cdecl *)(int))sub_100002CE0);
    v8 = AXLogRTT(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = +[HCUtilities currentProcessIsHeard]( &OBJC_CLASS___HCUtilities,  "currentProcessIsHeard");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Verifying this is heard: %d", buf, 8u);
    }

    if (geteuid())
    {
      v10 = objc_autoreleasePoolPush();
      v18 = 0LL;
      v19 = &v18;
      v20 = 0x2050000000LL;
      v11 = (void *)qword_100008038;
      v21 = qword_100008038;
      if (!qword_100008038)
      {
        *(void *)buf = _NSConcreteStackBlock;
        v23 = 3221225472LL;
        v24 = sub_100002CF0;
        v25 = &unk_100004158;
        v26 = &v18;
        sub_100002CF0((uint64_t)buf);
        v11 = (void *)v19[3];
      }

      v12 = v11;
      _Block_object_dispose(&v18, 8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedServer", v18));
      [v13 startServer];

      objc_autoreleasePoolPop(v10);
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
        v16 = [v14 runMode:NSDefaultRunLoopMode beforeDate:v15];
      }

      while ((v16 & 1) != 0);
    }
  }

  return 0LL;
}

void sub_100002C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100002C84()
{
  uint64_t v0 = AXLogRTT();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "Received AppleLanguagePreferencesChangedNotification, restarting heard",  v2,  2u);
  }

  exit(0);
}

void sub_100002CE0()
{
}

Class sub_100002CF0(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_100008040)
  {
    __int128 v4 = off_100004178;
    uint64_t v5 = 0LL;
    qword_100008040 = _sl_dlopen(&v4, &v3);
    if (!qword_100008040)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100002E90();
    }

    if (v3) {
      free(v3);
    }
  }

  Class result = objc_getClass("AXHeardController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_8;
  }
  qword_100008038 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100002DE4()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failed to initialize temporary directory: %{darwin.errno}d",  (uint8_t *)v1,  8u);
}

void sub_100002E68()
{
}

void sub_100002E90()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "AXHeardController");
  AXLogRTT(v0);
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return [a1 startServer];
}