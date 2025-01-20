void sub_100001FDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v4 = *(void *)&argc;
  v5 = objc_alloc_init(&OBJC_CLASS____NSAttributedStringAgentService);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_NSAttributedStringAgentService sharedApplication]( &OBJC_CLASS____NSAttributedStringAgentService,  "sharedApplication"));
  [v6 setDelegate:v5];

  -[_NSAttributedStringAgentService start](v5, "start");
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  v7 = off_100008868;
  v14 = off_100008868;
  if (!off_100008868)
  {
    v8 = (void *)sub_100002328();
    v7 = dlsym(v8, "UIApplicationMain");
    v12[3] = (uint64_t)v7;
    off_100008868 = v7;
  }

  _Block_object_dispose(&v11, 8);
  if (!v7) {
    sub_100002F28();
  }
  int v9 = ((uint64_t (*)(uint64_t, const char **, const __CFString *, void))v7)( v4,  argv,  @"UIApplication",  0LL);

  return v9;
}

void sub_1000022BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class sub_1000022D4(uint64_t a1)
{
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_100002F48();
  }
  qword_100008858 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_100002328()
{
  v3 = 0LL;
  if (!qword_100008860)
  {
    __int128 v4 = off_1000041E8;
    uint64_t v5 = 0LL;
    qword_100008860 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_100008860;
  v1 = v3;
  if (!qword_100008860)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

id sub_10000270C()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_100008870;
  uint64_t v7 = qword_100008870;
  if (!qword_100008870)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100002D44;
    v3[3] = &unk_1000041C8;
    v3[4] = &v4;
    sub_100002D44((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000027A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000027C0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        sandbox_extension_release(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "integerValue", (void)v15));
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_100002904(void *a1, void *a2)
{
  return [a2 loadData:a1[4] MIMEType:@"application/x-webarchive" characterEncodingName:a1[5] baseURL:a1[6]];
}

void sub_100002BE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_100002C00(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        sandbox_extension_release(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "integerValue", (void)v15));
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

Class sub_100002D44(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_100008878)
  {
    __int128 v4 = off_100004278;
    uint64_t v5 = 0LL;
    qword_100008878 = _sl_dlopen(&v4, &v3);
    if (!qword_100008878)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100002F6C();
    }

    if (v3) {
      free(v3);
    }
  }

  Class result = objc_getClass("WKWebView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_8;
  }
  qword_100008870 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void *sub_100002E38(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_100008888)
  {
    __int128 v6 = off_100004290;
    uint64_t v7 = 0LL;
    qword_100008888 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_100008888;
    if (qword_100008888)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  v2 = (void *)qword_100008888;
LABEL_5:
  Class result = dlsym(v2, "_NSReadAttributedStringFromURLOrDataAgent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_100008880 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100002F28()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  sub_100002F48(v1);
}

void sub_100002F48()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "UIApplication");
  sub_100002F6C(v0);
}

void sub_100002F6C()
{
  uint64_t v0 = (const void *)abort_report_np("Unable to find class %s", "WKWebView");
  _Block_object_dispose(v0, v1);
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}