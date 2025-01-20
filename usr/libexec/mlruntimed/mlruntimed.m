void sub_100001208()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_source_t v8;
  void *v9;
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_10000C3B8(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  signal(15, (void (__cdecl *)(int))1);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  v9 = (void *)qword_10001B398;
  qword_10001B398 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10001B398, &stru_1000145E8);
  dispatch_activate((dispatch_object_t)qword_10001B398);
}

void sub_10000129C(id a1)
{
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10000C3EC(v1, v2, v3, v4, v5, v6, v7, v8);
  }

  xpc_transaction_exit_clean();
}

void start()
{
  if ((_set_user_dir_suffix("com.apple.siri-distributed-evaluation") & 1) != 0)
  {
    id v0 = NSTemporaryDirectory();
    v1 = objc_autoreleasePoolPush();
    uint64_t v2 = objc_opt_new(&OBJC_CLASS___MLRXPCActivityManager);
    -[MLRXPCActivityManager registerIfNeeded](v2, "registerIfNeeded");
    uint64_t v3 = -[MLRListenerDelegate initWithXPCActivityManager:]( objc_alloc(&OBJC_CLASS___MLRListenerDelegate),  "initWithXPCActivityManager:",  v2);
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    uint64_t v5 = -[NSXPCListener initWithMachServiceName:](v4, "initWithMachServiceName:", DESFullServiceName);
    -[NSXPCListener setDelegate:](v5, "setDelegate:", v3);
    -[NSXPCListener resume](v5, "resume");
    if (v2 && v3 && v5)
    {
      sub_100001208();
      objc_autoreleasePoolPop(v1);
      dispatch_main();
    }

    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218496;
      v10 = v2;
      __int16 v11 = 2048;
      v12 = v3;
      __int16 v13 = 2048;
      v14 = v5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "Fail to allocate activityManager=%p, listenerDelegate=%p, listener=%p",  (uint8_t *)&v9,  0x20u);
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = *__error();
      int v9 = 67109120;
      LODWORD(v10) = v7;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "_set_user_dir_suffix failed™: %{darwin.errno}d",  (uint8_t *)&v9,  8u);
    }
  }

  exit(1);
}

void sub_100001484( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_100001764(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100001F34(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 pluginId]);
  v10 = (void *)v9;
  if (v8 && v9)
  {
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Shadow evaluation task for pluginId=%@, evaluation=%@",  (uint8_t *)&v17,  0x16u);
    }

    id v12 = *(id *)(a1 + 32);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v12 setObject:v14 forKeyedSubscript:v10];
    }

    id v15 = [[MLRInternalTrialTask alloc] initWithEvaluationState:v8 runtimeEvaluation:v7];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);
    [v16 addObject:v15];

    if (a4) {
      *a4 = 0;
    }
  }
}
}

void sub_10000215C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000216C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000021A0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Fail to enumerate all shadow evaluation tasks with error=%@.",  (uint8_t *)&v2,  0xCu);
}

void sub_100002214( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002674(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 8LL)) {
    GarbageCollectAllRecords();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100002C94(_Unwind_Exception *a1)
{
}

void sub_100002CC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100004E90(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = (dispatch_queue_s *)WeakRetained[3];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100002D98;
    v15[3] = &unk_100014690;
    v16 = WeakRetained;
    id v17 = v3;
    dispatch_async(v14, v15);
  }
}

void sub_100002D98(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0LL;
  }

void sub_100002DDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100004EC0();
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = (dispatch_queue_s *)WeakRetained[3];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100002EC8;
    v11[3] = &unk_100014690;
    id v12 = WeakRetained;
    id v13 = v5;
    dispatch_async(v10, v11);
  }
}

void sub_100002EC8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0LL;
  }

id sub_100003220(uint64_t a1)
{
  return [*(id *)(a1 + 32) _kill:9];
}

void sub_1000032C8(id a1, MLRExtensionRemoteProtocol *a2)
{
}

