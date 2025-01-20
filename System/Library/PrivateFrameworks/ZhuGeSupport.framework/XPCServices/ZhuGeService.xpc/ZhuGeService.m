LABEL_16:
  return v24;
}

LABEL_36:
          ++v5;
          if (!--v19) {
            goto LABEL_40;
          }
        }

        *v22++ = v23;
        goto LABEL_36;
      }
    }

    else
    {
      memcpy(v21, v5, v12 - v5);
    }

    v10 = 0;
LABEL_40:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v21));
    -[NSMutableArray addObject:](v4, "addObject:", v24);

    goto LABEL_41;
  }

  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) arrayFromShellCommandString:]",  98LL,  @"Quotation %c is not paired in command %@!",  v7,  v8,  v9,  (char)v10);
  v25 = 0LL;
LABEL_43:
  v3 = v27;
LABEL_45:

  return v25;
}

void sub_1000053D4(id a1)
{
}

LABEL_28:
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  return v8;
}

LABEL_10:
  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([a1 xpcProxy]);

  return v37;
}

uint64_t sub_100006058(uint64_t a1)
{
  return pthread_mutex_unlock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
}

uint64_t sub_1000060CC(uint64_t a1)
{
  return pthread_mutex_unlock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
}

uint64_t sub_100006140(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  pthread_mutex_lock((pthread_mutex_t *)[v3 recursiveMutex]);
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_3",  333LL,  @"Internal connection failed to provide a synchronized proxy, error : %@!",  v5,  v6,  v7,  (uint64_t)v4);

  [*(id *)(a1 + 32) setXpcProxy:0];
  return pthread_mutex_unlock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
}

void sub_100006324(id a1)
{
}

