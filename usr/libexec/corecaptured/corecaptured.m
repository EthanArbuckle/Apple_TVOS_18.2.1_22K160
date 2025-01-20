uint64_t start()
{
  pthread_setname_np("com.apple.corecaptured.main");
  signal(2, (void (__cdecl *)(int))sub_100003C98);
  signal(3, (void (__cdecl *)(int))sub_100003C98);
  signal(15, (void (__cdecl *)(int))sub_100003C98);
  signal(1, (void (__cdecl *)(int))sub_100003C98);
  signal(10, (void (__cdecl *)(int))sub_100003C98);
  qword_100008000 = os_transaction_create("com.apple.corecaptured");
  qword_100008008 = CoreCaptureStart();
  if (qword_100008008) {
    dispatch_main();
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003C98(uint64_t result)
{
  if ((_DWORD)result == 10)
  {
    v2 = (os_log_s *)coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled(coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      v3 = v2;
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      v3 = (os_log_s *)&_os_log_default;
    }

    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIGBUS DEATH\n", buf, 2u);
LABEL_12:
    if (glog_fd)
    {
      *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v13 = v4;
      __int128 v14 = v4;
      __int128 v11 = v4;
      __int128 v12 = v4;
      __int128 v9 = v4;
      __int128 v10 = v4;
      *(_OWORD *)buf = v4;
      __int128 v8 = v4;
      memset(&v6, 0, sizeof(v6));
      time_t v5 = 0xAAAAAAAAAAAAAAAALL;
      time(&v5);
      localtime_r(&v5, &v6);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v6);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "SIGBUS DEATH\n");
    }

LABEL_14:
    if (qword_100008008)
    {
      qword_100008008 = 0LL;
      CoreCaptureStop();
      signal(2, (void (__cdecl *)(int))1);
      signal(3, (void (__cdecl *)(int))1);
      signal(15, (void (__cdecl *)(int))1);
      signal(1, (void (__cdecl *)(int))1);
      signal(10, (void (__cdecl *)(int))1);
      if (qword_100008000)
      {
        qword_100008000 = 0LL;
        os_release(0LL);
      }
    }

    exit(0);
  }

  return result;
}