void sub_1000032D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000050EC(a1);
  }
}

id sub_100003428(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unload];
}

void sub_100003F08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100003F2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003F3C(uint64_t a1)
{
}

void sub_100003F44(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(dispatch_queue_s **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004044;
  block[3] = &unk_100014798;
  uint64_t v4 = a1[6];
  block[4] = v2;
  block[5] = v4;
  dispatch_sync(v3, block);
  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
    uint64_t v5 = a1[4];
    id v6 = (void *)a1[5];
    uint64_t v7 = *(void **)(v5 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000040AC;
    v9[3] = &unk_1000147E8;
    v9[4] = v5;
    id v10 = v6;
    __int128 v11 = *((_OWORD *)a1 + 3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100004324;
    v8[3] = &unk_100014810;
    v8[5] = v11;
    v8[4] = a1[4];
    [v7 performOnRemoteObjectSynchronouslyWithBlock:v9 errorHandler:v8];
  }

void sub_100004044(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2[48])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 _skipTaskError]);
LABEL_3:
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    return;
  }

  [v2 _activateExtensionIfNecessary];
  id v6 = *(void **)(a1 + 32);
  if (!v6[5])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v6 _failToGetHostError]);
    goto LABEL_3;
  }

void sub_1000040AC(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) identifier]);
    uint64_t v6 = *(void *)(a1[4] + 16LL);
    *(_DWORD *)buf = 138412802;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Reaching out to plugin=%@ to start compute, sessionID=%@, remoteObjectProxy=%@.",  buf,  0x20u);
  }

  uint64_t v8 = a1 + 5;
  uint64_t v7 = a1[5];
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = (uint64_t)(a1 + 6);
  uint64_t v11 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v11 + 40);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 sandboxExtensionsForTask:v7 error:&obj]);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100004274;
    v15[3] = &unk_1000147C0;
    uint64_t v13 = a1[5];
    void v15[4] = a1[4];
    __int128 v16 = *((_OWORD *)a1 + 3);
    [v3 performTask:v13 sandBoxExtensions:v12 completion:v15];
  }

  else
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100005428(v8, v10, v14);
    }
  }
}

void sub_100004274(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000054B8(a1);
    }

    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v10 = a3;
  }

  else
  {
    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v10 = a2;
  }

  objc_storeStrong(v9, v10);
}

void sub_100004324(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _failToPerformErrorWithError:a2]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100004498( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000044BC(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(dispatch_queue_s **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000045B8;
  block[3] = &unk_100014798;
  uint64_t v4 = a1[6];
  block[4] = v2;
  block[5] = v4;
  dispatch_sync(v3, block);
  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
    uint64_t v5 = (void *)a1[5];
    id v6 = *(void **)(a1[4] + 40LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100004620;
    v10[3] = &unk_1000147E8;
    id v7 = v5;
    uint64_t v8 = a1[4];
    id v11 = v7;
    uint64_t v12 = v8;
    __int128 v13 = *((_OWORD *)a1 + 3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004888;
    v9[3] = &unk_100014810;
    void v9[5] = v13;
    v9[4] = v8;
    [v6 performOnRemoteObjectSynchronouslyWithBlock:v10 errorHandler:v9];
  }

void sub_1000045B8(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2[48])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 _skipTaskError]);
LABEL_3:
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    return;
  }

  [v2 _activateExtensionIfNecessary];
  id v6 = *(void **)(a1 + 32);
  if (!v6[5])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v6 _failToGetHostError]);
    goto LABEL_3;
  }

void sub_100004620(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Reaching out to plugin to start compute, task=%@.",  buf,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004730;
  v7[3] = &unk_100014860;
  __int128 v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  [v3 performTrialTask:v6 completion:v7];
}

void sub_100004730(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000054B8(a1);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v10 = v7;
    uint64_t v11 = *(os_log_s **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionName]);
      int v13 = 138412546;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ return results=%@.", (uint8_t *)&v13, 0x16u);
    }
  }
}