void ZhuGeLog( int a1, const char *a2, const char *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  kern_return_t (__cdecl **v23)(io_object_t);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString **v37;
  FILE *v38;
  id v39;
  FILE *v40;
  os_log_s *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint8_t buf[4];
  id v46;
  id v13 = a5;
  v18 = v13;
  if (a2) {
    v19 = a2;
  }
  else {
    v19 = "UnknownFile";
  }
  if (a3) {
    v20 = a3;
  }
  else {
    v20 = "UnknownFunc";
  }
  if (!v13)
  {
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (byte_10001A120) {
      ZhuGePrintStderr( "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeLog.m",  "ZhuGeLog",  183LL,  @"Catch the NULL format pointer from: %s %s(%ld)",  v14,  v15,  v16,  v17,  (uint64_t)v19);
    }
    goto LABEL_24;
  }

  if ((a1 & 0x40000) != 0 && !hasZhuGeLogConditionalPrint())
  {
LABEL_24:
    v29 = 0LL;
    v30 = 0LL;
    v28 = 0LL;
    v21 = 0LL;
    goto LABEL_50;
  }

  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if ((isZhuGeInRestoreOS() & 1) != 0 || hasZhuGeLogPrefixPidTid())
  {
    if (qword_10001A100 != -1) {
      dispatch_once(&qword_10001A100, &stru_100014460);
    }
    -[NSMutableString appendFormat:](v21, "appendFormat:", @"%@", qword_10001A108);
  }

  if (qword_10001A128 != -1) {
    dispatch_once(&qword_10001A128, &stru_1000144C8);
  }
  v22 = &off_10001A000;
  v23 = &IOObjectRelease_ptr;
  if (byte_10001A120 && hasZhuGeLogPrefixFileFuncLine())
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lastPathComponent]);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a4));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %@(%@)>",  v25,  v26,  v27));

    v23 = &IOObjectRelease_ptr;
    v22 = &off_10001A000;

    -[NSMutableString appendFormat:](v21, "appendFormat:", @"%@", v28);
  }

  else
  {
    v28 = 0LL;
  }

  -[NSMutableString appendFormat:](v21, "appendFormat:", @"%s: ", (&off_100014480)[BYTE1(a1)]);
  v29 = [objc_alloc((Class)v23[26]) initWithFormat:v18 arguments:&a9];
  if ([v29 hasSuffix:@"\n"])
  {
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "substringToIndex:", (char *)objc_msgSend(v29, "length") - 1));

    v29 = (id)v31;
  }

  v30 = (id)objc_claimAutoreleasedReturnValue([v23[26] stringWithFormat:@"%@%@", v21, v29]);
  if (!isZhuGeInRestoreOS())
  {
    if ((a1 & 0x10000) != 0)
    {
      v37 = v22;
      v38 = __stdoutp;
      v39 = v29;
      v44 = (const char *)[v39 UTF8String];
      v40 = v38;
      v22 = v37;
      fprintf(v40, "%s\n", v44);
      if ((a1 & 0x20000) != 0)
      {
        v29 = v39;
        goto LABEL_50;
      }
    }

    if (qword_10001A110 != -1) {
      dispatch_once(&qword_10001A110, &stru_1000144A8);
    }
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (*((_BYTE *)v22 + 288))
    {
      v41 = (os_log_s *)qword_10001A118;
      if (!os_log_type_enabled((os_log_t)qword_10001A118, (os_log_type_t)a1)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 138543362;
      v46 = v30;
    }

    else
    {
      if ((a1 & 0x80410) == 0) {
        goto LABEL_50;
      }
      v41 = (os_log_s *)qword_10001A118;
      if (!os_log_type_enabled((os_log_t)qword_10001A118, (os_log_type_t)a1)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 138543362;
      v46 = v30;
    }

    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)a1, "%{public}@", buf, 0xCu);
    goto LABEL_50;
  }

  v30 = v30;
  if (isZhuGeInRestoreOS())
  {
    if (qword_10001A130 != -1) {
      dispatch_once(&qword_10001A130, &stru_1000144E8);
    }
    pthread_mutex_lock(&stru_10001A138);
    v32 = (void *)qword_10001A178;
    if (qword_10001A178) {
      goto LABEL_34;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 xpcConnection]);
    v35 = objc_claimAutoreleasedReturnValue([v34 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014528]);
    v36 = (void *)qword_10001A178;
    qword_10001A178 = v35;

    v32 = (void *)qword_10001A178;
    if (qword_10001A178)
    {
LABEL_34:
      [v32 printRemoteLog:v30];
    }

    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v23[26],  "stringWithFormat:",  @"%s ERR: Failed to get a restore log proxy!",  "[ZhuGe]"));
      sub_100006D90(v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue([v23[26] stringWithFormat:@"%s %@", "[ZhuGe]", v30]);
      sub_100006D90(v43);
    }
  }

  pthread_mutex_unlock(&stru_10001A138);

LABEL_50:
}

uint64_t ZhuGePrintStderr( const char *a1, const char *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a4;
  id v13 = v12;
  if (!a1) {
    a1 = "UnknownFile";
  }
  if (!a2) {
    a2 = "UnknownFunc";
  }
  if (v12)
  {
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (byte_10001A120)
    {
      uint64_t v14 = strrchr(a1, 47);
      if (v14) {
        uint64_t v15 = v14 + 1;
      }
      else {
        uint64_t v15 = a1;
      }
      uint64_t v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s <%s %s(%ld)> ERR: ",  "[ZhuGe]",  v15,  a2,  a3);
    }

    else
    {
      uint64_t v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s ERR: ",  "[ZhuGe]",  v28,  v29,  v30);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v19 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v13,  &a9);
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSString substringFromIndex:]( v19,  "substringFromIndex:",  (char *)-[NSString length](v19, "length") - 1));
    unsigned int v21 = [v20 isEqualToString:@"\n"];

    if (v21)
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v19, "substringToIndex:", (char *)-[NSString length](v19, "length") - 1));

      v19 = (NSString *)v22;
    }

    v23 = __stderrp;
    id v24 = v18;
    v25 = (const char *)[v24 UTF8String];
    v26 = v19;
    uint64_t v17 = fprintf(v23, "%s%s\n", v25, -[NSString UTF8String](v26, "UTF8String"));
  }

  else
  {
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (byte_10001A120) {
      fprintf( __stderrp,  "%s <ZhuGeLog.m %s(%d)> ERR: Catched NULL format pointer from: %s %s(%ld)\n",  "[ZhuGe]",  "ZhuGePrintStderr",  309,  a1,  a2,  a3);
    }
    uint64_t v17 = 0xFFFFFFFFLL;
  }

  return v17;
}

