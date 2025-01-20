LABEL_10:
      LOBYTE(v6) = 0;
      return v6;
    }

    LOBYTE(v6) = 1;
  }

  return v6;
}

LABEL_9:
  free(v9);
  LOBYTE(v12) = v11;
  return (char)v12;
}

LABEL_35:
      NSLog(@"Operation completed with result=%d", v18);
      -[Copier destroyTemporaryDirectory:error:](self, "destroyTemporaryDirectory:error:", v10, 0LL);
      goto LABEL_23;
    }

LABEL_22:
    destURL = 0LL;
  }

LABEL_23:
  [self->_callbackTarget performSelector:self->_callbackSelector withObject:destURL withObject:v24];
  if ((v7 & 0x8000000000000000LL) == 0 && (sandbox_extension_release(v7) & 0x80000000) != 0)
  {
    v19 = __error();
    NSLog(@"Could not release sandbox extension: %d", *v19);
  }

  -[NSAutoreleasePool drain](v4, "drain");
}

uint64_t sub_100003F2C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 == 3 || !*(_DWORD *)(a6 + 40))
  {
    if (a2 == 3) {
      NSLog(@"Error while copying");
    }
    return 2LL;
  }

  else if ([*(id *)(a6 + 48) isCancelled])
  {
    return 2LL;
  }

  else
  {
    return 0LL;
  }
}

Copier *sub_100004008()
{
  result = objc_alloc_init(&OBJC_CLASS___Copier);
  qword_10000C648 = (uint64_t)result;
  return result;
}

uint64_t sub_10000402C(int a1, uint64_t a2, unsigned int *a3, int *a4, _OWORD *a5)
{
  kern_return_t inserted;
  mach_port_name_t v22;
  mach_error_t v23;
  mach_error_t v24;
  mach_error_t v25;
  pid_t pidp;
  audit_token_t atoken;
  CFErrorRef error;
  audit_token_t v29;
  mach_port_t v10 = mach_task_self_;
  pidp = -1;
  sub_100004330();
  *a3 = 0;
  *a4 = 0;
  if (!a1) {
    goto LABEL_15;
  }
  __int128 v11 = a5[1];
  *(_OWORD *)v29.val = *a5;
  *(_OWORD *)&v29.val[4] = v11;
  error = 0LL;
  __int128 v12 = a5[1];
  *(_OWORD *)atoken.val = *a5;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  atoken = v29;
  v13 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &atoken);
  if (!v13)
  {
    *a4 = 13;
LABEL_15:
    sub_10000438C("pid %d does not have MDT entitlements", pidp);
    goto LABEL_16;
  }

  v14 = v13;
  CFTypeRef v15 = SecTaskCopyValueForEntitlement(v13, @"com.apple.MobileDataTransit.allow", &error);
  CFErrorRef v16 = error;
  if (error || !v15)
  {
    int v18 = 13;
    if (!v15) {
      goto LABEL_12;
    }
  }

  else
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    int v18 = 13;
    if (TypeID == CFGetTypeID(v15))
    {
      if (CFEqual(v15, kCFBooleanTrue)) {
        int v18 = 0;
      }
      else {
        int v18 = 13;
      }
    }
  }

  CFRelease(v15);
  CFErrorRef v16 = error;
LABEL_12:
  if (v16) {
    CFRelease(v16);
  }
  CFRelease(v14);
  *a4 = v18;
  if (v18) {
    goto LABEL_15;
  }
  mach_error_t v20 = mach_port_allocate(v10, 1u, a3);
  if (v20)
  {
    *a4 = 22;
    mach_error_string(v20);
    sub_10000438C("mach_port_allocate: %d (%s)");
LABEL_25:
    if (*a3)
    {
      mach_port_mod_refs(v10, *a3, 1u, -1);
      mach_port_deallocate(v10, *a3);
    }

    *a3 = 0;
    goto LABEL_16;
  }

  inserted = mach_port_insert_right(v10, *a3, *a3, 0x14u);
  v22 = *a3;
  if (inserted)
  {
    v23 = inserted;
    mach_port_mod_refs(v10, v22, 1u, -1);
    *a3 = 0;
    *a4 = 22;
    mach_error_string(v23);
    sub_10000438C("mach_port_insert_right: %d (%s)");
    goto LABEL_25;
  }

  v24 = mach_port_move_member(v10, v22, dword_10000C6F8);
  if (v24)
  {
    *a4 = 22;
    mach_error_string(v24);
    sub_10000438C("mach_port_move_member: %d (%s)");
    goto LABEL_25;
  }

  v25 = mach_port_request_notification(v10, *a3, 70, 1u, *a3, 0x15u, atoken.val);
  if (v25)
  {
    *a4 = 22;
    mach_error_string(v25);
    sub_10000438C("mach_port_request_notification: %d (%s)");
    goto LABEL_25;
  }

  if (atoken.val[0]) {
    sub_1000060E8();
  }
  +[MDTSession sessionWithServerPort:clientPort:pid:]( &OBJC_CLASS___MDTSession,  "sessionWithServerPort:clientPort:pid:",  *a3,  a2,  pidp);
  sub_1000043F8();