void sub_100004888(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _failToPerformErrorWithError:a2]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100004950(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    dispatch_time_t v3 = dispatch_time(0, (int64_t)[v2 _graceIntervalBeforeUnloading]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = *(dispatch_queue_s **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004A64;
    block[3] = &unk_100014888;
    block[4] = v4;
    id v11 = v5;
    dispatch_after(v3, v6, block);
    uint64_t v7 = *(void *)(a1 + 32);
    __int128 v8 = *(void **)(v7 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004B14;
    v9[3] = &unk_1000148B0;
    v9[4] = v7;
    [v8 performOnRemoteObjectWithBlock:v9 errorHandler:&stru_1000148F0];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

uint64_t sub_100004A64(uint64_t a1)
{
  dispatch_time_t v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    [*v3 _unload];
  }

  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000553C(v3, v4);
  }

  objc_msgSend( *(id *)(a1 + 32),  "_killExtension:afterInterval:",  *(void *)(*(void *)(a1 + 32) + 8),  objc_msgSend(*(id *)(a1 + 32), "_graceIntervalBeforeKilling"));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100004B14(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionName]);
    id v5 = [*(id *)(a1 + 32) _graceIntervalBeforeUnloading];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Waiting to kill plugin=%@ with %lld",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_100004BF4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  dispatch_time_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000055C0();
  }
}

void sub_100004CB4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100004CE4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100004D10(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_100004D30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004D60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004D90(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Found >1 extensions for identifier=%@ extension point=%@",  (uint8_t *)&v3,  0x16u);
  sub_100004CDC();
}

void sub_100004E10(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 firstObject]);
  sub_100004CC0();
  sub_100004D10((void *)&_mh_execute_header, a2, v4, "Discovered extension=%@", v5);

  sub_100004D1C();
}

void sub_100004E90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004EC0()
{
}

void sub_100004F24()
{
  sub_100004CB4((void *)&_mh_execute_header, v0, v1, "Failed to beginExtensionRequestWithOptions with error=%@", v2);
  sub_100004CDC();
}

void sub_100004F88(uint64_t a1, os_log_s *a2)
{
  id v4 = v3;
  sub_100004CB4((void *)&_mh_execute_header, a2, v5, "Failed to get correct host context with class = %@", v6);

  sub_100004D1C();
}

void sub_100005008()
{
}

void sub_10000506C(void *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 extensionName]);
  sub_100004CC0();
  sub_100004D10((void *)&_mh_execute_header, a2, v4, "Simulating crash for extension %@", v5);

  sub_100004D1C();
}

void sub_1000050EC(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionName]);
  sub_100004CF8();
  sub_100004CE4( (void *)&_mh_execute_header,  v2,  v3,  "Failed to simulate crash for extension=%@ with error=%@",  v4,  v5,  v6,  v7,  v8);

  sub_100004CCC();
}

void sub_100005170()
{
}

void sub_1000051D4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recipe]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  sub_100004CC0();
  sub_100004CB4((void *)&_mh_execute_header, a2, v5, "No DES Record Directory extensions returned for %@.", v6);

  sub_100004CCC();
}

void sub_100005268()
{
  sub_100004CB4( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected sandbox extensions returned for submission log (%@).",  v2);
  sub_100004CDC();
}

void sub_1000052CC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recipe]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attachments]);
  sub_100004CC0();
  sub_100004CB4( (void *)&_mh_execute_header,  a2,  v5,  "Fail to issue sandbox extensions for downloaded attachment %@.",  v6);

  sub_100004CCC();
}

void sub_100005360()
{
}

void sub_1000053C4()
{
  sub_100004CB4((void *)&_mh_execute_header, v0, v1, "Fail to perform with error=%{public}@", v2);
  sub_100004CDC();
}

void sub_100005428(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Fail to create Sandbox extensions for task=%@ with error=%@.",  (uint8_t *)&v5,  0x16u);
  sub_100004CDC();
}