void sub_100006C10(id a1)
{
  __uint64_t v4 = 0LL;
  if (pthread_threadid_np(0LL, &v4)) {
    __uint64_t v4 = mach_thread_self();
  }
  v1 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"{%d:0x%llx}", getpid(), v4);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_10001A108;
  qword_10001A108 = v2;
}

void sub_100006C88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.zhuge", "ZhuGeService");
  uint64_t v2 = (void *)qword_10001A118;
  qword_10001A118 = (uint64_t)v1;
}

void sub_100006CB8(id a1)
{
  if ((isZhuGeInInternalBuild() & 1) != 0 || isZhuGeInFactoryBuild())
  {
    LOBYTE(v1) = islibtraceSimulatingCustomerBuild() ^ 1;
  }

  else
  {
    int v1 = isZhuGeInRestoreOS();
    if (v1) {
      LOBYTE(v1) = doesZhuGeDeemRestoreOSAsInternal();
    }
  }

  byte_10001A120 = v1;
}

void sub_100006CF8(id a1)
{
}

void sub_100006D04(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  pthread_mutex_lock(&stru_10001A138);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s ERR: Restore log connection error: %@",  "[ZhuGe]",  v2));

  sub_100006D90(v3);
  __uint64_t v4 = (void *)qword_10001A178;
  qword_10001A178 = 0LL;

  pthread_mutex_unlock(&stru_10001A138);
}

void sub_100006D90(void *a1)
{
  id v2 = a1;
  if (qword_10001A180 != -1) {
    dispatch_once(&qword_10001A180, &stru_100014548);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_10001A188, 0xFFFFFFFFFFFFFFFFLL);
  int v1 = (FILE *)qword_10001A190;
  if (qword_10001A190 || (int v1 = fopen("/dev/console", "w"), (qword_10001A190 = (uint64_t)v1) != 0))
  {
    [v2 UTF8String];
    fprintf(v1, "%s\n");
  }

  else
  {
    fprintf(__stderrp, "%s ERR: Cannot print serial log!\n");
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_10001A188);
}

void sub_100006E74(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1LL);
  id v2 = (void *)qword_10001A188;
  qword_10001A188 = (uint64_t)v1;
}

uint64_t initPthreadRecursiveMutex(pthread_mutex_t *a1)
{
  v3.__sig = 0LL;
  *(void *)v3.__opaque = 0LL;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = pthread_mutexattr_init(&v3);
  if (!(_DWORD)result)
  {
    uint64_t result = pthread_mutexattr_settype(&v3, 2);
    if (!(_DWORD)result) {
      return pthread_mutex_init(a1, &v3);
    }
  }

  return result;
}

uint64_t isZhuGeInInternalBuild()
{
  if (qword_10001A1A0 != -1) {
    dispatch_once(&qword_10001A1A0, &stru_100014568);
  }
  return byte_10001A198;
}

void sub_1000075E0(id a1)
{
  byte_10001A198 = os_variant_has_internal_content("com.apple.zhuge");
}

uint64_t isZhuGeInFactoryBuild()
{
  if (qword_10001A1B0 != -1) {
    dispatch_once(&qword_10001A1B0, &stru_100014588);
  }
  return byte_10001A1A8;
}

void sub_100007644(id a1)
{
  byte_10001A1A8 = os_variant_has_factory_content("com.apple.zhuge");
}

uint64_t islibtraceSimulatingCustomerBuild()
{
  if (qword_10001A1C0 != -1) {
    dispatch_once(&qword_10001A1C0, &stru_1000145A8);
  }
  return byte_10001A1B8;
}

void sub_1000076A8(id a1)
{
  uint64_t v1 = 0LL;
}

