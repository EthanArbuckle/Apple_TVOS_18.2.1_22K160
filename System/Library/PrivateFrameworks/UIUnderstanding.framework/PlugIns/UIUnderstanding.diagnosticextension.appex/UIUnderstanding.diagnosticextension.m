void sub_100003A74(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to collect logs with error %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}