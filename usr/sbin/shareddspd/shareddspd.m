LABEL_14:
}

__objc2_prot_list *sub_100003834()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100008108);
  v1 = &SharedDSPServer__metaData;
  if ((v0 & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_100008108);
    v1 = &SharedDSPServer__metaData;
    if (v3)
    {
      qword_100008100 = (uint64_t)os_log_create("com.apple.coreaudio", "IsolatedCoreAudioSharedDSPd");
      __cxa_guard_release(&qword_100008108);
      v1 = &SharedDSPServer__metaData;
    }
  }

  return v1[3].base_prots;
}

void sub_1000038F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void start()
{
  unsigned __int8 v0 = sub_100003834();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "main.mm";
    __int16 v7 = 1024;
    int v8 = 58;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Launching shareddspd!",  (uint8_t *)&v5,  0x12u);
  }

  v2 = objc_autoreleasePoolPush();
  int v3 = objc_alloc_init(&OBJC_CLASS___SharedDSPServer);
  v4 = (void *)qword_1000080F0;
  qword_1000080F0 = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
  dispatch_main();
}

uint64_t sub_1000039D8()
{
  uint64_t v3 = 0LL;
  v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = qword_100008110;
  uint64_t v6 = qword_100008110;
  if (!qword_100008110)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_100003A84;
    v2[3] = &unk_100004110;
    v2[4] = &v3;
    sub_100003A84((uint64_t)v2);
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100003A6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_100003A84(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_1000080F8)
  {
    __int128 v6 = off_1000040F0;
    uint64_t v7 = 0LL;
    qword_1000080F8 = _sl_dlopen(&v6, &v5);
    uint64_t v3 = v5;
    v2 = (void *)qword_1000080F8;
    if (qword_1000080F8)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  v2 = (void *)qword_1000080F8;
LABEL_5:
  result = dlsym(v2, "CreateIsolatedAudioSiphonPortal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_100008110 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100003B74()
{
  uint64_t v0 = dlerror();
  v1 = (const void *)abort_report_np("%s", v0);
  _Block_object_dispose(v1, v2);
}

id objc_msgSend_CreateSharedDSPService(void *a1, const char *a2, ...)
{
  return [a1 CreateSharedDSPService];
}