uint64_t getZhuGeDebugOption()
{
  unsigned int v7 = 0;
  uint64_t v6 = 0LL;
  id v0 = sub_1000077D8(@"zhuge_debug");
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  if (v1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v1));
    if ([v2 scanInt:&v7] && (objc_msgSend(v2, "isAtEnd") & 1) != 0)
    {
      pthread_mutexattr_t v3 = v2;
      goto LABEL_7;
    }

    pthread_mutexattr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v1, v6));

    if ([v3 scanHexInt:&v7] && objc_msgSend(v3, "isAtEnd"))
    {
LABEL_7:
      uint64_t v4 = v7;
      uint64_t v6 = v7;
      if (v7) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    pthread_mutexattr_t v3 = 0LL;
  }

  else {
    uint64_t v4 = 0LL;
  }
LABEL_13:

  return v4;
}

id sub_1000077D8(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
    if (v2)
    {
      io_object_t v3 = v2;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, v1, kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(CFProperty, v5) & 1) != 0)
        {
          id v6 = CFProperty;
LABEL_9:
          unsigned int v7 = v6;
LABEL_11:
          IOObjectRelease(v3);
          goto LABEL_12;
        }

        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
        if ((objc_opt_isKindOfClass(CFProperty, v8) & 1) != 0)
        {
          id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringFromData:](&OBJC_CLASS___NSString, "stringFromData:", CFProperty));
          goto LABEL_9;
        }
      }

      unsigned int v7 = 0LL;
      goto LABEL_11;
    }
  }

  unsigned int v7 = 0LL;
  CFProperty = 0LL;
LABEL_12:

  return v7;
}

uint64_t hasZhuGeLogConditionalPrint()
{
  if (qword_10001A1D0 != -1) {
    dispatch_once(&qword_10001A1D0, &stru_1000145C8);
  }
  return byte_10001A1C8;
}

void sub_100007900(id a1)
{
  byte_10001A1C8 = getZhuGeDebugOption() & 1;
}

uint64_t hasZhuGeLogPrefixFileFuncLine()
{
  if (qword_10001A1E0 != -1) {
    dispatch_once(&qword_10001A1E0, &stru_1000145E8);
  }
  return byte_10001A1D8;
}

void sub_100007960(id a1)
{
  byte_10001A1D8 = (getZhuGeDebugOption() & 4) != 0;
}

uint64_t hasZhuGeLogPrefixPidTid()
{
  if (qword_10001A1F0 != -1) {
    dispatch_once(&qword_10001A1F0, &stru_100014608);
  }
  return byte_10001A1E8;
}

void sub_1000079C0(id a1)
{
  byte_10001A1E8 = (getZhuGeDebugOption() & 2) != 0;
}

uint64_t doesZhuGeDeemRestoreOSAsInternal()
{
  if (qword_10001A200 != -1) {
    dispatch_once(&qword_10001A200, &stru_100014628);
  }
  return byte_10001A1F8;
}

void sub_100007A20(id a1)
{
  byte_10001A1F8 = (getZhuGeDebugOption() & 8) != 0;
}

uint64_t isZhuGeInRestoreOS()
{
  if (qword_10001A210 != -1) {
    dispatch_once(&qword_10001A210, &stru_100014648);
  }
  return byte_10001A208;
}

