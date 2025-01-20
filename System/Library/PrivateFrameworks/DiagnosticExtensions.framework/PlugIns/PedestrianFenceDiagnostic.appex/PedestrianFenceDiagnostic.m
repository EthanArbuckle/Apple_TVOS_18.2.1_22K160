int64_t sub_1000038B0(id a1, NSURL *a2, NSURL *a3)
{
  NSURL *v4;
  id v5;
  id v6;
  id v8;
  id v9;
  v9 = 0LL;
  v4 = a3;
  -[NSURL getResourceValue:forKey:error:]( a2,  "getResourceValue:forKey:error:",  &v9,  NSURLContentModificationDateKey,  0LL);
  v8 = 0LL;
  v5 = v9;
  -[NSURL getResourceValue:forKey:error:]( v4,  "getResourceValue:forKey:error:",  &v8,  NSURLContentModificationDateKey,  0LL);

  v6 = [v8 compare:v5];
  return (int64_t)v6;
}

void sub_100003948(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  v7 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "error getting file stats: %@", a1, 0xCu);
}

void sub_1000039BC(void *a1, os_log_s *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "error getting file stats: %@",  (uint8_t *)&v4,  0xCu);
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}