void sub_1000018BC(uint64_t a1)
{
  NSLog(@"MSVXPCTestServer %@ invalidated", *(void *)(a1 + 32));
}

void sub_1000018E8(uint64_t a1)
{
}

void start()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MADXPCDelegate);
  v1 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mediaartworkd.xpc");
  -[NSXPCListener setDelegate:](v1, "setDelegate:", v0);
  -[NSXPCListener resume](v1, "resume");
  dispatch_main();
}

void sub_100001C40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100001E74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100001EE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained
    && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___MSVArtworkServiceColorAnalysisOperation),
        (objc_opt_isKindOfClass(WeakRetained, v3) & 1) != 0))
  {
    id v4 = WeakRetained;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operationError]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 debugMessage]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 colorAnalysis]);

    if (v6)
    {
      id v8 = sub_1000026C8(2);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v23 = v10;
        __int16 v24 = 2114;
        v25 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Artwork color analysis request: %p -- %{public}@",  buf,  0x16u);
      }
    }

    if (v5)
    {
      id v11 = sub_1000026C8(2);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed artwork color analysis request: %p with error: %{public}@",  buf,  0x16u);
      }

      goto LABEL_14;
    }
  }

  else
  {
    v7 = 0LL;
    v6 = 0LL;
  }

  id v14 = sub_1000026C8(2);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Completed artwork color analysis request: %p",  buf,  0xCu);
  }

  v5 = 0LL;
LABEL_14:

  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 8LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100002160;
    block[3] = &unk_100004208;
    id v21 = v16;
    id v19 = v7;
    id v20 = v5;
    dispatch_async(v17, block);
  }
}

uint64_t sub_100002160(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100002174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained
    && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___MSVArtworkServiceOperation),
        (objc_opt_isKindOfClass(WeakRetained, v3) & 1) != 0))
  {
    id v4 = WeakRetained;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operationError]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 debugMessage]);

    if (v6)
    {
      id v7 = sub_1000026C8(2);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v21 = v9;
        __int16 v22 = 2114;
        uint64_t v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Artwork request: %p -- %{public}@",  buf,  0x16u);
      }
    }

    if (v5)
    {
      id v10 = sub_1000026C8(2);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v21 = v12;
        __int16 v22 = 2114;
        uint64_t v23 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed artwork request: %p with error: %{public}@",  buf,  0x16u);
      }

      goto LABEL_14;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v13 = sub_1000026C8(2);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Completed artwork request: %p", buf, 0xCu);
  }

  v5 = 0LL;
LABEL_14:

  uint64_t v15 = *(void **)(a1 + 48);
  if (v15)
  {
    v16 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 8LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000023CC;
    v17[3] = &unk_1000041B8;
    id v19 = v15;
    id v18 = v5;
    dispatch_async(v16, v17);
  }
}

uint64_t sub_1000023CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100002578(uint64_t a1)
{
  id v2 = sub_1000026C8(2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(int *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[MADXPCDelegate] Connection interrupted (pid = %ld)",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_100002620(uint64_t a1)
{
  id v2 = sub_1000026C8(2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(int *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[MADXPCDelegate] Connection invalidated (pid = %ld)",  (uint8_t *)&v5,  0xCu);
  }
}

id sub_1000026C8(int a1)
{
  if (qword_100008BF8 != -1) {
    dispatch_once(&qword_100008BF8, &stru_100004268);
  }
  return (id)qword_100008BD8[a1];
}

void sub_100002718(id a1)
{
  os_log_t v1 = os_log_create("com.apple.amp.mediaartworkd", "Default");
  id v2 = (void *)qword_100008BD8[0];
  qword_100008BD8[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.amp.mediaartworkd", "Default_Oversize");
  uint64_t v4 = (void *)qword_100008BE0;
  qword_100008BE0 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.amp.mediaartworkd", "XPC");
  uint64_t v6 = (void *)qword_100008BE8;
  qword_100008BE8 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.amp.mediaartworkd", "XPC-Oversize");
  id v8 = (void *)qword_100008BF0;
  qword_100008BF0 = (uint64_t)v7;
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuePriority:");
}