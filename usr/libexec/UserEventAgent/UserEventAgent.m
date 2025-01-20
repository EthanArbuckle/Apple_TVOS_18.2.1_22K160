void start(int a1, uint64_t a2)
{
  const char *v4;
  int v5;
  os_log_s *v6;
  const char *v7;
  dispatch_queue_global_t global_queue;
  os_log_s *v9;
  const char *v10;
  dispatch_source_s *v11;
  os_log_s *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  os_log_s *v20;
  uint64_t v21;
  char *__s1;
  uint64_t v23;
  _DWORD v24[2];
  __int16 v25;
  char *v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  qword_100008040 = (uint64_t)os_log_create("com.apple.UserEventAgent", "Daemon");
  __s1 = 0LL;
  v23 = 0LL;
  if (setiopolicy_np(9, 0, 1))
  {
    v21 = 0LL;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      v14 = 3LL;
    }
    else {
      v14 = 2LL;
    }
    v15 = *__error();
    v16 = __error();
    v17 = strerror(*v16);
    v24[0] = 67109378;
    v24[1] = v15;
    v25 = 2082;
    v26 = v17;
    v18 = _os_log_send_and_compose_impl( v14,  &v21,  buf,  80LL,  &_mh_execute_header,  &_os_log_default,  16LL,  "Error setting low space io policy: %d (%{public}s)",  v24,  18);
    _os_crash_msg(v21, v18);
    __break(1u);
  }

  else
  {
    if (qword_100008070 != -1) {
      dispatch_once(&qword_100008070, &stru_100004390);
    }
    qword_100008048 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (qword_100008048)
    {
      qword_100008050 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      if (!qword_100008050)
      {
        v12 = (os_log_s *)qword_100008040;
        if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        *(_WORD *)buf = 0;
        v13 = "Failed to create a set.";
        goto LABEL_34;
      }

      CFBundleGetMainBundle();
      if (qword_100008078 != -1) {
        dispatch_once(&qword_100008078, &stru_1000043B0);
      }
      if (a1 < 4 || !byte_100008080)
      {
LABEL_23:
        vproc_swap_integer(0LL, 5LL, 0LL, &v23);
        if (!v23)
        {
          fwrite("This program is not meant to be run directly.\n", 0x2EuLL, 1uLL, __stderrp);
          goto LABEL_35;
        }

        vproc_swap_string(0LL, 6LL, 0LL, &__s1);
        if (__s1)
        {
          signal(15, (void (__cdecl *)(int))1);
          global_queue = dispatch_get_global_queue(21LL, 0LL);
          if (!global_queue)
          {
            v9 = (os_log_s *)qword_100008040;
            if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v10 = "Unable to get queue";
LABEL_31:
              _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
              goto LABEL_32;
            }

            goto LABEL_32;
          }

          v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, global_queue);
          qword_100008088 = (uint64_t)v11;
          if (!v11)
          {
            v9 = (os_log_s *)qword_100008040;
            if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v10 = "Unable to create dispatch source.";
              goto LABEL_31;
            }

LABEL_32:
            v12 = (os_log_s *)qword_100008040;
            if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_WORD *)buf = 0;
            v13 = "Failed to configure SIGTERM handler.";
            goto LABEL_34;
          }

          dispatch_source_set_event_handler(v11, &stru_1000043D0);
          dispatch_activate((dispatch_object_t)qword_100008088);
          if (&_CTTelephonyCenterGetDefault) {
            CTTelephonyCenterGetDefault();
          }
          sub_100002218(0);
          qword_100008068 = 0LL;
          sub_1000012A8(1);
          sub_1000012A8(0);
          v19 = __s1;
          if (strcmp(__s1, "LoginWindow"))
          {
            sub_100002218(1);
            v19 = __s1;
          }

          free(v19);

          v20 = (os_log_s *)qword_100008040;
          if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting runloop", buf, 2u);
          }

          -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
LABEL_35:
          exit(1);
        }

        v12 = (os_log_s *)qword_100008040;
        if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        *(_WORD *)buf = 0;
        v13 = "unable to determine session";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
        goto LABEL_35;
      }

      v4 = *(const char **)(a2 + 16);
      if (!strncmp(v4, "r", 2uLL))
      {
        v5 = a1 - 3;
        dword_100008058 = a1 - 3;
        byte_10000805C = 1;
        v6 = (os_log_s *)qword_100008040;
        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v7 = "Running specific plugin in UserEventAgent";
LABEL_16:
          _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
LABEL_17:
          v5 = dword_100008058;
          qword_100008060 = a2 + 24;
          if (dword_100008058 < 1)
          {
LABEL_22:
            byte_10000805C = 0;
            byte_10000805D = 0;
            qword_100008060 = 0LL;
            goto LABEL_23;
          }

LABEL_20:
          if (byte_10000805C != 1 || v5 == 1) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }

      else
      {
        if (strncmp(v4, "d", 2uLL)) {
          goto LABEL_17;
        }
        v5 = a1 - 3;
        dword_100008058 = a1 - 3;
        byte_10000805D = 1;
        v6 = (os_log_s *)qword_100008040;
        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v7 = "Not running some plugin in original UserEventAgent";
          goto LABEL_16;
        }
      }

      qword_100008060 = a2 + 24;
      goto LABEL_20;
    }
  }

  v12 = (os_log_s *)qword_100008040;
  if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR)) {
    goto LABEL_35;
  }
  *(_WORD *)buf = 0;
  v13 = "Failed to create a set.";
  goto LABEL_34;
}

void sub_1000012A8(int a1)
{
  v2 = dispatch_group_create();