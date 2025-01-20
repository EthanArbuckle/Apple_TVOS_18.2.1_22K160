uint64_t start()
{
  void *v0;
  void *v1;
  sub_100003144();
  v0 = objc_autoreleasePoolPush();
  dispatch_async(&_dispatch_main_q, &stru_100004108);
  objc_autoreleasePoolPop(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v1 run];

  return 0LL;
}

void sub_100002D58(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[DEDDaemon sharedInstance](&OBJC_CLASS___DEDDaemon, "sharedInstance"));
  [v1 start];
}

void sub_100002D8C()
{
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    id v1 = (os_log_s *)qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_DEBUG)) {
      sub_100003570(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    uid_t v9 = getuid();
    v10 = getpwuid(v9);
    if (!v10)
    {
      if (qword_100008028 != -1) {
        dispatch_once(&qword_100008028, &stru_100004148);
      }
      if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
        sub_100003274();
      }
LABEL_44:
      exit(1);
    }

    pw_dir = v10->pw_dir;
  }

  v11 = realpath_DARWIN_EXTSN(pw_dir, 0LL);
  if (!v11)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_1000032E4();
    }
    goto LABEL_44;
  }

  v12 = v11;
  if (!_set_user_dir_suffix("diagnosticextensionsd") || !confstr(65537, v21, 0x400uLL))
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003350();
    }
    goto LABEL_44;
  }

  v13 = realpath_DARWIN_EXTSN(v21, 0LL);
  if (!v13)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_1000033BC();
    }
    goto LABEL_44;
  }

  v14 = v13;
  if (!confstr(65538, v21, 0x400uLL))
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003428();
    }
    goto LABEL_44;
  }

  v15 = realpath_DARWIN_EXTSN(v21, 0LL);
  if (!v15)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003494();
    }
    goto LABEL_44;
  }

  v16 = v15;
  v20[0] = "HOME";
  v20[1] = v12;
  v20[2] = "TMPDIR";
  v20[3] = v14;
  v20[4] = "DARWIN_CACHE_DIR";
  v20[5] = v15;
  v20[6] = 0LL;
  uint64_t v19 = 0LL;
  if (sandbox_init_with_parameters("diagnosticextensionsd", 1LL, v20, &v19))
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    v17 = (os_log_s *)qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003500(&v19, v17, v18);
    }
    goto LABEL_44;
  }

  free(v12);
  free(v14);
  free(v16);
}

void sub_100003144()
{
  if (_set_user_dir_suffix("com.apple.diagnosticextensionsd"))
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    v0 = (os_log_s *)qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_DEBUG)) {
      sub_1000035A4(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }

  else
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    uint64_t v8 = (os_log_s *)qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_1000035D8(v8);
    }
  }
}

void sub_1000031F8(id a1)
{
  qword_100008020 = (uint64_t)os_log_create("com.apple.diagnosticextensionsd", "sandbox");
}

void sub_100003224( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_100003244()
{
  return __error();
}

void sub_10000324C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100003268(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100003274()
{
}

void sub_1000032E4()
{
}

void sub_100003350()
{
}

void sub_1000033BC()
{
}

void sub_100003428()
{
}

void sub_100003494()
{
}

void sub_100003500(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 136446210;
  uint64_t v5 = v3;
  sub_100003268((void *)&_mh_execute_header, a2, a3, "Failed to enter sandbox: %{public}s", (uint8_t *)&v4);
}

void sub_100003570( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000035A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000035D8(os_log_s *a1)
{
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v5 = 136315138;
  uint8_t v6 = v3;
  sub_100003268( (void *)&_mh_execute_header,  a1,  v4,  "Failed to configure sandbox temporary directory, error %s",  (uint8_t *)&v5);
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}