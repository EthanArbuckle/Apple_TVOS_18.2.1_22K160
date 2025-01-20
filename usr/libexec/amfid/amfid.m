void sub_100004AF4()
{
  os_log_s *v0;
  int v1;
  const char *v2;
  v0 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "checkDeveloperModeEnrollment";
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_INFO,  "%s: developer mode is not supported",  (uint8_t *)&v1,  0xCu);
  }
}

void sub_100004B98()
{
  BOOL v0 = amfi_developer_mode_status();
  v1 = (os_log_s *)off_100020D40;
  BOOL v2 = os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      int v7 = 136315138;
      v8 = "enableDeveloperModeDaemons";
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%s: enabling developer mode daemons",  (uint8_t *)&v7,  0xCu);
    }

    int v3 = launch_enable_directory("/System/Library/DeveloperModeLaunchDaemons");
    if (v3)
    {
      int v4 = v3;
      v5 = (os_log_s *)off_100020D40;
      if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
        sub_100014AD0(v4, v5);
      }
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"security.mac.amfi.developer_mode_status.changed",  0LL,  0LL,  1u);
  }

  else if (v2)
  {
    int v7 = 136315138;
    v8 = "enableDeveloperModeDaemons";
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%s: developer mode is disabled",  (uint8_t *)&v7,  0xCu);
  }

uint64_t sub_100004CE8(uint64_t a1, void *a2)
{
  if (*a2) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = a2[1] == 0LL;
  }
  if (v2 && a2[2] == 0LL && a2[3] == 0LL)
  {
    sub_100004B98();
    return 0LL;
  }

  else
  {
    v6 = (os_log_s *)off_100020D40;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014B58((uint64_t)a2, v6);
    }
    return 5LL;
  }

void sub_100004D74( const char *a1, uint64_t a2, unsigned int a3, uint64_t a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, vm_offset_t *a8, mach_msg_type_number_t *a9, _DWORD *a10, vm_offset_t *a11, mach_msg_type_number_t *a12, _DWORD *a13)
{
  kern_return_t v33;
  void *context;
  id v39;
  context = objc_autoreleasePoolPush();
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v17));

  v19 = a6;
  *a6 = 0;
  v20 = a7;
  *a7 = 0;
  v21 = a5;
  *a5 = 0;
  *a12 = 0;
  *a11 = 0LL;
  *a13 = 0;
  id v22 = [[AMFIPathValidator_ios alloc] initWithURL:v18 withFileOffset:a2 withFlags:a3];
  v39 = 0LL;
  LODWORD(v17) = [v22 validateWithError:&v39];
  id v23 = v39;
  v24 = v23;
  if ((_DWORD)v17)
  {
    [v22 computedCdHash:a4];
    _DWORD *v21 = [v22 signerType];
    _DWORD *v19 = [v22 isValid];
    _DWORD *v20 = [v22 areEntitlementsValidated];
    v25 = (void *)objc_claimAutoreleasedReturnValue([v22 profileData]);
    id v26 = v25;
    if (v25)
    {
      vm_map_t v27 = mach_task_self_;
      id v28 = v25;
      if (vm_read(v27, (vm_address_t)[v28 bytes], objc_msgSend(v28, "length"), a8, a9))
      {
        *a10 = 0;
        *a9 = 0;
      }

      else
      {
        *a10 = 1;
      }
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v22 profileAuxSig]);
    v30 = v29;
    if (v29)
    {
      vm_map_t v31 = mach_task_self_;
      id v32 = v29;
      v33 = vm_read(v31, (vm_address_t)[v32 bytes], objc_msgSend(v32, "length"), a11, a12);
      if (v33)
      {
        syslog(3, "%s: unable to vm_read profileAuxSig: %d", a1, v33);
        *a11 = 0LL;
        *a12 = 0;
      }

      else
      {
        *a13 = 1;
      }
    }
  }

  else
  {
    id v26 = objc_claimAutoreleasedReturnValue([v23 description]);
    syslog(3, "%s not valid: %s", a1, (const char *)[v26 UTF8String]);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t sub_100005018()
{
  if (qword_100021378 != -1) {
    dispatch_once(&qword_100021378, &stru_10001CBC8);
  }
  return qword_100021370;
}

void sub_100005058(id a1)
{
  qword_100021370 = (uint64_t)dispatch_workloop_create_inactive("com.apple.amfi.mach");
  dispatch_set_target_queue((dispatch_object_t)qword_100021370, 0LL);
  dispatch_set_qos_class_fallback(qword_100021370, 33LL);
  dispatch_workloop_set_scheduler_priority(qword_100021370, 36LL, 1LL);
  dispatch_activate((dispatch_object_t)qword_100021370);
}

void sub_1000050AC()
{
  BOOL v0 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    BOOL v2 = "setupXPCInterface";
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_INFO,  "%s: XPC interface is not supported",  (uint8_t *)&v1,  0xCu);
  }

uint64_t sub_100005150(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, void *a6)
{
  if (*a6 | a6[1] | a6[2] | a6[3])
  {
    v8 = (os_log_s *)off_100020D40;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100014BF0(a2, (uint64_t)a6, v8);
    }
    return 5LL;
  }

  else
  {
    if ((os_variant_is_darwinos("com.apple.amfid") & 1) == 0) {
      sub_100009214(a2, a3, a4, a5);
    }
    return 0LL;
  }

uint64_t sub_100005200( uint64_t a1, uint64_t a2, unsigned int a3, vm_offset_t *a4, mach_msg_type_number_t *a5, _DWORD *a6, _DWORD *a7)
{
  if (*(void *)a7 | *((void *)a7 + 1) | *((void *)a7 + 2) | *((void *)a7 + 3))
  {
    syslog( 4,  "%s: bad security token { 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x }",  "construct_der_entitlements",  *a7,  a7[1],  a7[2],  a7[3],  a7[4],  a7[5],  a7[6],  a7[7]);
    return 5LL;
  }

  syslog(6, "Being asked to construct DER entitlements");
  int v13 = sub_10000746C(a2, a3);
  sub_100007428();
  if (v13)
  {
    syslog(6, "Cannot construct DER entitlements due to an entitlement anomaly");
    return 14LL;
  }

  v14 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)(a2 + 8), a3 - 8LL, kCFAllocatorNull);
  CFPropertyListRef v15 = CFPropertyListCreateWithData(kCFAllocatorDefault, v14, 0LL, 0LL, 0LL);
  CFRelease(v14);
  if (!v15)
  {
    syslog(6, "Cannot construct DER entitlements, possibly corrupt XML");
    return 14LL;
  }

  CFDataRef v21 = 0LL;
  uint64_t v16 = CESerializeCFDictionary(CECRuntime, v15, &v21);
  CFRelease(v15);
  if (v16 != kCENoError)
  {
    if (v21) {
      CFRelease(v21);
    }
    return 14LL;
  }

  vm_map_t v18 = mach_task_self_;
  BytePtr = CFDataGetBytePtr(v21);
  unsigned int Length = CFDataGetLength(v21);
  uint64_t v7 = vm_read(v18, (vm_address_t)BytePtr, Length, a4, a5);
  CFRelease(v21);
  if ((_DWORD)v7)
  {
    *a6 = 0;
    *a5 = 0;
  }

  else
  {
    *a6 = 1;
    syslog(6, "Successfully transmuted entitlements.");
  }

  return v7;
}

uint64_t sub_100005400( uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14, uint64_t a15, vm_offset_t *a16, mach_msg_type_number_t *a17, _DWORD *a18, vm_offset_t *a19, mach_msg_type_number_t *a20, _DWORD *a21, _DWORD *a22)
{
  *a8 = 0;
  *a9 = 0;
  *a11 = 0;
  *a12 = 0;
  *a13 = 0;
  *a10 = 0;
  *a17 = 0;
  *a16 = 0LL;
  *a18 = 0;
  *a20 = 0;
  *a19 = 0LL;
  *a21 = 0;
  *(void *)a15 = 0LL;
  *(void *)(a15 + 8) = 0LL;
  *(_DWORD *)(a15 + 16) = 0;
  if (*(void *)a22 | *((void *)a22 + 1) | *((void *)a22 + 2) | *((void *)a22 + 3))
  {
    syslog( 4,  "%s: bad security token { 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x }",  "verify_code_directory",  *a22,  a22[1],  a22[2],  a22[3],  a22[4],  a22[5],  a22[6],  a22[7]);
  }

  else
  {
    syslog(6, "Entering iOS path for %s", a2);
    sub_100004D74(a2, a3, a4, a15, a11, a9, a8, a16, a17, a18, a19, a20, a21);
  }

  return 0LL;
}

uint64_t start(int a1, char **a2)
{
  char v4 = 1;
  do
  {
    char v5 = v4;
    int v6 = getopt(a1, a2, "d");
    char v4 = 0;
  }

  while (v6 == 100);
  if (v6 != -1)
  {
    fprintf(__stderrp, "unrecognized argument '%c'\n", optopt);
    goto LABEL_22;
  }

  os_log_t v7 = os_log_create("com.apple.MobileFileIntegrity", "amfid");
  os_log_t v8 = (os_log_t)&_os_log_default;
  if (v7) {
    os_log_t v8 = v7;
  }
  off_100020D40 = v8;
  if ((v5 & 1) != 0) {
    int v9 = 1;
  }
  else {
    int v9 = 33;
  }
  if ((v5 & 1) != 0) {
    int v10 = 63;
  }
  else {
    int v10 = 255;
  }
  openlog("amfid", v9, 24);
  setlogmask(v10);
  syslog(6, "starting");
  v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v19.st_blksize = v11;
  *(timespec *)v19.st_qspare = v11;
  v19.st_birthtimespec = v11;
  *(timespec *)&v19.st_size = v11;
  v19.st_mtimespec = v11;
  v19.st_ctimespec = v11;
  *(timespec *)&v19.st_uid = v11;
  v19.st_atimespec = v11;
  *(timespec *)&v19.st_dev = v11;
  if (!stat("/private/var/db/amfid", &v19))
  {
LABEL_23:
    mach_port_t sp = 0;
    sub_1000057D0(&sp);
    if (sp)
    {
      uint64_t v15 = sub_100005018();
      qword_100021380 = dispatch_mach_create_f("amfi_mach_channel", v15, &off_10001CDF8, sub_100005828);
      dispatch_mach_connect();
      dispatch_release((dispatch_object_t)qword_100021380);
      if (os_variant_is_darwinos("com.apple.amfid"))
      {
        uint64_t v16 = (os_log_s *)off_100020D40;
        if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "amfid is booted as darwinOS", buf, 2u);
        }
      }

      sub_1000050AC();
      sub_10000947C();
      sub_1000092B8();
      sub_100004AF4();
      if ((os_variant_is_darwinos("com.apple.amfid") & 1) == 0) {
        sub_100009124();
      }
      sub_1000069EC();
      dispatch_main();
    }

    syslog(3, "could not get mach port");
LABEL_22:
    exit(1);
  }

  if (*__error() == 2)
  {
    if (mkdir("/private/var/db/amfid", 0x1EDu) && *__error() != 17)
    {
      v12 = (os_log_s *)off_100020D40;
      if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
        sub_100014C7C(v12);
      }
      return *__error();
    }

    goto LABEL_23;
  }

  int v13 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
    sub_100014D0C(v13);
  }
  return *__error();
}

void sub_1000057D0(mach_port_t *sp)
{
  if (bootstrap_check_in(bootstrap_port, "com.apple.MobileFileIntegrity", sp))
  {
    int v1 = __error();
    BOOL v2 = strerror(*v1);
    syslog(3, "unable to checkin with launchd: %s", v2);
  }

void sub_100005828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (void *)os_transaction_create("amfid mig server");
  uint64_t v8 = a1;
  if (a2 == 2 && (dispatch_mach_mig_demux(0LL, &v8, 1LL, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    mach_msg_destroy(msg);
  }

  if (v6) {
    os_release(v6);
  }
}

  ;
}

void sub_1000058CC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100006614( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100006634(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006644(uint64_t a1)
{
}

void sub_10000664C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v1 removeItemAtPath:@"/private/var/db/amfid/UPPCommitting.plist" error:0];
}

void sub_1000069C4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000069DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000069EC()
{
  BOOL v0 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "SEP init-state ratcheting not supported on this platform",  v1,  2u);
  }

BOOL sub_100006A50(uint64_t *a1, const __CFString *a2)
{
  if (!a1)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_1000152EC();
    return 0LL;
  }

  if (!a2)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001536C();
    return 0LL;
  }

  if (!sub_10000A00C(a1, a2))
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001566C();
    return 0LL;
  }

  uint64_t v4 = sub_100009FEC(a1);
  if (sub_1000075E4(v4, qword_100021BA8))
  {
    if ((sub_100006D0C((int)a1, (CFDictionaryRef)a2) & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_1000153EC();
      return 0LL;
    }

    return 1LL;
  }

  uint64_t v6 = sub_100009FEC(a1);
  if (sub_1000075E4(v6, qword_100021BB0))
  {
    if (!sub_100006F74((uint64_t)a1, (CFArrayRef)a2))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_10001546C();
      return 0LL;
    }

    return 1LL;
  }

  uint64_t v7 = sub_100009FEC(a1);
  if (sub_1000075E4(v7, qword_100021BB8))
  {
    if (!sub_10000703C((uint64_t)a1, a2))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_1000154EC();
      return 0LL;
    }

    return 1LL;
  }

  uint64_t v8 = sub_100009FEC(a1);
  if (sub_1000075E4(v8, qword_100021BC8))
  {
    if ((a1 != &kOSBooleanTrue_single || kCFBooleanTrue != (const CFBooleanRef)a2)
      && (a1 != &kOSBooleanFalse_single || kCFBooleanFalse != (const CFBooleanRef)a2))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_10001556C();
      return 0LL;
    }

    return 1LL;
  }

  uint64_t v9 = sub_100009FEC(a1);
  if (!sub_1000075E4(v9, qword_100021BD0))
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    int v10 = 136315138;
    timespec v11 = "BOOL valuesEqual(OSObject *, CFTypeRef)";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Encountered unknown type during %s",  (uint8_t *)&v10,  0xCu);
    return 0LL;
  }

  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_1000155EC();
    return 0LL;
  }

  return result;
}

uint64_t sub_100006D0C(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v4 = *(uint64_t ***)(a1 + 32);
  if (!v4)
  {
LABEL_6:
    keys = 0LL;
    stat v19 = 0LL;
    uint64_t v20 = 0LL;
    CFIndex Count = CFDictionaryGetCount(theDict);
    uint64_t v17 = 0LL;
    sub_10000719C((uint64_t)&keys, Count, &v17);
    CFDictionaryGetKeysAndValues(theDict, (const void **)keys, 0LL);
    uint64_t v8 = keys;
    uint64_t v9 = v19;
    if (keys == v19)
    {
      uint64_t v15 = 1LL;
      if (!keys) {
        return v15;
      }
    }

    else
    {
      while (1)
      {
        CFTypeID v10 = CFGetTypeID(*v8);
        if (v10 != CFStringGetTypeID()) {
          break;
        }
        timespec v11 = (char *)sub_10000A108((const __CFString *)*v8);
        v12 = v11 + 16;
        if (v11[39] < 0) {
          v12 = *(char **)v12;
        }
        int v13 = (uint64_t *)sub_1000071CC(a1, v12);
        sub_10000729C(v11);
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1000156EC();
          }
          goto LABEL_30;
        }

        Value = (const __CFString *)CFDictionaryGetValue(theDict, *v8);
        if (!sub_100006A50(v13, Value))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_10001576C();
          }
          goto LABEL_30;
        }

        if (++v8 == v9)
        {
          uint64_t v15 = 1LL;
          goto LABEL_31;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000157EC();
      }
LABEL_30:
      uint64_t v15 = 0LL;
LABEL_31:
      uint64_t v8 = keys;
      if (!keys) {
        return v15;
      }
    }

    stat v19 = v8;
    operator delete(v8);
    return v15;
  }

  while (sub_10000A078(v4[2]))
  {
    keys = (void **)0xAAAAAAAAAAAAAAAALL;
    char v5 = (__CFString *)sub_10000A0D0((uint64_t)v4[2]);
    keys = &v5->isa;
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001586C();
      }
      goto LABEL_22;
    }

    uint64_t v6 = (const __CFString *)CFDictionaryGetValue(theDict, v5);
    if (!sub_100006A50(v4[3], v6))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000158EC();
      }
LABEL_22:
      sub_100008DC8((const void **)&keys);
      return 0LL;
    }

    sub_100008DC8((const void **)&keys);
    uint64_t v4 = (uint64_t **)*v4;
    if (!v4) {
      goto LABEL_6;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001596C();
  }
  return 0LL;
}

void sub_100006F38( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100006F74(uint64_t a1, CFArrayRef theArray)
{
  uint64_t v4 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
  if (CFArrayGetCount(theArray) != v4 >> 3)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_100015A6C();
    return 0LL;
  }

  if (CFArrayGetCount(theArray) < 1) {
    return 1LL;
  }
  CFIndex v5 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, v5);
    if ((sub_100006A50(*(void *)(*(void *)(a1 + 16) + 8 * v5), ValueAtIndex) & 1) == 0) {
      break;
    }
    if (++v5 >= CFArrayGetCount(theArray)) {
      return 1LL;
    }
  }

  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_1000159EC();
    return 0LL;
  }

  return result;
}

BOOL sub_10000703C(uint64_t a1, const __CFString *a2)
{
  else {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 39);
  }
  size_t v5 = v4 + 1;
  uint64_t v6 = (char *)operator new[](v4 + 1);
  int CString = CFStringGetCString(a2, v6, v5, 0x8000100u);
  uint64_t v8 = (void *)(a1 + 16);
  int v9 = memcmp(v6, v8, v5);
  operator delete[](v6);
  return CString && v9 == 0;
}

BOOL sub_1000070D8(uint64_t a1, CFNumberRef number)
{
  if (CFNumberIsFloatType(number))
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)result) {
      return result;
    }
    sub_100015BEC();
    return 0LL;
  }

  if ((unint64_t)CFNumberGetByteSize(number) >= 9)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)result) {
      return result;
    }
    sub_100015B6C();
    return 0LL;
  }

  uint64_t valuePtr = 0LL;
  if (CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr)) {
    return valuePtr == *(void *)(a1 + 16);
  }
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)result)
  {
    sub_100015AEC();
    return 0LL;
  }

  return result;
}

void sub_10000719C(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + _Block_object_dispose(va, 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    sub_100008DF8((void **)a1, a2 - v3, a3);
  }

uint64_t sub_1000071CC(uint64_t a1, char *__s)
{
  uint64_t v6 = sub_100007630(__s);
  unint64_t v3 = sub_100008B9C((void *)(a1 + 16), &v6);
  if (!v3) {
    sub_100007F7C("unordered_map::at: key not found");
  }
  uint64_t v4 = v3[3];
  sub_10000729C(v6);
  return v4;
}

_DWORD *sub_10000729C(_DWORD *result)
{
  int v1 = result[2];
  if (v1 != -1)
  {
    if (v1 == -2) {
      abort();
    }
    BOOL v2 = __OFSUB__(v1, 1);
    int v3 = v1 - 1;
    result[2] = v3;
    if ((v3 < 0) ^ v2 | (v3 == 0))
    {
      result[2] = -1;
      return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 24LL))(result);
    }
  }

  return result;
}

uint64_t sub_1000072E8(uint64_t a1, uint64_t a2)
{
  CFDataRef v3 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)a2, *(void *)(a2 + 8), kCFAllocatorNull);
  CFDataRef v10 = v3;
  if (v3)
  {
    CFPropertyListRef v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, v3, 0LL, 0LL, 0LL);
    CFTypeRef cf = v4;
    if (v4 && (CFTypeID v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
    {
      CFRetain(cf);
      CFTypeRef v8 = cf;
      uint64_t v6 = sub_100006D0C(a1, (CFDictionaryRef)cf);
      sub_100008FB8(&v8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100015CEC();
      }
      uint64_t v6 = 0LL;
    }

    sub_100008F88(&cf);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100015C6C();
    }
    uint64_t v6 = 0LL;
  }

  sub_100008F58((const void **)&v10);
  return v6;
}

void sub_1000073F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  CFDataRef v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFTypeID v5 = va_arg(va2, const void *);
  sub_100008FB8((const void **)va);
  sub_100008F88((const void **)va1);
  sub_100008F58((const void **)va2);
  _Unwind_Resume(a1);
}

void sub_10000742C()
{
  for (uint64_t i = qword_100021C38; i; uint64_t i = *(void *)i)
    sub_10000729C(*(_DWORD **)(i + 40));
  sub_100008C88((uint64_t)&OSSymbol::symbols);
}

uint64_t sub_10000746C(uint64_t a1, unint64_t a2)
{
  size_t v2 = a2 - 8;
  if (a2 < 8) {
    return 1LL;
  }
  uint64_t v4 = a1 + 8;
  memset(__p, 170, sizeof(__p));
  sub_100008D20(__p, (void *)(a1 + 8), v2);
  timespec v11 = 0LL;
  uint64_t v5 = parseEntitlements((const char *)__p, &v11);
  uint64_t v6 = (_DWORD *)v5;
  uint64_t v7 = v11;
  if (!v5 || v11)
  {
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        p_meta = &v7->meta;
        if (SHIBYTE(v7->lvars) < 0) {
          p_meta = (OSMetaClass **)*p_meta;
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = p_meta;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "AMFIUnserializeXML failed: %s",  (uint8_t *)&buf,  0xCu);
        uint64_t v7 = v11;
      }

      sub_10000729C(v7);
    }

    uint64_t v3 = 0LL;
  }

  else
  {
    *(void *)&__int128 buf = v4;
    *((void *)&buf + 1) = v2;
    int v8 = sub_1000072E8(v5, (uint64_t)&buf);
    sub_10000729C(v6);
    uint64_t v3 = v8 ^ 1u;
  }

  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

void sub_1000075B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000075E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

