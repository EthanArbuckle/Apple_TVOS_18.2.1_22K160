uint64_t sub_1000031E4()
{
  if (qword_100020238 != -1) {
    dispatch_once(&qword_100020238, &stru_10001C6A0);
  }
  return qword_100020240;
}

void sub_100003224(id a1)
{
  qword_100020240 = (uint64_t)os_log_create("com.apple.fsevents", "daemon");
}

dispatch_source_s *sub_100003250(uintptr_t handle)
{
  v1 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  handle,  0LL,  (dispatch_queue_t)qword_100020248);
  v2 = v1;
  if (v1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_1000032F8;
    handler[3] = &unk_10001C6C0;
    handler[4] = v1;
    dispatch_source_set_event_handler(v1, handler);
  }

  else
  {
    v3 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100013CA4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v2;
}

void sub_1000032F8(uint64_t a1)
{
  v1 = *(dispatch_source_s **)(a1 + 32);
  int handle = dispatch_source_get_handle(v1);
  int v3 = dispatch_mig_server(v1, 4096LL, sub_10000336C);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100013D14(handle, v4, v5);
    }
  }
}

uint64_t sub_10000336C(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  if (a1->msgh_id != 70) {
    return sub_100013C10(a1, (uint64_t)a2);
  }
  int v4 = (char *)a1 + ((a1->msgh_size + 3LL) & 0x1FFFFFFFCLL);
  mig_reply_setup(a1, a2);
  a2[1].msgh_remote_port = -305;
  if (!*(_DWORD *)v4 && *((_DWORD *)v4 + 1) >= 0x34u)
  {
    __int128 v5 = *(_OWORD *)(v4 + 36);
    *(_OWORD *)atoken.val = *(_OWORD *)(v4 + 20);
    *(_OWORD *)&atoken.val[4] = v5;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    if (!pidp)
    {
      uint64_t v6 = sub_100003D8C(a1->msgh_local_port);
      if (v6)
      {
        uint64_t v7 = v6;
        sub_100011504(v6);
        sub_100004244(v7);
      }
    }
  }

  return 1LL;
}

void start(int a1, uint64_t a2)
{
  kern_return_t v4;
  int v5;
  int v6;
  os_log_s *v7;
  const char *v8;
  os_log_s *v9;
  uint32_t v10;
  kern_return_t v11;
  os_log_s *v12;
  pthread_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  kern_return_t v19;
  int v2 = 3;
  if (a1 == 2)
  {
    else {
      int v2 = 3;
    }
  }

  int v3 = getprogname();
  openlog(v3, v2, 24);
  int v4 = bootstrap_check_in(bootstrap_port, "com.apple.FSEvents", (mach_port_t *)&dword_100020250);
  if (v4)
  {
    v11 = v4;
    v12 = (os_log_s *)sub_1000031E4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    v15 = "main";
    v16 = 2080;
    v17 = bootstrap_strerror(v11);
    v18 = 1024;
    v19 = v11;
    uint64_t v8 = "%s: ERROR: bootstrap_check_in() => %s (%d)";
    uint64_t v9 = v12;
    uint64_t v10 = 28;
  }

  else
  {
    qword_100020248 = (uint64_t)dispatch_queue_create("com.apple.fseventsd.mach_channel_queue", 0LL);
    qword_100020258 = dispatch_mach_create_f("com.apple.fseventsd.f2d.channel", qword_100020248, 0LL, sub_100003620);
    dispatch_set_qos_class_fallback();
    dispatch_mach_connect(qword_100020258, dword_100020250, 0LL, 0LL);
    __int128 v5 = pthread_create(&v13, 0LL, (void *(__cdecl *)(void *))sub_1000112D0, 0LL);
    if (!v5) {
      dispatch_main();
    }
    uint64_t v6 = v5;
    uint64_t v7 = (os_log_s *)sub_1000031E4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      closelog();
      exit(1);
    }

    *(_DWORD *)buf = 136315394;
    v15 = "main";
    v16 = 1024;
    LODWORD(v17) = v6;
    uint64_t v8 = "%s: ERROR: pthread_create() => %d";
    uint64_t v9 = v7;
    uint64_t v10 = 18;
  }

  _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
  goto LABEL_12;
}

void sub_100003620(uint64_t a1, unint64_t a2, uint64_t a3, mach_error_t a4)
{
  if (a4)
  {
    uint64_t v8 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100013E38(a4, a2, v8);
    }
  }

  if (a2 > 0xD) {
    goto LABEL_10;
  }
  if (((1LL << a2) & 0x2182) != 0) {
    return;
  }
  if (a2 == 2)
  {
    if ((dispatch_mach_mig_demux(a1, &off_100020000, 1LL, a3) & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
      mach_msg_destroy(msg);
    }
  }

  else
  {
LABEL_10:
    uint64_t v10 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100013DB4(a2, v10);
    }
  }

uint64_t sub_1000036FC( int a1, int a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, unsigned int a8, unsigned int a9, unsigned int *a10, int a11, uint64_t a12, unsigned int a13, uint64_t a14, int a15, uint64_t a16, mach_port_name_t *a17, _OWORD *a18)
{
  __int128 v25 = a18[1];
  *(_OWORD *)atoken.val = *a18;
  *(_OWORD *)&atoken.val[4] = v25;
  audit_token_to_au32(&atoken, 0LL, euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
  mach_port_t v26 = mach_task_self_;
  *a17 = 0;
  if (a4 == a6)
  {
    int v59 = a2;
    if (a9 == a11)
    {
      if (a4 > 0x1000 || a9 > 0x400000)
      {
        ipc_space_t v33 = v26;
        uint64_t v31 = 268435459LL;
        v36 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_100013EFC();
        }
      }

      else if (a8 > 0x400000 || a13 > 0x400000)
      {
        ipc_space_t v33 = v26;
        uint64_t v31 = 268435459LL;
        v37 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_100013F68();
        }
      }

      else if (a4)
      {
        uint64_t v27 = 0LL;
        while (*(_DWORD *)(a5 + 4 * v27) <= a8)
        {
          if (a4 == ++v27) {
            goto LABEL_11;
          }
        }

        ipc_space_t v33 = v26;
        uint64_t v31 = 268435459LL;
        v38 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100014280();
        }
      }

      else
      {
LABEL_11:
        if ((int)a9 < 1)
        {
LABEL_15:
          ipc_space_t v29 = v26;
          uint64_t v30 = mach_port_allocate(v26, 1u, a17);
          if ((_DWORD)v30)
          {
            uint64_t v31 = v30;
            v32 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100014204(v31);
            }
            goto LABEL_35;
          }

          v58 = a7;
          mach_port_t previous = 0;
          ipc_space_t v33 = v29;
          uint64_t v40 = mach_port_request_notification(v29, *a17, 70, 1u, *a17, 0x15u, &previous);
          if ((_DWORD)v40)
          {
            uint64_t v31 = v40;
            v41 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              sub_100014188(v31);
            }
          }

          else
          {
            uint64_t v43 = a14;
            if (previous)
            {
              mach_port_deallocate(mach_task_self_, previous);
              uint64_t v43 = a14;
            }

            uintptr_t v44 = *a17;
            __int128 v45 = a18[1];
            *(_OWORD *)atoken.val = *a18;
            *(_OWORD *)&atoken.val[4] = v45;
            v46 = sub_1000041D8(v59, v44, a3, a4, a5, a8, v58, v43, a15, a16, pidp, euidp[0], egidp, &atoken);
            if (v46)
            {
              v47 = v46;
              if (sub_10000466C((uint64_t)v46, a9, a10, a13, a12))
              {
                uint64_t v31 = 268435459LL;
                _DWORD *v47 = 0;
                sub_100004244((uint64_t)v47);
                v48 = (os_log_s *)sub_1000031E4();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                  sub_10001411C();
                }
              }

              else
              {
                uint64_t v31 = 268435459LL;
                _DWORD *v47 = 0;
                sub_100004244((uint64_t)v47);
                v57 = (os_log_s *)sub_1000031E4();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                  sub_1000140B0();
                }
              }

              goto LABEL_35;
            }

            uint64_t v31 = 268435459LL;
            v49 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              sub_100014040(v49, v50, v51, v52, v53, v54, v55, v56);
            }
          }
        }

        else
        {
          uint64_t v28 = 0LL;
          while (a10[v28] <= a13)
          {
            if (a9 == ++v28) {
              goto LABEL_15;
            }
          }

          ipc_space_t v33 = v26;
          uint64_t v31 = 268435459LL;
          v39 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_100013FD4();
          }
        }
      }
    }

    else
    {
      ipc_space_t v33 = v26;
      uint64_t v31 = 268435459LL;
      v35 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1000142EC();
      }
    }
  }

  else
  {
    ipc_space_t v33 = v26;
    uint64_t v31 = 268435459LL;
    v34 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100014358();
    }
  }

  if (*a17)
  {
    mach_port_mod_refs(v33, *a17, 1u, -1);
LABEL_35:
    *a17 = 0;
  }

  return v31;
}

uint64_t sub_100003B60(int a1, void *a2)
{
  uint64_t v3 = sub_100003D8C(a1);
  if (v3)
  {
    uint64_t v4 = v3;
    nullsub_1();
    sub_1000115C8(v4, a2);
  }

  else
  {
    __int128 v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000143C4();
    }
  }

  return 0LL;
}

uint64_t sub_100003BD0(uint64_t a1, void *a2)
{
  return 0LL;
}

uint64_t sub_100003BEC(uint64_t a1, int a2, char *a3)
{
  return 0LL;
}

uint64_t sub_100003C0C(uint64_t a1, int a2, unint64_t a3, uint64_t *a4)
{
  return 0LL;
}

uint64_t sub_100003C30(uint64_t a1, int a2, unint64_t a3, int *a4, int a5)
{
  if (a5)
  {
    uint64_t v6 = 5LL;
    int v7 = 13;
  }

  else
  {
    int v7 = sub_1000103E8(a2, a3);
    uint64_t v6 = 0LL;
  }

  *a4 = v7;
  return v6;
}

uint64_t sub_100003C74(int a1)
{
  uint64_t v1 = sub_100003D8C(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    nullsub_1();
    sub_100011504(v2);
    sub_100004244(v2);
  }

  else
  {
    uint64_t v3 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014430();
    }
  }

  return 0LL;
}

void sub_100003CDC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_100003D14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100003D58( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100003D6C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100003D8C(int a1)
{
  for (uint64_t result = qword_100020260; result; uint64_t result = *(void *)(result + 192))
  {
    if (*(_DWORD *)(result + 4) == a1) {
      break;
    }
  }

  return result;
}

void *sub_100003DB4( int a1, uintptr_t a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12, int a13, _OWORD *a14)
{
  v22 = calloc(1uLL, 0xC8uLL);
  if (!v22)
  {
    ipc_space_t v29 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10001449C(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    return 0LL;
  }

  v23 = v22;
  v24 = malloc(a6);
  *((void *)v23 + 4) = v24;
  if (!v24)
  {
    v37 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10001450C(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_18;
  }

  memcpy(v24, a7, a6);
  __int128 v25 = malloc(8LL * a4);
  *((void *)v23 + 3) = v25;
  if (!v25)
  {
    __int128 v45 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_10001457C(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_17;
  }

  if (a4)
  {
    uint64_t v26 = 0LL;
    do
    {
      *(void *)(*((void *)v23 + 3) + 8 * v26) = *((void *)v23 + 4) + *(unsigned int *)(a5 + 4 * v26);
      ++v26;
    }

    while (a4 != v26);
  }

  *((_DWORD *)v23 + 4) = a3;
  *((_DWORD *)v23 + 5) = a4;
  *(_DWORD *)v23 = a1;
  *((_DWORD *)v23 + 1) = a2;
  uint64_t v27 = sub_100003250(a2);
  *((void *)v23 + 1) = v27;
  if (!v27)
  {
    uint64_t v53 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_1000145EC(v53, v54, v55, v56, v57, v58, v59, v60);
    }
LABEL_17:
    free(*((void **)v23 + 4));
LABEL_18:
    free(v23);
    return 0LL;
  }

  *((void *)v23 + 14) = a8;
  *((_DWORD *)v23 + 30) = a9;
  *((void *)v23 + 16) = a10;
  *((_DWORD *)v23 + 34) = a11;
  *((_DWORD *)v23 + 35) = a12;
  *((_DWORD *)v23 + 36) = a13;
  *((_DWORD *)v23 + 37) = 1;
  __int128 v28 = a14[1];
  *((_OWORD *)v23 + 10) = *a14;
  *((_OWORD *)v23 + 11) = v28;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_100003FA8;
  handler[3] = &unk_10001C6E0;
  handler[4] = v23;
  dispatch_source_set_cancel_handler(v27, handler);
  dispatch_activate(*((dispatch_object_t *)v23 + 1));
  return v23;
}

void sub_100003FA8(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  os_log_s *v4;
  uint64_t v1 = (void **)(a1 + 32);
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8LL));
  *((void *)*v1 + 1) = 0LL;
  uint64_t v2 = mach_port_mod_refs(mach_task_self_, *((_DWORD *)*v1 + 1), 1u, -1);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001465C((int)v1, v3);
    }
  }

  free(*v1);
}

uint64_t sub_100004038(uint64_t result)
{
  uint64_t v1 = (unsigned int *)(result + 148);
  do
    unsigned int v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

void sub_100004050(uint64_t a1)
{
  kern_return_t v5;
  mach_error_t v6;
  os_log_s *v7;
  os_log_s *v8;
  unsigned int v2 = (unsigned int *)(a1 + 148);
  do
    int v3 = __ldxr(v2);
  while (__stxr(v3 - 1, v2));
  if (v3 <= 0)
  {
    uint64_t v8 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000146E8(a1, (int *)v2, v8);
    }
  }

  else if (v3 == 1)
  {
    *(_DWORD *)(a1 + 20) = 0;
    free(*(void **)(a1 + 24));
    *(void *)(a1 + 24) = 0LL;
    free(*(void **)(a1 + 32));
    *(void *)(a1 + 32) = 0LL;
    for (uint64_t i = 48LL; i != 112; i += 8LL)
    {
      free(*(void **)(a1 + i));
      *(void *)(a1 + i) = 0LL;
    }

    if (*(_DWORD *)a1)
    {
      __int128 v5 = mach_port_deallocate(mach_task_self_, *(_DWORD *)a1);
      if (v5)
      {
        uint64_t v6 = v5;
        int v7 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100014778(a1, v6);
        }
      }
    }

    *(_DWORD *)a1 = 0;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
  }

void sub_100004150(uint64_t a1)
{
  uint64_t v1 = qword_100020260;
  if (qword_100020260 == a1)
  {
    qword_100020260 = *(void *)(a1 + 192);
    goto LABEL_13;
  }

  if (qword_100020260)
  {
    do
    {
      uint64_t v2 = v1;
      uint64_t v1 = *(void *)(v1 + 192);
    }

    while (v1 != a1 && v1 != 0);
    if (v1)
    {
      *(void *)(v2 + 192) = *(void *)(v1 + 192);
LABEL_13:
      --dword_100020268;
      return;
    }
  }

  uint64_t v4 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100014800(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

void *sub_1000041D8( int a1, uintptr_t a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12, int a13, _OWORD *a14)
{
  __int128 v14 = a14[1];
  v16[0] = *a14;
  v16[1] = v14;
  uint64_t result = sub_100003DB4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, v16);
  if (result)
  {
    result[24] = qword_100020260;
    qword_100020260 = (uint64_t)result;
    ++dword_100020268;
  }

  return result;
}

void sub_100004244(uint64_t a1)
{
}

uint64_t sub_100004268( int *a1, int a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  kern_return_t v17;
  mach_error_t v18;
  os_log_s *v19;
  uint64_t v20;
  os_log_s *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  int v32;
  int v33;
  kern_return_t v34;
  mach_error_t v35;
  os_log_s *v36;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  os_log_s *v42;
  os_log_s *v43;
  uint64_t v44;
  time_t v45;
  int v46;
  uint64_t v47;
  int v48;
  vm_address_t v49;
  vm_address_t address;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  uint64_t v49 = 0LL;
  address = 0LL;
  if (!a1)
  {
    v21 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100014870(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    int v16 = -1;
    int v14 = -1;
    v20 = 0xFFFFFFFFLL;
    goto LABEL_21;
  }

  int v14 = a2;
  int v16 = 4 * a2;
  v17 = vm_allocate(mach_task_self_, &address, 4 * a2, -150994943);
  if (v17)
  {
    v18 = v17;
    v19 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000149F4(v18, v19);
    }
    int v14 = 0;
    address = 0LL;
    v20 = 4294967294LL;
    goto LABEL_23;
  }

  uint64_t v48 = v14;
  if (v14)
  {
    LODWORD(v29) = v14;
    int v14 = 0;
    ipc_space_t v29 = v29;
    uint64_t v30 = a3;
    do
    {
      uint64_t v31 = *v30;
      v30 += 2;
      uint64_t v32 = v14 + v31;
      uint64_t v33 = v14 + v31 + 8;
      if (a1[38]) {
        uint64_t v32 = v33;
      }
      if (a1[39]) {
        int v14 = v32 + 4;
      }
      else {
        int v14 = v32;
      }
      --v29;
    }

    while (v29);
  }

  uint64_t v34 = vm_allocate(mach_task_self_, &v49, v14, -150994943);
  if (!v34)
  {
    uint64_t v47 = a7;
    if (v48)
    {
      uint64_t v38 = 0LL;
      uint64_t v39 = 0;
      do
      {
        *(_DWORD *)(address + 4 * v38) = v39;
        strlcpy((char *)(v49 + v39), *(const char **)(a4 + 8 * v38), 0x400uLL);
        v39 += a3[2 * v38];
        if (a1[38])
        {
          if (a8) {
            uint64_t v40 = *(void *)(a8 + 8 * v38);
          }
          else {
            uint64_t v40 = 0LL;
          }
          *(void *)(v49 + v39) = v40;
          v39 += 8;
        }

        if (a1[39])
        {
          if (a9) {
            uint64_t v41 = *(_DWORD *)(a9 + 4 * v38);
          }
          else {
            uint64_t v41 = 0;
          }
          *(_DWORD *)(v49 + v39) = v41;
          v39 += 4;
        }

        ++v38;
      }

      while (v48 != v38);
    }

    else
    {
      uint64_t v39 = 0;
    }

    if (v39 != v14)
    {
      uint64_t v42 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v52 = "callback_client";
        uint64_t v53 = 1024;
        uint64_t v54 = v48;
        uint64_t v55 = 1024;
        uint64_t v56 = v39;
        uint64_t v57 = 1024;
        uint64_t v58 = v14;
        uint64_t v59 = 1024;
        uint64_t v60 = v48;
        _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s: ERROR: npaths=%d j=%d paths_blob_size=%d i=%d",  buf,  0x24u);
      }

      uint64_t v43 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1000148E0(v43);
      }
    }

    uint64_t v44 = sub_1000135A0(*a1, 0x2710u, v48, address, v48, a5, v48, v47, v48, v49, v14);
    v20 = v44;
    if (!(_DWORD)v44 || (_DWORD)v44 == 268435459) {
      goto LABEL_21;
    }
    __int128 v45 = time(0LL);
    if (v45 - qword_100020270 < 5)
    {
      if (v45 - qword_100020270 < 2 || (uint64_t v46 = a1[34], dword_100020278 == v46))
      {
LABEL_53:
        if ((_DWORD)v20 == 268435460)
        {
          ++dword_1000206A0;
          usleep(0x186A0u);
          v20 = 268435460LL;
        }

        goto LABEL_21;
      }
    }

    else
    {
      uint64_t v46 = a1[34];
    }

    qword_100020270 = v45;
    dword_100020278 = v46;
    goto LABEL_53;
  }

  uint64_t v35 = v34;
  uint64_t v36 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100014970(v35, v36);
  }
  uint64_t v49 = 0LL;
  v20 = 4294967293LL;
LABEL_21:
  if (address) {
    vm_deallocate(mach_task_self_, address, v16);
  }
LABEL_23:
  if (v49) {
    vm_deallocate(mach_task_self_, v49, v14);
  }
  return v20;
}

uint64_t sub_10000466C(uint64_t a1, int a2, unsigned int *a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  if (a2 > 8) {
    return 28LL;
  }
  if (a2 >= 1)
  {
    uint64_t v9 = a3;
    uint64_t v10 = a2;
    uint64_t v11 = a2;
    v12 = a3;
    do
    {
      unsigned int v13 = *v12++;
      --v11;
    }

    while (v11);
    int v14 = (char **)(a1 + 48);
    do
    {
      unsigned int v15 = *v9++;
      __strlcpy_chk(__s1, a5 + v15, 1024LL, 1024LL);
      *v14++ = strdup(__s1);
      --v10;
    }

    while (v10);
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 40) = a2;
  return result;
}

  ;
}

void sub_10000479C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000047A8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_1000047CC(uint64_t a1)
{
  uint64_t v2 = pthread_rwlock_init((pthread_rwlock_t *)(a1 + 8), 0LL);
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014AFC(v3, v4);
    }
  }

  else
  {
    uint64_t v3 = pthread_key_create((pthread_key_t *)a1, (void (__cdecl *)(void *))&_free);
    if ((_DWORD)v3)
    {
      uint64_t v5 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100014A78(v3, v5);
      }
    }
  }

  return v3;
}

void *sub_100004860(pthread_key_t *a1)
{
  uint64_t v2 = pthread_getspecific(*a1);
  if (!v2)
  {
    uint64_t v3 = malloc(4uLL);
    uint64_t v2 = v3;
    if (v3)
    {
      _DWORD *v3 = 0;
      if (pthread_setspecific(*a1, v3))
      {
        free(v2);
        return 0LL;
      }
    }
  }

  return v2;
}

uint64_t sub_1000048C0(uint64_t a1)
{
  uint64_t v2 = (int *)sub_100004860((pthread_key_t *)a1);
  if (v2)
  {
    int v3 = *v2;
    if (!*v2) {
      sub_100014BF0();
    }
    if (v3 < 1) {
      int v4 = v3 + 1;
    }
    else {
      int v4 = v3 - 1;
    }
    int *v2 = v4;
    if (v4) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014B80(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_100004940(uint64_t a1)
{
  uint64_t v2 = (int *)sub_100004860((pthread_key_t *)a1);
  if (v2)
  {
    int v3 = *v2;
    if (*v2 < 0) {
      sub_100014C88();
    }
    int *v2 = v3 + 1;
    if (v3)
    {
      return 0LL;
    }

    else
    {
      uint64_t v4 = pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
      if ((_DWORD)v4)
      {
        uint64_t v13 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100014CB0(v4);
        }
      }
    }
  }

  else
  {
    uint64_t v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014C18(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
  }

  return v4;
}

uint64_t sub_1000049FC(uint64_t a1)
{
  uint64_t v2 = (int *)sub_100004860((pthread_key_t *)a1);
  if (!v2) {
    return pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
  }
  int v3 = *v2;
  if (*v2 >= 1) {
    sub_100014D2C();
  }
  --*v2;
  if (v3 < 0) {
    return 0LL;
  }
  uint64_t v4 = pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
  if ((_DWORD)v4)
  {
    uint64_t v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014D54(v4);
    }
  }

  return v4;
}

uint64_t sub_100004A98(int a1, uint64_t a2, int a3, int a4)
{
  if (!a1)
  {
    int v10 = dword_100020048;
    if ((dword_100020048 & 0x80000000) == 0)
    {
      dword_100020048 = -1;
      return close(v10);
    }

    return 0LL;
  }

  uint64_t v7 = open("/dev/fsevents", 0);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    int v15 = a3;
    int v16 = a4;
    v17 = &dword_100020048;
    uint64_t v14 = a2;
    uint64_t v9 = ioctl(v7, 0x80187301uLL, &v14);
    if ((v9 & 0x80000000) != 0)
    {
      uint64_t v12 = v9;
      uint64_t v13 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100014DD0(v13);
      }
      close(v8);
      return v12;
    }

    close(v8);
    return 0LL;
  }

  return v8;
}

const char *sub_100004B84(int a1, char *__s1, _BYTE *a3)
{
  int v3 = __s1;
  *a3 = 0;
  if (a1)
  {
    if (!strncmp(__s1, "/.docid/", 8uLL) || !strncmp(v3, "/.activity/", 0xBuLL))
    {
      ++v3;
    }

    else
    {
      sub_100004940((uint64_t)&unk_100021758);
      uint64_t v6 = qword_1000206E8;
      if (!qword_1000206E8) {
        goto LABEL_25;
      }
      if (*(int *)(qword_1000206E8 + 8) < 1)
      {
        LODWORD(v7) = 0;
      }

      else
      {
        uint64_t v7 = 0LL;
        do
        {
          if (**(_DWORD **)(*(void *)v6 + 8 * v7) == a1)
          {
            if ((*(_DWORD *)(*(void *)(*(void *)v6 + 8 * v7) + 32LL) & 0x8000) != 0)
            {
              *a3 = 1;
            }

            else if ((*(_DWORD *)(*(void *)(*(void *)v6 + 8 * v7) + 32LL) & 0x50) == 0)
            {
              break;
            }
          }

          ++v7;
        }

        while (v7 < *(int *)(v6 + 8));
      }

      if ((int)v7 < *(_DWORD *)(v6 + 8))
      {
        int v8 = *(_DWORD *)(*(void *)(*(void *)v6 + 8LL * v7) + 24LL);
        if (v8 < 1)
        {
          LODWORD(v9) = 0;
        }

        else
        {
          uint64_t v9 = 0LL;
          do
          {
            if (v3[v9] == 47)
            {
              --v8;
            }

            else if (!v3[v9])
            {
              break;
            }

            ++v9;
          }

          while (v8 > 0);
        }

        sub_1000048C0((uint64_t)&unk_100021758);
        v3 += v9;
      }

      else
      {
LABEL_25:
        sub_1000048C0((uint64_t)&unk_100021758);
      }
    }
  }

  return v3;
}

uint64_t sub_100004CEC(void (*a1)(void))
{
  uint64_t v2 = qword_1000206E8;
  if (qword_1000206E8 && *(int *)(qword_1000206E8 + 8) >= 1)
  {
    uint64_t v3 = 0LL;
    do
    {
      if (*(void *)(*(void *)v2 + 8 * v3) && (*(_DWORD *)(*(void *)(*(void *)v2 + 8 * v3) + 32LL) & 0x20) != 0) {
        a1(*(void *)(*(void *)v2 + 8 * v3));
      }
      ++v3;
    }

    while (v3 < *(int *)(v2 + 8));
  }

  return sub_1000048C0((uint64_t)&unk_100021758);
}

uint64_t sub_100004D78(uint64_t (*a1)(void))
{
  if (qword_1000206E8)
  {
    uint64_t v2 = calloc(*(int *)(qword_1000206E8 + 8), 8uLL);
    if (v2)
    {
      uint64_t v3 = v2;
      memcpy(v2, *(const void **)qword_1000206E8, 8LL * *(int *)(qword_1000206E8 + 8));
      int v4 = *(_DWORD *)(qword_1000206E8 + 8);
      if (v4 <= 0)
      {
        sub_1000048C0((uint64_t)&unk_100021758);
        uint64_t v14 = 0LL;
      }

      else
      {
        uint64_t v5 = (v4 - 1);
        uint64_t v6 = v5;
        do
        {
          uint64_t v7 = v3[v6];
          if ((*(_DWORD *)(v7 + 32) & 0x50) != 0)
          {
            v3[v6] = 0LL;
          }

          else
          {
            int v8 = (unsigned int *)(v7 + 36);
            do
              unsigned int v9 = __ldxr(v8);
            while (__stxr(v9 + 1, v8));
          }

          BOOL v10 = v6-- <= 0;
        }

        while (!v10);
        sub_1000048C0((uint64_t)&unk_100021758);
        uint64_t v11 = v5;
        while (1)
        {
          uint64_t v12 = v3[v11];
          if (v12)
          {
            if ((*(_DWORD *)(v12 + 32) & 0x50) == 0)
            {
              uint64_t v13 = a1();
              if ((_DWORD)v13) {
                break;
              }
            }
          }

          BOOL v10 = v11-- <= 0;
          if (v10)
          {
            uint64_t v14 = 0LL;
            goto LABEL_18;
          }
        }

        uint64_t v14 = v13;
        do
        {
LABEL_18:
          uint64_t v15 = v3[v5];
          if (v15)
          {
            int v16 = (unsigned int *)(v15 + 36);
            do
              unsigned int v17 = __ldxr(v16);
            while (__stxr(v17 - 1, v16));
          }

          BOOL v10 = v5-- <= 0;
        }

        while (!v10);
      }

      free(v3);
    }

    else
    {
      v18 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100014E44();
      }
      sub_1000048C0((uint64_t)&unk_100021758);
      return 12LL;
    }
  }

  else
  {
    sub_1000048C0((uint64_t)&unk_100021758);
    return 0LL;
  }

  return v14;
}

uint64_t sub_100004F34(int a1)
{
  uint64_t v1 = (uint64_t *)qword_1000206E8;
  if (!qword_1000206E8) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t result = 0LL;
  unsigned int v6 = -1;
  do
  {
    if ((*(_DWORD *)(*(void *)(*(void *)qword_1000206E8 + v3) + 32LL) & 0x4010) == 0)
    {
      uint64_t v7 = *(void *)(*(void *)qword_1000206E8 + v3);
      if (*(_DWORD *)v7 == a1)
      {
        if (*(void *)(v7 + 128))
        {
          uint64_t v8 = *(void *)qword_1000206E8 + v3;
          return *(void *)v8;
        }

        unsigned int v6 = v4;
      }

      else if ((*(_DWORD *)(v7 + 32) & 1) != 0)
      {
        uint64_t result = *(void *)(*(void *)qword_1000206E8 + v3);
      }
    }

    ++v4;
    v3 += 8LL;
  }

  while (v4 < *(int *)(qword_1000206E8 + 8));
  if ((v6 & 0x80000000) == 0)
  {
    uint64_t v8 = *(void *)qword_1000206E8 + 8LL * v6;
    return *(void *)v8;
  }

  if (!result)
  {
LABEL_15:
    unsigned int v9 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100014EB4();
    }
    uint64_t v8 = *v1;
    return *(void *)v8;
  }

  return result;
}

void sub_100005030(const char *a1, char *a2)
{
  __int128 v12 = xmmword_100019214;
  uint64_t v13 = 0LL;
  if (a1 && a2)
  {
    if (getattrlist(a1, &v12, v14, 0x14uLL, 0))
    {
      uint64_t v3 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_100014F50();
      }
    }

    else
    {
      uuid_unparse(v15, a2);
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014EE0(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

uint64_t sub_100005104(uint32_t *a1)
{
  uint32_t v1 = *a1;
  uint32_t v9 = *a1;
  if ((a1[8] & 0x400) != 0)
  {
    uint64_t v11 = 0LL;
    if (dword_1000206C8)
    {
LABEL_27:
      v12.f_bsize = v1;
      ioctl(dword_100020048, 0x80047368uLL, &v12);
      return 0LL;
    }

    if (qword_100020748 && *(void *)(qword_100020748 + 16)) {
      sub_100007658();
    }
    sub_100004940((uint64_t)&unk_100021758);
    if (sub_100011754(&v9, &v11))
    {
LABEL_26:
      sub_1000048C0((uint64_t)&unk_100021758);
      goto LABEL_27;
    }

    uint64_t v2 = v11;
    if (v11)
    {
      if (statfs(*(const char **)(v11 + 8), &v12))
      {
        uint64_t v3 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          sub_100014FD0();
        }
      }

      else
      {
        if (v10 == 2)
        {
          int v4 = *(_DWORD *)(v2 + 32) | 0x9040;
        }

        else
        {
          if (v10 != 1) {
            goto LABEL_17;
          }
          int v4 = *(_DWORD *)(v2 + 32) | 0x1000;
        }

        *(_DWORD *)(v2 + 32) = v4;
      }
    }

LABEL_17:
    if ((*(_DWORD *)(v2 + 32) & 1) == 0)
    {
      *(_DWORD *)(v2 + 32) &= ~4u;
      *(_DWORD *)(v2 + 32) |= 0x80u;
      *(_DWORD *)(v2 + 32) &= ~0x400u;
      uint64_t v5 = (unsigned int *)(v2 + 36);
      do
        unsigned int v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
      sub_1000048C0((uint64_t)&unk_100021758);
      if (qword_100020748 && *(void *)(qword_100020748 + 16)) {
        sub_100007658();
      }
      sub_1000075C4(*(_DWORD *)v2, 1);
      usleep(0xC350u);
      do
        unsigned int v7 = __ldxr(v5);
      while (__stxr(v7 - 1, v5));
      sub_10000E0C8(v2);
      *(void *)(v2 + 40) = time(0LL);
      goto LABEL_27;
    }

    goto LABEL_26;
  }

  return 0LL;
}

uint64_t sub_100005300()
{
  zone = malloc_create_zone(0x10000uLL, 0);
  qword_1000206B8 = (uint64_t)zone;
  if (zone) {
    malloc_set_zone_name(zone, "DiskLoggerBufferZone");
  }
  uint64_t v38 = 0LL;
  int v1 = sub_100005764(&v38);
  if (v1 < 1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = v1;
  sub_1000047CC((uint64_t)&unk_100021758);
  uint64_t v3 = malloc(0x10uLL);
  if (!v3)
  {
    free(v38);
    return 12LL;
  }

  int v4 = v3;
  uint64_t v5 = calloc(v2, 8uLL);
  if (!v5)
  {
    free(v4);
    uint64_t v30 = v38;
    goto LABEL_41;
  }

  unsigned int v6 = v5;
  uint64_t v36 = v4;
  uint64_t v7 = 0LL;
  while (1)
  {
    uint64_t v8 = calloc(0x88uLL, 1uLL);
    v6[v7] = v8;
    if (!v8) {
      break;
    }
    uint32_t v9 = v8;
    int v10 = v38;
    uint64_t v11 = (char *)v38 + 2168 * v7;
    int v13 = *((_DWORD *)v11 + 12);
    statfs v12 = v11 + 48;
    *uint64_t v8 = v13;
    uint64_t v14 = strdup(v12 + 40);
    *((void *)v9 + 1) = v14;
    if (sub_1000057F8(v12 + 40, __s1))
    {
      *(void *)(v6[v7] + 16LL) = strdup(__s1);
      uint64_t v14 = *(char **)(v6[v7] + 16LL);
    }

    else
    {
      uint64_t v15 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v25 = *(_DWORD *)v6[v7];
        *(_DWORD *)buf = 136315650;
        uint64_t v40 = "init_dev_info";
        __int16 v41 = 2080;
        uint64_t v42 = v12 + 40;
        __int16 v43 = 1024;
        int v44 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Could not resolve nofirmlink  path, fallback to mount_point[%s] dev[%d]\n",  buf,  0x1Cu);
      }

      *(void *)(v6[v7] + 16LL) = strdup(v12 + 40);
    }

    int v16 = v14;
    do
    {
      while (1)
      {
        int v18 = *v16++;
        int v17 = v18;
        if (v18 != 47) {
          break;
        }
        ++*(_DWORD *)(v6[v7] + 24LL);
      }
    }

    while (v17);
    v19 = (_DWORD *)v6[v7];
    if (v14[1]) {
      ++v19[6];
    }
    int v20 = v10[542 * v7 + 16];
    v19[7] = v20;
    v19[8] = 4;
    if ((v20 & 0x4000) != 0)
    {
      v19[8] |= 1u;
      dword_1000206F0 = *(_DWORD *)v12;
    }

    int v37 = 0;
    else {
      int v21 = 64;
    }
    *(_DWORD *)(v6[v7] + 32LL) |= v21;
    if (v37 == 2)
    {
      v24 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = v6[v7];
        ipc_space_t v29 = *(char **)(v28 + 8);
        LODWORD(v28) = *(_DWORD *)v28;
        *(_DWORD *)buf = 136315650;
        uint64_t v40 = "init_dev_info";
        __int16 v41 = 2080;
        uint64_t v42 = v29;
        __int16 v43 = 1024;
        int v44 = v28;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: mount_point(%s) dev(%d) will be completely ignored",  buf,  0x1Cu);
      }

      int v23 = 32832;
      goto LABEL_33;
    }

    if (v37 == 1)
    {
      v22 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v6[v7];
        uint64_t v27 = *(char **)(v26 + 8);
        LODWORD(v26) = *(_DWORD *)v26;
        *(_DWORD *)buf = 136315650;
        uint64_t v40 = "init_dev_info";
        __int16 v41 = 2080;
        uint64_t v42 = v27;
        __int16 v43 = 1024;
        int v44 = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: Logging disabled (no_log) completely for device: mount_point(%s) dev(%d)",  buf,  0x1Cu);
      }

      int v23 = 4096;
LABEL_33:
      *(_DWORD *)(v6[v7] + 32LL) |= v23;
    }

    if (++v7 == v2)
    {
      uint64_t v34 = (uint64_t)v36;
      *(void *)uint64_t v36 = v6;
      v36[2] = v2;
      __dmb(0xBu);
      qword_1000206E8 = v34;
      sub_100004D78((uint64_t (*)(void))sub_100005A64);
      pthread_create((pthread_t *)&qword_100020280, 0LL, (void *(__cdecl *)(void *))sub_1000064EC, 0LL);
      free(v38);
      return 0LL;
    }
  }

  uint64_t v31 = (os_log_s *)sub_1000031E4();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
  uint64_t v33 = v38;
  if (v32) {
    sub_100015040();
  }
  free(v6);
  free(v36);
  uint64_t v30 = v33;
LABEL_41:
  free(v30);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100005764(void *a1)
{
  int v2 = 1000;
  while (1)
  {
    int v3 = getfsstat(0LL, 0, 2);
    if (v3 < 0) {
      return 0LL;
    }
    int v4 = 2168 * v3 + 2168;
    uint64_t result = (uint64_t)malloc(v4);
    if (!result) {
      return result;
    }
    unsigned int v6 = (void *)result;
    uint64_t result = getfsstat((statfs *)result, v4, 2);
    if ((result & 0x80000000) == 0) {
      goto LABEL_7;
    }
    free(v6);
    if (!--v2)
    {
      unsigned int v6 = 0LL;
      uint64_t result = 0xFFFFFFFFLL;
LABEL_7:
      *a1 = v6;
      return result;
    }
  }

char *sub_1000057F8(const char *a1, char *a2)
{
  __int128 v5 = xmmword_10001922C;
  uint64_t v6 = 0x2000000000LL;
  DWORD1(v5) = 0x80000000;
  if (getattrlist(a1, &v5, v7, 0x420uLL, 0x20u) == -1)
  {
    int v3 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000150B8();
    }
    return 0LL;
  }

  else if (a2)
  {
    strlcpy(a2, (const char *)v8 + v8[0], 0x400uLL);
  }

  else
  {
    return (char *)v8 + v8[0];
  }

  return a2;
}

uint64_t sub_1000058E0(uint64_t a1, int *a2)
{
  if (a2) {
    *a2 = 0;
  }
  if ((*(_BYTE *)(a1 + 65) & 0x40) != 0) {
    return 1LL;
  }
  snprintf(__str, 0x400uLL, "%s/.fseventsd/no_log", (const char *)(a1 + 88));
  if ((*(_BYTE *)(a1 + 65) & 0x10) != 0 && !lstat(__str, &v8))
  {
    if (!a2) {
      return 0LL;
    }
    uint64_t result = 0LL;
    int v6 = 1;
    goto LABEL_18;
  }

  snprintf(__str, 0x400uLL, "%s/.fseventsd/ignore", (const char *)(a1 + 88));
  int v4 = *(_DWORD *)(a1 + 64);
  if ((v4 & 0x1000) == 0) {
    goto LABEL_9;
  }
  if (!lstat(__str, &v8))
  {
    if (!a2) {
      return 0LL;
    }
    uint64_t result = 0LL;
    int v6 = 2;
LABEL_18:
    *a2 = v6;
    return result;
  }

  int v4 = *(_DWORD *)(a1 + 64);
LABEL_9:
  if ((v4 & 0x21) != 0) {
    return 0LL;
  }
  if ((v4 & 0x100000) != 0)
  {
    uint64_t v7 = strstr((const char *)(a1 + 88), "/Users/");
    uint64_t result = 0LL;
    if ((v4 & 0x1000) == 0 || !v7) {
      return result;
    }
  }

  else if ((v4 & 0x1000) == 0)
  {
    return 0LL;
  }

  uint64_t result = strcmp((const char *)(a1 + 88), "/dev");
  if ((_DWORD)result)
  {
    uint64_t result = strcmp((const char *)(a1 + 72), "acfs");
    if ((_DWORD)result) {
      return (v4 & 0x200) == 0 && strcmp((const char *)(a1 + 88), "/private/var/wireless/baseband_data");
    }
  }

  return result;
}

uint64_t sub_100005A64(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  if (v2) {
    BOOL v3 = v2 == qword_100020748;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    int v6 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001542C();
    }
    return 0LL;
  }

  int v4 = (_DWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 32) & 0x100) == 0 || (*v4 & 0x1000) != 0 && (*v4 & 1) == 0)
  {
    __int128 v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100015138();
    }
    return 0LL;
  }

  uint32_t v9 = (char *)calloc(0x9F8uLL, 1uLL);
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = (uint64_t)v9;
  *((void *)v9 + 3) = 0x100002000LL;
  pthread_rwlock_init((pthread_rwlock_t *)(v9 + 48), 0LL);
  uint64_t v11 = *(_BYTE **)(a1 + 8);
  if (*v11 == 47 && v11[1]) {
    snprintf((char *)(v10 + 256), 0x400uLL, "%s/.fseventsd", *(const char **)(a1 + 8));
  }
  else {
    __strlcpy_chk(v10 + 256, "/.fseventsd", 1024LL, 1024LL);
  }
  char v12 = 1;
  while (1)
  {
    int v13 = open((const char *)(v10 + 256), 0x20000000);
    if (v13 < 0)
    {
      uint64_t v15 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 8);
        int v19 = *(_DWORD *)a1;
        buf.f_bsize = 136315906;
        *(void *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v10 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v18;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Could not open logging directory <2> [%s] for mount[%s] dev[%d] ",  (uint8_t *)&buf,  0x26u);
      }

      memset(&v55, 0, sizeof(v55));
    }

    else
    {
      int v14 = v13;
      if (fstatfs(v13, &v61)
        || v61.f_fsid.val[0] != *(_DWORD *)a1
        || v61.f_fsid.val[0] == dword_1000206F0 && (*v4 & 1) == 0)
      {
        int v20 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = *(void *)(a1 + 8);
          int v22 = *(_DWORD *)a1;
          buf.f_bsize = 136315906;
          *(void *)&buf.f_iosize = "create_dls_callback";
          WORD2(buf.f_blocks) = 2080;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v10 + 256;
          HIWORD(buf.f_bfree) = 2080;
          buf.f_bavail = v21;
          LOWORD(buf.f_files) = 1024;
          *(_DWORD *)((char *)&buf.f_files + 2) = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Could not open logging directory <1> [%s] for mount[%s] dev[%d] ",  (uint8_t *)&buf,  0x26u);
        }

LABEL_63:
        close(v14);
LABEL_64:
        free((void *)v10);
        return 0LL;
      }

      memset(&v55, 0, sizeof(v55));
      if (fstat(v14, &v55) || (v55.st_mode & 0xF000) == 0x4000) {
        goto LABEL_58;
      }
      close(v14);
    }

    int v16 = *(unsigned __int8 **)(a1 + 8);
    int v17 = *v16;
    if ((v12 & 1) == 0) {
      break;
    }
    if (v17 == 47 && !v16[1])
    {
      __strlcpy_chk(v10 + 256, "/private/var/db/fseventsd", 1024LL, 1024LL);
      char v12 = 0;
      if ((*(_WORD *)(a1 + 28) & 0x4001) != 0) {
        goto LABEL_43;
      }
    }

    else
    {
      snprintf((char *)(v10 + 256), 0x400uLL, "%s%s", *(const char **)(a1 + 8), "/private/var/db/fseventsd");
      char v12 = 0;
    }
  }

  if (v17 == 47 && v16[1]) {
    snprintf((char *)(v10 + 256), 0x400uLL, "%s/.fseventsd", *(const char **)(a1 + 8));
  }
  else {
    __strlcpy_chk(v10 + 256, "/.fseventsd", 1024LL, 1024LL);
  }
LABEL_43:
  unlink((const char *)(v10 + 256));
  if (mkdir((const char *)(v10 + 256), 0x1C0u) && ((*v4 & 1) == 0 || *__error() != 30))
  {
    int v23 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100015394();
    }
  }

  int v24 = open((const char *)(v10 + 256), 0x20000000);
  if (v24 < 0)
  {
    uint64_t v30 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = *(void *)(a1 + 8);
      int v42 = *(_DWORD *)a1;
      buf.f_bsize = 136315906;
      *(void *)&buf.f_iosize = "create_dls_callback";
      WORD2(buf.f_blocks) = 2080;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = v10 + 256;
      HIWORD(buf.f_bfree) = 2080;
      buf.f_bavail = v41;
      LOWORD(buf.f_files) = 1024;
      *(_DWORD *)((char *)&buf.f_files + 2) = v42;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s: Could not open logging directory <3> [%s] for mount[%s] dev[%d] ",  (uint8_t *)&buf,  0x26u);
    }

    if ((*v4 & 1) == 0)
    {
      uint64_t v31 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = *(void *)(a1 + 8);
        int v33 = *(_DWORD *)a1;
        buf.f_bsize = 136315906;
        *(void *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v10 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v32;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s: Could not open logging directory <4> [%s] for mount[%s] dev[%d] ",  (uint8_t *)&buf,  0x26u);
      }

      goto LABEL_64;
    }

    strcpy((char *)(v10 + 256), "/tmp");
    int v14 = open((const char *)(v10 + 256), 0);
  }

  else
  {
    int v14 = v24;
    if ((*v4 & 1) != 0 || (*(_BYTE *)(a1 + 28) & 1) != 0)
    {
      uint64_t v27 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(a1 + 8);
        int v29 = *(_DWORD *)a1;
        buf.f_bsize = 136315906;
        *(void *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v10 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v28;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v29;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s: Use fallback log directory for read only root fs [%s] for mount[%s] dev[%d] ",  (uint8_t *)&buf,  0x26u);
      }
    }

    else
    {
      if (fstatfs(v24, &v61)
        || v61.f_fsid.val[0] != *(_DWORD *)a1
        || v61.f_fsid.val[0] == dword_1000206F0 && (*v4 & 1) == 0)
      {
        int v25 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = *(void *)(a1 + 8);
          int v54 = *(_DWORD *)a1;
          buf.f_bsize = 136315906;
          *(void *)&buf.f_iosize = "create_dls_callback";
          WORD2(buf.f_blocks) = 2080;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v10 + 256;
          HIWORD(buf.f_bfree) = 2080;
          buf.f_bavail = v53;
          LOWORD(buf.f_files) = 1024;
          *(_DWORD *)((char *)&buf.f_files + 2) = v54;
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s: Could not open logging directory <5> [%s] for mount[%s] dev[%d] ",  (uint8_t *)&buf,  0x26u);
        }

        close(v14);
        rmdir((const char *)(v10 + 256));
        goto LABEL_64;
      }

LABEL_58:
      __s1[0] = 0;
      fstatfs(v14, &v61);
      fcntl(v14, 50, __s1);
      if (v61.f_fsid.val[0] != *(_DWORD *)a1 || strcmp(__s1, (const char *)(v10 + 256)))
      {
        uint64_t v26 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100015324((uint64_t)__s1, v10 + 256);
        }
        unlink((const char *)(v10 + 256));
        goto LABEL_63;
      }
    }
  }

  uint64_t v34 = (int *)(v10 + 32);
  uint64_t v35 = (void **)(v10 + 40);
  if (sub_10000AF54( v14,  (_DWORD *)(v10 + 32),  (_DWORD *)(v10 + 36),  (void *)(v10 + 40),  (unsigned int (*)(char *))sub_10000B108,  &v57,  &v56))
  {
    uint64_t v36 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1000152C4();
    }
    goto LABEL_64;
  }

  *(_DWORD *)(v10 + 248) = 65537;
  sub_10000B16C(v10 + 2304);
  size_t v37 = *(unsigned int *)(v10 + 32);
  qsort(*v35, v37, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000B1E4);
  if (!((v56 - v57) >> 31)) {
    goto LABEL_93;
  }
  if (*v34 < 1)
  {
    LODWORD(v38) = 0;
  }

  else
  {
    uint64_t v38 = 0LL;
    __darwin_time_t v39 = 0LL;
    while (1)
    {
      snprintf(__s1, 0x400uLL, "%s/%.16llx", (const char *)(v10 + 256), *((void *)*v35 + v38));
      if (lstat(__s1, &v55)) {
        break;
      }
      if (v55.st_size)
      {
        __darwin_time_t tv_sec = v55.st_ctimespec.tv_sec;
        if (v55.st_ctimespec.tv_sec < v39)
        {
          int v44 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            buf.f_bsize = 134218498;
            *(void *)&buf.f_iosize = v55.st_ctimespec.tv_sec;
            WORD2(buf.f_blocks) = 2048;
            *(uint64_t *)((char *)&buf.f_blocks + 6) = v39;
            HIWORD(buf.f_bfree) = 2080;
            buf.f_bavail = v10 + 256;
            _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Log files out of order (%ld < %ld) in %s.",  (uint8_t *)&buf,  0x20u);
          }

          goto LABEL_92;
        }
      }

      else
      {
        __darwin_time_t tv_sec = v39;
      }

      ++v38;
      __darwin_time_t v39 = tv_sec;
      if (v38 >= *v34) {
        goto LABEL_92;
      }
    }

    __int16 v43 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_100015264();
    }
  }

LABEL_92:
  if ((_DWORD)v38 != *v34)
  {
    uint64_t v52 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_100015204();
    }
    char v45 = 0;
  }

  else
  {
LABEL_93:
    char v45 = 1;
  }

  if ((*v4 & 0x2000) == 0) {
    sub_10000A734(a1, v10);
  }
  uint64_t v46 = *v34;
  if ((int)v46 >= 1)
  {
    uint64_t v47 = v46 + 1;
    while (sub_10000B1FC(v10, *(void *)(*(void *)(v10 + 40) + 8LL * (v47 - 2)), &v58))
    {
      goto LABEL_106;
    }

    if (v58 > qword_1000206D0[dword_1000206E0])
    {
      qword_1000206D0[dword_1000206E0 ^ 1LL] = v58;
      do
        unsigned int v48 = __ldaxr((unsigned int *)&dword_1000206E0);
      while (__stlxr(v48 ^ 1, (unsigned int *)&dword_1000206E0));
    }
  }

LABEL_106:
  *(void *)(v10 + 8) = 0LL;
  if (sub_10000BA90(a1, v10))
  {
    if ((*v4 & 1) == 0 || strcmp((const char *)(v10 + 256), "/tmp"))
    {
      uint64_t v49 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1000151A4();
      }
    }

    goto LABEL_112;
  }

  if ((v45 & 1) == 0)
  {
LABEL_112:
    sub_10000ABB0(v10, 1);
    sub_10000ADA8(a1, v10);
  }

  *(void *)(a1 + 128) = v10;
  if ((*(_DWORD *)(a1 + 32) & 1) != 0)
  {
    qword_100020748 = v10;
    uint64_t v50 = v10;
  }

  else
  {
    uint64_t v50 = qword_100020748;
    if (!qword_100020748) {
      return 0LL;
    }
  }

  uint64_t v51 = *(void *)(v50 + 16);
  if (v51) {
    *(void *)(v10 + 16) = v51;
  }
  return 0LL;
}

uint64_t sub_1000064EC()
{
  qword_1000206F8 = (uint64_t)CFRunLoopGetCurrent();
  setiopolicy_np(0, 1, 2);
  CFFileDescriptorNativeDescriptor v0 = sub_10001184C();
  if (v0 < 0)
  {
    int v1 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100015570();
    }
  }

  uint64_t v2 = CFFileDescriptorCreate(0LL, v0, 1u, (CFFileDescriptorCallBack)sub_1000118C0, 0LL);
  if (v2)
  {
    BOOL v3 = v2;
    RunLoopSource = CFFileDescriptorCreateRunLoopSource(0LL, v2, 0LL);
    if (RunLoopSource)
    {
      __int128 v5 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000206F8, RunLoopSource, kCFRunLoopDefaultMode);
      CFRelease(v5);
      CFFileDescriptorEnableCallBacks(v3, 1uLL);
    }

    else
    {
      int v14 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100015500(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      CFFileDescriptorInvalidate(v3);
      CFRelease(v3);
    }
  }

  else
  {
    int v6 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100015490(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  CFRunLoopRun();
  return 0LL;
}

uint64_t sub_100006624()
{
  if (qword_1000206F8) {
    CFRunLoopStop((CFRunLoopRef)qword_1000206F8);
  }
  return pthread_join((pthread_t)qword_100020280, 0LL);
}

char *sub_100006654(const char *a1, size_t a2)
{
  size_t v2 = a2;
  if (a1[a2 - 1] && !a1[a2]) {
    size_t v2 = a2 + 1;
  }
  int v4 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    unsigned int v5 = 0;
    int v6 = (unsigned __int8 *)(a1 + 1);
    do
    {
      unsigned int v5 = dword_100020298[v4 ^ HIBYTE(v5)] ^ (v5 << 8);
      int v7 = *v6++;
      int v4 = v7;
    }

    while (v7);
  }

  else
  {
    unsigned int v5 = 0;
  }

  if (v5 <= 1) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  pthread_mutex_lock(&stru_100020050);
  uint64_t v9 = (char **)(qword_100021848 + 8LL * (HIDWORD(qword_100021850) & v8));
  uint64_t v10 = *v9;
  if (*v9)
  {
    while (strncmp(v10 + 20, a1, v2) || v10[v2 + 19])
    {
      uint64_t v10 = *(char **)v10;
      if (!v10) {
        goto LABEL_16;
      }
    }

    uint64_t v13 = (uint64_t *)(v10 + 16);
  }

  else
  {
LABEL_16:
    uint64_t v11 = (char *)malloc_zone_malloc((malloc_zone_t *)qword_1000206A8, v2 + 24);
    if (!v11)
    {
      pthread_mutex_unlock(&stru_100020050);
      return 0LL;
    }

    uint64_t v10 = v11;
    *((_DWORD *)v11 + 4) = 1;
    strlcpy(v11 + 20, a1, v2);
    uint64_t v12 = *v9;
    *(void *)uint64_t v10 = *v9;
    if (v12) {
      *((void *)v12 + 1) = v10;
    }
    *uint64_t v9 = v10;
    *((void *)v10 + 1) = v9;
    uint64_t v13 = &qword_100021850;
  }

  ++*(_DWORD *)v13;
  pthread_mutex_unlock(&stru_100020050);
  return v10 + 20;
}

uint64_t sub_1000067B8(_BYTE *a1, int a2)
{
  if (a2)
  {
    unsigned int v2 = 0;
    do
    {
      int v3 = *a1++;
      unsigned int v2 = dword_100020298[v3 ^ HIBYTE(v2)] ^ (v2 << 8);
      --a2;
    }

    while (a2);
  }

  else
  {
    int v4 = *a1;
    if (*a1)
    {
      unsigned int v2 = 0;
      unsigned int v5 = a1 + 1;
      do
      {
        unsigned int v2 = dword_100020298[v4 ^ HIBYTE(v2)] ^ (v2 << 8);
        int v6 = *v5++;
        int v4 = v6;
      }

      while (v6);
    }

    else
    {
      unsigned int v2 = 0;
    }
  }

  if (v2 <= 1) {
    return 1LL;
  }
  else {
    return v2;
  }
}

uint64_t sub_100006824(const char *a1, size_t a2)
{
  size_t v2 = a2;
  if (a1[a2 - 1] && !a1[a2]) {
    size_t v2 = a2 + 1;
  }
  int v4 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    unsigned int v5 = 0;
    int v6 = (unsigned __int8 *)(a1 + 1);
    do
    {
      unsigned int v5 = dword_100020298[v4 ^ HIBYTE(v5)] ^ (v5 << 8);
      int v7 = *v6++;
      int v4 = v7;
    }

    while (v7);
  }

  else
  {
    unsigned int v5 = 0;
  }

  if (v5 <= 1) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  pthread_mutex_lock(&stru_100020050);
  uint64_t v9 = *(char **)(qword_100021848 + 8LL * (HIDWORD(qword_100021850) & v8));
  if (!v9) {
    goto LABEL_16;
  }
  while (strncmp(v9 + 20, a1, v2) || v9[v2 + 19])
  {
    uint64_t v9 = *(char **)v9;
    if (!v9) {
      goto LABEL_16;
    }
  }

  int v11 = *((_DWORD *)v9 + 4) - 1;
  *((_DWORD *)v9 + 4) = v11;
  if (v11)
  {
LABEL_16:
    pthread_mutex_unlock(&stru_100020050);
  }

  else
  {
    uint64_t v12 = *(char **)v9;
    if (*(void *)v9) {
      *((void *)v12 + 1) = *((void *)v9 + 1);
    }
    **((void **)v9 + 1) = v12;
    LODWORD(qword_100021850) = qword_100021850 - 1;
    pthread_mutex_unlock(&stru_100020050);
    malloc_zone_free((malloc_zone_t *)qword_1000206A8, v9);
  }

  return 0LL;
}

uint64_t sub_10000695C(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 16);
  do
  {
    int v2 = __ldaxr(v1);
    uint64_t v3 = (v2 + 1);
  }

  while (__stlxr(v3, v1));
  if (v2 <= -2)
  {
    int v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001559C();
    }
    MEMORY[0x99] = -1159983647;
  }

  return v3;
}

uint64_t sub_1000069D8(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 16);
  do
  {
    int v2 = __ldaxr(v1);
    uint64_t v3 = (v2 - 1);
  }

  while (__stlxr(v3, v1));
  if (v2 <= 0)
  {
    int v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000156DC();
    }
    unsigned int v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100015678();
    }
    int v6 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000155FC();
    }
    MEMORY[0xAA] = -1159983646;
  }

  return v3;
}

uint64_t sub_100006A9C(uint64_t *a1)
{
  unsigned int v2 = *((_DWORD *)a1 + 5);
  if (v2 <= 0xFFFFFDFF)
  {
    unsigned int v3 = v2 + 512;
    do
    {
      uint64_t v4 = *a1;
      uint64_t v5 = (_DWORD)a1[1] & v2;
      int v6 = *(_DWORD **)(*a1 + 8LL * v5);
      if (v6)
      {
        do
        {
          uint64_t v7 = *(void *)v6;
          if (!v6[4])
          {
            if (v7) {
              *(void *)(v7 + 8) = *((void *)v6 + 1);
            }
            **((void **)v6 + 1) = v7;
            if (!*(void *)(v4 + 8 * v5))
            {
              unsigned int v8 = *((_DWORD *)a1 + 4) - 1;
              *((_DWORD *)a1 + 4) = v8;
              if (v8 > *((_DWORD *)a1 + 2))
              {
                uint64_t v9 = (os_log_s *)sub_1000031E4();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  int v10 = *((_DWORD *)a1 + 4);
                  int v11 = *((_DWORD *)a1 + 2);
                  *(_DWORD *)statfs buf = 67109376;
                  int v14 = v10;
                  __int16 v15 = 1024;
                  int v16 = v11;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "event table is screwed up! filled buckets %u / table_mask %u)",  buf,  0xEu);
                }
              }
            }

            sub_100006824(*((const char **)v6 + 15), *((__int16 *)v6 + 26));
            *((void *)v6 + 15) = 0LL;
            malloc_zone_free((malloc_zone_t *)qword_1000206C0, v6);
          }

          int v6 = (_DWORD *)v7;
        }

        while (v7);
        unsigned int v2 = *((_DWORD *)a1 + 5);
      }

      *((_DWORD *)a1 + 5) = ++v2;
    }

    while (v2 < v3);
  }

  return pthread_mutex_unlock(&stru_100020100);
}

uint64_t sub_100006C38(_DWORD *a1)
{
  int v3 = a1[60];
  int v2 = a1[61];
  if (v3 <= v2) {
    return (v2 - v3);
  }
  else {
    return (a1[56] - v3 + v2);
  }
}

uint64_t sub_100006C88(uint64_t a1)
{
  int v2 = (unsigned int *)malloc(0x10uLL);
  if (!v2) {
    return 12LL;
  }
  int v3 = v2;
  if (qword_100020708)
  {
    *(_OWORD *)int v2 = *(_OWORD *)qword_100020708;
  }

  else
  {
    *(void *)int v2 = 0LL;
    *((void *)v2 + 1) = 0LL;
  }

  uint64_t v4 = *(int *)(a1 + 128);
  uint64_t v5 = (int *)malloc(4 * v4);
  if (!v5) {
    goto LABEL_55;
  }
  int v6 = v5;
  uint64_t v7 = v4;
  uint64_t v8 = v3[2];
  uint64_t v36 = (uint64_t)v3;
  if ((int)v4 < 1)
  {
    int v15 = v3[3];
    int v16 = 8 * v15;
LABEL_26:
    v15 += 128;
    goto LABEL_27;
  }

  uint64_t v9 = 0LL;
  int v10 = 0;
  do
  {
    if ((int)v8 < 1)
    {
LABEL_18:
      v6[v9] = -1;
      ++v10;
    }

    else
    {
      uint64_t v11 = 0LL;
      int v12 = *(_DWORD *)(a1 + 112);
      uint64_t v13 = *(void **)v36;
      while (1)
      {
        uint64_t v14 = v13[v11];
        if ((!v12 || v12 == *(_DWORD *)(v14 + 8))
          && !strcmp(*(const char **)(*(void *)(a1 + 136) + 8 * v9), *(const char **)v14)
          && ((*(_DWORD *)(a1 + 188) & 0x100) != 0 && (*(_WORD *)(v14 + 14) & 1) != 0
           || (*(_DWORD *)(a1 + 188) & 0x100) == 0 && (*(_WORD *)(v14 + 14) & 1) == 0))
        {
          break;
        }

        if (v8 == ++v11) {
          goto LABEL_18;
        }
      }

      v6[v9] = v11;
      ++*(_DWORD *)(v14 + 16);
    }

    ++v9;
  }

  while (v9 != v7);
  int v15 = *(_DWORD *)(v36 + 12);
  int v16 = 8 * v15;
  if (v10 <= 127) {
    goto LABEL_26;
  }
  v15 += (v10 + 31) & 0xFFFFFFE0;
LABEL_27:
  uint64_t v17 = (char *)calloc(v15, 8uLL);
  if (!v17)
  {
    free(v6);
    uint64_t v31 = (void *)v36;
    goto LABEL_56;
  }

  uint64_t v18 = v17;
  if (*(void *)v36) {
    memcpy(v17, *(const void **)v36, v16);
  }
  int v19 = *(_DWORD *)(v36 + 8);
  int v20 = *(_DWORD *)(a1 + 128);
  if (v20 < 1)
  {
LABEL_38:
    qsort(v18, v19, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100007010);
    *(void *)uint64_t v36 = v18;
    *(_DWORD *)(v36 + 8) = v19;
    *(_DWORD *)(v36 + 12) = v15;
    uint64_t v28 = (void **)qword_100020708;
    qword_100020708 = v36;
    __dmb(0xBu);
    do
    {
      do
        unsigned int v29 = __ldxr(&dword_100020718);
      while (__stxr(v29, &dword_100020718));
      if (!v29) {
        break;
      }
      usleep(0x2710u);
    }

    while ((void **)qword_100020710 == v28);
    if (v28)
    {
      free(*v28);
      free(v28);
    }

    free(v6);
    return 0LL;
  }

  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  while (1)
  {
    uint64_t v23 = v6[v22];
    if ((_DWORD)v23 == -1) {
      break;
    }
    *(void *)(*(void *)(a1 + 200) + v21 + 8) = *(void *)(*(void *)&v18[8 * v23] + 24LL);
    __dmb(0xBu);
    *(void *)(*(void *)&v18[8 * v6[v22]] + 24LL) = *(void *)(a1 + 200) + v21;
    int v20 = *(_DWORD *)(a1 + 128);
LABEL_37:
    ++v22;
    v21 += 16LL;
    if (v22 >= v20) {
      goto LABEL_38;
    }
  }

  int v24 = malloc(0x20uLL);
  *(void *)&v18[8 * v19] = v24;
  if (!v24) {
    goto LABEL_47;
  }
  int v25 = v24;
  uint64_t v26 = *(void *)(a1 + 136);
  uint64_t v27 = strdup(*(const char **)(v26 + 8 * v22));
  *(void *)int v25 = v27;
  if (v27)
  {
    v25[2] = *(_DWORD *)(a1 + 112);
    *((_WORD *)v25 + 6) = strlen(*(const char **)(v26 + 8 * v22));
    *((_WORD *)v25 + 7) = (*(_DWORD *)(a1 + 188) >> 8) & 1;
    v25[4] = 1;
    *((void *)v25 + 3) = *(void *)(a1 + 200) + v21;
    ++v19;
    goto LABEL_37;
  }

  free(v25);
LABEL_47:
  uint64_t v32 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_10001573C();
  }
  int v3 = (unsigned int *)v36;
  uint64_t v33 = *(int *)(v36 + 8);
  if ((int)v33 < v19)
  {
    uint64_t v34 = (void **)&v18[8 * v33];
    uint64_t v35 = v19 - v33;
    do
    {
      if (*v34) {
        free(*v34);
      }
      ++v34;
      --v35;
    }

    while (v35);
  }

  free(v18);
  free(v6);
LABEL_55:
  uint64_t v31 = v3;
LABEL_56:
  free(v31);
  return 12LL;
}

uint64_t sub_100007010(const char ***a1, const char ***a2)
{
  return -strcmp(**a1, **a2);
}

uint64_t sub_100007038(uint64_t a1)
{
  int v1 = (_OWORD *)qword_100020708;
  if (qword_100020708)
  {
    int v3 = (int *)malloc(0x10uLL);
    if (v3)
    {
      uint64_t v4 = (uint64_t)v3;
      *(_OWORD *)int v3 = *v1;
      uint64_t v5 = malloc(8LL * v3[3]);
      if (v5)
      {
        int v6 = v5;
        pthread_mutex_lock(&stru_100020180);
        memcpy(v6, *(const void **)v4, 8LL * *(int *)(v4 + 12));
        *(void *)uint64_t v4 = v6;
        if (*(int *)(a1 + 128) >= 1)
        {
          uint64_t v7 = 0LL;
          uint64_t v8 = 0LL;
          while (1)
          {
            uint64_t v9 = *(unsigned int *)(v4 + 8);
            if ((int)v9 < 1)
            {
              LODWORD(v10) = 0;
              goto LABEL_31;
            }

            uint64_t v10 = 0LL;
            int v11 = *(_DWORD *)(a1 + 112);
            int v12 = *(void **)v4;
            while (1)
            {
              uint64_t v13 = v12[v10];
              if ((!v11 || v11 == *(_DWORD *)(v13 + 8))
                && !strcmp(*(const char **)(*(void *)(a1 + 136) + 8 * v7), *(const char **)v13))
              {
                uint64_t v14 = *(void **)(v13 + 24);
                if (v14) {
                  break;
                }
              }

LABEL_16:
              if (++v10 == v9)
              {
                LODWORD(v10) = v9;
                goto LABEL_31;
              }
            }

            int v15 = 0LL;
            while (1)
            {
              int v16 = v14;
              if (*v14 == a1 && v14 == (void *)(*(void *)(a1 + 200) + 16 * v7)) {
                break;
              }
              uint64_t v14 = (void *)v14[1];
              int v15 = v16;
              if (!v14) {
                goto LABEL_16;
              }
            }

            uint64_t v17 = v14[1];
            if (v15)
            {
              v15[1] = v17;
            }

            else
            {
              *(void *)(v13 + 24) = v17;
              int v12 = *(void **)v4;
            }

            v16[1] = 0LL;
            uint64_t v18 = (char *)&v12[v10];
            uint64_t v19 = *(void *)v18;
            uint64_t v20 = *(void *)(*(void *)v18 + 24LL);
            int v21 = *(_DWORD *)(*(void *)v18 + 16LL) - 1;
            *(_DWORD *)(*(void *)v18 + 16LL) = v21;
            if (v21) {
              break;
            }
            if (v20)
            {
              uint64_t v26 = (os_log_s *)sub_1000031E4();
              if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
              uint64_t v27 = *(void *)(*(void *)v4 + 8 * v10);
              *(_DWORD *)statfs buf = 67109376;
              LODWORD(v36[0]) = v10;
              WORD2(v36[0]) = 2048;
              *(void *)((char *)v36 + 6) = v27;
              int v24 = v26;
              int v25 = "remove_paths: prefix_table inconsistent.  refcount == 0 but client_list is non-NULL! prefix_table[%d] = %p";
              goto LABEL_29;
            }

            *(_DWORD *)(v19 + 8) = -1;
            memmove(v18, &v12[(v10 + 1)], 8LL * (*(_DWORD *)(v4 + 8) + ~(_DWORD)v10));
            --*(_DWORD *)(v4 + 8);
            LODWORD(v10) = v10 - 1;
            *(void *)(v19 + 24) = v8;
            uint64_t v8 = v19;
LABEL_31:
            if ((int)v10 >= *(_DWORD *)(v4 + 8))
            {
              uint64_t v28 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                uint64_t v29 = *(void *)(*(void *)(a1 + 136) + 8 * v7);
                *(_DWORD *)statfs buf = 136315138;
                v36[0] = v29;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "remove_paths: did not find prefix header for path %s",  buf,  0xCu);
              }
            }
          }

          if (v20) {
            goto LABEL_31;
          }
          uint64_t v22 = (os_log_s *)sub_1000031E4();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            goto LABEL_31;
          }
          uint64_t v23 = *(void *)(*(void *)v4 + 8 * v10);
          *(_DWORD *)statfs buf = 67109376;
          LODWORD(v36[0]) = v10;
          WORD2(v36[0]) = 2048;
          *(void *)((char *)v36 + 6) = v23;
          int v24 = v22;
          int v25 = "remove_paths: prefix_table inconsistent.  refcount > 0 but client_list is NULL! prefix_table[%d] = %p";
LABEL_29:
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
          goto LABEL_31;
        }

        uint64_t v8 = 0LL;
LABEL_39:
        pthread_mutex_unlock(&stru_100020180);
        uint64_t v31 = (void **)qword_100020708;
        qword_100020708 = v4;
        __dmb(0xBu);
        do
        {
          do
            unsigned int v32 = __ldxr(&dword_100020718);
          while (__stxr(v32, &dword_100020718));
          if (!v32) {
            break;
          }
          usleep(0x2710u);
        }

        while ((void **)qword_100020710 == v31);
        if (v31)
        {
          free(*v31);
          free(v31);
        }

        if (v8)
        {
          do
          {
            uint64_t v33 = *(void *)(v8 + 24);
            free(*(void **)v8);
            *(void *)&__int128 v34 = 0xD9D9D9D9D9D9D9D9LL;
            *((void *)&v34 + 1) = 0xD9D9D9D9D9D9D9D9LL;
            *(_OWORD *)uint64_t v8 = v34;
            *(_OWORD *)(v8 + 16) = v34;
            free((void *)v8);
            uint64_t v8 = v33;
          }

          while (v33);
        }

        return 0LL;
      }

      free((void *)v4);
    }

    return 12LL;
  }

  return 0LL;
}

    uint64_t v9 = v5[1];
    uint64_t v10 = v5[3];
    if (v9 == v5[2] && v9 == v10)
    {
      uint64_t v10 = 0;
      *((void *)v5 + 1) = 0LL;
      v5[1] = 0;
    }

    int v12 = *v5 - (uint64_t)v10;
    pthread_mutex_unlock(&stru_1000201C0);
    uint64_t v13 = read(dword_100020048, (void *)(*((void *)v5 + 3) + v10), v12);
    if (v13 < 0)
    {
      if (*__error() == 9) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v14 = v13;
      if (v13)
      {
        if (v13 <= v12)
        {
          v5[3] += v13;
          pthread_mutex_lock(&stru_1000201C0);
          pthread_cond_signal(&stru_100020200);
          pthread_mutex_unlock(&stru_1000201C0);
        }

        else
        {
          int v15 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = 134218240;
            int v21 = v14;
            uint64_t v22 = 1024;
            uint64_t v23 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "fsevent_producer: ************* DANGER : read %zd bytes but buffer is only %u",  (uint8_t *)&v20,  0x12u);
          }
        }
      }

      else if (dword_1000206C8)
      {
        goto LABEL_4;
      }
    }

    goto LABEL_35;
  }

uint64_t sub_1000073FC(uint64_t a1)
{
  int v1 = 0LL;
  int v3 = (int *)(a1 + 248);
  int v2 = *(_DWORD *)(a1 + 248);
  int v4 = -1;
  uint64_t v5 = dword_1000218D8;
  while (1)
  {
    int v7 = *v5;
    v5 += 2;
    int v6 = v7;
    if (v7) {
      int v8 = -1;
    }
    else {
      int v8 = (int)v1;
    }
    if (v4 == -1) {
      int v4 = v8;
    }
    if (v2 == v6) {
      break;
    }
    int v1 = (int *)((char *)v1 + 1);
    if (v1 == (int *)512)
    {
      if (v4 == -1)
      {
        uint64_t v22 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100015850(v22, v23, v24, v25, v26, v27, v28, v29);
        }
        return 28LL;
      }

      int v1 = &dword_1000218D8[2 * v4];
      int *v1 = v2;
      v1[1] = 0;
      LODWORD(v1) = v4;
      break;
    }
  }

  uint64_t v9 = &dword_1000218D8[2 * (int)v1];
  if (v9[1] <= 511)
  {
    for (uint64_t i = 0LL; i != 512; ++i)
    {
      if (!xmmword_100020758[i])
      {
        uint64_t v21 = 0LL;
        *(_DWORD *)(a1 + 192) = i;
        __dmb(0xBu);
        xmmword_100020758[i] = a1;
        ++v9[1];
        return v21;
      }
    }

    if ((_DWORD)v1 == v4) {
      *uint64_t v9 = 0;
    }
    uint64_t v13 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000157E4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  else
  {
    uint64_t v10 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100015768(v3, v10, v11);
    }
  }

  return 28LL;
}

uint64_t sub_100007538(unint64_t a1)
{
  uint64_t v1 = 0LL;
  int v2 = *(_DWORD *)(a1 + 248);
  do
  {
    if (v2 == dword_1000218D8[v1])
    {
      int v3 = dword_1000218D8[v1 + 1];
      BOOL v4 = __OFSUB__(v3--, 1);
      dword_1000218D8[v1 + 1] = v3;
      if ((v3 < 0) ^ v4 | (v3 == 0)) {
        dword_1000218D8[v1] = 0;
      }
    }

    v1 += 2LL;
  }

  while (v1 != 1024);
  uint64_t v5 = 0LL;
  int64x2_t v6 = vdupq_n_s64(a1);
  do
  {
    int32x2_t v7 = vmovn_s64(vceqq_s64((int64x2_t)xmmword_100020758[v5], v6));
    if ((v7.i8[0] & 1) != 0) {
      *(void *)&xmmword_100020758[v5] = 0LL;
    }
    if ((v7.i8[4] & 1) != 0) {
      *((void *)&xmmword_100020758[v5] + 1) = 0LL;
    }
    ++v5;
  }

  while (v5 != 256);
  return 0LL;
}

uint64_t sub_1000075C4(int a1, int a2)
{
  for (uint64_t i = 0LL; i != 4096; i += 8LL)
  {
    uint64_t v5 = *(void *)((char *)xmmword_100020758 + i);
    if (v5 && *(_DWORD *)(v5 + 112) == a1)
    {
      if (a2 == 1)
      {
        int v6 = 8;
      }

      else
      {
        if (a2 != 2)
        {
LABEL_9:
          sub_100007658();
          continue;
        }

        int v6 = 16;
      }

      *(_DWORD *)(v5 + 188) |= v6;
      goto LABEL_9;
    }
  }

  return pthread_mutex_unlock(&stru_100020140);
}

uint64_t sub_100007658(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 188) & 0x800) != 0)
  {
    if ((*(_DWORD *)(a1 + 188) & 0x20) != 0) {
      sub_1000158BC();
    }
    *(_DWORD *)(a1 + 188) &= ~0x800u;
    pthread_attr_init(&v4);
    pthread_attr_setdetachstate(&v4, 2);
    pthread_create(&v3, &v4, (void *(__cdecl *)(void *))sub_10000CD20, (void *)a1);
    pthread_attr_destroy(&v4);
  }

  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

uint64_t sub_100007710( uint64_t a1, int a2, int a3, char *__s1, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, int a10)
{
  do
    unsigned int v15 = __ldaxr(&dword_100020718);
  while (__stlxr(v15 + 1, &dword_100020718));
  qword_100020710 = qword_100020708;
  if (!qword_100020708)
  {
    do
      unsigned int v16 = __ldaxr(&dword_100020718);
    while (__stlxr(v16 - 1, &dword_100020718));
    return 0LL;
  }

  if ((a7 & 0x80000000) == 0)
  {
    LOBYTE(v49[0]) = 0;
    int v47 = !strncmp(__s1, "/.docid/", 8uLL) || !strncmp(__s1, "/.activity/", 0xBuLL);
    uint64_t v18 = __s1;
    if (a3) {
      uint64_t v18 = (char *)sub_100004B84(a3, __s1, v49);
    }
    if (!v18) {
      sub_1000158E4();
    }
    if (!strncmp(v18, ".Spotlight-V100", 0xFuLL)
      || !strncmp(v18, ".fseventsd", 0xAuLL)
      || !strncmp(v18, ".MobileBackups", 0xEuLL)
      || !strncmp(v18, "Backups.backupdb", 0x10uLL))
    {
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v45 = a1;
      uint64_t v17 = 0LL;
      if (!strnstr(v18, "/.ubd/", 0x400uLL) && !LOBYTE(v49[0]))
      {
        pthread_mutex_lock(&stru_100020180);
        uint64_t v19 = (void *)qword_100020710;
        if (*(int *)(qword_100020710 + 8) < 1)
        {
          uint64_t v17 = 0LL;
        }

        else
        {
          int v43 = a7;
          uint64_t v44 = a8;
          uint64_t v20 = 0LL;
          uint64_t v17 = 0LL;
          unsigned int v42 = a7 & 0xFE23F800;
          do
          {
            if (*(_DWORD *)(*(void *)(*v19 + 8 * v20) + 8LL) != -1)
            {
              unsigned int v21 = *(unsigned __int16 *)(*(void *)(*v19 + 8 * v20) + 12LL);
              if (v21 >= 2 && *(_BYTE *)(**(void **)(*v19 + 8 * v20) + v21 - 1) == 47) {
                --v21;
              }
              uint64_t v22 = __s1;
              if (a3)
              {
                if (*(_DWORD *)(*(void *)(*v19 + 8 * v20) + 8LL)) {
                  uint64_t v22 = v18;
                }
                else {
                  uint64_t v22 = __s1;
                }
              }

              if (!strncmp(**(const char ***)(*v19 + 8 * v20), v22, v21))
              {
                if (v21 < 2 || ((int v23 = v22[v21], v23 != 47) ? (v24 = v23 == 0) : (v24 = 1), v24))
                {
                  if (!*(_DWORD *)(*(void *)(*v19 + 8 * v20) + 8LL)
                    || *(_DWORD *)(*(void *)(*v19 + 8 * v20) + 8LL) == a3)
                  {
                    if ((((*(_WORD *)(*(void *)(*v19 + 8 * v20) + 14LL) & 1) == 0) & ~v47) != 0)
                    {
                      uint64_t v27 = (char *)(__s1 - v22 + a6);
                      if ((unint64_t)v27 >= v21)
                      {
                        uint64_t v28 = v27 - 1;
                        char v29 = __s1[a6 - 1];
                        __s1[a6 - 1] = 0;
                        uint64_t v30 = sub_100007BB8(v45, a2, a3, v22, v42, v44, a9, a10);
                        if (v30)
                        {
                          uint64_t v31 = v30;
                          sub_100008134(*(void *)(*(void *)(*(void *)qword_100020710 + 8 * v20) + 24LL), v30);
                          sub_1000069D8(v31);
                          uint64_t v17 = (v17 + 1);
                        }

                        v28[(void)v22] = v29;
                      }
                    }

                    else
                    {
                      uint64_t v25 = sub_100007BB8(v45, a2, a3, v22, v43, v44, a9, a10);
                      if (v25)
                      {
                        uint64_t v26 = v25;
                        sub_100008134(*(void *)(*(void *)(*(void *)qword_100020710 + 8 * v20) + 24LL), v25);
                        sub_1000069D8(v26);
                        uint64_t v17 = (v17 + 1);
                      }
                    }
                  }
                }
              }
            }

            ++v20;
            uint64_t v19 = (void *)qword_100020710;
          }

          while (v20 < *(int *)(qword_100020710 + 8));
        }

        pthread_mutex_unlock(&stru_100020180);
      }
    }

    qword_100020710 = 0LL;
    do
      unsigned int v32 = __ldaxr(&dword_100020718);
    while (__stlxr(v32 - 1, &dword_100020718));
    return v17;
  }

  uint64_t v33 = sub_100007BB8(a1, -1, 0, __s1, a7, a8, a9, a10);
  if (!v33)
  {
    uint64_t v41 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10001590C();
    }
    return 0LL;
  }

  uint64_t v34 = v33;
  do
    unsigned int v35 = __ldaxr(&dword_10002071C);
  while (__stlxr(v35 + 1, &dword_10002071C));
  uint64_t v36 = 0LL;
  uint64_t v17 = 0LL;
  do
  {
    uint64_t v37 = xmmword_100020758[v36];
    if (v37 && (*(_DWORD *)(v37 + 188) & 2) == 0)
    {
      v49[0] = xmmword_100020758[v36];
      v49[1] = 0LL;
      sub_100008134((uint64_t)v49, v34);
      uint64_t v17 = (v17 + 1);
    }

    ++v36;
  }

  while (v36 != 512);
  do
    unsigned int v38 = __ldaxr(&dword_10002071C);
  while (__stlxr(v38 - 1, &dword_10002071C));
  sub_1000069D8(v34);
  qword_100020710 = 0LL;
  do
    unsigned int v39 = __ldaxr(&dword_100020718);
  while (__stlxr(v39 - 1, &dword_100020718));
  return v17;
}

uint64_t sub_100007BB8(uint64_t a1, int a2, int a3, const char *a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8 = a5;
  int v11 = *(unsigned __int8 *)a4;
  if (*a4)
  {
    BOOL v12 = 0;
    uint64_t v13 = (unsigned __int8 *)(a4 + 1);
    uint64_t v14 = (char *)a4;
    while (1)
    {
      if (!v12 || v11 != 47)
      {
        *v14++ = v11;
        if (v14 - a4 == 1023)
        {
          *uint64_t v14 = 0;
          uint64_t v16 = 1023LL;
          goto LABEL_12;
        }

        int v11 = *(v13 - 1);
      }

      BOOL v12 = v11 == 47;
      int v15 = *v13++;
      int v11 = v15;
      if (!v15) {
        goto LABEL_10;
      }
    }
  }

  uint64_t v14 = (char *)a4;
LABEL_10:
  *uint64_t v14 = 0;
  uint64_t v16 = v14 - a4;
LABEL_12:
  size_t v17 = v16 + 1;
  if (a4[v16])
  {
    if (a4[v17])
    {
      int v71 = a4[v16];
      a4[v16] = 0;
    }

    else
    {
      int v71 = 0;
      size_t v17 = v16 + 2;
    }
  }

  else
  {
    int v71 = 0;
  }

  uint64_t v18 = (unsigned int *)(a1 + 16);
  int v19 = *(_DWORD *)(a1 + 8);
  v73 = (int *)(a1 + 8);
  if (3 * v19 + 3 <= (4 * *(_DWORD *)(a1 + 16)))
  {
    unsigned int v20 = 2 * v19 + 2;
    if (v20 >= 0x80000)
    {
      if (!*(_DWORD *)(a1 + 12))
      {
        unsigned int v21 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100015A18(a1 + 16, v73, v21);
        }
        *(_DWORD *)(a1 + 12) = 1;
      }

      goto LABEL_45;
    }

    uint64_t v22 = sub_100012408(v20, &v75);
    if (v22)
    {
      int v23 = v22;
      pthread_mutex_lock(&stru_100020100);
      int v24 = 0;
      *(void *)(a1 + 16) = 0LL;
      uint64_t v25 = *(void **)a1;
      *(void *)a1 = v23;
      unsigned int v26 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v75;
      while (1)
      {
        uint64_t v27 = (uint64_t *)v25[v24];
        if (v27) {
          break;
        }
LABEL_41:
        if (++v24 > v26)
        {
          pthread_mutex_unlock(&stru_100020100);
          free(v25);
          int v8 = a5;
          goto LABEL_45;
        }
      }

      while (1)
      {
        uint64_t v28 = (_BYTE *)v27[15];
        int v29 = *v28;
        if (*v28)
        {
          unsigned int v30 = 0;
          uint64_t v31 = v28 + 1;
          do
          {
            unsigned int v30 = dword_100020298[v29 ^ HIBYTE(v30)] ^ (v30 << 8);
            int v32 = *v31++;
            int v29 = v32;
          }

          while (v32);
        }

        else
        {
          unsigned int v30 = 0;
        }

        if (v30 <= 1) {
          unsigned int v30 = 1;
        }
        unsigned int v33 = *(_DWORD *)(a1 + 8);
        uint64_t v34 = (uint64_t *)(*(void *)a1 + 8LL * (v33 & v30));
        uint64_t v35 = *v34;
        if (*v34)
        {
          uint64_t v36 = (uint64_t *)*v27;
          *uint64_t v27 = v35;
        }

        else
        {
          unsigned int v37 = *v18 + 1;
          unsigned int *v18 = v37;
          if (v37 > v33)
          {
            unsigned int v38 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              unsigned int v39 = *v18;
              int v40 = *v73;
              *(_DWORD *)statfs buf = 67109376;
              unsigned int v77 = v39;
              __int16 v78 = 1024;
              int v79 = v40;
              _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "event table is screwed up! filled buckets %u / table_mask %u)",  buf,  0xEu);
            }
          }

          uint64_t v35 = *v34;
          uint64_t v36 = (uint64_t *)*v27;
          *uint64_t v27 = *v34;
          if (!v35) {
            goto LABEL_40;
          }
        }

        *(void *)(v35 + 8) = v27;
LABEL_40:
        uint64_t *v34 = (uint64_t)v27;
        v27[1] = (uint64_t)v34;
        uint64_t v27 = v36;
        if (!v36) {
          goto LABEL_41;
        }
      }
    }

    uint64_t v41 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100015A90();
    }
  }

LABEL_45:
  BOOL v42 = sub_100012384(a2);
  int v43 = *(unsigned __int8 *)a4;
  if (*a4)
  {
    unsigned int v44 = 0;
    uint64_t v45 = (unsigned __int8 *)(a4 + 1);
    do
    {
      unsigned int v44 = dword_100020298[v43 ^ HIBYTE(v44)] ^ (v44 << 8);
      int v46 = *v45++;
      int v43 = v46;
    }

    while (v46);
  }

  else
  {
    unsigned int v44 = 0;
  }

  if (v44 <= 1) {
    unsigned int v44 = 1;
  }
  int v47 = (uint64_t *)(*(void *)a1 + 8LL * (*(_DWORD *)(a1 + 8) & v44));
  if ((v8 & 0x6000000) == 0)
  {
    unsigned int v48 = (void *)*v47;
    if (*v47)
    {
      do
      {
        uint64_t v49 = (uint64_t)v48;
        unsigned int v48 = (void *)*v48;
        int v50 = *(_DWORD *)(v49 + 24);
        if (v42)
        {
          if (v50 != a2) {
            continue;
          }
        }

        else if (sub_100012384(v50))
        {
          continue;
        }

        if (*(void *)(v49 + 40) == a7)
        {
          uint64_t v51 = *(const char **)(v49 + 120);
          if (!strncmp(v51, a4, v17) && !v51[v17 - 1])
          {
            v63 = (unsigned int *)(v49 + 16);
            do
            {
              int v64 = __ldaxr(v63);
              uint64_t v65 = (v64 + 1);
            }

            while (__stlxr(v65, v63));
            size_t v53 = v17;
            int v54 = a8;
            if (v64 <= -2)
            {
              v66 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                sub_1000159A8(v49, v65, v66);
              }
            }

            if (*v63 == 1) {
              *(_DWORD *)(v49 + 20) = 0;
            }
            uint64_t v60 = a6;
            int v61 = a5;
            int v59 = v71;
LABEL_73:
            *(_DWORD *)(v49 + 20) |= v61;
            *(_DWORD *)(v49 + 24) = a2;
            *(void *)(v49 + 32) = v60;
            *(void *)(v49 + 40) = a7;
            *(_DWORD *)(v49 + 48) = v54;
            if (v59) {
              goto LABEL_74;
            }
            return v49;
          }
        }
      }

      while (v48);
    }
  }

  uint64_t v52 = (char *)malloc_zone_malloc((malloc_zone_t *)qword_1000206C0, 0x80uLL);
  uint64_t v49 = (uint64_t)v52;
  if (v52)
  {
    *((void *)v52 + 2) = 1LL;
    *((_DWORD *)v52 + 7) = a3;
    size_t v53 = v17;
    *((_WORD *)v52 + 26) = v17;
    *((void *)v52 + 5) = a7;
    int v54 = a8;
    *((_DWORD *)v52 + 12) = a8;
    *(_OWORD *)(v52 + 56) = 0u;
    *(_OWORD *)(v52 + 72) = 0u;
    *(_OWORD *)(v52 + 88) = 0u;
    *(_OWORD *)(v52 + 104) = 0u;
    stat v55 = sub_100006654(a4, v17);
    *(void *)(v49 + 120) = v55;
    if (v55[v17 - 1])
    {
      int v56 = dword_100020698++;
      if (v56 <= 49)
      {
        unint64_t v57 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          sub_100015938();
        }
      }
    }

    unint64_t v58 = (void *)*v47;
    if (*v47) {
      v58[1] = v49;
    }
    else {
      ++*v18;
    }
    uint64_t v60 = a6;
    int v61 = a5;
    int v59 = v71;
    *(void *)uint64_t v49 = v58;
    uint64_t *v47 = v49;
    *(void *)(v49 + 8) = v47;
    goto LABEL_73;
  }

  size_t v53 = v17;
  LOBYTE(v59) = v71;
  if (v71) {
LABEL_74:
  }
    a4[v53 - 1] = v59;
  return v49;
}

uint64_t sub_100008134(uint64_t result, uint64_t a2)
{
  pthread_t v3 = (_DWORD **)result;
  do
    unsigned int v4 = __ldaxr(&dword_10002071C);
  while (__stlxr(v4 + 1, &dword_10002071C));
  if (result)
  {
    uint64_t v5 = a2 + 56;
    do
    {
      if (((*v3)[47] & 2) == 0)
      {
        unint64_t v6 = (*v3)[48];
        int32x2_t v7 = (unsigned __int8 *)(v5 + (v6 >> 3));
        unsigned int v8 = 0x80u >> (v6 & 7);
        do
          int v9 = __ldxr(v7);
        while (__stxr(v9 | v8, v7));
        if ((v8 & v9) == 0)
        {
          uint64_t v10 = (uint64_t)*v3;
          uint64_t result = sub_100006C38(*v3);
          int v11 = *v3;
          if ((int)result >= *(_DWORD *)(v10 + 224) - 1)
          {
            unint64_t v16 = v11[48];
            size_t v17 = (unsigned __int8 *)(v5 + (v16 >> 3));
            int v18 = -129 >> (v16 & 7);
            do
              unsigned __int8 v19 = __ldxr(v17);
            while (__stxr(v19 & v18, v17));
            uint64_t v20 = (uint64_t)*v3;
            if (((*v3)[47] & 1) == 0)
            {
              *(_DWORD *)(v20 + 188) |= 1u;
              *(void *)(v20 + 152) = *(void *)(a2 + 32);
            }
          }

          else if ((v11[47] & 0x80) != 0 && *(_DWORD *)(a2 + 24) == v11[62])
          {
            unint64_t v12 = v11[48];
            uint64_t v13 = (unsigned __int8 *)(v5 + (v12 >> 3));
            int v14 = -129 >> (v12 & 7);
            do
              unsigned __int8 v15 = __ldxr(v13);
            while (__stxr(v15 & v14, v13));
          }

          else
          {
            uint64_t result = sub_10000695C(a2);
            uint64_t v21 = (uint64_t)*v3;
            *(void *)(*((void *)*v3 + 52) + 8LL * (int)(*v3)[61]) = a2;
            *(_DWORD *)(v21 + 244) = (*(_DWORD *)(v21 + 244) + 1) % *(_DWORD *)(v21 + 224);
          }
        }
      }

      pthread_t v3 = (_DWORD **)v3[1];
    }

    while (v3);
  }

  do
    unsigned int v22 = __ldaxr(&dword_10002071C);
  while (__stlxr(v22 - 1, &dword_10002071C));
  return result;
}

uint64_t sub_1000082B8()
{
  do
    unsigned int v0 = __ldaxr(&dword_10002071C);
  while (__stlxr(v0 + 1, &dword_10002071C));
  for (uint64_t i = 0LL; i != 512; ++i)
  {
    uint64_t result = xmmword_100020758[i];
    if (result && (*(_DWORD *)(result + 188) & 2) == 0 && (*(_DWORD *)(result + 188) & 0x20) != 0) {
      uint64_t result = sub_100007658(result);
    }
  }

  do
    unsigned int v3 = __ldaxr(&dword_10002071C);
  while (__stlxr(v3 - 1, &dword_10002071C));
  return result;
}

uint64_t sub_100008334(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)(a2 + 8)) {
    return 0LL;
  }
  *(void *)a2 = strdup(*(const char **)(a1 + 8));
  return 1LL;
}

BOOL sub_100008378(_OWORD *a1, const char *a2)
{
  if (a2)
  {
    unsigned int v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
    __int128 v4 = a1[1];
    *(_OWORD *)cf.val = *a1;
    *(_OWORD *)&cf.val[4] = v4;
    uint64_t v5 = SecTaskCreateWithAuditToken(0LL, &cf);
    if (v5)
    {
      unint64_t v6 = v5;
      *(void *)cf.val = 0LL;
      int32x2_t v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, v3, (CFErrorRef *)&cf);
      if (v7)
      {
        unsigned int v8 = v7;
        CFTypeID v9 = CFGetTypeID(v7);
        BOOL v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
        CFRelease(v8);
      }

      else
      {
        BOOL v10 = 0LL;
      }

      if (*(void *)cf.val) {
        CFRelease(*(CFTypeRef *)cf.val);
      }
      CFRelease(v6);
      if (v3) {
LABEL_19:
      }
        CFRelease(v3);
    }

    else
    {
      unsigned __int8 v19 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100015B2C(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      BOOL v10 = 0LL;
      if (v3) {
        goto LABEL_19;
      }
    }
  }

  else
  {
    int v11 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100015ABC(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return 0LL;
  }

  return v10;
}

uint64_t sub_1000084AC( int a1, int a2, uint64_t a3, unsigned int a4, void *a5, unsigned int a6, uint64_t a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, int a13, int a14, _OWORD *a15, unint64_t *a16)
{
  if (a2 && a4 >= 2 && a13) {
    return 22LL;
  }
  uint64_t v25 = (pthread_mutex_t *)calloc(8LL * a8 + 424, 1uLL);
  if (!v25) {
    return 12LL;
  }
  unint64_t v26 = (unint64_t)v25;
  unsigned int v52 = a6;
  uint64_t v53 = a7;
  pthread_mutex_init(v25, 0LL);
  uint64_t v27 = (pthread_cond_t *)(v26 + 64);
  pthread_cond_init((pthread_cond_t *)(v26 + 64), 0LL);
  *(_DWORD *)(v26 + 128) = a4;
  uint64_t v28 = a4;
  int v29 = calloc(a4, 8uLL);
  *(void *)(v26 + 136) = v29;
  if (!v29)
  {
    uint64_t v24 = 12LL;
LABEL_48:
    free(*(void **)(v26 + 200));
    unsigned int v44 = *(void **)(v26 + 136);
    if (v44)
    {
      if (a4)
      {
        uint64_t v45 = 0LL;
        uint64_t v46 = 8 * v28;
        do
        {
          int v47 = *(void **)(*(void *)(v26 + 136) + v45);
          if (v47)
          {
            free(v47);
            *(void *)(*(void *)(v26 + 136) + v45) = 0LL;
          }

          v45 += 8LL;
        }

        while (v46 != v45);
        unsigned int v44 = *(void **)(v26 + 136);
      }

      free(v44);
    }

    for (uint64_t i = 352LL; i != 416; i += 8LL)
    {
      free(*(void **)(v26 + i));
      *(void *)(v26 + i) = 0LL;
    }

    pthread_cond_destroy(v27);
    free((void *)v26);
    unint64_t v26 = 0LL;
    goto LABEL_59;
  }

  int v50 = a1;
  int v51 = a8;
  if (!a4) {
    goto LABEL_30;
  }
  uint64_t v30 = 0LL;
  while (1)
  {
    uint64_t v31 = *(void *)(a3 + 8 * v30);
    if (!a2)
    {
LABEL_19:
      uint64_t v35 = (const char *)v31;
      goto LABEL_21;
    }

    if (*(_BYTE *)v31 == 47 && !*(_BYTE *)(v31 + 1)) {
      break;
    }
    int v32 = strstr(*(const char **)(a3 + 8 * v30), "/.docid");
    if (v32)
    {
      if (strcmp(v32, "/.docid")) {
        goto LABEL_22;
      }
      unsigned int v33 = ".docid";
    }

    else
    {
      uint64_t v34 = strstr((const char *)v31, "/.activity");
      if (!v34) {
        goto LABEL_19;
      }
      if (strcmp(v34, "/.activity")) {
        goto LABEL_22;
      }
      unsigned int v33 = ".activity";
    }

    *(void *)(*(void *)(v26 + 136) + 8 * v30) = strdup(v33);
LABEL_23:
    if (a4 == ++v30) {
      goto LABEL_30;
    }
  }

  uint64_t v35 = (const char *)&unk_10001880E;
LABEL_21:
  *(void *)(*(void *)(v26 + 136) + 8 * v30) = strdup(v35);
LABEL_22:
  if (*(void *)(*(void *)(v26 + 136) + 8 * v30)) {
    goto LABEL_23;
  }
  uint64_t v36 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100015B9C();
  }
  if (a4 != (_DWORD)v30)
  {
    if (v30 < a4)
    {
      do
        *(void *)(*(void *)(v26 + 136) + 8 * v30++) = 0LL;
      while (a4 != v30);
    }

    uint64_t v24 = 12LL;
    goto LABEL_47;
  }

LABEL_30:
  *(_OWORD *)(v26 + 384) = 0u;
  *(_OWORD *)(v26 + 400) = 0u;
  *(_OWORD *)(v26 + 352) = 0u;
  *(_OWORD *)(v26 + 368) = 0u;
  if (v52)
  {
    uint64_t v37 = v52;
    unsigned int v38 = (char **)(v26 + 352);
    do
    {
      __strlcpy_chk(__s, *a5, 1024LL, 1024LL);
      if (__s[strlen(__s) - 1] != 47) {
        __strlcat_chk(__s, "/", 1024LL, 1024LL);
      }
      *v38++ = strdup(__s);
      ++a5;
      --v37;
    }

    while (v37);
  }

  *(_DWORD *)(v26 + 112) = a2;
  *(void *)(v26 + 208) = a11;
  *(void *)(v26 + 216) = a12;
  *(void *)(v26 + 176) = v53;
  *(_DWORD *)(v26 + 224) = v51;
  *(void *)(v26 + 232) = a9;
  *(_DWORD *)(v26 + 188) = a10;
  *(void *)(v26 + 416) = v26 + 424;
  *(_DWORD *)(v26 + 248) = v50;
  *(_DWORD *)(v26 + 252) = a13;
  *(_DWORD *)(v26 + 256) = a14;
  __int128 v39 = a15[1];
  *(_OWORD *)(v26 + 260) = *a15;
  *(_OWORD *)(v26 + 276) = v39;
  __int128 v40 = a15[1];
  *(_OWORD *)__s = *a15;
  __int128 v55 = v40;
  *(_DWORD *)(v26 + 292) = sub_100008378(__s, "com.apple.private.vfs.authorized-access");
  uint64_t v41 = (char *)malloc(16LL * a4);
  *(void *)(v26 + 200) = v41;
  if (!v41)
  {
    uint64_t v24 = 12LL;
LABEL_47:
    uint64_t v27 = (pthread_cond_t *)(v26 + 64);
    goto LABEL_48;
  }

  uint64_t v27 = (pthread_cond_t *)(v26 + 64);
  if (a4)
  {
    BOOL v42 = v41 + 8;
    uint64_t v43 = a4;
    do
    {
      *(v42 - 1) = v26;
      *BOOL v42 = 0LL;
      v42 += 2;
      --v43;
    }

    while (v43);
  }

  pthread_mutex_lock(&stru_100020140);
  uint64_t v24 = sub_1000073FC(v26);
  if ((_DWORD)v24)
  {
LABEL_42:
    pthread_mutex_unlock(&stru_100020140);
    goto LABEL_48;
  }

  uint64_t v24 = sub_100006C88(v26);
  if ((_DWORD)v24)
  {
    sub_100007538(v26);
    goto LABEL_42;
  }

  pthread_mutex_unlock(&stru_100020140);
LABEL_59:
  *a16 = v26;
  return v24;
}

uint64_t sub_100008918(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(const char **)(a1 + 40);
  size_t v5 = strlen(v4);
  uint64_t v6 = *(unsigned int *)(a2 + 32);
  if (v5 + v6 + 25 >= *(void *)(a2 + 24)) {
    return 28LL;
  }
  int v7 = v5 + 1;
  memcpy((void *)(*(void *)(a2 + 16) + v6), v4, v5 + 1);
  uint64_t result = 0LL;
  unsigned int v9 = *(_DWORD *)(a2 + 32) + v7;
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(*(void *)(a2 + 16) + v9) = *(void *)(a1 + 16);
  unsigned int v10 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(*(void *)(a2 + 16) + v10) = *(_DWORD *)(a1 + 36);
  unsigned int v11 = *(_DWORD *)(a2 + 32) + 4;
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(*(void *)(a2 + 16) + v11) = *(void *)(a1 + 24);
  unsigned int v12 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v12;
  *(_DWORD *)(*(void *)(a2 + 16) + v12) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 32) += 4;
  return result;
}

void sub_1000089F4( uint64_t a1, pthread_rwlock_t *a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  if (!a1 || (*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
  {
    pthread_rwlock_rdlock(a2);
    unsigned int v8 = (uint64_t *)malloc_zone_malloc((malloc_zone_t *)qword_1000206B0, 8LL * *(unsigned int *)&a2[1].__opaque[12]);
    if (v8)
    {
      unsigned int v9 = v8;
      uint64_t v10 = 0LL;
      size_t v11 = 0LL;
      int v12 = *(_DWORD *)a2[1].__opaque;
      else {
        uint64_t v13 = 1LL;
      }
      do
      {
        uint64_t v14 = *(void **)(a2[1].__sig + 8 * v10);
        if (v14)
        {
          size_t v15 = *(unsigned int *)&a2[1].__opaque[12];
          do
          {
            if (v11 < v15) {
              v8[v11++] = (uint64_t)v14;
            }
            uint64_t v14 = (void *)*v14;
          }

          while (v14);
        }

        ++v10;
      }

      while (v10 != v13);
      if (!a1 || (*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
      {
        qsort(v8, v11, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100008B90);
        if (v11)
        {
          size_t v16 = v11 - 1;
          uint64_t v17 = v9;
          do
          {
            if (a1 && ((*(_DWORD *)(a1 + 32) & 0x90) != 0 || (*(_DWORD *)(a1 + 32) & 4) == 0)) {
              break;
            }
            uint64_t v18 = *v17++;
          }

          while (!a3(v18, a4) && v16-- != 0);
        }
      }

      pthread_rwlock_unlock(a2);
      malloc_zone_free((malloc_zone_t *)qword_1000206B0, v9);
    }

    else
    {
      pthread_rwlock_unlock(a2);
    }
  }

uint64_t sub_100008B90(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(*(void *)a1 + 40LL), *(const char **)(*(void *)a2 + 40LL));
}

uint64_t sub_100008BA4(uint64_t a1)
{
  unsigned int v2 = 0;
  uint64_t v3 = *(void *)(a1 + 200);
  do
  {
    __int128 v4 = *(uint64_t ***)(v3 + 8LL * v2);
    if (v4)
    {
      do
      {
        size_t v5 = *v4;
        size_t v6 = strlen((const char *)v4[5]);
        sub_100006824((const char *)v4[5], v6 + 1);
        v4[5] = 0LL;
        __int128 v4 = (uint64_t **)v5;
      }

      while (v5);
      uint64_t v3 = *(void *)(a1 + 200);
    }

    *(void *)(v3 + 8LL * v2++) = 0LL;
  }

  while (v2 <= *(_DWORD *)(a1 + 208));
  *(void *)(a1 + 216) = 0LL;
  *(_DWORD *)(a1 + 244) = 0;
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void *sub_100008C34(int a1, int a2)
{
  if (a1 < 1)
  {
    int v7 = 0LL;
  }

  else
  {
    int v3 = a1;
    __int128 v4 = 0LL;
    size_t v5 = a2;
    while (1)
    {
      size_t v6 = malloc(0x28uLL);
      if (!v6) {
        break;
      }
      int v7 = v6;
      *size_t v6 = a2;
      unsigned int v8 = malloc(v5);
      *(void *)((char *)v7 + 12) = 0LL;
      *(void *)((char *)v7 + 4) = 0LL;
      v7[3] = v8;
      if (!v8)
      {
        free(v7);
        break;
      }

      v7[4] = v4;
      __int128 v4 = v7;
      if (!--v3) {
        goto LABEL_10;
      }
    }

    int v7 = v4;
  }

LABEL_10:
  __dmb(0xBu);
  return v7;
}

uint64_t sub_100008CD0( _DWORD *a1, int a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, __int16 *, uint64_t, uint64_t, uint64_t, uint64_t, void, _DWORD, uint64_t), uint64_t a5)
{
  __int16 v96 = 47;
  if (a2 >= 1)
  {
    uint64_t v80 = 0LL;
    uint64_t v81 = 0LL;
    int v82 = 0;
    size_t v88 = 0LL;
    int64_t v83 = 0LL;
    int64_t v84 = a2;
    size_t v5 = a1;
    unint64_t v6 = (unint64_t)a1 + a2;
    v67 = "docid/%lld";
    v73 = "docid/%lld";
    v74 = "docid/%lld";
    int v75 = "docid/%lld";
    unint64_t v65 = v6;
    while (1)
    {
      int v7 = *v5;
      unsigned int v8 = (unsigned __int16 *)(v5 + 2);
      if ((*v5 & 0xFFF) != 0x3E7)
      {
        unsigned int v87 = v5[1];
        unsigned int v9 = 1 << *(_BYTE *)v5;
        uint64_t v10 = (byte_100020288 & ((*v5 & 0x2000u) >> 13)) != 0 ? v9 | 0x20000000 : v9;
        if (qword_1000206D0[dword_1000206E0] != -1LL) {
          break;
        }
      }

      ++dword_100020738;
      unint64_t v57 = &qword_1000206D0[dword_1000206E0];
      do
        unint64_t v58 = __ldxr(v57);
      while (__stxr(v58 + 1, v57));
      if (v58 == -2LL)
      {
        int v59 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_100015C44(v102, &v103, v59);
        }
        sub_100004D78((uint64_t (*)(void))sub_1000097BC);
        a4(a3, 0xFFFFFFFFLL, 0LL, &v96, 2LL, 2LL, 2415919104LL, -1LL, 0LL, 0, a5);
      }

      else
      {
        a4(a3, 0xFFFFFFFFLL, 0LL, &v96, 2LL, 2LL, 0x80000000LL, v58 + 1, 0LL, 0, a5);
      }

      if (*v8 == 45887)
      {
        unsigned int v8 = (unsigned __int16 *)v5 + 5;
      }

      else
      {
        uint64_t v60 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          sub_100015C18(&v94, v95);
        }
      }

LABEL_148:
      size_t v5 = v8;
    }

    int v11 = 0;
    v89 = 0LL;
    uint64_t v90 = 0LL;
    int v12 = 0LL;
    uint64_t v77 = 0LL;
    uint64_t v78 = 0LL;
    *(_DWORD *)&v68[8] = 0;
    int v76 = 0;
    int v79 = 0;
    *(void *)v68 = (v7 - 11);
    uint64_t v13 = "created";
    if (v7 == 12) {
      uint64_t v13 = "changed";
    }
    v66 = v13;
    while (1)
    {
      int v14 = *v8;
      if (v14 == 45887)
      {
        ++v8;
        goto LABEL_148;
      }

      uint64_t v15 = v8[1];
      size_t v16 = (int *)(v8 + 2);
      uint64_t v17 = &qword_1000206D0[dword_1000206E0];
      do
      {
        unint64_t v18 = __ldxr(v17);
        unint64_t v19 = v18 + 1;
      }

      while (__stxr(v18 + 1, v17));
      if (v18 == -2LL)
      {
        uint64_t v20 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100015C84(v100, &v101, v20);
        }
        sub_100004D78((uint64_t (*)(void))sub_1000097BC);
        a4(a3, 0xFFFFFFFFLL, 0LL, &v96, 2LL, 2LL, 2415919104LL, -1LL, 0LL, 0, a5);
        uint64_t v21 = &qword_1000206D0[dword_1000206E0];
        do
        {
          unint64_t v22 = __ldxr(v21);
          unint64_t v19 = v22 + 1;
        }

        while (__stxr(v22 + 1, v21));
      }

      if (v7 != 15) {
        break;
      }
      switch(v11)
      {
        case 0:
          uint64_t v71 = 0LL;
          uint64_t v72 = 0LL;
          LODWORD(v74) = 0;
          LODWORD(v75) = 0;
          uint64_t v69 = 0LL;
          uint64_t v70 = 0LL;
          int v85 = 0;
          LODWORD(v73) = 0;
          if (v14 == 4) {
            LODWORD(v67) = *v16;
          }
          else {
            LODWORD(v67) = 0;
          }
          break;
        case 1:
          if (v14 == 9)
          {
            v85 |= 1u;
            LODWORD(v73) = *v16;
            uint64_t v90 = *v16;
          }

          break;
        case 2:
          if (v14 == 7)
          {
            uint64_t v69 = *(void *)v16;
            int v29 = v85 | 2;
            goto LABEL_52;
          }

          break;
        case 3:
          if (v14 == 5)
          {
            uint64_t v72 = *(void *)v16;
            int v29 = v85 | 4;
            goto LABEL_52;
          }

          break;
        case 4:
          if (v14 == 5)
          {
            uint64_t v71 = *(void *)v16;
            int v29 = v85 | 8;
            goto LABEL_52;
          }

          break;
        case 5:
          if (v14 == 4)
          {
            LODWORD(v75) = *v16;
            int v29 = v85 | 0x10;
            goto LABEL_52;
          }

          break;
        case 6:
          if (v14 == 4)
          {
            LODWORD(v74) = *v16;
            int v29 = v85 | 0x20;
            goto LABEL_52;
          }

          break;
        case 7:
          if (v14 == 5)
          {
            uint64_t v70 = *(void *)v16;
            int v29 = v85 | 0x40;
LABEL_52:
            int v85 = v29;
          }

          break;
        case 8:
          if (v14 == 5 && (v85 & 0x5F) != 0)
          {
            uint64_t v30 = (snprintf( (char *)__str,  0x400uLL,  "/.activity/%d/%d/%lld/%lld/%lld/%u/%u/%lld",  (_DWORD)v67,  (_DWORD)v73,  v69,  v72,  v71,  (_DWORD)v75,  (_DWORD)v74,  v70)
                               + 1);
            a4(a3, v87, v90, (__int16 *)__str, v30, v30, v10, v19, 0LL, 0, a5);
          }

          break;
        default:
          break;
      }

LABEL_125:
      unsigned int v8 = (unsigned __int16 *)((char *)v16 + v15);
      ++v11;
    }

    if ((v14 - 1) > 1)
    {
      switch(v14)
      {
        case 5:
          if (*(_DWORD *)v68 > 1u)
          {
            int v23 = v76;
          }

          else
          {
            int v23 = v76;
            if (!v76)
            {
              *(void *)&v68[4] = *(void *)v16;
              int v23 = 1;
            }
          }

          BOOL v51 = v79 == 2 && v23 == 1;
          BOOL v52 = *(_DWORD *)v68 > 1u;
          if (!v51) {
            BOOL v52 = 1;
          }
          if (v52)
          {
            int v76 = v23;
          }

          else
          {
            int v53 = snprintf( (char *)__str,  0x400uLL,  "/.docid/%lld/%s/%lld/src=%lld,dst=%lld",  (int)v90,  v66,  *(void *)&v68[4],  v77,  v78)
                + 1;
            unint64_t v6 = v65;
            int64_t v83 = strrchr((const char *)__str, 47) - (char *)__str + 2;
            ((void (*)(uint64_t, void, uint64_t, uint8_t *, void))a4)(a3, v87, v90, __str, v53);
            int v76 = 1;
            int v79 = 2;
          }

          break;
        case 7:
          if ((_DWORD)v15 == 4) {
            uint64_t v31 = *v16;
          }
          else {
            uint64_t v31 = *(void *)v16;
          }
          if (v79) {
            uint64_t v49 = v77;
          }
          else {
            uint64_t v49 = v31;
          }
          uint64_t v81 = v31;
          uint64_t v50 = v78;
          if (v79) {
            uint64_t v50 = v31;
          }
          uint64_t v77 = v49;
          uint64_t v78 = v50;
          ++v79;
          break;
        case 9:
          int v32 = *v16;
          uint64_t v90 = *v16;
          if (v7 == 13)
          {
            int v97 = *v16;
            *(void *)__str = 0LL;
            sub_100004940((uint64_t)&unk_100021758);
            if (sub_100011754(&v97, __str))
            {
              sub_1000048C0((uint64_t)&unk_100021758);
              int v98 = v32;
              ioctl(dword_100020048, 0x80047368uLL, &v98);
            }

            else
            {
              *(_DWORD *)(*(void *)__str + 32LL) |= 0x400u;
              sub_1000048C0((uint64_t)&unk_100021758);
              while (!__ldxr((unsigned int *)&unk_100020700))
              {
              }

              __clrex();
LABEL_133:
              if (qword_100020748)
              {
                uint64_t v56 = *(void *)(qword_100020748 + 16);
                if (v56) {
                  sub_100007658(v56);
                }
              }
            }
          }

          uint64_t v28 = v83;
          if (v12)
          {
            if (v89 && (v80 & 0x2000000000000000LL) != 0)
            {
              _BYTE *v89 = v80;
              uint64_t v28 = strlen(v12) + 1;
              uint64_t v10 = v10 | 0x20000000;
            }

            unint64_t v6 = v65;
            uint64_t v64 = a5;
            int v63 = 0;
            uint64_t v62 = 0LL;
            goto LABEL_124;
          }

          unint64_t v6 = v65;
          break;
        case 10:
          int v33 = *v16;
          int v34 = *v16 & 0xF000;
          int v35 = v10 | 0x800000;
          int v36 = v10 | 0x1000000;
          if (v34 != 0x4000) {
            int v36 = v10;
          }
          if (v34 != 0x8000) {
            int v35 = v36;
          }
          if (v34 == 40960) {
            int v37 = v10 | 0x400000;
          }
          else {
            int v37 = v35;
          }
          if (v33 < 0) {
            v37 |= 0x100000u;
          }
          HIDWORD(v80) = *v16;
          uint64_t v10 = v37 | (v33 >> 11) & 0x80000;
          break;
        case 11:
          int v82 = *v16;
          break;
        case 12:
          uint64_t v81 = *(void *)(v8 + 2);
          int v38 = *((_DWORD *)v8 + 4);
          uint64_t v90 = *((unsigned int *)v8 + 3);
          int v82 = *((_DWORD *)v8 + 6);
          int v39 = v38 & 0xF000;
          int v40 = v10 | 0x800000;
          int v41 = v10 | 0x1000000;
          if (v39 != 0x4000) {
            int v41 = v10;
          }
          if (v39 != 0x8000) {
            int v40 = v41;
          }
          if (v39 == 40960) {
            int v42 = v10 | 0x400000;
          }
          else {
            int v42 = v40;
          }
          if (v38 < 0) {
            v42 |= 0x100000u;
          }
          HIDWORD(v80) = *((_DWORD *)v8 + 4);
          uint64_t v10 = v42 | (v38 >> 11) & 0x80000;
          if (v12)
          {
            if (v89)
            {
              uint64_t v43 = *(void *)(v8 + 2);
              uint64_t v28 = v83;
              if ((v38 & 0x20000000) != 0) {
                goto LABEL_120;
              }
            }

            else
            {
              uint64_t v43 = *(void *)(v8 + 2);
              uint64_t v28 = v83;
            }

            goto LABEL_123;
          }

          break;
        default:
          goto LABEL_125;
      }

      goto LABEL_125;
    }

    if (*(_BYTE *)v16 == 47)
    {
      int v12 = (const char *)(v8 + 2);
    }

    else
    {
      uint64_t v24 = (os_log_s *)sub_1000031E4();
      int v12 = (const char *)&unk_100020230;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&__str[4] = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "consumer: DANGER! fname does not begin with a '/' (%s)",  __str,  0xCu);
      }
    }

    if (v12[1])
    {
      uint64_t v25 = strrchr(v12, 47);
      if (!v25) {
        goto LABEL_114;
      }
      unint64_t v26 = v25;
      uint64_t v27 = v25 - 12;
      if (v25 - 12 <= v12 || strncmp(v25 - 12, "/..namedfork", 0xCuLL))
      {
LABEL_37:
        v89 = v26 + 1;
        LOBYTE(v80) = v26[1];
        size_t v88 = strlen(v12) + 1;
        uint64_t v28 = v26 - v12 + 2;
        goto LABEL_117;
      }

      uint64_t v10 = v10 | 0x200;
      *uint64_t v27 = 0;
      unsigned int v44 = strrchr(v12, 47);
      if (v44)
      {
        unint64_t v26 = v44;
        uint64_t v45 = v44 + 1;
        if (v44[1])
        {
          *unsigned int v44 = 0;
          uint64_t v46 = strrchr(v12, 47);
          if (v46 && (int v47 = v45, v48 = v46, !strcmp(v46 + 1, v47))) {
            unint64_t v26 = v48;
          }
          else {
            *unint64_t v26 = 47;
          }
        }

        goto LABEL_37;
      }

      if (v12[1])
      {
LABEL_114:
        int v54 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__str = 136315138;
          *(void *)&__str[4] = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "consumer: DANGER! last_slash is NULL and fname <<%s>> looks bad.",  __str,  0xCu);
        }
      }
    }

    size_t v88 = 2LL;
    v89 = 0LL;
    uint64_t v28 = 2LL;
LABEL_117:
    if ((_DWORD)v90)
    {
      if (v89)
      {
        uint64_t v43 = v81;
        if ((v80 & 0x2000000000000000LL) != 0)
        {
LABEL_120:
          _BYTE *v89 = v80;
          uint64_t v28 = strlen(v12) + 1;
          uint64_t v10 = v10 | 0x20000000;
        }
      }

      else
      {
        uint64_t v43 = v81;
      }

LABEL_123:
      uint64_t v64 = a5;
      int v63 = v82;
      uint64_t v62 = v43;
LABEL_124:
      int64_t v83 = v28;
      a4(a3, v87, v90, (__int16 *)v12, v88, v28, v10, v19, v62, v63, v64);
    }

    else
    {
      int64_t v83 = v28;
      uint64_t v90 = 0LL;
    }

    goto LABEL_125;
  }

  return 1LL;
}

uint64_t sub_1000097BC(uint64_t a1)
{
  *(_DWORD *)(a1 + 32) |= 2u;
  return 0LL;
}

uint64_t sub_1000097D0(uint64_t result)
{
  if (*(void *)(result + 8))
  {
    uint64_t v1 = result;
    if ((*(_DWORD *)(result + 32) & 0x10) == 0)
    {
      unsigned int v2 = &qword_1000206D0[dword_1000206E0];
      do
      {
        unint64_t v3 = __ldxr(v2);
        uint64_t v4 = v3 + 1;
      }

      while (__stxr(v3 + 1, v2));
      if (v3 == -2LL)
      {
        sub_100004D78((uint64_t (*)(void))sub_1000097BC);
        size_t v5 = &qword_1000206D0[dword_1000206E0];
        do
        {
          unint64_t v6 = __ldxr(v5);
          uint64_t v4 = v6 + 1;
        }

        while (__stxr(v6 + 1, v5));
      }

      if ((*(_DWORD *)(v1 + 32) & 4) != 0) {
        int v7 = 0x2000000;
      }
      else {
        int v7 = 0x4000000;
      }
      size_t v8 = strlen(*(const char **)(v1 + 16));
      uint64_t result = sub_100007710( (uint64_t)&qword_100021830,  -1,  *(_DWORD *)v1,  *(char **)(v1 + 16),  (int)v8 + 1,  v8 + 1,  v7,  v4,  0LL,  0);
      if ((*(_DWORD *)(v1 + 32) & 4) == 0) {
        *(_DWORD *)(v1 + 32) |= 0x10u;
      }
      *(_DWORD *)(v1 + 32) &= ~0x20u;
    }
  }

  return result;
}

uint64_t sub_1000098DC()
{
  return pthread_mutex_unlock(&stru_1000201C0);
}

uint64_t sub_100009914()
{
  dword_1000206C8 = 1;
  __dmb(0xBu);
  uint64_t result = dword_100020048;
  if ((dword_100020048 & 0x80000000) == 0)
  {
    dword_100020048 = -1;
    return close(result);
  }

  return result;
}

char *sub_100009940(int a1)
{
  if (proc_pidpath(a1, buffer, 0x1000u) < 1) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = basename(buffer);
  }
  if (!result) {
    return "(unknown)";
  }
  return result;
}

__CFDictionary *sub_1000099D8()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    int v32 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100015CC4(v32, v33, v34, v35, v36, v37, v38, v39);
    }
LABEL_47:
    int v40 = 0LL;
    goto LABEL_48;
  }

  CFMutableDictionaryRef v1 = Mutable;
  unsigned int v2 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v2)
  {
    int v41 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100015CC4(v41, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_46:
    CFRelease(v1);
    goto LABEL_47;
  }

  unint64_t v3 = v2;
  sub_10000A128(v2, @"proc_name", "%s", "fseventsd");
  sub_10000A128(v3, @"num_clients", "%d", (void *)dword_100020720);
  sub_10000A128(v3, @"curr_event_id", "%llu", (void *)qword_1000206D0[dword_1000206E0]);
  sub_10000A128(v3, @"string_table_count", "%u", (void *)qword_100021850);
  theDict = v1;
  CFDictionaryAddValue(v1, @"global_state", v3);
  CFRelease(v3);
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  int v4 = dword_100020720;
  if (dword_100020720 >= 1)
  {
    uint64_t v5 = 0LL;
    int v6 = 0;
    int v7 = "%s";
    do
    {
      uint64_t v8 = xmmword_100020758[v5];
      if (v8)
      {
        CFMutableDictionaryRef v9 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (!v9)
        {
          uint64_t v49 = (os_log_s *)sub_1000031E4();
          CFMutableDictionaryRef v1 = theDict;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_100015CC4(v49, v50, v51, v52, v53, v54, v55, v56);
          }
          goto LABEL_46;
        }

        uint64_t v10 = v9;
        int v11 = sub_100009940(*(_DWORD *)(v8 + 248));
        sub_10000A128(v10, @"client_name", v7, v11);
        sub_10000A128(v10, @"client_pid", "%d", (void *)*(int *)(v8 + 248));
        sub_10000A128(v10, @"client_uid", "%d", (void *)*(unsigned int *)(v8 + 252));
        sub_10000A128(v10, @"client_gid", "%d", (void *)*(unsigned int *)(v8 + 256));
        sub_10000A128(v10, @"dev_to_watch", "%d", (void *)*(int *)(v8 + 112));
        int v12 = *(void **)(v8 + 120);
        if (v12) {
          sub_10000A128(v10, @"working_dir", v7, v12);
        }
        int v60 = v6;
        sub_10000A128(v10, @"last_update", "%llu", *(void **)(v8 + 144));
        sub_10000A128(v10, @"dropped_id", "%llu", *(void **)(v8 + 152));
        sub_10000A128(v10, @"last_id", "%llu", *(void **)(v8 + 160));
        sub_10000A128(v10, @"last_history_id", "%llu", *(void **)(v8 + 168));
        sub_10000A128(v10, @"update_interval", "%llu", *(void **)(v8 + 176));
        sub_10000A128(v10, @"num_errors", "%d", (void *)*(int *)(v8 + 184));
        sub_10000A128(v10, @"client_flags", "%d", (void *)*(int *)(v8 + 188));
        sub_10000A128(v10, @"max_events", "%d", (void *)*(int *)(v8 + 224));
        sub_10000A128(v10, @"num_paths", "%d", (void *)*(int *)(v8 + 128));
        sub_10000A128(v10, @"start_id", "%llu", *(void **)(v8 + 232));
        sub_10000A128(v10, @"vfs_authorized_access", "%d", (void *)*(unsigned int *)(v8 + 292));
        sub_10000A128(v10, @"num_events", "%llu", *(void **)(v8 + 304));
        sub_10000A128(v10, @"allocated_bytes", "%llu", *(void **)(v8 + 296));
        sub_10000A128(v10, @"client_thread", "%d", (void *)*(unsigned int *)(v8 + 320));
        sub_10000A128(v10, @"client_index", "%d", (void *)*(int *)(v8 + 192));
        double v69 = (double)*(int *)(v8 + 328) / 1000000.0 + (double)*(int *)(v8 + 324);
        sub_10000A128(v10, @"user_time", "%f", &v69);
        double v69 = (double)*(int *)(v8 + 336) / 1000000.0 + (double)*(int *)(v8 + 332);
        sub_10000A128(v10, @"system_time", "%f", &v69);
        uint64_t v13 = *(void **)(v8 + 344);
        if (v13) {
          sub_10000A128(v10, @"pw_name", v7, v13);
        }
        int v14 = v7;
        CFIndex v15 = *(unsigned int *)(v8 + 128);
        if ((int)v15 >= 1)
        {
          CFMutableArrayRef v16 = CFArrayCreateMutable(kCFAllocatorDefault, v15, &kCFTypeArrayCallBacks);
          if (v16)
          {
            uint64_t v17 = v16;
            if (*(int *)(v8 + 128) >= 1)
            {
              uint64_t v18 = 0LL;
              do
              {
                CFStringRef v19 = CFStringCreateWithCString( kCFAllocatorDefault,  *(const char **)(*(void *)(v8 + 136) + 8 * v18),  0x8000100u);
                if (v19)
                {
                  CFStringRef v20 = v19;
                  CFArrayAppendValue(v17, v19);
                  CFRelease(v20);
                }

                else
                {
                  uint64_t v21 = (os_log_s *)sub_1000031E4();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                    sub_100015DB8(&v67, v68);
                  }
                }

                ++v18;
              }

              while (v18 < *(int *)(v8 + 128));
            }

            CFDictionaryAddValue(v10, @"path_table", v17);
            CFRelease(v17);
          }

          else
          {
            unint64_t v22 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100015D8C(&v65, v66);
            }
          }
        }

        CFMutableArrayRef v23 = CFArrayCreateMutable(kCFAllocatorDefault, 8LL, &kCFTypeArrayCallBacks);
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = 0LL;
          uint64_t v26 = v8 + 352;
          do
          {
            uint64_t v27 = *(const char **)(v26 + v25);
            if (!v27) {
              break;
            }
            CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, v27, 0x8000100u);
            if (v28)
            {
              CFStringRef v29 = v28;
              CFArrayAppendValue(v24, v28);
              CFRelease(v29);
            }

            else
            {
              uint64_t v30 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_100015D60(&v63, v64);
              }
            }

            v25 += 8LL;
          }

          while (v25 != 64);
          if (CFArrayGetCount(v24) >= 1) {
            CFDictionaryAddValue(v10, @"exclusion_paths", v24);
          }
          CFRelease(v24);
        }

        else
        {
          uint64_t v31 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_100015D34(&v61, v62);
          }
        }

        int v6 = v60 + 1;
        CFArrayAppendValue(theArray, v10);
        CFRelease(v10);
        int v4 = dword_100020720;
        int v7 = v14;
      }

      ++v5;
    }

    while (v6 < v4);
  }

  int v40 = theDict;
  CFDictionaryAddValue(theDict, @"clients", theArray);
  CFRelease(theArray);
LABEL_48:
  pthread_mutex_unlock(&stru_100020140);
  return v40;
}

double sub_10000A128(__CFDictionary *a1, const __CFString *a2, char *__s1, void *a4)
{
  if (!strcmp(__s1, "%llu"))
  {
    if (!a4) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%llu", a4);
  }

  else if (!strcmp(__s1, "%s"))
  {
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s", a4);
  }

  else if (!strcmp(__s1, "%f"))
  {
    double result = *(double *)a4;
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%f", *a4);
  }

  else if (!strcmp(__s1, "%u"))
  {
    if (!(_DWORD)a4) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%u", a4);
  }

  else
  {
    if (!(_DWORD)a4) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a4);
  }

  CFStringRef v10 = v9;
  if (v9)
  {
    CFDictionaryAddValue(a1, a2, v9);
    CFRelease(v10);
  }

  else
  {
    int v11 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100015DE4(a2, v11);
    }
  }

  return result;
}

uint64_t sub_10000A2AC(uint64_t result)
{
  if ((_DWORD)result == 30)
  {
    pthread_mutex_lock(&stru_100020140);
    CFMutableDictionaryRef v1 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100015E60();
    }
    uint64_t v2 = 0LL;
    while (1)
    {
      uint64_t v3 = xmmword_100020758[v2];
      if (v3) {
        break;
      }
LABEL_22:
      if (++v2 == 512) {
        return pthread_mutex_unlock(&stru_100020140);
      }
    }

    uint64_t v4 = *(void *)(v3 + 232);
    uint64_t v5 = (os_log_s *)sub_1000031E4();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4 == -1)
    {
      if (v6)
      {
        CFStringRef v29 = sub_100009940(*(_DWORD *)(v3 + 248));
        int v30 = *(_DWORD *)(v3 + 248);
        int v31 = *(_DWORD *)(v3 + 188);
        int v32 = *(_DWORD *)(v3 + 128);
        *(_DWORD *)statfs buf = 136315906;
        *(void *)uint64_t v34 = v29;
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)&v34[10] = v30;
        *(_WORD *)&v34[14] = 1024;
        *(_DWORD *)&v34[16] = v31;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = v32;
        uint64_t v13 = v5;
        int v14 = "\t%s pid %d, flags 0x%x, #paths %d, sinceWhen: Now\n";
        uint32_t v15 = 30;
        goto LABEL_25;
      }
    }

    else if (v6)
    {
      int v7 = sub_100009940(*(_DWORD *)(v3 + 248));
      int v8 = *(_DWORD *)(v3 + 248);
      int v9 = *(_DWORD *)(v3 + 188);
      int v10 = *(_DWORD *)(v3 + 128);
      uint64_t v11 = *(void *)(v3 + 232);
      uint64_t v12 = qword_1000206D0[dword_1000206E0] - v11;
      *(_DWORD *)statfs buf = 136316418;
      *(void *)uint64_t v34 = v7;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v8;
      *(_WORD *)&v34[14] = 1024;
      *(_DWORD *)&v34[16] = v9;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v10;
      HIWORD(v35) = 2048;
      *(void *)uint64_t v36 = v11;
      *(_WORD *)&v36[8] = 2048;
      uint64_t v37 = v12;
      uint64_t v13 = v5;
      int v14 = "\t%s pid %d, flags 0x%x, #paths %d, sinceWhen: 0x%llx [delta: %llu]\n";
      uint32_t v15 = 50;
LABEL_25:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
    }

    CFMutableArrayRef v16 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(v3 + 296);
      uint64_t v24 = *(void *)(v3 + 304);
      double v26 = (double)*(int *)(v3 + 328) / 1000000.0 + (double)*(int *)(v3 + 324);
      double v27 = (double)*(int *)(v3 + 332);
      double v28 = (double)*(int *)(v3 + 336) / 1000000.0;
      *(_DWORD *)statfs buf = 134218752;
      *(void *)uint64_t v34 = v24;
      *(_WORD *)&v34[8] = 2048;
      *(void *)&v34[10] = v25;
      *(_WORD *)&v34[18] = 2048;
      double v35 = v26;
      *(_WORD *)uint64_t v36 = 2048;
      *(double *)&void v36[2] = v28 + v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "\t\tnum_events[%llu] allocated_bytes[%llu] user_time[%.2f] system_time[%.2f]\n",  buf,  0x2Au);
    }

    if (*(int *)(v3 + 128) >= 1)
    {
      uint64_t v17 = 0LL;
      do
      {
        uint64_t v18 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(*(void *)(v3 + 136) + 8 * v17);
          *(_DWORD *)statfs buf = 67109378;
          *(_DWORD *)uint64_t v34 = v17;
          *(_WORD *)&v34[4] = 2080;
          *(void *)&v34[6] = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "\t\t%d: %s\n", buf, 0x12u);
        }

        ++v17;
      }

      while (v17 < *(int *)(v3 + 128));
    }

    uint64_t v20 = 0LL;
    uint64_t v21 = v3 + 352;
    do
    {
      if (!*(void *)(v21 + v20)) {
        break;
      }
      unint64_t v22 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(v21 + v20);
        *(_DWORD *)statfs buf = 136315138;
        *(void *)uint64_t v34 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "\t\tExcluded %s\n", buf, 0xCu);
      }

      v20 += 8LL;
    }

    while (v20 != 64);
    goto LABEL_22;
  }

  return result;
}

uint64_t sub_10000A65C(uint64_t a1)
{
  int v1 = open(__str, 0x20000000);
  if (v1 < 1) {
    return 0LL;
  }
  int v2 = v1;
  if (unlink(__str))
  {
    uint64_t v3 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100015EFC();
    }
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = 1LL;
  }

  close(v2);
  return v4;
}

void sub_10000A734(uint64_t a1, uint64_t a2)
{
  unsigned int v21 = 0;
  if (!sub_10000A65C(a2))
  {
    snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
    int v5 = open(__str, 0x20000000);
    if (v5 < 0) {
      return;
    }
    int v6 = v5;
    if (fstat(v5, &v22) || (v22.st_mode & 0xF000) != 0x8000)
    {
      int v10 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100016114();
      }
    }

    else
    {
      __darwin_time_t tv_sec = v22.st_ctimespec.tv_sec;
      time_t v8 = time(0LL);
      if (fsctl(__str, 0x40046812uLL, &v20, 0))
      {
        int v9 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10001609C();
        }
LABEL_17:
        *(_DWORD *)(a1 + 32) |= 0x200u;
        close(v6);
LABEL_18:
        sub_10000ABB0(a2, 1);
        sub_10000ADA8(a1, a2);
        return;
      }

      if (fsctl(__str, 0x40046813uLL, &v21, 0))
      {
        uint64_t v11 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100016014(v11);
        }
        goto LABEL_17;
      }

      if (v21 > tv_sec && v21 - tv_sec > 119 || v8 - v20 >= 120 && v8 - tv_sec > 5)
      {
        close(v6);
        sub_100005030((const char *)(a2 + 256), v36);
        int v12 = statfs((const char *)(a2 + 256), &buf);
        if (v12) {
          uint64_t v13 = 0LL;
        }
        else {
          uint64_t v13 = (buf.f_flags >> 9) & 1;
        }
        if (v12) {
          uint64_t f_flags = 0LL;
        }
        else {
          uint64_t f_flags = buf.f_flags;
        }
        uint32_t v15 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v23 = 136316418;
          uint64_t v24 = a2 + 256;
          __int16 v25 = 2080;
          double v26 = v36;
          __int16 v27 = 2048;
          uint64_t v28 = f_flags;
          __int16 v29 = 2048;
          __darwin_time_t v30 = v21 - tv_sec;
          __int16 v31 = 2048;
          time_t v32 = v8 - v20;
          __int16 v33 = 2048;
          time_t v34 = v8 - tv_sec;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "event logs in %s with volume UUID [%s] and f_flags[0x%llx] out of sync with volume.  destroying old logs. (%ld %ld %ld)",  v23,  0x3Eu);
        }

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 0x40000000LL;
        v17[2] = sub_10000AAB8;
        v17[3] = &unk_10001C700;
        v17[4] = f_flags;
        v17[5] = v13;
        v17[6] = tv_sec;
        v17[7] = v8;
        unsigned int v18 = v21;
        unsigned int v19 = v20;
        analytics_send_event_lazy("com.apple.fseventsd.resetlogs", v17);
        CFMutableArrayRef v16 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100015F8C();
        }
        goto LABEL_18;
      }
    }

    close(v6);
    return;
  }

  uint64_t v4 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 136315138;
    *(void *)&buf.f_iosize = "check_vol_last_mod_time";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: ram disk boot detected",  (uint8_t *)&buf,  0xCu);
  }

xpc_object_t sub_10000AAB8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v2, "statfs_f_flags", *(void *)(a1 + 32));
  xpc_dictionary_set_int64(v2, "is_mnt_removable", *(void *)(a1 + 40));
  xpc_dictionary_set_int64(v2, "last_mount_time", *(unsigned int *)(a1 + 64));
  xpc_dictionary_set_int64(v2, "last_event_time", *(void *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "current_time", *(void *)(a1 + 56));
  xpc_dictionary_set_int64(v2, "mount_time", *(unsigned int *)(a1 + 68));
  xpc_dictionary_set_int64(v2, "last_mount_diff", *(unsigned int *)(a1 + 64) - *(void *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "current_mount_diff", *(void *)(a1 + 56) - *(unsigned int *)(a1 + 68));
  xpc_dictionary_set_int64(v2, "last_event_diff", *(void *)(a1 + 56) - *(void *)(a1 + 48));
  return v2;
}

void sub_10000ABB0(uint64_t a1, int a2)
{
  uint64_t v4 = (const char *)(a1 + 256);
  uint64_t v5 = __strlcpy_chk(v17, a1 + 256, 1024LL, 1024LL);
  v17[v5] = 47;
  int v6 = (int *)(a1 + 32);
  if (*(int *)(a1 + 32) >= 1)
  {
    uint64_t v7 = 0LL;
    time_t v8 = &v17[v5 + 1];
    size_t v9 = 1023 - v5;
    do
    {
      snprintf(v8, v9, "%.16llx", *(void *)(*(void *)(a1 + 40) + 8 * v7));
      if (unlink(v17) && (*__error() != 30 || strcmp(v4, "/.fseventsd")))
      {
        int v10 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = __error();
          int v12 = strerror(*v11);
          *(_DWORD *)statfs buf = 136315394;
          int v14 = v17;
          __int16 v15 = 2080;
          CFMutableArrayRef v16 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "failed to unlink old log file %s (%s)",  buf,  0x16u);
        }
      }

      ++v7;
    }

    while (v7 < *v6);
  }

  if (a2)
  {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 48));
    free(*(void **)(a1 + 40));
    *(void *)int v6 = 0LL;
    *(void *)(a1 + 40) = 0LL;
    ++*(_WORD *)(a1 + 248);
    *(_WORD *)(a1 + 250) = 1;
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 48));
  }

  else
  {
    free(*(void **)(a1 + 40));
    *(void *)int v6 = 0LL;
    *(void *)(a1 + 40) = 0LL;
    ++*(_WORD *)(a1 + 248);
    *(_WORD *)(a1 + 250) = 1;
  }

void sub_10000ADA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const unsigned __int8 *)(a1 + 48);
  uuid_generate((unsigned __int8 *)(a1 + 48));
  uuid_unparse(v4, (char *)(a1 + 64));
  uint64_t v5 = (const char *)(a2 + 256);
  snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
  unlink(__str);
  int v6 = open_dprotected_np(__str, 536872450, 4, 0, 384LL);
  if (v6 < 0)
  {
    if ((*(_DWORD *)(a1 + 32) & 1) == 0 || *__error() != 30)
    {
      uint64_t v11 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100016268();
      }
    }
  }

  else
  {
    int v7 = v6;
    size_t v8 = strlen((const char *)(a1 + 64));
    ssize_t v9 = write(v7, (const void *)(a1 + 64), v8);
    if (v9 == strlen((const char *)(a1 + 64)))
    {
      if ((*(_DWORD *)(a1 + 32) & 1) == 0 || strcmp(v5, "/tmp"))
      {
        int v10 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100016194((uint64_t)v5);
        }
      }
    }

    else
    {
      unlink(__str);
      int v12 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100016208();
      }
    }

    close(v7);
  }

uint64_t sub_10000AF54( int a1, _DWORD *a2, _DWORD *a3, void *a4, unsigned int (*a5)(char *), unint64_t *a6, unint64_t *a7)
{
  *a3 = 0;
  *a2 = 0;
  *a4 = 0LL;
  *a7 = 0LL;
  *a6 = 0LL;
  int v14 = fdopendir(a1);
  if (!v14)
  {
    close(a1);
    return *__error();
  }

  __int16 v15 = v14;
  __darwin_time_t v30 = a2;
  __int16 v31 = a3;
  time_t v32 = a4;
  __int16 v33 = a6;
  time_t v34 = a7;
  uint64_t v16 = 0LL;
  unint64_t v17 = 0LL;
  int v18 = 0;
  unsigned int v19 = 0LL;
  unint64_t v20 = -1LL;
  while (1)
  {
    do
    {
      unsigned int v21 = readdir(v15);
      if (!v21)
      {
        *__darwin_time_t v30 = v16;
        *__int16 v31 = v18;
        void *v32 = v19;
        *__int16 v33 = v20;
        unint64_t *v34 = v17;
        closedir(v15);
        return 0LL;
      }

      stat v22 = v21;
    }

    while (a5 && !a5(v21->d_name));
    if (v16 < v18)
    {
      int v23 = v18;
      uint64_t v24 = v19;
      goto LABEL_11;
    }

    int v23 = v18 + 100;
    __int16 v25 = calloc(v18 + 100, 8uLL);
    if (!v25) {
      break;
    }
    uint64_t v24 = v25;
    if (v19)
    {
      memcpy(v25, v19, 8LL * v18);
      free(v19);
    }

LABEL_11:
    unint64_t v26 = strtoull(v22->d_name, 0LL, 16);
    v24[v16] = v26;
    if (v26 <= v17) {
      unint64_t v27 = v17;
    }
    else {
      unint64_t v27 = v26;
    }
    if (v26 >= v20) {
      unint64_t v28 = v20;
    }
    else {
      unint64_t v28 = v26;
    }
    if (v26 < v20) {
      unint64_t v27 = v17;
    }
    if (v26 + 1 > 1)
    {
      unint64_t v17 = v27;
      unint64_t v20 = v28;
      ++v16;
    }

    int v18 = v23;
    unsigned int v19 = v24;
  }

  if (v19) {
    free(v19);
  }
  closedir(v15);
  return 12LL;
}

BOOL sub_10000B108(_BYTE *a1)
{
  BOOL v1 = *a1 == 0;
  if ((char)*a1 >= 1)
  {
    if ((_DefaultRuneLocale.__runetype[*a1] & 0x10000) != 0)
    {
      xpc_object_t v2 = a1 + 1;
      do
      {
        int v3 = *v2++;
        uint64_t v4 = v3;
      }

      while (v3 >= 1 && (_DefaultRuneLocale.__runetype[v4] & 0x10000) != 0);
      return (_DWORD)v4 == 0;
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

void *sub_10000B16C(uint64_t a1)
{
  *(void *)(a1 + 240) = 0LL;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  xpc_object_t v2 = (_DWORD *)(a1 + 208);
  pthread_rwlock_init((pthread_rwlock_t *)a1, 0LL);
  *(void *)(a1 + 200) = sub_100012408(4096, v2);
  double result = malloc(0x1FFE0uLL);
  *(void *)(a1 + 232) = result;
  *(_DWORD *)(a1 + 240) = 2730;
  return result;
}

uint64_t sub_10000B1E4(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

uint64_t sub_10000B1FC(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0LL;
  snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(a1 + 256), a2);
  int v5 = open(__str, 0x20000000);
  if (v5 < 0)
  {
LABEL_91:
    int v41 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1000162C8();
    }
    return 22LL;
  }

  int v6 = v5;
  if (fstat(v5, &v60) || (v60.st_mode & 0xF000) != 0x8000)
  {
    close(v6);
    goto LABEL_91;
  }

  if (!v60.st_size)
  {
    close(v6);
    return 22LL;
  }

  gzFile v7 = gzdopen(v6, "rb");
  if (!v7)
  {
    uint64_t v44 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100016348();
    }
    close(v6);
    return *__error();
  }

  size_t v8 = v7;
  ssize_t v9 = &off_100020000;
  int v10 = (int8x8_t *)malloc_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL);
  if (!v10)
  {
    gzclose(v8);
    return 12LL;
  }

  uint64_t v11 = v10;
  int v12 = gzread(v8, v10, 0x10000u);
  if (v12 < 1)
  {
    uint64_t v45 = 0LL;
    int v14 = 0LL;
    goto LABEL_107;
  }

  int v57 = 0;
  __int32 v58 = 0;
  int v13 = 0;
  int v14 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v56 = 0LL;
  uint64_t v55 = v8;
  do
  {
    if (!v16 && v12 <= 0xB)
    {
      uint64_t v46 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1000163A8();
      }
      goto LABEL_103;
    }

    int v18 = v11->i32[0];
    if (v11->i32[0] > 1145852720)
    {
      if (v17) {
        goto LABEL_28;
      }
      int v13 = v11[1].i32[0];
    }

    else
    {
      if (v18 != 827542596 && v18 != 844319812 && v18 != 861097028)
      {
LABEL_25:
        int v13 = v11[1].i32[0];
        if (v13 <= 0x40000)
        {
          if (v17) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }

        uint64_t v51 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          __int32 v52 = v11->i32[0];
          *(_DWORD *)statfs buf = 67109890;
          *(_DWORD *)uint64_t v62 = v52;
          *(_WORD *)&v62[4] = 1024;
          strcpy(&v62[6], "1SLD");
          v62[11] = 8;
          *(void *)&v62[12] = v56;
          *(_WORD *)&v62[20] = 2080;
          *(void *)&v62[22] = __str;
          _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "get_last_event_id: magic is wrong (0x%.8x != 0x%.8x; cur_pos %lld) in file %s",
            buf,
            0x22u);
        }

LABEL_103:
        uint64_t v47 = v8;
LABEL_104:
        gzclose(v47);
        malloc_zone_free((malloc_zone_t *)qword_1000206B8, v11);
        return 22LL;
      }

      if (v17) {
        goto LABEL_28;
      }
      int v13 = bswap32(v11[1].u32[0]);
    }

LABEL_27:
    __int32 v58 = v11->i32[1];
    v11->i32[1] = 0;
LABEL_28:
    v17 += v12;
    int v59 = v13;
    if (v17 < v13)
    {
      v16 += v12;
      goto LABEL_85;
    }

    unsigned int v21 = sub_1000067B8(v11, v13);
    unsigned int v22 = v21;
    if (v18 == 827542596 || v18 == 861097028 || v18 == 844319812) {
      unsigned int v22 = bswap32(v21);
    }
    int v14 = (char *)&v11[1] + 4;
    if (v58 != v22)
    {
      int v23 = sub_100012480(v11, v59);
      if (v58 != v23)
      {
        int v49 = v23;
        uint64_t v50 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 67109634;
          *(_DWORD *)uint64_t v62 = v58;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = v49;
          *(_WORD *)&v62[10] = 2080;
          *(void *)&v62[12] = __str;
          _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "get_last_event_id: checksum mis-match: file 0x%.8x, calculated 0x%.8x in file %s",  buf,  0x18u);
        }

        uint64_t v47 = v55;
        goto LABEL_104;
      }
    }

    switch(v18)
    {
      case 827542596:
        char v24 = 0;
        break;
      case 861097028:
        char v24 = 3;
        break;
      case 844319812:
        char v24 = 1;
        break;
      default:
        goto LABEL_43;
    }

    sub_1000124EC(v11, v17, v24);
LABEL_43:
    unint64_t v25 = (unint64_t)v11 + v11[1].i32[0];
    while ((unint64_t)v14 < v25)
    {
      unint64_t v26 = (unint64_t)v14;
      do
      {
        if (!*(_BYTE *)v26) {
          break;
        }
        ++v26;
      }

      while (v26 < v25);
      if (v26 - (unint64_t)v14 - 1024 <= 0xFFFFFFFFFFFFFBFELL)
      {
        __int16 v29 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10001641C(v74, &v75, v29);
        }
        break;
      }

      int v14 = (char *)(v26 + 1);
      if (v26 + 1 >= v25)
      {
        __darwin_time_t v30 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          __int32 v40 = v11[1].i32[0];
          *(_DWORD *)statfs buf = 134218754;
          *(void *)uint64_t v62 = v14 - (char *)v11;
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = v40;
          *(_WORD *)&v62[14] = 2080;
          *(void *)&v62[16] = __str;
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = v57;
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "get_last_event_id: ptr out-of-bounds (%ld > %d) in file %s (counter %d)",  buf,  0x22u);
        }

        __int16 v31 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 136315138;
          *(void *)uint64_t v62 = v26;
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "get_last_event_id: path was: <%s>",  buf,  0xCu);
        }

        break;
      }

      if (v26 + 9 > v25)
      {
        time_t v32 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_100016460(v72, &v73, v32);
        }
        break;
      }

      if (v15 <= *(void *)(v26 + 1)) {
        unint64_t v15 = *(void *)(v26 + 1);
      }
      int v14 = (char *)(v26 + 13);
      if (v26 + 13 > v25)
      {
        __int16 v33 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1000164A4(v70, &v71, v33);
        }
        int v14 = (char *)(v26 + 9);
        break;
      }

      __int32 v27 = v11->i32[0];
      if (v11->i32[0] == 1145852722 || v27 == 844319812)
      {
        unint64_t v28 = v26 + 21;
        if (v28 > v25)
        {
          time_t v34 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_10001652C(v68, &v69, v34);
          }
          break;
        }
      }

      else
      {
        unint64_t v28 = v26 + 13;
      }

      if (v27 == 1145852723 || v27 == 861097028)
      {
        int v14 = (char *)(v28 + 12);
        if (v28 + 12 > v25)
        {
          uint64_t v36 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1000164E8(v66, &v67, v36);
          }
          int v14 = (char *)v28;
          break;
        }
      }

      else
      {
        int v14 = (char *)v28;
      }
    }

    uint64_t v16 = 0LL;
    if (v58 == v22)
    {
      __int32 v38 = v11[1].i32[0];
      size_t v8 = v55;
      if (v38)
      {
        uint64_t v16 = 0x40000LL - v38;
        __memmove_chk(v11, &v11->i8[v38], v16, 0x40000LL);
      }
    }

    else
    {
      size_t v8 = v55;
    }

    ++v57;
    v56 += v17;
    uint64_t v17 = 0LL;
LABEL_85:
    if (0x40000 - v16 >= 0x10000) {
      unsigned int v39 = 0x10000;
    }
    else {
      unsigned int v39 = 0x40000 - v16;
    }
    int v12 = gzread(v8, (char *)v11 + v16, v39);
    int v13 = v59;
  }

  while (v12 > 0);
  uint64_t v45 = v11;
  ssize_t v9 = &off_100020000;
  if (v15)
  {
    uint64_t v42 = 0LL;
    *a3 = v15 + 1;
    goto LABEL_109;
  }

LABEL_107:
  uint64_t v48 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    if (v45)
    {
      int v53 = v45[1].i32[0];
      int v54 = v45[1].i32[1];
    }

    else
    {
      int v53 = -123;
      int v54 = -123;
    }

    *(_DWORD *)statfs buf = 134219008;
    *(void *)uint64_t v62 = a2;
    *(_WORD *)&v62[8] = 2048;
    *(void *)&v62[10] = v14;
    *(_WORD *)&v62[18] = 2048;
    *(void *)&v62[20] = v11;
    *(_WORD *)&v62[28] = 1024;
    int v63 = v53;
    __int16 v64 = 1024;
    int v65 = v54;
    _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "did not find any event id's in %.16llx (ptr %p buff %p / iptr[2] %d / iptr[3] %d\n",  buf,  0x2Cu);
  }

  uint64_t v42 = 22LL;
LABEL_109:
  malloc_zone_free((malloc_zone_t *)v9[215], v11);
  gzclose(v8);
  return v42;
}

uint64_t sub_10000BA90(uint64_t a1, uint64_t a2)
{
  int v3 = (const char *)(a2 + 256);
  snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
  int v4 = open(__str, 0x20000000);
  if (v4 < 0)
  {
    if ((*(_DWORD *)(a1 + 32) & 1) == 0 || strcmp(v3, "/tmp"))
    {
      ssize_t v9 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100016570();
      }
    }

    return 2LL;
  }

  int v5 = v4;
  if (fstat(v4, &v10) || (v10.st_mode & 0xF000) != 0x8000)
  {
    close(v5);
    return 22LL;
  }

  int v6 = (_BYTE *)(a1 + 64);
  ssize_t v7 = read(v5, (void *)(a1 + 64), 0x40uLL);
  if (v7 <= 0)
  {
    close(v5);
    unlink(__str);
    *int v6 = 0;
    return 2LL;
  }

  if (v7 == 64)
  {
    close(v5);
    unlink(__str);
    *int v6 = 0;
    return 22LL;
  }

  *(_BYTE *)(a1 + v7 + 64) = 0;
  close(v5);
  uint64_t result = uuid_parse((const char *)(a1 + 64), (unsigned __int8 *)(a1 + 48));
  if ((_DWORD)result)
  {
    unlink(__str);
    return 22LL;
  }

  return result;
}

void sub_10000BC08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 128);
  if (v2)
  {
    if (!*(_DWORD *)(v2 + 28))
    {
      unint64_t v3 = *(void *)(a2 + 40);
      if (v3 > 0x1388 || 100 * v3 / *(void *)(a2 + 8) >= 6)
      {
        int v4 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_1000165EC();
        }
        *(_DWORD *)(v2 + 28) = 1;
      }
    }
  }

uint64_t sub_10000BC84(uint64_t a1, uint64_t a2)
{
  int v4 = *(const char **)(a1 + 40);
  size_t v5 = strlen(v4);
  uint64_t v6 = *(unsigned int *)(a2 + 32);
  if (v5 + v6 + 25 >= *(void *)(a2 + 24))
  {
    sub_10000BD8C(*(gzFile *)a2, *(void *)(a2 + 8), a2, 0);
    uint64_t v7 = *(void *)(a2 + 16);
    *(void *)(v7 + 4) = 0xC00000000LL;
    uint64_t v6 = 12LL;
    *(_DWORD *)(a2 + 32) = 12;
    int v4 = *(const char **)(a1 + 40);
  }

  else
  {
    uint64_t v7 = *(void *)(a2 + 16);
  }

  size_t v8 = v5 + 1;
  memcpy((void *)(v7 + v6), v4, v8);
  unsigned int v9 = *(_DWORD *)(a2 + 32) + v8;
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(*(void *)(a2 + 16) + v9) = *(void *)(a1 + 16);
  unsigned int v10 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(*(void *)(a2 + 16) + v10) = *(_DWORD *)(a1 + 36);
  unsigned int v11 = *(_DWORD *)(a2 + 32) + 4;
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(*(void *)(a2 + 16) + v11) = *(void *)(a1 + 24);
  unsigned int v12 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v12;
  *(_DWORD *)(*(void *)(a2 + 16) + v12) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 32) += 4;
  return 0LL;
}

gzFile sub_10000BD8C(gzFile result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = (uint64_t)result;
  if (!*(_DWORD *)(a2 + 28))
  {
    sub_10000ABB0(a2, 1);
    sub_10000ADA8(v7, a2);
    *(_DWORD *)(a2 + 252) = 0;
    uint64_t result = sub_100012698(v7, a2, 1);
    if (!result) {
      return result;
    }
    size_t v8 = result;
    *(_DWORD *)(a2 + 28) = 1;
    if (a4) {
      goto LABEL_7;
    }
LABEL_6:
    if (*(_DWORD *)(a3 + 32) < 0xDu) {
      return result;
    }
    goto LABEL_7;
  }

  size_t v8 = 0LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v9 = *(void *)(a3 + 16);
  *(void *)uint64_t v9 = 1145852723LL;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a3 + 32);
  *(_DWORD *)(v9 + 4) = sub_1000067B8((_BYTE *)v9, *(_DWORD *)(a3 + 32));
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 48));
  if (!v8)
  {
    gzFile v10 = sub_100012698(v7, a2, 0);
    if (!v10)
    {
      *(_DWORD *)(a2 + 28) = 0;
      return (gzFile)pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
    }

    size_t v8 = v10;
    *(_DWORD *)(a2 + 28) = 1;
  }

  uint64_t v11 = gzwrite(v8, *(voidpc *)(a3 + 16), *(_DWORD *)(a3 + 32));
  if (gzflush(v8, 2))
  {
    unsigned int v12 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000167F8();
    }
  }

  if (v11 == *(_DWORD *)(a3 + 32))
  {
    uint64_t v13 = *(void *)a2 + *(void *)(a3 + 24);
    *(void *)a2 = v13;
    int v14 = gzclose(v8);
    int v15 = v14;
    if (a4 || v13 >= 0x400000)
    {
      if (v14)
      {
        if (*__error() == 28) {
          *(_DWORD *)(a2 + 28) = 0;
        }
        int v18 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100016650(a2, v15, v18);
        }
        sub_10000ABB0(a2, 0);
        sub_10000ADA8(v7, a2);
      }

      *(void *)(*(void *)(a3 + 16) + 4LL) = 0xC00000000LL;
      *(void *)a2 = 0LL;
      *(_DWORD *)(a2 + 252) = 0;
    }

    else
    {
      *(_DWORD *)(a2 + 252) = 1;
    }
  }

  else
  {
    uint64_t v16 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10001675C(a3, a2, v16);
    }
    if (*__error() == 28)
    {
      *(_DWORD *)(a2 + 28) = 0;
      gzclose(v8);
      *(void *)(*(void *)(a3 + 16) + 4LL) = 0xC00000000LL;
      uint64_t v17 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000166F8();
      }
      sub_10000ABB0(a2, 0);
      sub_10000ADA8(v7, a2);
    }
  }

  return (gzFile)pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
}

uint64_t sub_10000C04C( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = a2;
    int v15 = &off_100020000;
    uint64_t v98 = a6;
    uint64_t v99 = a7;
    uint64_t v97 = a4;
    uint64_t v96 = a2;
    while (1)
    {
      uint64_t v16 = sub_100004F34(*(_DWORD *)(a6 + 4 * v13));
      if (!v16)
      {
        uint64_t v22 = (uint64_t)v15[233];
        goto LABEL_18;
      }

      uint64_t v17 = v16;
      int v18 = (uint64_t *)(v16 + 128);
      unsigned int v19 = v15[233];
      if (*(void *)(v16 + 128)) {
        unint64_t v20 = *(uint64_t (***)())(v16 + 128);
      }
      else {
        unint64_t v20 = v15[233];
      }
      if ((*(_DWORD *)(v16 + 32) & 0x80) == 0 && (*(_DWORD *)(v16 + 32) & 4) != 0) {
        goto LABEL_58;
      }
      bzero(&v124, 0x878uLL);
      if (strnstr(*(const char **)(a4 + 8 * v13), ".fseventsd", 0x400uLL)
        || strnstr(*(const char **)(a4 + 8 * v13), ".Spotlight-V100", 0x400uLL))
      {
        goto LABEL_119;
      }

      if (time(0LL) - *(void *)(v17 + 40) >= 16)
      {
        unsigned int v21 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          char v94 = *(const char **)(v17 + 8);
          *(_DWORD *)statfs buf = 136315138;
          v117 = v94;
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Events arrived for %s after an unmount request! Re-initializing.",  buf,  0xCu);
        }

        *(_DWORD *)(v17 + 32) &= ~0x80u;
        *(_DWORD *)(v17 + 32) |= 0x2004u;
        sub_100005A64(v17);
        *(_DWORD *)(v17 + 32) &= ~0x2000u;
LABEL_56:
        unint64_t v20 = (uint64_t (**)())*v18;
      }

      unsigned int v19 = v15[233];
LABEL_58:
      if ((*(_DWORD *)(v17 + 32) & 0x1000) == 0)
      {
        int v54 = (gzFile_s *)v17;
        if (v20) {
          uint64_t v22 = (uint64_t)v20;
        }
        else {
          uint64_t v22 = (uint64_t)v19;
        }
        if (((uint64_t)v54[1].next & 0x40) == 0)
        {
          uint64_t v55 = v54;
LABEL_65:
          if (((uint64_t)v55[1].next & 2) != 0)
          {
            uint64_t v56 = (uint64_t)v55;
            int v57 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              uint64_t v93 = *(void *)(v56 + 8);
              v124.f_bsize = 136315138;
              *(void *)&v124.f_iosize = v93;
              _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "event id's wrapped for volume %s",  (uint8_t *)&v124,  0xCu);
            }

            sub_100008BA4(v22 + 2304);
            sub_10000ABB0(v22, 1);
            *(_DWORD *)(v22 + 252) = 0;
            *(void *)(v22 + 8) = 0LL;
            uint64_t v55 = (gzFile_s *)v56;
            sub_10000ADA8(v56, v22);
            *(_DWORD *)(v56 + 32) &= ~2u;
          }

          int v23 = *(const char **)(a4 + 8 * v13);
          uint64_t v24 = *(void *)(a3 + 8 * v13);
          uint64_t v103 = v55;
          if (*(_DWORD *)(a6 + 4 * v13) == v55->have)
          {
            int v58 = strncmp(v23, "/.docid/", 8uLL);
            int v59 = strncmp(v23, "/.activity/", 0xBuLL);
            int have = 1;
            if (v58 && v59 && (int have = v103[1].have, have < 1))
            {
              char v61 = v23;
            }

            else
            {
              char v61 = v23;
              do
              {
                if (*v61 == 47)
                {
                  --have;
                }

                else if (!*v61)
                {
                  break;
                }

                ++v61;
              }

              while (have > 0);
            }

            char v109 = 0;
            uint64_t v24 = &v23[v24] - v61;
            int v23 = v61;
          }

          else
          {
            char v109 = 0;
          }

LABEL_19:
          unint64_t v25 = *(void *)(a7 + 8 * v13);
          if (v25 > *(void *)(v22 + 8))
          {
            *(void *)(v22 + 8) = v25;
            unint64_t v25 = *(void *)(a7 + 8 * v13);
          }

          uint64_t v26 = *(void *)(a8 + 8 * v13);
          unint64_t v108 = v25;
          int v106 = *(_DWORD *)(a5 + 4 * v13);
          int v107 = *(_DWORD *)(a9 + 4 * v13);
          if (v23[v24 - 1])
          {
            int v27 = v23[v24];
            unint64_t v28 = (os_log_s *)sub_1000031E4();
            BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
            if (v27)
            {
              if (v29)
              {
                v124.f_bsize = 136315394;
                *(void *)&v124.f_iosize = v23;
                WORD2(v124.f_blocks) = 2048;
                *(uint64_t *)((char *)&v124.f_blocks + 6) = v24;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "add_fname: path <<%s>> has len %zd but no trailing nul char!",  (uint8_t *)&v124,  0x16u);
              }
            }

            else
            {
              if (v29)
              {
                v124.f_bsize = 136315394;
                *(void *)&v124.f_iosize = v23;
                WORD2(v124.f_blocks) = 2048;
                *(uint64_t *)((char *)&v124.f_blocks + 6) = v24;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "add_fname: path <<%s>> has len %zd but should be +1!",  (uint8_t *)&v124,  0x16u);
              }

              ++v24;
            }
          }

          __darwin_time_t v30 = (pthread_rwlock_t *)(v22 + 2304);
          int v31 = *(_DWORD *)(v22 + 2512);
          uint64_t v110 = v13;
          v111 = (pthread_rwlock_t *)(v22 + 2304);
          if (3 * v31 + 3 <= (4 * *(_DWORD *)(v22 + 2520)))
          {
            unsigned int v32 = 2 * v31 + 2;
            if (v32 >= 0x80000)
            {
              if (!*(_DWORD *)(v22 + 2516))
              {
                __int16 v33 = (os_log_s *)sub_1000031E4();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  int32_t v91 = *(_DWORD *)(v22 + 2520);
                  int v92 = *(_DWORD *)(v22 + 2512);
                  v124.f_bsize = 67109376;
                  v124.f_iosize = v91;
                  LOWORD(v124.f_blocks) = 1024;
                  *(_DWORD *)((char *)&v124.f_blocks + 2) = v92;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "fname table has grown too large. (filled %d / mask 0x%x)\n",  (uint8_t *)&v124,  0xEu);
                }

                *(_DWORD *)(v22 + 2516) = 1;
              }

              goto LABEL_82;
            }

            time_t v34 = sub_100012408(v32, buf);
            if (v34)
            {
              double v35 = v34;
              uint64_t v104 = v24;
              pthread_rwlock_wrlock((pthread_rwlock_t *)(v22 + 2304));
              int v36 = 0;
              uint64_t v37 = *(void **)(v22 + 2504);
              *(void *)(v22 + 2504) = v35;
              unsigned int v38 = *(_DWORD *)(v22 + 2512);
              *(_DWORD *)(v22 + 2512) = *(_DWORD *)buf;
              *(_DWORD *)(v22 + 2520) = 0;
              while (1)
              {
                unsigned int v39 = (uint64_t *)v37[v36];
                if (v39) {
                  break;
                }
LABEL_52:
                if (++v36 > v38)
                {
                  __darwin_time_t v30 = (pthread_rwlock_t *)(v22 + 2304);
                  pthread_rwlock_unlock(v111);
                  free(v37);
                  uint64_t v24 = v104;
                  goto LABEL_82;
                }
              }

              while (2)
              {
                __int32 v40 = (_BYTE *)v39[5];
                int v41 = *v40;
                if (*v40)
                {
                  unsigned int v42 = 0;
                  uint64_t v43 = v40 + 1;
                  do
                  {
                    unsigned int v42 = dword_100020298[v41 ^ HIBYTE(v42)] ^ (v42 << 8);
                    int v44 = *v43++;
                    int v41 = v44;
                  }

                  while (v44);
                }

                else
                {
                  unsigned int v42 = 0;
                }

                if (v42 <= 1) {
                  unsigned int v42 = 1;
                }
                unsigned int v45 = *(_DWORD *)(v22 + 2512);
                uint64_t v46 = (uint64_t *)(*(void *)(v22 + 2504) + 8LL * (v45 & v42));
                uint64_t v47 = *v46;
                if (*v46)
                {
                  uint64_t v48 = (uint64_t *)*v39;
                  uint64_t *v39 = v47;
                  goto LABEL_50;
                }

                unsigned int v49 = *(_DWORD *)(v22 + 2520) + 1;
                *(_DWORD *)(v22 + 2520) = v49;
                if (v49 > v45)
                {
                  uint64_t v50 = (os_log_s *)sub_1000031E4();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    int32_t v51 = *(_DWORD *)(v22 + 2520);
                    int v52 = *(_DWORD *)(v22 + 2512);
                    v124.f_bsize = 67109376;
                    v124.f_iosize = v51;
                    LOWORD(v124.f_blocks) = 1024;
                    *(_DWORD *)((char *)&v124.f_blocks + 2) = v52;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "fname table is screwed up! filled buckets %u / table_mask %u)",  (uint8_t *)&v124,  0xEu);
                  }
                }

                uint64_t v47 = *v46;
                uint64_t v48 = (uint64_t *)*v39;
                uint64_t *v39 = *v46;
                if (v47) {
LABEL_50:
                }
                  *(void *)(v47 + 8) = v39;
                uint64_t *v46 = (uint64_t)v39;
                v39[1] = (uint64_t)v46;
                unsigned int v39 = v48;
                if (!v48) {
                  goto LABEL_52;
                }
                continue;
              }
            }

            uint64_t v62 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
              sub_10001688C(&v114, v115);
            }
          }

LABEL_82:
          int v63 = *(unsigned __int8 *)v23;
          if (*v23)
          {
            unsigned int v64 = 0;
            int v65 = (unsigned __int8 *)(v23 + 1);
            do
            {
              unsigned int v64 = dword_100020298[v63 ^ HIBYTE(v64)] ^ (v64 << 8);
              int v66 = *v65++;
              int v63 = v66;
            }

            while (v66);
          }

          else
          {
            unsigned int v64 = 0;
          }

          if (v64 <= 1) {
            int v67 = 1;
          }
          else {
            int v67 = v64;
          }
          pthread_rwlock_wrlock(v30);
          v105 = (void *)(*(void *)(v22 + 2504) + 8LL * (*(_DWORD *)(v22 + 2512) & v67));
          v68 = (void *)*v105;
          if (*v105)
          {
            unsigned int v69 = 0;
            size_t v70 = v24;
            uint64_t v71 = v24 - 1;
            while (1)
            {
              uint64_t v72 = v68;
              v68 = (void *)*v68;
              if (v72[3] == v26)
              {
                uint64_t v73 = (const char *)v72[5];
                if (!strncmp(v73, v23, v70) && !v73[v71]) {
                  break;
                }
              }

              ++v69;
              if (!v68) {
                goto LABEL_98;
              }
            }

LABEL_112:
            pthread_rwlock_unlock(v111);
            int v83 = *((_DWORD *)v72 + 9) | v106;
            v72[2] = v108;
            v72[3] = v26;
            *((_DWORD *)v72 + 9) = v83;
            *((_DWORD *)v72 + 8) = v107;
            a6 = v98;
            uint64_t v13 = v110;
            int v15 = &off_100020000;
          }

          else
          {
            size_t v70 = v24;
            unsigned int v69 = 0;
LABEL_98:
            int v74 = *(_DWORD *)(v22 + 2548);
            if (v74 < *(_DWORD *)(v22 + 2544))
            {
              uint64_t v75 = *(void *)(v22 + 2536);
              *(_DWORD *)(v22 + 2548) = v74 + 1;
              if (v69 > dword_100020728) {
                dword_100020728 = v69;
              }
              ++*(_DWORD *)(v22 + 2524);
              uint64_t v76 = v75 + 48LL * v74;
              *(_DWORD *)(v76 + 36) = 0;
              uint64_t v77 = sub_100006654(v23, v70);
              *(void *)(v76 + 40) = v77;
              uint64_t v78 = (uint64_t *)(v76 + 40);
              if (v77[v70 - 1])
              {
                int v79 = dword_10002069C++;
                if (v79 <= 49)
                {
                  uint64_t v80 = (os_log_s *)sub_1000031E4();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v88 = *v78;
                    v124.f_bsize = 136315394;
                    *(void *)&v124.f_iosize = v88;
                    WORD2(v124.f_blocks) = 2048;
                    *(uint64_t *)((char *)&v124.f_blocks + 6) = v70;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_ERROR,  "add_fname: path <<%s>> has len %zd",  (uint8_t *)&v124,  0x16u);
                  }
                }
              }

              uint64_t v72 = (void *)(v75 + 48LL * v74);
              uint64_t v81 = (void *)*v105;
              if (*v105)
              {
                *(void *)(v22 + 2528) += v70;
                v81[1] = v72;
              }

              else
              {
                ++*(_DWORD *)(v22 + 2520);
                *(void *)(v22 + 2528) += v70;
              }

              *uint64_t v72 = v81;
              void *v105 = v72;
              v72[1] = v105;
              goto LABEL_112;
            }

            int v82 = (os_log_s *)sub_1000031E4();
            uint64_t v13 = v110;
            int v15 = &off_100020000;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              int32_t v86 = *(_DWORD *)(v22 + 2544);
              int v87 = *(_DWORD *)(v22 + 2548);
              v124.f_bsize = 67109634;
              v124.f_iosize = v86;
              LOWORD(v124.f_blocks) = 1024;
              *(_DWORD *)((char *)&v124.f_blocks + 2) = v87;
              HIWORD(v124.f_blocks) = 2080;
              v124.f_bfree = (uint64_t)v23;
              _os_log_error_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "too many filenames in the table (max %d cur %d) : path %s\n",  (uint8_t *)&v124,  0x18u);
            }

            pthread_rwlock_unlock(v111);
            a6 = v98;
          }

          a7 = v99;
          a4 = v97;
          uint64_t v14 = v96;
          if ((v109 & 1) == 0 && *(_DWORD *)(v22 + 2524) >= 0xAAAu)
          {
            *(void *)&v124.f_bsize = v103;
            v124.f_blocks = v22;
            int64_t v84 = malloc_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL);
            v124.f_bfree = (uint64_t)v84;
            if (v84)
            {
              v124.f_bavail = 0x40000LL;
              *(void *)int64_t v84 = 1145852723LL;
              v84[2] = 12;
              LODWORD(v124.f_files) = 12;
              sub_1000089F4(0LL, v111, (unsigned int (*)(uint64_t, uint64_t))sub_10000BC84, (uint64_t)&v124);
              sub_10000BD8C(v103, v22, (uint64_t)&v124, 1);
              malloc_zone_free((malloc_zone_t *)qword_1000206B8, (void *)v124.f_bfree);
              sub_100008BA4((uint64_t)v111);
            }

            else
            {
              int v85 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                sub_100016860(&v112, v113);
              }
            }
          }

          goto LABEL_119;
        }

        uint64_t v55 = (gzFile_s *)sub_100004F34(-1);
        uint64_t v22 = (uint64_t)v15[233];
        if (v55) {
          goto LABEL_65;
        }
LABEL_18:
        uint64_t v103 = 0LL;
        int v23 = *(const char **)(a4 + 8 * v13);
        uint64_t v24 = *(void *)(a3 + 8 * v13);
        char v109 = 1;
        goto LABEL_19;
      }

LABEL_119:
      if (++v13 == v14) {
        goto LABEL_124;
      }
    }

    int v53 = (os_log_s *)sub_1000031E4();
    int v18 = &qword_100020748;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      uint64_t v89 = *(void *)(v17 + 8);
      int v90 = *(_DWORD *)v17;
      *(_DWORD *)statfs buf = 136315906;
      v117 = "disk_logger_callback";
      __int16 v118 = 2080;
      uint64_t v119 = v89;
      __int16 v120 = 1024;
      int v121 = v90;
      __int16 v122 = 1024;
      int32_t v123 = v124.f_fsid.val[0];
      _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: Assign to global disk logger - mount_point[%s], di->dev[%d] sfs.f_fsid.val[0]=[%d]",  buf,  0x22u);
    }

    goto LABEL_56;
  }

LABEL_124:
  sub_1000048C0((uint64_t)&unk_100021758);
  return 0LL;
}

uint64_t sub_10000CB70()
{
  size_t v5 = "/";
  memset(&v6, 0, 32);
  qword_1000206B0 = (uint64_t)malloc_default_zone();
  pid_t v0 = getpid();
  if (sub_1000084AC( v0,  0,  (uint64_t)&v5,  1u,  0LL,  0,  30000000LL,  *(_DWORD *)(qword_100020748 + 24),  -1LL,  256,  (uint64_t)sub_10000C04C,  qword_100020748,  0,  0,  &v6,  (unint64_t *)(qword_100020748 + 16)))
  {
    BOOL v1 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000168B8();
    }
    return 22LL;
  }

  else
  {
    *(_DWORD *)(*(void *)(qword_100020748 + 16) + 188LL) |= 0x20u;
    do
      unsigned int v3 = __ldxr((unsigned int *)&dword_100020724);
    while (__stxr(v3 + 1, (unsigned int *)&dword_100020724));
    do
      unsigned int v4 = __ldxr((unsigned int *)&dword_100020720);
    while (__stxr(v4 + 1, (unsigned int *)&dword_100020720));
    sub_100004D78((uint64_t (*)(void))sub_10000CD04);
    pthread_attr_init(&v6);
    pthread_attr_setdetachstate(&v6, 2);
    pthread_create(&qword_100021828, &v6, (void *(__cdecl *)(void *))sub_10000CD20, *(void **)(qword_100020748 + 16));
    pthread_attr_destroy(&v6);
    uint64_t result = 0LL;
    __dmb(0xBu);
    dword_100020740 = 1;
  }

  return result;
}

uint64_t sub_10000CD04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 128);
  if (v2 && !*(void *)(v2 + 16)) {
    *(void *)(v2 + 16) = a2;
  }
  return 0LL;
}

uint64_t sub_10000CD20(unint64_t a1)
{
  kern_return_t v123;
  kern_return_t v124;
  os_log_s *v125;
  os_log_s *v126;
  uint64_t v127;
  int v128;
  int v129;
  void *v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  uint64_t v135;
  int v136;
  int v137;
  int *v138;
  char *v139;
  int v140;
  int v141;
  int v142;
  pthread_cond_t *v143;
  char v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uid_t *v148;
  uint64_t v149;
  unsigned int v150;
  _OWORD *v151;
  unint64_t v152;
  stat v153;
  char __str[50];
  statfs buf;
  _BYTE v156[12];
  void v157[32];
  _DWORD v158[32];
  _DWORD v159[32];
  void v160[32];
  mach_msg_type_number_t thread_info_outCnt[2];
  void v162[33];
  _DWORD v163[32];
  uint64_t v2 = "client";
  int v3 = *(_DWORD *)(a1 + 188);
  if ((v3 & 0x20) != 0) {
    uint64_t v2 = "disklogger";
  }
  snprintf(__str, 0x32uLL, "com.apple.fseventsd.%s.%d", v2, *(_DWORD *)(a1 + 248));
  pthread_setname_np(__str);
  unsigned int v4 = pthread_self();
  *(_DWORD *)(a1 + 320) = pthread_mach_thread_np(v4);
  if ((v3 & 0x20) != 0) {
    setiopolicy_np(0, 1, 2);
  }
  uid_t v5 = *(_DWORD *)(a1 + 252);
  v148 = (uid_t *)(a1 + 252);
  if (v5)
  {
    if (!*(void *)(a1 + 344))
    {
      pthread_attr_t v6 = getpwuid(v5);
      if (v6)
      {
        *(void *)(a1 + 344) = strdup(v6->pw_name);
      }

      else
      {
        uint64_t v7 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10001690C((uint64_t)v148, v7, v8, v9, v10, v11, v12, v13);
        }
      }
    }

    if (*v148 && *(_DWORD *)(a1 + 112)) {
      sub_100012A0C();
    }
  }

  if ((*(_DWORD *)(a1 + 188) & 0x400) == 0)
  {
    sub_10000FC28(a1);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    *(_DWORD *)(a1 + 188) |= 0x400u;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }

  v144 = v3;
  if (*v148)
  {
    pthread_setugid_np(*v148, *(_DWORD *)(a1 + 256));
    uint64_t v14 = *(const char **)(a1 + 344);
    if (v14)
    {
      if (initgroups(v14, *(_DWORD *)(a1 + 256)) < 0)
      {
        int v15 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v135 = *(void *)(a1 + 344);
          int v3 = *(_DWORD *)(a1 + 252);
          v136 = *(_DWORD *)(a1 + 256);
          v137 = *__error();
          v138 = __error();
          v139 = strerror(*v138);
          buf.f_bsize = 136316162;
          *(void *)&buf.f_iosize = v135;
          WORD2(buf.f_blocks) = 1024;
          *(_DWORD *)((char *)&buf.f_blocks + 6) = v3;
          LOBYTE(v3) = v144;
          WORD1(buf.f_bfree) = 1024;
          HIDWORD(buf.f_bfree) = v136;
          LOWORD(buf.f_bavail) = 1024;
          *(_DWORD *)((char *)&buf.f_bavail + 2) = v137;
          HIWORD(buf.f_bavail) = 2080;
          buf.f_files = (uint64_t)v139;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "client_loop: initgroups failed for user %s uid %d gid %d (err: %d/%s)",  (uint8_t *)&buf,  0x28u);
        }
      }
    }
  }

  uint64_t v16 = &off_100020000;
  if (!dword_1000206C8)
  {
    v143 = (pthread_cond_t *)(a1 + 64);
    v151 = (_OWORD *)(a1 + 260);
    v150 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_NO_REPORT | 1;
    unint64_t v50 = a1 + 352;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 188) & 0x1A) != 0) {
        goto LABEL_22;
      }
      pthread_mutex_lock((pthread_mutex_t *)a1);
      if (!*((_DWORD *)v16 + 434) && (*(_DWORD *)(a1 + 188) & 0x21B) == 0)
      {
        if ((v3 & 0x20) != 0)
        {
          if (pthread_cond_wait(v143, (pthread_mutex_t *)a1)) {
            goto LABEL_26;
          }
        }

        else
        {
          gettimeofday((timeval *)&buf, 0LL);
          v162[0] = *(void *)&buf.f_bsize + 15LL;
          v162[1] = 0LL;
          if (pthread_cond_timedwait(v143, (pthread_mutex_t *)a1, (const timespec *)v162) == 60
            && *(_DWORD *)(a1 + 240) == *(_DWORD *)(a1 + 244))
          {
            *(_DWORD *)(a1 + 188) |= 0x800u;
            pthread_mutex_unlock((pthread_mutex_t *)a1);
            pthread_exit(0LL);
          }
        }
      }

      pthread_mutex_unlock((pthread_mutex_t *)a1);
      if (!*((_DWORD *)v16 + 434) || (v3 & 0x20) != 0) {
        break;
      }
LABEL_235:
      if (*((_DWORD *)v16 + 434)) {
        goto LABEL_22;
      }
    }

    if ((*(_DWORD *)(a1 + 188) & 2) != 0
      || ((*(_DWORD *)(a1 + 188) & 1) != 0 ? (int v52 = sub_10000FE5C(a1)) : (int v52 = 0), (*(_DWORD *)(a1 + 188) & 2) != 0))
    {
LABEL_213:
      thread_info_outCnt[0] = 10;
      int32_t v123 = thread_info(*(_DWORD *)(a1 + 320), 3u, (thread_info_t)&buf, thread_info_outCnt);
      if (v123)
      {
        statfs v124 = v123;
        v125 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v162[0]) = 136315394;
          *(void *)((char *)v162 + 4) = "client_get_thread_info";
          WORD2(v162[1]) = 1024;
          *(_DWORD *)((char *)&v162[1] + 6) = v124;
          _os_log_error_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_ERROR,  "%s : [%d]thread_info",  (uint8_t *)v162,  0x12u);
        }
      }

      else
      {
        *(_OWORD *)(a1 + 324) = *(_OWORD *)&buf.f_bsize;
      }

      if ((*(_DWORD *)(a1 + 188) & 8) == 0)
      {
        if ((*(_DWORD *)(a1 + 188) & 0x10) == 0) {
          goto LABEL_230;
        }
        if (*(void *)(a1 + 120))
        {
          if (syscall(348, *(void *)(a1 + 120)))
          {
            v126 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
              v127 = *(void *)(a1 + 120);
              buf.f_bsize = 136315138;
              *(void *)&buf.f_iosize = v127;
              _os_log_error_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_ERROR,  "client: failed to chdir back to %s",  (uint8_t *)&buf,  0xCu);
            }

            goto LABEL_230;
          }
        }

        else if (sub_100012A0C())
        {
          goto LABEL_230;
        }

        *(_DWORD *)(a1 + 188) &= ~0x10u;
        goto LABEL_230;
      }

      v128 = open(".", 0);
      if (v128 >= 1)
      {
        v129 = v128;
        if (!fcntl(v128, 50, &buf))
        {
          v130 = *(void **)(a1 + 120);
          if (v130) {
            free(v130);
          }
          *(void *)(a1 + 120) = strdup((const char *)&buf);
        }

        close(v129);
      }

      *(_DWORD *)(a1 + 188) &= ~8u;
      *(_DWORD *)(a1 + 188) |= 0x40u;
      syscall(348, "/");
LABEL_230:
      if ((v3 & 0x20) != 0)
      {
        while (1)
        {
          v131 = __ldxr((unsigned int *)&unk_100020700);
          if (v131 != 1) {
            break;
          }
          if (!__stxr(0, (unsigned int *)&unk_100020700))
          {
            sub_100004D78((uint64_t (*)(void))sub_100005104);
            goto LABEL_235;
          }
        }

        __clrex();
      }

      goto LABEL_235;
    }

    if ((*(_DWORD *)(a1 + 188) & 0x200) != 0)
    {
      int v53 = *(const char ***)(a1 + 136);
      v157[0] = *v53;
      v162[0] = strlen(*v53) + 1;
      v163[0] = 0x8000000;
      *(void *)thread_info_outCnt = *(void *)(a1 + 168);
      v158[0] = 0;
      int v54 = *(uint64_t (**)(void, uint64_t, void *, void *, _DWORD *, _DWORD *, mach_msg_type_number_t *, void *, _DWORD *))(a1 + 208);
      if (v54)
      {
        int v55 = v54(*(void *)(a1 + 216), 1LL, v162, v157, v163, v158, thread_info_outCnt, v160, v159);
        if (!v55)
        {
          *(_DWORD *)(a1 + 188) &= ~0x200u;
          if ((*(_DWORD *)(a1 + 188) & 2) != 0) {
            goto LABEL_213;
          }
LABEL_98:
          unsigned int v56 = sub_100006C38((_DWORD *)a1);
          if (v56)
          {
            uint64_t v57 = v56;
            size_t v58 = (int)v56;
            int v59 = (char *)malloc(8LL * (int)v56);
            if (!v59) {
              goto LABEL_22;
            }
            stat v60 = v59;
            if ((int)v58 <= 0)
            {
              qsort(v59, v58, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100012A74);
LABEL_211:
              free(v60);
              uint64_t v16 = &off_100020000;
            }

            else
            {
              uint64_t v61 = 0LL;
              uint64_t v62 = *(void *)(a1 + 416);
              int v63 = *(_DWORD *)(a1 + 224);
              do
              {
                *(void *)&v59[8 * v61] = *(void *)(v62 + 8LL * (((int)v61 + *(_DWORD *)(a1 + 240)) % v63));
                ++v61;
              }

              while (v57 != v61);
              qsort(v59, v58, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100012A74);
              uint64_t v64 = 0LL;
              int v65 = *(_DWORD *)(a1 + 224);
              do
              {
                *(void *)(*(void *)(a1 + 416) + 8LL * (((int)v64 + *(_DWORD *)(a1 + 240)) % v65)) = *(void *)&v60[8 * v64];
                ++v64;
              }

              while (v57 != v64);
              v140 = v57;
              int v66 = 0;
              int v67 = 0;
              uint64_t v68 = 0LL;
              v152 = v50;
              v145 = v60;
              while ((*(_DWORD *)(a1 + 188) & 2) == 0)
              {
                v141 = v67;
                LODWORD(v69) = v140 - v66;
                else {
                  uint64_t v69 = v69;
                }
                v147 = v69;
                v142 = v66;
                if ((_DWORD)v69)
                {
                  uint64_t v70 = 0LL;
                  LODWORD(v71) = 0;
                  v146 = v66;
                  while (1)
                  {
                    v149 = v70;
                    uint64_t v68 = *(void *)&v60[8 * v70 + 8 * v146];
                    unint64_t v72 = *(unsigned int *)(a1 + 192);
                    uint64_t v73 = (unsigned __int8 *)(v68 + (v72 >> 3) + 56);
                    char v74 = v72 & 7;
                    unsigned int v75 = 0x80u >> (v72 & 7);
                    int v76 = -129 >> v74;
                    do
                      int v77 = __ldxr(v73);
                    while (__stxr(v77 & v76, v73));
                    if ((v75 & v77) == 0)
                    {
                      uint64_t v78 = (os_log_s *)sub_1000031E4();
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                      {
                        int v111 = *(_DWORD *)(a1 + 192);
                        buf.f_bsize = 134218240;
                        *(void *)&buf.f_iosize = v68;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v111;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "client loop: event %p did not have my bit (%d) set!",  (uint8_t *)&buf,  0x12u);
                      }
                    }

                    if (*v148) {
                      break;
                    }
LABEL_175:
                    uint64_t v105 = 0LL;
                    int v106 = *(const char **)(v68 + 120);
                    unint64_t v50 = v152;
                    do
                    {
                      int v107 = *(const char **)(v152 + v105);
                      if (!v107) {
                        break;
                      }
                      size_t v108 = strlen(*(const char **)(v152 + v105));
                      if (!strncmp(v106, v107, v108)) {
                        goto LABEL_186;
                      }
                      v105 += 8LL;
                    }

                    while (v105 != 64);
                    v157[(int)v71] = v106;
                    v162[(int)v71] = *(__int16 *)(v68 + 52);
                    int v109 = *(_DWORD *)(v68 + 20);
                    v163[(int)v71] = v109;
                    v158[(int)v71] = *(_DWORD *)(v68 + 28);
                    *(void *)&thread_info_outCnt[2 * (int)v71] = *(void *)(v68 + 32);
                    v160[(int)v71] = *(void *)(v68 + 40);
                    v159[(int)v71] = *(_DWORD *)(v68 + 48);
                    if ((*(_DWORD *)(a1 + 188) & 0x1000) != 0 && *(_DWORD *)(a1 + 248) == *(_DWORD *)(v68 + 24)) {
                      v163[(int)v71] = v109 | 0x200000;
                    }
                    unint64_t v110 = *(void *)(v68 + 32);
                    stat v60 = v145;
                    if (v110 > *(void *)(a1 + 160)) {
                      *(void *)(a1 + 160) = v110;
                    }
LABEL_187:
                    uint64_t v71 = (v71 + 1);
                    uint64_t v70 = v149 + 1;
                    if (v149 + 1 == v147) {
                      goto LABEL_190;
                    }
                  }

                  char v79 = 1;
                  while (2)
                  {
                    if (*(_DWORD *)(a1 + 292) || (*(_BYTE *)(v68 + 23) & 6) != 0) {
                      goto LABEL_175;
                    }
                    uint64_t v80 = *(char **)(v68 + 120);
                    if (*v80)
                    {
                      if (strncmp(*(const char **)(v68 + 120), ".docid/", 7uLL) && strncmp(v80, ".activity/", 0xAuLL))
                      {
                        char v81 = 1;
                        goto LABEL_128;
                      }

                      *(void *)v156 = 0LL;
                      *(_DWORD *)&v156[8] = *(_DWORD *)(v68 + 28);
                      sub_100004D78((uint64_t (*)(void))sub_100008334);
                      uint64_t v80 = *(char **)v156;
                      if (*(void *)v156)
                      {
                        char v81 = 0;
                        goto LABEL_128;
                      }

                      char v94 = (os_log_s *)sub_1000031E4();
                      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                      {
                        int v95 = *(_DWORD *)(v68 + 28);
                        buf.f_bsize = 136315394;
                        *(void *)&buf.f_iosize = "client_process_events";
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v95;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_ERROR,  "%s: path for pseudo path  device(%d)  is not available",  (uint8_t *)&buf,  0x12u);
                      }

LABEL_167:
                      char v103 = ((*(_DWORD *)(a1 + 188) & 0x40) == 0) | ~v79;
                      unint64_t v50 = v152;
                      if ((v103 & 1) != 0) {
                        goto LABEL_186;
                      }
                      uint64_t v104 = *(const char **)(a1 + 120);
                      if (v104)
                      {
                        if (!statfs(v104, &buf)
                          && buf.f_fsid.val[0] == *(_DWORD *)(a1 + 112)
                          && syscall(348, *(void *)(a1 + 120)))
                        {
                          char v112 = (os_log_s *)sub_1000031E4();
                          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v114 = *(void *)(a1 + 120);
                            *(_DWORD *)v156 = 136315138;
                            *(void *)&v156[4] = v114;
                            _os_log_error_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_ERROR,  "client: failed to chdir back to %s",  v156,  0xCu);
                          }

LABEL_186:
                          LODWORD(v71) = v71 - 1;
                          stat v60 = v145;
                          goto LABEL_187;
                        }
                      }

                      else if (sub_100012A0C())
                      {
                        goto LABEL_186;
                      }

                      char v79 = 0;
                      *(_DWORD *)(a1 + 188) &= 0xFFFFFFAF;
                      if (!*(_DWORD *)(a1 + 252)) {
                        goto LABEL_175;
                      }
                      continue;
                    }

                    break;
                  }

                  char v81 = 1;
                  uint64_t v80 = ".";
LABEL_128:
                  if (!lstat(v80, &v153))
                  {
                    if (!*(_DWORD *)(a1 + 248)) {
                      sub_1000168E4();
                    }
                    goto LABEL_133;
                  }

                  if (*__error() == 2) {
                    goto LABEL_130;
                  }
                  if (*__error() == 63
                    && (uint64_t v88 = strrchr(v80, 47)) != 0LL
                    && (v89 = v88, int v90 = v88 + 1, strlen(v88 + 1) >= 0xFF)
                    && (char v91 = *v90) != 0)
                  {
                    int v92 = (unsigned __int8 *)(v89 + 2);
                    while ((v91 & 0x80) == 0)
                    {
                      int v93 = *v92++;
                      char v91 = v93;
                      if (!v93) {
                        goto LABEL_164;
                      }
                    }

LABEL_130:
                    int v82 = sub_100012A94(v80);
                    int v83 = access(v82, 4);
                    __int128 v84 = *(_OWORD *)(a1 + 276);
                    *(_OWORD *)&buf.f_bsize = *v151;
                    *(_OWORD *)&buf.f_bfree = v84;
                    int v85 = sandbox_check_by_audit_token(&buf, "file-read-metadata", v150);
                    free(v82);
                    if (!(v83 | v85))
                    {
                      BOOL v86 = 1;
                      goto LABEL_152;
                    }

                    uint64_t v96 = *(unsigned int *)(a1 + 128);
                    if ((int)v96 < 1)
                    {
                      BOOL v86 = 0;
LABEL_152:
                      if ((v81 & 1) == 0) {
                        goto LABEL_165;
                      }
                    }

                    else
                    {
                      uint64_t v97 = 0LL;
                      uint64_t v98 = *(const char **)(v68 + 120);
                      uint64_t v99 = *(void *)(a1 + 136);
                      uint64_t v100 = 8 * v96;
                      while (!strstr(v98, *(const char **)(v99 + v97)))
                      {
                        v97 += 8LL;
                        if (v100 == v97)
                        {
                          BOOL v86 = 0;
                          LOBYTE(v3) = v144;
                          goto LABEL_152;
                        }
                      }

                      uint64_t v101 = *(const char **)(v99 + v97);
                      if (*(_DWORD *)(a1 + 112))
                      {
                        if (*v101) {
                          uint64_t v80 = *(char **)(v99 + v97);
                        }
                        else {
                          uint64_t v80 = ".";
                        }
                        LOBYTE(v3) = v144;
                        if (lstat(v80, &v153) || v153.st_uid != *v148) {
                          goto LABEL_164;
                        }
LABEL_133:
                        __int128 v87 = *(_OWORD *)(a1 + 276);
                        *(_OWORD *)&buf.f_bsize = *v151;
                        *(_OWORD *)&buf.f_bfree = v87;
                      }

                      else
                      {
                        LOBYTE(v3) = v144;
                        if (lstat(v101, &v153) || v153.st_uid != *v148) {
                          goto LABEL_164;
                        }
                        __int128 v102 = *(_OWORD *)(a1 + 276);
                        *(_OWORD *)&buf.f_bsize = *v151;
                        *(_OWORD *)&buf.f_bfree = v102;
                      }

                      BOOL v86 = sandbox_check_by_audit_token(&buf, "file-read-metadata", v150) == 0;
                      if ((v81 & 1) == 0) {
LABEL_165:
                      }
                        free(v80);
                    }
                  }

                  else
                  {
LABEL_164:
                    BOOL v86 = 0;
                    if ((v81 & 1) == 0) {
                      goto LABEL_165;
                    }
                  }

                  if (v86) {
                    goto LABEL_175;
                  }
                  goto LABEL_167;
                }

                uint64_t v71 = 0LL;
LABEL_190:
                v115 = *(uint64_t (**)(void, uint64_t, void *, void *, _DWORD *, _DWORD *, mach_msg_type_number_t *, void *, _DWORD *))(a1 + 208);
                if (v115 && (*(_DWORD *)(a1 + 188) & 2) == 0 && (int)v71 >= 1)
                {
                  int v116 = v115(*(void *)(a1 + 216), v71, v162, v157, v163, v158, thread_info_outCnt, v160, v159);
                  if (v116)
                  {
                    if (v116 == 268435459) {
                      *(_DWORD *)(a1 + 188) |= 2u;
                    }
                    v141 = v116;
                    *(_DWORD *)(a1 + 188) |= 1u;
                    if (!*(void *)(a1 + 152)) {
                      *(void *)(a1 + 152) = *(void *)thread_info_outCnt;
                    }
                    int v117 = *(_DWORD *)(a1 + 184);
                    *(_DWORD *)(a1 + 184) = v117 + 1;
                    if (v117 >= 5)
                    {
                      __int16 v118 = (os_log_s *)sub_1000031E4();
                      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                      {
                        int v122 = *(_DWORD *)(a1 + 248);
                        buf.f_bsize = 134218496;
                        *(void *)&buf.f_iosize = a1;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v122;
                        WORD1(buf.f_bfree) = 1024;
                        HIDWORD(buf.f_bfree) = dword_1000206A0;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_ERROR,  "SLOWDOWN: client %p (pid %d) sleeping due to too many errors (num usleeps %d)",  (uint8_t *)&buf,  0x18u);
                      }

                      sleep(2u);
                      *(_DWORD *)(a1 + 184) = 0;
                    }
                  }

                  else
                  {
                    ++*(void *)(a1 + 304);
                    v141 = 0;
                    *(void *)(a1 + 296) += strlen(*(const char **)(v68 + 120));
                  }
                }

                if ((_DWORD)v147)
                {
                  uint64_t v119 = (uint64_t *)&v60[8 * v142];
                  uint64_t v120 = v147;
                  do
                  {
                    uint64_t v121 = *v119++;
                    sub_1000069D8(v121);
                    --v120;
                  }

                  while (v120);
                }

                *(_DWORD *)(a1 + 240) = (*(_DWORD *)(a1 + 240) + v147) % *(_DWORD *)(a1 + 224);
                int v67 = v141;
                if (v141 == 268435460 || v141 == 268435469) {
                  goto LABEL_211;
                }
                int v66 = v147 + v142;
              }

              free(v60);
              uint64_t v16 = &off_100020000;
              if (v67) {
                goto LABEL_22;
              }
            }
          }

          goto LABEL_213;
        }

        int v52 = v55;
        if (v55 == 268435459)
        {
          *(_DWORD *)(a1 + 188) |= 2u;
          if ((*(_DWORD *)(a1 + 188) & 2) != 0) {
            goto LABEL_213;
          }
LABEL_96:
          gettimeofday((timeval *)&buf, 0LL);
          *(void *)&v153.st_dev = *(void *)&buf.f_bsize + 1LL;
          v153.st_ino = 0LL;
          pthread_mutex_lock((pthread_mutex_t *)a1);
          pthread_cond_timedwait(v143, (pthread_mutex_t *)a1, (const timespec *)&v153);
          pthread_mutex_unlock((pthread_mutex_t *)a1);
          goto LABEL_213;
        }
      }
    }

    if ((*(_DWORD *)(a1 + 188) & 2) != 0) {
      goto LABEL_213;
    }
    if (v52) {
      goto LABEL_96;
    }
    goto LABEL_98;
  }

LABEL_22:
  if (*((_DWORD *)v16 + 434)) {
    BOOL v17 = (v3 & 0x20) == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (!v17)
  {
LABEL_26:
    if (*v148 && *(_DWORD *)(a1 + 112)) {
      syscall(348, "/");
    }
    pthread_mutex_lock((pthread_mutex_t *)a1);
    *(_DWORD *)(a1 + 188) |= 2u;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    do
      unsigned int v18 = __ldxr(&dword_10002071C);
    while (__stxr(v18, &dword_10002071C));
    if (v18)
    {
      unsigned int v19 = 0;
      do
      {
        usleep(0x1388u);
        do
          unsigned int v20 = __ldxr(&dword_10002071C);
        while (__stxr(v20, &dword_10002071C));
        if (v20) {
          BOOL v21 = v19 >= 0x1387;
        }
        else {
          BOOL v21 = 1;
        }
        ++v19;
      }

      while (!v21);
    }

    pthread_mutex_lock(&stru_100020140);
    int v22 = sub_100006C38((_DWORD *)a1);
    if (v22 >= 1)
    {
      uid_t v23 = v22;
      for (int i = 0; i != v23; ++i)
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 416) + 8LL * ((*(_DWORD *)(a1 + 240) + i) % *(_DWORD *)(a1 + 224)));
        if (v25)
        {
          unint64_t v26 = *(unsigned int *)(a1 + 192);
          int v27 = (unsigned __int8 *)(v25 + (v26 >> 3) + 56);
          char v28 = v26 & 7;
          unsigned int v29 = 0x80u >> (v26 & 7);
          int v30 = -129 >> v28;
          do
            int v31 = __ldxr(v27);
          while (__stxr(v31 & v30, v27));
          if ((v29 & v31) != 0)
          {
            sub_1000069D8(v25);
          }

          else
          {
            unsigned int v38 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              int v39 = *(_DWORD *)(v25 + 20);
              int v40 = *(_DWORD *)(a1 + 192);
              int v41 = *(char *)(v25 + 56);
              int v42 = *(char *)(v25 + 57);
              int v43 = *(_DWORD *)(a1 + 240);
              int32_t v44 = *(_DWORD *)(a1 + 244);
              buf.f_bsize = 134220032;
              *(void *)&buf.f_iosize = v25;
              WORD2(buf.f_blocks) = 1024;
              *(_DWORD *)((char *)&buf.f_blocks + 6) = v39;
              WORD1(buf.f_bfree) = 1024;
              HIDWORD(buf.f_bfree) = v40;
              LOWORD(buf.f_bavail) = 1024;
              *(_DWORD *)((char *)&buf.f_bavail + 2) = v41;
              HIWORD(buf.f_bavail) = 1024;
              LODWORD(buf.f_files) = v42;
              WORD2(buf.f_files) = 1024;
              *(_DWORD *)((char *)&buf.f_files + 6) = i;
              WORD1(buf.f_ffree) = 1024;
              HIDWORD(buf.f_ffree) = v43;
              LOWORD(buf.f_fsid.val[0]) = 1024;
              *(int32_t *)((char *)buf.f_fsid.val + 2) = v44;
              HIWORD(buf.f_fsid.val[1]) = 1024;
              buf.f_owner = v23;
              double v35 = v38;
              int v36 = "client drain: event %p (mask 0x%x) did not have my bit (%d) set! (0x%x 0x%x) (i %d rd %d wr %d, num_pending %d)";
              uint32_t v37 = 60;
              goto LABEL_53;
            }
          }
        }

        else
        {
          unsigned int v32 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            int v33 = *(_DWORD *)(a1 + 240) + i;
            int v34 = *(_DWORD *)(a1 + 224);
            buf.f_bsize = 67109120;
            buf.f_iosize = v33 % v34;
            double v35 = v32;
            int v36 = "client drain: *** encountered a NULL entry at idx %d";
            uint32_t v37 = 8;
LABEL_53:
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&buf, v37);
          }
        }
      }
    }

    sub_100007038(a1);
    sub_100007538(a1);
    pthread_mutex_unlock(&stru_100020140);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    if ((v144 & 0x20) == 0) {
      sub_100004050(*(void *)(a1 + 216));
    }
    free(*(void **)(a1 + 200));
    if (*(int *)(a1 + 128) >= 1)
    {
      uint64_t v45 = 0LL;
      do
      {
        free(*(void **)(*(void *)(a1 + 136) + 8 * v45));
        *(void *)(*(void *)(a1 + 136) + 8 * v45++) = 0LL;
      }

      while (v45 < *(int *)(a1 + 128));
    }

    free(*(void **)(a1 + 136));
    *(void *)(a1 + 136) = 0LL;
    for (uint64_t j = 352LL; j != 416; j += 8LL)
    {
      free(*(void **)(a1 + j));
      *(void *)(a1 + j) = 0LL;
    }

    uint64_t v47 = *(void **)(a1 + 120);
    if (v47) {
      free(v47);
    }
    uint64_t v48 = *(void **)(a1 + 344);
    if (v48) {
      free(v48);
    }
    if ((*(_DWORD *)(a1 + 188) & 0x1000) != 0)
    {
      pthread_mutex_lock(&stru_100020008);
      uint64_t v49 = 0LL;
      while (dword_100021858[v49] != *(_DWORD *)(a1 + 248))
      {
        if (++v49 == 32) {
          goto LABEL_240;
        }
      }

      dword_100021858[v49] = 0;
LABEL_240:
      pthread_mutex_unlock(&stru_100020008);
    }

    pthread_mutex_unlock((pthread_mutex_t *)a1);
    pthread_cond_destroy((pthread_cond_t *)(a1 + 64));
    free((void *)a1);
    if ((v144 & 0x20) != 0)
    {
      do
        v132 = __ldxr((unsigned int *)&dword_100020724);
      while (__stxr(v132 - 1, (unsigned int *)&dword_100020724));
    }
  }

  do
    v133 = __ldxr((unsigned int *)&dword_100020720);
  while (__stxr(v133 - 1, (unsigned int *)&dword_100020720));
  return 0LL;
}

    if ((unint64_t)(v1 - *(void *)(v5 + 312)) >= 0x141DD76001LL)
    {
      uint64_t v25 = 0u;
      unint64_t v26 = 0u;
      uid_t v23 = 0u;
      uint64_t v24 = 0u;
      buffer = 0u;
      int v22 = 0u;
      if ((*(_DWORD *)(v5 + 188) & 0x20) != 0 && proc_pidinfo(*(_DWORD *)(v5 + 248), 4, 0LL, &buffer, 96) != 96)
      {
        uint64_t v10 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(_DWORD *)(v5 + 248);
          *(_DWORD *)statfs buf = 67109120;
          char v28 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to gather process task information for pid: %i",  buf,  8u);
        }
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000LL;
      v14[2] = sub_1000131C8;
      v14[3] = &unk_10001C7E0;
      _BYTE v14[4] = v5;
      BOOL v17 = v23;
      unsigned int v18 = v24;
      unsigned int v19 = v25;
      unsigned int v20 = v26;
      int v15 = buffer;
      uint64_t v16 = v22;
      analytics_send_event_lazy("com.apple.massStorage.FUNInfo.fsevents_1", v14);
      *(void *)(v5 + 312) = v1;
    }

uint64_t sub_10000DF9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  int v3 = (pthread_rwlock_t *)(v2 + 2304);
  v5[0] = a1;
  v5[1] = v2;
  ptr = malloc_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL);
  uint64_t v7 = 0x40000LL;
  int v8 = 12;
  sub_1000089F4(0LL, v3, (unsigned int (*)(uint64_t, uint64_t))sub_10000BC84, (uint64_t)v5);
  sub_10000BD8C((gzFile)a1, *(void *)(a1 + 128), (uint64_t)v5, 1);
  malloc_zone_free((malloc_zone_t *)qword_1000206B8, ptr);
  return sub_100008BA4((uint64_t)v3);
}

void sub_10000E034(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 128);
  if (*(int *)(a1 + 36) < 1)
  {
    if (v2)
    {
      sub_100008BA4((uint64_t)(v2 + 288));
      free(*(void **)(*(void *)(a1 + 128) + 2536LL));
      free(*(void **)(*(void *)(a1 + 128) + 2504LL));
      free(v2[5]);
      free(v2);
      *(void *)(a1 + 128) = 0LL;
    }
  }

  else
  {
    int v3 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100016974();
    }
  }

uint64_t sub_10000E0C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 128);
  if (v1)
  {
    if (dword_1000206C8 || v1 != qword_100020748)
    {
      if ((*(_DWORD *)(a1 + 32) & 1) != 0 || v1 != qword_100020748)
      {
        sub_10000DF9C(a1);
        snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v1 + 256));
        utimes(__str, 0LL);
        if ((*(_DWORD *)(a1 + 32) & 0x200) != 0)
        {
          sub_10000ABB0(v1, 1);
          snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v1 + 256));
          unlink(__str);
          if (rmdir((const char *)(v1 + 256)))
          {
            uid_t v5 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              sub_100016A10();
            }
          }
        }

        if (!dword_1000206C8) {
          *(_DWORD *)(a1 + 32) &= ~0x800u;
        }
      }

      else
      {
        unsigned int v4 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_1000169E4();
        }
      }
    }
  }

  return 0LL;
}

uint64_t sub_10000E228()
{
  *(void *)(qword_100020748 + 16) = 0LL;
  uint64_t result = sub_100004D78((uint64_t (*)(void))sub_10000E0C8);
  qword_100020748 = 0LL;
  return result;
}

uint64_t sub_10000E260(uint64_t a1, uint64_t a2)
{
  int v3 = (_DWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 32) & 0x50) != 0)
  {
    unsigned int v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100016B18();
    }
  }

  else if ((*v3 & 0x90) == 0 && (*v3 & 4) != 0)
  {
    int v6 = *(_DWORD *)(a2 + 112);
    if (!v6 || v6 == *(_DWORD *)a1)
    {
      uint64_t v7 = *(void *)(a1 + 128);
      if (v7 && *(void *)(v7 + 16))
      {
        int v8 = 0;
        unint64_t v9 = *(void *)(a2 + 232);
        int32_t v44 = (const char **)(a1 + 8);
        uint64_t v45 = (const char *)(v7 + 256);
LABEL_11:
        pthread_rwlock_rdlock((pthread_rwlock_t *)(v7 + 48));
        int v10 = *(_DWORD *)(v7 + 32);
        if (v10 >= 1)
        {
          int v11 = 0;
          int v12 = *(_DWORD *)(v7 + 32);
          while (1)
          {
            int v13 = v11 + v12;
            if (v11 + v12 >= 0) {
              int v14 = v11 + v12;
            }
            else {
              int v14 = v13 + 1;
            }
            LODWORD(v15) = v14 >> 1;
            unint64_t v16 = *(void *)(*(void *)(v7 + 40) + 8LL * (v14 >> 1));
            if (v16 <= v9)
            {
              if (v16 >= v9)
              {
                if ((v13 + 3) <= 1) {
LABEL_24:
                }
                  LODWORD(v15) = v11 - (v11 > 0);
                int v46 = *(unsigned __int16 *)(v7 + 250);
                int v47 = *(unsigned __int16 *)(v7 + 248);
                while (1)
                {
                  int v17 = v10;
                  pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 48));
                  int v43 = v17;
                  int v18 = v17 - 1;
                  unsigned int v42 = v17 - 1;
                  if ((int)v15 < v17 - 1)
                  {
                    unint64_t v19 = 0LL;
                    uint64_t v15 = (int)v15;
                    uint64_t v20 = v18;
                    while ((*(_DWORD *)(a2 + 188) & 0x1A) == 0)
                    {
                      if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0) {
                        return 0LL;
                      }
                      pthread_rwlock_rdlock((pthread_rwlock_t *)(v7 + 48));
                      if (v47 != *(unsigned __int16 *)(v7 + 248) || v46 != *(unsigned __int16 *)(v7 + 250))
                      {
                        pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 48));
                        *(_DWORD *)(a2 + 188) |= 1u;
                        if (v19) {
                          unint64_t v9 = v19;
                        }
                        goto LABEL_11;
                      }

                      snprintf(__str, 0x400uLL, "%s/%.16llx", v45, *(void *)(*(void *)(v7 + 40) + 8 * v15));
                      unint64_t v19 = *(void *)(*(void *)(v7 + 40) + 8 * v15 + 8);
                      pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 48));
                      if (sub_10000E864(a1, a2, __str, *(void *)(a2 + 232))
                        && (statfs(*v44, &v49) || v49.f_fsid.val[0] != *(_DWORD *)a1))
                      {
                        unint64_t v26 = (os_log_s *)sub_1000031E4();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                          sub_100016AB8();
                        }
                        return 0LL;
                      }

                      if (v20 == ++v15)
                      {
                        LODWORD(v15) = v42;
                        break;
                      }
                    }
                  }

                  sub_100007658(*(void *)(v7 + 16));
                  if (v8 <= 100) {
                    int v21 = 100;
                  }
                  else {
                    int v21 = v8;
                  }
                  int v22 = v21 + 1;
                  while (1)
                  {
                    usleep(0x3E8u);
                    if ((*v3 & 0x90) != 0) {
                      break;
                    }
                    if ((*v3 & 4) == 0) {
                      break;
                    }
                    uint64_t v23 = *(void *)(v7 + 16);
                    if (!v23 || *(_DWORD *)(v23 + 240) == *(_DWORD *)(v23 + 244)) {
                      break;
                    }
                    if (v22 == ++v8)
                    {
                      int v8 = v22;
                      break;
                    }
                  }

                  if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0) {
                    return 0LL;
                  }
                  pthread_rwlock_rdlock((pthread_rwlock_t *)(v7 + 48));
                  if (v43 > *(_DWORD *)(*(void *)(a1 + 128) + 32LL)
                    || v47 != *(unsigned __int16 *)(v7 + 248)
                    || v46 != *(unsigned __int16 *)(v7 + 250))
                  {
                    break;
                  }

                  int v10 = *(_DWORD *)(v7 + 32);
                  if (v43 >= v10)
                  {
                    if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0 || !*(void *)(v7 + 16))
                    {
                      pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 48));
                      return 0LL;
                    }

                    if (v43 >= 1)
                    {
                      uint64_t v35 = *(void *)(v7 + 40);
                      if (v35)
                      {
                        snprintf(__str, 0x400uLL, "%s/%.16llx", v45, *(void *)(v35 + 8LL * v42));
                        sub_10000E864(a1, a2, __str, *(void *)(a2 + 232));
                      }
                    }

                    goto LABEL_63;
                  }
                }

                *(_DWORD *)(a2 + 188) |= 1u;
LABEL_63:
                int v27 = (int8x8_t *)sub_10000EDA0(a1, v7, &v48);
                if ((*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*v3 & 4) != 0 && *(void *)(v7 + 16))
                {
                  pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 48));
                  unsigned int v28 = v48;
                  if (v48)
                  {
                    v27[1].i32[0] = v48;
                    uid_t v29 = *(_DWORD *)(a2 + 252);
                    if (v29)
                    {
                      pthread_setugid_np(v29, *(_DWORD *)(a2 + 256));
                      int v30 = *(const char **)(a2 + 344);
                      if (v30)
                      {
                        if (initgroups(v30, *(_DWORD *)(a2 + 256)) < 0)
                        {
                          int v31 = (os_log_s *)sub_1000031E4();
                          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v36 = *(void *)(a2 + 344);
                            int v37 = *(_DWORD *)(a2 + 252);
                            int v38 = *(_DWORD *)(a2 + 256);
                            int v39 = *__error();
                            int v40 = __error();
                            int v41 = strerror(*v40);
                            v49.f_bsize = 136316162;
                            *(void *)&v49.f_iosize = v36;
                            WORD2(v49.f_blocks) = 1024;
                            *(_DWORD *)((char *)&v49.f_blocks + 6) = v37;
                            WORD1(v49.f_bfree) = 1024;
                            HIDWORD(v49.f_bfree) = v38;
                            LOWORD(v49.f_bavail) = 1024;
                            *(_DWORD *)((char *)&v49.f_bavail + 2) = v39;
                            HIWORD(v49.f_bavail) = 2080;
                            v49.f_files = (uint64_t)v41;
                            _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "scan_for_old_events: initgroups failed for user %s uid %d gid %d (err: %d/%s)",  (uint8_t *)&v49,  0x28u);
                          }
                        }
                      }
                    }

                    if (sub_10000EEFC(a1, a2, v27, v28, 0, *(void *)(a2 + 232), &v49, 0LL, 0))
                    {
                      unsigned int v32 = (os_log_s *)sub_1000031E4();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                        sub_100016A8C();
                      }
                    }
                  }

                  if (*(_DWORD *)(a2 + 252)) {
                    pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
                  }
                }

                else
                {
                  pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 48));
                }

                free(v27);
                return 0LL;
              }

              int v11 = v15 + 1;
            }

            else
            {
              int v12 = v15;
            }

            if (v11 >= v12) {
              goto LABEL_24;
            }
          }
        }

        int v11 = 0;
        goto LABEL_24;
      }

      uint64_t v24 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(a1 + 8);
        if (v7) {
          uint64_t v34 = *(void *)(v7 + 16);
        }
        else {
          uint64_t v34 = 0LL;
        }
        v49.f_bsize = 136315650;
        *(void *)&v49.f_iosize = v33;
        WORD2(v49.f_blocks) = 2048;
        *(uint64_t *)((char *)&v49.f_blocks + 6) = v7;
        HIWORD(v49.f_bfree) = 2048;
        v49.f_bavail = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "scan_old: bailing out because device mounted @ %s has dls %p and dls->fci %p",  (uint8_t *)&v49,  0x20u);
      }
    }
  }

  return 0LL;
}

uint64_t sub_10000E864(uint64_t a1, uint64_t a2, const char *a3, unint64_t a4)
{
  if (qword_1000228D8 != -1) {
    dispatch_once(&qword_1000228D8, &stru_10001C7C0);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000228E0, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = open(a3, 0x20000000);
  int v9 = v8;
  if (v8 < 0 || fstat(v8, &v41) || (v41.st_mode & 0xF000) != 0x8000)
  {
    if (a1
      && (*(_DWORD *)(a1 + 32) & 0x1000) == 0
      && (uint64_t v20 = (os_log_s *)sub_1000031E4(), os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)))
    {
      int v23 = *__error();
      BOOL v24 = (v41.st_mode & 0xF000) == 0x8000;
      uid_t v25 = getuid();
      uid_t v26 = geteuid();
      gid_t v27 = getgid();
      gid_t v28 = getegid();
      *(_DWORD *)statfs buf = 136316930;
      int32_t v44 = a3;
      __int16 v45 = 1024;
      *(_DWORD *)int v46 = v9;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v23;
      *(_WORD *)int v47 = 1024;
      *(_DWORD *)&v47[2] = v24;
      __int16 v48 = 1024;
      *(_DWORD *)statfs v49 = v25;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v26;
      __int16 v50 = 1024;
      gid_t v51 = v27;
      __int16 v52 = 1024;
      gid_t v53 = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "read_disk_log: problems with history file: %s (fd %d, errno %d ; is_reg %d; uid %d/%d gid %d/%d)",
        buf,
        0x36u);
      if (v9 < 0) {
        goto LABEL_30;
      }
    }

    else if (v9 < 0)
    {
LABEL_30:
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
      return 22LL;
    }

    close(v9);
    goto LABEL_30;
  }

  if (!v41.st_size)
  {
    close(v9);
LABEL_32:
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return 0LL;
  }

  gzFile v10 = gzdopen(v9, "r");
  if (v10)
  {
    int v11 = v10;
    int v12 = (int8x8_t *)malloc_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL);
    if (v12)
    {
      int v13 = v12;
      file = v11;
      uid_t v14 = *(_DWORD *)(a2 + 252);
      if (v14)
      {
        pthread_setugid_np(v14, *(_DWORD *)(a2 + 256));
        uint64_t v15 = *(const char **)(a2 + 344);
        if (v15)
        {
          if (initgroups(v15, *(_DWORD *)(a2 + 256)) < 0)
          {
            unint64_t v16 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = *(const char **)(a2 + 344);
              int v37 = *(_DWORD *)(a2 + 252);
              int v40 = *(_DWORD *)(a2 + 256);
              int v34 = *__error();
              uint64_t v35 = __error();
              uint64_t v36 = strerror(*v35);
              *(_DWORD *)statfs buf = 136316162;
              int32_t v44 = v33;
              __int16 v45 = 1024;
              *(_DWORD *)int v46 = v37;
              *(_WORD *)&v46[4] = 1024;
              *(_DWORD *)&v46[6] = v40;
              *(_WORD *)int v47 = 1024;
              *(_DWORD *)&v47[2] = v34;
              __int16 v48 = 2080;
              *(void *)statfs v49 = v36;
              _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "read_disk_log: initgroups failed for user %s uid %d gid %d (err: %d/%s)",  buf,  0x28u);
            }
          }
        }
      }

      if ((*(_DWORD *)(a1 + 32) & 0x80) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
      {
        int v17 = 0;
        uint64_t v39 = 0LL;
        signed int v29 = 0;
        int v18 = 0;
        do
        {
          if ((*(_DWORD *)(a2 + 188) & 2) != 0) {
            break;
          }
          unsigned int v30 = 0x40000 - v29 >= 0x10000 ? 0x10000 : 0x40000 - v29;
          int v31 = gzread(file, (char *)v13 + v29, v30);
          int v18 = v31;
          if (v31 < 1) {
            break;
          }
          *(_DWORD *)statfs buf = 0;
          v39 += v31;
          if (!v29 && v31 <= 0xB)
          {
            unsigned int v32 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100016BF0();
            }
            int v17 = 0;
            break;
          }

          v29 += v31;
          if (v42 && *(_DWORD *)buf == 2)
          {
            signed int v29 = 0x40000 - v42;
            __memmove_chk(v13, &v13->i8[v42], 0x40000 - v42, 0x40000LL);
          }

          else if (v42)
          {
            signed int v29 = 0;
          }
        }

        while ((*(_DWORD *)(a1 + 32) & 0x80) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0);
      }

      else
      {
        int v17 = 0;
        uint64_t v39 = 0LL;
        int v18 = 0;
      }

      gzclose(file);
      malloc_zone_free((malloc_zone_t *)qword_1000206B8, v13);
      if (!v17
        && (*(_DWORD *)(a1 + 32) & 0x80) == 0
        && (*(_DWORD *)(a1 + 32) & 4) != 0
        && (*(_DWORD *)(a2 + 188) & 2) == 0)
      {
        unint64_t v19 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 136315650;
          int32_t v44 = a3;
          __int16 v45 = 2048;
          *(void *)int v46 = v39;
          *(_WORD *)&v46[8] = 1024;
          *(_DWORD *)int v47 = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "read_disk_log: error processing log file %s (total_read %lld, size %d)",  buf,  0x1Cu);
        }
      }

      if (*(_DWORD *)(a2 + 252)) {
        pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
      }
      goto LABEL_32;
    }

    gzclose(v11);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return 12LL;
  }

  else
  {
    int v22 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100016B90();
    }
    close(v9);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return *__error();
  }

_DWORD *sub_10000EDA0(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v4 = *(_DWORD *)(a2 + 2524);
  if (!v4)
  {
LABEL_8:
    gzFile v10 = 0LL;
    goto LABEL_9;
  }

  uint64_t v6 = *(void *)(a2 + 2528) + 24LL * v4;
  uint64_t v7 = v6 + 4096;
  if (v6 + 4096 < 0)
  {
    int v11 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a2 + 2528);
      int v14 = *(_DWORD *)(a2 + 2524);
      *(_DWORD *)uint64_t v15 = 134218496;
      *(void *)&v15[4] = v7;
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = v13;
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "in mem disk log size is bad: 0x%zx (string size: %zu num items %d)\n",  v15,  0x1Cu);
    }

    unsigned int v4 = 0;
    goto LABEL_8;
  }

  int v9 = malloc(v6 + 4096);
  gzFile v10 = v9;
  if (v9)
  {
    *(void *)uint64_t v15 = 0LL;
    *(void *)&v15[8] = a2;
    *(void *)&unsigned __int8 v15[16] = v9;
    uint64_t v16 = v7;
    int v17 = 12;
    *(void *)int v9 = 1145852723LL;
    v9[2] = 12;
    sub_1000089F4( a1,  (pthread_rwlock_t *)(a2 + 2304),  (unsigned int (*)(uint64_t, uint64_t))sub_100008918,  (uint64_t)v15);
    unsigned int v4 = v17;
    v10[2] = v17;
  }

  else
  {
    unsigned int v4 = 0;
  }

LABEL_9:
  *a3 = v4;
  return v10;
}

      if (dword_1000206CC)
      {
        pthread_mutex_unlock(&stru_1000201C0);
        if (dword_1000206CC)
        {
          int v18 = -dword_1000206CC;
          sub_100004CEC((void (*)(void))sub_1000097D0);
          do
          {
            unsigned int v4 = 0LL;
            unint64_t v19 = __ldxr((unsigned int *)&dword_1000206CC);
            uint64_t v2 = 1;
          }

          while (__stxr(v19 + v18, (unsigned int *)&dword_1000206CC));
        }

        else
        {
          unsigned int v4 = 0LL;
        }

        goto LABEL_19;
      }

      gettimeofday(&v24, 0LL);
      uint64_t v6 = 1000 * v3 + 1000LL * v24.tv_usec;
      v25.__darwin_time_t tv_sec = v6 / 0x3B9ACA00 + v24.tv_sec;
      v25.tv_nsec = v6 % 0x3B9ACA00;
      uint64_t v7 = pthread_cond_timedwait(&stru_100020200, &stru_1000201C0, &v25);
      if (!v7)
      {
LABEL_15:
        if (!dword_1000206CC && dword_1000206C8)
        {
          pthread_mutex_unlock(&stru_1000201C0);
          return sub_1000082B8();
        }

        goto LABEL_5;
      }

      if (v7 != 60)
      {
        if (dword_1000206C8) {
          goto LABEL_15;
        }
        goto LABEL_5;
      }

      pthread_mutex_unlock(&stru_1000201C0);
      gettimeofday(&v23, 0LL);
      int v3 = sub_100012F28((uint64_t)&v23);
      sub_100006A9C(&qword_100021830);
    }
  }

  return sub_1000082B8();
}

uint64_t sub_10000EEFC( uint64_t a1, uint64_t a2, int8x8_t *a3, unsigned int a4, int a5, unint64_t a6, _DWORD *a7, int *a8, char a9)
{
  unsigned int v167 = 0;
  unint64_t v166 = 0LL;
  uint64_t v165 = 0LL;
  unsigned int v164 = 0;
  int v16 = a3->i32[0];
  char v17 = 1;
  if (a3->i32[0] > 1145852721)
  {
    if (v16 == 1145852722) {
      goto LABEL_9;
    }
    int v18 = 1145852723;
  }

  else
  {
    if (v16 == 844319812) {
      goto LABEL_9;
    }
    int v18 = 861097028;
  }

  if (v16 == v18) {
    char v17 = 3;
  }
  else {
    char v17 = 0;
  }
LABEL_9:
  __endptr = 0LL;
  bzero(&v161, 0x588uLL);
  uint64_t v160 = a2;
  *a7 = 0;
  if (a8) {
    *a8 = 0;
  }
  __int32 v19 = a3->i32[0];
  uint64_t v156 = a2;
  if (a3->i32[0] > 1145852720)
  {
    if ((v19 - 1145852721) < 3)
    {
      int v20 = a3[1].i32[0];
      goto LABEL_18;
    }
  }

  else if (v19 == 827542596 || v19 == 844319812 || v19 == 861097028)
  {
    int v20 = bswap32(a3[1].u32[0]);
    goto LABEL_18;
  }

  int v20 = a3[1].i32[0];
  if (v20 > 0x40000)
  {
    uint64_t v99 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
      sub_100016F5C();
    }
    return 22LL;
  }

LABEL_18:
  if (a5)
  {
    uint64_t v21 = 22LL;
    __int32 v22 = a3->i32[1];
    a3->i32[1] = 0;
    unsigned int v23 = sub_1000067B8(a3, v20);
    if (v19 == 827542596 || v19 == 861097028 || v19 == 844319812) {
      unsigned int v23 = bswap32(v23);
    }
    if (v22 == v23)
    {
      if (a8)
      {
        int v24 = 2;
LABEL_31:
        *a8 = v24;
      }
    }

    else
    {
      if (v22 != sub_100012480(a3, v20))
      {
        uint64_t v100 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          sub_100016EFC();
        }
        return v21;
      }

      if (a8)
      {
        int v24 = 1;
        goto LABEL_31;
      }
    }
  }

  __int32 v25 = a3->i32[0];
  if (a3->i32[0] == 827542596 || v25 == 861097028 || v25 == 844319812) {
    sub_1000124EC(a3, (int)a4, v17);
  }
  uid_t v26 = (unsigned int *)(v156 + 128);
  gid_t v27 = malloc(16LL * *(int *)(v156 + 128));
  if (!v27)
  {
    int v92 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      sub_100016C64((uint64_t)v26, v92, v93, v94, v95, v96, v97, v98);
    }
    return 12LL;
  }

  unint64_t v152 = a6;
  v153 = a7;
  gid_t v28 = v27;
  __strlcpy_chk(v169, *(void *)(a1 + 16), 1024LL, 1024LL);
  uint64_t v29 = *(void *)(a1 + 16);
  size_t v30 = strlen((const char *)v29);
  size_t v31 = v30;
  size_t v154 = v30;
  if (*(_BYTE *)v29 == 47)
  {
    size_t v154 = v30;
    if (*(_BYTE *)(v29 + 1))
    {
      *(_WORD *)&v169[v30] = 47;
      size_t v154 = v30 + 1;
    }
  }

  v150 = (unsigned int *)(v156 + 128);
  uint64_t v32 = *v26;
  if ((int)v32 >= 1)
  {
    uint64_t v33 = *(const char ***)(v156 + 136);
    int v34 = *(_DWORD *)(v156 + 112);
    uint64_t v35 = v28 + 1;
    do
    {
      uint64_t v36 = *v33;
      size_t v37 = strlen(*v33);
      *(v35 - 1) = v37;
      if (v34) {
        goto LABEL_43;
      }
      size_t v38 = v37;
      if (!strncmp((const char *)v29, v36, v31) && v38 >= v31)
      {
        if (v31 == 1)
        {
          int v40 = *((unsigned __int8 *)v36 + 1);
LABEL_60:
          if (v40 == 47) {
            uint64_t v42 = (uint64_t)&v36[v31 + 1];
          }
          else {
            uint64_t v42 = (uint64_t)&v36[v31];
          }
          void *v35 = v42;
          *(v35 - 1) = &v36[v38 - v42];
          goto LABEL_44;
        }

        int v40 = v36[v31];
        if (v40 == 47 || v40 == 0) {
          goto LABEL_60;
        }
      }

      if (*v36 != 47 || v36[1])
      {
LABEL_43:
        void *v35 = v36;
      }

      else
      {
        *(v35 - 1) = 0LL;
        void *v35 = &unk_10001880E;
      }

LABEL_44:
      v35 += 2;
      ++v33;
      --v32;
    }

    while (v32);
  }

  int v43 = (char *)&a3[1] + 4;
  size_t __size = 1024 - v154;
  uint64_t v44 = v156;
  v148 = (_OWORD *)(v156 + 260);
  unsigned int v147 = SANDBOX_CHECK_NOFOLLOW | SANDBOX_CHECK_NO_REPORT | 1;
  uint64_t v151 = v156 + 352;
  __int16 v45 = v153;
  int v46 = (int *)a1;
LABEL_65:
  uint64_t v47 = a3[1].i32[0];
  unint64_t v48 = (unint64_t)a3 + v47;
  while (1)
  {
    statfs v49 = v43;
    uint64_t v50 = 0LL;
    __s2 = v43;
    gid_t v51 = (char *)a3 + v47;
    while (v43[v50])
    {
      if (v48 - (void)v43 == ++v50) {
        goto LABEL_72;
      }
    }

    gid_t v51 = &v43[v50];
LABEL_72:
    unint64_t v52 = v51 - v43 + 1;
    size_t v170 = v52;
    if (v52 >= 0x401)
    {
      uint64_t v101 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        sub_100016CCC(v101, v102, v103, v104, v105, v106, v107, v108);
      }
LABEL_183:
      uint64_t v21 = 0LL;
      goto LABEL_197;
    }

    gid_t v53 = &v43[v52];
    if (a9 && ((v46[8] & 0xD0) != 0 || (v46[8] & 4) == 0)) {
      goto LABEL_183;
    }
    if ((unint64_t)(v53 + 8) > v48)
    {
      int v111 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
        sub_100016D3C(v111, v112, v113, v114, v115, v116, v117, v118);
      }
      goto LABEL_196;
    }

    int v43 = v53 + 12;
    unint64_t v54 = *(void *)v53;
    unint64_t v166 = *(void *)v53;
    if ((unint64_t)(v53 + 12) > v48)
    {
      uint64_t v119 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
        sub_100016DAC(v119, v120, v121, v122, v123, v124, v125, v126);
      }
      goto LABEL_196;
    }

    unsigned int v167 = *((_DWORD *)v53 + 2);
    __int32 v55 = a3->i32[0];
    if (a3->i32[0] == 1145852722 || v55 == 844319812)
    {
      if ((unint64_t)(v53 + 20) > v48)
      {
        v127 = (os_log_s *)sub_1000031E4();
        if (!os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
          goto LABEL_196;
        }
        goto LABEL_191;
      }

      uint64_t v165 = *(void *)v43;
      int v43 = v53 + 20;
    }

    if (v55 == 1145852723 || v55 == 861097028)
    {
      unsigned int v56 = (unsigned int *)(v43 + 8);
      if ((unint64_t)(v43 + 8) > v48)
      {
        v127 = (os_log_s *)sub_1000031E4();
        if (!os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
          goto LABEL_196;
        }
LABEL_191:
        sub_100016E1C(v127, v128, v129, v130, v131, v132, v133, v134);
        goto LABEL_196;
      }

      uint64_t v57 = *(void *)v43;
      v43 += 12;
      uint64_t v165 = v57;
      if ((unint64_t)v43 > v48)
      {
        v135 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
          sub_100016E8C(v135, v136, v137, v138, v139, v140, v141, v142);
        }
        goto LABEL_196;
      }

      unsigned int v164 = *v56;
    }

    if (v54 > v152 || (*(_DWORD *)(v44 + 188) & 0x4000) != 0)
    {
      int v144 = strncmp(v49, ".docid/", 7uLL);
      if (v144)
      {
        if (strncmp(v49, ".activity/1/", 0xCuLL))
        {
          strlcpy(&v169[v154], v49, __size);
          uint64_t v145 = 0LL;
          size_t v58 = v169;
LABEL_106:
          __big = v58;
          uint64_t v66 = *v150;
          if ((int)v66 >= 1)
          {
            size_t v67 = v170 - 1;
            uint64_t v68 = __s2;
            uint64_t v69 = (const char **)(v28 + 1);
            while (1)
            {
              size_t v70 = (size_t)*(v69 - 1);
              if (v70 <= v67)
              {
                uint64_t v71 = *v69;
                if (v70 >= 2 && v71[v70 - 1] == 47) {
                  --v70;
                }
                if (!strncmp(v71, v68, v70) && (v70 < 2 || !v68[v70] || v68[v70] == 47)) {
                  break;
                }
              }

              v69 += 2;
              if (!--v66)
              {
LABEL_117:
                __int16 v45 = v153;
                int v46 = (int *)a1;
                uint64_t v44 = v156;
                goto LABEL_65;
              }
            }

            int v46 = (int *)a1;
            uint64_t v44 = v156;
            __int16 v45 = v153;
            if (!*(_DWORD *)(v156 + 112) || *v68 != 47)
            {
              if (*(_DWORD *)(v156 + 252))
              {
                unint64_t v72 = __big;
                if (HIDWORD(v145)) {
                  unint64_t v72 = *(const char **)(a1 + 16);
                }
                __int128 v73 = *(_OWORD *)(v156 + 276);
                *(_OWORD *)&v159.st_dev = *v148;
                *(_OWORD *)&v159.st_uid = v73;
                int v74 = sandbox_check_by_audit_token(&v159, "file-read-metadata", v147);
                if (lstat(v72, &v168) | v74)
                {
                  if (*__error() != 2)
                  {
LABEL_171:
                    uint64_t v44 = v156;
                    goto LABEL_65;
                  }

                  unsigned int v75 = sub_100012A94(v72);
                  int v76 = access(v75, 4);
                  __int128 v77 = *(_OWORD *)(v156 + 276);
                  __int128 v157 = *v148;
                  __int128 v158 = v77;
                  int v78 = sandbox_check_by_audit_token(&v157, "file-read-metadata", v147);
                  free(v75);
                  if (v76)
                  {
                    uint64_t v79 = *v150;
                    uint64_t v80 = 0LL;
                    uint64_t v81 = *(void *)(v156 + 136);
                    uint64_t v82 = 8 * v79;
                    while (!strstr(__big, *(const char **)(v81 + v80)))
                    {
                      v80 += 8LL;
                      if (v82 == v80) {
                        goto LABEL_170;
                      }
                    }

                    uint64_t v89 = *(const char **)(v81 + v80);
                    if (!*(_DWORD *)(v156 + 112) || *v89)
                    {
                      if (!lstat(v89, &v159) && v159.st_uid == *(_DWORD *)(v156 + 252))
                      {
                        __int128 v90 = *(_OWORD *)(v156 + 276);
                        __int128 v157 = *v148;
                        __int128 v158 = v90;
                        goto LABEL_169;
                      }

                      goto LABEL_170;
                    }

                    if (lstat(".", &v159) || v159.st_uid != *(_DWORD *)(v156 + 252)) {
                      goto LABEL_170;
                    }
                    __int128 v91 = *(_OWORD *)(v156 + 276);
                    __int128 v157 = *v148;
                    __int128 v158 = v91;
LABEL_169:
                    if (sandbox_check_by_audit_token(&v157, "file-read-metadata", v147))
                    {
LABEL_170:
                      int v46 = (int *)a1;
                      goto LABEL_171;
                    }
                  }

                  else if (v78)
                  {
                    goto LABEL_170;
                  }
                }

                uint64_t v68 = __s2;
              }

              uint64_t v83 = 0LL;
              int v84 = 0;
              do
              {
                int v85 = *(const char **)(v151 + v83);
                if (!v85) {
                  break;
                }
                size_t v86 = strlen(*(const char **)(v151 + v83));
                if (*(_DWORD *)(v156 + 112))
                {
                  if (!strncmp(v68, v85, v86)) {
                    int v84 = 1;
                  }
                }

                else if (!strncmp(__big, v85, v86))
                {
                  goto LABEL_117;
                }

                v83 += 8LL;
                __int16 v45 = v153;
              }

              while (v83 != 64);
              int v46 = (int *)a1;
              uint64_t v44 = v156;
              if (!v84 && (v166 > v152 || (*(_DWORD *)(v156 + 188) & 0x4000) != 0))
              {
                if (!*(void *)(v156 + 208) || (*(_DWORD *)(v156 + 188) & 2) != 0) {
                  goto LABEL_183;
                }
                if (v166 > *(void *)(v156 + 168) || (*(_DWORD *)(v156 + 188) & 0x4000) != 0) {
                  *(void *)(v156 + 168) = v166;
                }
                if (!*(_DWORD *)(v156 + 112) && *v68 != 47)
                {
                  uint64_t v87 = v154;
                  if (HIDWORD(v145)) {
                    uint64_t v87 = 1LL;
                  }
                  v170 += v87;
                  uint64_t v68 = __big;
                  __s2 = __big;
                }

                if (((v145 | ((*(_DWORD *)(v156 + 188) & 0x100u) >> 8)) & 1) == 0 && v144)
                {
                  uint64_t v88 = strrchr(v68, 47);
                  if (v88 > v68)
                  {
                    v88[1] = 0;
                    size_t v170 = strlen(v68) + 1;
                  }

                  v167 &= 0xFE23F800;
                }

                uint64_t v21 = sub_100012BC4( (unsigned int *)&v160,  &v170,  (const char **)&__s2,  &v167,  (unsigned int *)a1,  &v166,  &v165,  &v164);
                if ((_DWORD)v21 && (_DWORD)v21 != 268435460) {
                  goto LABEL_197;
                }
              }
            }
          }

          goto LABEL_65;
        }

        int v62 = strtoull(v49 + 12, &__endptr, 10);
        int v60 = *v46;
        LODWORD(v145) = 1;
        int v63 = &v169[v154];
        if (*v46 != v62)
        {
          uint64_t v64 = ".activity/1/%lld";
          goto LABEL_102;
        }

LABEL_101:
        strlcpy(v63, v49, __size);
      }

      else
      {
        int v59 = strtoull(v49 + 7, &__endptr, 10);
        if (!strncmp(v49, ".activity/1/", 0xCuLL))
        {
          int v65 = strtoull(v49 + 12, &__endptr, 10);
          int v60 = *v46;
          LODWORD(v145) = 1;
          BOOL v61 = *v46 == v65;
        }

        else
        {
          LODWORD(v145) = 0;
          int v60 = *v46;
          BOOL v61 = *v46 == v59;
        }

        int v63 = &v169[v154];
        if (v61)
        {
          uint64_t v44 = v156;
          goto LABEL_101;
        }

        uint64_t v64 = ".docid/%lld";
        uint64_t v44 = v156;
LABEL_102:
        snprintf(v63, __size, v64, v60);
        if (__endptr) {
          strlcat(v63, __endptr, __size);
        }
        __s2 = v63;
        size_t v170 = strlen(v63) + 1;
      }

      HIDWORD(v145) = 1;
      size_t v58 = &v169[v154 - 1];
      goto LABEL_106;
    }
  }

  int v109 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
  {
    __int32 v110 = a3[1].i32[0];
    v168.st_dev = 134218240;
    *(void *)&v168.st_mode = v53 - (char *)a3;
    WORD2(v168.st_ino) = 1024;
    *(_DWORD *)((char *)&v168.st_ino + 6) = v110;
    _os_log_error_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_ERROR,  "process_disk_event_buf: ptr out-of-bounds (%ld > max %d)",  (uint8_t *)&v168,  0x12u);
  }

LABEL_196:
  uint64_t v21 = 22LL;
LABEL_197:
  sub_100012D70((uint64_t)&v160);
  *__int16 v45 = a3[1].i32[0];
  free(v28);
  return v21;
}

uint64_t sub_10000FC28(uint64_t a1)
{
  uint64_t v18 = 0LL;
  int v17 = 0;
  if (*(void *)(a1 + 232) == -1LL) {
    return 0LL;
  }
  int v2 = dword_100020740;
  if (dword_100020740)
  {
LABEL_3:
    uint64_t v3 = sub_100004D78((uint64_t (*)(void))sub_10000E260);
  }

  else
  {
    while (v2 != 10)
    {
      unsigned int v4 = v2;
      if ((*(_DWORD *)(a1 + 188) & 0x1A) == 0)
      {
        usleep(0x3D090u);
        int v2 = v4 + 1;
        if (!dword_100020740) {
          continue;
        }
      }

      if (v4 < 9) {
        goto LABEL_3;
      }
      break;
    }

    uid_t v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000170C0();
    }
    uint64_t v3 = 0LL;
  }

  if (*(void *)(a1 + 208) && (*(_DWORD *)(a1 + 188) & 2) == 0)
  {
    if (**(void **)(a1 + 136))
    {
      if ((*(_DWORD *)(a1 + 188) & 1) != 0 && (*(_DWORD *)(a1 + 188) & 0x4000) == 0) {
        uint64_t v3 = sub_10000FE5C(a1);
      }
      if (!(_DWORD)v3)
      {
        __strlcpy_chk(__s, **(void **)(a1 + 136), 1024LL, 1024LL);
        size_t v22 = strlen(__s) + 1;
        int v20 = __s;
        int v19 = 0x8000000;
        if (!*(void *)(a1 + 168)) {
          *(void *)(a1 + 168) = *(void *)(a1 + 232);
        }
        uint64_t v6 = (*(uint64_t (**)(void, uint64_t, size_t *, char **, int *, void, uint64_t, uint64_t *, int *))(a1 + 208))( *(void *)(a1 + 216),  1LL,  &v22,  &v20,  &v19,  0LL,  a1 + 168,  &v18,  &v17);
        uint64_t v3 = v6;
        if ((_DWORD)v6)
        {
          if ((_DWORD)v6 == 268435459) {
            *(_DWORD *)(a1 + 188) |= 2u;
          }
          uint64_t v7 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_10001704C(a1, v3, v7);
          }
          *(_DWORD *)(a1 + 188) |= 0x200u;
        }
      }
    }

    else
    {
      int v8 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100016FDC(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  return v3;
}

uint64_t sub_10000FE5C(uint64_t a1)
{
  uint64_t v11 = **(const char ***)(a1 + 136);
  uint64_t v8 = strlen(v11) + 1;
  uint64_t v9 = 0LL;
  int v6 = 0x40000000;
  int v7 = 0;
  unint64_t v2 = *(void *)(a1 + 152);
  unint64_t v10 = v2;
  if (v2 > *(void *)(a1 + 160)) {
    *(void *)(a1 + 160) = v2;
  }
  int v5 = 0;
  uint64_t v3 = *(uint64_t (**)(void, uint64_t, uint64_t *, const char **, int *, int *, unint64_t *, uint64_t *, int *))(a1 + 208);
  if (!v3) {
    return 0LL;
  }
  uint64_t result = v3(*(void *)(a1 + 216), 1LL, &v8, &v11, &v6, &v5, &v10, &v9, &v7);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 268435459)
    {
      *(_DWORD *)(a1 + 188) |= 2u;
      return 268435459LL;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 188) &= ~1u;
    *(void *)(a1 + 152) = 0LL;
  }

  return result;
}

uint64_t sub_10000FF60()
{
  if (dword_1000206C8) {
    return 0LL;
  }
  if (dword_100020750) {
    return 1LL;
  }
  pthread_mutex_lock(&stru_100020090);
  if (dword_100020750)
  {
    pthread_mutex_unlock(&stru_100020090);
    return 1LL;
  }

  clock_gettime(_CLOCK_REALTIME, &v13);
  v13.tv_sec += 10LL;
  while (!dword_1000206C8)
  {
    int v2 = pthread_cond_timedwait(&stru_1000200D0, &stru_100020090, &v13);
    if (dword_100020750)
    {
      BOOL v0 = dword_1000206C8 == 0;
      goto LABEL_19;
    }

    int v3 = v2;
    if (v2)
    {
      if (v2 == 60)
      {
        unsigned int v4 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100017164(v4, v5, v6, v7, v8, v9, v10, v11);
        }
      }

      else
      {
        uint64_t v12 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000170EC(v3);
        }
      }

      break;
    }
  }

  BOOL v0 = 0LL;
LABEL_19:
  pthread_mutex_unlock(&stru_100020090);
  return v0;
}

uint64_t sub_100010098(int a1, char *a2)
{
  uint64_t result = sub_10000FF60();
  if ((_DWORD)result)
  {
    sub_100004940((uint64_t)&unk_100021758);
    uint64_t v5 = sub_100004F34(a1);
    if (v5)
    {
      if ((*(_DWORD *)(v5 + 32) & 0x40) != 0)
      {
        strcpy(a2, "NO-UUID-VOLUME-IS-IGNORED");
      }

      else if (*(_DWORD *)v5 == a1)
      {
        uint64_t v6 = (const char *)(v5 + 64);
        size_t v7 = strlen((const char *)(v5 + 64));
        strncpy(a2, v6, v7);
      }

      else
      {
        strcpy(a2, "NO-UUID-UNKNOWN-DEVICE");
      }
    }

    else
    {
      strcpy(a2, "NO-UUID-NO-DEV-INFO");
    }

    return sub_1000048C0((uint64_t)&unk_100021758);
  }

  else
  {
    strcpy(a2, "NO-UUID-NO-DEV-INFO");
  }

  return result;
}

uint64_t sub_100010190(void *a1)
{
  uint64_t result = sub_10000FF60();
  if ((_DWORD)result) {
    *a1 = qword_1000206D0[dword_1000206E0];
  }
  return result;
}

uint64_t sub_1000101CC(int a1, unint64_t a2, uint64_t *a3)
{
  uint64_t result = sub_10000FF60();
  if ((_DWORD)result)
  {
    sub_100004940((uint64_t)&unk_100021758);
    *a3 = 0LL;
    uint64_t v7 = sub_100004F34(a1);
    if (v7)
    {
      uint64_t v8 = v7;
      if ((*(_DWORD *)(v7 + 32) & 0x40) == 0)
      {
        uint64_t v9 = *(void *)(v7 + 128);
        if (v9)
        {
          uint64_t v10 = *(unsigned int *)(v9 + 32);
          if ((int)v10 >= 1)
          {
            while (1)
            {
              uint64_t v11 = v10 - 1;
              snprintf( __str,  0x400uLL,  "%s/%.16llx",  (const char *)(*(void *)(v8 + 128) + 256LL),  *(void *)(*(void *)(*(void *)(v8 + 128) + 40LL) + 8LL * (v10 - 1)));
              if (!lstat(__str, &v18)
                && (v18.st_mode & 0xF000) == 0x8000
                && v18.st_ctimespec.tv_sec <= a2
                && v18.st_size > 0)
              {
                break;
              }

              --v10;
            }

            if ((v10 & 0xFFFFFFFE) == 0)
            {
LABEL_11:
              uint64_t v12 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                sub_1000171D4();
              }
              *a3 = 0LL;
              return sub_1000048C0((uint64_t)&unk_100021758);
            }

            int v13 = sub_10000B1FC( *(void *)(v8 + 128),  *(void *)(*(void *)(*(void *)(v8 + 128) + 40LL) + 8LL * (v10 - 1)),  a3);
            if (v13)
            {
              int v14 = v13;
              *a3 = *(void *)(*(void *)(*(void *)(v8 + 128) + 40LL) + 8LL * (v10 - 2));
              uint64_t v15 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                uint64_t v16 = *(void *)(*(void *)(*(void *)(v8 + 128) + 40LL) + 8LL * (v10 - 1));
                uint64_t v17 = *a3;
                *(_DWORD *)statfs buf = 67109888;
                int v20 = v10 - 1;
                __int16 v21 = 2048;
                uint64_t v22 = v17;
                __int16 v23 = 1024;
                int v24 = v14;
                __int16 v25 = 2048;
                uint64_t v26 = v16;
                _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "failed to get last id from log file %d so using last id == 0x%llx (ret %d; %.16llx)\n",
                  buf,
                  0x22u);
              }
            }
          }
        }
      }
    }

    return sub_1000048C0((uint64_t)&unk_100021758);
  }

  return result;
}

uint64_t sub_1000103E8(int a1, unint64_t a2)
{
  uint64_t v4 = sub_100004F34(a1);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  if ((*(_DWORD *)(v4 + 32) & 0x40) != 0 || (uint64_t v6 = *(void *)(v4 + 128)) == 0 || !*(_DWORD *)(v6 + 32))
  {
    sub_1000048C0((uint64_t)&unk_100021758);
    return 0xFFFFFFFFLL;
  }

  pthread_rwlock_wrlock((pthread_rwlock_t *)(v6 + 48));
  uint64_t v7 = *(void *)(v5 + 128);
  if (*(int *)(v7 + 32) < 1)
  {
    int v9 = 0;
  }

  else
  {
    uint64_t v8 = 0LL;
    int v9 = 0;
    do
    {
      unint64_t v10 = *(void *)(*(void *)(v7 + 40) + 8 * v8);
      if (a2 != -1LL && v10 >= a2) {
        break;
      }
      snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(v7 + 256), v10);
      if (!lstat(__str, &v20) && (v20.st_mode & 0xF000) == 0x8000)
      {
        uint64_t v11 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 136315138;
          __int16 v23 = __str;
          _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "    purge_events: deleting: %s",  buf,  0xCu);
        }

        unlink(__str);
        ++v9;
      }

      ++v8;
      uint64_t v7 = *(void *)(v5 + 128);
    }

    while (v8 < *(int *)(v7 + 32));
    if (v9)
    {
      snprintf((char *)buf, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v7 + 256));
      unlink((const char *)buf);
      sub_10000ADA8(v5, *(void *)(v5 + 128));
      uint64_t v7 = *(void *)(v5 + 128);
    }
  }

  int v13 = *(_DWORD *)(v7 + 32);
  int v14 = *(char **)(v7 + 40);
  if (v13 <= v9)
  {
    free(v14);
    uint64_t v18 = *(void *)(v5 + 128);
    *(void *)(v18 + 32) = 0LL;
    *(void *)(v18 + 40) = 0LL;
    ++*(_WORD *)(v18 + 248);
    __int16 v19 = 1;
  }

  else
  {
    memmove(v14, &v14[8 * v9], 8LL * (v13 - v9));
    uint64_t v15 = *(void *)(v5 + 128);
    int v16 = *(_DWORD *)(v15 + 36);
    int v17 = *(_DWORD *)(v15 + 32) - v9;
    *(_DWORD *)(v15 + 32) = v17;
    bzero((void *)(*(void *)(v15 + 40) + 8LL * v17), 8LL * (v16 - v17));
    uint64_t v18 = *(void *)(v5 + 128);
    __int16 v19 = *(_WORD *)(v18 + 250) + 1;
  }

  *(_WORD *)(v18 + 250) = v19;
  pthread_rwlock_unlock((pthread_rwlock_t *)(v18 + 48));
  sub_1000048C0((uint64_t)&unk_100021758);
  return 0LL;
}

uint64_t sub_100010674()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  qword_100020290 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0x1EuLL,  0LL,  global_queue);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100020290, &stru_10001C740);
  dispatch_resume((dispatch_object_t)qword_100020290);
  dispatch_queue_global_t v1 = dispatch_get_global_queue(0LL, 0LL);
  os_state_add_handler(v1, &stru_10001C780);
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    int v3 = (_DWORD)i << 24;
    int v4 = 8;
    do
    {
      if (v3 >= 0) {
        v3 *= 2;
      }
      else {
        int v3 = (2 * v3) ^ 0x4C11DB7;
      }
      --v4;
    }

    while (v4);
    dword_100020298[i] = v3;
  }

  dword_10002073C = 2;
  qword_100020730 = (uint64_t)sub_100008C34(2, 0x10000);
  if (qword_100020730)
  {
    zone = malloc_create_zone(0LL, 0);
    qword_1000206A8 = (uint64_t)zone;
    if (zone) {
      malloc_set_zone_name(zone, "PathStringZone");
    }
    qword_100021850 = 0LL;
    qword_100021848 = (uint64_t)sub_100012408(4096, (_DWORD *)&qword_100021850 + 1);
    qword_1000206C0 = (uint64_t)malloc_default_zone();
    qword_100021840 = 0LL;
    qword_100021838 = 0LL;
    qword_100021830 = (uint64_t)sub_100012408(4096, &qword_100021838);
    bzero(xmmword_100020758, 0x1000uLL);
    bzero(dword_1000218D8, 0x1000uLL);
    sub_100005300();
    if (!qword_100020748)
    {
      int v9 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001722C();
      }
      while (1)
        sleep(0x15180u);
    }

    pthread_cond_init(&stru_100020200, 0LL);
    pthread_mutex_init(&stru_1000201C0, 0LL);
    pthread_mutex_init(&stru_100020140, 0LL);
    v13[0] = 0x101010101010101LL;
    v13[1] = 0x101010101010101LL;
    if (!sub_100004A98(1, (uint64_t)v13, 16, 0x2000))
    {
      ioctl(dword_100020048, 0x20007365uLL, 0LL);
      if (!ioctl(dword_100020048, 0x20007366uLL, 0LL)) {
        byte_100020288 = 1;
      }
      pthread_attr_init(&v12);
      pthread_create(&v11, &v12, (void *(__cdecl *)(void *))sub_100010C04, 0LL);
      pthread_attr_destroy(&v12);
      if (sub_10000CB70())
      {
        unint64_t v10 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100017258();
        }
      }

      pthread_mutex_lock(&stru_100020090);
      dword_100020750 = 1;
      pthread_cond_broadcast(&stru_1000200D0);
      pthread_mutex_unlock(&stru_100020090);
      sub_100010F38();
      pthread_join(v11, 0LL);
      sub_100006624();
      while (dword_100020724)
        usleep(0xC350u);
      sub_10000E228();
      exit(0);
    }

    uint64_t v6 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100017284(v6);
    }
    return 22LL;
  }

  else
  {
    uint64_t v8 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100017200();
    }
    return 12LL;
  }

void sub_100010A20(id a1)
{
}

os_state_data_s *__cdecl sub_100010A28(id a1, os_state_hints_s *a2)
{
  if (a2->var2 != 3)
  {
    pthread_attr_t v12 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001739C();
    }
    return 0LL;
  }

  int v2 = sub_1000099D8();
  if (!v2)
  {
    int v13 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000172F8();
    }
    return 0LL;
  }

  int v3 = v2;
  Data = CFPropertyListCreateData(kCFAllocatorDefault, v2, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  unsigned int Length = CFDataGetLength(Data);
  if (Length <= 0x8000)
  {
    CFRelease(v3);
    pthread_t v11 = (char *)calloc(1uLL, Length + 200LL);
    __strlcpy_chk(v11 + 136, "FSEvents Client State", 64LL, 64LL);
    *(_DWORD *)pthread_t v11 = 1;
    *((_DWORD *)v11 + 1) = Length;
    v16.location = 0LL;
    v16.length = Length;
    CFDataGetBytes(Data, v16, (UInt8 *)v11 + 200);
  }

  else
  {
    uint64_t v6 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100017324(Length, v6, v7);
    }
    Value = CFDictionaryGetValue(v3, @"global_state");
    int v9 = CFPropertyListCreateData(kCFAllocatorDefault, Value, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
    CFRelease(v3);
    unsigned int v10 = CFDataGetLength(v9);
    pthread_t v11 = (char *)calloc(1uLL, v10 + 200LL);
    __strlcpy_chk(v11 + 136, "FSEvents Global State", 64LL, 64LL);
    *(_DWORD *)pthread_t v11 = 1;
    *((_DWORD *)v11 + 1) = v10;
    v15.location = 0LL;
    v15.length = v10;
    CFDataGetBytes(v9, v15, (UInt8 *)v11 + 200);
    if (v9) {
      CFRelease(v9);
    }
  }

  if (Data) {
    CFRelease(Data);
  }
  return (os_state_data_s *)v11;
}

uint64_t sub_100010C04()
{
  thread_act_t v0 = mach_thread_self();
  pthread_setname_np("com.apple.fseventsd.dev.fsevents");
  integer_t policy_info = 19;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  thread_act_t v1 = mach_thread_self();
  BOOLean_t get_default = 1;
  policy_infoCnt[0] = 1;
  if (!thread_policy_get(v1, 1u, &v20, policy_infoCnt, &get_default))
  {
    integer_t v20 = 0;
    thread_policy_set(v1, 1u, &v20, 1u);
  }

  mach_port_deallocate(mach_task_self_, v1);
  if (!dword_1000206C8)
  {
    while (1)
    {
      pthread_mutex_lock(&stru_1000201C0);
      uint64_t v4 = qword_100020730;
      if (qword_100020730) {
        break;
      }
      do
      {
LABEL_13:
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 32);
      }

      while (v4);
      uint64_t v8 = (int *)sub_100008C34(1, 0x10000);
      *(void *)(v7 + 32) = v8;
      if (v8)
      {
        uint64_t v5 = v8;
        ++dword_10002073C;
        goto LABEL_16;
      }

      pthread_cond_signal(&stru_100020200);
      pthread_mutex_unlock(&stru_1000201C0);
      CFRange v16 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000173C8(policy_infoCnt, (_BYTE *)policy_infoCnt + 1);
      }
      sleep(2u);
LABEL_35:
      if (dword_1000206C8) {
        goto LABEL_4;
      }
    }

    uint64_t v5 = (int *)qword_100020730;
    while (1)
    {
      int v6 = v5[3];
      if (*v5 - v6 >= 0x8000 || v5[1] == v6) {
        break;
      }
      uint64_t v5 = (int *)*((void *)v5 + 4);
      if (!v5) {
        goto LABEL_13;
      }
    }

LABEL_4:
  if (*__error() != 9)
  {
    int v2 = dword_100020048;
    if ((dword_100020048 & 0x80000000) == 0)
    {
      dword_100020048 = -1;
      close(v2);
    }
  }

  pthread_mutex_lock(&stru_1000201C0);
  pthread_cond_signal(&stru_100020200);
  pthread_mutex_unlock(&stru_1000201C0);
  return 0LL;
}

uint64_t sub_100010F38()
{
  thread_act_t v0 = mach_thread_self();
  pthread_setname_np("com.apple.fseventsd.notify");
  integer_t policy_info = 18;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  if (!dword_1000206C8)
  {
    int v2 = 0;
    uint64_t v3 = 9999LL;
    while (1)
    {
      while (1)
      {
        pthread_mutex_lock(&stru_1000201C0);
LABEL_5:
        uint64_t v4 = qword_100020730;
        if (!qword_100020730) {
          break;
        }
        while (1)
        {
          int v5 = *(_DWORD *)(v4 + 4);
          if (v5 != *(_DWORD *)(v4 + 12) || *(_DWORD *)(v4 + 8) > v5) {
            break;
          }
          uint64_t v4 = *(void *)(v4 + 32);
          if (!v4) {
            goto LABEL_9;
          }
        }

        pthread_mutex_unlock(&stru_1000201C0);
LABEL_19:
        int v8 = 0;
        if (v4)
        {
          while (1)
          {
            if (v8 >= 101)
            {
              int v17 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                sub_1000173F4(&v20, v21);
              }
              goto LABEL_48;
            }

            int v9 = *(_DWORD *)(v4 + 8);
            int v10 = *(_DWORD *)(v4 + 12);
            if (v9 < v10) {
              goto LABEL_25;
            }
            if (v9 > v10 && *(_DWORD *)(v4 + 4) == v9) {
              break;
            }
LABEL_26:
            if (dword_1000206C8) {
              goto LABEL_48;
            }
            uint64_t v11 = *(int *)(v4 + 4);
            int v12 = v9 - v11;
            sub_100008CD0( (_DWORD *)(*(void *)(v4 + 24) + v11),  v9 - v11,  (uint64_t)&qword_100021830,  (void (*)(uint64_t, uint64_t, uint64_t, __int16 *, uint64_t, uint64_t, uint64_t, uint64_t, void, _DWORD, uint64_t))sub_100007710,  0LL);
            *(_DWORD *)(v4 + 4) += v12;
            if (dword_1000206CC) {
              goto LABEL_30;
            }
LABEL_32:
            int v2 = 1;
LABEL_33:
            gettimeofday(&v23, 0LL);
            uint64_t v3 = sub_100012F28((uint64_t)&v23);
            sub_100006A9C(&qword_100021830);
            if (!v4) {
              goto LABEL_48;
            }
            int v15 = *(_DWORD *)(v4 + 4);
            if (v15 == *(_DWORD *)(v4 + 8) && v15 <= *(_DWORD *)(v4 + 12))
            {
              uint64_t v4 = *(void *)(v4 + 32) ? *(void *)(v4 + 32) : qword_100020730;
              if (!v4) {
                goto LABEL_48;
              }
              int v16 = *(_DWORD *)(v4 + 4);
              if (v16 == *(_DWORD *)(v4 + 8) && v16 <= *(_DWORD *)(v4 + 12)) {
                goto LABEL_48;
              }
            }

            ++v8;
          }

          *(_DWORD *)(v4 + 4) = 0;
LABEL_25:
          *(_DWORD *)(v4 + 8) = v10;
          int v9 = v10;
          goto LABEL_26;
        }

        if (dword_1000206CC)
        {
LABEL_30:
          int v13 = -dword_1000206CC;
          sub_100004CEC((void (*)(void))sub_1000097D0);
          do
            unsigned int v14 = __ldxr((unsigned int *)&dword_1000206CC);
          while (__stxr(v14 + v13, (unsigned int *)&dword_1000206CC));
          goto LABEL_32;
        }

        if (v2) {
          goto LABEL_33;
        }
LABEL_48:
        if (dword_1000206C8) {
          return sub_1000082B8();
        }
      }

uint64_t sub_1000112D0()
{
  thread_act_t v0 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_100017420(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return 0LL;
}

uint64_t sub_100011310(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 120);
  int v3 = (2 * v2) & 4 | (((v2 >> 3) & 1) << 7);
  if ((v2 & 0x20) != 0)
  {
    v3 |= 0x1000u;
    pthread_mutex_lock(&stru_100020008);
    uint64_t v4 = 0LL;
    while (dword_100021858[v4])
    {
      if (++v4 == 32) {
        goto LABEL_8;
      }
    }

    dword_100021858[v4] = *(_DWORD *)(a1 + 136);
LABEL_8:
    pthread_mutex_unlock(&stru_100020008);
    unsigned int v2 = *(_DWORD *)(a1 + 120);
  }

  int v5 = (16 * v2) & 0x100 | v3 | ((v2 & 0x80) << 7);
  if ((v2 & 0x80) != 0) {
    int v6 = 0x2000;
  }
  else {
    int v6 = 459;
  }
  if ((v2 & 0x40) != 0)
  {
    v5 |= 0x2000u;
    *(_DWORD *)(a1 + 152) = 1;
  }

  if ((v2 & 0x100) != 0)
  {
    v5 |= 0x8000u;
    *(_DWORD *)(a1 + 156) = 1;
  }

  uint64_t v7 = *(void *)(a1 + 24);
  int v8 = *(_DWORD *)(a1 + 16);
  unsigned int v9 = *(_DWORD *)(a1 + 20);
  unsigned int v10 = *(_DWORD *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = *(void *)(a1 + 128);
  int v13 = *(_DWORD *)(a1 + 136);
  int v14 = *(_DWORD *)(a1 + 140);
  int v15 = *(_DWORD *)(a1 + 144);
  __int128 v16 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)&__attr.__sig = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&__attr.__opaque[8] = v16;
  if (sub_1000084AC( v13,  v8,  v7,  v9,  (void *)(a1 + 48),  v10,  v11,  v6,  v12,  v5,  (uint64_t)sub_100004268,  a1,  v14,  v15,  &__attr,  (unint64_t *)&v21))
  {
    int v17 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100017490();
    }
    return 22LL;
  }

  do
    unsigned int v19 = __ldxr((unsigned int *)&dword_100020720);
  while (__stxr(v19 + 1, (unsigned int *)&dword_100020720));
  sub_100004038(a1);
  pthread_attr_init(&__attr);
  pthread_attr_setdetachstate(&__attr, 2);
  if ((v5 & 0x4000) != 0) {
    pthread_attr_set_qos_class_np(&__attr, QOS_CLASS_USER_INTERACTIVE, 0);
  }
  pthread_create(&v20, &__attr, (void *(__cdecl *)(void *))sub_10000CD20, v21);
  pthread_attr_destroy(&__attr);
  return 0LL;
}

void sub_100011504(uint64_t a1)
{
  if (sub_10000FF60())
  {
    pthread_mutex_lock(&stru_100020140);
    for (uint64_t i = 0LL; i != 512; ++i)
    {
      uint64_t v3 = xmmword_100020758[i];
      if (v3 && *(void *)(v3 + 216) == a1)
      {
        pthread_mutex_lock((pthread_mutex_t *)xmmword_100020758[i]);
        *(_DWORD *)(v3 + 188) |= 2u;
        pthread_mutex_unlock((pthread_mutex_t *)v3);
        sub_100007658(v3);
        pthread_mutex_unlock(&stru_100020140);
        return;
      }
    }

    pthread_mutex_unlock(&stru_100020140);
    uint64_t v4 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100017504(a1, v4, v5);
    }
  }

uint64_t sub_1000115C8(uint64_t a1, void *a2)
{
  uint64_t result = sub_10000FF60();
  if ((_DWORD)result)
  {
    int v5 = 0;
    while (1)
    {
      pthread_mutex_lock(&stru_100020140);
      uint64_t v6 = 0LL;
      while (1)
      {
        uint64_t v7 = xmmword_100020758[v6];
        if (v7)
        {
          if (*(void *)(v7 + 216) == a1) {
            break;
          }
        }

        if (++v6 == 512) {
          return pthread_mutex_unlock(&stru_100020140);
        }
      }

      if (!pthread_mutex_trylock((pthread_mutex_t *)xmmword_100020758[v6])) {
        break;
      }
      pthread_mutex_unlock(&stru_100020140);
      uint64_t result = sleep(1u);
      if (++v5 == 10) {
        return result;
      }
    }

    if ((*(_DWORD *)(v7 + 188) & 0x800) != 0)
    {
      if ((*(_DWORD *)(v7 + 188) & 0x20) != 0) {
        sub_100017594();
      }
      *(_DWORD *)(v7 + 188) &= ~0x800u;
      pthread_attr_init(&v9);
      pthread_attr_setdetachstate(&v9, 2);
      pthread_create(&v8, &v9, (void *(__cdecl *)(void *))sub_10000CD20, (void *)v7);
      pthread_attr_destroy(&v9);
    }

    pthread_cond_signal((pthread_cond_t *)(v7 + 64));
    pthread_mutex_unlock((pthread_mutex_t *)v7);
    *a2 = *(void *)(v7 + 160);
    return pthread_mutex_unlock(&stru_100020140);
  }

  return result;
}

uint64_t sub_100011754(_DWORD *a1, void *a2)
{
  uint64_t v3 = qword_1000206E8;
  if (qword_1000206E8)
  {
    if (*(int *)(qword_1000206E8 + 8) < 1)
    {
      LODWORD(v4) = 0;
    }

    else
    {
      uint64_t v4 = 0LL;
      do
      {
        if ((*(_DWORD *)(*(void *)(*(void *)qword_1000206E8 + 8 * v4) + 32LL) & 0x50) == 0
          && **(_DWORD **)(*(void *)qword_1000206E8 + 8 * v4) == *a1)
        {
          break;
        }

        ++v4;
      }

      while (v4 < *(int *)(qword_1000206E8 + 8));
    }
  }

  else
  {
    if (dword_1000206C8) {
      return 2LL;
    }
    int v5 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000175BC();
    }
    MEMORY[0x123] = 195936478;
    uint64_t v3 = qword_1000206E8;
    if (!qword_1000206E8) {
      return 2LL;
    }
    LODWORD(v4) = 0;
  }

  if ((int)v4 < *(_DWORD *)(v3 + 8))
  {
    uint64_t result = 0LL;
    *a2 = *(void *)(*(void *)v3 + 8LL * v4);
    return result;
  }

  return 2LL;
}

uint64_t sub_10001184C()
{
  uint64_t v0 = kqueue();
  if ((v0 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  v3.ident = 0LL;
  *(_DWORD *)&v3.filter = 131063;
  memset(&v3.fflags, 0, 20);
  if (kevent(v0, &v3, 1, 0LL, 0, 0LL))
  {
    close(v1);
    return 0xFFFFFFFFLL;
  }

  return v1;
}

void sub_1000118C0(__CFFileDescriptor *a1)
{
  uint64_t v1 = a1;
  CFFileDescriptorNativeDescriptor NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  *(void *)timeout = 0LL;
  *(void *)&timeout[8] = 0LL;
  do
  {
    if (dword_1000206C8 || kevent(NativeDescriptor, 0LL, 0, &eventlist, 1, (const timespec *)timeout) != -1) {
      goto LABEL_13;
    }
  }

  while (*__error() == 4);
  int v3 = *__error();
  if (!v3)
  {
LABEL_13:
    if (dword_1000206C8) {
      goto LABEL_14;
    }
    uint64_t v104 = 0LL;
    if (qword_100020748)
    {
      uint64_t v10 = *(void *)(qword_100020748 + 16);
      if (v10) {
        sub_100007658(v10);
      }
    }

    int v11 = sub_100005764(&v104);
    if (v11 <= 0)
    {
      uint64_t v33 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000175E8();
      }
      goto LABEL_14;
    }

    unsigned int v12 = v11;
    uint64_t v99 = v1;
    usleep(0xC350u);
    sub_1000049FC((uint64_t)&unk_100021758);
    uint64_t v13 = qword_1000206E8;
    if (*(int *)(qword_1000206E8 + 8) >= 1)
    {
      uint64_t v14 = 0LL;
      do
        *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v14++) + 32LL) |= 8u;
      while (v14 < *(int *)(v13 + 8));
    }

    uint64_t v15 = 0LL;
    int v16 = 0;
    int v100 = 0;
    int v17 = v104;
    uint64_t v102 = v12;
    do
    {
      int v18 = &v17[2168 * v15];
      *(_DWORD *)int v18 = 0;
      if (*(int *)(v13 + 8) < 1)
      {
        LODWORD(v19) = 0;
      }

      else
      {
        uint64_t v19 = 0LL;
        pthread_t v20 = v17;
        ssize_t v21 = &v17[2168 * v15];
        __int16 v22 = v21 + 48;
        timeval v23 = v21 + 88;
        while ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v19) + 32LL) & 0x4030) != 0
             || *v22 != **(_DWORD **)(*(void *)v13 + 8 * v19)
             || !*(void *)(*(void *)(*(void *)v13 + 8 * v19) + 8LL)
             || strcmp(v23, *(const char **)(*(void *)(*(void *)v13 + 8 * v19) + 8LL)))
        {
        }

        *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v19) + 32LL) &= ~8u;
        ++v16;
        sub_10000BC08(*(void *)(*(void *)v13 + 8 * v19), (uint64_t)v18);
        uint64_t v13 = qword_1000206E8;
LABEL_32:
        int v17 = v20;
      }

      if ((int)v19 >= *(_DWORD *)(v13 + 8))
      {
        int v100 = 1;
        *(_DWORD *)int v18 = 1;
        ++v16;
      }

      ++v15;
    }

    while (v15 != v102);
    if (*(int *)(v13 + 8) < 1)
    {
      int v25 = 0;
      int v26 = v16;
      int v27 = v100;
    }

    else
    {
      uint64_t v24 = 0LL;
      int v25 = 0;
      int v26 = v16;
      int v27 = v100;
      do
      {
        if ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) & 0x4000) != 0)
        {
          int v27 = 1;
        }

        else if ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) & 8) != 0 {
               && (*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) & 0x30) == 0)
        }
        {
          *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) &= 0xFFFFFFF3;
          ++v26;
          uint64_t v28 = *(void *)(*(void *)v13 + 8 * v24);
          int v29 = *(_DWORD *)(v28 + 32);
          int v30 = v29 | 0x800;
          unsigned int v31 = v29 & 0xFFFFFF7F;
          if ((*(_DWORD *)(v28 + 32) & 0x80) != 0) {
            unsigned int v32 = v31;
          }
          else {
            unsigned int v32 = v30;
          }
          *(_DWORD *)(v28 + 32) = v32;
          *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) |= 0x20u;
          int v25 = 1;
        }

        else if ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) & 8) != 0 {
               && (*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) & 0x30) != 0)
        }
        {
          ++v26;
          *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32LL) &= ~8u;
        }

        ++v24;
      }

      while (v24 < *(int *)(v13 + 8));
    }

    if (!v27)
    {
      sub_1000048C0((uint64_t)&unk_100021758);
      free(v17);
      uint64_t v1 = v99;
      if (v25)
      {
        do
          unsigned int v49 = __ldxr((unsigned int *)&dword_1000206CC);
        while (__stxr(v49 + 1, (unsigned int *)&dword_1000206CC));
        goto LABEL_140;
      }

LABEL_14:
      pthread_attr_t v9 = v1;
      goto LABEL_15;
    }

    uint64_t v42 = malloc(0x10uLL);
    if (v42)
    {
      int v43 = v42;
      uint64_t v44 = calloc(v26, 8uLL);
      if (v44)
      {
        __int16 v45 = v44;
        uint64_t v46 = qword_1000206E8;
        uint64_t v101 = (uint64_t)v43;
        if (*(int *)(qword_1000206E8 + 8) < 1)
        {
          int v48 = 0;
        }

        else
        {
          uint64_t v47 = 0LL;
          int v48 = 0;
          do
          {
            if ((*(_DWORD *)(*(void *)(*(void *)v46 + 8 * v47) + 32LL) & 0x4000) == 0)
            {
              v44[v48++] = *(void *)(*(void *)v46 + 8 * v47);
              uint64_t v46 = qword_1000206E8;
            }

            ++v47;
          }

          while (v47 < *(int *)(v46 + 8));
        }

        uint64_t v61 = 0LL;
        while (1)
        {
          int v62 = &v17[2168 * v61];
          if (*(_DWORD *)v62) {
            break;
          }
LABEL_112:
          if (++v61 == v102) {
            goto LABEL_116;
          }
        }

        int v63 = calloc(0x88uLL, 1uLL);
        v45[v48] = v63;
        if (!v63)
        {
          size_t v86 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            LODWORD(eventlist.ident) = 136315138;
            *(uintptr_t *)((char *)&eventlist.ident + 4) = (uintptr_t)&v17[2168 * v61 + 88];
            _os_log_error_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_ERROR,  "NO MEMORY for new device for mount point %s\n",  (uint8_t *)&eventlist,  0xCu);
          }

LABEL_116:
          if (v48 != v26)
          {
            uint64_t v87 = (os_log_s *)sub_1000031E4();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
              sub_10001766C();
            }
          }

          *(void *)uint64_t v101 = v45;
          *(_DWORD *)(v101 + 8) = v48;
          uint64_t v88 = qword_1000206E8;
          qword_1000206E8 = v101;
          if (v88)
          {
            int v89 = *(_DWORD *)(v88 + 8);
            uint64_t v1 = v99;
            if (v89 >= 1)
            {
              for (uint64_t i = 0LL; i < v89; ++i)
              {
                uint64_t v91 = *(void *)(*(void *)v88 + 8 * i);
                if ((*(_DWORD *)(v91 + 32) & 0x4000) != 0)
                {
                  sub_10000E034(v91);
                  free(*(void **)(*(void *)v88 + 8 * i));
                  *(void *)(*(void *)v88 + 8 * i) = 0LL;
                  int v89 = *(_DWORD *)(v88 + 8);
                }
              }

              int v48 = *(_DWORD *)(v101 + 8);
            }
          }

          else
          {
            uint64_t v1 = v99;
          }

          if (v48 >= 1)
          {
            uint64_t v92 = 0LL;
            uint64_t v93 = *(void *)v101;
            do
            {
              uint64_t v94 = *(void *)(v93 + 8 * v92);
              if ((*(_DWORD *)(v94 + 32) & 0x800) != 0)
              {
                sub_10000E0C8(v94);
                uint64_t v93 = *(void *)v101;
                uint64_t v94 = *(void *)(*(void *)v101 + 8 * v92);
                *(_DWORD *)(v94 + 32) &= ~0x800u;
              }

              if ((*(_DWORD *)(v94 + 32) & 0x10) != 0)
              {
                uint64_t v95 = *(void **)(v94 + 8);
                if (v95)
                {
                  free(v95);
                  uint64_t v96 = *(void *)v101;
                  *(void *)(*(void *)(*(void *)v101 + 8 * v92) + 8LL) = 0LL;
                  free(*(void **)(*(void *)(v96 + 8 * v92) + 16LL));
                  uint64_t v93 = *(void *)v101;
                  *(void *)(*(void *)(*(void *)v101 + 8 * v92) + 16LL) = 0LL;
                  uint64_t v97 = *(_DWORD **)(v93 + 8 * v92);
                  *uint64_t v97 = 0;
                }

                else
                {
                  uint64_t v97 = *(_DWORD **)(v93 + 8 * v92);
                }

                if (!v97[9]) {
                  v97[8] |= 0x4000u;
                }
              }

              ++v92;
            }

            while (v92 < *(int *)(v101 + 8));
          }

          sub_1000048C0((uint64_t)&unk_100021758);
          free(*(void **)v88);
          free((void *)v88);
          free(v17);
          do
            unsigned int v98 = __ldxr((unsigned int *)&dword_1000206CC);
          while (__stxr(v98 + 1, (unsigned int *)&dword_1000206CC));
LABEL_140:
          sub_1000098DC();
          goto LABEL_14;
        }

        uint64_t v64 = v63;
        int v65 = v48;
        uint64_t v66 = v48;
        size_t v67 = &v17[2168 * v61];
        _DWORD *v63 = *((_DWORD *)v67 + 12);
        uint64_t v68 = v67 + 88;
        uint64_t v69 = strdup(v67 + 88);
        *((void *)v64 + 1) = v69;
        if (sub_1000057F8(v68, (char *)&eventlist))
        {
          *(void *)(v45[v66] + 16LL) = strdup((const char *)&eventlist);
          uint64_t v69 = *(char **)(v45[v66] + 16LL);
        }

        else
        {
          size_t v70 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            int v81 = *(_DWORD *)v45[v66];
            *(_DWORD *)timeout = 136315650;
            *(void *)&timeout[4] = "handle_vfs_event";
            *(_WORD *)&timeout[12] = 2080;
            *(void *)&timeout[14] = v69;
            __int16 v106 = 1024;
            int v107 = v81;
            _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "%s: Could not resolve nofirmlink  path, fallback to mount_point[%s] dev[%d]\n",  timeout,  0x1Cu);
          }

          *(void *)(v45[v66] + 16LL) = strdup(v68);
        }

        uint64_t v71 = v69;
        do
        {
          while (1)
          {
            int v73 = *v71++;
            int v72 = v73;
            if (v73 != 47) {
              break;
            }
            ++*(_DWORD *)(v45[v66] + 24LL);
          }
        }

        while (v72);
        uint64_t v74 = v45[v66];
        if (v69[1]) {
          ++*(_DWORD *)(v74 + 24);
        }
        *(_DWORD *)(v74 + 32) = 36;
        int v75 = sub_1000058E0((uint64_t)v62, &v103);
        uint64_t v76 = v45[v66];
        int v77 = *(_DWORD *)(v76 + 32);
        if (v75)
        {
          *(_DWORD *)(v76 + 32) = v77 | 0x100;
          int v78 = v103;
          if (v103)
          {
LABEL_104:
            if (v78 == 2)
            {
              *(_DWORD *)(v45[v66] + 32LL) |= 0x8040u;
              uint64_t v80 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                uint64_t v84 = v45[v66];
                uint64_t v85 = *(void *)(v84 + 8);
                LODWORD(v84) = *(_DWORD *)v84;
                *(_DWORD *)timeout = 136315650;
                *(void *)&timeout[4] = "handle_vfs_event";
                *(_WORD *)&timeout[12] = 2080;
                *(void *)&timeout[14] = v85;
                __int16 v106 = 1024;
                int v107 = v84;
                _os_log_error_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_ERROR,  "%s: mount_point(%s) dev(%d) will be completely ignored",  timeout,  0x1Cu);
              }
            }

            else if (v78 == 1)
            {
              uint64_t v79 = (os_log_s *)sub_1000031E4();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                uint64_t v82 = v45[v66];
                uint64_t v83 = *(void *)(v82 + 8);
                LODWORD(v82) = *(_DWORD *)v82;
                *(_DWORD *)timeout = 136315650;
                *(void *)&timeout[4] = "handle_vfs_event";
                *(_WORD *)&timeout[12] = 2080;
                *(void *)&timeout[14] = v83;
                __int16 v106 = 1024;
                int v107 = v82;
                _os_log_error_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "%s: Logging disabled (no_log) completely for device: mount_point(%s) dev(%d)",  timeout,  0x1Cu);
              }

              *(_DWORD *)(v45[v66] + 32LL) |= 0x1000u;
            }

            int v48 = v65 + 1;
            goto LABEL_112;
          }

          sub_100005A64(v76);
        }

        else
        {
          *(_DWORD *)(v76 + 32) = v77 | 0x40;
        }

        int v78 = v103;
        goto LABEL_104;
      }

      int v60 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_100017640();
      }
      sub_1000048C0((uint64_t)&unk_100021758);
      free(v43);
    }

    else
    {
      int v59 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100017614();
      }
      sub_1000048C0((uint64_t)&unk_100021758);
    }

    free(v17);
    uint64_t v1 = v99;
    goto LABEL_14;
  }

  uint64_t v4 = (os_log_s *)sub_1000031E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000177AC();
  }
  if (v3 != 9)
  {
    CFFileDescriptorInvalidate(v1);
    CFRelease(v1);
  }

  CFFileDescriptorNativeDescriptor v5 = sub_10001184C();
  if (v5 < 0)
  {
    int v34 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000176CC(v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }

  else
  {
    uint64_t v6 = CFFileDescriptorCreate(0LL, v5, 1u, (CFFileDescriptorCallBack)sub_1000118C0, 0LL);
    RunLoopSource = CFFileDescriptorCreateRunLoopSource(0LL, v6, 0LL);
    if (RunLoopSource)
    {
      pthread_t v8 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000206F8, RunLoopSource, kCFRunLoopDefaultMode);
      CFRelease(v8);
      pthread_attr_t v9 = v6;
LABEL_15:
      CFFileDescriptorEnableCallBacks(v9, 1uLL);
      return;
    }

    uint64_t v50 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10001773C(v50, v51, v52, v53, v54, v55, v56, v57);
    }
    CFFileDescriptorInvalidate(v6);
    CFRelease(v6);
  }

  dword_1000206C8 = 1;
  __dmb(0xBu);
  int v58 = dword_100020048;
  if ((dword_100020048 & 0x80000000) == 0)
  {
    dword_100020048 = -1;
    close(v58);
  }

BOOL sub_100012384(int a1)
{
  if (dword_100021858[0] == a1)
  {
    BOOL v2 = 1LL;
  }

  else
  {
    unint64_t v3 = 0LL;
    do
    {
      unint64_t v4 = v3;
      if (v3 == 31) {
        break;
      }
      int v5 = dword_100021858[++v3];
    }

    while (v5 != a1);
    BOOL v2 = v4 < 0x1F;
  }

  pthread_mutex_unlock(&stru_100020008);
  return v2;
}

void *sub_100012408(int a1, _DWORD *a2)
{
  if (a1 < 1) {
    return 0LL;
  }
  int v3 = 1;
  do
  {
    unsigned int v4 = v3;
    v3 *= 2;
  }

  while ((int)v4 <= a1);
  unsigned int v5 = v4 >> 1;
  uint64_t v6 = malloc(8LL * (v4 >> 1));
  uint64_t v7 = v6;
  if (v6)
  {
    if (v5 <= 1) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = v5;
    }
    bzero(v6, 8LL * v8);
    *a2 = v5 - 1;
  }

  return v7;
}

uint64_t sub_100012480(_BYTE *a1, int a2)
{
  if (a2)
  {
    unsigned int v2 = 0;
    do
    {
      int v3 = *a1++;
      v2 ^= dword_100020298[v3 ^ HIBYTE(v2)];
      --a2;
    }

    while (a2);
  }

  else
  {
    int v4 = *a1;
    if (*a1)
    {
      unsigned int v2 = 0;
      unsigned int v5 = a1 + 1;
      do
      {
        v2 ^= dword_100020298[v4 ^ HIBYTE(v2)];
        int v6 = *v5++;
        int v4 = v6;
      }

      while (v6);
    }

    else
    {
      unsigned int v2 = 0;
    }
  }

  if (v2 <= 1) {
    return 1LL;
  }
  else {
    return v2;
  }
}

void sub_1000124EC(int8x8_t *a1, uint64_t a2, char a3)
{
  *a1 = vrev32_s8(*a1);
  uint64_t v3 = bswap32(a1[1].u32[0]);
  a1[1].i32[0] = v3;
  BOOL v4 = v3 <= 0x40000 && v3 <= a2;
  unsigned int v5 = (unint64_t *)((char *)&a1[1] + 4);
  unint64_t v6 = (unint64_t)a1 + v3;
  if (v4 && (unint64_t)v5 < v6)
  {
    while (1)
    {
      int v11 = v5;
      do
      {
        if (!*(_BYTE *)v11) {
          break;
        }
        int v11 = (unint64_t *)((char *)v11 + 1);
      }

      while ((unint64_t)v11 < v6);
      unint64_t v12 = (char *)v11 - (char *)v5 + 1;
      if (v12 >= 0x401)
      {
        uint64_t v13 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10001781C(v13, v14, v15, v16, v17, v18, v19, v20);
        }
        return;
      }

      unsigned int v8 = (char *)v5 + v12;
      *(void *)unsigned int v8 = bswap64(*(void *)v8);
      unsigned int v5 = (unint64_t *)(v8 + 12);
      if ((unint64_t)(v8 + 12) > v6)
      {
        int v29 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1000178FC(v29, v30, v31, v32, v33, v34, v35, v36);
        }
        return;
      }

      *((_DWORD *)v8 + 2) = bswap32(*((_DWORD *)v8 + 2));
      __int32 v9 = a1[1].i32[0];
      if ((a3 & 1) != 0)
      {
        unint64_t v10 = (unint64_t)(v8 + 20);
        if (v10 > (unint64_t)a1 + v9)
        {
          uint64_t v37 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_1000179DC(v37, v38, v39, v40, v41, v42, v43, v44);
          }
          return;
        }

        *unsigned int v5 = bswap64(*v5);
        unsigned int v5 = (unint64_t *)v10;
      }

      if ((a3 & 2) != 0)
      {
        if ((char *)v5 + 4 > (char *)a1 + v9)
        {
          __int16 v45 = (os_log_s *)sub_1000031E4();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_10001796C(v45, v46, v47, v48, v49, v50, v51, v52);
          }
          return;
        }

        *(_DWORD *)unsigned int v5 = bswap32(*(_DWORD *)v5);
        __int32 v9 = a1[1].i32[0];
        unsigned int v5 = (unint64_t *)((char *)v5 + 4);
      }

      unint64_t v6 = (unint64_t)a1 + v9;
    }

    ssize_t v21 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10001788C(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }

gzFile sub_100012698(uint64_t a1, uint64_t a2, int a3)
{
  if ((*(_DWORD *)(a1 + 32) & 0x1040) != 0) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a2 + 8);
  if (!v6)
  {
    uint64_t v6 = qword_1000206D0[dword_1000206E0];
    *(void *)(a2 + 8) = v6;
  }

  uint64_t v7 = 0LL;
  for (unsigned int i = 0; ; ++i)
  {
    if (*(_DWORD *)(a2 + 252))
    {
      int v9 = open((const char *)(a2 + 1280), 536870922);
    }

    else
    {
      uint64_t v7 = v6 + 1;
      snprintf((char *)(a2 + 1280), 0x400uLL, "%s/%.16llx", (const char *)(a2 + 256), v6 + 1);
      int v9 = open_dprotected_np((const char *)(a2 + 1280), 536874498, 4, 0, 384LL);
    }

    int v10 = v9;
    if ((v9 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 17 || i >= 0x64) {
      goto LABEL_16;
    }
    uint64_t v6 = *(void *)(a2 + 8) + 1LL;
    *(void *)(a2 + 8) = v6;
  }

  if (fstat(v9, &v22) || (v22.st_mode & 0xF000) != 0x8000)
  {
    __error();
    close(v10);
LABEL_16:
    int v11 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100017B34();
    }
    int v10 = open("/dev/null", 2);
    if (v10 < 0)
    {
      uint64_t v18 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      goto LABEL_39;
    }
  }

  size_t v12 = strlen((const char *)(a2 + 256));
  __s2[0] = 0;
  if (fcntl(v10, 50, __s2) || strncmp((const char *)(a2 + 256), __s2, v12) || __s2[v12] != 47)
  {
    if (*(void *)__s2 != 0x6C756E2F7665642FLL || v24 != 108)
    {
      uint64_t v14 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100017AC0(a2 + 256);
      }
    }

    close(v10);
    int v10 = open("/dev/null", 2);
    if (v10 < 0)
    {
      uint64_t v18 = (os_log_s *)sub_1000031E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
LABEL_38:
      }
        sub_100017A4C(v18);
LABEL_39:
      gzFile v3 = 0LL;
LABEL_41:
      *(_DWORD *)(a2 + 28) = 0;
      return v3;
    }
  }

  gzFile v3 = gzdopen(v10, "ab");
  if (!v3)
  {
    close(v10);
    goto LABEL_41;
  }

  if (a3) {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 48));
  }
  if (*(_DWORD *)(a2 + 252)) {
    goto LABEL_48;
  }
  int v15 = *(_DWORD *)(a2 + 32);
  uint64_t v16 = *(int *)(a2 + 36);
  if (v15 >= (int)v16)
  {
    uint64_t v20 = calloc(v16 + 100, 8uLL);
    if (!v20) {
      goto LABEL_48;
    }
    uint64_t v17 = v20;
    ssize_t v21 = *(const void **)(a2 + 40);
    if (v21)
    {
      memcpy(v20, v21, 8LL * *(int *)(a2 + 36));
      free(*(void **)(a2 + 40));
    }

    *(void *)(a2 + 40) = v17;
    int v15 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 36) += 100;
  }

  else
  {
    uint64_t v17 = *(void **)(a2 + 40);
  }

  v17[v15] = v7;
  *(_DWORD *)(a2 + 32) = v15 + 1;
LABEL_48:
  if (a3) {
    pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
  }
  return v3;
}

uint64_t sub_100012A0C()
{
  return 2LL;
}

uint64_t sub_100012A74(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)a1 + 32LL);
  unint64_t v3 = *(void *)(*(void *)a2 + 32LL);
  BOOL v4 = v2 > v3;
  if (v2 >= v3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 1LL;
  }
  else {
    return v5;
  }
}

char *sub_100012A94(const char *a1)
{
  unint64_t v2 = (char *)malloc(0x400uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    if (a1 && *a1)
    {
      BOOL v4 = &a1[strlen(a1) - 1];
      while (v4 > a1)
      {
        int v5 = *(unsigned __int8 *)v4--;
        if (v5 != 47)
        {
          while (v4 > a1)
          {
            int v6 = *(unsigned __int8 *)v4--;
            if (v6 == 47)
            {
              ++v4;
              goto LABEL_13;
            }
          }

          goto LABEL_19;
        }
      }

LABEL_13:
      unint64_t v7 = v4 - a1;
      if (v4 == a1)
      {
LABEL_19:
        if (*a1 == 47) {
          char v11 = 47;
        }
        else {
          char v11 = 46;
        }
        char *v3 = v11;
        v3[1] = 0;
        return v3;
      }

      unsigned int v8 = (unsigned __int8 *)(v4 - 1);
      do
      {
        unint64_t v9 = v7;
        int v10 = *v8--;
        --v7;
      }

      while (v10 == 47);
      if (v9 < 0x400)
      {
        __memcpy_chk(v3, a1, v9, 1024LL);
        v3[v9] = 0;
      }

      else
      {
        *__error() = 63;
        free(v3);
        return 0LL;
      }
    }

    else
    {
      *(_WORD *)unint64_t v2 = 46;
    }
  }

  return v3;
}

void sub_100012BA4(id a1)
{
  qword_1000228E0 = (uint64_t)dispatch_semaphore_create(8LL);
}

uint64_t sub_100012BC4( unsigned int *a1, size_t *a2, const char **a3, unsigned int *a4, unsigned int *a5, void *a6, void *a7, unsigned int *a8)
{
  uint64_t v8 = a1[354];
  unint64_t v9 = a8;
  if ((*(_DWORD *)(*(void *)a1 + 188LL) & 0x100) != 0)
  {
    size_t v15 = *a2;
    uint64_t v16 = *a3;
  }

  else
  {
    size_t v15 = *a2;
    uint64_t v16 = *a3;
    if ((_DWORD)v8)
    {
      uint64_t v17 = (v8 - 1);
      uint64_t v18 = *(const char **)&a1[2 * v17 + 258];
      if (!strncmp(v18, v16, v15))
      {
        int v25 = v18[v15 - 1];
        unint64_t v9 = a8;
        if (!v25)
        {
          uint64_t result = 0LL;
          a1[v17 + 66] |= *a4;
          *(void *)&a1[2 * a1[354] + 96] = *a6;
          return result;
        }
      }

      else
      {
        unint64_t v9 = a8;
      }
    }
  }

  *(void *)&a1[2 * v8 + 2] = v15;
  a1[v8 + 66] = *a4;
  uint64_t v19 = a1[354];
  *(void *)&a1[2 * v19 + 98] = *a6;
  a1[v19 + 322] = *a5;
  uint64_t v20 = strdup(v16);
  uint64_t v21 = a1[354];
  *(void *)&a1[2 * v21 + 258] = v20;
  *(void *)&a1[2 * v21 + 162] = *a7;
  a1[v21 + 226] = *v9;
  uint64_t v22 = a1[354];
  if (*(void *)&a1[2 * v22 + 258])
  {
    uint64_t result = 0LL;
  }

  else if (*a3)
  {
    uint64_t result = 12LL;
  }

  else
  {
    uint64_t result = 0LL;
  }

  unsigned int v24 = v22 + 1;
  a1[354] = v24;
  if (v24 >= 0x20) {
    return sub_100012D70((uint64_t)a1);
  }
  return result;
}

uint64_t sub_100012D70(uint64_t a1)
{
  if ((*(_DWORD *)(*(void *)a1 + 188LL) & 1) != 0)
  {
    unint64_t v2 = (os_log_s *)sub_1000031E4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100017BE8();
    }
    sub_10000FE5C(*(void *)a1);
  }

  uint64_t v3 = *(unsigned int *)(a1 + 1416);
  if ((_DWORD)v3)
  {
    uint64_t v4 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 208LL))( *(void *)(*(void *)a1 + 216LL),  v3,  a1 + 8,  a1 + 1032,  a1 + 264,  a1 + 1288,  a1 + 392,  a1 + 648,  a1 + 904);
    uint64_t v5 = v4;
    if ((_DWORD)v4)
    {
      uint64_t v6 = *(void *)a1;
      if ((_DWORD)v4 == 268435459) {
        *(_DWORD *)(v6 + 188) |= 2u;
      }
      if ((*(_DWORD *)(v6 + 188) & 2) == 0)
      {
        *(_DWORD *)(v6 + 188) |= 1u;
        unint64_t v7 = (os_log_s *)sub_1000031E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v11 = *(_DWORD *)(a1 + 1416);
          int v12 = *(_DWORD *)(*(void *)a1 + 248LL);
          *(_DWORD *)statfs buf = 136315906;
          uint64_t v14 = "client_buffer_flush";
          __int16 v15 = 1024;
          int v16 = v11;
          __int16 v17 = 1024;
          int v18 = v12;
          __int16 v19 = 1024;
          int v20 = v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: failed to send %u events to client pid: %d (status: %d)",  buf,  0x1Eu);
        }
      }
    }

    if (*(_DWORD *)(a1 + 1416))
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = a1 + 1032;
      do
      {
        free(*(void **)(v9 + 8 * v8));
        *(void *)(v9 + 8 * v8++) = 0LL;
      }

      while (v8 < *(unsigned int *)(a1 + 1416));
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *(_DWORD *)(a1 + 1416) = 0;
  return v5;
}

uint64_t sub_100012F28(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 8) + 1000000LL * *(void *)a1;
  do
    unsigned int v2 = __ldaxr(&dword_10002071C);
  while (__stlxr(v2 + 1, &dword_10002071C));
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  do
  {
    uint64_t v5 = xmmword_100020758[v3];
    if (!v5 || (*(_DWORD *)(v5 + 188) & 2) != 0) {
      goto LABEL_28;
    }
    uint64_t v6 = *(void *)(v5 + 144);
    if ((*(_DWORD *)(v5 + 188) & 4) != 0)
    {
      unint64_t v8 = *(void *)(v5 + 176);
      unint64_t v7 = v1 - v6;
    }

    else if (!v6 || ((unint64_t v7 = v1 - v6, v8 = *(void *)(v5 + 176), v8 >= 0x3E8) ? (v9 = v7 >= 2 * v8) : (v9 = 0), v9))
    {
      *(void *)(v5 + 144) = v1;
LABEL_19:
      if (*(_DWORD *)(v5 + 240) != *(_DWORD *)(v5 + 244)
        && v4 - 1 >= (unint64_t)(*(void *)(v5 + 176) - v1 + *(void *)(v5 + 144)))
      {
        uint64_t v4 = *(void *)(v5 + 176) - v1 + *(void *)(v5 + 144);
      }

      goto LABEL_22;
    }

    if (*(_DWORD *)(v5 + 240) != *(_DWORD *)(v5 + 244))
    {
      *(void *)(v5 + 144) = v1;
      sub_100007658(v5);
    }

LABEL_28:
    ++v3;
  }

  while (v3 != 512);
  do
    unsigned int v12 = __ldaxr(&dword_10002071C);
  while (__stlxr(v12 - 1, &dword_10002071C));
  return v4;
}

void *sub_1000131C8(void *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v3 = v2;
  if ((*(_DWORD *)(a1[4] + 188LL) & 0x20) != 0)
  {
    xpc_dictionary_set_string(v2, "metric_type", "global");
    xpc_dictionary_set_int64(v3, "resident_size", a1[6]);
    xpc_dictionary_set_int64(v3, "virtual_size", a1[5]);
    xpc_dictionary_set_int64(v3, "string_table_count", qword_100021850);
    xpc_dictionary_set_int64(v3, "event_id", qword_1000206D0[dword_1000206E0] - *(void *)(a1[4] + 160LL));
    int64_t v5 = dword_100020720;
    uint64_t v6 = "num_clients";
  }

  else
  {
    xpc_dictionary_set_string(v2, "metric_type", "client");
    uint64_t v4 = sub_100009940(*(_DWORD *)(a1[4] + 248LL));
    xpc_dictionary_set_string(v3, "client_name", v4);
    xpc_dictionary_set_int64(v3, "client_pid", *(int *)(a1[4] + 248LL));
    xpc_dictionary_set_int64(v3, "num_paths", *(int *)(a1[4] + 128LL));
    int64_t v5 = *(void *)(a1[4] + 296LL);
    uint64_t v6 = "allocated_bytes";
  }

  xpc_dictionary_set_int64(v3, v6, v5);
  return v3;
}

void sub_100013324(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100013330( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100013340(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001334C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100013360(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_10001338C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

_BYTE *sub_100013398(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

  ;
}

  ;
}

void sub_1000133C0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_100013400(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

char *sub_10001340C(int *a1)
{
  return strerror(*a1);
}

void sub_100013414( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

int *sub_100013424()
{
  return __error();
}

  ;
}

void sub_100013434(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1000134A4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

double sub_1000134B0()
{
  return 2.0542726e-289;
}

  ;
}

  ;
}

void sub_1000134F0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000134FC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

int *sub_100013568@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 24) = a1;
  return __error();
}

char *sub_100013570@<X0>(int __errnum@<W0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return strerror(__errnum);
}

  ;
}

  ;
}

uint64_t sub_1000135A0( int a1, mach_msg_timeout_t timeout, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  uint64_t v15 = a4;
  int v16 = 16777472;
  int v17 = 4 * a5;
  uint64_t v18 = a6;
  int v19 = 16777472;
  int v20 = 4 * a7;
  uint64_t v21 = a8;
  int v22 = 16777472;
  int v23 = 8 * a9;
  uint64_t v24 = a10;
  int v25 = 16777472;
  int v26 = a11;
  NDR_record_t v27 = NDR_record;
  int v28 = a3;
  int v29 = a5;
  int v30 = a7;
  int v31 = a9;
  int v32 = a11;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100019250;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)msg, 17, 0x78u, 0, 0, timeout, 0);
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(mach_task_self_, *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v12;
}

uint64_t sub_1000136B8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

void sub_1000136F8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 5 || *(_DWORD *)(a1 + 4) != 160)
  {
    int v3 = -304;
    goto LABEL_17;
  }

  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(_BYTE *)(a1 + 51) != 1
    || *(_BYTE *)(a1 + 67) != 1
    || *(_BYTE *)(a1 + 83) != 1
    || *(_BYTE *)(a1 + 99) != 1
    || *(_DWORD *)(a1 + 120) != *(_DWORD *)(a1 + 52) >> 2
    || *(_DWORD *)(a1 + 68) != *(_DWORD *)(a1 + 124)
    || *(_DWORD *)(a1 + 132) != *(_DWORD *)(a1 + 84) >> 2
    || *(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 136))
  {
    int v3 = -300;
    goto LABEL_17;
  }

  uint64_t v2 = a1 + 160;
  if (*(_DWORD *)(a1 + 160) || *(_DWORD *)(a1 + 164) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = (mach_port_name_t *)(a2 + 28);
  *(void *)(a2 + 32) = 0x14000000000000LL;
  int v6 = *(_DWORD *)(a1 + 12);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = *(_DWORD *)(a1 + 112);
  unsigned int v9 = *(_DWORD *)(a1 + 116);
  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = *(_DWORD *)(a1 + 52) >> 2;
  uint64_t v12 = *(const void **)(a1 + 56);
  unsigned int v13 = *(_DWORD *)(a1 + 68);
  unsigned int v14 = *(_DWORD *)(a1 + 128);
  uint64_t v15 = *(unsigned int **)(a1 + 72);
  int v16 = *(_DWORD *)(a1 + 84) >> 2;
  uint64_t v17 = *(void *)(a1 + 88);
  unsigned int v18 = *(_DWORD *)(a1 + 100);
  uint64_t v19 = *(void *)(a1 + 140);
  int v20 = *(_DWORD *)(a1 + 148);
  uint64_t v21 = *(void *)(a1 + 152);
  __int128 v22 = *(_OWORD *)(v2 + 36);
  v25[0] = *(_OWORD *)(v2 + 20);
  v25[1] = v22;
  int v23 = sub_1000036FC(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v4, v25);
  mig_deallocate(*(void *)(a1 + 88), *(unsigned int *)(a1 + 100));
  *(void *)(a1 + 88) = 0LL;
  *(_DWORD *)(a1 + 100) = 0;
  mig_deallocate(*(void *)(a1 + 72), *(unsigned int *)(a1 + 84));
  *(void *)(a1 + 72) = 0LL;
  *(_DWORD *)(a1 + 84) = 0;
  mig_deallocate(*(void *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(void *)(a1 + 56) = 0LL;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 40) = 0LL;
  *(_DWORD *)(a1 + 52) = 0;
  if (v23)
  {
    *(_DWORD *)(a2 + 32) = v23;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 40;
    *(_DWORD *)(a2 + 24) = 1;
  }

_DWORD *sub_100013920(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100003B60(result[3], (void *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100013998(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100003BEC(result[3], result[8], (char *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 72;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_100013A18(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100003BD0(result[3], (void *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100013A90(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = sub_100003C0C( *(unsigned int *)(result + 12),  *(_DWORD *)(result + 32),  *(void *)(result + 36),  (uint64_t *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100013B14(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 7u)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }

  uint64_t result = sub_100003C30( *(unsigned int *)(result + 12),  *(_DWORD *)(result + 32),  *(void *)(result + 36),  (int *)(a2 + 36),  *(void *)(result + 56));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *sub_100013BB8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100003C74(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100013C10(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 66007) >= 0xFFFFFFF9
    && (int64_t v5 = (void (*)(void))*(&off_10001C800 + 5 * (v4 - 66000) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_100013CA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013D14(int a1, int a2, os_log_t log)
{
  if (dword_100020250 == a1) {
    int v3 = "public";
  }
  else {
    int v3 = "private";
  }
  int v4 = 136315394;
  int64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "f2d: ERROR: dispatch_mig_server(%s) => %d",  (uint8_t *)&v4,  0x12u);
  sub_100003D0C();
}

void sub_100013DB4(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "fseventsd_mach_channel_handler";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: unhandled dispatch_mach_reason[%lu]",  (uint8_t *)&v2,  0x16u);
  sub_100003D0C();
}

void sub_100013E38(mach_error_t a1, uint64_t a2, os_log_s *a3)
{
  int v5 = 136315906;
  __int16 v6 = "fseventsd_mach_channel_handler";
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  __int16 v9 = 2080;
  uint64_t v10 = mach_error_string(a1);
  __int16 v11 = 1024;
  mach_error_t v12 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: reason(%lu) ERROR:  %s (%d)",  (uint8_t *)&v5,  0x26u);
}

void sub_100013EFC()
{
  LODWORD(v2) = 136315650;
  sub_100003CF0();
  sub_100003CDC( (void *)&_mh_execute_header,  v0,  v1,  "%s: num_paths(%d) > MAX_NUM_PATHS || num_exclude_paths(%d) > MAX_NUM_PATHS*PATH_MAX",  v2,  v3,  v4);
  sub_100003D0C();
}

void sub_100013F68()
{
  LODWORD(v2) = 136315650;
  sub_100003CF0();
  sub_100003CDC( (void *)&_mh_execute_header,  v0,  v1,  "%s: paths_blobCnt(%d) > MAX_NUM_PATHS*PATH_MAX || exclude_paths_blobCnt(%d)",  v2,  v3,  v4);
  sub_100003D0C();
}

void sub_100013FD4()
{
  LODWORD(v2) = 136315650;
  sub_100003CF0();
  sub_100003CDC( (void *)&_mh_execute_header,  v0,  v1,  "%s: exclude_path_offsets[%d] > exclude_paths_blobCnt(%d)",  v2,  v3,  v4);
  sub_100003D0C();
}

void sub_100014040( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003D6C((void *)&_mh_execute_header, a1, a3, "%s: clientp = add_client() => NULL", a5, a6, a7, a8, 2u);
  sub_100003D0C();
}

void sub_1000140B0()
{
  sub_100003D14((void *)&_mh_execute_header, v0, v1, "%s: implementation_added_client() => %d", v2, v3, v4, v5, 2u);
  sub_100003D0C();
}

void sub_10001411C()
{
  sub_100003D14((void *)&_mh_execute_header, v0, v1, "%s: set_exclusion_paths() => %d", v2, v3, v4, v5, 2u);
  sub_100003D0C();
}

void sub_100014188(mach_error_t a1)
{
  sub_100003D58( (void *)&_mh_execute_header,  v1,  v2,  "%s: ERROR: mach_port_request_notification() => %s (%d)",  v3,  v4,  v5,  v6,  2u);
  sub_100003D7C();
}

void sub_100014204(mach_error_t a1)
{
  sub_100003D58((void *)&_mh_execute_header, v1, v2, "%s: ERROR: mach_port_allocate() => %s (%d)", v3, v4, v5, v6, 2u);
  sub_100003D7C();
}

void sub_100014280()
{
  LODWORD(v2) = 136315650;
  sub_100003CF0();
  sub_100003CDC((void *)&_mh_execute_header, v0, v1, "%s: path_offsets[%d] > paths_blobCnt(%d)", v2, v3, v4);
  sub_100003D0C();
}

void sub_1000142EC()
{
  LODWORD(v2) = 136315650;
  sub_100003CF0();
  sub_100003CDC( (void *)&_mh_execute_header,  v0,  v1,  "%s: num_exclude_paths(%d) != exclude_path_offsetsCnt(%d)",  v2,  v3,  v4);
  sub_100003D0C();
}

void sub_100014358()
{
  LODWORD(v2) = 136315650;
  sub_100003CF0();
  sub_100003CDC((void *)&_mh_execute_header, v0, v1, "%s: num_paths(%d) != path_offsetsCnt(%d)", v2, v3, v4);
  sub_100003D0C();
}

void sub_1000143C4()
{
  sub_100003D14( (void *)&_mh_execute_header,  v0,  v1,  "%s: ERROR: get_client_with_matching_f2d_private_port(0x%x) => NULL",  v2,  v3,  v4,  v5,  2u);
  sub_100003D0C();
}

void sub_100014430()
{
  sub_100003D14( (void *)&_mh_execute_header,  v0,  v1,  "%s: ERROR: get_client_with_matching_f2d_private_port(0x%x) => NULL",  v2,  v3,  v4,  v5,  2u);
  sub_100003D0C();
}

void sub_10001449C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003D6C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp = malloc() failed", a5, a6, a7, a8, 2u);
  sub_100003D0C();
}

void sub_10001450C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003D6C( (void *)&_mh_execute_header,  a1,  a3,  "%s: ERROR: clientp->paths_blob = malloc() failed",  a5,  a6,  a7,  a8,  2u);
  sub_100003D0C();
}

void sub_10001457C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003D6C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp->paths = malloc() failed", a5, a6, a7, a8, 2u);
  sub_100003D0C();
}

void sub_1000145EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001465C(int a1, mach_error_t error_value)
{
  sub_1000047A8( (void *)&_mh_execute_header,  v2,  v3,  "%s: f2d_private_source cancel: ERROR: mach_port_mod_refs(0x%x, MACH_PORT_RIGHT_RECEIVE, -1) => %s (%d)",  v4,  v5,  v6,  v7,  2u);
  sub_1000047BC();
}

void sub_1000146E8(uint64_t a1, int *a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *a2;
  int v5 = 134218496;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  sub_10000479C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "dealloc_client: DANGER: clientp %p (%p) has refcount %d",  (uint8_t *)&v5);
}

void sub_100014778(int a1, mach_error_t error_value)
{
  sub_1000047A8( (void *)&_mh_execute_header,  v2,  v3,  "%s: ERROR: mach_port_deallocate(clientp->d2f_port = 0x%x) => %s (%d)",  v4,  v5,  v6,  v7,  2u);
  sub_1000047BC();
}

void sub_100014800( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014870( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003D6C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp == NULL", a5, a6, a7, a8, 2u);
  sub_100003D0C();
}

void sub_1000148E0(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "callback_client";
  __int16 v3 = 2080;
  uint64_t v4 = "j == paths_blob_size";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "fseventsd: %s(): failed assertion '%s'\n",  (uint8_t *)&v1,  0x16u);
  sub_100003D0C();
}

void sub_100014970(mach_error_t a1, os_log_s *a2)
{
  v4[0] = 136315650;
  sub_100003D38();
  sub_10000479C( (void *)&_mh_execute_header,  a2,  v3,  "%s: ERROR: vm_allocate of paths_blob failed: %s (%d)",  (uint8_t *)v4);
  sub_100003D7C();
}

void sub_1000149F4(mach_error_t a1, os_log_s *a2)
{
  v4[0] = 136315650;
  sub_100003D38();
  sub_10000479C( (void *)&_mh_execute_header,  a2,  v3,  "%s: ERROR: vm_allocate of array_of_path_offsets failed: %s (%d)",  (uint8_t *)v4);
  sub_100003D7C();
}

void sub_100014A78(int a1, os_log_s *a2)
{
  int v4 = 136315394;
  uint64_t v5 = "fsevent_rwlock_init";
  sub_1000133B0();
  sub_10001334C((void *)&_mh_execute_header, a2, v3, "%s Unable to create rwlock key [%s]\n", (uint8_t *)&v4);
  sub_100013380();
}

void sub_100014AFC(int a1, os_log_s *a2)
{
  int v4 = 136315394;
  uint64_t v5 = "fsevent_rwlock_init";
  sub_1000133B0();
  sub_10001334C((void *)&_mh_execute_header, a2, v3, "%s Unable to initialize rwlock [%s]\n", (uint8_t *)&v4);
  sub_100013380();
}

void sub_100014B80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014BF0()
{
  __assert_rtn("fsevent_rwlock_unlock", "fseventsd_implementation.c", 231, "*pLockCount != 0");
}

void sub_100014C18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014C88()
{
  __assert_rtn("fsevent_rwlock_rdlock", "fseventsd_implementation.c", 259, "*pLockCount >= 0");
}

void sub_100014CB0(int a1)
{
}

void sub_100014D2C()
{
  __assert_rtn("fsevent_rwlock_wrlock", "fseventsd_implementation.c", 286, "*pLockCount <= 0");
}

void sub_100014D54(int a1)
{
}

void sub_100014DD0(os_log_s *a1)
{
  uint64_t v2 = sub_100013424();
  sub_10001340C(v2);
  sub_1000133D4();
  sub_100013324((void *)&_mh_execute_header, a1, v3, "/dev/fsevents clone failed! (%s)", v4);
  sub_100013380();
}

void sub_100014E44()
{
  v2[0] = 136315394;
  sub_100003D24();
  sub_10001338C((void *)&_mh_execute_header, v0, v1, "%s: No Memory for %d devices", (uint8_t *)v2);
  sub_100003D0C();
}

void sub_100014EB4()
{
}

void sub_100014EE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014F50()
{
  uint64_t v0 = __error();
  sub_10001340C(v0);
  sub_1000133E0();
  sub_100003D58((void *)&_mh_execute_header, v1, v2, "%s: getattrlist failed (%d):[%s]", v3, v4, v5, v6, 2u);
  sub_100003D7C();
}

void sub_100014FD0()
{
  v2[0] = 136315394;
  sub_100013554();
  sub_10001334C((void *)&_mh_execute_header, v0, v1, "%s: could not stat the fs @ %s", (uint8_t *)v2);
  sub_100003D0C();
}

void sub_100015040()
{
}

void sub_1000150B8()
{
  uint64_t v0 = __error();
  sub_10001340C(v0);
  sub_1000133E0();
  sub_100003D58((void *)&_mh_execute_header, v1, v2, "%s: err(%d): [%s]\n", v3, v4, v5, v6, 2u);
  sub_100003D7C();
}

void sub_100015138()
{
}

void sub_1000151A4()
{
}

void sub_100015204()
{
}

void sub_100015264()
{
}

void sub_1000152C4()
{
}

void sub_100015324(uint64_t a1, uint64_t a2)
{
  int v3 = 136315394;
  uint64_t v4 = a2;
  sub_1000133B0();
  sub_10001334C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "log dir %s does not match path %s.  bailing out.",  (uint8_t *)&v3);
  sub_100003D0C();
}

void sub_100015394()
{
  uint64_t v0 = __error();
  sub_10001340C(v0);
  sub_100003D58((void *)&_mh_execute_header, v1, v2, "failed to make the directory %s (%d/%s)", v3, v4, v5, v6, 2u);
  sub_1000047BC();
}

void sub_10001542C()
{
}

void sub_100015490( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015500( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015570()
{
}

void sub_10001559C()
{
}

void sub_1000155FC()
{
}

void sub_100015678()
{
}

void sub_1000156DC()
{
}

void sub_10001573C()
{
}

void sub_100015768(int *a1, os_log_s *a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = 512;
  sub_100013400((void *)&_mh_execute_header, a2, a3, "too many clients for pid %d (limit %d)", (uint8_t *)v4);
  sub_100003D0C();
}

void sub_1000157E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015850( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000158BC()
{
}

void sub_1000158E4()
{
}

void sub_10001590C()
{
}

void sub_100015938()
{
}

void sub_1000159A8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_100013360((void *)&_mh_execute_header, v0, v1, "remove_event_ref: event @ %p had bogus refcount %d", v2, v3) = 2048;
  *(void *)((char *)&v3 + 2) = a1;
  sub_100013360( (void *)&_mh_execute_header,  a2,  a3,  "consumer thread: bad ref count %d on entry %p",  67109376,  (const void *)v3);
  sub_100003D0C();
}

void sub_100015A18(uint64_t a1, _DWORD *a2, os_log_s *a3)
{
  LOWORD(sub_100013360((void *)&_mh_execute_header, v0, v1, "remove_event_ref: event @ %p had bogus refcount %d", v2, v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *a2;
  sub_1000133C0( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "event table has grown too large. (filled %d / mask 0x%x)",  67109376,  v3);
  sub_100003D0C();
}

void sub_100015A90()
{
}

void sub_100015ABC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015B2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015B9C()
{
  v3[0] = 136315650;
  sub_100003D24();
  __int16 v4 = v0;
  int v5 = v1;
  sub_100013434( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "%s: empty path table index(%d)  with device id(%d) - skipping \n",  (uint8_t *)v3);
  sub_100003D0C();
}

void sub_100015C18(_BYTE *a1, _BYTE *a2)
{
}

void sub_100015C44(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = -1LL;
  sub_100013324((void *)&_mh_execute_header, a3, (uint64_t)a3, "1: event id's wrapping to zero! (0x%llx)", a1);
}

void sub_100015C84(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = -1LL;
  sub_100013324((void *)&_mh_execute_header, a3, (uint64_t)a3, "2: event id's wrapping to zero! (0x%llx)", a1);
}

void sub_100015CC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003D6C( (void *)&_mh_execute_header,  a1,  a3,  "%s: ERROR: CFDictionaryCreateMutable() => NULL\n",  a5,  a6,  a7,  a8,  2u);
  sub_100003D0C();
}

void sub_100015D34(_BYTE *a1, _BYTE *a2)
{
}

void sub_100015D60(_BYTE *a1, _BYTE *a2)
{
}

void sub_100015D8C(_BYTE *a1, _BYTE *a2)
{
}

void sub_100015DB8(_BYTE *a1, _BYTE *a2)
{
}

void sub_100015DE4(const __CFString *a1, os_log_s *a2)
{
}

void sub_100015E60()
{
  uint64_t v5 = v0;
  __int16 v6 = 1024;
  int v7 = v1;
  sub_100013434( (void *)&_mh_execute_header,  v2,  v3,  "fseventsd internal state [num_clients: %d, current_event_id: 0x%llx string_table_count[%d]\n",  v4);
  sub_100003D0C();
}

void sub_100015EFC()
{
}

void sub_100015F8C()
{
}

void sub_100016014(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "check_vol_last_mod_time: failed to get last mtime (%d)\n",  (uint8_t *)v3,  8u);
  sub_100003D0C();
}

void sub_10001609C()
{
  uint64_t v4 = v1;
  sub_10001338C( (void *)&_mh_execute_header,  v0,  v2,  "check_vol_last_mod_time:XXX failed to get mount time (%d; &mount_time == %p)\n",
    v3);
  sub_100013380();
}

void sub_100016114()
{
}

void sub_100016194(uint64_t a1)
{
  int v2 = 136315394;
  uint64_t v3 = a1;
  sub_10001350C();
  sub_10001334C((void *)&_mh_execute_header, v1, (uint64_t)v1, "log dir: %s getting new uuid: %s", (uint8_t *)&v2);
  sub_100003D0C();
}

void sub_100016208()
{
}

void sub_100016268()
{
}

void sub_1000162C8()
{
}

void sub_100016348()
{
}

void sub_1000163A8()
{
  int v2 = 136315394;
  uint64_t v3 = "get_last_event_id";
  sub_1000133B0();
  sub_10001334C( (void *)&_mh_execute_header,  v0,  v1,  "%s: malformed history archive - header too small - (%s)\n",  (uint8_t *)&v2);
  sub_100003D0C();
}

void sub_10001641C(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013324((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - > PATH_MAX \n", a1);
}

void sub_100016460(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013324( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: malformed history file - DLS_EVENTID_SIZE truncated",  a1);
}

void sub_1000164A4(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013324( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: malformed history file - DLS_EVENTMASK_SIZE truncated",  a1);
}

void sub_1000164E8(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013324( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: malformed history file - DLS_FILEID_SIZE+DLS_DOCID_SIZE truncated",  a1);
}

void sub_10001652C(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100013324( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: malformed history file - DLS_FILEID_SIZE truncated",  a1);
}

void sub_100016570()
{
  int v2 = sub_100013424();
  sub_10001340C(v2);
  int v4 = 136315394;
  uint64_t v5 = v1;
  sub_1000133B0();
  sub_10001334C((void *)&_mh_execute_header, v0, v3, "could not open <<%s>> (%s)\n", (uint8_t *)&v4);
  sub_100013380();
}

void sub_1000165EC()
{
}

void sub_100016650(uint64_t a1, int a2, os_log_s *a3)
{
  int v6 = *sub_100013424();
  v8[0] = 67109634;
  v8[1] = a2;
  __int16 v9 = 1024;
  int v10 = v6;
  __int16 v11 = 2080;
  uint64_t v12 = a1 + 256;
  sub_100013434( (void *)&_mh_execute_header,  a3,  v7,  "disk logger: gzclose() failed (%d/%d) removing all old log files in %s",  (uint8_t *)v8);
  sub_10001342C();
}

void sub_1000166F8()
{
}

void sub_10001675C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = a2 + 1280;
  uint8_t v6 = __error();
  int v8 = 134218498;
  uint64_t v9 = v4;
  __int16 v10 = 2080;
  uint64_t v11 = v5;
  __int16 v12 = 2080;
  unsigned int v13 = sub_10001340C(v6);
  sub_1000134A4( (void *)&_mh_execute_header,  a3,  v7,  "disk logger: failed to write %zu bytes to log file %s (err: %s).",  (uint8_t *)&v8);
  sub_1000047BC();
}

void sub_1000167F8()
{
  sub_100013360((void *)&_mh_execute_header, v0, v1, "gzflush(%s) returned %d", v2, v3);
  sub_100003D0C();
}

void sub_100016860(_BYTE *a1, _BYTE *a2)
{
}

void sub_10001688C(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000168B8()
{
}

void sub_1000168E4()
{
  __assert_rtn("client_process_events", "fseventsd_implementation.c", 4327, "me->pid != 0");
}

void sub_10001690C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016974()
{
}

void sub_1000169E4()
{
}

void sub_100016A10()
{
  uint64_t v2 = sub_100013424();
  sub_10001340C(v2);
  int v4 = 136315394;
  uint64_t v5 = v1;
  sub_1000133B0();
  sub_10001334C((void *)&_mh_execute_header, v0, v3, "unmounting: failed to remove log dir %s (%s)", (uint8_t *)&v4);
  sub_100013380();
}

void sub_100016A8C()
{
}

void sub_100016AB8()
{
}

void sub_100016B18()
{
}

void sub_100016B90()
{
}

void sub_100016BF0()
{
  int v2 = 136315394;
  uint64_t v3 = "read_disk_log";
  sub_1000133B0();
  sub_10001334C( (void *)&_mh_execute_header,  v0,  v1,  "%s: malformed history archive - header too small - (%s)\n",  (uint8_t *)&v2);
  sub_100003D0C();
}

void sub_100016C64( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016CCC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016D3C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016DAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016E1C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016E8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016EFC()
{
}

void sub_100016F5C()
{
  sub_1000134FC( (void *)&_mh_execute_header,  v0,  v1,  "process_disk_event_buf: magic is wrong (0x%.8x != (0x%.8x <OR> 0x%.8x <OR> 0x%.8x))",  v2,  v3,  v4,  v5,  v6);
  sub_1000133A8();
}

void sub_100016FDC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001704C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_1000133C0( (void *)&_mh_execute_header,  v0,  v1,  "process_disk_event_buf: checksum mis-match: file 0x%.8x, calculated 0x%.8x",  v2, v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *(_DWORD *)(a1 + 248);
  sub_1000133C0((void *)&_mh_execute_header, a2, a3, "failed sending HISTORY_DONE (%d) to pid %d\n", 67109376, v3);
  sub_100003D0C();
}

void sub_1000170C0()
{
}

void sub_1000170EC(int a1)
{
}

void sub_100017164( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000171D4()
{
}

void sub_100017200()
{
}

void sub_10001722C()
{
}

void sub_100017258()
{
}

void sub_100017284(os_log_s *a1)
{
  uint64_t v2 = sub_100013424();
  sub_10001340C(v2);
  sub_1000133D4();
  sub_100013324((void *)&_mh_execute_header, a1, v3, "Could not access /dev/fsevents. (%s)", v4);
  sub_100013380();
}

void sub_1000172F8()
{
}

void sub_100017324(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a1 - 0x8000;
  sub_100013400( (void *)&_mh_execute_header,  a2,  a3,  "serialized_client_state_size is %dKB and is (%d)KB greater than the MAX_STATEDUMP_SIZE",  (uint8_t *)v3);
  sub_100003D0C();
}

void sub_10001739C()
{
}

void sub_1000173C8(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000173F4(_BYTE *a1, _BYTE *a2)
{
}

void sub_100017420( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017490()
{
  v2[0] = 136315394;
  sub_100013554();
  sub_10001334C((void *)&_mh_execute_header, v0, v1, "%s : failed to add client for path %s", (uint8_t *)v2);
  sub_100003D0C();
}

void sub_100017504(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = **(void **)(a1 + 24);
  int v4 = 136315650;
  uint64_t v5 = "implementation_removed_client";
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v3;
  sub_1000134A4((void *)&_mh_execute_header, a2, a3, "%s: did not find client %p for path = '%s'", (uint8_t *)&v4);
  sub_1000133A8();
}

void sub_100017594()
{
}

void sub_1000175BC()
{
}

void sub_1000175E8()
{
}

void sub_100017614()
{
}

void sub_100017640()
{
}

void sub_10001766C()
{
}

void sub_1000176CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001773C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000177AC()
{
  v2[0] = 136315394;
  sub_100003D24();
  sub_10001338C((void *)&_mh_execute_header, v0, v1, "%s: Error: %d, restarting vfs events", (uint8_t *)v2);
  sub_100003D0C();
}

void sub_10001781C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001788C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000178FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001796C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000179DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017A4C(os_log_s *a1)
{
  int v2 = sub_100013424();
  sub_10001340C(v2);
  sub_1000133D4();
  sub_100013324((void *)&_mh_execute_header, a1, v3, "disk logger: can't even open /dev/null? (%s)", v4);
  sub_100013380();
}

void sub_100017AC0(uint64_t a1)
{
  int v2 = 136315394;
  uint64_t v3 = a1;
  sub_10001350C();
  sub_10001334C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "disk logger: my log dir moved! (should be: %s but is: %s).",  (uint8_t *)&v2);
  sub_100003D0C();
}

void sub_100017B34()
{
  uint64_t v3 = __error();
  sub_10001340C(v3);
  int v6 = 136315650;
  uint64_t v7 = v2;
  sub_1000133B0();
  __int16 v8 = v4;
  uint64_t v9 = v1;
  sub_1000134A4( (void *)&_mh_execute_header,  v0,  v5,  "disk logger: failed to open output file %s (%s). mount point %s",  (uint8_t *)&v6);
  sub_1000047BC();
}

void sub_100017BC0()
{
}

void sub_100017BE8()
{
  int v2 = 136315650;
  uint64_t v3 = "client_buffer_flush";
  sub_1000134C8();
  sub_10000479C( (void *)&_mh_execute_header,  v0,  v1,  "%s: sending client(%p) USER DROPPED event to pid %d\n",  (uint8_t *)&v2);
  sub_1000133A8();
}