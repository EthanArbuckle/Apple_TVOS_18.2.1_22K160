void sub_100002334( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id location, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
  id *v37;
  id *v38;
  uint64_t v39;
  objc_destroyWeak(v38);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1000025D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000026C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000026D0(uint64_t a1)
{
}

void sub_1000026D8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_getNextOSLogEntryWithReply:", *(void *)(a1 + 40)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100002714(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_100002758(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = 32LL;
  if (v5)
  {
    v7 = v5;
  }

  else
  {
    uint64_t v6 = 40LL;
    v7 = v11;
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + v6) + 8LL);
  id v9 = v7;
  v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
}

void sub_1000027C8(uint64_t a1, void *a2)
{
  id v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v8 type] == (id)1024)
  {
    uint64_t v4 = convertEventProxyToEntry(v8);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = (dispatch_queue_s *)WeakRetained[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000029E0;
    block[3] = &unk_1000042B0;
    block[4] = WeakRetained;
    id v10 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }
}

void sub_100002884(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2 != 5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Error invalidation: %d",  buf,  8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (WeakRetained)
  {
    id v5 = (dispatch_queue_s *)WeakRetained[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000029A8;
    block[3] = &unk_100004300;
    block[4] = WeakRetained;
    dispatch_sync(v5, block);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;
}

void sub_1000029A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0LL;
}

void *sub_1000029E0(void *result)
{
  uint64_t v1 = result[4];
  if (!*(_BYTE *)(v1 + 48)) {
    return [*(id *)(v1 + 40) addObject:result[5]];
  }
  return result;
}

id sub_100002A00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setupWithPredicate:reply:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_100002B64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100002B84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void start()
{
  if (!_set_user_dir_suffix("com.apple.OSLogService") || !confstr(65537, v8, 0x400uLL))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    int v0 = *__error();
    int v6 = 67109120;
    int v7 = v0;
    uint64_t v1 = "failed to initialize temporary directory: %{darwin.errno}d";
    goto LABEL_5;
  }

  uint64_t v2 = realpath_DARWIN_EXTSN(v8, 0LL);
  if (v2)
  {
    free(v2);
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
    [v5 setDelegate:v4];
    [v5 resume];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v3 = *__error();
    int v6 = 67109120;
    int v7 = v3;
    uint64_t v1 = "failed to resolve temporary directory: %{darwin.errno}d";
LABEL_5:
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  v1,  (uint8_t *)&v6,  8u);
  }

LABEL_6:
  exit(1);
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}