void sub_1000054B8(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionName]);
  sub_100004CF8();
  sub_100004CE4((void *)&_mh_execute_header, v2, v3, "%@ fail to return result with error=%@.", v4, v5, v6, v7, v8);

  sub_100004CCC();
}

void sub_10000553C(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 extensionName]);
  sub_100004CC0();
  sub_100004CB4((void *)&_mh_execute_header, a2, v4, "Extension=%@ is being killed.", v5);

  sub_100004D1C();
}

void sub_1000055C0()
{
  sub_100004CB4((void *)&_mh_execute_header, v0, v1, "Failed to stop with error=%@", v2);
  sub_100004CDC();
}

LABEL_14:
    v25 = self->_debugRecord;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v5 taskID]);
    -[DESDebugRecord addForTaskID:result:description:](v25, "addForTaskID:result:description:", v26, 1LL, v19);

LABEL_15:
    uint64_t v6 = 0;
LABEL_16:

    goto LABEL_17;
  }

  uint64_t v6 = 1;
LABEL_17:

  return v6;
}

void sub_1000065F4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v44 = 0LL;
  unsigned __int8 v3 = [v2 _pluginSupportTrialTask:&v44];
  id v4 = v44;
  if ((v3 & 1) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) bundleIdentifier]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "shadowExperimentTasksForPluginID:"));
    if ([v5 count])
    {
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id obj = v5;
      id v6 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v36 = *(void *)v41;
        while (2)
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v41 != v36) {
              objc_enumerationMutation(obj);
            }
            id v9 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
            id v10 = v37;
            id v11 = sub_100006ACC(v9);
            uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
            +[DESBitacoraEventManager sendEventTaskFetchedForBundleID:identifiers:]( &OBJC_CLASS___DESBitacoraEventManager,  "sendEventTaskFetchedForBundleID:identifiers:",  v10,  v12);

            int v13 = *(void **)(a1 + 32);
            id v39 = v4;
            LOBYTE(v12) = [v13 _DASAllowTask:v9 error:&v39];
            id v14 = v39;

            if ((v12 & 1) == 0)
            {
              id v32 = v10;
              id v4 = v14;
              id v33 = sub_100006ACC(v9);
              v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
              +[DESBitacoraEventManager sendEventTaskSchedulingFailedForBundleID:identifiers:error:]( &OBJC_CLASS___DESBitacoraEventManager,  "sendEventTaskSchedulingFailedForBundleID:identifiers:error:",  v32,  v34,  v4);

              goto LABEL_21;
            }

            id v15 = v10;
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 evaluationID]);
            +[DESCoreAnalyticsEventManager sendEventRecipeFetchedForBundleID:evaluationID:error:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventRecipeFetchedForBundleID:evaluationID:error:",  v15,  v16,  0LL);

            id v17 = *(void **)(a1 + 32);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v9 policy]);
            unsigned __int8 v19 = [v17 canRunTask:v18];

            id v20 = v15;
            id v21 = sub_100006ACC(v9);
            __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            if ((v19 & 1) != 0)
            {
              +[DESBitacoraEventManager sendEventTaskSchedulingSucceededForBundleID:identifiers:]( &OBJC_CLASS___DESBitacoraEventManager,  "sendEventTaskSchedulingSucceededForBundleID:identifiers:",  v20,  v22);

              id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
              [v23 systemUptime];
              double v25 = v24;

              v26 = *(void **)(*(void *)(a1 + 32) + 24LL);
              id v38 = v14;
              id v27 = [v26 performTrialTask:v9 outError:&v38];
              id v4 = v38;

              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
              [v28 systemUptime];
              double v30 = v29 - v25;

              [*(id *)(a1 + 32) _performAfterTask:v9 duration:v4 error:v30];
              if (v4) {
                goto LABEL_21;
              }
            }

            else
            {
              +[DESBitacoraEventManager sendEventTaskSchedulingFailedForBundleID:identifiers:error:]( &OBJC_CLASS___DESBitacoraEventManager,  "sendEventTaskSchedulingFailedForBundleID:identifiers:error:",  v20,  v22,  0LL);

              id v4 = v14;
            }
          }

          id v7 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