void *sub_100007630(char *__s)
{
  uint64_t v2 = sub_1000077D0(&OSSymbol::symbols, (unsigned __int8 *)__p);
  uint64_t v3 = v2;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if (v3) {
      goto LABEL_3;
    }
  }

  else if (v2)
  {
LABEL_3:
    sub_100007E1C(__p, __s);
    uint64_t v4 = sub_100007FCC(&OSSymbol::symbols, (unsigned __int8 *)__p);
    if (!v4) {
      sub_100007F7C("unordered_map::at: key not found");
    }
    uint64_t v5 = (void *)*((void *)v4 + 5);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    sub_100007798((uint64_t)v5);
    return v5;
  }

  uint64_t v5 = operator new(0x28uLL);
  sub_1000080F0((uint64_t)v5, __s);
  void *v5 = &off_10001CC20;
  sub_100007798((uint64_t)v5);
  sub_100007E1C(__p, __s);
  int v9 = __p;
  *((void *)sub_100008684( (uint64_t)&OSSymbol::symbols,  (unsigned __int8 *)__p,  (uint64_t)&std::piecewise_construct,  (__int128 **)&v9)
  + 5) = v5;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

void sub_100007758( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007788(void *a1)
{
}

uint64_t sub_100007798(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 8);
  if (v1 != -1)
  {
    if (v1 <= 0) {
      abort();
    }
    *(_DWORD *)(result + _Block_object_dispose(va, 8) = v1 + 1;
  }

  return result;
}

unsigned __int8 *sub_1000077D0(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_1000078D0((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  CFDataRef v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  timespec v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if ((sub_100007D78(v12, v11 + 16, a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      timespec v11 = *(unsigned __int8 **)v11;
    }

    while (v11);
  }

  return v11;
}

unint64_t sub_1000078D0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }

  return sub_10000790C((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_10000790C(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      id v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return sub_100007CB8(a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return sub_100007C0C(a2, a3);
  }

  else
  {
    return sub_100007B14(a2, a3);
  }

unint64_t sub_100007B14(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t sub_100007C0C(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_100007CB8(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_100007D78(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

void *sub_100007E1C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100007ECC();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_100007ECC()
{
}

void sub_100007EE0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100007F30(exception, a1);
}

void sub_100007F1C(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100007F30(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100007F54()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100007F7C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000080CC(exception, a1);
}

void sub_100007FB8(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_100007FCC(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_1000078D0((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if ((sub_100007D78(v12, v11 + 16, a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      int v11 = *(unsigned __int8 **)v11;
    }

    while (v11);
  }

  return v11;
}

std::logic_error *sub_1000080CC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_1000080F0(uint64_t a1, char *a2)
{
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = 1;
  *(void *)a1 = &off_10001CC90;
  *(void *)(a1 + 16) = 0LL;
  uint64_t v3 = a1 + 16;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  if (a2)
  {
    sub_100007E1C(&v5, a2);
    *(_OWORD *)uint64_t v3 = v5;
    *(void *)(v3 + 16) = v6;
  }

  return a1;
}

void sub_10000816C(_Unwind_Exception *exception_object)
{
}

uint64_t sub_100008188(uint64_t a1)
{
  *(void *)a1 = &off_10001CC90;
  return a1;
}

void sub_1000081C4(void **__p)
{
  *__p = &off_10001CC90;
  operator delete(__p);
}

void *sub_100008200(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v3 = a2;
    do
    {
      sub_100008328(&std::cout, (uint64_t)"\t", 1LL);
      --v3;
    }

    while (v3);
  }

  unint64_t v4 = sub_100008328(&std::cout, (uint64_t)"OSString(", 9LL);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v6 = a1 + 16;
  uint64_t v5 = v7;
  int v8 = *(char *)(v6 + 23);
  if (v8 >= 0) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v5;
  }
  if (v8 >= 0) {
    uint64_t v10 = *(unsigned __int8 *)(v6 + 23);
  }
  else {
    uint64_t v10 = *(void *)(v6 + 8);
  }
  int v11 = sub_100008328(v4, v9, v10);
  return sub_100008328(v11, (uint64_t)")\n", 2LL);
}

uint64_t sub_10000829C(_DWORD *a1)
{
  a1[2] = -2;
  return (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 8LL))(a1);
}

uint64_t sub_1000082B0(uint64_t a1)
{
  *(void *)a1 = &off_10001CC90;
  return a1;
}

void sub_1000082EC(void **__p)
{
  *__p = &off_10001CC90;
  operator delete(__p);
}

void *sub_100008328(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  std::ostream::sentry::sentry(v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      uint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_100008494(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100008438( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_100008480(_Unwind_Exception *a1)
{
}

uint64_t sub_100008494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      sub_1000085DC(__p, v12, __c);
      unint64_t v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_1000085C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000085DC(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100007ECC();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *sub_100008684(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  size_t v7 = (void *)(a1 + 24);
  unint64_t v8 = sub_1000078D0(a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v13 = v8;
      if (v8 >= v10) {
        unint64_t v13 = v8 % v10;
      }
    }

    else
    {
      unint64_t v13 = (v10 - 1) & v8;
    }

    uint64_t v14 = *(void ***)(*(void *)a1 + 8 * v13);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v9)
        {
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= v10) {
              v16 %= v10;
            }
          }

          else
          {
            v16 &= v10 - 1;
          }

          if (v16 != v13) {
            break;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  }

  uint64_t v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0LL;
  *((void *)i + 1) = v9;
  uint64_t v18 = *a4;
  __int128 v19 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((void *)v18 + 1) = 0LL;
  *((void *)v18 + 2) = 0LL;
  *(void *)uint64_t v18 = 0LL;
  *((void *)i + 5) = 0LL;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v21 = *(float *)(a1 + 32);
  if (!v10 || (float)(v21 * (float)v10) < v20)
  {
    BOOL v22 = 1LL;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_10000891C(a1, v25);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v13 = v9 % v10;
      }
      else {
        unint64_t v13 = v9;
      }
    }

    else
    {
      unint64_t v13 = (v10 - 1) & v9;
    }
  }

  uint64_t v26 = *(void *)a1;
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v13);
  if (v27)
  {
    *(void *)uint64_t i = *v27;
LABEL_38:
    *uint64_t v27 = i;
    goto LABEL_39;
  }

  *(void *)uint64_t i = *v17;
  void *v17 = i;
  *(void *)(v26 + 8 * v13) = v17;
  if (*(void *)i)
  {
    unint64_t v28 = *(void *)(*(void *)i + 8LL);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v28 >= v10) {
        v28 %= v10;
      }
    }

    else
    {
      v28 &= v10 - 1;
    }

    uint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_38;
  }

LABEL_39:
  ++*v7;
  return i;
}

      if (v6 < 1)
      {
        unint64_t v23 = 0;
        uint64_t v6 = 0;
      }

      else
      {
        unint64_t v23 = v6 > 0x10B ? 2 : byte_100017B0A[v6];
      }

      unint64_t v24 = (v23 + v7);
      if (v24 <= 0x38 && v23 == byte_100017C16[v24])
      {
        if ((_DWORD)v24 == 6) {
          return 0LL;
        }
        uint64_t v5 = byte_100017C4F[v24];
        if (v6) {
          uint64_t v6 = -2;
        }
        else {
          uint64_t v6 = 0;
        }
        v3[1] = v76;
        ++v3;
        goto LABEL_98;
      }
    }

    if (((0x2500700uLL >> v5) & 1) != 0) {
      break;
    }
    size_t v25 = byte_100017C88[v5];
    uint64_t v26 = byte_100017CA8[v25];
    uint64_t v27 = v3[1 - v26];
    switch((int)v25)
    {
      case 2:
        v73 = "unexpected end of buffer";
        goto LABEL_180;
      case 3:
        uint64_t result = 0LL;
        *((void *)a1 + 5) = *(void *)(*v3 + 24LL);
        *(void *)(*v3 + 24LL) = 0LL;
        v72 = (void *)*v3;
        *v72 = *((void *)a1 + 3);
        *((void *)a1 + 3) = v72;
        return result;
      case 4:
        goto LABEL_177;
      case 5:
        uint64_t v27 = *v3;
        unint64_t v28 = *(void **)(*v3 + 16LL);
        if (v28)
        {
          uint64_t v29 = 0LL;
          uint64_t v30 = 0LL;
          do
          {
            uint64_t v31 = v28;
            unint64_t v28 = (void *)*v28;
            *uint64_t v31 = v30;
            ++v29;
            uint64_t v30 = v31;
          }

          while (v28);
        }

        else
        {
          uint64_t v31 = 0LL;
          uint64_t v29 = 0LL;
        }

        *(void *)(v27 + 16) = v31;
        v46 = sub_100014190(v29);
        v47 = *(void **)(v27 + 16);
        if (v47)
        {
          do
          {
            sub_1000141FC((uint64_t)v46, v47[4], v47[3]);
            sub_10000729C((_DWORD *)v47[4]);
            sub_10000729C((_DWORD *)v47[3]);
            v47[3] = 0LL;
            v47[4] = 0LL;
            v48 = (void *)*v47;
            *v47 = *((void *)a1 + 3);
            *((void *)a1 + 3) = v47;
            v47 = v48;
          }

          while (v48);
        }

        *(void *)(v27 + 24) = v46;
        if (v46) {
          goto LABEL_93;
        }
        v73 = "buildDictionary";
        goto LABEL_180;
      case 6:
        uint64_t v27 = *v3;
        uint64_t v32 = *(void **)(*v3 + 16LL);
        if (v32)
        {
          uint64_t v33 = 0LL;
          uint64_t v34 = 0LL;
          do
          {
            uint64_t v35 = v32;
            uint64_t v32 = (void *)*v32;
            *uint64_t v35 = v34;
            ++v33;
            uint64_t v34 = v35;
          }

          while (v32);
        }

        else
        {
          uint64_t v35 = 0LL;
          uint64_t v33 = 0LL;
        }

        *(void *)(v27 + 16) = v35;
        v49 = sub_100014698(v33);
        v50 = *(void **)(v27 + 16);
        if (v50)
        {
          do
          {
            sub_1000146E0(v49, v50[3]);
            sub_10000729C((_DWORD *)v50[3]);
            v50[3] = 0LL;
            v51 = (void *)*v50;
            *v50 = *((void *)a1 + 3);
            *((void *)a1 + 3) = v50;
            v50 = v51;
          }

          while (v51);
        }

        *(void *)(v27 + 24) = v49;
        if (v49) {
          goto LABEL_93;
        }
        v73 = "buildArray";
        goto LABEL_180;
      case 7:
        uint64_t v27 = *v3;
        uint64_t v36 = sub_10000A1AC(*(char **)(*v3 + 56LL));
        free(*(void **)(v27 + 56));
        *(void *)(v27 + 56) = 0LL;
        *(void *)(v27 + 24) = v36;
        if (v36) {
          goto LABEL_74;
        }
        v73 = "buildString";
        goto LABEL_180;
      case 8:
        uint64_t v27 = *v3;
        uint64_t v37 = *(void *)(*v3 + 40LL);
        unint64_t v38 = operator new(0x10uLL);
        v38[1] = 0LL;
        *((_DWORD *)v38 + 2) = 1;
        *unint64_t v38 = &off_10001D3F0;
        if (v37) {
          free(*(void **)(v27 + 48));
        }
        *(void *)(v27 + 4_Block_object_dispose(va, 8) = 0LL;
        *(void *)(v27 + 24) = v38;
LABEL_93:
        v52 = a1[12];
        a1[12] = v52 + 1;
        if (v52 < 0x1FFFF) {
          goto LABEL_94;
        }
        goto LABEL_179;
      case 9:
        uint64_t v27 = *v3;
        unint64_t v39 = *(void *)(*v3 + 64LL);
        unint64_t v40 = operator new(0x18uLL);
        v40[2] = 1;
        *(void *)unint64_t v40 = &off_10001D438;
        *((void *)v40 + 2) = v39;
        *(void *)(v27 + 24) = v40;
        goto LABEL_74;
      case 10:
        uint64_t v27 = *v3;
        if (*(void *)(*v3 + 64LL)) {
          unint64_t v41 = &kOSBooleanTrue_single;
        }
        else {
          unint64_t v41 = &kOSBooleanFalse_single;
        }
        *(void *)(v27 + 24) = v41;
        sub_100007798((uint64_t)v41);
        if (!*(void *)(v27 + 24))
        {
          v73 = "buildBoolean";
          goto LABEL_180;
        }

  ++*(void *)(a1 + 24);
  return i;
}

void sub_100008900( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void sub_10000891C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_1000089F8(a1, prime);
  }

void sub_1000089F8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100007F54();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v_Block_object_dispose(va, 8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

void sub_100008B50(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *sub_100008B9C(void *a1, void *a2)
{
  unint64_t v4 = sub_1000078D0((uint64_t)&v11, *a2 + 16LL);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v7 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v7 = (*(void *)&v5 - 1LL) & v4;
  }

  uint64_t i = *(void **)(*a1 + 8 * v7);
  if (i)
  {
    for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
    {
      unint64_t v9 = i[1];
      if (v9 == v4)
      {
        if (i[2] == *a2) {
          return i;
        }
      }

      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v9 >= *(void *)&v5) {
            v9 %= *(void *)&v5;
          }
        }

        else
        {
          v9 &= *(void *)&v5 - 1LL;
        }

        if (v9 != v7) {
          return 0LL;
        }
      }
    }
  }

  return i;
}

void sub_100008C88(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_100008CDC(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void sub_100008CDC(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      int v3 = (void **)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

void *sub_100008D20(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100007ECC();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint8x8_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000LL;
    *__dst = v6;
  }

  else
  {
    *((_BYTE *)__dst + 23) = __len;
    uint8x8_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

const void **sub_100008DC8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_100008DF8(void **a1, unint64_t a2, void *a3)
{
  size_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  size_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8LL;
      }

      while (v16);
      unint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      sub_100008F10();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      uint64_t v15 = (char *)sub_100008F24(v6, v14);
    }
    else {
      uint64_t v15 = 0LL;
    }
    uint64_t v18 = &v15[8 * v12];
    __int128 v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    float v21 = v18;
    do
    {
      *(void *)float v21 = *a3;
      v21 += 8;
      v20 -= 8LL;
    }

    while (v20);
    BOOL v22 = &v15[8 * v14];
    unint64_t v24 = (char *)*a1;
    unint64_t v23 = (char *)a1[1];
    if (v23 != *a1)
    {
      do
      {
        uint64_t v25 = *((void *)v23 - 1);
        v23 -= 8;
        *((void *)v18 - 1) = v25;
        v18 -= 8;
      }

      while (v23 != v24);
      unint64_t v23 = (char *)*a1;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void sub_100008F10()
{
}

void *sub_100008F24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100007F54();
  }
  return operator new(8 * a2);
}

const void **sub_100008F58(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100008F88(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100008FB8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_100008FE8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000907C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100021388;
  qword_100021388 = (uint64_t)v1;
}

void sub_100009124()
{
}

void sub_100009174(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[MetricsManager sharedInstance](&OBJC_CLASS___MetricsManager, "sharedInstance"));
    [v2 report];
  }

void sub_1000091C4(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[MetricsManager sharedInstance](&OBJC_CLASS___MetricsManager, "sharedInstance"));
    [v2 clean];
  }

void sub_100009214(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a1, 4LL));
  size_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 4LL));
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsManager sharedInstance](&OBJC_CLASS___MetricsManager, "sharedInstance"));
  [v8 recordWithSigningIdentifier:v9 teamIdentifier:v7 validationCategory:a3 constraintType:a4];
}

void sub_1000092B8()
{
  BOOL v0 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "setupLockdownInterface";
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_INFO,  "%s: lockdown interface is not supported",  (uint8_t *)&v1,  0xCu);
  }

void sub_10000947C()
{
  BOOL v0 = objc_alloc_init(&OBJC_CLASS___AMFIDelegate);
  int v1 = (void *)qword_100021B98;
  qword_100021B98 = (uint64_t)v0;

  id v2 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.amfi.nsxpc");
  int v3 = (void *)qword_100021BA0;
  qword_100021BA0 = (uint64_t)v2;

  [(id)qword_100021BA0 setDelegate:qword_100021B98];
  [(id)qword_100021BA0 resume];
  unint64_t v4 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "setupNSXPCInterface";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: NSXPC interface setup successfully",  (uint8_t *)&v5,  0xCu);
  }

BOOL amfi_developer_mode_status()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

void sub_1000095C4()
{
  char v10 = 0;
  memset(v9, 0, sizeof(v9));
  BOOL v0 = sub_100009EE8();
  AMFIGetSEPDeviceState(v9);
  int v1 = v9[0];
  uint64_t v2 = (os_log_s *)off_100020D40;
  BOOL v3 = os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v12 = v9[0];
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "skipping AMFI migration: %u", buf, 8u);
    }
  }

  else
  {
    if (v3)
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v12 = v0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initiating AMFI migration | TXM: %u", buf, 8u);
    }

    unint64_t v4 = (os_log_s *)off_100020D40;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "initiating MIS migration", buf, 2u);
    }

    MISDataMigrate(&off_10001D630);
    if (v0)
    {
      MISEnumerateTrustedUPPs(&stru_10001CD50);
    }

    else
    {
      int v5 = (os_log_s *)off_100020D40;
      if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "skipping auxiliary signatures for non-TXM system",  buf,  2u);
      }
    }

    int v6 = MGGetBoolAnswer(@"StoreDemoMode");
    unsigned int v7 = MGGetBoolAnswer(@"PressDemoMode");
    size_t v8 = (os_log_s *)off_100020D40;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109632;
      int v12 = v6;
      __int16 v13 = 1024;
      unsigned int v14 = v7;
      __int16 v15 = 1024;
      int v16 = v6 | v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "initiating demo state migration: %u | %u | %u",  buf,  0x14u);
    }

    AMFIDemoModeSetState(v6 | v7);
  }

void sub_1000097F8(id a1, __CFString *a2)
{
  CFTypeRef cf = 0LL;
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  if (!CStringPtr) {
    __assert_rtn("__misMigrate_block_invoke", "Migrator.m", 98, "uuidStr != NULL");
  }
  int v4 = MISCopyProvisioningProfile(a2, &cf);
  if (v4)
  {
    int v5 = (os_log_s *)off_100020D40;
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100015DE0((uint64_t)CStringPtr, v4, v5);
    }
    goto LABEL_16;
  }

  TeamIdentifier = (const __CFString *)MISProvisioningProfileGetTeamIdentifier(cf);
  unsigned int v7 = TeamIdentifier;
  if (TeamIdentifier)
  {
    size_t v8 = CFStringGetCStringPtr(TeamIdentifier, 0x8000100u);
    id v9 = (void *)MISCopyAuxiliarySignature(v7);
    MISSetProfileTrust(a2, 0LL);
    char v10 = (os_log_s *)off_100020D40;
    BOOL v11 = os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)__int128 buf = 136315138;
        int v16 = v8;
        int v12 = "misMigrate | %s: upgraded auxiliary signature";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }

    else if (v11)
    {
      *(_DWORD *)__int128 buf = 136315138;
      int v16 = v8;
      int v12 = "misMigrate | %s: created auxiliary signature";
      goto LABEL_14;
    }

    goto LABEL_16;
  }

  __int16 v13 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
    sub_100015D6C((uint64_t)CStringPtr, v13);
  }
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
}

void sub_1000099D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100009A14(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0LL;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  uint64_t v2 = (os_log_s *)off_100020D40;
  if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    unsigned int v14 = "__trustProfileIdentity";
    __int16 v15 = 2112;
    id v16 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s: adding profile %@ to trustedAppSigners",  buf,  0x16u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100009BCC;
  v6[3] = &unk_10001CD78;
  id v3 = v1;
  id v7 = v3;
  size_t v8 = &v9;
  if (MISEnumerateInstalledProvisioningProfiles(0LL, v6))
  {
    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100015ED4();
    }
  }

  else
  {
    if (*((_BYTE *)v10 + 24))
    {
      uint64_t v4 = 1LL;
      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR)) {
      sub_100015E64();
    }
  }

  uint64_t v4 = 0LL;
LABEL_9:

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_100009BAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

BOOL sub_100009BCC(uint64_t a1, uint64_t a2)
{
  uint64_t UUID = MISProvisioningProfileGetUUID(a2);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  id v6 = [v5 compare:*(void *)(a1 + 32)];
  if (!v6)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    uint64_t DeveloperCertificates = MISProvisioningProfileGetDeveloperCertificates(a2);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(DeveloperCertificates);
    id v24 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v24)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0LL; i != v24; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          char v10 = SecCertificateCreateWithData(0LL, *(CFDataRef *)(*((void *)&v29 + 1) + 8LL * (void)i));
          uint64_t v11 = v10;
          if (v10)
          {
            char v12 = (__CFString *)SecCertificateCopySubjectSummary(v10);
            if (v12)
            {
              __int16 v13 = (os_log_s *)off_100020D40;
              if (os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)__int128 buf = 136315394;
                uint64_t v35 = "__trustProfileIdentity_block_invoke";
                __int16 v36 = 2112;
                uint64_t v37 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s: adding identity %@ to trustedAppSigners",  buf,  0x16u);
              }

              unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
              __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 trustedCodeSigningIdentities]);
              id v16 = [v15 mutableCopy];

              __int128 v27 = 0u;
              __int128 v28 = 0u;
              __int128 v25 = 0u;
              __int128 v26 = 0u;
              id v17 = v16;
              id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v18)
              {
                uint64_t v19 = *(void *)v26;
                while (2)
                {
                  for (j = 0LL; j != v18; j = (char *)j + 1)
                  {
                    if (*(void *)v26 != v19) {
                      objc_enumerationMutation(v17);
                    }
                    if (![*(id *)(*((void *)&v25 + 1) + 8 * (void)j) compare:v12])
                    {

                      goto LABEL_21;
                    }
                  }

                  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              [v17 addObject:v12];
              [v14 setTrustedCodeSigningIdentities:v17];
LABEL_21:
            }

            CFRelease(v11);
          }
        }

        id v24 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }

      while (v24);
    }

    id v6 = 0LL;
  }

  BOOL v21 = v6 != 0LL;

  return v21;
}

