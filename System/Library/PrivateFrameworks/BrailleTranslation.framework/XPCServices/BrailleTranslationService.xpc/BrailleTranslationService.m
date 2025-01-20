uint64_t start()
{
  ServiceDelegate *v0;
  void *v1;
  v0 = objc_alloc_init(&OBJC_CLASS___ServiceDelegate);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v1 setDelegate:v0];
  [v1 resume];

  return 0LL;
}

void sub_100003938(void *a1, os_log_s *a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [a1 processIdentifier]));
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2112;
  v8 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Client attempted to connect without access entitlement. pid:%@ connection:%@",  (uint8_t *)&v5,  0x16u);
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}