LABEL_21:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "No Shadow Evaluation tasks for %@.",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100006A10(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100006D08();
    }
  }
}

id sub_100006ACC(void *a1)
{
  id v1 = a1;
  if (objc_opt_class(&OBJC_CLASS___LBFTrialIdentifiers))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 evaluationState]);
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 experimentIdentifiers]);

    id v4 = objc_alloc(&OBJC_CLASS___LBFTrialIdentifiers);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 experimentId]);
    id v6 = [v3 deploymentId];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 treatmentId]);
    id v8 = [v4 initWithExperimentID:v5 deploymentID:v6 treatmentID:v7];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

void sub_100006B98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006BCC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006C00()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Fail to update task record with task=%@, error=%@",  v2,  0x16u);
  sub_100004CDC();
}

void sub_100006C7C(id *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 bundleIdentifier]);
  sub_100004CC0();
  sub_100004CB4((void *)&_mh_execute_header, a2, v4, "Plugin=%@ doesn't support Trial task.", v5);
}

void sub_100006D08()
{
  sub_100004CB4((void *)&_mh_execute_header, v0, v1, "Fail to stop with error=%@", v2);
  sub_100004CDC();
}

void sub_1000073A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  __int16 v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _xpcConnection]);
    uint64_t v5 = (void *)xpc_connection_copy_invalidation_reason();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2082;
    int v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%@ invalidated, reason: %{public}s",  (uint8_t *)&v10,  0x16u);
  }

  if (v5) {
    free(v5);
  }
  [v3 invalidate];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async_f(v9, 0LL, (dispatch_function_t)sub_1000074DC);
}

void sub_1000074DC()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  uint64_t v1 = DESTemporaryDownloadDirectoryURL();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  v50[0] = NSURLIsDirectoryKey;
  v50[1] = NSURLCreationDateKey;
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
  id v32 = v0;
  v28 = (void *)v2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v0,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v2,  v3,  1LL,  &stru_1000149C8));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v30 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingUnit:32 value:-1 toDate:v6 options:0]);

  double v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v41;
    do
    {
      uint64_t v11 = 0LL;
      __int16 v12 = v9;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v11);
        id v14 = objc_autoreleasePoolPush();
        if ([v13 hasDirectoryPath])
        {
          id v38 = 0LL;
          id v39 = 0LL;
          unsigned __int8 v15 = [v13 getResourceValue:&v39 forKey:NSURLCreationDateKey error:&v38];
          id v16 = v39;
          id v9 = v38;

          if ((v15 & 1) != 0)
          {
            if ([v16 compare:v30] == (id)-1) {
              -[NSMutableArray addObject:](v29, "addObject:", v13);
            }
          }

          else
          {
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v46 = v13;
              __int16 v47 = 2112;
              id v48 = v9;
              _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Could not read creation date of attachment %@: %@",  buf,  0x16u);
            }
          }

          __int16 v12 = v9;
        }

        else
        {
          id v9 = v12;
        }

        objc_autoreleasePoolPop(v14);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v18 = v29;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v34,  v44,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        id v23 = v9;
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        double v24 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v33 = v9;
        unsigned int v25 = -[NSFileManager removeItemAtURL:error:](v32, "removeItemAtURL:error:", v24, &v33);
        id v9 = v33;

        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
        id v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v24;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Garbage collected old recipe attachement at %@",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v24;
          __int16 v47 = 2112;
          id v48 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Could not garbage collect old recipe attachment: %@: %@",  buf,  0x16u);
        }
      }

      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v34,  v44,  16LL);
    }

    while (v20);
  }
}

