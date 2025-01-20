int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  void v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  v7 = 0LL;
  v8 = &v7;
  v9 = 0x2050000000LL;
  v3 = (void *)qword_100008008;
  v10 = qword_100008008;
  if (!qword_100008008)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100003D28;
    v6[3] = &unk_100004068;
    v6[4] = &v7;
    sub_100003D28((uint64_t)v6);
    v3 = (void *)v8[3];
  }

  v4 = v3;
  _Block_object_dispose(&v7, 8);
  [v4 runAsXPCService];
  return 0;
}

void sub_100003D10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100003D28(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_100008010)
  {
    __int128 v4 = off_100004088;
    uint64_t v5 = 0LL;
    qword_100008010 = _sl_dlopen(&v4, &v3);
    if (!qword_100008010)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100003E1C();
    }

    if (v3) {
      free(v3);
    }
  }

  Class result = objc_getClass("_EXService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_8;
  }
  qword_100008008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100003E1C()
{
  v0 = (const void *)abort_report_np("Unable to find class %s", "_EXService");
  _Block_object_dispose(v0, v1);
}

id objc_msgSend_runAsXPCService(void *a1, const char *a2, ...)
{
  return [a1 runAsXPCService];
}