void sub_100009EAC(_Unwind_Exception *a1)
{
}

BOOL sub_100009EE8()
{
  int v6 = 0;
  size_t v5 = 4LL;
  unsigned int v4 = 0;
  size_t v3 = 4LL;
  if (sysctlbyname("security.codesigning.monitor", &v6, &v5, 0LL, 0LL))
  {
    BOOL v0 = off_100020D40;
    BOOL result = os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015FC4(v0);
  }

  else if (sysctlbyname("security.codesigning.config", &v4, &v3, 0LL, 0LL))
  {
    uint64_t v2 = off_100020D40;
    BOOL result = os_log_type_enabled((os_log_t)off_100020D40, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015F44(v2);
  }

  else if (v6 == 2)
  {
    return v4 >> 31;
  }

  return 0LL;
}

void sub_100009FC8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100009FEC(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  return *(void *)(*a1 - 8LL);
}

BOOL sub_10000A00C(void *a1, const void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t v6 = *(void *)(*a1 - 8LL);
  size_t v3 = sub_10000A508(qword_100021BD8, &v6);
  if (!v3) {
    sub_100007F7C("unordered_map::at: key not found");
  }
  uint64_t v4 = v3[3];
  return v4 == CFGetTypeID(a2);
}

BOOL sub_10000A078(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  if (sub_1000075E4(*(void *)(*a1 - 8LL), qword_100021BB8)) {
    return 1LL;
  }
  BOOL result = sub_1000075E4(*(void *)(*a1 - 8LL), qword_100021BC0);
  if (result) {
    return 1LL;
  }
  return result;
}

CFStringRef sub_10000A0D0(uint64_t a1)
{
  if (*(char *)(a1 + 39) < 0)
  {
    id v1 = *(const UInt8 **)(a1 + 16);
    CFIndex v2 = *(void *)(a1 + 24);
  }

  else
  {
    id v1 = (const UInt8 *)(a1 + 16);
    CFIndex v2 = *(unsigned __int8 *)(a1 + 39);
  }

  return CFStringCreateWithBytes(kCFAllocatorDefault, v1, v2, 0x8000100u, 0);
}

void *sub_10000A108(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v4 = MaximumSizeForEncoding + 1;
  if (MaximumSizeForEncoding == -1) {
    return sub_10000A1AC("");
  }
  uint64_t v6 = (char *)operator new[](MaximumSizeForEncoding + 1);
  if (CFStringGetCString(a1, v6, v4, 0x8000100u))
  {
    id v7 = sub_10000A1AC(v6);
    operator delete[](v6);
    return v7;
  }

  else
  {
    operator delete[](v6);
    return 0LL;
  }

void *sub_10000A1AC(char *a1)
{
  CFIndex v2 = operator new(0x28uLL);
  sub_1000080F0((uint64_t)v2, a1);
  return v2;
}

void sub_10000A1E0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000A1F4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 16 * a3;
    do
    {
      sub_10000A268(a1, a2, a2);
      a2 += 2;
      v5 -= 16LL;
    }

    while (v5);
  }

  return a1;
}

void sub_10000A254(_Unwind_Exception *a1)
{
}

void *sub_10000A268(uint64_t a1, uint64_t *a2, _OWORD *a3)
{
  unint64_t v6 = *(void *)(*a2 + 8);
  if ((v6 & 0x8000000000000000LL) != 0)
  {
    id v7 = (unsigned __int8 *)(v6 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v8 = 5381LL;
    do
    {
      unint64_t v6 = v8;
      unsigned int v9 = *v7++;
      uint64_t v8 = (33 * v8) ^ v9;
    }

    while (v9);
  }

  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v13 = v6;
      if (v6 >= v10) {
        unint64_t v13 = v6 % v10;
      }
    }

    else
    {
      unint64_t v13 = (v10 - 1) & v6;
    }

    unsigned int v14 = *(void ***)(*(void *)a1 + 8 * v13);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = (void *)*i)
      {
        unint64_t v16 = i[1];
        if (v16 == v6)
        {
          if (sub_1000075E4(i[2], *a2)) {
            return i;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= v10) {
              v16 %= v10;
            }
          }

          else
          {
            v16 &= v10 - 1;
          }

          if (v16 != v13) {
            break;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  }

  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0LL;
  i[1] = v6;
  *((_OWORD *)i + 1) = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1LL;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_10000891C(a1, v22);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v6 >= v10) {
        unint64_t v13 = v6 % v10;
      }
      else {
        unint64_t v13 = v6;
      }
    }

    else
    {
      unint64_t v13 = (v10 - 1) & v6;
    }
  }

  uint64_t v23 = *(void *)a1;
  id v24 = *(void **)(*(void *)a1 + 8 * v13);
  if (v24)
  {
    *uint64_t i = *v24;
LABEL_41:
    void *v24 = i;
    goto LABEL_42;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v13) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8LL);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }

    else
    {
      v25 &= v10 - 1;
    }

    id v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_41;
  }

LABEL_42:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_10000A4AC(_Unwind_Exception *a1)
{
}

uint64_t sub_10000A4C0(uint64_t a1)
{
  CFIndex v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      size_t v3 = (void *)*v2;
      operator delete(v2);
      CFIndex v2 = v3;
    }

    while (v3);
  }

  CFIndex v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_10000A508(void *a1, uint64_t *a2)
{
  unint64_t v3 = *(void *)(*a2 + 8);
  if ((v3 & 0x8000000000000000LL) != 0)
  {
    CFIndex v4 = (unsigned __int8 *)(v3 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v5 = 5381LL;
    do
    {
      unint64_t v3 = v5;
      unsigned int v6 = *v4++;
      uint64_t v5 = (33 * v5) ^ v6;
    }

    while (v6);
  }

  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0LL;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  unint64_t v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v10 = v3;
    if (v3 >= *(void *)&v7) {
      unint64_t v10 = v3 % *(void *)&v7;
    }
  }

  else
  {
    unint64_t v10 = (*(void *)&v7 - 1LL) & v3;
  }

  uint8x8_t v11 = *(void **)(*a1 + 8 * v10);
  if (!v11) {
    return 0LL;
  }
  unint64_t v12 = (void *)*v11;
  if (*v11)
  {
    do
    {
      unint64_t v13 = v12[1];
      if (v3 == v13)
      {
        if (sub_1000075E4(v12[2], *a2)) {
          return v12;
        }
      }

      else
      {
        if (v9 > 1)
        {
          if (v13 >= *(void *)&v7) {
            v13 %= *(void *)&v7;
          }
        }

        else
        {
          v13 &= *(void *)&v7 - 1LL;
        }

        if (v13 != v10) {
          return 0LL;
        }
      }

      unint64_t v12 = (void *)*v12;
    }

    while (v12);
  }

  return v12;
}

uint64_t sub_10000A618()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  v7[0] = qword_100021BA8;
  v7[1] = TypeID;
  CFTypeID v1 = CFArrayGetTypeID();
  v7[2] = qword_100021BB0;
  v7[3] = v1;
  CFTypeID v2 = CFStringGetTypeID();
  v7[4] = qword_100021BB8;
  v7[5] = v2;
  CFTypeID v3 = CFStringGetTypeID();
  v7[6] = qword_100021BC0;
  v7[7] = v3;
  CFTypeID v4 = CFBooleanGetTypeID();
  v7[8] = qword_100021BC8;
  v7[9] = v4;
  CFTypeID v5 = CFNumberGetTypeID();
  v7[10] = qword_100021BD0;
  v7[11] = v5;
  sub_10000A1F4((uint64_t)&unk_100021BD8, v7, 6LL);
  return __cxa_atexit((void (*)(void *))sub_100009FE8, &unk_100021BD8, (void *)&_mh_execute_header);
}

uint64_t sub_10000A74C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

const char *sub_10000A780(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  CFTypeID v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  BOOL result = (const char *)memchr(result + 40, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }

  int v18 = -1431655766;
  int v16 = -1431655766;
  unint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  *(_DWORD *)(a2 + 52) = *(unsigned __int8 *)(a2 + 52) | 0x1000100;
  mach_msg_type_number_t v19 = 0;
  mach_msg_type_number_t v17 = 0;
  BOOL result = (const char *)sub_100005400( *((unsigned int *)v3 + 3),  v3 + 40,  *(void *)&v3[v6 + 40],  *(_DWORD *)&v3[v6 + 48],  *(unsigned int *)&v3[v6 + 52],  *(unsigned int *)&v3[v6 + 56],  *(unsigned int *)&v3[v6 + 60],  (_DWORD *)(a2 + 68),  (_DWORD *)(a2 + 72),  (_DWORD *)(a2 + 76),  (_DWORD *)(a2 + 80),  (_DWORD *)(a2 + 84),  (_DWORD *)(a2 + 88),  a2 + 100,  (uint64_t)v20,  (vm_offset_t *)(a2 + 28),  &v19,  &v18,  (vm_offset_t *)(a2 + 44),  &v17,  &v16,  (_DWORD *)v9 + 5);
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    goto LABEL_18;
  }

  mach_msg_type_number_t v11 = v19;
  *(_BYTE *)(a2 + 36) = v18;
  *(_DWORD *)(a2 + 40) = v11;
  mach_msg_type_number_t v12 = v17;
  *(_BYTE *)(a2 + 52) = v16;
  *(_DWORD *)(a2 + 56) = v12;
  NDR_record_t v13 = NDR_record;
  *(NDR_record_t *)(a2 + 60) = NDR_record;
  BOOL result = (const char *)strlen((const char *)(a2 + 100));
  if ((unint64_t)(result + 1) >> 32)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = v13;
  }

  else
  {
    *(_DWORD *)(a2 + 92) = 0;
    *(_DWORD *)(a2 + 96) = (_DWORD)result + 1;
    uint64_t v14 = ((_DWORD)result + 4) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v14 + 128;
    uint64_t v15 = a2 + v14;
    *(_OWORD *)(v15 + 100) = *(_OWORD *)v20;
    *(_DWORD *)(v15 + 116) = *(_DWORD *)&v20[16];
    *(_DWORD *)(v15 + 120) = v11;
    *(_DWORD *)(v15 + 124) = v12;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 2;
  }

  return result;
}

void sub_10000A9E0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  int v6 = -1431655766;
  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  int v5 = sub_100005200( *(unsigned int *)(a1 + 12),  *(void *)(a1 + 28),  *(_DWORD *)(a1 + 40),  (vm_offset_t *)(a2 + 28),  (mach_msg_type_number_t *)(a2 + 52),  &v6,  (_DWORD *)(a1 + 76));
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  if (!v5)
  {
    *(_BYTE *)(a2 + 36) = v6;
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }

  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_10000AB24(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_26;
  }
  CFTypeID v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[9];
  if (v5 > 0x100) {
    goto LABEL_26;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = (char *)result + v6;
  unsigned int v9 = *((_DWORD *)v8 + 11);
  if (v9 > 0x40) {
    goto LABEL_26;
  }
  unsigned int v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v4 - v6;
  if (v11 - 56 < v9 || v11 != v10 + 56) {
    goto LABEL_26;
  }
  uint64_t v13 = 296LL;
  BOOL result = memchr(result + 10, 0, v13 - 40);
  if (result
    && ((v14 = v8 - 256, uint64_t v15 = v8 + 48, (char *)v3 + v4 - v15 >= 64) ? (v16 = 64LL) : (v16 = (char *)v3 + v4 - v15),
        (BOOL result = memchr(v15, 0, v16)) != 0LL))
  {
    mach_msg_type_number_t v17 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v17 && *((_DWORD *)v17 + 1) > 0x1Fu)
    {
      uint64_t v19 = v3[3];
      unsigned int v20 = v14[v10 + 304];
      unsigned int v21 = v14[v10 + 308];
      __int128 v22 = *(_OWORD *)(v17 + 36);
      v23[0] = *(_OWORD *)(v17 + 20);
      v23[1] = v22;
      BOOL result = (_DWORD *)sub_100005150(v19, (uint64_t)(v3 + 10), (uint64_t)v15, v20, v21, v23);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v18 = -309;
  }

  else
  {
LABEL_26:
    int v18 = -304;
  }

  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000ACA0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }

  else
  {
    CFTypeID v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      BOOL result = (_DWORD *)sub_100004CE8(v5, v7);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v4 = -309;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000AD34(unsigned __int8 a1)
{
  return a1 + 1LL;
}

BOOL sub_10000AD40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_10000AD58()
{
}

uint64_t sub_10000AD88@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_10000E98C(*a1);
  *a2 = result;
  return result;
}

void sub_10000ADB0(void *a1@<X8>)
{
  *a1 = *v1 + 1LL;
}

uint64_t sub_10000ADC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000FB84();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000AE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000FB84();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_10000AE6C()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

Swift::Int sub_10000AEB0(uint64_t a1)
{
  uint64_t v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2 + 1);
  return Hasher._finalize()();
}

uint64_t sub_10000AEF0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_10000E9B0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000AF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000FB40();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000AF74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000FB40();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_10000AFC0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 168LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000AFF0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 176LL);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t sub_10000B034()
{
  return sub_10000B200((uint64_t)&unk_100017508);
}

uint64_t sub_10000B040(uint64_t a1, uint64_t a2)
{
  return sub_10000B2E8(a1, a2, (uint64_t)&unk_100017508, (uint64_t)sub_10000EA88);
}

void (*sub_10000B054(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x38uLL);
  *a1 = v4;
  uint64_t v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[4] = v2;
  v4[5] = v5;
  v4[2] = v2;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017508);
  uint64_t v7 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  v4[6] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 2, KeyPath, v7);
  swift_release(KeyPath);
  uint64_t v8 = swift_getKeyPath(&unk_100017508);
  uint64_t v9 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.getValue<A>(forKey:)(v4 + 2, v8, v9, &protocol witness table for String);
  swift_release(v8);
  uint64_t v10 = v4[3];
  *uint64_t v4 = v4[2];
  v4[1] = v10;
  return sub_10000B164;
}

void sub_10000B164(uint64_t **a1, char a2)
{
}

uint64_t sub_10000B180@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000B1B0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 224LL);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t sub_10000B1F4()
{
  return sub_10000B200((uint64_t)&unk_100017530);
}

uint64_t sub_10000B200(uint64_t a1)
{
  uint64_t v8 = v1;
  uint64_t KeyPath = swift_getKeyPath(a1);
  uint64_t v4 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  uint64_t v5 = swift_getKeyPath(a1);
  uint64_t v6 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.getValue<A>(forKey:)(&v8, v5, v6, &protocol witness table for String);
  swift_release(v5);
  return v8;
}

uint64_t sub_10000B2D4(uint64_t a1, uint64_t a2)
{
  return sub_10000B2E8(a1, a2, (uint64_t)&unk_100017530, (uint64_t)sub_10000EABC);
}

uint64_t sub_10000B2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath = swift_getKeyPath(a3);
  uint64_t v12 = v4;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v9 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v15,  KeyPath,  a4,  &v11,  (char *)&type metadata for () + 8,  v9);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000B3A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath = swift_getKeyPath(a4);
  v9[0] = a2;
  v9[1] = a3;
  uint64_t v7 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.setValue<A>(forKey:to:)(KeyPath, v9, v7, &protocol witness table for String);
  return swift_release(KeyPath);
}

void (*sub_10000B424(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x38uLL);
  *a1 = v4;
  uint64_t v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[4] = v2;
  v4[5] = v5;
  v4[2] = v2;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017530);
  uint64_t v7 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  v4[6] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 2, KeyPath, v7);
  swift_release(KeyPath);
  uint64_t v8 = swift_getKeyPath(&unk_100017530);
  uint64_t v9 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.getValue<A>(forKey:)(v4 + 2, v8, v9, &protocol witness table for String);
  swift_release(v8);
  uint64_t v10 = v4[3];
  *uint64_t v4 = v4[2];
  v4[1] = v10;
  return sub_10000B534;
}

void sub_10000B534(uint64_t **a1, char a2)
{
}

void sub_10000B550(uint64_t **a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  uint64_t v7 = (*a1)[4];
  v6[2] = v7;
  uint64_t v9 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v10 = v6[6];
  uint64_t KeyPath = swift_getKeyPath(a3);
  uint64_t v15 = v7;
  uint64_t v16 = v9;
  uint64_t v17 = v8;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain(v8);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( v6 + 2,  KeyPath,  a5,  v14,  (char *)&type metadata for () + 8,  v10);
    swift_bridgeObjectRelease(v8);
    swift_release(KeyPath);
    swift_bridgeObjectRelease(v6[1]);
  }

  else
  {
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( v6 + 2,  KeyPath,  a4,  v14,  (char *)&type metadata for () + 8,  v10);
    swift_bridgeObjectRelease(v8);
    swift_release(KeyPath);
  }

  free(v6);
}

uint64_t sub_10000B664@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 264LL))();
  *a2 = result;
  return result;
}

uint64_t sub_10000B694(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 272LL))(*a1);
}

uint64_t sub_10000B6C0()
{
  return sub_10000B91C((uint64_t)&unk_100017558);
}

uint64_t sub_10000B6CC(uint64_t a1)
{
  return sub_10000BA04(a1, (uint64_t)&unk_100017558, (uint64_t)sub_10000EAF0);
}

void (*sub_10000B6E0(void *a1))(uint64_t **a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  uint64_t v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[2] = v2;
  v4[3] = v5;
  v4[1] = v2;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017558);
  uint64_t v7 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  v4[4] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 1, KeyPath, v7);
  swift_release(KeyPath);
  uint64_t v8 = swift_getKeyPath(&unk_100017558);
  uint64_t v9 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.getValue<A>(forKey:)(v4 + 1, v8, v9, &protocol witness table for Int);
  swift_release(v8);
  *uint64_t v4 = v4[1];
  return sub_10000B7EC;
}

void sub_10000B7EC(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  uint64_t v3 = (*a1)[4];
  uint64_t v4 = (*a1)[2];
  uint64_t v5 = *a1;
  v5[1] = v4;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017558);
  _OWORD v7[2] = v4;
  v7[3] = v2;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( v5 + 1,  KeyPath,  sub_100010348,  v7,  (char *)&type metadata for () + 8,  v3);
  swift_release(KeyPath);
  free(v1);
}

uint64_t sub_10000B8B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 312LL))();
  *a2 = result;
  return result;
}

uint64_t sub_10000B8E4(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 320LL))(*a1);
}

uint64_t sub_10000B910()
{
  return sub_10000B91C((uint64_t)&unk_100017580);
}

uint64_t sub_10000B91C(uint64_t a1)
{
  uint64_t v8 = v1;
  uint64_t KeyPath = swift_getKeyPath(a1);
  uint64_t v4 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  uint64_t v5 = swift_getKeyPath(a1);
  uint64_t v6 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.getValue<A>(forKey:)(&v8, v5, v6, &protocol witness table for Int);
  swift_release(v5);
  return v8;
}

uint64_t sub_10000B9F0(uint64_t a1)
{
  return sub_10000BA04(a1, (uint64_t)&unk_100017580, (uint64_t)sub_10000EB20);
}

uint64_t sub_10000BA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(a2);
  uint64_t v10 = v3;
  uint64_t v11 = a1;
  uint64_t v7 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v12,  KeyPath,  a3,  &v9,  (char *)&type metadata for () + 8,  v7);
  return swift_release(KeyPath);
}

uint64_t sub_10000BAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(a3);
  uint64_t v7 = a2;
  uint64_t v5 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.setValue<A>(forKey:to:)(KeyPath, &v7, v5, &protocol witness table for Int);
  return swift_release(KeyPath);
}

void (*sub_10000BB28(void *a1))(uint64_t **a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  uint64_t v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[2] = v2;
  v4[3] = v5;
  v4[1] = v2;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017580);
  uint64_t v7 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  v4[4] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 1, KeyPath, v7);
  swift_release(KeyPath);
  uint64_t v8 = swift_getKeyPath(&unk_100017580);
  uint64_t v9 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.getValue<A>(forKey:)(v4 + 1, v8, v9, &protocol witness table for Int);
  swift_release(v8);
  *uint64_t v4 = v4[1];
  return sub_10000BC34;
}

void sub_10000BC34(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  uint64_t v3 = (*a1)[4];
  uint64_t v4 = (*a1)[2];
  uint64_t v5 = *a1;
  v5[1] = v4;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017580);
  _OWORD v7[2] = v4;
  v7[3] = v2;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( v5 + 1,  KeyPath,  sub_10001035C,  v7,  (char *)&type metadata for () + 8,  v3);
  swift_release(KeyPath);
  free(v1);
}

uint64_t sub_10000BCFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 360LL))();
}

uint64_t sub_10000BD24(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 368LL))(v5);
}

uint64_t sub_10000BDAC@<X0>(void *a1@<X8>)
{
  return sub_10000BFF8((uint64_t)&unk_1000175A8, a1);
}

uint64_t sub_10000BDB8(uint64_t a1)
{
  return sub_10000C0FC(a1, (uint64_t)&unk_1000175A8, (uint64_t)sub_10000EB50);
}

void (*sub_10000BDCC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  v4[3] = v2;
  uint64_t v5 = type metadata accessor for Date(0LL);
  v4[4] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[5] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v4[6] = malloc(v7);
  uint64_t v8 = malloc(v7);
  uint64_t v9 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[7] = v8;
  v4[8] = v9;
  *uint64_t v4 = v2;
  uint64_t KeyPath = swift_getKeyPath(&unk_1000175A8);
  uint64_t v11 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  void v4[9] = v11;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4, KeyPath, v11);
  swift_release(KeyPath);
  uint64_t v12 = swift_getKeyPath(&unk_1000175A8);
  uint64_t v13 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  uint64_t v14 = sub_10000F5E8( &qword_100020E80,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.getValue<A>(forKey:)(v8, v12, v13, v14);
  swift_release(v12);
  return sub_10000BF20;
}

void sub_10000BF20(uint64_t a1, char a2)
{
}

uint64_t sub_10000BF3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 408LL))();
}

