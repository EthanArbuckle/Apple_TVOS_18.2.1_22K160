void sub_100003720(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PBIntentHandlerExtension successfully handled show home intent %@",  (uint8_t *)&v7,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000037FC(a1, (uint64_t)v5);
  }
}

void sub_1000037FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PBIntentHandlerExtension failed to handle show home intent %@ with error %@",  (uint8_t *)&v3,  0x16u);
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}