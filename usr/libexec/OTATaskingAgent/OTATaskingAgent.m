uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  NSXPCListener *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];
  if (getuid())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002BD0();
    }
  }

  else if (a1 == 2 && !strcmp("server-init", *(const char **)(a2 + 8)))
  {
    v4 = objc_autoreleasePoolPush();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting OTATaskingAgent",  v9,  2u);
    }

    v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.OTATaskingAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[OTATaskingAgent sharedListenerDelegate](&OBJC_CLASS___OTATaskingAgent, "sharedListenerDelegate"));
    -[NSXPCListener setDelegate:](v5, "setDelegate:", v6);
    -[NSXPCListener resume](v5, "resume");
    objc_autoreleasePoolPop(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v7 run];
  }

  return 1LL;
}

void sub_100001D00(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___OTATaskingAgent);
  v2 = (void *)qword_100008780;
  qword_100008780 = (uint64_t)v1;
}

uint64_t sub_10000212C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v1 = (void *)objc_claimAutoreleasedReturnValue([v0 valueForEntitlement:@"com.apple.osanalytics.otatasking-service-access"]);
  if (objc_opt_respondsToSelector(v1, "BOOLValue") & 1) != 0 && ([v1 BOOLValue])
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The connection doesn't have the right entitlement. Sending back error response.",  v4,  2u);
      uint64_t v2 = 0LL;
    }
  }

  return v2;
}

LABEL_10:
    v7 = 0LL;
    goto LABEL_15;
  }

  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Can't get service matching dict";
      v9 = buf;
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  v5 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty( MatchingService,  @"CrashReporter-ID",  kCFAllocatorDefault,  0);
  IOObjectRelease(v5);
  if ([CFProperty length] == (id)20)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue( -[OTATaskingAgent hexStringForSHA1Digest:]( self, "hexStringForSHA1Digest:", [CFProperty bytes]));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Value returned for kCrashReporterPropertyID is not the expected length",  v15,  2u);
    }

    v7 = 0LL;
  }

LABEL_15:
  if (v7) {
    v10 = v7;
  }
  else {
    v10 = @"0000000000000000000000000000000000000000";
  }
  v11 = v10;

  return v11;
}

void sub_100002BD0()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "OTATaskingAgent should be run as root",  v0,  2u);
}

void sub_100002C14(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "The unique string is %@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               v13 = 138412290;
    v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ doesn't exist. Creating it",  (uint8_t *)&v13,  0xCu);
  }

  if (-[__CFString isEqualToString:](v4, "isEqualToString:", @"AnalyticsReporterKey")
    && &_DMGetUserDataDisposition
    && (DMGetUserDataDisposition() & 2) != 0)
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent legacyCrashreporterKey](self, "legacyCrashreporterKey"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v7 = "Requested to generate crashreporterKey on an upgrade install from < iOS 10.0 Returning the legacy value - %@";
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
      goto LABEL_11;
    }
  }

  else
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent randomHashWithKey:](self, "randomHashWithKey:", v4));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v4;
      v7 = "Created value %@ for key %@";
      v8 = OS_LOG_TYPE_INFO;
      v9 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v8, v7, (uint8_t *)&v13, v9);
    }
  }

  CFPreferencesSetAppValue(v4, v6, @"com.apple.osanalytics.OTATaskingAgent");
  if (CFPreferencesAppSynchronize(@"com.apple.osanalytics.OTATaskingAgent"))
  {
    v5 = v6;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't save %@ to %@",  (uint8_t *)&v13,  0x16u);
    }

    v5 = 0LL;
  }

LABEL_18:
  if (v5) {
    v10 = v5;
  }
  else {
    v10 = @"0000000000000000000000000000000000000000";
  }
  v11 = v10;

  return v11;
}

- (id)legacyCrashreporterKey
{
  v3 = IOServiceMatching("IOAESAccelerator");
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      v8 = "Can't create matching dict";
      v9 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }

- (id)hexStringForSHA1Digest:(const char *)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",  *(unsigned __int8 *)a3,  *((unsigned __int8 *)a3 + 1),  *((unsigned __int8 *)a3 + 2),  *((unsigned __int8 *)a3 + 3),  *((unsigned __int8 *)a3 + 4),  *((unsigned __int8 *)a3 + 5),  *((unsigned __int8 *)a3 + 6),  *((unsigned __int8 *)a3 + 7),  *((unsigned __int8 *)a3 + 8),  *((unsigned __int8 *)a3 + 9),  *((unsigned __int8 *)a3 + 10),  *((unsigned __int8 *)a3 + 11),  *((unsigned __int8 *)a3 + 12),  *((unsigned __int8 *)a3 + 13),  *((unsigned __int8 *)a3 + 14),  *((unsigned __int8 *)a3 + 15),  *((unsigned __int8 *)a3 + 16),  *((unsigned __int8 *)a3 + 17),  *((unsigned __int8 *)a3 + 18),  *((unsigned __int8 *)a3 + 19));
}

- (id)randomHashWithKey:(id)a3
{
  id v4 = a3;
  io_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent legacyCrashreporterKey](self, "legacyCrashreporterKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@%@",  v6,  v7,  v4,  v8));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100002C14((uint64_t)v9);
  }
  id v10 = v9;
  CC_SHA1([v10 UTF8String], (CC_LONG)objc_msgSend(v10, "length"), md);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTATaskingAgent hexStringForSHA1Digest:](self, "hexStringForSHA1Digest:", md));

  return v11;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end