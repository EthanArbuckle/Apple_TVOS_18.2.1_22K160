void sub_100003254()
{
  char *pw_dir;
  uid_t v1;
  passwd *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void v10[7];
  char v11[1024];
  bzero(v11, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000037FC();
    }
    v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000034F0();
      }
LABEL_28:
      exit(1);
    }

    pw_dir = v2->pw_dir;
  }

  v3 = realpath_DARWIN_EXTSN(pw_dir, 0LL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003560();
    }
    goto LABEL_28;
  }

  v4 = v3;
  if (!_set_user_dir_suffix("betaenrollmentd") || !confstr(65537, v11, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000035CC();
    }
    goto LABEL_28;
  }

  v5 = realpath_DARWIN_EXTSN(v11, 0LL);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003638();
    }
    goto LABEL_28;
  }

  v6 = v5;
  if (!confstr(65538, v11, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000036A4();
    }
    goto LABEL_28;
  }

  v7 = realpath_DARWIN_EXTSN(v11, 0LL);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003710();
    }
    goto LABEL_28;
  }

  v8 = v7;
  v10[0] = "HOME";
  v10[1] = v4;
  v10[2] = "TMPDIR";
  v10[3] = v6;
  v10[4] = "DARWIN_CACHE_DIR";
  v10[5] = v7;
  v10[6] = 0LL;
  v9 = 0LL;
  if (sandbox_init_with_parameters("betaenrollmentd", 1LL, v10, &v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000377C(&v9);
    }
    goto LABEL_28;
  }

  free(v4);
  free(v6);
  free(v8);
}

void sub_100003494( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_1000034AC()
{
  return __error();
}

  ;
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDDaemon sharedInstance](&OBJC_CLASS___SDDaemon, "sharedInstance"));
  [v1 start];

  dispatch_main();
}

void sub_1000034F0()
{
}

void sub_100003560()
{
}

void sub_1000035CC()
{
}

void sub_100003638()
{
}

void sub_1000036A4()
{
}

void sub_100003710()
{
}

void sub_10000377C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 136446210;
  uint64_t v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to enter sandbox: %{public}s",  (uint8_t *)&v2,  0xCu);
}

void sub_1000037FC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "$HOME not set, falling back to using getpwuid",  v0,  2u);
  sub_1000034A4();
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}