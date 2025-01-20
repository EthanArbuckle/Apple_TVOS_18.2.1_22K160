id PPSFeatureFlagReaderLog()
{
  if (qword_1000089C0 != -1) {
    dispatch_once(&qword_1000089C0, &stru_100004238);
  }
  return (id)qword_1000089B8;
}

void sub_1000013C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerlog", "PPSFeatureFlagReader");
  v2 = (void *)qword_1000089B8;
  qword_1000089B8 = (uint64_t)v1;
}

void sub_1000014A0(id a1)
{
  id v1 = PPSFeatureFlagReaderLog();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000023CC(v2);
  }

  dispatch_time_t v3 = dispatch_time(0LL, 60000000000LL);
  dispatch_after(v3, &_dispatch_main_q, &stru_100004278);
}

void sub_100001508(id a1)
{
  id v1 = PPSFeatureFlagReaderLog();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_time_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Requesting exit in invalidation handler...",  v3,  2u);
  }

  xpc_transaction_exit_clean();
}

int main(int argc, const char **argv, const char **envp)
{
  dispatch_time_t v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id logPPSFeatureFlagReader()
{
  if (qword_1000089D0 != -1) {
    dispatch_once(&qword_1000089D0, &stru_100004298);
  }
  return (id)qword_1000089C8;
}

void sub_100001608(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerlog", "PPSFeatureFlagReader");
  v2 = (void *)qword_1000089C8;
  qword_1000089C8 = (uint64_t)v1;
}

void sub_100001730(id a1)
{
  id v1 = logPPSFeatureFlagReader();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM handler invoked!", v3, 2u);
  }

  exit(0);
}

void sub_100001DDC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    id v3 = logPPSFeatureFlagReader();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000025E0((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }

    objc_end_catch();
    JUMPOUT(0x100001DA8LL);
  }

  _Unwind_Resume(a1);
}

void sub_100001E90( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id logPPSFeatureFlagReaderHelper()
{
  if (qword_1000089E0 != -1) {
    dispatch_once(&qword_1000089E0, &stru_1000042D8);
  }
  return (id)qword_1000089D8;
}

void sub_100001EE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerlog", "PPSFeatureFlagReaderHelper");
  id v2 = (void *)qword_1000089D8;
  qword_1000089D8 = (uint64_t)v1;
}

void sub_100002114( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000213C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000214C(uint64_t a1)
{
}

void sub_100002154(uint64_t a1, void *a2)
{
}

void sub_10000225C(id a1)
{
  id v1 = logPPSFeatureFlagReaderHelper();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100002744();
  }
}

void sub_10000229C(id a1)
{
  id v1 = logPPSFeatureFlagReaderHelper();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100002770();
  }
}

void sub_1000022DC(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = logPPSFeatureFlagReaderHelper();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000279C(v2, v4);
  }
}

void sub_100002398( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000023BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000023CC(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 60;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Exit handler triggered for PPSFeatureFlagReader! Attempting to exit in %d seconds...",  (uint8_t *)v1,  8u);
}

void sub_100002448( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000024AC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[PPSFeatureFlagReader] Set of Feature Flag Domains: %@",  (uint8_t *)&v2,  0xCu);
  sub_100001EA0();
}

void sub_10000251C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[PPSFeatureFlagReader] Domain set is empty",  v1,  2u);
}

void sub_10000255C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing read entitlement", v1, 2u);
}

void sub_10000259C(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Process %d does not have entitlement to launch XPC!",  buf,  8u);
}

void sub_1000025E0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002644(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[PPSFeatureFlagReader] getFeatureFlags result: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_1000026C0()
{
}

void sub_1000026EC()
{
}

void sub_100002718()
{
}

void sub_100002744()
{
}

void sub_100002770()
{
}

void sub_10000279C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "os_log_debug Connection error happened %@",  (uint8_t *)&v4,  0xCu);
}

void sub_100002830()
{
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}