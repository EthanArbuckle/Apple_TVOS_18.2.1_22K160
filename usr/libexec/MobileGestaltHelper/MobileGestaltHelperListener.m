@interface MobileGestaltHelperListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)needsNewCachePostBoot;
- (BOOL)setCacheSentinel;
- (id)getSentinelPath;
- (id)processNameForConnection:(id)a3;
- (id)queryBootUUID;
- (void)getAppleTVMode:(id)a3;
- (void)getServerAnswerForQuestion:(id)a3 reply:(id)a4;
- (void)getSpringboardRegionOverride:(id)a3 reply:(id)a4;
- (void)rebuildCache:(id)a3;
- (void)setCacheSentinel:(id)a3;
@end

@implementation MobileGestaltHelperListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MobileGestaltHelper));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (id)processNameForConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    [v3 auditToken];
    uint64_t v5 = v31;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[unknown caller].%d",  v5));
  int v7 = proc_pidinfo(v5, 13, 0LL, buffer, 64);
  if (v7 == 64)
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s.%d", &v35, v5));

    v6 = (void *)v22;
  }

  else
  {
    int v8 = v7;
    if (v7 == -1)
    {
      v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
      v10 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m",  47);
      if (v10) {
        v9 = v10 + 1;
      }
      v11 = __error();
      char v12 = strerror(*v11);
      sub_100001498((uint64_t)v9, 56LL, (uint64_t)@"proc_pidinfo: %s", v13, v14, v15, v16, v17, v12);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18 = __error();
        v19 = strerror(*v18);
        *(_DWORD *)buf = 136315138;
        v33[0] = v19;
        v20 = "proc_pidinfo: %s";
        uint32_t v21 = 12;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
      }
    }

    else
    {
      v23 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m",  47);
      if (v23) {
        v29 = v23 + 1;
      }
      else {
        v29 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
      }
      sub_100001498( (uint64_t)v29,  58LL,  (uint64_t)@"proc_pidinfo: wrong size: actual = %d, expected = %lu",  v24,  v25,  v26,  v27,  v28,  v8);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v33[0]) = v8;
        WORD2(v33[0]) = 2048;
        *(void *)((char *)v33 + 6) = 64LL;
        v20 = "proc_pidinfo: wrong size: actual = %d, expected = %lu";
        uint32_t v21 = 18;
        goto LABEL_16;
      }
    }
  }

  return v6;
}

- (void)getSpringboardRegionOverride:(id)a3 reply:(id)a4
{
  id v22 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  v6 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  int v7 = (void *)MGCopyAnswer(@"h63QSdBCiT/z0WU6rdQv6Q", 0LL);
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  int v8 = (void *)CFPreferencesCopyValue( @"AppleLocale",  kCFPreferencesAnyApplication,  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0) {
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 regionCode]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {

LABEL_8:
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v13 regionCode]);

    goto LABEL_9;
  }

  if (!v11) {
    goto LABEL_8;
  }
LABEL_9:

  uint64_t v14 = 0LL;
  if (v7 && v11)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 stringWithFileSystemRepresentation:"/System/Library/CoreServices/RegionalOverrideSoftwareBehaviors.plist" length:68]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v7]);

    if (v18 && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v18, v19) & 1) != 0))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v11]);
      if (v20 && (uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v20, v21) & 1) != 0)) {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v22]);
      }
      else {
        uint64_t v14 = 0LL;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  v5[2](v5, v14);

  objc_autoreleasePoolPop(v6);
}

- (void)getServerAnswerForQuestion:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  int v8 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v20 = 0;
  CFTypeRef cf = 0LL;
  v10 = (void *)_MGServerCopyAnswerWithError(v9, v6, &v20, &cf);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (_MGServerQuestionIsPlatform(v6))
  {
    uint64_t v12 = _MGGetFastPathLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v9));
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = (uint64_t)v14;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "platform fast path elided: caller = %@, question = %@",  buf,  0x16u);
    }
  }

  if (v10)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v9));
    *(_DWORD *)buf = 138412802;
    uint64_t v22 = (uint64_t)v15;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    v26[0] = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "asked question: p = %@, q = %@, a = %@",  buf,  0x20u);
  }

  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v9));
    uint64_t v15 = (void *)v17;
    v18 = (const __CFString *)cf;
    if (!cf) {
      v18 = @"no log";
    }
    *(_DWORD *)buf = 138413058;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 1024;
    LODWORD(v26[0]) = v20;
    WORD2(v26[0]) = 2112;
    *(void *)((char *)v26 + 6) = v18;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "asked question: p = %@, q = %@, e = %d [%@]",  buf,  0x26u);
  }