void sub_100007A80(id a1)
{
  char v1 = os_parse_boot_arg_int("-restore", 0LL);
  io_registry_entry_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist"));
  if (v2)
  {
    uint64_t v5 = v2;
    io_object_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ReleaseType"]);
    unsigned __int8 v4 = [v3 isEqualToString:@"Restore"];

    io_registry_entry_t v2 = v5;
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  byte_10001A208 = v1 & v4;
}

id isObjectNSStringAndZhuGeNull(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0) {
    id v3 = [v1 isEqualToString:@"ZHUGE_NULL"];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t isObjectNilOrZhuGeNull(void *a1)
{
  if (a1) {
    return (uint64_t)isObjectNSStringAndZhuGeNull(a1);
  }
  else {
    return 1LL;
  }
}

NSMutableArray *getZhuGeFDIPathsWithError( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v89 = 0LL;
  if (!a1)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getZhuGeFDIPathsWithError",  782LL,  @"error p-pointer is nil!",  a6,  a7,  a8,  v80);
    id v13 = 0LL;
LABEL_52:
    v23 = 0LL;
    v75 = 0LL;
    v76 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_53;
  }

  *a1 = 0LL;
  if (!qword_10001A218)
  {
    __int128 v91 = off_100014668;
    uint64_t v92 = 0LL;
    qword_10001A218 = _sl_dlopen(&v91, 0LL);
  }

  if (!qword_10001A218 || !sub_100008564()) {
    goto LABEL_50;
  }
  if (!qword_10001A218)
  {
    __int128 v91 = off_100014668;
    uint64_t v92 = 0LL;
    qword_10001A218 = _sl_dlopen(&v91, 0LL);
  }

  if (!qword_10001A218 || !sub_1000086A0()) {
    goto LABEL_50;
  }
  if (!qword_10001A218)
  {
    __int128 v91 = off_100014668;
    uint64_t v92 = 0LL;
    qword_10001A218 = _sl_dlopen(&v91, 0LL);
  }

  if (!qword_10001A218 || !sub_10000872C()) {
    goto LABEL_50;
  }
  if (!qword_10001A218)
  {
    __int128 v91 = off_100014668;
    uint64_t v92 = 0LL;
    qword_10001A218 = _sl_dlopen(&v91, 0LL);
  }

  if (!qword_10001A218 || !sub_1000087B8())
  {
LABEL_50:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getZhuGeFDIPathsWithError",  791LL,  @"Failed to link mobile storage framework",  a6,  a7,  a8,  v80);
    id v13 = 0LL;
    v23 = 0LL;
    v75 = 0LL;
    v76 = 0LL;
    uint64_t v14 = 0LL;
    *a1 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  13LL,  0LL));
    goto LABEL_53;
  }

  v9 = (uint64_t (*)(void, void **))sub_100008564();
  if (!v9) {
    sub_10000CCB8();
  }
  id v13 = (id)v9(0LL, &v89);
  if (!v13)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getZhuGeFDIPathsWithError",  801LL,  @"Failed to lookup mobile storage devices",  v10,  v11,  v12,  v80);
    v79 = v89;
    *a1 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  4LL,  v89));

    goto LABEL_52;
  }

  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v13 count])
  {
    v81 = v14;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id v13 = v13;
    id v18 = [v13 countByEnumeratingWithState:&v85 objects:v90 count:16];
    if (!v18)
    {
      v23 = 0LL;
      v82 = 0LL;
      v83 = 0LL;
      goto LABEL_57;
    }

    id v22 = v18;
    v23 = 0LL;
    v82 = 0LL;
    v83 = 0LL;
    uint64_t v24 = *(void *)v86;
    v25 = "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m";
    v26 = "getZhuGeFDIPathsWithError";
    while (1)
    {
      v27 = 0LL;
      id v84 = v22;
      do
      {
        if (*(void *)v86 != v24) {
          objc_enumerationMutation(v13);
        }
        uint64_t v28 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)v27);
        ZhuGeLog(262400, v25, v26, 815LL, @"Checking entry %@", v19, v20, v21, (uint64_t)v28);
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0)
        {
          ZhuGeLog(262656, v25, v26, 818LL, @"Entry %@ is not a dictionary", v30, v31, v32, (uint64_t)v28);
          goto LABEL_42;
        }

        v33 = sub_1000086A0();
        if (!v33) {
          sub_10000CCB8();
        }
        v34 = v26;
        v35 = v25;
        v36 = (void *)*v33;
        v37 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:*v33]);

        if (!v37)
        {
          v25 = v35;
          v69 = v35;
          v26 = v34;
          ZhuGeLog( 262656,  v69,  v34,  824LL,  @"Entry %@ doesn't contain a valid device type",  v38,  v39,  v40,  (uint64_t)v28);
          v23 = 0LL;
          goto LABEL_42;
        }

        v41 = sub_10000872C();
        if (!v41) {
          sub_10000CCB8();
        }
        uint64_t v42 = v24;
        id v43 = v13;
        v44 = (void *)*v41;
        unsigned __int8 v45 = [v37 isEqualToString:*v41];

        if ((v45 & 1) == 0)
        {
          v25 = v35;
          v70 = v35;
          v26 = v34;
          ZhuGeLog( 262656,  v70,  v34,  829LL,  @"Device type in entry %@ is not disk image",  v46,  v47,  v48,  (uint64_t)v28);
          goto LABEL_40;
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"PersonalizedImageType"]);

        if (!v49)
        {
          v25 = v35;
          v71 = v35;
          v26 = v34;
          ZhuGeLog( 262656,  v71,  v34,  834LL,  @"Entry %@ doesn't contain personalized image type",  v50,  v51,  v52,  (uint64_t)v28);
          goto LABEL_40;
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"PersonalizedImageType"]);

        if (!v53)
        {
          v25 = v35;
          v72 = v35;
          v26 = v34;
          ZhuGeLog( 262656,  v72,  v34,  840LL,  @"Entry %@ doesn't contain a valid personalized image type",  v54,  v55,  v56,  (uint64_t)v28);
          v83 = 0LL;
LABEL_40:
          v23 = v37;
LABEL_41:
          id v13 = v43;
          uint64_t v24 = v42;
          id v22 = v84;
          goto LABEL_42;
        }

        v25 = v35;
        if (([v53 isEqualToString:@"FactoryDiskImage"] & 1) == 0)
        {
          v73 = v35;
          v26 = v34;
          ZhuGeLog( 262656,  v73,  v34,  845LL,  @"Entry %@ doesn't contain a correct personalized image type",  v57,  v58,  v59,  (uint64_t)v28);
          v23 = v37;
          v83 = v53;
          goto LABEL_41;
        }

        v60 = v35;
        v26 = v34;
        ZhuGeLog( 262400,  v60,  v34,  849LL,  @"The entry %@ mounted personalized disk image with type %@",  v57,  v58,  v59,  (uint64_t)v28);
        v61 = (void *)sub_100008294();
        uint64_t v62 = objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v61]);

        if (v62)
        {
          -[NSMutableArray addObject:](v81, "addObject:", v62);
          ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  v26,  857LL,  @"Added %@ to FDI paths array",  v66,  v67,  v68,  v62);
          v23 = v37;
          v82 = (void *)v62;
          v83 = v53;
          id v13 = v43;
          uint64_t v24 = v42;
          v25 = "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m";
        }

        else
        {
          v25 = "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m";
          ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  v26,  852LL,  @"Entry %@ doesn't contain a valid personalized disk image path",  v63,  v64,  v65,  (uint64_t)v28);
          v82 = 0LL;
          v83 = v53;
          v23 = v37;
          id v13 = v43;
          uint64_t v24 = v42;
        }

        id v22 = v84;