uint64_t sub_10000BF64(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 416LL))(v5);
}

uint64_t sub_10000BFEC@<X0>(void *a1@<X8>)
{
  return sub_10000BFF8((uint64_t)&unk_1000175D0, a1);
}

uint64_t sub_10000BFF8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v11 = v2;
  uint64_t KeyPath = swift_getKeyPath(a1);
  uint64_t v6 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v6);
  swift_release(KeyPath);
  uint64_t v7 = swift_getKeyPath(a1);
  uint64_t v8 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  uint64_t v9 = sub_10000F5E8( &qword_100020E80,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.getValue<A>(forKey:)(a2, v7, v8, v9);
  return swift_release(v7);
}

uint64_t sub_10000C0E8(uint64_t a1)
{
  return sub_10000C0FC(a1, (uint64_t)&unk_1000175D0, (uint64_t)sub_10000EB80);
}

uint64_t sub_10000C0FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(a2);
  uint64_t v11 = v3;
  uint64_t v12 = a1;
  uint64_t v7 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( &v13,  KeyPath,  a3,  &v10,  (char *)&type metadata for () + 8,  v7);
  swift_release(KeyPath);
  uint64_t v8 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(a1, v8);
}

uint64_t sub_10000C1C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(a3);
  uint64_t v5 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  uint64_t v6 = sub_10000F5E8( &qword_100020E78,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.setValue<A>(forKey:to:)(KeyPath, a2, v5, v6);
  return swift_release(KeyPath);
}

void (*sub_10000C248(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  v4[3] = v2;
  uint64_t v5 = type metadata accessor for Date(0LL);
  v4[4] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[5] = v6;
  size_t v7 = *(void *)(v6 + 64);
  v4[6] = malloc(v7);
  uint64_t v8 = malloc(v7);
  uint64_t v9 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[7] = v8;
  v4[8] = v9;
  *uint64_t v4 = v2;
  uint64_t KeyPath = swift_getKeyPath(&unk_1000175D0);
  uint64_t v11 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  void v4[9] = v11;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4, KeyPath, v11);
  swift_release(KeyPath);
  uint64_t v12 = swift_getKeyPath(&unk_1000175D0);
  uint64_t v13 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  uint64_t v14 = sub_10000F5E8( &qword_100020E80,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.getValue<A>(forKey:)(v8, v12, v13, v14);
  swift_release(v12);
  return sub_10000C39C;
}

void sub_10000C39C(uint64_t a1, char a2)
{
}

void sub_10000C3B8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v22 = *(void *)(*(void *)a1 + 72LL);
  size_t v7 = (void *)v6[7];
  uint64_t v9 = v6[5];
  uint64_t v8 = (void *)v6[6];
  uint64_t v10 = v6[3];
  uint64_t v11 = v6[4];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void, void, void))(v9 + 16))(v6[6], v6[7], v6[4]);
    v6[1] = v10;
    uint64_t KeyPath = swift_getKeyPath(a3);
    unsigned int v21 = &v20;
    __chkstk_darwin();
    uint64_t v18 = v10;
    uint64_t v19 = v8;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( v6 + 1,  KeyPath,  a5,  v17,  (char *)&type metadata for () + 8,  v22);
    swift_release(KeyPath);
    uint64_t v14 = *(void (**)(void *, uint64_t))(v9 + 8);
    v14(v8, v11);
    v14(v7, v11);
  }

  else
  {
    v6[2] = v10;
    uint64_t v16 = swift_getKeyPath(a3);
    unsigned int v21 = &v20;
    __chkstk_darwin();
    uint64_t v18 = v10;
    uint64_t v19 = v7;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( v6 + 2,  v16,  a4,  v17,  (char *)&type metadata for () + 8,  v22);
    swift_release(v16);
    (*(void (**)(void *, uint64_t))(v9 + 8))(v7, v11);
  }

  free(v7);
  free(v8);
  free(v6);
}

uint64_t sub_10000C560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  uint64_t v15 = swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  sub_10000C5E4(a1, a2, a3, a4, a5, a6, a7);
  return v15;
}

void *sub_10000C5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  v48 = a7;
  uint64_t v45 = a5;
  uint64_t v46 = a6;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v47 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for ConstraintUsage(0LL);
  v7[5] = sub_10000EBB0(&qword_100020E88);
  v49 = v7;
  uint64_t v14 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  v52[0] = v13;
  v52[1] = v13;
  v52[2] = v14;
  uint64_t v53 = v14;
  void v7[6] = swift_getOpaqueTypeConformance2( v52,  &opaque type descriptor for <<opaque return type of static PersistentModel.createBackingData<A>()>>,  1LL);
  sub_10000EBF0(v7 + 2);
  uint64_t v15 = static PersistentModel.createBackingData<A>()(v13, v13, v14, v14);
  ObservationRegistrar.init()(v15);
  sub_10000E9C4((uint64_t)(v7 + 2), (uint64_t)v52);
  uint64_t v17 = v53;
  uint64_t v16 = v54;
  sub_10000EA08(v52, v53);
  uint64_t KeyPath = swift_getKeyPath(&unk_100017508);
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)( KeyPath,  &v50,  &type metadata for String,  &protocol witness table for String,  v17,  v16);
  swift_bridgeObjectRelease(a2);
  swift_release(KeyPath);
  sub_10000EA2C(v52);
  sub_10000E9C4((uint64_t)(v7 + 2), (uint64_t)v52);
  uint64_t v19 = v53;
  uint64_t v20 = v54;
  sub_10000EA08(v52, v53);
  uint64_t v21 = swift_getKeyPath(&unk_100017530);
  uint64_t v22 = v44;
  uint64_t v50 = v43;
  uint64_t v51 = v44;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)( v21,  &v50,  &type metadata for String,  &protocol witness table for String,  v19,  v20);
  swift_bridgeObjectRelease(v22);
  swift_release(v21);
  sub_10000EA2C(v52);
  uint64_t v23 = v45 + 1LL;
  sub_10000E9C4((uint64_t)(v7 + 2), (uint64_t)v52);
  uint64_t v24 = v53;
  uint64_t v25 = v54;
  sub_10000EA08(v52, v53);
  uint64_t v26 = swift_getKeyPath(&unk_100017558);
  uint64_t v50 = v23;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)( v26,  &v50,  &type metadata for Int,  &protocol witness table for Int,  v24,  v25);
  swift_release(v26);
  sub_10000EA2C(v52);
  uint64_t v27 = v46 + 1LL;
  sub_10000E9C4((uint64_t)(v7 + 2), (uint64_t)v52);
  uint64_t v28 = v53;
  uint64_t v29 = v54;
  sub_10000EA08(v52, v53);
  uint64_t v30 = swift_getKeyPath(&unk_100017580);
  uint64_t v50 = v27;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)( v30,  &v50,  &type metadata for Int,  &protocol witness table for Int,  v28,  v29);
  swift_release(v30);
  sub_10000EA2C(v52);
  uint64_t v32 = v47;
  __int128 v31 = v48;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v12, v48, v10);
  sub_10000E9C4((uint64_t)(v7 + 2), (uint64_t)v52);
  uint64_t v33 = v53;
  uint64_t v34 = v54;
  sub_10000EA08(v52, v53);
  uint64_t v35 = swift_getKeyPath(&unk_1000175A8);
  uint64_t v36 = sub_10000F5E8( &qword_100020E78,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v35, v12, v10, v36, v33, v34);
  swift_release(v35);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v32 + 8);
  v37(v12, v10);
  uint64_t v38 = sub_10000EA2C(v52);
  static Date.distantPast.getter(v38);
  sub_10000E9C4((uint64_t)(v7 + 2), (uint64_t)v52);
  uint64_t v39 = v53;
  uint64_t v40 = v54;
  sub_10000EA08(v52, v53);
  uint64_t v41 = swift_getKeyPath(&unk_1000175D0);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v41, v12, v10, v36, v39, v40);
  swift_release(v41);
  v37(v12, v10);
  sub_10000EA2C(v52);
  v37(v31, v10);
  return v49;
}

uint64_t sub_10000C9F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return sub_10000E9C4(v3, a1);
}

uint64_t sub_10000CA38(__int128 *a1)
{
  uint64_t v3 = (void *)(v1 + 16);
  swift_beginAccess(v3, v5, 33LL, 0LL);
  sub_10000EA2C(v3);
  sub_10000EC2C(a1, (uint64_t)v3);
  return swift_endAccess(v5);
}

void (*sub_10000CA90(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess(v1 + 16, v3 + 10, 0LL, 0LL);
  sub_10000E9C4(v1 + 16, (uint64_t)v3);
  return sub_10000CAF8;
}

void sub_10000CAF8(uint64_t *a1, char a2)
{
  uint64_t v2 = (__int128 *)*a1;
  uint64_t v3 = (__int128 *)(*a1 + 40);
  if ((a2 & 1) != 0)
  {
    uint64_t v4 = (void *)(*((void *)v2 + 16) + 16LL);
    sub_10000E9C4(*a1, (uint64_t)v3);
    swift_beginAccess(v4, (char *)v2 + 104, 33LL, 0LL);
    sub_10000EA2C(v4);
    sub_10000EC2C(v3, (uint64_t)v4);
    swift_endAccess((char *)v2 + 104);
    sub_10000EA2C(v2);
  }

  else
  {
    uint64_t v5 = (void *)(*((void *)v2 + 16) + 16LL);
    swift_beginAccess(v5, v3, 33LL, 0LL);
    sub_10000EA2C(v5);
    sub_10000EC2C(v2, (uint64_t)v5);
    swift_endAccess(v3);
  }

  free(v2);
}

uint64_t sub_10000CBB4(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  sub_10000CBF0(a1);
  return v3;
}

void *sub_10000CBF0(void *a1)
{
  uint64_t v3 = type metadata accessor for ConstraintUsage(0LL);
  v1[5] = sub_10000EBB0(&qword_100020E88);
  uint64_t v4 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  v7[0] = v3;
  v7[1] = v3;
  _OWORD v7[2] = v4;
  v7[3] = v4;
  v1[6] = swift_getOpaqueTypeConformance2( v7,  &opaque type descriptor for <<opaque return type of static PersistentModel.createBackingData<A>()>>,  1LL);
  sub_10000EBF0(v1 + 2);
  uint64_t v5 = static PersistentModel.createBackingData<A>()(v3, v3, v4, v4);
  ObservationRegistrar.init()(v5);
  sub_10000E9C4((uint64_t)a1, (uint64_t)v7);
  (*(void (**)(void *))(*v1 + 472LL))(v7);
  sub_10000EA2C(a1);
  return v1;
}

uint64_t sub_10000CCEC(uint64_t a1)
{
  uint64_t v2 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  return ObservationRegistrar.access<A, B>(_:keyPath:)(&v4, a1, v2);
}

uint64_t sub_10000CD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v10, a1, a2, a3, a4, v8);
}

uint64_t sub_10000CDFC()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_10000CE54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ModelConfiguration(0LL);
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = v7[8];
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = v3;
  uint64_t v33 = v2;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v34 = a1;
  v10(v5, a1, v2);
  type metadata accessor for ModelConfiguration.CloudKitDatabase(0LL);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static ModelConfiguration.CloudKitDatabase.automatic.getter(v11);
  uint64_t v14 = ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)(0LL, 0LL, 0LL, v5, 1LL, v13);
  __chkstk_darwin(v14);
  uint64_t v15 = (void (*)(char *, char *, uint64_t))v7[2];
  v15(v9, v9, v6);
  uint64_t v16 = type metadata accessor for ModelContainer(0LL);
  uint64_t v17 = sub_10000EBB0(&qword_100020E90);
  uint64_t v18 = swift_allocObject(v17, 48LL, 7LL);
  __int128 v30 = xmmword_1000174D0;
  *(_OWORD *)(v18 + 16) = xmmword_1000174D0;
  uint64_t v19 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v20 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  *(void *)(v18 + 3sub_10000EA2C(v0 + 2) = v19;
  *(void *)(v18 + 40) = v20;
  uint64_t v21 = sub_10000EBB0(&qword_100020E98);
  uint64_t v22 = swift_allocObject(v21, 72LL, 7LL);
  *(_OWORD *)(v22 + 16) = v30;
  *(void *)(v22 + 56) = v6;
  *(void *)(v22 + 64) = sub_10000F5E8( &qword_100020EA0,  (void (*)(uint64_t))&type metadata accessor for ModelConfiguration,  (uint64_t)&protocol conformance descriptor for ModelConfiguration);
  uint64_t v23 = (char *)sub_10000EBF0((void *)(v22 + 32));
  v15(v23, v9, v6);
  uint64_t v24 = v31;
  uint64_t v25 = ModelContainer.__allocating_init(for:configurations:)(v18, v22);
  if (!v24)
  {
    uint64_t v16 = v25;
    uint64_t v27 = type metadata accessor for ModelContext(0LL);
    swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
    uint64_t v28 = swift_retain(v16);
    ModelContext.init(_:)(v28);
  }

  uint64_t v26 = (void (*)(char *, uint64_t))v7[1];
  v26(v9, v6);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  v26(v9, v6);
  return v16;
}

uint64_t sub_10000D128( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = a8;
  uint64_t v29 = a7;
  char v9 = a6;
  int v25 = a6;
  uint64_t v15 = sub_10000EBB0(&qword_100020EA8);
  __chkstk_darwin(v15);
  uint64_t v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v27 = sub_10000EBB0(&qword_100020EB0);
  uint64_t v26 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v19 = &v24[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  char v46 = a5;
  char v47 = v9;
  uint64_t v20 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v48 = v20;
  Predicate.init(_:)(sub_10000EEB4, v41, 1LL, &v48);
  uint64_t v21 = sub_10000EBB0(&qword_100020EB8);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v17, 0LL, 1LL, v21);
  uint64_t v22 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  FetchDescriptor.init(predicate:sortBy:)(v17, &_swiftEmptyArrayStorage, v20, v22);
  uint64_t v31 = v28;
  uint64_t v32 = a9;
  uint64_t v33 = v19;
  uint64_t v34 = v29;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v37 = a3;
  uint64_t v38 = a4;
  char v39 = a5;
  char v40 = v25;
  dispatch thunk of ModelContext.transaction(block:)(sub_10000EEC8, v30);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v26 + 8))(v19, v27);
}

uint64_t sub_10000D318@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, int a7@<W6>, void *a8@<X8>)
{
  int v133 = a7;
  LODWORD(v127) = a6;
  uint64_t v115 = a5;
  uint64_t v114 = a4;
  uint64_t v109 = a3;
  uint64_t v110 = a2;
  v139 = a8;
  uint64_t v9 = sub_10000EBB0(&qword_1000211B0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v134 = v9;
  uint64_t v135 = v10;
  __chkstk_darwin(v9);
  v130 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000EBB0(&qword_1000211B8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v136 = v12;
  uint64_t v137 = v13;
  __chkstk_darwin(v12);
  v131 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v138 = sub_10000EBB0(&qword_1000211C0);
  uint64_t v140 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  v132 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v119 = sub_10000EBB0(&qword_1000211C8);
  uint64_t v121 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  v116 = (char *)&v97 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v123 = sub_10000EBB0(&qword_1000211D0);
  uint64_t v124 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  v117 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v120 = sub_10000EBB0(&qword_1000211D8);
  uint64_t v122 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  v111 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_10000EBB0(&qword_1000211E0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v125 = v19;
  uint64_t v126 = v20;
  __chkstk_darwin(v19);
  v118 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v104 = sub_10000EBB0(&qword_1000211E8);
  uint64_t v106 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  v100 = (char *)&v97 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = sub_10000EBB0(&qword_100021148);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v101 = sub_10000EBB0(&qword_1000211F0);
  uint64_t v102 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  uint64_t v28 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v107 = sub_10000EBB0(&qword_1000211F8);
  uint64_t v108 = *(void *)(v107 - 8);
  uint64_t v29 = __chkstk_darwin(v107);
  v103 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v29);
  v98 = (char *)&v97 - v31;
  uint64_t v112 = sub_10000EBB0(&qword_100021200);
  uint64_t v113 = *(void *)(v112 - 8);
  __chkstk_darwin(v112);
  v105 = (char *)&v97 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = sub_10000EBB0(&qword_100021208);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v128 = v33;
  uint64_t v129 = v34;
  __chkstk_darwin(v33);
  v142 = (char *)&v97 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = *a1;
  uint64_t v37 = sub_1000102FC( &qword_100021158,  &qword_100021148,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  uint64_t v97 = v36;
  uint64_t v143 = v37;
  static PredicateExpressions.build_Arg<A>(_:)(v36, v23, v37);
  uint64_t KeyPath = swift_getKeyPath(&unk_100017508);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v26, KeyPath, v23, v37);
  swift_release(KeyPath);
  v141 = *(void (**)(char *, uint64_t))(v24 + 8);
  v141(v26, v23);
  uint64_t v144 = v110;
  uint64_t v145 = v109;
  char v39 = v100;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for String);
  uint64_t v40 = sub_1000102FC( &qword_100021210,  &qword_1000211F0,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  uint64_t v110 = v40;
  uint64_t v109 = sub_1000102FC( &qword_100021218,  &qword_1000211E8,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  uint64_t v41 = v101;
  uint64_t v42 = v104;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)( v28,  v39,  v101,  v104,  v40,  v109,  &protocol witness table for String);
  uint64_t v43 = *(void (**)(char *, uint64_t))(v106 + 8);
  v43(v39, v42);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v102 + 8);
  v44(v28, v41);
  uint64_t v45 = v143;
  static PredicateExpressions.build_Arg<A>(_:)(v36, v23, v143);
  uint64_t v46 = swift_getKeyPath(&unk_100017530);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v26, v46, v23, v45);
  swift_release(v46);
  uint64_t v47 = v23;
  uint64_t v48 = v141;
  v141(v26, v23);
  uint64_t v144 = v114;
  uint64_t v145 = v115;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for String);
  v49 = v103;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)( v28,  v39,  v41,  v42,  v110,  v109,  &protocol witness table for String);
  v43(v39, v42);
  v44(v28, v41);
  uint64_t v50 = sub_1000102FC( &qword_100021220,  &qword_1000211F8,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Equal<A, B>);
  uint64_t v51 = v105;
  v52 = v98;
  uint64_t v53 = v107;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)(v98, v49, v107, v107, v50, v50);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v108 + 8);
  v54(v49, v53);
  v54(v52, v53);
  v55 = v26;
  uint64_t v56 = v97;
  uint64_t v99 = v47;
  uint64_t v57 = v143;
  static PredicateExpressions.build_Arg<A>(_:)(v97, v47, v143);
  uint64_t v58 = swift_getKeyPath(&unk_100017558);
  v59 = v111;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v55, v58, v47, v57);
  swift_release(v58);
  v48(v55, v47);
  LOBYTE(v144) = v127;
  v60 = v116;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for ValidationCategory);
  uint64_t v61 = swift_getKeyPath(&unk_1000179F8);
  uint64_t v62 = sub_1000102FC( &qword_100021228,  &qword_1000211C8,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v63 = v117;
  uint64_t v64 = v119;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v60, v61, v119, v62);
  swift_release(v61);
  (*(void (**)(char *, uint64_t))(v121 + 8))(v60, v64);
  uint64_t v65 = sub_1000102FC( &qword_100021230,  &qword_1000211D8,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  uint64_t v127 = v65;
  uint64_t v66 = sub_1000102FC( &qword_100021238,  &qword_1000211D0,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v67 = v118;
  uint64_t v68 = v120;
  uint64_t v69 = v123;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)( v59,  v63,  v120,  v123,  v65,  v66,  &protocol witness table for Int);
  (*(void (**)(char *, uint64_t))(v124 + 8))(v63, v69);
  uint64_t v124 = *(void *)(v122 + 8);
  ((void (*)(char *, uint64_t))v124)(v59, v68);
  uint64_t v70 = sub_1000102FC( &qword_100021240,  &qword_100021200,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Conjunction<A, B>);
  uint64_t v71 = sub_1000102FC( &qword_100021248,  &qword_1000211E0,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Equal<A, B>);
  v72 = v67;
  v73 = v67;
  uint64_t v74 = v112;
  uint64_t v75 = v125;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)(v51, v73, v112, v125, v70, v71);
  (*(void (**)(char *, uint64_t))(v126 + 8))(v72, v75);
  (*(void (**)(char *, uint64_t))(v113 + 8))(v51, v74);
  v76 = v55;
  uint64_t v77 = v56;
  uint64_t v78 = v99;
  uint64_t v79 = v143;
  static PredicateExpressions.build_Arg<A>(_:)(v77, v99, v143);
  uint64_t v80 = swift_getKeyPath(&unk_100017580);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v76, v80, v78, v79);
  swift_release(v80);
  v141(v76, v78);
  LOBYTE(v144) = v133;
  v81 = v130;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for ConstraintType);
  uint64_t v82 = swift_getKeyPath(&unk_100017A20);
  uint64_t v83 = sub_1000102FC( &qword_100021250,  &qword_1000211B0,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v84 = v131;
  uint64_t v85 = v134;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v81, v82, v134, v83);
  swift_release(v82);
  (*(void (**)(char *, uint64_t))(v135 + 8))(v81, v85);
  uint64_t v86 = sub_1000102FC( &qword_100021258,  &qword_1000211B8,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v87 = v132;
  uint64_t v88 = v136;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)( v59,  v84,  v68,  v136,  v127,  v86,  &protocol witness table for Int);
  (*(void (**)(char *, uint64_t))(v137 + 8))(v84, v88);
  ((void (*)(char *, uint64_t))v124)(v59, v68);
  uint64_t v89 = sub_10000EBB0(&qword_100021260);
  v90 = v139;
  v139[3] = v89;
  v90[4] = sub_10000FD58( &qword_100021268,  &qword_100021260,  (void (*)(void))sub_10000FD34,  (void (*)(void))sub_100010174);
  sub_10000EBF0(v90);
  uint64_t v91 = sub_1000102FC( &qword_1000212F0,  &qword_100021208,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Conjunction<A, B>);
  uint64_t v92 = sub_1000102FC( &qword_1000212F8,  &qword_1000211C0,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Equal<A, B>);
  v93 = v142;
  uint64_t v94 = v128;
  uint64_t v95 = v138;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)(v142, v87, v128, v138, v91, v92);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v87, v95);
  return (*(uint64_t (**)(char *, uint64_t))(v129 + 8))(v93, v94);
}