LABEL_16:
  sub_100004330();
  return 0LL;
}

void sub_100004330()
{
  if (qword_10000C698)
  {
    if (+[MDTSession sessionCount](&OBJC_CLASS___MDTSession, "sessionCount") <= 0)
    {
      v0 = (__CFRunLoopTimer *)qword_10000C698;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerSetNextFireDate(v0, Current + 60.0);
    }
  }

void sub_10000438C(char *a1, ...)
{
  if (dword_10000C640) {
    int v1 = 5;
  }
  else {
    int v1 = 3;
  }
  if (qword_10000C6D8) {
    asl_vlog((asl_object_t)qword_10000C6D8, 0LL, v1, a1, va);
  }
  else {
    vsyslog(v1, a1, va);
  }
}

void sub_1000043F8()
{
  if (qword_10000C688) {
    BOOL v0 = qword_10000C698 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0) {
    CFRunLoopRemoveTimer((CFRunLoopRef)qword_10000C688, (CFRunLoopTimerRef)qword_10000C698, kCFRunLoopDefaultMode);
  }
}

uint64_t sub_100004428(uint64_t a1)
{
  if (!+[MDTSession sessionCount](&OBJC_CLASS___MDTSession, "sessionCount")) {
    sub_10000446C();
  }
  sub_100004330();
  return 0LL;
}

void sub_10000446C()
{
  if (qword_10000C688) {
    BOOL v0 = qword_10000C698 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0) {
    CFRunLoopAddTimer((CFRunLoopRef)qword_10000C688, (CFRunLoopTimerRef)qword_10000C698, kCFRunLoopDefaultMode);
  }
}

uint64_t sub_10000449C(uint64_t a1)
{
  int v1 = +[MDTSession lookupSessionForPort:](&OBJC_CLASS___MDTSession, "lookupSessionForPort:", a1);
  if (v1) {
    [v1[3] cancelCopy];
  }
  sub_100004330();
  return 0LL;
}

uint64_t sub_1000044DC(uint64_t a1, const char *a2, const char *a3, uint64_t a4, int a5, _BYTE *a6, int a7)
{
  id v14 = +[MDTSession lookupSessionForPort:](&OBJC_CLASS___MDTSession, "lookupSessionForPort:", a1);
  if (!v14) {
    return 268451842LL;
  }
  id v15 = v14;
  CFErrorRef v16 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 4LL));
  v17 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a3, 4LL));
  if (a5)
  {
    int v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a4, 4LL);
    if (!a6) {
      goto LABEL_9;
    }
  }

  else
  {
    int v18 = 0LL;
    if (!a6)
    {
LABEL_9:
      mach_error_t v20 = 0LL;
      goto LABEL_10;
    }
  }

  if (!*a6) {
    goto LABEL_9;
  }
  mach_error_t v20 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a6, 4LL);
LABEL_10:
  LODWORD(v22) = a7;
  *((void *)v15 + 3) = +[Copier copierWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:]( &OBJC_CLASS___Copier,  "copierWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:",  v16,  v18,  v17,  v20,  v15,  "returnStatusWithDestURL:error:",  v22);
  id v21 = *((id *)v15 + 3);
  [*((id *)v15 + 3) startCopy];
  sub_100004330();
  return 0LL;
}