LABEL_42:
        v27 = (char *)v27 + 1;
      }

      while (v22 != v27);
      id v74 = [v13 countByEnumeratingWithState:&v85 objects:v90 count:16];
      id v22 = v74;
      if (!v74)
      {
LABEL_57:

        uint64_t v14 = v81;
        v76 = v82;
        v75 = v83;
        goto LABEL_53;
      }
    }
  }

  ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getZhuGeFDIPathsWithError",  810LL,  @"No mobile storage device is detected",  v15,  v16,  v17,  v80);
  v23 = 0LL;
  v75 = 0LL;
  v76 = 0LL;
LABEL_53:
  v77 = v14;

  return v77;
}

uint64_t sub_100008294()
{
  id v0 = sub_1000087B8();
  if (!v0) {
    sub_10000CCB8();
  }
  return *(void *)v0;
}

uint64_t isXPCConnectionEntitled(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v8 = v4;
  if (!v3)
  {
    uint64_t v12 = @"XPC connection is invalid!";
    uint64_t v13 = 971LL;
LABEL_8:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "isXPCConnectionEntitled",  v13,  v12,  v5,  v6,  v7,  v16);
    uint64_t v11 = 0LL;
    goto LABEL_9;
  }

  if (v4)
  {
    if ((isObjectNSStringAndZhuGeNull(v4) & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:v8]);
      unsigned __int8 v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0)
      {
        id v14 = [v3 processIdentifier];
        uint64_t v12 = @"Connection(pid %d) is missing entitlement!";
        uint64_t v16 = (uint64_t)v14;
        uint64_t v13 = 983LL;
        goto LABEL_8;
      }
    }
  }

  uint64_t v11 = 1LL;