unsigned __int8 *sub_10000DEA0@<X0>(unsigned __int8 *result@<X0>, void *a2@<X8>)
{
  *a2 = *result + 1LL;
  return result;
}

unint64_t sub_10000DEB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned __int8 a9)
{
  unsigned int v49 = a8;
  uint64_t v47 = a6;
  uint64_t v48 = a7;
  uint64_t v50 = a4;
  uint64_t v51 = a5;
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v18 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  unint64_t result = dispatch thunk of ModelContext.fetch<A>(_:)(a2, v17, v18);
  if (!v9)
  {
    uint64_t v20 = result;
    uint64_t v45 = a3;
    uint64_t v46 = v14;
    uint64_t v43 = v16;
    uint64_t v44 = v13;
    uint64_t v53 = v18;
    uint64_t v42 = 0LL;
    uint64_t v54 = v17;
    uint64_t v21 = v50;
    if (result >> 62)
    {
LABEL_24:
      if (v20 < 0) {
        uint64_t v39 = v20;
      }
      else {
        uint64_t v39 = v20 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v20);
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter(v39);
      swift_bridgeObjectRelease(v20);
    }

    else
    {
      uint64_t v22 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v23 = v51;
    uint64_t v24 = v21;
    uint64_t v25 = v46;
    if (v22)
    {
      uint64_t v26 = a1;
      uint64_t v27 = 0LL;
      unint64_t v28 = 0LL;
      uint64_t v52 = v20 & 0xFFFFFFFFFFFFFF8LL;
LABEL_6:
      uint64_t v41 = v27;
      do
      {
        if ((v20 & 0xC000000000000001LL) != 0)
        {
          uint64_t v29 = specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v20);
        }

        else
        {
          if (v28 >= *(void *)(v52 + 16)) {
            goto LABEL_23;
          }
          uint64_t v29 = *(void *)(v20 + 8 * v28 + 32);
          swift_retain(v29);
        }

        unint64_t v30 = v28 + 1;
        if (__OFADD__(v28, 1LL))
        {
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }

        if (!v28)
        {
          uint64_t v31 = v43;
          (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v43, v45, v44);
          a1 = v29;
          (*(void (**)(char *))(*(void *)v29 + 368LL))(v31);
          swift_release(v29);
          uint64_t v27 = 1LL;
          unint64_t v28 = 1LL;
          if (v22 != 1) {
            goto LABEL_6;
          }
          return swift_bridgeObjectRelease(v20);
        }

        a1 = v26;
        dispatch thunk of ModelContext.delete<A>(_:)(v29, v54, v53);
        swift_release(v29);
        ++v28;
      }

      while (v30 != v22);
      uint64_t v24 = v21;
      unint64_t result = swift_bridgeObjectRelease(v20);
      uint64_t v32 = v49;
      uint64_t v23 = v51;
      uint64_t v34 = v44;
      uint64_t v33 = v45;
      uint64_t v25 = v46;
      if ((v41 & 1) == 0) {
        goto LABEL_20;
      }
    }

    else
    {
      swift_bridgeObjectRelease(v20);
      uint64_t v34 = v44;
      uint64_t v33 = v45;
      uint64_t v32 = v49;
LABEL_20:
      uint64_t v35 = v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v43, v33, v34);
      uint64_t v36 = v54;
      uint64_t v37 = swift_allocObject(v54, *(unsigned int *)(v54 + 48), *(unsigned __int16 *)(v54 + 52));
      swift_bridgeObjectRetain(v23);
      uint64_t v38 = v48;
      swift_bridgeObjectRetain(v48);
      sub_10000C5E4(v24, v23, v47, v38, v32, a9, v35);
      dispatch thunk of ModelContext.insert<A>(_:)(v37, v36, v53);
      return swift_release(v37);
    }
  }

  return result;
}

uint64_t sub_10000E198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[2] = a4;
  v6[3] = a5;
  void v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  return dispatch thunk of ModelContext.transaction(block:)(sub_10000F108, v6);
}

uint64_t sub_10000E1D8( uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t result = sub_10000EF00(a2);
  if (!v4)
  {
    uint64_t v16 = result;
    uint64_t v29 = 0LL;
    uint64_t result = static Date.now.getter();
    if ((unint64_t)v16 >> 62)
    {
      if (v16 < 0) {
        uint64_t v28 = v16;
      }
      else {
        uint64_t v28 = v16 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v16);
      uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v28);
      uint64_t result = swift_bridgeObjectRelease(v16);
      if (v17) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v17)
      {
LABEL_4:
        if (v17 < 1)
        {
          __break(1u);
          return result;
        }

        uint64_t v18 = 0LL;
        unint64_t v30 = v16 & 0xC000000000000001LL;
        uint64_t v31 = v17;
        uint64_t v37 = a4;
        uint64_t v35 = a3;
        uint64_t v36 = v8;
        uint64_t v33 = v14;
        uint64_t v34 = v9;
        uint64_t v32 = v16;
        do
        {
          if (v30)
          {
            uint64_t v19 = specialized _ArrayBuffer._getElementSlowPath(_:)(v18, v16);
          }

          else
          {
            uint64_t v19 = *(void *)(v16 + 8 * v18 + 32);
            swift_retain(v19);
          }

          ++v18;
          uint64_t v20 = (*(uint64_t (**)(void))(*(void *)v19 + 168LL))();
          uint64_t v22 = v21;
          uint64_t v23 = (*(uint64_t (**)(void))(*(void *)v19 + 216LL))();
          uint64_t v25 = v24;
          uint64_t v26 = (*(uint64_t (**)(void))(*(void *)v19 + 264LL))();
          uint64_t v27 = (*(uint64_t (**)(void))(*(void *)v19 + 312LL))();
          v35(v20, v22, v23, v25, v26, v27);
          swift_bridgeObjectRelease(v22);
          swift_bridgeObjectRelease(v25);
          uint64_t v14 = v33;
          uint64_t v9 = v34;
          uint64_t v8 = v36;
          (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v12, v33, v36);
          (*(void (**)(char *))(*(void *)v19 + 416LL))(v12);
          swift_release(v19);
          uint64_t v16 = v32;
        }

        while (v31 != v18);
      }
    }

    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }

  return result;
}

uint64_t sub_10000E41C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v5 = type metadata accessor for PredicateExpressions.ComparisonOperator(0LL);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10000EBB0(&qword_100021140);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  uint64_t v35 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000EBB0(&qword_100021148);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_10000EBB0(&qword_100021150);
  uint64_t v33 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = *a1;
  uint64_t v20 = sub_1000102FC( &qword_100021158,  &qword_100021148,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  static PredicateExpressions.build_Arg<A>(_:)(v19, v12, v20);
  uint64_t KeyPath = swift_getKeyPath(&unk_1000175A8);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v15, KeyPath, v12, v20);
  swift_release(KeyPath);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v22 = type metadata accessor for Date(0LL);
  static PredicateExpressions.build_Arg<A>(_:)(v32, v22);
  uint64_t v24 = v30;
  uint64_t v23 = v31;
  (*(void (**)(char *, void, uint64_t))(v30 + 104))( v7,  enum case for PredicateExpressions.ComparisonOperator.lessThan(_:),  v31);
  a3[3] = sub_10000EBB0(&qword_100021160);
  a3[4] = sub_10000FC14();
  sub_10000EBF0(a3);
  uint64_t v25 = sub_1000102FC( &qword_100021188,  &qword_100021150,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  uint64_t v26 = sub_1000102FC( &qword_100021190,  &qword_100021140,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  uint64_t v27 = sub_10000F5E8( &qword_100021198,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v28 = v34;
  static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)(v18, v11, v7, v16, v34, v25, v26, v27);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v23);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v16);
}

uint64_t sub_10000E6F0(uint64_t a1, uint64_t a2, double a3)
{
  v4[2] = a1;
  v4[3] = a2;
  *(double *)&v4[4] = a3;
  return dispatch thunk of ModelContext.transaction(block:)(sub_10000F344, v4);
}

uint64_t sub_10000E72C()
{
  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t sub_10000E734()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464LL))();
}

uint64_t sub_10000E740()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472LL))();
}

void (*sub_10000E74C(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(void *)v1 + 480LL))();
  return sub_10000E798;
}

void sub_10000E798(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

Swift::Int sub_10000E7C8()
{
  uint64_t v0 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v1 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  PersistentModel.hash(into:)(v3, v0, v1);
  return Hasher._finalize()();
}

uint64_t sub_10000E838(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_1000177D8);
  return PersistentModel.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_10000E880(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_1000177D8);
  PersistentModel.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t sub_10000E8D8()
{
  uint64_t v0 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v1 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  return PersistentModel.id.getter(v0, v1);
}

uint64_t sub_10000E938(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable(&unk_1000177D8);
  return static PersistentModel.== infix(_:_:)(v4, v5, a3, WitnessTable) & 1;
}

uint64_t sub_10000E98C(unint64_t a1)
{
  if (a1 >= 6) {
    return 5LL;
  }
  else {
    return (0x40302010005uLL >> (8 * a1));
  }
}

uint64_t sub_10000E9B0(uint64_t a1)
{
  else {
    return a1 - 1;
  }
}

uint64_t sub_10000E9C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 3sub_10000EA2C(v0 + 2) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10000EA08(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10000EA2C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for ConstraintUsage(uint64_t a1)
{
  uint64_t result = qword_100021B60;
  if (!qword_100021B60) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConstraintUsage);
  }
  return result;
}

uint64_t sub_10000EA88()
{
  return sub_10000B3A0(v0[2], v0[3], v0[4], (uint64_t)&unk_100017508);
}

uint64_t sub_10000EABC()
{
  return sub_10000B3A0(v0[2], v0[3], v0[4], (uint64_t)&unk_100017530);
}

uint64_t sub_10000EAF0()
{
  return sub_10000BAAC(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_100017558);
}

uint64_t sub_10000EB20()
{
  return sub_10000BAAC(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_100017580);
}

uint64_t sub_10000EB50()
{
  return sub_10000C1C0(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_1000175A8);
}

uint64_t sub_10000EB80()
{
  return sub_10000C1C0(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_1000175D0);
}

uint64_t sub_10000EBB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_10000EBF0(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_10000EC2C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 3sub_10000EA2C(v0 + 2) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000EC44()
{
  uint64_t v0 = sub_10000EBB0(&qword_100021300);
  uint64_t v1 = *(void *)(type metadata accessor for Schema.PropertyMetadata(0LL) - 8);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
       + 6LL * *(void *)(v1 + 72),
         *(unsigned __int8 *)(v1 + 80) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_1000174E0;
  uint64_t KeyPath = swift_getKeyPath(&unk_100017508);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)( 0xD000000000000011LL,  0x8000000100019430LL,  KeyPath,  &v13,  &v10);
  uint64_t v4 = swift_getKeyPath(&unk_100017530);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)( 0x6E6564496D616574LL,  0xEE00726569666974LL,  v4,  &v13,  &v10);
  uint64_t v5 = swift_getKeyPath(&unk_100017558);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)( 0xD000000000000012LL,  0x8000000100019450LL,  v5,  &v13,  &v10);
  uint64_t v6 = swift_getKeyPath(&unk_100017580);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)( 0x69617274736E6F63LL,  0xEE0065707954746ELL,  v6,  &v13,  &v10);
  uint64_t v7 = swift_getKeyPath(&unk_1000175A8);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)( 0x676173557473616CLL,  0xE900000000000065LL,  v7,  &v13,  &v10);
  uint64_t v8 = swift_getKeyPath(&unk_1000175D0);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 0LL;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)( 0x6F7065527473616CLL,  0xEA00000000007472LL,  v8,  &v13,  &v10);
  return v2;
}

uint64_t sub_10000EEB4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000D318( a1,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(unsigned __int8 *)(v2 + 48),  *(unsigned __int8 *)(v2 + 49),  a2);
}

unint64_t sub_10000EEC8()
{
  return sub_10000DEB0( *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(void *)(v0 + 48),  *(void *)(v0 + 56),  *(void *)(v0 + 64),  *(void *)(v0 + 72),  *(unsigned __int8 *)(v0 + 80),  *(_BYTE *)(v0 + 81));
}

uint64_t sub_10000EF00(uint64_t a1)
{
  uint64_t v2 = sub_10000EBB0(&qword_100020EA8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_10000EBB0(&qword_100020EB0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10000EBB0(&qword_100020EB8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v4, 1LL, 1LL, v9);
  uint64_t v10 = sub_10000EBB0(&qword_1000211A0);
  uint64_t v11 = *(void *)(sub_10000EBB0(&qword_1000211A8) - 8);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
        + *(void *)(v11 + 72),
          *(unsigned __int8 *)(v11 + 80) | 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_1000174D0;
  uint64_t KeyPath = swift_getKeyPath(&unk_1000175D0);
  uint64_t v14 = sub_10000F5E8( &qword_100021198,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  SortDescriptor.init<A>(_:order:)(KeyPath, 0LL, v14);
  uint64_t v15 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v16 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  FetchDescriptor.init(predicate:sortBy:)(v4, v12, v15, v16);
  FetchDescriptor.fetchLimit.setter(a1, 0LL, v5);
  uint64_t v17 = dispatch thunk of ModelContext.fetch<A>(_:)(v8, v15, v16);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v17;
}

uint64_t sub_10000F108()
{
  return sub_10000E1D8( *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 40),  *(void *)(v0 + 48));
}

uint64_t sub_10000F124(double a1)
{
  uint64_t v2 = sub_10000EBB0(&qword_100020EA8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v22 - v11;
  static Date.now.getter(v10);
  static Date.- infix(_:_:)(v9, a1);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v23 = v5;
  v22(v9, v5);
  uint64_t v13 = sub_10000EBB0(&qword_100020EB0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = v12;
  uint64_t v17 = type metadata accessor for ConstraintUsage(0LL);
  uint64_t v26 = v17;
  Predicate.init(_:)(sub_10000FBC8, v24, 1LL, &v26);
  uint64_t v18 = sub_10000EBB0(&qword_100020EB8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))(v4, 0LL, 1LL, v18);
  uint64_t v19 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
  FetchDescriptor.init(predicate:sortBy:)(v4, &_swiftEmptyArrayStorage, v17, v19);
  uint64_t v20 = dispatch thunk of ModelContext.fetch<A>(_:)(v16, v17, v19);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v22(v12, v23);
  return v20;
}

uint64_t sub_10000F344()
{
  uint64_t result = sub_10000F124(*(double *)(v0 + 32));
  if (!v1)
  {
    uint64_t v3 = result;
    if ((unint64_t)result >> 62)
    {
      if (result < 0) {
        uint64_t v9 = result;
      }
      else {
        uint64_t v9 = result & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(result);
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v9);
      uint64_t result = swift_bridgeObjectRelease(v3);
      if (v4) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v4)
      {
LABEL_4:
        if (v4 < 1)
        {
          __break(1u);
          return result;
        }

        uint64_t v5 = 0LL;
        do
        {
          if ((v3 & 0xC000000000000001LL) != 0)
          {
            uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v3);
          }

          else
          {
            uint64_t v6 = *(void *)(v3 + 8 * v5 + 32);
            swift_retain(v6);
          }

          ++v5;
          uint64_t v7 = type metadata accessor for ConstraintUsage(0LL);
          uint64_t v8 = sub_10000F5E8( &qword_100020E70,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000177D8);
          dispatch thunk of ModelContext.delete<A>(_:)(v6, v7, v8);
          swift_release(v6);
        }

        while (v4 != v5);
      }
    }

    return swift_bridgeObjectRelease(v3);
  }

  return result;
}

unint64_t sub_10000F480()
{
  unint64_t result = qword_100020EC0;
  if (!qword_100020EC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000175F8);
    atomic_store(result, (unint64_t *)&qword_100020EC0);
  }

  return result;
}

unint64_t sub_10000F4C8()
{
  unint64_t result = qword_100020EC8;
  if (!qword_100020EC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000176E8);
    atomic_store(result, (unint64_t *)&qword_100020EC8);
  }

  return result;
}

uint64_t sub_10000F50C()
{
  return sub_10000F5E8( &qword_100020E68,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178D8);
}

uint64_t sub_10000F538()
{
  return sub_10000F5E8( &qword_100020ED0,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_100017838);
}

uint64_t sub_10000F564()
{
  return sub_10000F5E8( &qword_100020ED8,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_100017878);
}

uint64_t sub_10000F590()
{
  return sub_10000F5E8( &qword_100020EE0,  (void (*)(uint64_t))type metadata accessor for ConstraintUsage,  (uint64_t)&unk_1000178B0);
}

uint64_t sub_10000F5BC()
{
  return sub_10000F5E8( &qword_100020EE8,  (void (*)(uint64_t))&type metadata accessor for PersistentIdentifier,  (uint64_t)&protocol conformance descriptor for PersistentIdentifier);
}

uint64_t sub_10000F5E8(unint64_t *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255LL);
    uint64_t result = swift_getWitnessTable(a3);
    atomic_store(result, a1);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ConstraintType(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ConstraintType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstraintType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_10000F714 + 4 * byte_1000174F5[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000F748 + 4 * byte_1000174F0[v4]))();
}

uint64_t sub_10000F748(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F750(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000F758LL);
  }
  return result;
}

uint64_t sub_10000F764(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000F76CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_10000F770(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F778(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F784(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000F78C(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintType()
{
  return &type metadata for ConstraintType;
}

uint64_t getEnumTagSinglePayload for ValidationCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 9;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }

uint64_t storeEnumTagSinglePayload for ValidationCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF6) {
    return ((uint64_t (*)(void))((char *)&loc_10000F880 + 4 * byte_1000174FF[v4]))();
  }
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_10000F8B4 + 4 * byte_1000174FA[v4]))();
}

uint64_t sub_10000F8B4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F8BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000F8C4LL);
  }
  return result;
}

uint64_t sub_10000F8D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000F8D8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 9;
  return result;
}

uint64_t sub_10000F8DC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F8E4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ValidationCategory()
{
  return &type metadata for ValidationCategory;
}

uint64_t sub_10000F900()
{
  return type metadata accessor for ConstraintUsage(0LL);
}

uint64_t sub_10000F908(uint64_t a1)
{
  v4[0] = (char *)&value witness table for () + 64;
  v4[1] = (char *)&value witness table for () + 64;
  v4[2] = (char *)&value witness table for () + 64;
  v4[3] = (char *)&value witness table for () + 64;
  v4[4] = (char *)&value witness table for () + 64;
  v4[5] = (char *)&value witness table for () + 64;
  void v4[6] = "(";
  uint64_t result = type metadata accessor for ObservationRegistrar(319LL);
  if (v3 <= 0x3F)
  {
    v4[7] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ConstraintUsage._SwiftDataNoType()
{
  return &type metadata for ConstraintUsage._SwiftDataNoType;
}

uint64_t destroy for ConstraintUsageModel(void *a1)
{
  return swift_release(a1[1]);
}

void *_s5amfid20ConstraintUsageModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_retain)();
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for ConstraintUsageModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for ConstraintUsageModel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ConstraintUsageModel(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstraintUsageModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstraintUsageModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(va, 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ConstraintUsageModel()
{
  return &type metadata for ConstraintUsageModel;
}

unint64_t sub_10000FB40()
{
  unint64_t result = qword_100021130;
  if (!qword_100021130)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017750);
    atomic_store(result, (unint64_t *)&qword_100021130);
  }

  return result;
}

unint64_t sub_10000FB84()
{
  unint64_t result = qword_100021138;
  if (!qword_100021138)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017660);
    atomic_store(result, (unint64_t *)&qword_100021138);
  }

  return result;
}

uint64_t sub_10000FBC8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000E41C(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_10000FBD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10000FC14()
{
  unint64_t result = qword_100021168;
  if (!qword_100021168)
  {
    sub_10000FBD0(&qword_100021160);
    sub_10000FEA8(&qword_100021170, &qword_100021150);
    sub_10000FC90();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Comparison<A, B>);
    atomic_store(result, (unint64_t *)&qword_100021168);
  }

  return result;
}

