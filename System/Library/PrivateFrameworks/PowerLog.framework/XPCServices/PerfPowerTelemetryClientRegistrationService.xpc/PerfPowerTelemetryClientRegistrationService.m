int main(int argc, const char **argv, const char **envp)
{
  PPSClientRegistrationService *v3;
  void *v4;
  v3 = objc_opt_new(&OBJC_CLASS___PPSClientRegistrationService);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

void sub_100002520(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PerfPowerServices", "ClientRegistrationService");
  v2 = (void *)qword_100008798;
  qword_100008798 = (uint64_t)v1;
}

LABEL_18:
  return v8;
}

id sub_10000277C()
{
  if (qword_1000087D0 != -1) {
    dispatch_once(&qword_1000087D0, &stru_1000041C8);
  }
  return (id)qword_1000087C8;
}

void sub_1000028E4(id a1)
{
  os_log_t v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"PerfPowerServicesDataStream");
  v2 = (void *)qword_1000087B0;
  qword_1000087B0 = (uint64_t)v1;
}

void sub_100002B00(id a1)
{
}

void sub_100002D50(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PerfPowerServices", "ClientRegistrationService");
  v2 = (void *)qword_1000087C8;
  qword_1000087C8 = (uint64_t)v1;
}

  ;
}

void sub_100002D88(void *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Process %d does not have write entitlements!",  (uint8_t *)v3,  8u);
  sub_100002D80();
}

void sub_100002E0C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Current subCat %@  overridesubCat %@",  (uint8_t *)&v3,  0x16u);
  sub_100002D80();
}

void sub_100002E8C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not read test allowlist with error: %@",  (uint8_t *)&v2,  0xCu);
  sub_100002D80();
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}