int main(int argc, const char **argv, const char **envp)
{
  id v3;
  void *v4;
  DESRecordStoreServiceListenerDelegate *v5;
  void *v6;
  os_log_s *v7;
  int v8;
  _DWORD v10[2];
  if ((_set_user_dir_suffix("com.apple.siri-distributed-evaluation", argv, envp) & 1) != 0)
  {
    v3 = NSTemporaryDirectory();
    v4 = objc_autoreleasePoolPush();
    +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
    v5 = objc_alloc_init(&OBJC_CLASS___DESRecordStoreServiceListenerDelegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
    [v6 setDelegate:v5];
    objc_autoreleasePoolPop(v4);
    [v6 resume];
  }

  else
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = *__error();
      v10[0] = 67109120;
      v10[1] = v8;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "_set_user_dir_suffix failed™: %{darwin.errno}d",  (uint8_t *)v10,  8u);
    }
  }

  exit(1);
}

void sub_100001B48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100001B6C(id a1)
{
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "In connection interruption handler.", v2, 2u);
  }
}

void sub_100001BD8(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100002C4C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 2) invalidate];
    v5 = (void *)v4[2];
    v4[2] = 0LL;

    v6 = (void *)v4[1];
    v4[1] = 0LL;
  }
}

void sub_100001DAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100001DCC(id a1)
{
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "In forward connection interruption handler.",  v2,  2u);
  }
}

void sub_100001E38(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100002C78();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (dispatch_queue_s *)WeakRetained[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100001EEC;
    block[3] = &unk_100004258;
    v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

void sub_100001EEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0LL;
}

void sub_1000020B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100002CD0((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

id sub_1000022D8(uint64_t a1, void *a2)
{
  return [a2 fetchInstalledBundlesIdsWithCompletion:*(void *)(a1 + 32)];
}

uint64_t sub_1000022E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100002528(void *a1, void *a2)
{
  return [a2 saveRecordForBundleId:a1[4] data:a1[5] recordInfo:a1[6] completion:a1[7]];
}

uint64_t sub_100002538(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100002628(uint64_t a1, void *a2)
{
  return [a2 fetchSavedRecordInfoForRecordType:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_100002634(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100002770(uint64_t a1, void *a2)
{
  return [a2 deleteAllSavedRecordsForBundleId:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_10000277C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000028D0(void *a1, void *a2)
{
  return [a2 deleteSavedRecordForBundleId:a1[4] identfier:a1[5] completion:a1[6]];
}

uint64_t sub_1000028E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000029C8(uint64_t a1, void *a2)
{
  return [a2 saveCoreDuetEvent:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_1000029D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100002BB8(void *a1, void *a2)
{
  return [a2 fetchNativeRecordDataForRecordUUID:a1[4] bundleId:a1[5] completion:a1[6]];
}

uint64_t sub_100002BC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100002C20( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100002C30( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002C4C()
{
}

void sub_100002C78()
{
}

void sub_100002CA4()
{
}

void sub_100002CD0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "In error handler of forward connection with error=%@.",  (uint8_t *)&v2,  0xCu);
}

void sub_100002D44()
{
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}