LABEL_9:

  return v11;
}

id MGQuery(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  unsigned int v21 = 0;
  if (!a2)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1541LL,  @"error p-pointer is nil!",  v4,  v5,  v6,  v20);
    goto LABEL_7;
  }

  *a2 = 0LL;
  if (!v3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1547LL,  @"MGkey pointer is nil!",  v4,  v5,  v6,  v20);
    uint64_t v18 = 45LL;
LABEL_10:
    uint64_t v11 = 0LL;
    *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  v18,  0LL));
    goto LABEL_11;
  }

  if ((MGIsQuestionValid(v3) & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1554LL,  @"%@ is not a vaild MobileGestalt key!",  v8,  v9,  v10,  (uint64_t)v7);
    uint64_t v18 = 3LL;
    goto LABEL_10;
  }

  uint64_t v11 = (void *)MGCopyAnswerWithError(v7, 0LL, &v21);
  if (!v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v21));
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1561LL,  @"Failed to query MobileGestalt for %@, MobileGestalt error code %@!",  v13,  v14,  v15,  (uint64_t)v7);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v21));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to query MobileGestalt for %@, MobileGestalt error code %@!",  v7,  v16));
    *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  4LL,  v17));

LABEL_7:
    uint64_t v11 = 0LL;
  }

LABEL_11:
  return v11;
}

  id v22 = v17;

  return v22;
}

void *sub_100008564()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  id v0 = (void *)qword_10001A220;
  uint64_t v6 = qword_10001A220;
  if (!qword_10001A220)
  {
    id v1 = (void *)sub_1000085F0();
    id v0 = dlsym(v1, "MobileStorageCopyDevicesWithError");
    v4[3] = (uint64_t)v0;
    qword_10001A220 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000085D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000085F0()
{
  uint64_t v3 = 0LL;
  if (!qword_10001A218)
  {
    __int128 v4 = off_100014668;
    uint64_t v5 = 0LL;
    qword_10001A218 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_10001A218;
  id v1 = v3;
  if (!qword_10001A218)
  {
    id v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *sub_1000086A0()
{
  uint64_t v3 = 0LL;
  __int128 v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_10001A228;
  uint64_t v6 = qword_10001A228;
  if (!qword_10001A228)
  {
    id v1 = (void *)sub_1000085F0();
    uint64_t v0 = dlsym(v1, "kMobileStorageDeviceTypeKey");
    v4[3] = (uint64_t)v0;
    qword_10001A228 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100008714( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_10000872C()
{
  uint64_t v3 = 0LL;
  __int128 v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_10001A230;
  uint64_t v6 = qword_10001A230;
  if (!qword_10001A230)
  {
    id v1 = (void *)sub_1000085F0();
    uint64_t v0 = dlsym(v1, "kMobileStorageDeviceTypeDiskImage");
    v4[3] = (uint64_t)v0;
    qword_10001A230 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000087A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_1000087B8()
{
  uint64_t v3 = 0LL;
  __int128 v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_10001A238;
  uint64_t v6 = qword_10001A238;
  if (!qword_10001A238)
  {
    id v1 = (void *)sub_1000085F0();
    uint64_t v0 = dlsym(v1, "kMobileStorageMountPathKey");
    v4[3] = (uint64_t)v0;
    qword_10001A238 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000882C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100009034(id a1)
{
  qword_10001A250 = (uint64_t)dlopen( (const char *)[@"/System/Library/PrivateFrameworks/ZhuGeSupport.framework/libZhuGeArmory.dylib" UTF8String],  1);
  if (!qword_10001A250)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getDylibHandlerWithError:]_block_invoke",  69LL,  @"Failed to dlopen ZhuGe armory dylib!",  v1,  v2,  v3,  vars0);
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  13LL,  0LL));
    uint64_t v5 = (void *)qword_10001A248;
    qword_10001A248 = v4;
  }
}

LABEL_15:
  return v15;
}

void sub_1000098DC(id a1)
{
}

uint64_t sub_1000098E8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceXpcName]);
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getXpcProxyWithError:]_block_invoke_2",  235LL,  @"Connection to %@ invalidated!",  v3,  v4,  v5,  (uint64_t)v2);

  uint64_t v6 = (void *)qword_10001A2A0;
  qword_10001A2A0 = 0LL;

  return pthread_mutex_unlock(&stru_10001A260);
}

uint64_t sub_10000996C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceXpcName]);
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getXpcProxyWithError:]_block_invoke_3",  241LL,  @"Connection to %@ interrupted!",  v3,  v4,  v5,  (uint64_t)v2);

  uint64_t v6 = (void *)qword_10001A2A0;
  qword_10001A2A0 = 0LL;

  return pthread_mutex_unlock(&stru_10001A260);
}