void sub_100004664(char *a1, ...)
{
  if (dword_10000C640) {
    int v1 = 5;
  }
  else {
    int v1 = 6;
  }
  if (qword_10000C6D8) {
    asl_vlog((asl_object_t)qword_10000C6D8, 0LL, v1, a1, va);
  }
  else {
    vsyslog(v1, a1, va);
  }
}

void start()
{
  mach_msg_return_t v13;
  BOOL v14;
  mach_msg_return_t v16;
  char *v17;
  uint64_t v18;
  mach_port_t sp[4];
  __int128 v20;
  uint64_t v21;
  mach_msg_type_number_t port_info_outCnt;
  sigaction v23;
  if (dword_10000C700)
  {
    BOOL v0 = asl_open(0LL, "com.apple.mdt", 2u);
    qword_10000C6D8 = (uint64_t)v0;
    if (v0)
    {
      if (dword_10000C6FC) {
        int v1 = 255;
      }
      else {
        int v1 = 127;
      }
      asl_set_filter(v0, v1);
    }

    else
    {
      fwrite("Error initializing ASL\n", 0x17uLL, 1uLL, __stderrp);
    }
  }

  else
  {
    openlog("com.apple.mdt", 9, 24);
    if (dword_10000C6FC) {
      int v2 = 255;
    }
    else {
      int v2 = 127;
    }
    setlogmask(v2);
  }

  v3 = getprogname();
  sub_100004664("%s started", v3);
  qword_10000C758 = (uint64_t)vproc_transaction_begin(0LL);
  v23.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  v23.sa_mask = 0;
  v23.sa_flags = 2;
  sigaction(1, &v23, 0LL);
  sigaction(13, &v23, 0LL);
  sigaction(14, &v23, 0LL);
  sigaction(24, &v23, 0LL);
  sigaction(25, &v23, 0LL);
  sigaction(26, &v23, 0LL);
  sigaction(27, &v23, 0LL);
  sigaction(18, &v23, 0LL);
  sigaction(21, &v23, 0LL);
  sigaction(22, &v23, 0LL);
  sigaction(30, &v23, 0LL);
  sigaction(31, &v23, 0LL);
  v23.sa_flags = 0;
  v23.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100004C00;
  sigaction(2, &v23, 0LL);
  sigaction(15, &v23, 0LL);
  v23.sa_flags = 10;
  sigaction(20, &v23, 0LL);
  if (pthread_mutexattr_init(&stru_10000C748)
    || pthread_mutexattr_settype(&stru_10000C748, 1)
    || pthread_mutex_init(&stru_10000C708, &stru_10000C748)
    || pthread_cond_init(&stru_10000C650, 0LL))
  {
    sub_10000438C("could not initialize mutex: %m", v18);
  }

  else
  {
    pthread_mutex_lock(&stru_10000C708);
    if (pthread_create(&qword_10000C680, 0LL, (void *(__cdecl *)(void *))sub_100004CC0, 0LL))
    {
      pthread_mutex_unlock(&stru_10000C708);
      sub_10000438C("could not start runloop thread: %m", v18);
    }

    else
    {
      while (!qword_10000C688)
      {
        if (pthread_cond_wait(&stru_10000C650, &stru_10000C708)) {
          __assert_rtn("main", "server.m", 694, "err == 0");
        }
      }

      pthread_mutex_unlock(&stru_10000C708);
      sp[0] = 0;
      mach_error_t v4 = bootstrap_check_in(bootstrap_port, "com.apple.mdt", sp);
      if (v4)
      {
        mach_error_string(v4);
        sub_10000438C("bootstrap_check_in: %d (%s)");
      }

      else if (sp[0])
      {
        mach_error_t inserted = mach_port_insert_right(mach_task_self_, sp[0], sp[0], 0x14u);
        if (inserted)
        {
          mach_error_string(inserted);
          sub_10000438C("mach_port_insert_right: %d (%s)");
        }
      }

      else
      {
        sub_10000438C("launchd returned a NULL Mach port");
      }

      if (sp[0])
      {
        dword_10000C690 = sp[0];
        mach_error_t v5 = mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10000C6F8);
        if (v5)
        {
          mach_error_string(v5);
          sub_10000438C("gPortSet mach_port_allocate: %d (%s)");
        }

        else
        {
          mach_error_t v6 = mach_port_move_member(mach_task_self_, dword_10000C690, dword_10000C6F8);
          if (!v6)
          {
            id v21 = 0LL;
            *(_OWORD *)sp = 0u;
            mach_error_t v20 = 0u;
            port_info_outCnt = 10;
            mach_error_t attributes = mach_port_get_attributes( mach_task_self_,  dword_10000C690,  2,  (mach_port_info_t)sp,  &port_info_outCnt);
            if (attributes)
            {
              mach_error_t v8 = attributes;
              v9 = mach_error_string(attributes);
              sub_10000438C("get status count: %d (%s)", v8, v9);
            }

            else if (!(_DWORD)v20)
            {
              sleep(5u);
            }

            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            qword_10000C698 = (uint64_t)CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + 60.0,  60.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_100004D78,  0LL);
            sub_10000446C();
            while (1)
            {
              __int128 v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
              v13 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100004E54,  0x108Cu,  dword_10000C6F8,  50331648);
              if (v13) {
                id v14 = v13 == 268451842;
              }
              else {
                id v14 = 1;
              }
              if (!v14 && v13 != 268451846)
              {
                CFErrorRef v16 = v13;
                v17 = mach_error_string(v13);
                sub_10000438C("ipc main mach_msg_server: (%d) %s", v16, v17);
              }

              -[NSAutoreleasePool drain](v12, "drain");
            }
          }

          mach_error_string(v6);
          sub_10000438C("portset mach_port_move_member: %d (%s)");
        }
      }
    }
  }

  sub_100004C48(1);
}