unint64_t sub_10000FC90()
{
  unint64_t result = qword_100021180;
  if (!qword_100021180)
  {
    sub_10000FBD0(&qword_100021140);
    sub_10000F5E8( &qword_100020E80,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    sub_10000F5E8( &qword_100020E78,  (void (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>);
    atomic_store(result, (unint64_t *)&qword_100021180);
  }

  return result;
}

uint64_t sub_10000FD34()
{
  return sub_10000FD58(&qword_100021270, &qword_100021208, (void (*)(void))sub_10000FDC8, (void (*)(void))sub_10000FF7C);
}

uint64_t sub_10000FD58(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000FBD0(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Conjunction<A, B>);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10000FDC8()
{
  unint64_t result = qword_100021278;
  if (!qword_100021278)
  {
    sub_10000FBD0(&qword_100021200);
    sub_10000FE2C();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Conjunction<A, B>);
    atomic_store(result, (unint64_t *)&qword_100021278);
  }

  return result;
}

unint64_t sub_10000FE2C()
{
  unint64_t result = qword_100021280;
  if (!qword_100021280)
  {
    sub_10000FBD0(&qword_1000211F8);
    sub_10000FEA8(&qword_100021288, &qword_1000211F0);
    sub_10000FF18();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
    atomic_store(result, (unint64_t *)&qword_100021280);
  }

  return result;
}

uint64_t sub_10000FEA8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000FBD0(a2);
    sub_1000102FC( &qword_100021178,  &qword_100021148,  (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10000FF18()
{
  unint64_t result = qword_100021290;
  if (!qword_100021290)
  {
    sub_10000FBD0(&qword_1000211E8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>);
    atomic_store(result, (unint64_t *)&qword_100021290);
  }

  return result;
}

unint64_t sub_10000FF7C()
{
  unint64_t result = qword_100021298;
  if (!qword_100021298)
  {
    sub_10000FBD0(&qword_1000211E0);
    sub_10000FEA8(&qword_1000212A0, &qword_1000211D8);
    sub_10000FFF8();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
    atomic_store(result, (unint64_t *)&qword_100021298);
  }

  return result;
}

unint64_t sub_10000FFF8()
{
  unint64_t result = qword_1000212A8;
  if (!qword_1000212A8)
  {
    sub_10000FBD0(&qword_1000211D0);
    sub_10001007C(&qword_1000212B0, &qword_1000211C8, (void (*)(void))sub_1000100EC, (void (*)(void))sub_100010130);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>);
    atomic_store(result, (unint64_t *)&qword_1000212A8);
  }

  return result;
}

uint64_t sub_10001007C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000FBD0(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1000100EC()
{
  unint64_t result = qword_1000212B8;
  if (!qword_1000212B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017788);
    atomic_store(result, (unint64_t *)&qword_1000212B8);
  }

  return result;
}

unint64_t sub_100010130()
{
  unint64_t result = qword_1000212C0;
  if (!qword_1000212C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000177B0);
    atomic_store(result, (unint64_t *)&qword_1000212C0);
  }

  return result;
}

unint64_t sub_100010174()
{
  unint64_t result = qword_1000212C8;
  if (!qword_1000212C8)
  {
    sub_10000FBD0(&qword_1000211C0);
    sub_10000FEA8(&qword_1000212A0, &qword_1000211D8);
    sub_1000101F0();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
    atomic_store(result, (unint64_t *)&qword_1000212C8);
  }

  return result;
}

unint64_t sub_1000101F0()
{
  unint64_t result = qword_1000212D0;
  if (!qword_1000212D0)
  {
    sub_10000FBD0(&qword_1000211B8);
    sub_10001007C(&qword_1000212D8, &qword_1000211B0, (void (*)(void))sub_100010274, (void (*)(void))sub_1000102B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>);
    atomic_store(result, (unint64_t *)&qword_1000212D0);
  }

  return result;
}

unint64_t sub_100010274()
{
  unint64_t result = qword_1000212E0;
  if (!qword_1000212E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100017698);
    atomic_store(result, (unint64_t *)&qword_1000212E0);
  }

  return result;
}

unint64_t sub_1000102B8()
{
  unint64_t result = qword_1000212E8;
  if (!qword_1000212E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000176C0);
    atomic_store(result, (unint64_t *)&qword_1000212E8);
  }

  return result;
}

uint64_t sub_1000102FC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000FBD0(a2);
    uint64_t result = swift_getWitnessTable(a3);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100010348()
{
  return sub_10000EAF0();
}

uint64_t sub_10001035C()
{
  return sub_10000EB20();
}

uint64_t sub_100010370()
{
  return sub_10000EB50();
}

uint64_t sub_100010384()
{
  return sub_10000EB80();
}

uint64_t sub_1000103A0()
{
  return sub_10000EA88();
}

uint64_t sub_1000103B4()
{
  return sub_10000EABC();
}

id ConstraintUsageMetricsManager.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id ConstraintUsageMetricsManager.init()()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v8 = v0;
  URL.init(fileURLWithPath:)(0xD000000000000020LL, 0x8000000100019470LL);
  uint64_t v9 = sub_10000CE54((uint64_t)v7);
  uint64_t v10 = (uint64_t *)&v8[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context];
  *uint64_t v10 = v9;
  v10[1] = v11;
  Logger.init(subsystem:category:)( 0xD00000000000001DLL,  0x8000000100019500LL,  0x5F7363697274656DLL,  0xEF676E6967676F6CLL);
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))( &v8[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log],  v4,  v1);

  uint64_t v12 = (objc_class *)type metadata accessor for ConstraintUsageMetricsManager(0LL);
  v15.receiver = v8;
  v15.super_class = v12;
  return objc_msgSendSuper2(&v15, "init");
}

uint64_t type metadata accessor for ConstraintUsageMetricsManager(uint64_t a1)
{
  uint64_t result = qword_100021B88;
  if (!qword_100021B88) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConstraintUsageMetricsManager);
  }
  return result;
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.record(signingIdentifier:teamIdentifier:validationCategory:constraintType:)( Swift::String signingIdentifier, Swift::String teamIdentifier, Swift::Int validationCategory, Swift::Int constraintType)
{
  object = teamIdentifier._object;
  countAndFlagsBits = (os_log_s *)teamIdentifier._countAndFlagsBits;
  uint64_t v9 = signingIdentifier._object;
  uint64_t v31 = signingIdentifier._countAndFlagsBits;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v14 = sub_10000AE68(validationCategory);
  if (v14 == 10)
  {
    swift_bridgeObjectRetain_n(v9, 2LL);
    uint64_t v15 = swift_bridgeObjectRetain_n(object, 2LL);
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v16))
    {
      uint64_t v17 = swift_slowAlloc(42LL, -1LL);
      uint64_t v18 = swift_slowAlloc(64LL, -1LL);
      uint64_t v34 = v18;
      *(_DWORD *)uint64_t v17 = 136315906;
      swift_bridgeObjectRetain(v9);
      uint64_t v33 = sub_100011A5C(v31, (unint64_t)v9, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease_n(v9, 3LL);
      *(_WORD *)(v17 + 1sub_10000EA2C(v0 + 2) = 2080;
      swift_bridgeObjectRetain(object);
      uint64_t v33 = sub_100011A5C((uint64_t)countAndFlagsBits, (unint64_t)object, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 14, v17 + 22);
      swift_bridgeObjectRelease_n(object, 3LL);
      *(_WORD *)(v17 + 2sub_10000EA2C(v0 + 2) = 2048;
      uint64_t v33 = validationCategory;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 24, v17 + 32);
      *(_WORD *)(v17 + 3sub_10000EA2C(v0 + 2) = 2048;
      uint64_t v33 = constraintType;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 34, v17 + 42);
      _os_log_impl( (void *)&_mh_execute_header,  v32,  v16,  "Failed recording constraint event: %s %s %ld %ld: unknown validation category",  (uint8_t *)v17,  0x2Au);
      swift_arrayDestroy(v18, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
      uint64_t v19 = v32;
LABEL_7:

      return;
    }

    swift_bridgeObjectRelease_n(object, 2LL);
    swift_bridgeObjectRelease_n(v9, 2LL);
  }

  else
  {
    char v20 = v14;
    uint64_t v32 = countAndFlagsBits;
    int v21 = sub_10000AD30(constraintType);
    if (v21 == 5)
    {
      swift_bridgeObjectRetain_n(v9, 2LL);
      uint64_t v22 = swift_bridgeObjectRetain_n(object, 2LL);
      uint64_t v30 = (os_log_s *)Logger.logObject.getter(v22);
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v23))
      {
        uint64_t v24 = swift_slowAlloc(42LL, -1LL);
        uint64_t v25 = swift_slowAlloc(64LL, -1LL);
        uint64_t v34 = v25;
        *(_DWORD *)uint64_t v24 = 136315906;
        swift_bridgeObjectRetain(v9);
        uint64_t v33 = sub_100011A5C(v31, (unint64_t)v9, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 4, v24 + 12);
        swift_bridgeObjectRelease_n(v9, 3LL);
        *(_WORD *)(v24 + 1sub_10000EA2C(v0 + 2) = 2080;
        swift_bridgeObjectRetain(object);
        uint64_t v33 = sub_100011A5C((uint64_t)v32, (unint64_t)object, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 14, v24 + 22);
        swift_bridgeObjectRelease_n(object, 3LL);
        *(_WORD *)(v24 + 2sub_10000EA2C(v0 + 2) = 2048;
        uint64_t v33 = validationCategory;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 24, v24 + 32);
        *(_WORD *)(v24 + 3sub_10000EA2C(v0 + 2) = 2048;
        uint64_t v33 = constraintType;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 34, v24 + 42);
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v23,  "Failed recording constraint event: %s %s %ld %ld: unknown constraint type",  (uint8_t *)v24,  0x2Au);
        swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v25, -1LL, -1LL);
        swift_slowDealloc(v24, -1LL, -1LL);
        uint64_t v19 = v30;
        goto LABEL_7;
      }

      swift_bridgeObjectRelease_n(object, 2LL);
      swift_bridgeObjectRelease_n(v9, 2LL);
    }

    else
    {
      int v26 = v21;
      v29[1] = validationCategory;
      uint64_t v30 = (os_log_s *)constraintType;
      uint64_t v27 = *(void *)(v4 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context);
      uint64_t v28 = *(void *)(v4 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8);
      static Date.now.getter();
      sub_10000D128(v31, (uint64_t)v9, (uint64_t)v32, (uint64_t)object, v20, v26, (uint64_t)v13, v27, v28);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }

Swift::Void __swiftcall ConstraintUsageMetricsManager.report()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = v0 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  int v8 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v32 = v3;
  uint64_t v33 = v2;
  if (v10)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    v35[0] = v12;
    uint64_t v31 = v7;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = v6;
    uint64_t v30 = v11 + 4;
    static Date.now.getter();
    unint64_t v14 = sub_10001209C();
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter(v2, v14);
    uint64_t v16 = v2;
    unint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v16);
    uint64_t v34 = sub_100011A5C(v15, v18, v35);
    uint64_t v6 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v30, v11 + 12);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Reporting environment constraint usage: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  uint64_t v19 = sub_10000E198( 5LL,  (uint64_t)sub_100011274,  0LL,  *(void *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context),  *(void *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8));
  char v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    v35[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    static Date.now.getter();
    unint64_t v24 = sub_10001209C();
    uint64_t v25 = v33;
    uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter(v33, v24);
    unint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v25);
    uint64_t v34 = sub_100011A5C(v26, v28, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v28);
    _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Finished reporting environment constraint usage: %s",  v22,  0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }
}

void sub_100011274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v12 = String._bridgeToObjectiveC()();
  uint64_t v13 = (void *)swift_allocObject(&unk_10001D310, 64LL, 7LL);
  void v13[2] = a5;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a6;
  v16[4] = sub_100012190;
  unint64_t v17 = v13;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256LL;
  v16[2] = sub_100011494;
  v16[3] = &unk_10001D328;
  unint64_t v14 = _Block_copy(v16);
  uint64_t v15 = v17;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  swift_release(v15);
  AnalyticsSendEventLazy(v12, v14);
  _Block_release(v14);
}

unint64_t sub_10001137C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000EBB0(&qword_100021360);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v6 - 2);
    uint64_t v8 = (uint64_t)*(v6 - 1);
    os_log_type_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_100012328(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Class sub_100011494(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_1000122F0(0LL, &qword_100021348, &OBJC_CLASS___NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.isa = 0LL;
  }

  return v5.super.isa;
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.clean()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = v0 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v32 = v3;
  uint64_t v33 = v2;
  if (v10)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    v35[0] = v12;
    uint64_t v31 = v7;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = v6;
    uint64_t v30 = v11 + 4;
    static Date.now.getter(v12);
    unint64_t v14 = sub_10001209C();
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter(v2, v14);
    uint64_t v16 = v2;
    unint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v16);
    uint64_t v34 = sub_100011A5C(v15, v18, v35);
    uint64_t v6 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v30, v11 + 12);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Cleaning environment constraint usage metrics: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  uint64_t v19 = sub_10000E6F0( *(void *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context),  *(void *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8),  1209600.0);
  char v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    v35[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    static Date.now.getter(v23);
    unint64_t v24 = sub_10001209C();
    uint64_t v25 = v33;
    uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter(v33, v24);
    unint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v25);
    uint64_t v34 = sub_100011A5C(v26, v28, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v28);
    _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Finished cleaning environment constraint usage metrics: %s",  v22,  0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }
}

id ConstraintUsageMetricsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConstraintUsageMetricsManager(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100011A5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100011B2C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001246C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001246C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000EA2C(v12);
  return v7;
}

