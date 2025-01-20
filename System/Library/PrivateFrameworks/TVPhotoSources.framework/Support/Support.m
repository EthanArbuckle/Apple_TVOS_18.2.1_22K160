uint64_t start()
{
  void *v0;
  dispatch_source_s *v1;
  void *v2;
  void *v3;
  v0 = objc_autoreleasePoolPush();
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler(v1, &stru_100004098);
  dispatch_resume(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPhotoScreenSaverCache sharedInstance](&OBJC_CLASS___TVPhotoScreenSaverCache, "sharedInstance"));
  [v2 start];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v3 run];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_100003CAC(id a1)
{
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}