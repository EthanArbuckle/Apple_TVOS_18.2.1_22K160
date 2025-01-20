uint64_t start()
{
  void *v0;
  void *v1;
  id v2;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v4;
  void *v5;
  void v7[5];
  void **v8;
  uint64_t v9;
  Class (*v10)(uint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  v0 = objc_autoreleasePoolPush();
  if (CFPreferencesGetAppBooleanValue(@"isHH2Enabled", @"com.apple.homed", 0LL))
  {
    v13 = 0LL;
    v14 = &v13;
    v15 = 0x2050000000LL;
    v1 = (void *)qword_100008020;
    v16 = qword_100008020;
    if (!qword_100008020)
    {
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472LL;
      v10 = sub_1000035FC;
      v11 = &unk_1000040D8;
      v12 = &v13;
      sub_1000035FC((uint64_t)&v8);
LABEL_6:
      v1 = (void *)v14[3];
    }
  }

  else
  {
    v13 = 0LL;
    v14 = &v13;
    v15 = 0x2050000000LL;
    v1 = (void *)qword_100008030;
    v16 = qword_100008030;
    if (!qword_100008030)
    {
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472LL;
      v10 = sub_100003700;
      v11 = &unk_1000040D8;
      v12 = &v13;
      sub_100003700((uint64_t)&v8);
      goto LABEL_6;
    }
  }

  v2 = v1;
  _Block_object_dispose(&v13, 8);
  global_queue = dispatch_get_global_queue(0LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003804;
  v7[3] = &unk_1000040B0;
  v7[4] = v2;
  dispatch_async(v4, v7);

  objc_autoreleasePoolPop(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v5 run];

  return 0LL;
}

void sub_1000035E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

Class sub_1000035FC(uint64_t a1)
{
  v5 = 0LL;
  v2 = (const char *)&selRef_currentRunLoop;
  if (!qword_100008028)
  {
    __int128 v6 = off_1000040F8;
    uint64_t v7 = 0LL;
    qword_100008028 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    if (!qword_100008028)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }

    if (v5) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    v2 = "HMDMainDriver";
    Class result = objc_getClass("HMDMainDriver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }

  qword_100008020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_100003700(uint64_t a1)
{
  v5 = 0LL;
  v2 = (const char *)&selRef_currentRunLoop;
  if (!qword_100008038)
  {
    __int128 v6 = off_100004110;
    uint64_t v7 = 0LL;
    qword_100008038 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    if (!qword_100008038)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }

    if (v5) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    v2 = "HMDMainDriver";
    Class result = objc_getClass("HMDMainDriver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }

  qword_100008030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100003804(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) driver]);
  [v1 start];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}