uint64_t sub_100011B2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100011CE4(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100011CE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100011D78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100011F50(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100011F50(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100011D78(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100011EEC(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(sub_100008B50(v11, v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(sub_100008B50(v11, v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(sub_100008B50(v11, v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100011EEC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10000EBB0(&qword_100021368);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100011F50(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000EBB0(&qword_100021368);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + sub_10000EA2C(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + sub_10000EA2C(v0 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_10001209C()
{
  unint64_t result = qword_100021318;
  if (!qword_100021318)
  {
    type metadata accessor for Date(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Date);
    atomic_store(result, (unint64_t *)&qword_100021318);
  }

  return result;
}

uint64_t sub_1000120E4()
{
  return type metadata accessor for ConstraintUsageMetricsManager(0LL);
}

uint64_t sub_1000120EC(uint64_t a1)
{
  v4[0] = &unk_100017A90;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100012164()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

unint64_t sub_100012190()
{
  Swift::Int v1 = *(void *)(v0 + 16);
  Swift::Int v2 = *(void *)(v0 + 56);
  uint64_t v3 = sub_10000EBB0(&qword_100021350);
  uint64_t inited = swift_initStackObject(v3, &v6);
  *(_OWORD *)(inited + 16) = xmmword_100017A60;
  *(void *)(inited + 3sub_10000EA2C(v0 + 2) = 0xD000000000000013LL;
  *(void *)(inited + 40) = 0x80000001000195D0LL;
  sub_1000122F0(0LL, &qword_100021358, &OBJC_CLASS___NSNumber_ptr);
  *(NSNumber *)(inited + 4_Block_object_dispose(va, 8) = NSNumber.init(integerLiteral:)(v1);
  *(void *)(inited + 56) = 0xD000000000000012LL;
  *(void *)(inited + 64) = 0x80000001000195F0LL;
  *(void *)(inited + 7sub_10000EA2C(v0 + 2) = String._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0x6564695F6D616574LL;
  *(void *)(inited + 8_Block_object_dispose(va, 8) = 0xEF7265696669746ELL;
  *(void *)(inited + 96) = String._bridgeToObjectiveC()();
  *(void *)(inited + 104) = 0x69617274736E6F63LL;
  *(void *)(inited + 11sub_10000EA2C(v0 + 2) = 0xEF657079745F746ELL;
  *(NSNumber *)(inited + 120) = NSNumber.init(integerLiteral:)(v2);
  return sub_10001137C(inited);
}

uint64_t sub_1000122D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3sub_10000EA2C(v0 + 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000122E8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000122F0(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

unint64_t sub_100012328(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10001238C(a1, a2, v5);
}

unint64_t sub_10001238C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_10001246C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t parseEntitlements(const char *a1, OSString **a2)
{
  uint64_t v2 = *((unsigned __int8 *)a1 + 23);
  uint64_t v3 = *((void *)a1 + 1);
  if ((v2 & 0x80u) != 0LL)
  {
    a1 = *(const char **)a1;
    uint64_t v2 = v3;
  }

  return AMFIUnserializeXML(a1, v2 + 1, a2);
}

void *sub_1000124D8(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v3 = a2;
    do
    {
      sub_100008328(&std::cout, (uint64_t)"\t", 1LL);
      --v3;
    }

    while (v3);
  }

  uint64_t v4 = sub_100008328(&std::cout, (uint64_t)"OSBoolean(", 10LL);
  uint64_t v5 = (void *)std::ostream::operator<<(v4, *(unsigned __int8 *)(a1 + 12));
  return sub_100008328(v5, (uint64_t)")\n", 2LL);
}

uint64_t sub_10001255C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_100012594()
{
  dword_100021C10 = 1;
  kOSBooleanFalse_single = (uint64_t)&off_10001D360;
  byte_100021C14 = 0;
  dword_100021C20 = 1;
  kOSBooleanTrue_single = (uint64_t)&off_10001D360;
  byte_100021C24 = 1;
  OSSymbol::symbols = 0u;
  *(_OWORD *)&qword_100021C38 = 0u;
  dword_100021C48 = 1065353216;
  return __cxa_atexit((void (*)(void *))sub_1000124AC, &OSSymbol::symbols, (void *)&_mh_execute_header);
}

uint64_t AMFIUnserializeXMLparse(_DWORD *a1)
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v103 = v2;
  *(_OWORD *)uint64_t v104 = v2;
  __int128 v101 = v2;
  __int128 v102 = v2;
  __int128 v99 = v2;
  __int128 v100 = v2;
  __int128 v97 = v2;
  __int128 v98 = v2;
  *(_OWORD *)&v104[14] = v2;
  __int128 v96 = v2;
  __int128 v95 = v2;
  __int128 v94 = v2;
  __int128 v93 = v2;
  __int128 v92 = v2;
  __int128 v91 = v2;
  __int128 v90 = v2;
  __int128 v89 = v2;
  __int128 v88 = v2;
  __int128 v87 = v2;
  __int128 v86 = v2;
  __int128 v85 = v2;
  __int128 v84 = v2;
  __int128 v83 = v2;
  __int128 v82 = v2;
  __int128 v81 = v2;
  int v3 = __b;
  memset(__b, 170, sizeof(__b));
  uint64_t v4 = 0LL;
  int v5 = 0;
  __int16 v80 = 0;
  int v6 = -2;
  v76 = (void *)0xAAAAAAAAAAAAAAAALL;
  while (1)
  {
    if (((0xFDAFF8FEuLL >> v5) & 1) == 0)
    {
      int v7 = byte_100017AEA[v5];
      if (v6 == -2)
      {
        *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v107[0] = v8;
        v107[1] = v8;
        unsigned int v78 = -1431655766;
        memset(__s1, 170, sizeof(__s1));
        memset(v105, 170, sizeof(v105));
        while (1)
        {
          do
          {
            while (1)
            {
              int v9 = a1[2];
              int v6 = *(unsigned __int8 *)(*(void *)a1 + v9);
              if (v6 == 32 || v6 == 9)
              {
                uint64_t v11 = *((void *)a1 + 7);
                if (v11 - 1 <= (unint64_t)v9)
                {
LABEL_38:
                  int v6 = 0;
                  goto LABEL_39;
                }

                uint64_t v12 = ~(uint64_t)v9 + v11;
                uint64_t v13 = (unsigned __int8 *)(*(void *)a1 + v9++ + 1LL);
                while (1)
                {
                  a1[2] = v9;
                  int v14 = *v13++;
                  int v6 = v14;
                  if (v14 != 9 && v6 != 32) {
                    break;
                  }
                  ++v9;
                  if (!--v12) {
                    goto LABEL_38;
                  }
                }

                if (!v6) {
                  goto LABEL_39;
                }
              }

              if (v6 != 10) {
                break;
              }
              ++a1[3];
            }

            int v6 = (char)v6;
            if (!(_BYTE)v6) {
              goto LABEL_39;
            }
            int v15 = sub_1000134B0((uint64_t *)a1, (uint64_t)v107, (int *)&v78, (uint64_t)__s1, (uint64_t)v105);
          }

          while (v15 == 4);
          int v16 = v15;
          if (!v15) {
            goto LABEL_155;
          }
          unint64_t v17 = (_OWORD *)*((void *)a1 + 3);
          if (v17)
          {
            uint64_t v18 = *(void *)v17;
            *((void *)a1 + 3) = *(void *)v17;
          }

          else
          {
            unint64_t v17 = malloc(0x50uLL);
            uint64_t v18 = 0LL;
            _OWORD *v17 = 0u;
            v17[1] = 0u;
            v17[2] = 0u;
            v17[3] = 0u;
            v17[4] = 0u;
            *((void *)v17 + 1) = *((void *)a1 + 2);
            *((void *)a1 + sub_10000EA2C(v0 + 2) = v17;
          }

          *((_DWORD *)v17 + 1_Block_object_dispose(va, 8) = -1;
          uint64_t v19 = v78;
          v76 = v17;
          if ((int)v78 >= 1)
          {
            uint64_t v20 = v78;
            os_log_type_t v21 = &__s1[1];
            while (*(v21 - 1) != 73 || *v21 != 68)
            {
              v21 += 32;
              if (!--v20) {
                goto LABEL_31;
              }
            }

LABEL_155:
            int v6 = 267;
            goto LABEL_39;
          }

LABEL_31:
          if (SLOBYTE(v107[0]) != 112) {
            break;
          }
          if (LODWORD(v107[0]) != 1936288880 || WORD2(v107[0]) != 116) {
            goto LABEL_155;
          }
          *(void *)unint64_t v17 = v18;
          *((void *)a1 + 3) = v17;
        }

        int v6 = &stru_100000100.sectname[11];
        switch(LOBYTE(v107[0]))
        {
          case 'a':
            if (LODWORD(v107[0]) == 1634890337 && WORD2(v107[0]) == 121)
            {
              if (v16 != 3)
              {
                BOOL v66 = v16 == 1;
                int v67 = 40;
                goto LABEL_162;
              }

              *((void *)v17 + sub_10000EA2C(v0 + 2) = 0LL;
              int v6 = &stru_100000100.sectname[2];
            }

            break;
          case 'b':
          case 'c':
          case 'e':
          case 'g':
          case 'h':
          case 'j':
            break;
          case 'd':
            if (LODWORD(v107[0]) ^ 0x74636964 | BYTE4(v107[0]))
            {
              if (!(LODWORD(v107[0]) ^ 0x61746164 | BYTE4(v107[0])))
              {
                unint64_t v77 = 0xAAAAAAAAAAAAAAAALL;
                if (v16 == 3)
                {
                  *((void *)v17 + 5) = 0LL;
                  *((void *)v17 + 6) = 0LL;
                  int v6 = &stru_100000100.sectname[4];
                }

                else
                {
                  if ((int)v78 < 1)
                  {
LABEL_170:
                    uint64_t v70 = sub_100013C14((uint64_t *)a1, &v77);
                  }

                  else
                  {
                    __stra = v105;
                    uint64_t v69 = __s1;
                    while (strcmp(v69, "format") || strcmp(__stra, "hex"))
                    {
                      __stra += 32;
                      v69 += 32;
                      if (!--v19) {
                        goto LABEL_170;
                      }
                    }

                    uint64_t v70 = sub_100013A40((uint64_t *)a1, &v77);
                  }

                  v76[5] = v77;
                  v76[6] = v70;
                  if (sub_1000134B0( (uint64_t *)a1,  (uint64_t)v107,  (int *)&v78,  (uint64_t)__s1,  (uint64_t)v105) == 2)
                  {
                    if (LODWORD(v107[0]) ^ 0x61746164 | BYTE4(v107[0])) {
                      int v6 = 267;
                    }
                    else {
                      int v6 = 260;
                    }
                  }

                  else
                  {
                    int v6 = 267;
                  }
                }
              }
            }

            else if (v16 == 3)
            {
              *((void *)v17 + sub_10000EA2C(v0 + 2) = 0LL;
              int v6 = &stru_100000100.sectname[5];
            }

            else if (v16 == 1)
            {
              int v6 = 123;
            }

            else
            {
              int v6 = 125;
            }

            break;
          case 'f':
            BOOL v59 = LODWORD(v107[0]) != 1936482662 || WORD2(v107[0]) != 101;
            if (v16 == 3 && !v59)
            {
              *((void *)v17 + _Block_object_dispose(va, 8) = 0LL;
              goto LABEL_126;
            }

            break;
          case 'i':
            if (*(void *)&v107[0] == 0x72656765746E69LL)
            {
              *((void *)v17 + 5) = 64LL;
              if ((int)v19 >= 1)
              {
                __str = v105;
                v60 = __s1;
                do
                {
                  if (!strcmp(v60, "size")) {
                    v76[5] = strtoul(__str, 0LL, 0);
                  }
                  __str += 32;
                  v60 += 32;
                  --v19;
                }

                while (v19);
              }

              if (v16 != 3)
              {
                v76[8] = sub_100013DB0((uint64_t *)a1);
                if (sub_1000134B0( (uint64_t *)a1,  (uint64_t)v107,  (int *)&v78,  (uint64_t)__s1,  (uint64_t)v105) != 2) {
                  goto LABEL_155;
                }
                BOOL v62 = *(void *)&v107[0] == 0x72656765746E69LL;
                int v63 = 264;
                goto LABEL_152;
              }

              v76[8] = 0LL;
              int v6 = &stru_100000100.sectname[8];
            }

            break;
          case 'k':
            if (v16 != 3 && LODWORD(v107[0]) == 7955819)
            {
              uint64_t v61 = sub_100013F28((uint64_t *)a1);
              v76[7] = v61;
              if (v61)
              {
                if (sub_1000134B0( (uint64_t *)a1,  (uint64_t)v107,  (int *)&v78,  (uint64_t)__s1,  (uint64_t)v105) == 2)
                {
                  BOOL v62 = LODWORD(v107[0]) == 7955819;
                  int v63 = 263;
LABEL_152:
                  if (v62) {
                    int v6 = v63;
                  }
                  else {
                    int v6 = 267;
                  }
                }
              }
            }

            break;
          default:
            if (SLOBYTE(v107[0]) == 115)
            {
              if (LODWORD(v107[0]) == 1769108595 && *(_DWORD *)((char *)v107 + 3) == 6778473)
              {
                if (v16 == 3)
                {
                  uint64_t v65 = malloc(1uLL);
                  v76[7] = v65;
                  *uint64_t v65 = 0;
                  int v6 = &stru_100000100.sectname[10];
                }

                else
                {
                  uint64_t v68 = sub_100013F28((uint64_t *)a1);
                  v76[7] = v68;
                  if (v68
                    && sub_1000134B0( (uint64_t *)a1,  (uint64_t)v107,  (int *)&v78,  (uint64_t)__s1,  (uint64_t)v105) == 2)
                  {
                    BOOL v66 = (LODWORD(v107[0]) ^ 0x69727473 | *(_DWORD *)((char *)v107 + 3) ^ 0x676E69) == 0;
                    int v67 = 266;
LABEL_162:
                    if (v66) {
                      int v6 = v67;
                    }
                    else {
                      int v6 = v67 + 1;
                    }
                  }
                }
              }
            }

            else if (SLOBYTE(v107[0]) == 116 && v16 == 3 && !(LODWORD(v107[0]) ^ 0x65757274 | BYTE4(v107[0])))
            {
              *((void *)v17 + _Block_object_dispose(va, 8) = 1LL;
LABEL_126:
              int v6 = &stru_100000100.sectname[3];
            }

            break;
        }
      }

LABEL_74:
        int v42 = a1[12];
        a1[12] = v42 + 1;
        if (v42 >= 0x1FFFF)
        {
LABEL_179:
          v73 = "maximum object count";
          goto LABEL_180;
        }

LABEL_94:
        uint64_t v53 = &v3[-v26];
        v4 -= v26;
        v53[1] = v27;
        int v3 = v53 + 1;
        uint64_t v54 = byte_100017CC3[v25] - 17LL;
        uint64_t v55 = (*(&v80 + v4) + byte_100017CDE[v54]);
        if (v55 <= 0x38
          && (unsigned __int16)*(&v80 + v4) == (unsigned __int16)byte_100017C16[v55])
        {
          int v5 = byte_100017C4F[v55];
        }

        else
        {
          int v5 = byte_100017CEB[v54];
        }

        break;
      case 11:
      case 18:
        uint64_t v27 = *(v3 - 1);
        *(void *)(v27 + 16) = 0LL;
        goto LABEL_94;
      case 12:
      case 19:
        uint64_t v27 = *(v3 - 2);
        *(void *)(v27 + 16) = *(v3 - 1);
        goto LABEL_94;
      case 15:
        uint64_t v43 = (void *)*(v3 - 1);
        uint64_t v27 = *v3;
        *(void *)*int v3 = v43;
        if (!v43) {
          goto LABEL_94;
        }
        while (v43[4] != *(void *)(v27 + 32))
        {
          uint64_t v43 = (void *)*v43;
          if (!v43) {
            goto LABEL_94;
          }
        }

        v73 = "duplicate dictionary key";
        goto LABEL_180;
      case 16:
        uint64_t v27 = *(v3 - 1);
        *(void *)(v27 + 3sub_10000EA2C(v0 + 2) = *(void *)(v27 + 24);
        *(void *)(v27 + 24) = *(void *)(*v3 + 24LL);
        *(void *)uint64_t v27 = 0LL;
        *(void *)(*v3 + 24LL) = 0LL;
        uint64_t v44 = (void *)*v3;
        *uint64_t v44 = *((void *)a1 + 3);
        *((void *)a1 + 3) = v44;
        goto LABEL_94;
      case 17:
        uint64_t v27 = *v3;
        uint64_t v45 = sub_100007630(*(char **)(*v3 + 56LL));
        free(*(void **)(v27 + 56));
        *(void *)(v27 + 56) = 0LL;
        *(void *)(v27 + 24) = v45;
        goto LABEL_94;
      case 21:
        uint64_t v27 = *v3;
        *(void *)*int v3 = 0LL;
        goto LABEL_94;
      case 22:
        uint64_t v27 = *v3;
        *(void *)*int v3 = *(v3 - 1);
        goto LABEL_94;
      default:
        goto LABEL_94;
    }

LABEL_98:
    *(&v80 + v4 + 1) = v5;
    if (v4++ > 197)
    {
      sub_100013278(a1, "memory exhausted");
      return 2LL;
    }
  }

LABEL_177:
  v73 = "syntax error";
LABEL_180:
  sub_100013278(a1, v73);
  return 1LL;
}

_DWORD *sub_100013278(_DWORD *result, const char *a2)
{
  if (*((void *)result + 4))
  {
    __int128 v2 = result;
    *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v10 = v3;
    __int128 v11 = v3;
    __int128 v8 = v3;
    __int128 v9 = v3;
    __int128 v6 = v3;
    __int128 v7 = v3;
    *(_OWORD *)__str = v3;
    __int128 v5 = v3;
    snprintf(__str, 0x80uLL, "AMFIUnserializeXML: %s near line %d\n", a2, result[3]);
    uint64_t result = sub_10000A1AC(__str);
    **((void **)v2 + 4) = result;
  }

  return result;
}

uint64_t AMFIUnserializeXML(const char *a1, unint64_t a2, OSString **a3)
{
  uint64_t v3 = 0LL;
  if (a1 && a2 >= 4)
  {
    if (a1[a2 - 1]) {
      return 0LL;
    }
    __int128 v7 = malloc(0x40uLL);
    if (!v7)
    {
      return 0LL;
    }

    else
    {
      __int128 v8 = v7;
      if (a3) {
        *a3 = 0LL;
      }
      *__int128 v7 = a1;
      v7[1] = &_mh_execute_header;
      _OWORD v7[2] = 0LL;
      v7[3] = 0LL;
      v7[4] = a3;
      void v7[5] = 0LL;
      void v7[6] = 0LL;
      v7[7] = a2;
      AMFIUnserializeXMLparse(v7);
      uint64_t v3 = v8[5];
      __int128 v9 = (void *)v8[2];
      if (v9)
      {
        do
        {
          __int128 v10 = (_DWORD *)v9[3];
          if (v10) {
            sub_10000729C(v10);
          }
          __int128 v11 = (void *)v9[6];
          if (v11) {
            free(v11);
          }
          uint64_t v12 = (_DWORD *)v9[4];
          if (v12) {
            sub_10000729C(v12);
          }
          uint64_t v13 = (void *)v9[7];
          if (v13) {
            free(v13);
          }
          int v14 = (void *)v9[1];
          free(v9);
          __int128 v9 = v14;
        }

        while (v14);
      }

      free(v8);
    }
  }

  return v3;
}

void *sub_100013400(void *a1, int a2)
{
  if (a2 >= 1)
  {
    int v3 = a2;
    do
    {
      sub_100008328(&std::cout, (uint64_t)"\t", 1LL);
      --v3;
    }

    while (v3);
  }

  uint64_t v4 = sub_100008328(&std::cout, (uint64_t)"OSObject(", 9LL);
  if (!a1) {
    __cxa_bad_typeid();
  }
  __int128 v5 = v4;
  __int128 v6 = (const char *)(*(void *)(*(void *)(*a1 - 8LL) + 8LL) & 0x7FFFFFFFFFFFFFFFLL);
  size_t v7 = strlen(v6);
  __int128 v8 = sub_100008328(v5, (uint64_t)v6, v7);
  return sub_100008328(v8, (uint64_t)")\n", 2LL);
}

uint64_t sub_1000134B0(uint64_t *a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = *a1;
  int v7 = *(unsigned __int8 *)(*a1 + *((int *)a1 + 2));
  *a3 = 0;
  if (v7 != 60) {
    return v5;
  }
  unint64_t v8 = *((int *)a1 + 2);
  unint64_t v9 = a1[7] - 1;
  if (v9 <= v8) {
    return 0LL;
  }
  unint64_t v10 = v8 + 1;
  *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v8 + 1;
  LODWORD(v11) = *(unsigned __int8 *)(v6 + v8 + 1);
  if ((_DWORD)v11 == 33)
  {
    if (v9 > v10)
    {
      unint64_t v10 = v8 + 2;
      *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v8 + 2;
      int v13 = *(char *)(v6 + v8 + 2);
      if (v13 == 45)
      {
        if (v9 > v10)
        {
          LODWORD(sub_100008B50(v11, v10) = v8 + 3;
          *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v8 + 3;
          int v13 = *(char *)(v6 + v8 + 3);
          if (*(_BYTE *)(v6 + v8 + 3))
          {
            BOOL v14 = v13 == 45;
            goto LABEL_84;
          }

          goto LABEL_36;
        }

        int v13 = 0;
      }

      BOOL v14 = 0;
LABEL_84:
      uint64_t v5 = 0LL;
      BOOL v48 = !v14;
      if ((v13 & 0xFFFFFFDF) - 91 >= 0xFFFFFFE6) {
        BOOL v48 = 0;
      }
      if (v48 || !v13) {
        return v5;
      }
      while (1)
      {
        uint64_t v49 = (int)v10;
        unint64_t v10 = (int)v10 + 1LL;
        *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v10;
        uint64_t v5 = *(unsigned __int8 *)(v6 + v10);
        if ((_DWORD)v5 == 10) {
          break;
        }
        if (!*(_BYTE *)(v6 + v10)) {
          return v5;
        }
        if (v14)
        {
          if ((_DWORD)v5 != 45) {
            goto LABEL_100;
          }
          if (v9 <= v10)
          {
            LOBYTE(v50) = 0;
          }

          else
          {
            *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v49 + 2;
            int v50 = *(unsigned __int8 *)(v6 + v49 + 2);
            LODWORD(sub_100008B50(v11, v10) = v49 + 2;
            if (v50 == 45)
            {
              if (v9 <= v49 + 2) {
                return 0LL;
              }
              LODWORD(sub_100008B50(v11, v10) = v49 + 3;
              *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v49 + 3;
              LODWORD(v5) = *(unsigned __int8 *)(v6 + v49 + 3);
              goto LABEL_97;
            }
          }

          int v51 = (char)v50;
LABEL_109:
          uint64_t v5 = 0LL;
          if (!v51) {
            return v5;
          }
        }

        else
        {
LABEL_97:
          if ((_DWORD)v5 == 62)
          {
            int v54 = v10 + 1;
LABEL_115:
            uint64_t v16 = 4LL;
LABEL_116:
            *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v54;
            return v16;
          }

LABEL_102:
          BOOL v52 = (_DWORD)v5 == 0;
          uint64_t v5 = 0LL;
          char v53 = v52 || v14;
          if ((v53 & 1) != 0) {
            return v5;
          }
        }
      }

      ++*((_DWORD *)a1 + 3);
      if (!v14)
      {
        LODWORD(v5) = 10;
        goto LABEL_102;
      }

LABEL_100:
      int v51 = 1;
      goto LABEL_109;
    }

    int v13 = 0;
LABEL_36:
    BOOL v14 = 0;
    goto LABEL_84;
  }

  if ((_DWORD)v11 == 47)
  {
    if (v9 <= v10) {
      return 0LL;
    }
    unint64_t v15 = v8 + 2;
    *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v15;
    LOBYTE(v11) = *(_BYTE *)(v6 + v15);
    uint64_t v16 = 2LL;
    goto LABEL_25;
  }

  if ((_DWORD)v11 != 63)
  {
    uint64_t v16 = 1LL;
LABEL_25:
    uint64_t v17 = 0LL;
    while (((v11 & 0xDF) - 65) < 0x1Au
         || v11 == 45
         || (v11 - 48) <= 9u)
    {
      *(_BYTE *)(a2 + v17) = v11;
      unint64_t v18 = *((int *)a1 + 2);
      if (a1[7] - 1 <= v18)
      {
        LOBYTE(v11) = 0;
      }

      else
      {
        uint64_t v11 = *a1;
        unint64_t v19 = v18 + 1;
        *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v19;
        LOBYTE(v11) = *(_BYTE *)(v11 + v19);
      }

      uint64_t v5 = 0LL;
      if (++v17 == 31) {
        return v5;
      }
    }

    *(_BYTE *)(a2 + v17) = 0;
LABEL_38:
    if (v11 != 47)
    {
      if (v11 == 62)
      {
        LODWORD(v5_Block_object_dispose(va, 8) = *((_DWORD *)a1 + 2);
        unint64_t v59 = (int)v58;
        unint64_t v56 = a1[7] - 1;
LABEL_125:
        if (v56 > v59)
        {
          int v54 = v58 + 1;
          goto LABEL_116;
        }

        return v16;
      }

      while (1)
      {
        if (v11 != 9)
        {
          LODWORD(v20) = (char)v11;
        }

        LOBYTE(v11) = 0;
        unint64_t v21 = *((int *)a1 + 2);
        if (a1[7] - 1 > v21)
        {
          uint64_t v22 = *a1;
          unint64_t v23 = v21 + 1;
          *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v23;
          LOBYTE(v11) = *(_BYTE *)(v22 + v23);
        }
      }

      for (uint64_t i = 0LL; ; ++i)
      {
        if ((v20 & 0xFFFFFFDF) - 65 > 0x19)
        {
          int v25 = *a3;
          if ((_DWORD)v20 != 45 && (v20 - 48) > 9)
          {
            *(_BYTE *)(a4 + 32LL * v25 + i) = 0;
            while ((_DWORD)v20 == 9 || (_DWORD)v20 == 32)
            {
              unint64_t v28 = *((int *)a1 + 2);
              if (a1[7] - 1 <= v28)
              {
                char v31 = 0;
              }

              else
              {
                uint64_t v29 = *a1;
                unint64_t v30 = v28 + 1;
                *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v30;
                char v31 = *(_BYTE *)(v29 + v30);
              }

              LODWORD(v20) = v31;
            }

            if ((_DWORD)v20 != 61) {
              return 0LL;
            }
            unint64_t v32 = *((int *)a1 + 2);
            unint64_t v33 = a1[7] - 1;
            if (v33 <= v32)
            {
              char v34 = 0;
              goto LABEL_64;
            }

LABEL_67:
            uint64_t v35 = *a1;
            unint64_t v32 = (int)v32 + 1LL;
            *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v32;
            char v34 = *(_BYTE *)(v35 + v32);
LABEL_64:
            while (v34 == 9 || v34 == 32)
            {
              char v34 = 0;
            }

            if (v34 != 34) {
              return 0LL;
            }
            if (v33 <= (int)v32)
            {
              int v38 = 0;
            }

            else
            {
              uint64_t v36 = *a1;
              uint64_t v37 = (int)v32 + 1LL;
              *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v37;
              int v38 = *(unsigned __int8 *)(v36 + v37);
            }

            uint64_t v39 = 0LL;
            while (1)
            {
              uint64_t v40 = *a3;
              if (v38 == 34) {
                break;
              }
              *(_BYTE *)(a5 + 32 * v40 + v39) = v38;
              if (v39 == 30) {
                return 0LL;
              }
              unint64_t v41 = *((int *)a1 + 2);
              if (a1[7] - 1 <= v41) {
                return 0LL;
              }
              uint64_t v5 = 0LL;
              ++v39;
              uint64_t v42 = *a1;
              unint64_t v43 = v41 + 1;
              *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v43;
              int v38 = *(unsigned __int8 *)(v42 + v43);
              if (!v38) {
                return v5;
              }
            }

            LOBYTE(v11) = 0;
            *(_BYTE *)(a5 + 32 * v40 + v39) = 0;
            unint64_t v44 = *((int *)a1 + 2);
            if (a1[7] - 1 > v44)
            {
              uint64_t v45 = *a1;
              unint64_t v46 = v44 + 1;
              *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v46;
              LOBYTE(v11) = *(_BYTE *)(v45 + v46);
            }

            uint64_t v5 = 0LL;
            int v47 = (*a3)++;
            if (v47 > 30) {
              return v5;
            }
            goto LABEL_38;
          }
        }

        else
        {
          int v25 = *a3;
        }

        *(_BYTE *)(a4 + 32LL * v25 + i) = v20;
        if (i == 30) {
          return 0LL;
        }
        unint64_t v26 = *((int *)a1 + 2);
        if (a1[7] - 1 <= v26)
        {
          LOBYTE(v20) = 0;
        }

        else
        {
          uint64_t v27 = *a1;
          unint64_t v20 = v26 + 1;
          *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v20;
          LOBYTE(v20) = *(_BYTE *)(v27 + v20);
        }

        LODWORD(v20) = (char)v20;
      }
    }

    unint64_t v55 = *((int *)a1 + 2);
    unint64_t v56 = a1[7] - 1;
    if (v56 > v55)
    {
      uint64_t v57 = *a1;
      unint64_t v58 = v55 + 1;
      *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v55 + 1;
      if (*(_BYTE *)(v57 + v55 + 1) == 62)
      {
        uint64_t v16 = 3LL;
        unint64_t v59 = v58;
        goto LABEL_125;
      }
    }

    return 0LL;
  }

  if (v9 <= v10) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v12 = (int)v10;
    unint64_t v10 = (int)v10 + 1LL;
    *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v10;
    uint64_t v5 = *(unsigned __int8 *)(v6 + v10);
    if ((_DWORD)v5 == 10)
    {
      ++*((_DWORD *)a1 + 3);
      goto LABEL_15;
    }

    if ((_DWORD)v5 != 63)
    {
      if (!*(_BYTE *)(v6 + v10)) {
        return v5;
      }
      goto LABEL_15;
    }

    if (v9 <= v10) {
      return 4LL;
    }
    unint64_t v10 = v12 + 2;
    *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v12 + 2;
    if (!*(_BYTE *)(v6 + v12 + 2)) {
      return 4LL;
    }
    if (*(_BYTE *)(v6 + v12 + 2) == 62) {
      break;
    }
LABEL_15:
    uint64_t v5 = 0LL;
    if (v9 <= v10) {
      return v5;
    }
  }

  if (v9 > v10)
  {
    int v54 = v12 + 3;
    goto LABEL_115;
  }

  return 4LL;
}

_BYTE *sub_100013A40(uint64_t *a1, void *a2)
{
  uint64_t result = malloc(0x1000uLL);
  uint64_t v5 = result;
  uint64_t v6 = *((int *)a1 + 2);
  LOBYTE(v7) = *(_BYTE *)(*a1 + v6);
  unint64_t v8 = result;
  while (1)
  {
    while (1)
    {
      if (v7 == 9 || v7 == 32)
      {
        unint64_t v9 = a1[7] - 1;
        unint64_t v10 = (int)v6;
        uint64_t v11 = *a1 + 1;
        LODWORD(v6) = v6 + 1;
        while (1)
        {
          *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v6;
          LODWORD(v7) = *(unsigned __int8 *)(v11 + v10);
          if ((_DWORD)v7 != 9 && (_DWORD)v7 != 32) {
            break;
          }
          ++v10;
          LODWORD(v6) = v6 + 1;
          if (v9 <= v10) {
            goto LABEL_29;
          }
        }

        if (!*(_BYTE *)(v11 + v10)) {
          goto LABEL_29;
        }
      }

      else if (v7 == 60)
      {
        *a2 = v5 - result;
        return result;
      }

      LOBYTE(v7) = 0;
      ++*((_DWORD *)a1 + 3);
      if (a1[7] - 1 > (unint64_t)(int)v6)
      {
        uint64_t v7 = *a1;
        uint64_t v6 = (int)v6;
        goto LABEL_16;
      }
    }

    if (((char)v7 - 48) > 9)
    {
      char v12 = 16 * v7 - 112;
    }

    else
    {
      char v12 = 16 * v7;
    }

    _BYTE *v5 = v12;
    unint64_t v13 = *((int *)a1 + 2);
    if (a1[7] - 1 <= v13) {
      break;
    }
    uint64_t v14 = *a1;
    unint64_t v15 = v13 + 1;
    *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v15;
    int v16 = *(unsigned __int8 *)(v14 + v15);
    char v17 = v16 - 48;
    if ((v16 - 48) >= 0xA)
    {
      char v17 = v16 - 87;
    }

    *v5++ |= v17;
    if (v5 - v8 >= 4096)
    {
      uint64_t v18 = v5 - result;
      uint64_t result = realloc(result, v5 - result + 4096);
      uint64_t v5 = &result[v18];
      unint64_t v8 = &result[v18];
    }

    LOBYTE(v7) = 0;
    int v19 = *((_DWORD *)a1 + 2);
    LODWORD(v6) = v19;
    if (a1[7] - 1 > (unint64_t)v19)
    {
      uint64_t v6 = v19;
      uint64_t v7 = *a1;
LABEL_16:
      *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = ++v6;
      LOBYTE(v7) = *(_BYTE *)(v7 + v6);
    }
  }

LABEL_29:
  *a2 = 0LL;
  free(result);
  return 0LL;
}

void *sub_100013C14(uint64_t *a1, void *a2)
{
  uint64_t result = malloc(0x1000uLL);
  uint64_t v5 = *((int *)a1 + 2);
  int v6 = *(unsigned __int8 *)(*a1 + v5);
  *a2 = 0LL;
  if (v6 == 60)
  {
LABEL_28:
    free(result);
    return 0LL;
  }

  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  do
  {
    uint64_t v12 = v6 & 0x7F;
    switch((_DWORD)v12)
    {
      case 0xA:
        int v11 = 0;
        ++*((_DWORD *)a1 + 3);
        break;
      case 0x3D:
        ++v11;
        break;
      case 0:
        goto LABEL_28;
      default:
        int v11 = 0;
        break;
    }

    int v13 = byte_100017D0C[v12];
    if (v13 < 0)
    {
      if (a1[7] - 1 > (unint64_t)(int)v5)
      {
        uint64_t v14 = *a1;
        uint64_t v5 = (int)v5;
LABEL_12:
        *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = ++v5;
        int v6 = *(unsigned __int8 *)(v14 + v5);
        continue;
      }

      int v6 = 0;
    }

    else
    {
      ++v10;
      int v9 = v13 + (v9 << 6);
      if ((v10 & 3) == 0)
      {
        uint64_t v15 = v8 + 2LL;
        if (v7 <= (int)v15)
        {
          v7 += 4096;
          uint64_t result = realloc(result, v7);
        }

        *((_BYTE *)result + v_Block_object_dispose(va, 8) = BYTE2(v9);
        if (v11 > 1)
        {
          ++v8;
        }

        else
        {
          *((_BYTE *)result + v8 + 1) = BYTE1(v9);
          if (v11 == 1)
          {
            v8 += 2;
          }

          else
          {
            v8 += 3;
            *((_BYTE *)result + v15) = v9;
          }
        }
      }

      LODWORD(v5) = *((_DWORD *)a1 + 2);
      if (a1[7] - 1 > (unint64_t)(int)v5)
      {
        uint64_t v5 = (int)v5;
        uint64_t v14 = *a1;
        goto LABEL_12;
      }

      int v6 = 0;
    }
  }

  while (v6 != 60);
  *a2 = v8;
  if (!v8) {
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_100013DB0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  LODWORD(vsub_10000EA2C(v0 + 2) = *((_DWORD *)a1 + 2);
  int v3 = *(unsigned __int8 *)(*a1 + (int)v2);
  if (v3 != 48) {
    goto LABEL_6;
  }
  uint64_t v4 = (int)v2;
  unint64_t v5 = a1[7] - 1;
  unint64_t v2 = (int)v2 + 1LL;
  *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v4 + 1;
  int v3 = *(unsigned __int8 *)(v1 + v4 + 1);
  if (v3 != 120)
  {
LABEL_6:
    if (v3 != 45)
    {
      char v7 = v3;
LABEL_10:
      unsigned int v8 = v7;
      if ((v7 - 48) > 9)
      {
        uint64_t v9 = 0LL;
      }

      else
      {
        uint64_t v9 = 0LL;
        unint64_t v10 = a1[7] - 1;
        unint64_t v2 = (int)v2;
        do
        {
          uint64_t v9 = 10 * v9 + v8 - 48;
          if (v10 <= v2) {
            break;
          }
          *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = ++v2;
          unsigned int v8 = *(char *)(v1 + (int)v2);
        }

        while (v8 - 48 < 0xA);
      }

      if (v3 == 45) {
        return -v9;
      }
      return v9;
    }

    if (a1[7] - 1 > (unint64_t)(int)v2)
    {
      unint64_t v2 = (int)v2 + 1LL;
      *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v2;
      char v7 = *(_BYTE *)(v1 + v2);
      goto LABEL_10;
    }

    return 0LL;
  }

  if (v5 <= v2)
  {
    unsigned int v6 = 0;
  }

  else
  {
    LODWORD(vsub_10000EA2C(v0 + 2) = v4 + 2;
    *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v4 + 2;
    unsigned int v6 = *(char *)(v1 + v4 + 2);
  }

  BOOL v11 = v6 - 48 < 0xA;
  if (v6 - 48 >= 0xA && v6 - 97 > 5) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  do
  {
    if (v11) {
      uint64_t v13 = -48LL;
    }
    else {
      uint64_t v13 = -87LL;
    }
    if (v5 <= (int)v2)
    {
      char v14 = 0;
    }

    else
    {
      unint64_t v2 = (int)v2 + 1LL;
      *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v2;
      char v14 = *(_BYTE *)(v1 + v2);
    }

    uint64_t v9 = v13 + 16 * v9 + v6;
    unsigned int v6 = v14;
    BOOL v11 = (v14 - 48) < 0xA;
  }

  while ((v14 - 48) < 0xA || (v14 - 97) < 6);
  return v9;
}

_BYTE *sub_100013F28(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = *((_DWORD *)a1 + 2);
  int v3 = v2;
LABEL_2:
  unint64_t v4 = v3;
  char v5 = *(_BYTE *)(v1 + v3);
  while (v5 == 10)
  {
    ++*((_DWORD *)a1 + 3);
LABEL_8:
    char v5 = 0;
    if (a1[7] - 1 > v4)
    {
      int v3 = v4 + 1;
      *((_DWORD *)a1 + sub_10000EA2C(v0 + 2) = v4 + 1;
      goto LABEL_2;
    }
  }

  if (!v5) {
    return 0LL;
  }
  if (v5 != 60) {
    goto LABEL_8;
  }
  int v6 = v4 - v2;
  uint64_t result = malloc((int)v4 - v2 + 1);
  if (!result)
  {
    puts("AMFIUnserializeXML: can't alloc temp memory");
    return 0LL;
  }

  if (v6 < 1)
  {
    uint64_t v19 = 0LL;
LABEL_47:
    result[v19] = 0;
    return result;
  }

  uint64_t v8 = 0LL;
  LODWORD(v9) = 0;
  int v10 = v2 + 3;
  BOOL v11 = result;
  while (2)
  {
    uint64_t v12 = (int)v9;
    uint64_t v13 = (int)v9 + 1LL;
    int v14 = *(unsigned __int8 *)(v1 + v2 + (uint64_t)(int)v9);
    if (v14 != 38) {
      goto LABEL_40;
    }
    uint64_t v9 = (int)v9 + 4LL;
    uint64_t v15 = v12 + 2;
    int v16 = *(unsigned __int8 *)(v1 + v13 + v2);
    if (v16 != 103)
    {
      if (v16 == 108)
      {
        LOBYTE(v14) = 60;
        goto LABEL_41;
      }

      uint64_t v13 = v12 + 5;
      if (v16 == 113)
      {
        if (*(_BYTE *)(v1 + v2 + (uint64_t)(int)v15) != 117
          || *(_BYTE *)(v1 + v10 + (int)v12) != 111
          || *(_BYTE *)(v1 + v2 + (uint64_t)(int)v9) != 116
          || *(_BYTE *)(v1 + (int)v13 + v2) != 59)
        {
          goto LABEL_44;
        }

        LODWORD(v9) = v12 + 6;
        LOBYTE(v14) = 34;
        goto LABEL_41;
      }

      if (v16 != 97) {
        goto LABEL_44;
      }
      uint64_t v17 = v12 + 3;
      int v18 = *(unsigned __int8 *)(v1 + v2 + (uint64_t)(int)v15);
      if (v18 != 109)
      {
        if (v18 != 112
          || *(_BYTE *)(v1 + v17 + v2) != 111
          || *(_BYTE *)(v1 + v9 + v2) != 115
          || *(_BYTE *)(v1 + v13 + v2) != 59)
        {
          goto LABEL_44;
        }

        LODWORD(v9) = v12 + 6;
        LOBYTE(v14) = 39;
        goto LABEL_41;
      }

      LOBYTE(v14) = 38;
LABEL_40:
      LODWORD(v9) = v13;
LABEL_41:
      *v11++ = v14;
      v8 += (uint64_t)&_mh_execute_header;
      if ((int)v9 >= v6)
      {
        uint64_t v19 = v8 >> 32;
        goto LABEL_47;
      }

      continue;
    }

    break;
  }

  if (*(_BYTE *)(v1 + v2 + (uint64_t)(int)v15) == 116 && *(_BYTE *)(v1 + v10 + (int)v12) == 59)
  {
    LOBYTE(v14) = 62;
    goto LABEL_41;
  }

LABEL_44:
  free(result);
  return 0LL;
}

void *sub_100014190(unint64_t a1)
{
  int v2 = operator new(0x38uLL);
  *(_OWORD *)int v2 = 0u;
  v2[6] = 0LL;
  *((_OWORD *)v2 + sub_10000EA2C(v0 + 2) = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_DWORD *)v2 + sub_10000EA2C(v0 + 2) = 1;
  *int v2 = off_10001D390;
  *((_DWORD *)v2 + 1sub_10000EA2C(v0 + 2) = 1065353216;
  sub_10000891C((uint64_t)(v2 + 2), (unint64_t)(float)a1);
  return v2;
}

void *sub_1000141FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a2;
  sub_100007798(a3);
  sub_100007798(a2);
  uint64_t v8 = &v7;
  uint64_t result = sub_100014450(a1 + 16, &v7, (uint64_t)&std::piecewise_construct, &v8);
  result[3] = a3;
  return result;
}

void *sub_10001426C(void *a1)
{
  *a1 = off_10001D390;
  sub_10000A4C0((uint64_t)(a1 + 2));
  return a1;
}

void sub_1000142A0(void *a1)
{
  *a1 = off_10001D390;
  sub_10000A4C0((uint64_t)(a1 + 2));
  operator delete(a1);
}

void *sub_1000142D4(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v4 = a2;
    do
    {
      sub_100008328(&std::cout, (uint64_t)"\t", 1LL);
      --v4;
    }

    while (v4);
  }

  uint64_t result = sub_100008328(&std::cout, (uint64_t)"OSDictionary\n", 13LL);
  int v6 = *(uint64_t ***)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = (a2 + 1);
    do
    {
      uint64_t v8 = v6[3];
      (*(void (**)(uint64_t *, uint64_t))(*v6[2] + 16))(v6[2], v7);
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t *, uint64_t))(*v8 + 16))(v8, v7);
      int v6 = (uint64_t **)*v6;
    }

    while (v6);
  }

  return result;
}

uint64_t sub_10001438C(uint64_t a1)
{
  for (uint64_t i = *(uint64_t ***)(a1 + 32); i; uint64_t i = (uint64_t **)*i)
  {
    int v3 = i[3];
    sub_10000729C(i[2]);
    sub_10000729C(v3);
  }

  sub_1000143EC((void *)(a1 + 16));
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = -2;
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8LL))(a1);
}

void *sub_1000143EC(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        int v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }

      while (v2);
    }

    v1[2] = 0LL;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0LL;
    }

    v1[3] = 0LL;
  }

  return result;
}

void *sub_100014450(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = sub_1000078D0((uint64_t)&v25, *a2 + 16LL);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = v7;
      if (v7 >= v9) {
        unint64_t v11 = v7 % v9;
      }
    }

    else
    {
      unint64_t v11 = (v9 - 1) & v7;
    }

    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v11);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v7)
        {
          if (i[2] == *a2) {
            return i;
          }
        }

        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }

          else
          {
            v14 &= v9 - 1;
          }

          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  }

  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0LL;
  i[1] = v8;
  i[2] = **a4;
  i[3] = 0LL;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1LL;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_10000891C(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
      else {
        unint64_t v11 = v8;
      }
    }

    else
    {
      unint64_t v11 = (v9 - 1) & v8;
    }
  }

  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v11);
  if (v22)
  {
    *uint64_t i = *v22;
LABEL_38:
    *uint64_t v22 = i;
    goto LABEL_39;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v21 + 8 * v11) = a1 + 16;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }

    else
    {
      v23 &= v9 - 1;
    }

    uint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }

void sub_100014684(_Unwind_Exception *a1)
{
}

void *sub_100014698(unint64_t a1)
{
  int v2 = operator new(0x28uLL);
  sub_1000147C4((uint64_t)v2, a1);
  return v2;
}

void sub_1000146CC(_Unwind_Exception *a1)
{
}

void sub_1000146E0(void *a1, uint64_t a2)
{
  unint64_t v4 = a1[4];
  char v5 = (uint64_t *)a1[3];
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v7 = a1[2];
    uint64_t v8 = ((uint64_t)v5 - v7) >> 3;
    uint64_t v9 = v4 - v7;
    uint64_t v10 = v9 >> 2;
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      uint64_t v12 = (char *)sub_100008F24((uint64_t)(a1 + 4), v11);
    }
    else {
      uint64_t v12 = 0LL;
    }
    uint64_t v13 = (uint64_t *)&v12[8 * v8];
    unint64_t v14 = &v12[8 * v11];
    *uint64_t v13 = a2;
    int v6 = v13 + 1;
    float v16 = (char *)a1[2];
    float v15 = (char *)a1[3];
    if (v15 != v16)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *--uint64_t v13 = v17;
      }

      while (v15 != v16);
      float v15 = (char *)a1[2];
    }

    a1[2] = v13;
    a1[3] = v6;
    a1[4] = v14;
    if (v15) {
      operator delete(v15);
    }
  }

  else
  {
    uint64_t *v5 = a2;
    int v6 = v5 + 1;
  }

  a1[3] = v6;
}

uint64_t sub_1000147C4(uint64_t a1, unint64_t a2)
{
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = 1;
  *(void *)a1 = &off_10001D3C0;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 3sub_10000EA2C(v0 + 2) = 0LL;
  sub_100014834((void **)(a1 + 16), a2);
  return a1;
}

void sub_100014818(_Unwind_Exception *exception_object)
{
  unint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

void sub_100014834(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100008F10();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    int v6 = (char *)sub_100008F24(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8LL];
    uint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }

      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void *sub_1000148C8(void *a1)
{
  *a1 = &off_10001D3C0;
  int v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }

  return a1;
}

void sub_100014908(void *__p)
{
  *__p = &off_10001D3C0;
  int v2 = (void *)__p[2];
  if (v2)
  {
    __p[3] = v2;
    operator delete(v2);
  }

  operator delete(__p);
}

void *sub_100014948(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v4 = a2;
    do
    {
      sub_100008328(&std::cout, (uint64_t)"\t", 1LL);
      --v4;
    }

    while (v4);
  }

  uint64_t result = sub_100008328(&std::cout, (uint64_t)"OSArray\n", 8LL);
  uint64_t v7 = *(uint64_t **)(a1 + 16);
  int v6 = *(uint64_t **)(a1 + 24);
  if (v7 != v6)
  {
    uint64_t v8 = (a2 + 1);
    do
    {
      uint64_t v9 = *v7++;
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 16LL))(v9, v8);
    }

    while (v7 != v6);
  }

  return result;
}

uint64_t sub_1000149F0(uint64_t a1)
{
  int v2 = *(_DWORD ***)(a1 + 16);
  uint64_t v3 = *(_DWORD ***)(a1 + 24);
  if (v2 != v3)
  {
    do
    {
      int v4 = *v2++;
      sub_10000729C(v4);
    }

    while (v2 != v3);
    int v2 = *(_DWORD ***)(a1 + 16);
  }

  *(void *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = -2;
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8LL))(a1);
}

void *sub_100014A4C(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v3 = a2;
    do
    {
      sub_100008328(&std::cout, (uint64_t)"\t", 1LL);
      --v3;
    }

    while (v3);
  }

  int v4 = sub_100008328(&std::cout, (uint64_t)"OSNumber(", 9LL);
  int64_t v5 = (void *)std::ostream::operator<<(v4, *(void *)(a1 + 16));
  return sub_100008328(v5, (uint64_t)")\n", 2LL);
}

void sub_100014AD0(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "enableDeveloperModeDaemons";
  __int16 v4 = 1026;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: launch_enable_directory failure: %{public}d",  (uint8_t *)&v2,  0x12u);
}

void sub_100014B58(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315650;
  int v3 = "developer_mode_state_resolved";
  __int16 v4 = 1040;
  int v5 = 8;
  __int16 v6 = 2096;
  uint64_t v7 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: bad security token | %.8P",  (uint8_t *)&v2,  0x1Cu);
}

void sub_100014BF0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = a1;
  __int16 v5 = 1040;
  int v6 = 8;
  __int16 v7 = 2096;
  uint64_t v8 = a2;
  sub_1000058CC((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: bad security token { %.8P }", (uint8_t *)&v3);
}

void sub_100014C7C(os_log_s *a1)
{
  int v2 = __error();
  strerror(*v2);
  v4[0] = 136315650;
  sub_1000058AC();
  sub_1000058CC((void *)&_mh_execute_header, a1, v3, "unable to create %s: %d (%s)", (uint8_t *)v4);
  sub_1000058D8();
}

void sub_100014D0C(os_log_s *a1)
{
  int v2 = __error();
  strerror(*v2);
  v4[0] = 136315650;
  sub_1000058AC();
  sub_1000058CC((void *)&_mh_execute_header, a1, v3, "unable to stat %s: %d (%s)", (uint8_t *)v4);
  sub_1000058D8();
}

void sub_100014D9C()
{
}

void sub_100014E08()
{
}

void sub_100014E74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014EE4(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[AMFIService stageProfileForUuid:withReply:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[%s] unable to arm security boot mode: %u",  (uint8_t *)&v2,  0x12u);
  sub_1000069D4();
}

void sub_100014F68()
{
}

void sub_100014FD4()
{
}

void sub_100015040()
{
}

void sub_1000150AC()
{
}

void sub_100015118()
{
  v3[0] = 136315650;
  sub_1000069B0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "[%s] mismatch for staged UUID: %@ | %@",  (uint8_t *)v3,  0x20u);
}

void sub_1000151A0()
{
}

void sub_10001520C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001527C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000152EC()
{
}

void sub_10001536C()
{
}

void sub_1000153EC()
{
}

void sub_10001546C()
{
}

void sub_1000154EC()
{
}

void sub_10001556C()
{
}

void sub_1000155EC()
{
}

void sub_10001566C()
{
}

void sub_1000156EC()
{
}

void sub_10001576C()
{
}

void sub_1000157EC()
{
}

void sub_10001586C()
{
}

void sub_1000158EC()
{
}

void sub_10001596C()
{
}

void sub_1000159EC()
{
}

void sub_100015A6C()
{
}

void sub_100015AEC()
{
}

void sub_100015B6C()
{
}

void sub_100015BEC()
{
}

void sub_100015C6C()
{
}

void sub_100015CEC()
{
}

void sub_100015D6C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "misMigrate | %s: missing Team ID",  (uint8_t *)&v2,  0xCu);
}

void sub_100015DE0(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "misMigrate | %s: copy profile error: %u",  (uint8_t *)&v3,  0x12u);
}

void sub_100015E64()
{
}

void sub_100015ED4()
{
}

void sub_100015F44(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100009FC8( (void *)&_mh_execute_header,  v3,  v4,  "unable to read security.codesigning.config: %s",  v5,  v6,  v7,  v8,  2u);

  sub_100009FDC();
}

void sub_100015FC4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100009FC8( (void *)&_mh_execute_header,  v3,  v4,  "unable to read security.codesigning.monitor: %s",  v5,  v6,  v7,  v8,  2u);

  sub_100009FDC();
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_areEntitlementsValidated(void *a1, const char *a2, ...)
{
  return _[a1 areEntitlementsValidated];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_clean(void *a1, const char *a2, ...)
{
  return _[a1 clean];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_computedCdHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computedCdHash:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_initWithAMFIErrorCode_withURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAMFIErrorCode:withURL:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithURL_withFileOffset_withFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:withFileOffset:withFlags:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_profileAuxSig(void *a1, const char *a2, ...)
{
  return _[a1 profileAuxSig];
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return _[a1 profileData];
}

id objc_msgSend_recordWithSigningIdentifier_teamIdentifier_validationCategory_constraintType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordWithSigningIdentifier:teamIdentifier:validationCategory:constraintType:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _[a1 report];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setTrustedCodeSigningIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedCodeSigningIdentities:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_signerType(void *a1, const char *a2, ...)
{
  return _[a1 signerType];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_trustedCodeSigningIdentities(void *a1, const char *a2, ...)
{
  return _[a1 trustedCodeSigningIdentities];
}

id objc_msgSend_validateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateWithError:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_verifyBoolEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyBoolEntitlement:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}