void sub_100004C00(int a1)
{
  if (a1 != 20)
  {
    if (a1 == 15 || a1 == 2) {
      sub_100004C48(0);
    }
    sub_100004664("got signal %d", a1);
  }

void sub_100004C48(int a1)
{
  if (dword_10000C6F8)
  {
    mach_port_move_member(mach_task_self_, dword_10000C690, 0);
    mach_port_mod_refs(mach_task_self_, dword_10000C6F8, 3u, -1);
    dword_10000C6F8 = 0;
  }

  int v2 = getprogname();
  sub_100004664("%s exiting: %d", v2, a1);
  sub_100004F78();
  exit(a1);
}

uint64_t sub_100004CC0()
{
  qword_10000C688 = (uint64_t)CFRunLoopGetCurrent();
  pthread_cond_broadcast(&stru_10000C650);
  pthread_mutex_unlock(&stru_10000C708);
  sub_10000446C();
  CFRunLoopRunResult v0 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
  if (qword_10000C688) {
    BOOL v1 = v0 == kCFRunLoopRunStopped;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    do
    {
      if (v0 == kCFRunLoopRunFinished) {
        sleep(1u);
      }
      CFRunLoopRunResult v0 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      if (qword_10000C688) {
        BOOL v2 = v0 == kCFRunLoopRunStopped;
      }
      else {
        BOOL v2 = 1;
      }
    }

    while (!v2);
  }

  return 0LL;
}

void sub_100004D78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10000C758)
  {
    vproc_transaction_end(0LL, (vproc_transaction_t)qword_10000C758);
    qword_10000C758 = 0LL;
  }

  sub_100004C48(0);
}

void sub_100004DB4(const void *a1)
{
  mach_msg_return_t v3;
  BOOL v4;
  mach_msg_return_t v6;
  char *v7;
  while (1)
  {
    BOOL v2 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    v3 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100004E54,  0x108Cu,  dword_10000C6F8,  50331648);
    if (v3) {
      mach_error_t v4 = v3 == 268451842;
    }
    else {
      mach_error_t v4 = 1;
    }
    if (!v4 && v3 != 268451846)
    {
      mach_error_t v6 = v3;
      v7 = mach_error_string(v3);
      sub_10000438C("ipc thread[%p] mach_msg_server: %d (%s)", a1, v6, v7);
    }

    -[NSAutoreleasePool drain](v2, "drain");
  }

