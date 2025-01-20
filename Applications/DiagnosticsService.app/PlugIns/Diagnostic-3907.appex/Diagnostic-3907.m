id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  v1 = a1;
  v2 = v1;
  if (v1) {
    v3 = v1;
  }
  else {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v4 = v3;

  return v4;
}

id sub_100002C60(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDeviceDocked];
}

id sub_100002C68(uint64_t a1)
{
  return [*(id *)(a1 + 32) isHeadsetPluggedIn];
}

void sub_100003074(void *a1, os_log_s *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 inputs]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Test %@ is not found.", (uint8_t *)&v5, 0xCu);
}

void sub_100003120(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  v7 = (void *)objc_claimAutoreleasedReturnValue([a2 portType]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Audio Out: %@", a1, 0xCu);
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}