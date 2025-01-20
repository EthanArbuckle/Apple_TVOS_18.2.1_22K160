int64_t sub_100003924(id a1, NSURL *a2, NSURL *a3)
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

void sub_1000039BC(void *a1, os_log_s *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "error getting file stats: %@",  (uint8_t *)&v4,  0xCu);
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}