LABEL_11:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
  [v11 setObject:v16 forKeyedSubscript:@"error"];

  if (v10) {
    [v11 setObject:v10 forKeyedSubscript:@"answer"];
  }
  if (cf)
  {
    [v11 setObject:cf forKeyedSubscript:@"logString"];
    CFRelease(cf);
  }

  v7[2](v7, v11);

  objc_autoreleasePoolPop(v8);
}

- (void)getAppleTVMode:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (objc_opt_class(&OBJC_CLASS___CADisplay))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentMode]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v9 width]));
      [v7 setObject:v10 forKeyedSubscript:@"width"];

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v9 height]));
      [v7 setObject:v11 forKeyedSubscript:@"height"];
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000028A4(self, (uint64_t)v6, (uint64_t)v9);
    }
  }

  v4[2](v4, v7);

  objc_autoreleasePoolPop(v5);
}

- (void)rebuildCache:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v6));
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Requested a cache rebuild: p = %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = _MGRebuildCache();
  v4[2](v4, v8);

  objc_autoreleasePoolPop(v5);
}

- (void)setCacheSentinel:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v6));
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Requested a cache sentinel: p = %@",  (uint8_t *)&v8,  0xCu);
  }

  v4[2](v4, -[MobileGestaltHelperListener setCacheSentinel](self, "setCacheSentinel"));

  objc_autoreleasePoolPop(v5);
}

- (id)queryBootUUID
{
  __int16 v15 = 0;
  memset(v14, 0, sizeof(v14));
  size_t v11 = 50LL;
  if (sysctlbyname("kern.bootsessionuuid", v14, &v11, 0LL, 0LL) == -1)
  {
    id v3 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m",  47);
    if (v3) {
      int v9 = v3 + 1;
    }
    else {
      int v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
    }
    sub_100001498( (uint64_t)v9,  221LL,  (uint64_t)@"Could not lookup %s",  v4,  v5,  v6,  v7,  v8,  (char)"kern.bootsessionuuid");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "kern.bootsessionuuid";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not lookup %s",  buf,  0xCu);
    }

    v2 = 0LL;
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  }

  return v2;
}

- (id)getSentinelPath
{
  return [@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.mobilegestaltcache/Library/Caches/com.apple.MobileGestalt.plist" stringByAppendingString:@".rebuild"];
}

- (BOOL)setCacheSentinel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener getSentinelPath](self, "getSentinelPath"));
  if (!v3)
  {
LABEL_8:
    id v8 = 0LL;
    uint64_t v5 = 0LL;
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener queryBootUUID](self, "queryBootUUID"));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002944();
    }
    goto LABEL_8;
  }

  uint64_t v5 = v4;
  id v10 = 0LL;
  BOOL v6 = 1;
  unsigned __int8 v7 = [v4 writeToFile:v3 atomically:1 encoding:4 error:&v10];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002988((uint64_t)v5, (uint64_t)v3, v8);
    }
    goto LABEL_9;
  }

- (BOOL)needsNewCachePostBoot
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener getSentinelPath](self, "getSentinelPath"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = v4;
  if (v3 && [v4 fileExistsAtPath:v3])
  {
    id v16 = 0LL;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v3,  4LL,  &v16));
    id v7 = v16;
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener queryBootUUID](self, "queryBootUUID"));
      unsigned __int8 v9 = [v6 isEqualToString:v8];
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Boot UUIDs match %@",  buf,  0xCu);
        }

        id v11 = v7;
      }

      else
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "New cache needed",  buf,  2u);
        }

        id v15 = v7;
        unsigned __int8 v13 = [v5 removeItemAtPath:v3 error:&v15];
        id v11 = v15;

        if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100002AC4(v11);
        }
      }

      char v12 = v9 ^ 1;

      id v7 = v11;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100002A44(v7);
      }
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

@end