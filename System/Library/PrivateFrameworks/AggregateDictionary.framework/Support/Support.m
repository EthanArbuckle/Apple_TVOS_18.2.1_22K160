uint64_t start()
{
  void *v0;
  uint8_t v2[16];
  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Reporting locale prefs to analyticsd",  v2,  2u);
  }

  report_locale_prefs_to_analyticsd();
  objc_autoreleasePoolPop(v0);
  return 0LL;
}