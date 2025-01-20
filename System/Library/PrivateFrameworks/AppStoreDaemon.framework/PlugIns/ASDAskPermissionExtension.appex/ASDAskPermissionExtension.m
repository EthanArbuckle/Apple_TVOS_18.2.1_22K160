void sub_100003444(id a1, BOOL a2, NSError *a3)
{
  BOOL v3;
  NSError *v4;
  int v5;
  NSError *v6;
  v3 = a2;
  v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Download queue request returned error: %{public}@",  (uint8_t *)&v5,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 67109120;
    LODWORD(v6) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Download queue request complete with result: %{BOOL}d",  (uint8_t *)&v5,  8u);
  }
}

void sub_1000037F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v7)
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Download failed. Error: %{public}@",  (uint8_t *)&v9,  0xCu);
    }
  }

  else if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Download succeeded. Response items: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}