uint64_t sub_100004E54(_DWORD *a1, uint64_t a2)
{
  pid_t pidp = -1;
  int v4 = a1[5];
  *(_DWORD *)a2 = *a1 & 0x1F;
  unsigned int v6 = a1[2];
  *(_DWORD *)(a2 + 4) = 36;
  *(void *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 20) = v4 + 100;
  int v7 = a1[5];
  if (v7 == 72 || v7 == 70)
  {
    *(_DWORD *)(a2 + 32) = -303;
    uint64_t audit_trailer = os_mach_msg_get_audit_trailer(a1);
    if (audit_trailer)
    {
      __int128 v9 = *(_OWORD *)(audit_trailer + 36);
      *(_OWORD *)atoken.val = *(_OWORD *)(audit_trailer + 20);
      *(_OWORD *)&atoken.val[4] = v9;
      audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
      if (!pidp)
      {
        sub_100004428(a1[3]);
        *(_DWORD *)a2 = 0;
        *(_DWORD *)(a2 + 8) = 0;
        *(_DWORD *)(a2 + 32) = 0;
      }
    }

    else
    {
      sub_10000438C("No Trailer");
    }
  }

  else
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return 1LL;
}

void sub_100004F78()
{
  if (!dword_10000C700) {
    closelog();
  }
  if (qword_10000C6D8)
  {
    asl_close((asl_object_t)qword_10000C6D8);
    qword_10000C6D8 = 0LL;
  }

void sub_100004FB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_10000C640) {
    int v9 = 5;
  }
  else {
    int v9 = 7;
  }
  if (qword_10000C6D8) {
    asl_vlog((asl_object_t)qword_10000C6D8, 0LL, v9, "now quitting (%d sec idle)", &a9);
  }
  else {
    vsyslog(v9, "now quitting (%d sec idle)", &a9);
  }
}

CFDictionaryRef sub_100005028(const __CFURL *a1, __CFError *a2)
{
  v20[0] = @"URL";
  v20[1] = @"Domain";
  v20[2] = @"Code";
  v20[3] = @"UserInfo";
  __int128 v18 = 0u;
  *(_OWORD *)cf = 0u;
  if (!a1)
  {
    CFIndex v4 = 0LL;
    uint64_t v3 = 1LL;
    if (!a2) {
      goto LABEL_19;
    }
LABEL_5:
    CFIndex valuePtr = CFErrorGetCode(a2);
    *((void *)&v18 + 1) = CFErrorGetDomain(a2);
    cf[0] = CFNumberCreate(0LL, kCFNumberLongType, &valuePtr);
    mach_error_t v5 = CFErrorCopyUserInfo(a2);
    if (v5)
    {
      unsigned int v6 = v5;
      uint64_t Count = CFDictionaryGetCount(v5);
      Mutable = CFDictionaryCreateMutable(0LL, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        int v9 = (const void **)CFAllocatorAllocate(0LL, 16 * Count, 0LL);
        if (v9)
        {
          mach_port_t v10 = v9;
          CFDictionaryGetKeysAndValues(v6, v9, &v9[Count]);
          if (Count >= 1)
          {
            uint64_t v11 = Count;
            __int128 v12 = v10;
            while (1)
            {
              v13 = v12[Count];
              CFTypeID v14 = CFGetTypeID(v13);
              if (v14 == CFErrorGetTypeID()) {
                break;
              }
              CFRetain(v13);
              if (v13) {
                goto LABEL_14;
              }
LABEL_15:
              ++v12;
              if (!--v11) {
                goto LABEL_16;
              }
            }

            v13 = (const void *)sub_100005028(0LL, v13);
            if (!v13) {
              goto LABEL_15;
            }
LABEL_14:
            CFDictionarySetValue(Mutable, *v12, v13);
            CFRelease(v13);
            goto LABEL_15;
          }

LABEL_16:
          CFAllocatorDeallocate(0LL, v10);
        }
      }

      CFRelease(v6);
    }

    else
    {
      Mutable = 0LL;
    }

    cf[1] = Mutable;
    v4 += 3LL;
    goto LABEL_19;
  }

  uint64_t v3 = 0LL;
  *(void *)&__int128 v18 = CFURLGetString(a1);
  CFIndex v4 = 1LL;
  if (a2) {
    goto LABEL_5;
  }
LABEL_19:
  CFDictionaryRef v15 = CFDictionaryCreate( 0LL,  (const void **)&v20[v3],  (const void **)((unint64_t)&v18 | (8 * v3)),  v4,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  return v15;
}

CFDictionaryRef sub_100005264(const __CFDictionary *result)
{
  if (result)
  {
    BOOL v1 = result;
    Value = (const __CFString *)CFDictionaryGetValue(result, @"Domain");
    uint64_t v3 = (const __CFNumber *)CFDictionaryGetValue(v1, @"Code");
    CFIndex v4 = (const __CFDictionary *)CFDictionaryGetValue(v1, @"UserInfo");
    result = 0LL;
    CFIndex valuePtr = 0LL;
    if (Value)
    {
      if (v3)
      {
        CFNumberGetValue(v3, kCFNumberLongType, &valuePtr);
        return CFErrorCreate(0LL, Value, valuePtr, v4);
      }
    }
  }

  return result;
}

CFURLRef sub_100005300(const __CFDictionary *a1)
{
  if (a1 && (Value = (const __CFString *)CFDictionaryGetValue(a1, @"URL")) != 0LL) {
    return CFURLCreateWithString(0LL, Value, 0LL);
  }
  else {
    return 0LL;
  }
}

CFTypeRef sub_100005338(void *a1, const __CFString *a2, CFIndex a3)
{
  userInfoValues = a1;
  userInfoKeys = (void *)kCFErrorDescriptionKey;
  uint64_t v3 = CFErrorCreateWithUserInfoKeysAndValues( 0LL,  a2,  a3,  (const void *const *)&userInfoKeys,  (const void *const *)&userInfoValues,  1LL);
  if (!v3) {
    return 0LL;
  }
  CFIndex v4 = v3;
  CFDictionaryRef v5 = sub_100005028(0LL, v3);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    CFTypeRef v7 = sub_1000053F8(v5);
    CFRelease(v6);
  }

  else
  {
    CFTypeRef v7 = 0LL;
  }

  CFRelease(v4);
  return v7;
}

