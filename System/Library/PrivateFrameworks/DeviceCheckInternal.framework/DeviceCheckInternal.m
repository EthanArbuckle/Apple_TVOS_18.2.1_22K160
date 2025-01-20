void sub_100003944(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10000D008;
  qword_10000D008 = (uint64_t)v1;
}

void sub_100003A70(id a1, int64_t a2)
{
  id v3 = sub_1000043BC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int64_t v6 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Initiated an out of band catalog download completed with result: %ld",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_100003F28(uint64_t a1, uint64_t a2)
{
  id v4 = sub_1000043BC();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Catalog downloaded with result %ld...",  (uint8_t *)&v8,  0xCu);
  }

  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.twobit.fetcherror",  -3001LL,  0LL));
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v7);
  }

  else
  {
    [*(id *)(a1 + 32) _queryMetadataWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void sub_100004398( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_1000043BC()
{
  if (qword_10000D020 != -1) {
    dispatch_once(&qword_10000D020, &stru_100008308);
  }
  return (id)qword_10000D018;
}

void sub_1000043FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.devicecheck", "core");
  v2 = (void *)qword_10000D018;
  qword_10000D018 = (uint64_t)v1;
}

id sub_10000442C()
{
  if (qword_10000D030 != -1) {
    dispatch_once(&qword_10000D030, &stru_100008328);
  }
  return (id)qword_10000D028;
}

void sub_10000446C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.devicecheck", "attestation");
  v2 = (void *)qword_10000D028;
  qword_10000D028 = (uint64_t)v1;
}

void sub_10000464C(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___DCXPCListener);
  v2 = (void *)qword_10000D038;
  qword_10000D038 = (uint64_t)v1;
}

void sub_100004838( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100004860(uint64_t a1)
{
  id v2 = sub_1000043BC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100005A74(a1, v3);
  }
}

void sub_100004990(id a1)
{
  id v1 = sub_1000043BC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "SIGTERM requested, devicecheckd is being terminated.",  v3,  2u);
  }

  exit(0);
}

uint64_t sub_100004E24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000055B4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_1000055E0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t start()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[DCTaskCreator create](&OBJC_CLASS___DCTaskCreator, "create"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[DCBGSTaskController sharedInstance](&OBJC_CLASS___DCBGSTaskController, "sharedInstance"));
  [v1 registerForTask:v0];

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AppAttestTaskCreator create](&OBJC_CLASS___AppAttestTaskCreator, "create"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DCBGSTaskController sharedInstance](&OBJC_CLASS___DCBGSTaskController, "sharedInstance"));
  [v3 registerForTask:v2];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DCXPCListener sharedInstance](&OBJC_CLASS___DCXPCListener, "sharedInstance"));
  [v4 start];

  CFRunLoopRun();
  return 0LL;
}

void sub_100005998(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unexpected query result: %ld",  (uint8_t *)&v2,  0xCu);
}

void sub_100005A0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005A40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005A74(uint64_t a1, os_log_s *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Connection invalidated... %@",  (uint8_t *)&v4,  0xCu);
}

void sub_100005B08()
{
}

void sub_100005B34()
{
}

void sub_100005B60()
{
}

void sub_100005BD8()
{
}

void sub_100005C50()
{
}

void sub_100005CC8()
{
}

void sub_100005D40(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to parse asset, required fields are missing!",  v1,  2u);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}