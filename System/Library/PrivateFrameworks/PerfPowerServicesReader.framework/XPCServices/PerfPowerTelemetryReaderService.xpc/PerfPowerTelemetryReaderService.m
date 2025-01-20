void sub_100002CB4(id a1)
{
  id v1;
  os_log_s *v2;
  uint8_t v3[16];
  v1 = PPSLogReaderService();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "XPC connection interrupted", v3, 2u);
  }
}

void sub_100002D18(uint64_t a1)
{
  id v2 = PPSLogReaderService();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "XPC connection with client pid: %d invalidated",  (uint8_t *)v5,  8u);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

id PPSLogReaderService()
{
  if (qword_1000087A8 != -1) {
    dispatch_once(&qword_1000087A8, &stru_100004240);
  }
  return (id)qword_1000087A0;
}

void sub_100002E44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PerfPowerServicesReaderService", "xpc");
  id v2 = (void *)qword_1000087A0;
  qword_1000087A0 = (uint64_t)v1;
}

void sub_1000030D4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000030E0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Process %d has read entitlement!",  (uint8_t *)v2,  8u);
}

void sub_100003154(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Process %d does not have read entitlement!",  (uint8_t *)v2,  8u);
}

void sub_1000031C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%{public}@: Connection attempt from %{public}@",  (uint8_t *)&v3,  0x16u);
}

void sub_10000324C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Empty request", v1, 2u);
}

void sub_10000328C(void *a1, uint64_t a2, void *a3, os_log_s **a4)
{
  id v6 = objc_begin_catch(a1);
  *a3 = v6;
  id v7 = v6;
  id v8 = PPSLogReaderService();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  *a4 = v9;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543362;
    id v12 = v7;
    sub_1000030D4( (void *)&_mh_execute_header,  v9,  v10,  "Exception while executing request: %{public}@",  (uint8_t *)&v11);
  }
}

void sub_100003344(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_1000030D4((void *)&_mh_execute_header, a2, a3, "Executing request: %{public}@", (uint8_t *)&v3);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}