void sub_100002ADC(id a1)
{
  os_log_t v1;
  void *v2;
  v1 = os_log_create("com.apple.calendar", "CalendarDiagnosticExtension");
  v2 = (void *)qword_100008828;
  qword_100008828 = (uint64_t)v1;
}

uint64_t sub_100002DA4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003244(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out. Bailing now!", v1, 2u);
}

void sub_100003284(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Diagnostics collector failed: %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_trafficLogsCollectionMode(void *a1, const char *a2, ...)
{
  return [a1 trafficLogsCollectionMode];
}