void sub_1000099F0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  pthread_mutex_lock(&stru_10001A260);
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getXpcProxyWithError:]_block_invoke_4",  251LL,  @"Connection failed to provide a synchronized proxy, error : %@!",  v3,  v4,  v5,  (uint64_t)v2);

  uint64_t v6 = (void *)qword_10001A2A0;
  qword_10001A2A0 = 0LL;

  pthread_mutex_unlock(&stru_10001A260);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = (void *)objc_opt_new(&OBJC_CLASS___ServiceDelegate, argv, envp);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 activate];

  return 0;
}

void sub_10000A918(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 xpcConnection]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) baseEntitlement]);
  int v5 = isXPCConnectionEntitled(v3, v4);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 xpcConnection]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v7 processIdentifier]));
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService assertCallerEntitledForService]_block_invoke",  81LL,  @"ZhuGe service connected for pid %@",  v9,  v10,  v11,  (uint64_t)v8);

    byte_10001A2B0 = 1;
  }

LABEL_8:
  uint64_t v19 = (id)qword_10001A2C8;
  return v19;
}

  uint64_t v18 = (id)qword_10001A2F0;

  return v18;
}

  v13[2](v13, v34[5], v40[5]);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

void sub_10000AD98(id a1)
{
  uint64_t v1 = -[ZhuGeCache initWithName:andCapacity:andCacheType:]( objc_alloc(&OBJC_CLASS___ZhuGeCache),  "initWithName:andCapacity:andCacheType:",  @"iCEK",  &off_100017710,  objc_opt_class(&OBJC_CLASS___NSNumber));
  uint64_t v2 = (void *)qword_10001A2C0;
  qword_10001A2C0 = (uint64_t)v1;

  +[ZhuGeInternalSupportAssistant registerCacheRefresh:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "registerCacheRefresh:",  qword_10001A2C0);
}

void sub_10000AF10(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 xpcConnection]);
  int v3 = isXPCConnectionEntitled(v2, @"com.apple.private.ZhuGeInternalSupport.CopyValue");

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xpcConnection]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 processIdentifier]));
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService assertCallerEntitledForInternalService]_block_invoke",  164LL,  @"ZhuGe service bridge-connected for pid %@",  v7,  v8,  v9,  (uint64_t)v6);

    byte_10001A2D8 = 1;
  }

void sub_10000B344(id a1)
{
  uint64_t v1 = -[ZhuGeCache initWithName:andCapacity:andCacheType:]( objc_alloc(&OBJC_CLASS___ZhuGeCache),  "initWithName:andCapacity:andCacheType:",  @"iCEIK",  &off_100017710,  objc_opt_class(&OBJC_CLASS___NSNumber));
  uint64_t v2 = (void *)qword_10001A2E8;
  qword_10001A2E8 = (uint64_t)v1;

  +[ZhuGeInternalSupportAssistant registerCacheRefresh:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "registerCacheRefresh:",  qword_10001A2E8);
}

LABEL_9:
  v13[2](v13, v29, v21);
}

void sub_10000BA34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10000BA60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000BA70(uint64_t a1)
{
}

void sub_10000BA78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000BD94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000BDB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000C080( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000C0A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000C5FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_10000C628(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000C8A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000C8C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000CB8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000CBB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000CCB8()
{
  uint64_t v0 = dlerror();
  io_object_t v1 = abort_report_np("%s", v0);
  IOObjectRelease(v1);
}

id objc_msgSend_xpcProxy(void *a1, const char *a2, ...)
{
  return [a1 xpcProxy];
}