CFTypeRef sub_1000053F8(const void *a1)
{
  CFTypeRef v1 = a1;
  if (a1)
  {
    BOOL v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
    if (v2)
    {
      uint64_t v3 = v2;
      CFWriteStreamOpen(v2);
      if (CFPropertyListWrite(v1, v3, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL))
      {
        CFTypeRef v1 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
        CFWriteStreamClose(v3);
      }

      else
      {
        CFTypeRef v1 = 0LL;
      }

      CFRelease(v3);
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

CFDataRef sub_100005490(CFDataRef theData)
{
  CFTypeRef v1 = theData;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(v1);
    CFIndex v4 = CFReadStreamCreateWithBytesNoCopy(0LL, BytePtr, Length, kCFAllocatorNull);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFReadStreamOpen(v4);
      CFIndex v6 = CFDataGetLength(v1);
      CFTypeRef v1 = (const __CFData *)CFPropertyListCreateWithStream(0LL, v5, v6, 0LL, &format, 0LL);
      CFReadStreamClose(v5);
      CFRelease(v5);
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

void sub_1000055C8(_Unwind_Exception *a1)
{
}

void sub_100005668(_Unwind_Exception *a1)
{
}

void sub_1000056F0(_Unwind_Exception *a1)
{
}

CFErrorRef sub_1000059F4(CFErrorRef result)
{
  if (result)
  {
    CFErrorRef v1 = result;
    id v2 = -[__CFError userInfo](result, "userInfo");
    if (v2)
    {
      uint64_t v3 = v2;
      CFIndex v4 = +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v2 count]);
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v3);
            }
            uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
            id v10 = [v3 valueForKey:v9];
            uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSError);
            if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
              id v10 = (id)sub_1000059F4(v10);
            }
            else {
              id v12 = v10;
            }
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v9);
          }

          id v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }

        while (v6);
      }
    }

    else
    {
      CFIndex v4 = 0LL;
    }

    return CFErrorCreate( 0LL,  (CFErrorDomain)-[__CFError domain](v1, "domain"),  (CFIndex)-[__CFError code](v1, "code"),  (CFDictionaryRef)v4);
  }

  return result;
}