void sub_100007D04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007D94;
  v7[3] = &unk_100014938;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t sub_100007D94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100007EC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007F50;
  v7[3] = &unk_100014938;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t sub_100007F50(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100008440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  id v8 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000084FC;
  block[3] = &unk_100014988;
  id v13 = v6;
  id v14 = v7;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t sub_1000084FC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t sub_1000086E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_100008C0C(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  if ((id)-[NSError code](v5, "code") != (id)260)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Trouble enumerating %@: %@",  (uint8_t *)&v8,  0x16u);
    }
  }

  return 1;
}

void sub_100008CF0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "start donating result=%@, identifier=%@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000091A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(_BYTE *)(v8 + 120))
    {
      id v9 = *(dispatch_queue_s **)(v8 + 40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100009558;
      block[3] = &unk_100014690;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v33 = v10;
      uint64_t v34 = v11;
      dispatch_async(v9, block);
    }

    else
    {
      [*(id *)(a1 + 32) maxTimeLimit];
      if (v16 > 0.0)
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
          [*(id *)(a1 + 32) maxTimeLimit];
          *(_DWORD *)buf = 138412546;
          __int128 v37 = v18;
          __int16 v38 = 2048;
          uint64_t v39 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Will start plugin=%@ with maxTimeLimit=%f seconds",  buf,  0x16u);
        }

        objc_initWeak((id *)buf, v5);
        [*(id *)(a1 + 32) maxTimeLimit];
        dispatch_time_t v21 = dispatch_time(0LL, (uint64_t)(v20 * 1000000000.0));
        __int16 v22 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 48LL);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_10000962C;
        v29[3] = &unk_1000149F0;
        objc_copyWeak(&v31, (id *)buf);
        id v30 = *(id *)(a1 + 32);
        dispatch_after(v21, v22, v29);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }

      [*(id *)(*(void *)(a1 + 40) + 72) addObject:v5];
      id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      +[DESCoreAnalyticsEventManager sendEventEvaluationSessionStartForBundleID:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventEvaluationSessionStartForBundleID:",  v23);

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10000970C;
      v26[3] = &unk_100014A40;
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      id v27 = v24;
      uint64_t v28 = v25;
      [v5 runWithCompletion:v26];
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
    +[DESCoreAnalyticsEventManager sendEventErrorForBundleID:error:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventErrorForBundleID:error:",  v12,  v6);

    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000A86C((id *)(a1 + 32), (uint64_t)v6, v13);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    unsigned __int8 v15 = *(dispatch_queue_s **)(v14 + 40);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100009540;
    v35[3] = &unk_100014708;
    v35[4] = v14;
    dispatch_async(v15, v35);
  }

  objc_autoreleasePoolPop(v7);
}

void sub_100009524(_Unwind_Exception *a1)
{
}

id sub_100009540(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextTask];
}

void sub_100009558(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Task %@ is deferred by DAS.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _requestedToStopError]);
  [v4 _completeTaskRunWithResult:0 error:v5];
}

void sub_10000962C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v5 = 138412290;
      int v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Request plugin=%@ to stop",  (uint8_t *)&v5,  0xCu);
    }

    [WeakRetained stop];
  }
}

void sub_10000970C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
  +[DESCoreAnalyticsEventManager sendEventEvaluationSessionFinishForBundleID:success:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventEvaluationSessionFinishForBundleID:success:",  v7,  v6 == 0LL);

  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
    +[DESCoreAnalyticsEventManager sendEventErrorForBundleID:error:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventErrorForBundleID:error:",  v8,  v6);

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000A918((uint64_t *)(a1 + 32), (uint64_t)v6, v9);
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(dispatch_queue_s **)(v10 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009864;
  block[3] = &unk_100014A18;
  void block[4] = v10;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v11, block);
}

id sub_100009864(uint64_t a1)
{
  if (++*(void *)(*(void *)(a1 + 32) + 104LL) == *(void *)(*(void *)(a1 + 32) + 112LL)) {
    return [*(id *)(a1 + 32) _completeTaskRunWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
  else {
    return [*(id *)(a1 + 32) _scheduleNextTask];
  }
}

id sub_100009FDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startTasks:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

LABEL_13:
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v17 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      uint64_t v10 = v17;
    }

    while (v17);
  }

  return v5;
}

