void start(int a1, uint64_t a2)
{
  NSDate *v2;
  NSRunLoop *v3;
  void *context;
  TVISScreenSaverConnectionListener *v5;
  TVISAmbientDaemon *v6;
  dispatch_queue_s *v7;
  void *v8;
  TVISActivityScheduler *v9;
  dispatch_source_s *v10;
  uint64_t v11;
  int v12;
  int v13;
  v13 = 0;
  v12 = a1;
  v11 = a2;
  _set_user_dir_suffix("com.apple.idleassetsd");
  v7 = &_dispatch_main_q;
  v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v7);

  dispatch_source_set_event_handler(v10, &stru_1000040E8);
  dispatch_resume(v10);
  v8 = objc_autoreleasePoolPush();
  if ((sub_10000373C() & 1) != 0)
  {
    v6 = +[TVISAmbientDaemon sharedInstance](&OBJC_CLASS___TVISAmbientDaemon, "sharedInstance");
    -[TVISAmbientDaemon start](v6, "start");
  }

  else
  {
    v5 =  +[TVISScreenSaverConnectionListener sharedInstance]( &OBJC_CLASS___TVISScreenSaverConnectionListener,  "sharedInstance");
    -[TVISScreenSaverConnectionListener start](v5, "start");

    v9 = +[TVISActivityScheduler sharedInstance](&OBJC_CLASS___TVISActivityScheduler, "sharedInstance");
    -[TVISActivityScheduler start](v9, "start");
    +[TVISCacheDeleteManager registerWithCacheDelete](&OBJC_CLASS___TVISCacheDeleteManager, "registerWithCacheDelete");
    objc_storeStrong((id *)&v9, 0LL);
  }

  objc_autoreleasePoolPop(v8);
  while (1)
  {
    context = objc_autoreleasePoolPush();
    v3 = +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop");
    v2 = +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0);
    -[NSRunLoop runUntilDate:](v3, "runUntilDate:");

    objc_autoreleasePoolPop(context);
  }
}

void sub_100003710(id a1)
{
}

uint64_t sub_10000373C()
{
  return _os_feature_enabled_impl("IdleScreen", "Fizzgig") & 1;
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}