id sub_100002D80()
{
  if (qword_100008060 != -1) {
    dispatch_once(&qword_100008060, &stru_100004180);
  }
  return (id)qword_100008058;
}

void sub_100002DC0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.StatusKit", "StatusKitAgentMain");
  v2 = (void *)qword_100008058;
  qword_100008058 = (uint64_t)v1;
}

void sub_100002DF0(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002E48;
  block[3] = &unk_1000041A0;
  int v2 = a1;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100002E48(uint64_t a1)
{
  int v2 = (int *)(a1 + 32);
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 12)
  {
    if (v1 != 1 && v1 != 3)
    {
LABEL_5:
      id v3 = sub_100002D80();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_10000330C(v2, v4, v5);
      }

      return;
    }
  }

  else
  {
    if (v1 == 13)
    {
      signal(2, (void (__cdecl *)(int))sub_100002DF0);
      return;
    }

    if (v1 == 29)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[SKAStatusServer sharedInstance](&OBJC_CLASS___SKAStatusServer, "sharedInstance"));
      [v12 logState];

      return;
    }

    if (v1 != 15) {
      goto LABEL_5;
    }
  }

  id v7 = sub_100002D80();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Quit - shutting down daemon", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SKAStatusServer sharedInstance](&OBJC_CLASS___SKAStatusServer, "sharedInstance"));
  [v9 shutdown];

  [(id)qword_100008028 shutdown];
  id v10 = sub_100002D80();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Quit - goodbye!", v13, 2u);
  }
}

void sub_100002FC4()
{
  if (qword_100008068 != -1) {
    dispatch_once(&qword_100008068, &stru_1000041C0);
  }
}

void sub_100002FEC(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  int v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    int v4 = dword_100003758[i];
    uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v4, 0LL, v2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000030F4;
    handler[3] = &unk_1000041A0;
    int v9 = v4;
    dispatch_source_set_event_handler(v5, handler);
    v6 = (void *)qword_100008030[i];
    qword_100008030[i] = v5;
    id v7 = v5;

    dispatch_resume(v7);
    signal(v4, (void (__cdecl *)(int))1);
  }
}

void sub_1000030F4(uint64_t a1)
{
}

uint64_t start()
{
  if ((_set_user_dir_suffix("com.apple.statuskit") & 1) == 0)
  {
    id v10 = sub_100002D80();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100003438(v11);
    }

    exit(1);
  }

  nullsub_1();
  v0 = objc_autoreleasePoolPush();
  id v1 = NSTemporaryDirectory();
  if (qword_100008068 != -1) {
    dispatch_once(&qword_100008068, &stru_1000041C0);
  }
  id v2 = sub_100002D80();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "StatusKitAgent launched", v12, 2u);
  }

  NSLog(@"Hello, World!");
  int v4 = objc_autoreleasePoolPush();
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SKAStatusServer sharedInstance](&OBJC_CLASS___SKAStatusServer, "sharedInstance"));
  NSLog(@"LocalStatusKit not enabled");
  objc_autoreleasePoolPop(v4);
  objc_autoreleasePoolPop(v0);
  if (v5 | qword_100008028)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v6 run];
  }

  id v7 = (id)objc_opt_self(v5);
  v8 = (void *)qword_100008028;
  qword_100008028 = 0LL;

  return 0LL;
}

void sub_10000328C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_10000329C()
{
  if (qword_100008078 != -1) {
    dispatch_once(&qword_100008078, &stru_1000041E0);
  }
  return (id)qword_100008070;
}

void sub_1000032DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.StatusKit", "StatusKitAgentSandbox");
  id v2 = (void *)qword_100008070;
  qword_100008070 = (uint64_t)v1;
}

void sub_10000330C(int *a1, os_log_s *a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  sub_10000328C((void *)&_mh_execute_header, a2, a3, "Unhandled signal: %d", (uint8_t *)v4);
}

void sub_10000337C(void *a1)
{
  id v1 = objc_begin_catch(a1);
  id v2 = sub_100002D80();
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138412290;
    id v5 = v1;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "StatusKitAgent exception caught on main thread: %@",  (uint8_t *)&v4,  0xCu);
  }

  objc_end_catch();
}

void sub_100003438(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_10000328C((void *)&_mh_execute_header, a1, v3, "Failed to set user dir suffix: %{darwin.errno}d", (uint8_t *)v4);
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}