uint64_t sub_100005B90(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v6 = a3;
  int v7 = 16777472;
  int v8 = a4;
  NDR_record_t v9 = NDR_record;
  int v10 = a2;
  int v11 = a4;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100007E80;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x3Cu, 0, 0, 0, 0);
}

uint64_t sub_100005C18(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_100005C58(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_9;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }

  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }

  CFIndex v4 = (unsigned int *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000LL;
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 28);
  __int128 v7 = *(_OWORD *)(result + 76);
  v8[0] = *(_OWORD *)(result + 60);
  v8[1] = v7;
  result = sub_10000402C(v5, v6, v4, (int *)(a2 + 48), v8);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100005D58(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }

  else
  {
    result = (_DWORD *)sub_100004428(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100005DB0(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_46;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v6 = *((_DWORD *)result + 9);
  if (v6 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  NDR_record_t v9 = (char *)&result[v7];
  unsigned int v10 = *((_DWORD *)v9 + 11);
  if (v10 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v11 = v4 - v7;
  unsigned int v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 72 < v10 || v11 < v12 + 72) {
    goto LABEL_46;
  }
  __int128 v14 = v9 - 1024;
  uint64_t v15 = (uint64_t)&v9[v12 - 1024];
  unsigned int v16 = *(_DWORD *)(v15 + 1076);
  if (v16 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v17 = v11 - v12;
  unsigned int v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 72 < v16 || v17 < v18 + 72) {
    goto LABEL_46;
  }
  uint64_t v20 = v15 - 1024;
  uint64_t v21 = v15 - 1024 + v18;
  unsigned int v22 = *(_DWORD *)(v21 + 2112);
  if (v22 > 0x400) {
    goto LABEL_46;
  }
  unsigned int v23 = (v22 + 3) & 0xFFFFFFFC;
  unsigned int v24 = v17 - v18;
  if (v24 - 72 < v22 || v24 != v23 + 72) {
    goto LABEL_46;
  }
  uint64_t v26 = 1064LL;
  result = (const char *)memchr(result + 40, 0, v26 - 40);
  if (!result) {
    goto LABEL_46;
  }
  v27 = &v3[v4];
  v28 = v14 + 1072;
  size_t v29 = v27 - (v14 + 1072) >= 1024 ? 1024LL : v27 - (v14 + 1072);
  result = (const char *)memchr(v14 + 1072, 0, v29);
  if (!result) {
    goto LABEL_46;
  }
  uint64_t v30 = v20 + 2104;
  size_t v31 = (uint64_t)&v27[-v20 - 2104] >= 1024 ? 1024 : (size_t)&v27[-v20 - 2104];
  result = (const char *)memchr((const void *)(v20 + 2104), 0, v31);
  if (result
    && ((uint64_t v32 = v21 - 1024, v33 = (_BYTE *)(v21 + 2116), v27 - v33 >= 1024) ? (v34 = 1024LL) : (v34 = v27 - v33),
        (result = (const char *)memchr(v33, 0, v34)) != 0LL))
  {
    result = (const char *)sub_1000044DC( *((unsigned int *)v3 + 3),  v3 + 40,  v28,  v30,  *(_DWORD *)(v32 + 3128),  v33,  *(_DWORD *)(v32 + v23 + 3140));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  else
  {
LABEL_46:
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  return result;
}

_DWORD *sub_100005FAC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    result = (_DWORD *)sub_10000449C(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_100006004(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 954437181) >= 0xFFFFFFFC
    && (int v5 = (void (*)(void))*(&off_1000084D8 + 5 * (v4 - 954437177) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_100006098()
{
  __assert_rtn("-[Copier isCandidateFileName:forSourceFileName:]", "copier.m", 329, "NULL != path");
}

void sub_1000060C0()
{
  __assert_rtn("-[Copier isCandidateFileName:forSourceFileName:]", "copier.m", 330, "NULL != sourceFilename");
}

void sub_1000060E8()
{
  __assert_rtn("_server_create_session", "server.m", 187, "oldport == MACH_PORT_NULL");
}

id objc_msgSend_copierWithSourceURL_uniqueIdentifier_destURL_sandboxExtension_callbackTarget_selector_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copierWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:");
}

id objc_msgSend_initWithSourceURL_uniqueIdentifier_destURL_sandboxExtension_callbackTarget_selector_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}