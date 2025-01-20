uint64_t start()
{
  os_log_s *v0;
  void *v2;
  id v3;
  char *errorbuf;
  uint8_t buf[4];
  char *v6;
  -[NSProcessInfo arguments](+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"), "arguments");
  _NSCoreDataLog(4LL, @"coredatad launched with argc: %d argv: %@");
  errorbuf = 0LL;
  if (sandbox_init("com.apple.coredatad", 1uLL, &errorbuf))
  {
    _NSCoreDataLog( 17LL,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Failed to enter sandbox: %s"));
    v0 = (os_log_s *)qword_100008130;
    if (os_log_type_enabled((os_log_t)qword_100008130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = errorbuf;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to enter sandbox: %s",  buf,  0xCu);
    }

    return 1LL;
  }

  else
  {
    v2 = objc_autoreleasePoolPush();
    _NSCoreDataLog(4LL, @"Bringing up cloudkit server: %@ / %@");
    v3 = +[NSCloudKitMirroringDelegate createCloudKitServerWithMachServiceName:andStorageDirectoryPath:]( &OBJC_CLASS___NSCloudKitMirroringDelegate,  "createCloudKitServerWithMachServiceName:andStorageDirectoryPath:",  0LL,  0LL);
    [v3 setUp];
    objc_autoreleasePoolPop(v2);
    -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
    _NSCoreDataLog(4LL, @"Tearing down coredatad.");
    _NSCoreDataLog(4LL, @"Tearing down cloudkit server: %@");
    [v3 tearDown];

    return 0LL;
  }
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}