void sub_10000A588(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) allObjects]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v12;
    *(void *)&__int128 v4 = 138412290LL;
    __int128 v10 = v4;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel", v10));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v10;
          id v16 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Stopping task worker: %@.", buf, 0xCu);
        }

        [v8 stop];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }

    while (v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

void sub_10000A7B4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000A7C0(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  id v5 = [*(id *)(a1 + 80) count];
  int v6 = 134218496;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  id v11 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "completed=%ld, expected=%ld, to be scheduled=%ld.",  (uint8_t *)&v6,  0x20u);
}

void sub_10000A86C(id *a1, uint64_t a2, os_log_s *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 bundleIdentifier]);
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  sub_10000A7B4( (void *)&_mh_execute_header,  a3,  v6,  "Fail to create worker for bundle=%@, with error=%@.",  (uint8_t *)&v7);
}

void sub_10000A918(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10000A7B4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Fail to run task=%@ with error=%@.", (uint8_t *)&v4);
}

void sub_10000A998(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unknown plugin type for %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000B0E4(_Unwind_Exception *a1)
{
}

void sub_10000B120(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
  }

  else
  {
    __int16 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000B8B4(v6);
    }
  }
}

id sub_10000B1B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCompleteActivityTask:*(void *)(a1 + 40) withError:a2];
}

void sub_10000B47C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) getStateForForXPCActivity:v3];
  if (!v4)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) criteria]);
    [v7 setCriteriaForXPCActivityIfNeeded:v3 criteria:v6];
LABEL_7:

    goto LABEL_8;
  }

  if (v4 == (id)2)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activity]);

    if (!v5)
    {
      [*(id *)(a1 + 40) setActivity:v3];
      [*(id *)(a1 + 32) runActivityTask:*(void *)(a1 + 40)];
      goto LABEL_8;
    }

    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
      sub_10000B8F4((os_log_t)v6);
    }
    goto LABEL_7;
  }

LABEL_8:
}

void sub_10000B8B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "eligibilityChangedHandler is called when self is nil.",  v1,  2u);
}

void sub_10000B8F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "XPC activity handler is invoked again with RUN state",  v1,  2u);
}

void sub_10000B934(_xpc_activity_s *a1, uint64_t a2, os_log_s *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to set activity state to %ld. Current xpc_activity_state_t state = %lu.",  (uint8_t *)&v4,  0x16u);
}

void sub_10000BA0C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MLRExtensionHostProtocol));
  uint64_t v2 = (void *)qword_10001B3A8;
  qword_10001B3A8 = v1;
}

void sub_10000BA80(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MLRExtensionRemoteProtocol));
  uint64_t v2 = (void *)qword_10001B3B8;
  qword_10001B3B8 = v1;
}

void sub_10000BD84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t sub_10000BDA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000BDB8(uint64_t a1)
{
}

void sub_10000BDC0(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000BFB0((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);
  }
}

void sub_10000BE50(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000C018((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);
  }
}

void sub_10000BF60( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000BF70(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to create remote object proxy", v1, 2u);
}

void sub_10000BFB0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BF60( (void *)&_mh_execute_header,  a2,  a3,  "Error performing block synchronously with error=%@",  a5,  a6,  a7,  a8,  2u);
}

void sub_10000C018( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BF60( (void *)&_mh_execute_header,  a2,  a3,  "Error performing block asynchronously with error=%@",  a5,  a6,  a7,  a8,  2u);
}

void sub_10000C344(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unrecognized bundle=%@.",  (uint8_t *)&v2,  0xCu);
}

void sub_10000C3B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C3EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_sendEventEvaluationForBundleID_evaluationID_duration_deferred_success_error_downloadedAttachmentCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:");
}

id objc_msgSend_sendEventMaintenanceWithActivityID_intervalSincePostedEvent_shouldSkip_lockState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}